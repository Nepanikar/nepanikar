"""Verify the shipped Week 5 Dart copy is verbatim `docs/hpo/source/tyzden-7.md`.

Run from the repository root:
    python .claude/design/week7/verify_dart_verbatim.py

The mockup checker (`verify_verbatim.py`) proves the *design* quotes the author
correctly. This one proves the *app* does — a string can be retyped correctly in
a mockup and still drift when it is written into Dart, and that is the copy
users actually read.

Every string literal in the week-7 content files is concatenated (Dart's
adjacent-string wrapping means one sentence is often four literals) and then
checked against the source. Strings we wrote ourselves — field labels, button
text, recap items, the drafts marked `// TODO: schválit autorem` — are listed in
OURS and asserted to be absent from the source instead.
"""

import glob
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", ".."))
SRC = os.path.join(ROOT, "docs", "hpo", "source", "tyzden-7.md")
WEEK7 = os.path.join(ROOT, "lib", "screens", "bpd_programme", "weeks", "week7", "*", "*.dart")

# Same threshold as the mockup checker: below this a literal is an id, a label
# or a fragment of our own prose, not a sentence the author wrote.
MIN_CONTENT_LEN = 40

# Ours, and long enough to trip the check. Each must be ABSENT from the source.
OURS = {
    # One-line menu summaries for the recap days. The source names the skills
    # but never describes them in a sentence, so these are ours (OQ-4).
    "Ověříš, jestli emoce odpovídá tomu, co se opravdu stalo",
    "Uděláš opak toho, co emoce velí, když ti nepomáhá",
    "Rychlé tělesné strategie, když je emoce na maximu",
    "Od spouštěče přes impulz až k důsledkům, krok za krokem",
    "Jak požádat nebo odmítnout tak, aby tě druhý slyšel",
    "Laskavost, zájem a validace i ve chvíli rozrušení",
    "Chránit hranice bez omluv — a zůstat férový/á",
    # Next-day teasers.
    "Vybereš si cvičení, které ti během programu nejvíc sedlo, a zopakuješ si ho.",
    "Co ti z práce s emocemi fungovalo nejlíp — a co si chceš zopakovat.",
    "STOP, TIPS a UZNÁVÁM — co z toho si chceš připomenout.",
    "Řetězová analýza a STOP — co ti pomohlo zastavit impulz.",
    "PSANÍČKo, Je VýZVa a neZOUFej — poslední ohlédnutí.",
    "Poslední den programu. Vybereš si tři dovednosti do života.",
    # Field hints: the author asks three questions in prose, the hint condenses
    # them so one box can answer all three.
    "Co to je, proč je to pro tebe důležité a jak ti to pomáhá?",
    "Která dovednost a jak ji zapojíš do běžného dne?",
    "Co si odnášíš, co tě nejvíce posunulo a čeho si na sobě nejvíce ceníš?",
    # Empty state for the SMART review (OQ-5) and the rescue-package note (OQ-3).
    "Vypadá to, že sis v prvním týdnu SMART cíl nezapsal/a — a to je v pořádku. "
    "Můžeš si ho stanovit i teď, na konci programu; poslouží ti stejně dobře.",
    "Tvoje tři dovednosti se uloží do záchranného balíčku, kde je najdeš i po "
    "skončení programu.",
}


def norm(text):
    # Drop markdown emphasis: the source bolds the lead-in of each list item
    # ("**Spou\u0161t\u011b\u010de** \u2013 co spustilo\u2026") and Dart ships the words, not the stars.
    text = text.replace("**", "").replace("\u00a0", " ")
    return re.sub(r"\s+", " ", text).strip()


src = norm(io.open(SRC, encoding="utf-8").read())

# Single-quoted Dart literals, escaped quotes included. Week 5's copy never uses
# double-quoted strings (the repo lints against them).
LITERAL = re.compile(r"'((?:[^'\\\n]|\\.)*)'")

# Adjacent literals separated only by whitespace are one string in Dart.
ADJACENT = re.compile(r"'\s*'")

checked = ours_seen = skipped = 0
failures = []

for path in sorted(glob.glob(WEEK7)):
    label = os.path.basename(path)
    if label.endswith(".g.dart"):
        continue
    source_text = io.open(path, encoding="utf-8").read()
    # Import URIs are string literals too, and none of them is copy.
    source_text = re.sub(r"^\s*(import|export|part)[^\n]*$", "", source_text, flags=re.M)
    # Drop comments: they quote the source on purpose and are not shipped copy.
    source_text = re.sub(r"//[^\n]*", "", source_text)
    source_text = re.sub(r"/\*.*?\*/", "", source_text, flags=re.S)
    # Join adjacent literals so a wrapped sentence is compared as one string.
    joined = ADJACENT.sub("", source_text)

    for raw in LITERAL.findall(joined):
        literal = norm(raw.replace("\\'", "'"))
        if literal in OURS:
            ours_seen += 1
            if literal in src:
                failures.append((label, "OURS but present in source", literal))
            continue
        if "${" in literal:
            skipped += 1  # a Dart interpolation is a template, not copy
            continue
        if len(literal) < MIN_CONTENT_LEN:
            skipped += 1
            continue
        checked += 1
        if literal not in src:
            failures.append((label, "NOT verbatim", literal))

print("source:  %s" % SRC)
print("checked: %d shipped strings, %d ours, %d short (ids, labels)"
      % (checked, ours_seen, skipped))

if failures:
    print("\nFAILURES (%d):" % len(failures))
    for label, why, literal in failures:
        print("  [%s] %s:\n      %s" % (label, why, literal[:220]))
    sys.exit(1)

print("OK - every shipped sentence matches the source character for character.")

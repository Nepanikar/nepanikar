"""Verify the shipped Week 5 Dart copy is verbatim `docs/hpo/source/tyzden-6.md`.

Run from the repository root:
    python .claude/design/week6/verify_dart_verbatim.py

The mockup checker (`verify_verbatim.py`) proves the *design* quotes the author
correctly. This one proves the *app* does — a string can be retyped correctly in
a mockup and still drift when it is written into Dart, and that is the copy
users actually read.

Every string literal in the week-6 content files is concatenated (Dart's
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
SRC = os.path.join(ROOT, "docs", "hpo", "source", "tyzden-6.md")
WEEK6 = os.path.join(ROOT, "lib", "screens", "bpd_programme", "weeks", "week6", "*", "*.dart")

# Same threshold as the mockup checker: below this a literal is an id, a label
# or a fragment of our own prose, not a sentence the author wrote.
MIN_CONTENT_LEN = 40

# Ours, and long enough to trip the check. Each must be ABSENT from the source.
OURS = {
    # Field labels and page furniture we wrote (the source gives instructions,
    # not labels) — WEEK6_SCREEN_PLAN.md → OQ-2/OQ-4/OQ-6.
    "Zkus se zamyslet — odpovědi zůstanou uložené, můžeš se k nim vrátit.",
    "Je VýZVa a všímavost ve vztazích",
    "neZOUFej – chráním své hranice",
    # Next-day teasers.
    "PSANÍČKo — postup, jak říct co potřebuješ tak, aby to druhý slyšel.",
    "Jak zůstat laskavý/á a pozorný/á i ve chvíli, kdy jsi rozrušený/á.",
    "Zítra si dopřej volno a nech všechno, co se ti povedlo, trochu doznít.",
    # Day 7 recap items (OQ-6).
    "Dvacet čtyři přesvědčení, která brání říct si o svoje.",
    "Jak požádat nebo odmítnout tak, aby tě druhý slyšel.",
    "Laskavost, zájem a validace i ve chvíli rozrušení.",
    "Vnímat sebe i druhé dřív, než zareaguje impulz.",
    "Chránit hranice bez omluv — a zůstat férový/á.",
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

for path in sorted(glob.glob(WEEK6)):
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

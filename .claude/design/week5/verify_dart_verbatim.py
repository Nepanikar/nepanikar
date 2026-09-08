"""Verify the shipped Week 5 Dart copy is verbatim `docs/hpo/source/tyzden-5.md`.

Run from the repository root:
    python .claude/design/week5/verify_dart_verbatim.py

The mockup checker (`verify_verbatim.py`) proves the *design* quotes the author
correctly. This one proves the *app* does — a string can be retyped correctly in
a mockup and still drift when it is written into Dart, and that is the copy
users actually read.

Every string literal in the week-5 content files is concatenated (Dart's
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
SRC = os.path.join(ROOT, "docs", "hpo", "source", "tyzden-5.md")
WEEK5 = os.path.join(ROOT, "lib", "screens", "bpd_programme", "weeks", "week5", "*", "*.dart")

# Same threshold as the mockup checker: below this a literal is an id, a label
# or a fragment of our own prose, not a sentence the author wrote.
MIN_CONTENT_LEN = 40

# Ours, and long enough to trip the check. Each must be ABSENT from the source.
OURS = {
    # Day 4 field labels. The source writes instructions in the imperative
    # ("Napište si situace…"), which are the *hints*; the labels above them are
    # ours (OQ-6). Her instructions themselves are checked as authored copy.
    "Tělesné signály, kterých si u sebe všímám",
    "Co dám do krabičky první psychické pomoci",
    "Co udělám, když vím, že mě čeká těžký den",
    # Day 4 intro draft (OQ-6).
    "Dnes si připravíš vlastní plán pro chvíle, kdy přijde silný impulz. "
    "Nemusíš vyplnit všechno najednou – vrátit se k němu můžeš kdykoliv.",
    # Day 2 skip flow (OQ-1).
    "Dnešek jsme přeskočili. Zítra pokračujeme.",
    # Day 1 next-day teaser (OQ-12).
    "Zítřek je o život ohrožujícím chování. Je dobrovolný a můžeš ho kdykoliv "
    "přeskočit.",
    # Other next-day teasers and page furniture.
    "Po dnešku je únava přirozená. Zítra si dáme od programu volno.",
    "Jak všímavost pomáhá zastavit se dřív, než impulz převezme řízení. Na "
    "konci si techniku vylosuješ.",
    "Zítra je den odpočinku. I pauza je součástí cesty vpřed.",
    "Seznam se uloží do záchranného balíčku, kde ho najdeš i bez programu.",
    "Techniky i bezpečnostní plán najdeš v záchranném balíčku.",
    "Zkus se zamyslet — odpovědi zůstanou uložené, můžeš se k nim vrátit.",
    # Day 7 recap items (OQ-10).
    "Kdy je užitečná, kdy škodí — a proč to není slabá vůle.",
    "Od spouštěče přes impulz až k důsledkům, krok za krokem.",
    "Chvíle mezi impulsem a reakcí — a co udělat místo toho.",
    "Vlastní bezpečnostní plán pro chvíle, kdy přijde nutkání.",
    "Zastavit se dřív, než emoce převezme řízení.",
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

for path in sorted(glob.glob(WEEK5)):
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

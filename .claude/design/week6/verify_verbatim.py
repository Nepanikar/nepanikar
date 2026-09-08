"""Verify every quoted sentence in the week-6 plan/mockups is verbatim source.

Run from the repository root:  python .claude/design/week6/verify_verbatim.py
Exit code 0 = every quoted string matches docs/hpo/source/tyzden-6.md exactly.

Unlike the week-4 script (which listed sentences by hand), this one *extracts*
every „…" quotation from the plan and mockups and checks it, so a sentence
cannot be silently reworded by forgetting to add it to a list.

Quotations that are deliberately ours — UI labels, our own wording — go into
OURS below and are asserted to be absent from the source instead.
"""

import glob
import html
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")  # Czech diacritics vs the cp1252 console

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", ".."))
SRC = os.path.join(ROOT, "docs", "hpo", "source", "tyzden-6.md")
PLAN = os.path.join(ROOT, ".claude", "design", "week6", "WEEK6_SCREEN_PLAN.md")
MOCKUPS = os.path.join(ROOT, ".claude", "design", "week6", "mockups", "*.html")

# A quotation counts as a *content* quotation — one that claims to be the
# author's copy — when it is at least this long and is not explicitly elided.
# Below the threshold the plan is quoting a phrase inside its own commentary
# ("STOP", "kolo štěstí", "včerejší den"), which is discussion, not copy.
MIN_CONTENT_LEN = 40
ELLIPSIS = "…"

# Long strings that read like copy but are ours — UI labels and our own wording.
# They must NOT appear in the source: if one does, the author already wrote it
# and we should be quoting her instead of inventing it.
OURS = {
    "má strana niečo > navyše oproti minulému týždňu? — otvor widget a over parameter",
    "Je VýZVa a všímavost ve vztazích",
    "neZOUFej – chráním své hranice",
    "Vylosovat za mě",
}

# Sample answers typed into the mockups to show a filled field. Mockup-only —
# they never ship, and they must not read as something the author wrote.
DEMO = set()


def norm(text):
    """Collapse whitespace and drop markdown emphasis so wrapping never lies."""
    text = text.replace("**", "").replace("\u00a0", " ")
    return re.sub(r"\s+", " ", text).strip()


def visible_blocks(path):
    """One string per element, not one string per page.

    Splitting a mockup into sentences merges a field label with the question
    under it ("Popiš situaci/spouštěč Co se stalo…") and then nothing matches.
    Elements are the unit the copy was actually written in.
    """
    raw = io.open(path, encoding="utf-8").read()
    raw = re.sub(r"<head.*?</head>", " ", raw, flags=re.S)
    raw = re.sub(r"<style.*?</style>", " ", raw, flags=re.S)
    raw = re.sub(r"<script.*?</script>", " ", raw, flags=re.S)
    raw = re.sub(r"<!--.*?-->", " ", raw, flags=re.S)
    raw = re.sub(r"<[^>]+>", "\n", raw)
    return [html.unescape(block) for block in raw.split("\n")]


src = norm(io.open(SRC, encoding="utf-8").read())

# „…" — Czech quotes. Non-greedy, so a nested quote just shortens the match;
# the shorter span still has to be in the source, which is what we care about.
QUOTE = re.compile("\u201e(.+?)[\"\u201c\u201d]", re.S)

checked = ours_seen = skipped = 0
failures = []


def check(label, candidate):
    """Assert one string is the author's copy, ours, or too short to be either."""
    global checked, ours_seen, skipped
    candidate = norm(candidate)
    if candidate in OURS or candidate in DEMO:
        ours_seen += 1
        if candidate in src:
            failures.append((label, "OURS but present in source", candidate))
        return
    if len(candidate) < MIN_CONTENT_LEN or ELLIPSIS in candidate:
        skipped += 1
        return
    checked += 1
    if candidate not in src:
        failures.append((label, "NOT verbatim", candidate))


# The plan quotes the author with „…", so extract the quotations.
for quote in QUOTE.findall(norm(io.open(PLAN, encoding="utf-8").read())):
    check("plan", quote)

# The mockups render her copy as plain text, so there is nothing to extract:
# hold every long element to the same standard.
for path in sorted(glob.glob(MOCKUPS)):
    label = os.path.basename(path)
    if label == "index.html":  # a contents page about the mockups, not copy
        continue
    for block in visible_blocks(path):
        check(label, block)

print("source:  %s" % SRC)
print("checked: %d content quotations, %d ours/demo, %d short/elided (commentary)"
      % (checked, ours_seen, skipped))

if failures:
    print("\nFAILURES (%d):" % len(failures))
    for label, why, quote in failures:
        print("  [%s] %s:\n      %s" % (label, why, quote[:200]))
    sys.exit(1)

print("OK - every quotation matches the source character for character.")

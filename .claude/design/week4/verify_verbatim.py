"""Verify the week-4 mockups quote the source verbatim (plan-screens ZÁSADA č. 1).

Run from the repository root:  python .claude/design/week4/verify_verbatim.py
Exit code 0 = every authored sentence matches the source character for character.

For each mockup, every sentence we claim is authored copy must appear character
for character in docs/hpo/source/tyzden-4.md. Anything we wrote ourselves is
listed under OURS and must NOT be attributed to the author.
"""

import html
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")  # Czech diacritics vs the cp1252 console

SRC = "docs/hpo/source/tyzden-4.md"
MOCK = ".claude/design/week4/mockups/"

source = io.open(SRC, encoding="utf-8").read()
# Normalise whitespace so line wrapping in the markdown never causes a miss.
src_norm = re.sub(r"\s+", " ", source)


def visible_text(path):
    raw = io.open(MOCK + path, encoding="utf-8").read()
    raw = re.sub(r"<style.*?</style>", " ", raw, flags=re.S)
    raw = re.sub(r"<!--.*?-->", " ", raw, flags=re.S)
    raw = re.sub(r"<[^>]+>", " ", raw)
    return re.sub(r"\s+", " ", html.unescape(raw)).strip()


# (file, [authored sentences that must be verbatim], [our own copy])
CHECKS = [
    ("day1_page1_edukace_o_stresu.html", [
        "Stres je přirozená reakce našeho těla i mysli, která nám pomáhá zvládat náročné situace a chránit se před nebezpečím.",
        "Každý člověk stres prožívá a v menší míře může být dokonce užitečný – dodá nám energii a motivaci k výkonu.",
        "Když je ale stres příliš silný nebo trvá dlouhodobě, mění se v distres, který nám může ubírat síly, oslabovat zdraví a komplikovat vztahy.",
        "Je naprosto pochopitelné, že stres někdy působí nepříjemně a že je těžké se s ním vyrovnat – neznamená to slabost, ale lidskost.",
        "Dlouhodobé stresory, jako jsou opakující se problémy doma, ve škole, v práci nebo třeba zdravotní potíže, je potřeba řešit postupně a z dlouhodobého hlediska.",
        "V tomto týdnu se ale zaměříme hlavně na to, jak lépe zvládat akutní stresové chvíle a zvýšit svoji odolnost v okamžiku, kdy to nejvíce potřebujeme.",
    ], ["Když se stres změní v distres", "Není to slabost", "Video o stresu"]),

    ("day2_page2_kdy_pouzit.html", [
        "Jak poznáme, že se nacházíme v krizi?",
        "Cílem v tuhle chvíli není vyřešit tvůj problém, ale prostě to přečkat a neudělat nic, co nejde vzít zpátky.",
        "Tyto dovednosti není dobré používat pro běžné každodenní problémy, pro řešení všech životních problémů ani pro hledání smyslu života.",
    ], ["Když je toho moc právě teď", "Kdy je použít", "Na co naopak nejsou",
        "Intenzivní bolest nebo silné emoce", "Zůstat schopni jednat"]),

    ("day2_page3_stop.html", [
        "STOP je krátká technika, která ti pomůže nezareagovat impulzivně",
        "STOP ti pomůže získat chvíli mezi impulsem a reakcí – a v té chvíli máš šanci vybrat si jinou cestu.",
        "zastav se na chvíli -  nic nedělej, nic neříkej.",
        "udělej krok zpět, dej si čas.",
        "co se právě děje? jaké máš pocity, myšlenky, co říká okolí?",
        "rozhodni se, co ti v té situaci nejvíc pomůže – ne co chce emoce, ale co dává smysl, co je efektivní.",
    ], ["Uložit do záchranného balíčku"]),

    ("day2_page4_tips.html", [
        "Když je tělo v maximálním stresu, někdy je nejrychlejší začít právě u něj. TIPS techniky ti pomůžou rychle stáhnout intenzitu emocí:",
        "opláchni obličej studenou vodou, drž kostku ledu v dlani, použij studený obklad.",
        "udělej 30 dřepů/kliků, běž na krátký sprint, protřep tělo.",
        "zpomal dech – nádech na 4, výdech na 6–8.",
        "střídavé napínání a uvolňování svalů snižuje fyzické napětí a tím i emocionální napětí.",
    ], ["Kdy zvolit jinou techniku", "Otevřít dechové cvičení",
        "Pokud máš potíže se srdcem"]),

    ("day4_page2_losovani.html", [
        "Pojďme si teď připomenout jednu z všímavých technik z předchozích týdnů",
    ], ["Vylosovat jinou", "Skenování těla", "Pokračovat bez cvičení", "VYLOSOVÁNO"]),

    ("day5_page3_checklist_uznavam.html", [
        "Uklidit si pokoj nebo srovnat věci v šuplíku.",
        "Kreslit si, vybarvovat nebo tvořit.",
        "Skládat puzzle nebo stavebnici.",
        "Jít na krátkou, svižnou procházku.",
        "Pustit si oblíbený seriál nebo film.",
        "Napsat někomu blízkému povzbudivou zprávu.",
        "Nabídnout pomoc kamarádovi nebo někomu v rodině.",
        "Udělat pro někoho jiného jakoukoli drobnost, která odvede pozornost od vlastní bolesti.",
        "Připomenout si jinou těžkou situaci, kterou už jsi v minulosti zvládl/a.",
        "Uvědomit si, že i ostatní lidé mají své skryté boje a problémy.",
        "Srovnat aktuální moment s chvílemi, kdy ti bylo podobně nebo i hůř.",
        "Představit si, že svou emoci dáváš do krabice a na chvíli ji odkládáš stranou.",
        "Zapsat si trápící myšlenky na papír a ten fyzicky schovat nebo odložit.",
    ], ["Označ, co jsi zkusil/a"]),
]

fails = 0
for path, authored, ours in CHECKS:
    text = visible_text(path)
    print("\n=== " + path)
    for s in authored:
        needle = re.sub(r"\s+", " ", s)
        in_source = needle in src_norm
        in_mockup = needle in text
        if in_source and in_mockup:
            print("  ok   " + needle[:64])
        else:
            fails += 1
            why = []
            if not in_source:
                why.append("NOT IN SOURCE (we altered the author's words)")
            if not in_mockup:
                why.append("not rendered in mockup")
            print("  FAIL " + needle[:64] + "  <- " + "; ".join(why))
    for s in ours:
        if s not in text:
            fails += 1
            print("  FAIL our own copy missing from mockup: " + s)
        elif re.sub(r"\s+", " ", s) in src_norm:
            fails += 1
            print("  FAIL listed as ours but present in source: " + s)

print("\n" + ("ALL VERBATIM CHECKS PASSED" if fails == 0 else str(fails) + " FAILURES"))
sys.exit(1 if fails else 0)

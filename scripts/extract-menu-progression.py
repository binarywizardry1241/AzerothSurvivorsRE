#!/usr/bin/env python3
"""Extract the hash-bound 0.92 account rewards and achievement menu catalogs."""

import hashlib
import importlib.util
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
SHA256 = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"


def main():
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA256
    pe = inventory.PE(data)

    def offset(va):
        return pe.rva_offset(va - pe.image_base)

    def pair(va):
        return struct.unpack_from("<QQ", data, offset(va))

    def string(va):
        pointer, count = pair(va)
        if not pointer:
            assert count == 0
            return None
        assert 0 < count < 1000
        return data[offset(pointer):offset(pointer) + count].decode()

    perks = []
    provenance = []
    for index in range(13):
        va = 0x1468AFA88 + 120 * index
        costs, count = pair(va + 48)
        descriptions, descriptions_count = pair(va + 64)
        assert count == descriptions_count and 1 <= count <= 3
        row = dict(
            key=string(va), name=string(va + 16), icon=string(va + 32),
            costs=list(struct.unpack_from("<" + "I" * count, data, offset(costs))),
            descriptions=[string(descriptions + rank * 16) for rank in range(count)],
            achievement=string(va + 80), prerequisite=string(va + 96),
            category=data[offset(va) + 112],
        )
        assert row["category"] in (0, 1)
        perks.append(row)
        provenance.append(dict(kind="perk", key=row["key"], va=hex(va), byte_count=120,
                               sha256=hashlib.sha256(data[offset(va):offset(va) + 120]).hexdigest()))

    tabards = []
    for index in range(24):
        # The original consumer's 0xfffc3f bit mask omits the four absent IDs.
        if not (0xFFFC3F >> index) & 1:
            continue
        va = struct.unpack_from("<Q", data, offset(0x1468B26E8) + index * 8)[0]
        item_id, display_id, cost = struct.unpack_from("<III", data, offset(va) + 48)
        assert item_id == 90001 + index
        row = dict(id=item_id, name=string(va), icon=string(va + 16),
                   zone=string(va + 32), display_id=display_id, cost=cost)
        tabards.append(row)
        provenance.append(dict(kind="tabard", id=item_id, va=hex(va), byte_count=64,
                               sha256=hashlib.sha256(data[offset(va):offset(va) + 64]).hexdigest()))

    companions = []
    for index in range(12):
        va = 0x1468B16F8 + index * 96
        display_id, scale, creature_id = struct.unpack_from("<IfI", data, offset(va) + 80)
        row = dict(key=string(va), name=string(va + 16), model=string(va + 32),
                   icon=string(va + 48), achievement=string(va + 64),
                   display_id=display_id, scale=scale, creature_id=creature_id)
        companions.append(row)
        provenance.append(dict(kind="companion", key=row["key"], va=hex(va), byte_count=96,
                               sha256=hashlib.sha256(data[offset(va):offset(va) + 96]).hexdigest()))

    # These families are built by native 0x14542a930, rather than held in one
    # flat table. The constructor's four nine-entry loops and two stack tables
    # supply the order, discriminants, thresholds, icons, points and categories.
    menu = json.loads((ROOT / "crates/azeroth-survivors-re/assets/menu.json").read_text())
    english = json.loads((ROOT / "docs/analysis/evidence/0.92/embedded-english.json").read_text())
    achievements = []

    def achievement(key, name, description, icon, points, category, kind, target=1, selector=0, tokens=None):
        assert (name in english or name in {zone["name"] for zone in menu["zones"]}) and description in english
        achievements.append(dict(key=key, name=name, description=description, icon=icon,
                                 points=points, category=category, kind=kind,
                                 target=target, selector=selector, tokens=tokens or {}))

    zone_points = list(struct.unpack_from("<9I", data, offset(0x1468B0C28)))
    for index, zone in enumerate(menu["zones"]):
        tokens = dict(zone=zone["name"], boss=zone["boss"])
        achievement("zone:" + zone["key"], zone["name"],
                    "Defeat {boss} in {zone} with any class.", string(0x1468B0B10 + index * 16),
                    zone_points[index], 0, 0, selector=index, tokens=tokens)
    for index, zone in enumerate(menu["zones"]):
        achievement("zone9:" + zone["key"], "Champion of {zone}",
                    "Defeat {boss} in {zone} with all nine classes.", string(0x1468B0B10 + index * 16),
                    25, 0, 1, target=9, selector=index,
                    tokens=dict(zone=zone["name"], boss=zone["boss"]))
    for last in (False, True):
        for index, hero in enumerate(menu["classes"]):
            class_id = data[offset(0x1466D4858 + index * 144) + 140]
            achievement(("classlast:" if last else "class:") + hero["key"],
                        "{class} of the Scarab Wall" if last else "{class} Victorious",
                        "Defeat {boss} at {zone} with a {class}." if last else "Win a run with a {class}.",
                        string(0x1466D4858 + index * 144 + 96), 25 if last else 10,
                        1, 3 if last else 2, selector=class_id,
                        tokens=dict(**{"class": hero["name"]}, zone=menu["zones"][8]["name"],
                                    boss=menu["zones"][8]["boss"]))

    achievement("talents:1", "Fully Talented", "Earn all {n} talent points with one class.",
                "INV_Misc_Book_11", 25, 1, 4, tokens=dict(n="51"))
    achievement("talents:9", "Master of All", "Earn all {n} talent points with every class.",
                "INV_Misc_Book_07", 50, 1, 4, target=9, tokens=dict(n="51"))
    for name, count, points, icon in [("Collector", 25, 10, "INV_Chest_Chain"),
                                       ("Hoarder", 100, 10, "INV_Chest_Plate16"),
                                       ("Curator", 250, 25, "INV_Helmet_08")]:
        achievement(f"pieces:{count}", name, "Collect {n} pieces of gear, of any class.",
                    icon, points, 2, 5, target=count, tokens=dict(n=str(count)))
    armory = json.loads((ROOT / "crates/azeroth-survivors-re/assets/armory.json").read_text())
    achievement("pieces:all", "The Whole Armory", "Collect every piece of gear of every class.",
                "INV_Helmet_74", 50, 2, 5, target=sum(len(c["items"]) for c in armory["classes"]))
    achievement("legendaryset", "Legendary", "Collect every legendary piece of one class.",
                "INV_Sword_39", 25, 2, 6)
    for threshold, name, description, icon, points in [
        (50, "Jeweler's Eye", "See half of the codex's rings, trinkets and amulets.", "INV_Jewelry_Ring_15", 10),
        (100, "Every Bauble", "See every ring, trinket and amulet in the codex.", "INV_Jewelry_Necklace_AhnQiraj_02", 25),
    ]:
        # Consumer0x14543408c computes ceil(140*percentage/100), independent of
        # the complete ability catalog, and compares with account seen count.
        achievement(f"codex:{threshold}", name, description, icon, points, 2, 7,
                    target=(140 * threshold + 99) // 100, selector=threshold)
    for key, name, description, icon, points in [
        ("kills2500", "Slaughterhouse", "Slay 2,500 enemies in one run.", "Ability_Whirlwind", 10),
        ("kills6000", "Carnage", "Slay 6,000 enemies in one run.", "Spell_Shadow_DeathScream", 25),
        ("lairs", "Lair Breaker", "Slay four guardians before 8:00 in one run.", "Ability_Hunter_Pet_Bear", 25),
        ("endless25", "Overtime", "Survive to 25:00 in endless mode.", "INV_Misc_PocketWatch_01", 10),
        ("endless30", "Unending", "Survive to 30:00 in endless mode.", "INV_Misc_PocketWatch_02", 25),
        ("endless40", "Deathless Hour", "Survive to 40:00 in endless mode.", "Spell_Nature_TimeStop", 50),
        ("bare", "Bare Knuckles", "Win a run wearing no gear.", "INV_Shirt_White_01", 25),
        ("thrifty", "Thrifty", "Win a run without buying a cache.", "INV_Box_01", 25),
        ("odds", "Against the Odds", "Win a run with the Run Options at their full reward.", "Spell_Holy_DivineIntervention", 50),
    ]:
        achievement("feat:" + key, name, description, icon, points, 3, 9)
    for key, name, description, icon, points, statistic, target in [
        ("kills10k", "Exterminator", "Slay 10,000 enemies.", "INV_Sword_04", 10, 0, 10000),
        ("kills100k", "Scourge of Azeroth", "Slay 100,000 enemies.", "INV_Sword_39", 25, 0, 100000),
        ("kills1m", "A Million Dead", "Slay 1,000,000 enemies.", "Spell_Shadow_RaiseDead", 50, 0, 1000000),
        ("gold5k", "Pocket Change", "Collect 5,000 gold.", "INV_Misc_Coin_02", 10, 1, 5000),
        ("gold50k", "Treasure Hunter", "Collect 50,000 gold.", "INV_Misc_Coin_01", 25, 1, 50000),
        ("guardians100", "Lair Raider", "Slay 100 guardians.", "Ability_Hunter_Pet_Wolf", 10, 2, 100),
        ("guardians500", "Warden's Bane", "Slay 500 guardians.", "Ability_Hunter_Pet_Gorilla", 25, 2, 500),
        ("bosses100", "Boss Hunter", "Slay 100 bosses.", "INV_Misc_Head_Dragon_01", 10, 3, 100),
        ("caches100", "Cache Cracker", "Buy 100 caches.", "INV_Box_02", 10, 6, 100),
        ("runs10", "Regular", "Play 10 runs.", "INV_Misc_Note_01", 10, 4, 10),
        ("runs100", "Veteran", "Play 100 runs.", "INV_Misc_Book_09", 10, 4, 100),
        ("wins50", "Conqueror", "Win 50 runs.", "INV_BannerPVP_01", 25, 5, 50),
    ]:
        achievement("count:" + key, name, description, icon, points, 4, 8,
                    target=target, selector=statistic)
    assert len(achievements) == 66

    # Native1454ebd30 emits independent perk gates first, then gated tabards,
    # then companion looks. Follow-ups sharing their prerequisite's gate are
    # suppressed (e.g. Gold5k unlocks Companion once).
    for entry in achievements:
        key = entry['key']
        unlocks = []
        for perk in perks:
            parent = next((p for p in perks if p['key'] == perk['prerequisite']), None)
            if perk['achievement'] == key and (parent is None or parent['achievement'] != key):
                unlocks.append(dict(prefix='Unlocks', name=perk['name'], icon=perk['icon']))
        for tabard in tabards:
            if tabard['zone'] and tabard['zone'] == key:
                unlocks.append(dict(prefix='Reward', name=tabard['name'], icon=tabard['icon']))
        for companion in companions:
            if companion['achievement'] == key:
                unlocks.append(dict(prefix='Companion', name=companion['name'], icon=companion['icon']))
        entry['unlocks'] = unlocks

    output = ROOT / "crates/azeroth-survivors-re/assets/progression.json"
    output.write_text(json.dumps(dict(version="0.92.0", perks=perks, tabards=tabards, companions=companions,
                                     achievements=achievements),
                                 indent=2, ensure_ascii=False) + "\n")
    evidence = dict(
        target_sha256=SHA256, date="2026-10-16", target_executed=False,
        perk_table=dict(va="0x1468afa88", count=13, stride=120,
                        lookup_consumer="0x145444e70", spent_consumer="0x145430a40",
                        plan_validator="0x145430c30"),
        tabards=dict(pointer_table="0x1468b26e8", id_base=90001,
                     valid_id_mask="0xfffc3f", record_stride=64, count=len(tabards)),
        companions=dict(table="0x1468b16f8", count=12, stride=96, saved_lookup="0x145444d50"),
        achievements=dict(constructor="0x14542a930", record_stride=112, count=66,
                          progress_consumer="0x145433830", progress_jump_table="0x1468b27bc",
                          category_counts=[18, 20, 7, 9, 12], total_points=sum(a["points"] for a in achievements),
                          zone_points_table="0x1468b0c28", zone_points=zone_points,
                          families=["zone:{key}", "zone9:{key}", "class:{key}", "classlast:{key}",
                                    "talents:1/9", "pieces:25/100/250/all", "legendaryset", "codex:50/100",
                                    "feat:{key}", "count:{key}"]),
        records=provenance,
        limits=["This extractor performs static reads only.",
                "Achievement constructor, account progress and UI consumers are recorded separately.",
                "Recovered gameplay descriptions are not evidence of implemented gameplay effects."],
    )
    (ROOT / "docs/analysis/evidence/0.92/progression-definitions.json").write_text(
        json.dumps(evidence, indent=2) + "\n")
    print(f"Recovered {len(perks)} perks/companion upgrades, {len(tabards)} tabards, {len(achievements)} achievements.")


if __name__ == "__main__":
    main()

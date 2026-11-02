#!/usr/bin/env python3
"""Recover bounded historical 0.91.4 game data without running the EXE.

This is a static byte/PE helper for the REA investigation. Record field meanings
remain candidates until confirmed by native consumers. No MPQ is opened.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct


ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("executable_inventory", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=inventory.project_path, default=inventory.HISTORICAL_BINARY,
                        help="historical 0.91.4 EXE; fixed table offsets require its original hash")
    args = parser.parse_args()
    binary = args.binary
    data = binary.read_bytes()
    if hashlib.sha256(data).hexdigest() != inventory.HISTORICAL_SHA256:
        parser.error("Fixed 0.91.4 table offsets require SHA-256 " + inventory.HISTORICAL_SHA256)
    pe = inventory.PE(data)
    out = ROOT / "docs/analysis/evidence"
    out.mkdir(parents=True, exist_ok=True)

    def location(offset):
        return dict(file_offset=hex(offset), virtual_address=hex(pe.offset_va(offset)))

    def span(offset, length):
        raw = data[offset:offset + length]
        assert len(raw) == length
        return dict(**location(offset), length_bytes=length, sha256=hashlib.sha256(raw).hexdigest(), raw_hex=raw.hex())

    def u32(offset):
        return struct.unpack_from("<I", data, offset)[0]

    def f32(offset):
        return struct.unpack_from("<f", data, offset)[0]

    def pair(offset):
        pointer, length = struct.unpack_from("<QQ", data, offset)
        return pe.rva_offset(pointer - pe.image_base), length

    def text_at(offset):
        start, length = pair(offset)
        return dict(**location(start), length_bytes=length, text=data[start:start + length].decode("utf-8"))

    english_start = data.index(b'{\r\n  "game.title"')
    text = data[english_start:english_start + 250000].decode("utf-8", errors="replace")
    english, end_char = json.JSONDecoder().raw_decode(text)
    english_raw = text[:end_char].encode("utf-8")
    assert data[english_start:english_start + len(english_raw)] == english_raw
    locale_path = out / "embedded-english.json"
    locale_path.write_bytes(english_raw)
    assert len(english) == 2491

    classes = []
    for number in range(9):
        row = 0x66C8468 + number * 144
        key = text_at(row + 16)
        name = text_at(row + 32)
        ability_start, count = pair(row + 48)
        starter = text_at(row + 64)
        abilities = [text_at(ability_start + i * 16) for i in range(count)]
        assert english[f'class.{key["text"]}.name'] == name["text"]
        assert all(f'ability.{entry["text"]}.name' in english for entry in abilities)
        assert starter["text"] in [entry["text"] for entry in abilities]
        classes.append(dict(
            record=span(row, 144), key=key, name=name,
            ability_slice=dict(**location(ability_start), count=count, entry_stride_bytes=16),
            ability_keys=abilities, default_ability_key_candidate=starter,
            floats_by_record_offset={hex(at): f32(row + at) for at in (4, 8, 12, 128, 132, 136)},
            class_id_byte_candidate=data[row + 140],
            note="+128 float resembles base health; +132/+136 and first16 bytes require native semantic confirmation."))

    zones = []
    for number in range(9):
        row = 0x66C6620 + number * 184
        key, title, subtitle = (text_at(row + at) for at in (0, 16, 32))
        enemy_start, enemy_count = pair(row + 64)
        boss_start, boss_count = pair(row + 80)
        assert english[f'zone.{key["text"]}.name'] == title["text"]
        assert (enemy_count, boss_count) == (12, 5)
        enemies = []
        for i in range(enemy_count):
            enemy_row = enemy_start + i * 80
            name = text_at(enemy_row + 16)
            enemy_id = u32(enemy_row + 32)
            assert english[f'enemy.{enemy_id}'] == name["text"]
            enemies.append(dict(
                record=span(enemy_row, 80), name=name, id_at_32=enemy_id,
                u32_by_record_offset={hex(at): u32(enemy_row + at) for at in (0, 4, 32, 36, 44, 64, 76)},
                floats_by_record_offset={hex(at): f32(enemy_row + at) for at in (8, 12, 40, 48, 52, 56, 60, 68, 72)}))
        bosses = []
        for i in range(boss_count):
            boss_row = boss_start + i * 88
            name, yell = text_at(boss_row), text_at(boss_row + 32)
            boss_id = u32(boss_row + 48)
            assert english[f'boss.{boss_id}.name'] == name["text"]
            assert english[f'boss.{boss_id}.yell'] == yell["text"]
            ability_offset, ability_count = pair(boss_row + 16)
            bosses.append(dict(
                record=span(boss_row, 88), name=name, yell=yell,
                ability_slice=dict(**location(ability_offset), count=ability_count),
                u32_by_record_offset={hex(at): u32(boss_row + at) for at in (48, 52, 60, 80, 84)},
                floats_by_record_offset={hex(at): f32(boss_row + at) for at in (56, 64, 68, 72, 76)},
                hypotheses={"schedule_minutes": f32(boss_row + 64), "base_health": f32(boss_row + 68),
                            "contact_damage": f32(boss_row + 72), "movement_speed": f32(boss_row + 76),
                            "is_final": bool(u32(boss_row + 84))}))
        zones.append(dict(
            record=span(row, 184), key=key, name=title, subtitle=subtitle,
            enemy_slice=dict(**location(enemy_start), count=enemy_count, stride_bytes=80),
            boss_slice=dict(**location(boss_start), count=boss_count, stride_bytes=88),
            loading_screen=text_at(row + 96), blurb=text_at(row + 112),
            u32_by_record_offset={hex(at): u32(row + at) for at in (128, 136, 140, 164, 172)},
            floats_by_record_offset={hex(at): f32(row + at) for at in (132, 144, 148, 152, 156, 160, 168)},
            enemies=enemies, bosses=bosses))

    literal_terms = [
        b"v0.2.0-434-g097de76e", b"097de76ead35e82402e80e908a9f35e866dd61f4", b"2026-10-15release",
        b"WOW_ROGUE_SAVE", b"APPDATA", b"wenilla-roguecharacters.txt", b"characters.unreadable.",
        b"characters.legacy", b"characters.before-import", b"rogue: sealing the save failed; writing it unsealed",
        b"unlock|", b"items|", b"talent|", b"seen|", b"ach|", b"achat|", b"stat|", b"perk|",
        b"tabard|", b"pets|", b"resets|", b"hero|", b"beat|", b"pick|",
    ]
    literals = []
    for term in literal_terms:
        hits = [match.start() for match in re.finditer(re.escape(term), data)]
        assert hits, term
        literals.append(dict(text=term.decode("ascii"), occurrences=len(hits), locations=[location(at) for at in hits]))

    prefix_counts = {}
    for key in english:
        if re.match(r"^[a-z_]+\.", key):
            prefix = key.split(".")[0]
            prefix_counts[prefix] = prefix_counts.get(prefix, 0) + 1
    evidence = dict(
        schema_version=1,
        artifact=dict(path=inventory.CANONICAL_ARTIFACT_PATH, size_bytes=len(data), sha256=hashlib.sha256(data).hexdigest(), image_base=hex(pe.image_base)),
        method="Read-only standard-library PE/byte parsing supporting the REA native investigation; no target execution or MPQ reads.",
        semantic_limit="Strings, pointers, linked table membership and raw numeric fields are directly observed. Field hypotheses are not native behavior proof; no execution paths, formulas or runtime reachability are established here.",
        locale=dict(**location(english_start), length_bytes=len(english_raw), sha256=hashlib.sha256(english_raw).hexdigest(),
                    extracted_file=str(locale_path.relative_to(ROOT)), entry_count=len(english), named_prefix_counts=prefix_counts),
        class_table=dict(**location(0x66C8468), count=9, stride_bytes=144),
        zone_table=dict(**location(0x66C6620), count=9, stride_bytes=184),
        classes=classes, zones=zones, selected_literals=literals,
        save_format_span=span(0x66D14C0, 0x66D1650 - 0x66D14C0),
    )
    output = out / "embedded-game-data.json"
    output.write_text(json.dumps(evidence, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps(dict(output=str(output.relative_to(ROOT)), locale=str(locale_path.relative_to(ROOT)),
                         artifact_sha256=evidence["artifact"]["sha256"], locale_entries=len(english),
                         classes=len(classes), ability_pool_entries=sum(len(c["ability_keys"]) for c in classes),
                         zones=len(zones), enemies=sum(len(z["enemies"]) for z in zones),
                         bosses=sum(len(z["bosses"]) for z in zones)), indent=2))


if __name__ == "__main__":
    main()

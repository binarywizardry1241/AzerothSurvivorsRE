#!/usr/bin/env python3
"""Reproduce data-only update leads without historical RVAs or source changes.

Default checks the compact retained proof; --write refreshes that proof. Native
record shapes are bounded data observations, not validated effect consumers.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, file_sha256, json_text, latest_target, target_bytes

SHA = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
OUTPUT = ROOT / "docs/analysis/evidence/release-data-leads.json"


def review():
    target = latest_target()
    if (target["version"], target["sha256"]) != ("0.112.0", SHA):
        raise ValueError("This proof requires the exact installed 0.112.0 target")
    data = target_bytes(target)
    module = load_script("release_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def span(at, size):
        raw = data[at:at + size]
        if len(raw) != size or pe.offset_va(at) is None:
            raise ValueError("Unmapped/truncated data span")
        return dict(file_offset=hex(at), virtual_address=hex(pe.offset_va(at)),
                    byte_count=size, sha256=hashlib.sha256(raw).hexdigest())

    def pair(at):
        pointer, count = struct.unpack_from("<QQ", data, at)
        offset = pe.rva_offset(pointer - pe.image_base) if pointer else None
        if count and offset is None:
            raise ValueError("Unmapped native slice")
        return offset, count

    def text(at):
        offset, count = pair(at)
        if not count:
            return None
        if count > 10000:
            raise ValueError("Unexpected string length")
        return data[offset:offset + count].decode("utf-8")

    def occurrences(raw):
        at = 0
        while (at := data.find(raw, at)) >= 0:
            yield at
            at += len(raw)

    # Locate payloads from their actual syntax, then validate descriptor pointers,
    # lengths, language codes and names independently of previous table addresses.
    starts = [m.start() for m in re.finditer(rb'\{\r?\n  "game.title":', data)]
    if len(starts) != 14:
        raise ValueError("Unexpected locale payload membership")
    parsed = {}
    for at in starts:
        window = data[at:at + 1000000].decode("utf-8", errors="replace")
        catalog, end = json.JSONDecoder().raw_decode(window)
        raw = window[:end].encode("utf-8")
        if data[at:at + len(raw)] != raw or not all(isinstance(k, str) and isinstance(v, str)
                                                         for k, v in catalog.items()):
            raise ValueError("Invalid exact UTF-8 locale payload")
        parsed[at] = (catalog, len(raw))
    english_at = next(at for at, (catalog, _) in parsed.items()
                      if catalog.get("Trauma") == "Trauma" and catalog.get("Bloodlust") == "Bloodlust")
    candidates = []
    for hit in occurrences(struct.pack("<Q", pe.offset_va(english_at))):
        try:
            if text(hit - 32) == "en" and text(hit - 16) == "English":
                candidates.append(hit - 32)
        except (ValueError, UnicodeError, struct.error):
            pass
    if len(candidates) != 1:
        raise ValueError("Ambiguous locale descriptor table")
    table = candidates[0]
    locales, codes, payloads = [], set(), set()
    for index in range(14):
        row = table + index * 56
        code, name = text(row), text(row + 16)
        at, size = pair(row + 32)
        catalog = json.loads(data[at:at + size])
        if at not in parsed or catalog != parsed[at][0] or code in codes or at in payloads:
            raise ValueError("Descriptor/payload membership mismatch")
        source = ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json"
        old = json.loads(source.read_text()) if source.exists() else {}
        changed = [key for key in sorted(set(catalog) & set(old)) if catalog[key] != old[key]]
        locales.append(dict(code=code, name=name, keys=len(catalog), payload=span(at, size),
                            retained_source=source.relative_to(ROOT).as_posix(),
                            source_sha256=file_sha256(source) if source.exists() else None,
                            added_keys=len(set(catalog) - set(old)), removed_keys=len(set(old) - set(catalog)),
                            changed_values=len(changed),
                            warrior_names={key: catalog.get(key) for key in ("Trauma", "Bloodlust")}))
        codes.add(code)
        payloads.add(at)
    if payloads != set(starts):
        raise ValueError("Unowned locale payload")
    english = parsed[english_at][0]
    english_source = ROOT / "crates/azeroth-survivors-re/assets/locales/en.json"
    retained_english = json.loads(english_source.read_text())
    english_changes = {key: dict(retained=retained_english.get(key), current=english[key])
                       for key in sorted(english) if retained_english.get(key) != english[key]}

    talents_path = ROOT / "crates/azeroth-survivors-re/assets/talents.json"
    talents = json.loads(talents_path.read_text())
    retained = {t["key"]: t for c in talents["classes"] for tree in c["trees"] for t in tree["talents"]}
    talent_leads = []
    for key, expected in (("imp_heroic", "Trauma"), ("unbridled_wrath", "Bloodlust")):
        rows = []
        for key_at in occurrences(key.encode()):
            key_slice = struct.pack("<QQ", pe.offset_va(key_at), len(key))
            for hit in occurrences(key_slice):
                row = hit - 48
                if text(hit + 16) != expected:
                    continue
                effects_at, count = pair(hit + 48)
                if count != 1:
                    raise ValueError("Unexpected selected talent effect count")
                fields = dict(key=text(hit), name=text(hit + 16), icon=text(hit + 32),
                              description=text(hit + 64), row=data[row + 152],
                              column=data[row + 153], max_rank=data[row + 154])
                if fields["max_rank"] != 5 or fields["row"] not in (0, 1) or fields["column"] not in (0, 1):
                    raise ValueError("Unexpected selected talent coordinates")
                background = "WarriorArms" if key == "imp_heroic" else "WarriorFury"
                descriptors = []
                for background_at in occurrences(background.encode()):
                    for descriptor in occurrences(struct.pack("<QQ", pe.offset_va(background_at), len(background))):
                        talents_at, talents_count = pair(descriptor + 32)
                        if 10 < talents_count < 20 and talents_at <= row < talents_at + talents_count * 160 and (row - talents_at) % 160 == 0:
                            descriptors.append(span(descriptor - 16, 64))
                if len(descriptors) != 1:
                    raise ValueError("Selected talent is not in its independently located tree")
                rows.append(dict(fields=fields, tree_descriptor=descriptors[0], record=span(row, 160),
                                 record_hex=data[row:row + 160].hex(), effect=span(effects_at, 64),
                                 effect_hex=data[effects_at:effects_at + 64].hex(),
                                 retained={k: retained[key][k] for k in fields}))
        if len(rows) != 1:
            raise ValueError("Ambiguous selected talent record")
        talent_leads.extend(rows)

    ability_leads = []
    key = "demonic_empowerment"
    for key_at in occurrences(key.encode()):
        for at in occurrences(struct.pack("<QQ", pe.offset_va(key_at), len(key))):
            try:
                if text(at + 16) != "Demonic Empowerment":
                    continue
                upgrades_at, count = pair(at + 48)
                if not 0 < count < 10:
                    continue
                fields = dict(key=text(at), name=text(at + 16), icon=text(at + 32),
                              base_power=struct.unpack_from("<f", data, at + 68)[0],
                              base_cooldown=struct.unpack_from("<f", data, at + 72)[0],
                              duration=struct.unpack_from("<f", data, at + 88)[0],
                              upgrades=list(data[upgrades_at:upgrades_at + count]))
                ability_leads.append(dict(fields=fields, record=span(at, 120),
                                          record_hex=data[at:at + 120].hex()))
            except (ValueError, UnicodeError, struct.error):
                pass
    if len(ability_leads) != 1:
        raise ValueError("Ambiguous selected ability record")

    return dict(schema_version=1,
                target={k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
                generator={"path": "scripts/review-target.py", "sha256": file_sha256(__file__)},
                method="Fresh JSON/pointer-slice search and validated mapped records; no historical addresses used.",
                locale_table=span(table, 14 * 56), locales=locales,
                english_changes_against_retained_source=english_changes,
                selected_talents=talent_leads, selected_abilities=ability_leads,
                compared_source={talents_path.relative_to(ROOT).as_posix(): file_sha256(talents_path)},
                limits=["Data-only leads; no current native effect, stat enum, migration, rank/cooldown/offer or UI consumer is certified.",
                        "Locale differences compare retained source, not a retained or executed 0.110.0 EXE.",
                        "Stable talent keys alone do not validate allocation migration or live effects.",
                        "Locale catalog equality is checked separately; talent/effect catalogs require current native consumer recovery.",
                        "No compilation, game, input/rendering or original/rebuilt parity check."],
                native_semantics_recovered=False, parity_verified=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    result = review()
    serialized = json_text(result)
    if args.write:
        OUTPUT.parent.mkdir(parents=True, exist_ok=True)
        OUTPUT.write_text(serialized)
    elif OUTPUT.read_text() != serialized:
        raise ValueError("Missing/stale release-data leads")
    print(json.dumps(dict(target_sha256=SHA, locales=len(result["locales"]),
                          english_changes=len(result["english_changes_against_retained_source"]),
                          selected_talents=len(result["selected_talents"]),
                          selected_abilities=len(result["selected_abilities"]),
                          native_semantics_recovered=False)))


if __name__ == "__main__":
    main()

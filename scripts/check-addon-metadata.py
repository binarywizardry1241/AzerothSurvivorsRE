#!/usr/bin/env python3
"""Revalidate the immutable metadata and timer inputs used by addon producers.

No compilation or game/addon launch. Three generated amulets additionally run
unchanged constructor instructions up to formatting, with reserve and locale
miss seams; this is an isolated instruction check, not reconstructed execution.
"""
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
ASSETS = ROOT / "crates/azeroth-survivors-re/assets"
EVIDENCE = ROOT / "docs/analysis/evidence/0.115.0/addon-timers"


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False, allow_nan=False) + "\n"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def semantic(value):
    return digest(json.dumps(value, sort_keys=True, ensure_ascii=False).encode())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="write compact canonical result")
    parser.add_argument("--output", type=Path, help="project-local preparation result")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA and target["version"] == "0.115.0"
    data = target_bytes(target)
    pe = load_script("metadata115_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        assert 0 <= offset <= len(data) - size
        return data[offset:offset + size]

    def pair(address):
        pointer, size = struct.unpack("<QQ", raw(address, 16))
        assert size < 4096
        return raw(pointer, size).decode() if size else ""

    def span(address, size):
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    size=size, sha256=digest(raw(address, size)))

    asset_hashes = {}

    def asset(name):
        path = ASSETS / name
        asset_hashes[str(path.relative_to(ROOT))] = digest(path.read_bytes())
        return json.loads(path.read_text())

    spells = [dict(key=pair(a), name=pair(a + 16), icon=pair(a + 32),
                   spell=struct.unpack("<I", raw(a + 64, 4))[0])
              for index in range(113) for a in [0x146CC4580 + index * 120]]
    assert spells == asset("addon-spell-metadata-0.112.0.json")
    zones, bosses = [], []
    for index in range(12):
        a = 0x146CC0D08 + index * 240
        pointer, count = struct.unpack("<QQ", raw(a + 136, 16))
        assert count == 5
        zones.append(dict(key=pair(a + 8), name=pair(a + 24), subtitle=pair(a + 40),
                          map_id=struct.unpack("<I", raw(a + 192, 4))[0],
                          area_id=struct.unpack("<I", raw(a + 196, 4))[0],
                          center=list(struct.unpack("<2f", raw(a + 200, 8))),
                          difficulty_f32=struct.unpack("<f", raw(a + 224, 4))[0],
                          bosses=[dict(id=struct.unpack("<I", raw(pointer + j * 104 + 64, 4))[0],
                                       name=pair(pointer + j * 104),
                                       at_minutes_f32=struct.unpack("<f", raw(pointer + j * 104 + 80, 4))[0],
                                       final=bool(raw(pointer + j * 104 + 100, 1)[0])) for j in range(5)]))
        bosses.append(dict(zone=zones[-1]["key"], **span(pointer, count * 104)))
    assert zones == asset("addon-zones-0.105.0.json")

    fallback, talent_count, talent_digest = {}, 0, hashlib.sha256()
    for class_index in range(9):
        for tree_index in range(3):
            tree = 0x147029FC8 + class_index * 200 + tree_index * 64
            pointer, count = struct.unpack("<QQ", raw(tree + 48, 16))
            assert count in [13, 14]
            for index in range(count):
                a = pointer + index * 160
                effects, effect_count = struct.unpack("<QQ", raw(a + 96, 16))
                assert effect_count < 100
                talent_count += 1
                talent_digest.update(raw(a, 160))
                talent_digest.update(raw(effects, effect_count * 64))
                for effect_index in range(effect_count):
                    e = effects + effect_index * 64
                    tag = raw(e, 1)[0]
                    if tag in [2, 29, 33, 34]:
                        descriptor = struct.unpack("<Q", raw(e + (8 if tag == 29 else 16), 8))[0]
                        fallback.setdefault(descriptor, dict(talent=hex(a), effect=hex(e), icon=pair(a + 80)))
    assert talent_count == 355
    kinds = [raw(pointer, size).decode() for pointer, size in zip(
        struct.unpack("<9Q", raw(0x14733BE68, 72)), struct.unpack("<9Q", raw(0x14733BEB0, 72)))]
    assert kinds == ["pet", "imp", "felhunter", "voidwalker", "succubus", "felguard", "infernal", "doomguard", "pitlord"]
    descriptors = [0x14702A770, 0x14702A7C0, 0x14702A728, 0x14702A850,
                   0x14702A808, 0x14700D458, 0x14702A6E0, 0x14702A9C8,
                   0x14700D3B8, 0x14702A928, 0x14702A898, 0x14702A978, 0x14702A8E0]
    summons, summon_ranges = [], []
    for address in descriptors:
        name, explicit = pair(address), pair(address + 16)
        summons.append(dict(entry=struct.unpack("<I", raw(address + 32, 4))[0], name=name,
                            key=name.translate(str.maketrans("ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")).replace(" ", "_"),
                            kind=kinds[raw(address + 57, 1)[0]], icon=explicit or fallback.get(address, {}).get("icon", "")))
        summon_ranges.append(dict(entry=summons[-1]["entry"], **span(address, 64),
                                  fallback=None if explicit else fallback.get(address)))
    assert summons == asset("addon-summons-0.112.0.json")

    talents = asset("talents.json")
    classes = {c["key"]: [t for tree in c["trees"] for t in tree["talents"]] for c in talents["classes"]}
    replacements = {t["key"]: t for t in asset("warrior-talents-0.112.0.json")["talents"]}
    classes["warrior"] = [replacements.get(t["key"], t) for t in classes["warrior"]]
    classes["warlock"] = asset("warlock-effects-0.112.0.json")["talents"]
    effective = {(class_key, t["key"]): t for class_key, rows in classes.items() for t in rows}
    canonical_path = EVIDENCE / "talent-timer-definitions.json"
    current = json.loads(canonical_path.read_text())
    assert current["target_sha256"] == SHA
    timer_records, eligible = [], set()
    for (class_key, key), talent in effective.items():
        for effect_index, effect in enumerate(talent["effects"]):
            value = bytes.fromhex(effect.get("raw_hex", effect.get("payload")))
            tag = value[63] if value[0] == 253 else value[0]
            if tag in [0, 10, 16, 17, 19, 32, 34]:
                wait = struct.unpack_from("<f", value, 4 if tag in [10, 19, 32] else 8)[0]
                if tag in [19, 32, 34] or wait > 0:
                    eligible.add((class_key, key, effect_index, tag, wait))
    expected = {(r["class_key"], r["key"], r["effect_index"], r["tag"], r["base_wait"]) for r in current["records"]}
    assert eligible == expected and len(eligible) == 21
    for row in current["records"]:
        talent = effective[row["class_key"], row["key"]]
        effect = talent["effects"][row["effect_index"]]
        source = bytes.fromhex(effect.get("raw_hex", effect.get("payload")))
        native = raw(int(row["effect_va"], 16), 64)
        assert native.hex() == row["raw_hex"] and source[4:16] == native[4:16]
        address = int(row["record_va"], 16)
        assert [pair(address + o) for o in [48, 64, 80]] == [row["key"], row["name"], row["icon"]]
        assert talent["name"] == row["name"] and talent["icon"] == row["icon"]
        timer_records.append(dict(key=row["key"], effect_index=row["effect_index"], native_tag=row["tag"],
                                  internal_tag=source[0], marker=source[63] if source[0] == 253 else None,
                                  timer_lanes_hex=source[4:16].hex(), source_sha256=digest(source),
                                  native=span(int(row["effect_va"], 16), 64)))
    supremacy = bytes.fromhex(effective["warlock", "demonic_supremacy"]["effects"][0]["raw_hex"])
    native = raw(0x147024CF0, 64)
    assert supremacy[0] == 30 and native[0] == 36 and supremacy[4:] == native[4:] and supremacy[8] == 32

    amulets = asset("native-amulets-0.100.1.json")
    shared = [row for row in amulets["shared"] if row["key"] != "star_of_mystaria"]
    shared_ranges = []

    def normalize(native, source, read_pair):
        actual, wanted = bytearray(native), bytearray.fromhex(source["raw_hex"])
        actual[0] = {36: 30, 37: 31}.get(actual[0], actual[0])
        actual[1:4] = wanted[1:4] = bytes(3)
        for string in source["strings"]:
            offset = string["offset"]
            assert read_pair(offset) == string["value"]
            actual[offset:offset + 8] = wanted[offset:offset + 8] = bytes(8)
        assert actual == wanted
        return actual.hex()

    for index, row in enumerate(shared):
        address = 0x1470068F0 + index * 80
        assert [pair(address + o) for o in [0, 16, 32]] == [row["key"], row["name"], row["icon"]]
        assert struct.unpack("<Q", raw(address + 64, 8))[0] == row["rarity"]
        effects, count = struct.unpack("<QQ", raw(address + 48, 16))
        assert count == len(row["effects"])
        for effect_index, effect in enumerate(row["effects"]):
            at = effects + effect_index * 64
            normalize(raw(at, 64), effect, lambda offset: pair(at + offset))
        shared_ranges.append(dict(key=row["key"], descriptor=span(address, 80), effects=span(effects, count * 64)))
    assert len(shared_ranges) == 16

    # Current function identified by a unique unchanged80-byte historical lead.
    # Actual current instructions/table/data govern all3 bounded replays below.
    factory, formatting, reserve, locale = 0x14583D3E0, 0x14583E84A, 0x145D40630, 0x1458DFF90
    old_path = ROOT / "docs/analysis/evidence/0.112.0/demonic-empowerment/medallion-constructor.asm"
    prefix = b"".join(bytes.fromhex(line.split()[1]) for line in old_path.read_text().splitlines()[:23])[:80]
    assert data.count(prefix) == 1 and raw(factory, 80) == prefix
    sys.path[:0] = [str(ROOT / "runtime/armory-recovery/python-libs")]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as registers

    class Probe:
        def __init__(self):
            self.u = Uc(UC_ARCH_X86, UC_MODE_64)
            self.u.mem_map(0x20000000, 0x20000)
            self.u.mem_map(0x30000000, 0x20000)
            self.stopped, self.allocations, self.misses = False, 0, 0
            self.executed = set()
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED, self.missing)
            self.u.hook_add(UC_HOOK_CODE, self.hook)

        def missing(self, machine, access, address, size, value, _):
            page = address & ~4095
            assert pe.image_base <= page < pe.image_base + 0x10000000
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            return True

        def reg(self, name):
            return self.u.reg_read(getattr(registers, "UC_X86_REG_" + name))

        def q(self, address):
            return struct.unpack("<Q", self.u.mem_read(address, 8))[0]

        def bytes(self, address, size):
            return raw(address, size) if address >= pe.image_base else bytes(self.u.mem_read(address, size))

        def pair(self, address):
            pointer, size = struct.unpack("<QQ", self.bytes(address, 16))
            return self.bytes(pointer, size).decode()

        def hook(self, machine, address, size, _):
            if address == formatting:
                self.stopped = True
                machine.emu_stop()
                return
            if factory <= address < factory + 5804:
                self.executed.add((address, size))
                return
            if address == reserve:
                vector = self.reg("RCX")
                assert self.q(vector) == 0 and self.q(vector + 16) == 0
                machine.mem_write(vector, struct.pack("<QQQ", 256, 0x30010000, 0))
                self.allocations += 1
            elif address == locale:
                machine.reg_write(registers.UC_X86_REG_RAX, 0)
                self.misses += 1
            else:
                raise AssertionError(f"Unreviewed native call {address:#x}")
            stack = self.reg("RSP")
            machine.reg_write(registers.UC_X86_REG_RIP, self.q(stack))
            machine.reg_write(registers.UC_X86_REG_RSP, stack + 8)

        def run(self, ability):
            for register, value in [(registers.UC_X86_REG_RSP, 0x20018008),
                                    (registers.UC_X86_REG_RCX, 0x30000000),
                                    (registers.UC_X86_REG_RDX, ability)]:
                self.u.reg_write(register, value)
            self.u.emu_start(factory, 0, count=100000)
            assert self.stopped and self.allocations == self.misses == 1
            frame = self.reg("RBP")
            pointer, count = self.q(frame + 0x38), self.q(frame + 0x40)
            assert count == 3
            prefix = self.bytes(self.reg("RBX"), self.reg("RDX")).decode()
            icon = self.bytes(self.reg("RAX"), self.reg("RSI")).decode()
            return prefix, icon, pointer, count

    generated = []
    for key in ["execute", "eviscerate", "backstab"]:
        source = next(row for row in amulets["generated"] if row["ability_key"] == key)
        ability_index = next(i for i, row in enumerate(spells) if row["key"] == key)
        probe = Probe()
        prefix, icon, pointer, count = probe.run(0x146CC4580 + ability_index * 120)
        assert source["name"] == prefix + ": " + spells[ability_index]["name"] and source["icon"] == icon
        normalized = []
        for index, effect in enumerate(source["effects"]):
            at = pointer + index * 64
            normalized.append(normalize(probe.bytes(at, 64), effect, lambda offset: probe.pair(at + offset)))
        timer = probe.bytes(pointer + 64, 64)
        assert timer[0] == 10 and struct.unpack_from("<f", timer, 4)[0] == 0.5
        executed = sorted(probe.executed)
        generated.append(dict(key=source["key"], effect_count=count, timer_tag=10, base_wait=0.5,
                              semantic_sha256=semantic(normalized), prefix=prefix, icon=icon,
                              executed_instructions=len(executed),
                              executed_bytes_sha256=digest(b"".join(raw(a, size) for a, size in executed))))

    result = dict(target_sha256=SHA, source_assets=asset_hashes,
                  spells=dict(count=len(spells), native=span(0x146CC4580, 113 * 120), semantic_sha256=semantic(spells), equal=True),
                  zones=dict(count=len(zones), boss_count=60, native=span(0x146CC0D08, 12 * 240), bosses=bosses, semantic_sha256=semantic(zones), equal=True),
                  summons=dict(count=len(summons), descriptors=summon_ranges, kinds=span(0x14733BE68, 144), semantic_sha256=semantic(summons), equal=True),
                  talent_fallback=dict(count=talent_count, class_descriptors=span(0x147029FC8, 1800), ordered_record_effect_sha256=talent_digest.hexdigest()),
                  timer_talents=dict(count=len(timer_records), canonical_sha256=digest(canonical_path.read_bytes()), records=timer_records, no_extra_or_missing=True),
                  supremacy_stat32=dict(native=span(0x147024CF0, 64), internal_tag=30, native_tag=36, stat_tag=32, amount=1.0, equal=True),
                  shared_amulets=dict(count=len(shared_ranges), descriptors=shared_ranges, equal=True),
                  generated_timer_amulets=dict(factory=span(factory, 5804), boundary=hex(formatting), cases=generated,
                                               storage_seam=hex(reserve), english_locale_miss_seam=hex(locale)),
                  limits=["Immutable fields match the113spell,12zone/60boss,13summon,21timer-talent and16shared-amulet source records; historical source provenance is retained.",
                          "All355talents are traversed for ordered summon icon fallback candidates. Current icon-selection instructions and summon-key normalization are not replayed by this data check.",
                          "All3generated timer amulets execute current factory instructions only up to the common formatter. Vec reserve supplies storage and locale lookup returns a miss; final formatting, allocation, key construction and generator gameplay do not execute.",
                          "Complete normalized3generated and16shared effect rows compare owned strings and decoded payloads; enum padding and forensic string pointers are excluded. Stat36/spell37 map to internal30/31.",
                          "No compiler, game, addon, reconstructed Rust or original/rebuilt runtime or visual parity verification."])
    path = args.output or EVIDENCE / "metadata.json"
    assert path.resolve().is_relative_to(ROOT)
    if args.write:
        path.write_text(encoded(result))
    else:
        assert json.loads(path.read_text()) == result, "retained metadata proof differs"
    print("0.115.0 addon metadata:113spells/12zones/60bosses/13summons;21timer talents/16shared/3generated timer amulets match; no build/game")


if __name__ == "__main__":
    main()

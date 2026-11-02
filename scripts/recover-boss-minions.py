#!/usr/bin/env python3
"""Recover/check current boss summon records and execute bounded native gates.

No compiler or game process is invoked. Outputs stage under runtime/ for review;
--write-source updates only the existing summon records and phase catalog.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
WORK = ROOT / "runtime/boss-minions-0.108.0"
EVIDENCE = ROOT / "docs/analysis/evidence/0.108.0/boss-minions"
CATALOG = ROOT / "crates/azeroth-survivors-re/src/guardians/catalog.rs"
PHASES = ROOT / "crates/azeroth-survivors-re/src/bosses/minion_phases.rs"


def serialized(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def recover():
    target = latest_target(verify=True)
    if target["sha256"] != SHA:
        raise ValueError("This recovery is bound to the registered 0.108.0 hash")
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("boss_minion_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + size]
        assert len(value) == size
        return value

    def span(address, size):
        value = raw(address, size)
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(value).hexdigest(), hex=value.hex())

    def text(address):
        pointer, count = struct.unpack("<QQ", raw(address, 16))
        assert count < 4096
        return dict(text=raw(pointer, count).decode(), source=span(pointer, count))

    bosses, waves = [], []
    for zone_index in range(12):
        zone = 0x146BD7B90 + zone_index * 240
        key = text(zone + 8)["text"]
        pointer, count = struct.unpack("<QQ", raw(zone + 0x88, 16))
        assert count == 5
        for index in range(count):
            boss = pointer + index * 104
            boss_id = struct.unpack("<I", raw(boss + 64, 4))[0]
            moves, move_count = struct.unpack("<QQ", raw(boss + 16, 16))
            phases, phase_count = struct.unpack("<QQ", raw(boss + 48, 16))
            slots = []
            for slot in range(move_count):
                address = moves + slot * 56
                payload = raw(address, 56)
                words = struct.unpack("<14I", payload)
                if payload[45] == 5:
                    slots.append(dict(slot=slot, count=words[0], cooldown_bits=words[12],
                                      record=span(address, 56)))
            assert len(slots) == 1, (boss_id, slots)
            bosses.append(dict(zone=key, boss_index=index, boss_id=boss_id, name=text(boss),
                               record=span(boss, 104), scheduled=slots[0],
                               native_move_count=move_count, native_phase_count=phase_count))
            for phase_index in range(phase_count):
                address = phases + phase_index * 72
                payload = raw(address, 72)
                words = struct.unpack("<18I", payload)
                if payload[61] == 5:
                    waves.append(dict(boss_id=boss_id, phase_index=phase_index, count=words[4],
                                      threshold_bits=words[16], yell=text(address),
                                      record=span(address, 72)))
    assert len(bosses) == 60 and len(waves) == 9
    catalog = dict(target_version=target["version"], target_sha256=SHA,
                   target=target["path"], target_executed=False, bosses=bosses, phase_summons=waves,
                   limits=["Only native tag5 summons are connected; other encounter moves and guardian signatures remain gap42.",
                           "Boss record104, scheduled move56 (tag byte45) and phase72 (payload+16, tag byte61, threshold+64) are current layouts, not historical ABI aliases."])
    catalog["phase_locales"] = []
    decoder = json.JSONDecoder()
    offset = 0
    seen = set()
    locale_paths = list((ROOT / "crates/azeroth-survivors-re/assets/locales").glob("*.json"))
    fingerprints = {path.stem: json.loads(path.read_text()) for path in locale_paths}
    identity_keys = ["common.female", "common.male", "common.cooldown_sec", "common.list_sep", "common.yards"]
    while (offset := data.find(b'"game.title"', offset)) >= 0:
        start = data.rfind(b"{", max(0, offset - 16), offset)
        offset += 1
        assert start >= 0
        decoded_text = data[start:start + 512000].decode("utf-8", errors="replace")
        decoded, end = decoder.raw_decode(decoded_text)
        payload = decoded_text[:end].encode("utf-8")
        assert data[start:start + len(payload)] == payload
        address = pe.offset_va(start)
        names = [f"boss.{wave['boss_id']}.phase{wave['phase_index'] + 1}" for wave in waves]
        keys = {key: decoded[key] for key in names if key in decoded}
        # Unique correspondence to the existing locale suppliers using all five
        # unchanged common labels; no historical descriptor layout is assumed.
        candidates = [code for code, source in fingerprints.items()
                      if all(source[key] == decoded[key] for key in identity_keys)]
        assert len(candidates) == 1, candidates
        code = candidates[0]
        assert code not in seen
        seen.add(code)
        if code == "en":
            assert keys == {key: wave["yell"]["text"] for key, wave in zip(names, waves)}
        catalog["phase_locales"].append(dict(code=code, source={k: v for k, v in span(address, len(payload)).items() if k != "hex"}, values=keys,
                                           identity_labels={key: decoded[key] for key in identity_keys},
                                           absent=[key for key in names if key not in decoded]))
    assert len(seen) == 14 and len(catalog["phase_locales"]) == 14

    # Optional installed libraries remain project-local; this never installs them.
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def map_pe(address):
        page = address & ~4095
        if page not in mapped:
            uc.mem_map(page, 4096)
            uc.mem_write(page, raw(page, 4096))
            mapped.add(page)

    # Exact selected-target no-call fragments; the enclosing owners and caller
    # wiring are reviewed separately through REA/Ghidra and original instructions.
    intervals = [(0x145973C8F, 0x145973CAE), (0x145973830, 0x14597385A),
                 (0x145952522, 0x14595253F)]
    for start, end in intervals:
        for address in range(start & ~4095, end, 4096):
            map_pe(address)
    for address in (0x145DCD0B8, 0x145D97610):
        map_pe(address)
    actor, table = 0x70000000, 0x71000000
    uc.mem_map(actor, 4096)
    uc.mem_map(table, 4096)
    stops = {0x145973820, 0x14597385A}

    def hook(machine, address, size, unused):
        if address in stops:
            machine.emu_stop()
    uc.hook_add(UC_HOOK_CODE, hook)
    cases = {"repeat": [], "phase_gate": [], "minion_index": []}
    for boss in bosses:
        repeat = boss["scheduled"]["cooldown_bits"]
        for enraged in (False, True):
            uc.mem_write(actor + 0x50, bytes([enraged]))
            uc.reg_write(x.UC_X86_REG_R14, actor)
            uc.reg_write(x.UC_X86_REG_RAX, table)
            uc.reg_write(x.UC_X86_REG_XMM0, repeat)
            uc.reg_write(x.UC_X86_REG_MXCSR, 0x1F80)
            uc.emu_start(0x145973C8F, 0x145973CAE, count=16)
            result = struct.unpack("<I", uc.mem_read(table, 4))[0]
            value = struct.unpack("<f", struct.pack("<I", repeat))[0]
            assert result == bits(f32(value * (f32(0.7) if enraged else 1.0)))
            cases["repeat"].append(dict(boss_id=boss["boss_id"], enraged=enraged,
                                         cooldown_bits=repeat, result_bits=result))
    for wave in waves:
        threshold = wave["threshold_bits"]
        for ratio_bits in (0, threshold - 1, threshold, threshold + 1, 0x3F800000, 0x7FC00000):
            for latched in (False, True):
                mask = (1 << wave["phase_index"]) if latched else 0
                uc.mem_write(actor + 0x4C, struct.pack("<I", mask))
                uc.mem_write(table + 64, struct.pack("<I", threshold))
                for register, value in ((x.UC_X86_REG_R14, actor), (x.UC_X86_REG_R11, table),
                                        (x.UC_X86_REG_R8, 64), (x.UC_X86_REG_RDI, wave["phase_index"]),
                                        (x.UC_X86_REG_RDX, 32), (x.UC_X86_REG_R10, mask),
                                        (x.UC_X86_REG_XMM0, ratio_bits)):
                    uc.reg_write(register, value)
                uc.reg_write(x.UC_X86_REG_MXCSR, 0x1F80)
                uc.emu_start(0x145973830, 0x14597385A, count=20)
                fired = uc.reg_read(x.UC_X86_REG_RIP) == 0x14597385A
                ratio = struct.unpack("<f", struct.pack("<I", ratio_bits))[0]
                limit = struct.unpack("<f", struct.pack("<I", threshold))[0]
                assert fired == (not latched and ratio < limit)
                cases["phase_gate"].append(dict(boss_id=wave["boss_id"], phase_index=wave["phase_index"],
                                                 ratio_bits=ratio_bits, latched=latched, fired=fired))
    for index in range(33):
        uc.reg_write(x.UC_X86_REG_R12, index)
        uc.reg_write(x.UC_X86_REG_R14D, (2 - index) & 0xFFFFFFFF)
        uc.emu_start(0x145952522, 0x14595253F, count=12)
        result = uc.reg_read(x.UC_X86_REG_EDX)
        assert result == int(index % 3 == 2)
        cases["minion_index"].append(dict(index=index, enemy_index=result))
    native = dict(target_sha256=SHA, target_executed=False,
                  method="Unicorn executes bounded, no-call selected-EXE timer/phase/index instructions with synthetic state.",
                  instruction_spans=[span(a, b - a) for a, b in intervals], cases=cases,
                  limits=["No compiled source or game process ran. These gates do not validate actor creation, all encounter scheduling or presentation."])
    return catalog, native


def source_check(catalog, write):
    source = CATALOG.read_text()
    blocks = list(re.finditer(r"^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)", source, re.M | re.S))
    current = {row["boss_id"]: row["scheduled"] for row in catalog["bosses"]}
    assert len(blocks) == len(current) == 60
    for block in reversed(blocks):
        body = block[0]
        boss_id = int(re.search(r"\bid:\s*(\d+)", body)[1])
        matches = [m for m in re.finditer(r"words:\s*\[(.*?)\]", body, re.S)
                   if int(re.findall(r"0x[0-9a-f]+", m[1])[0], 16) == 2]
        assert len(matches) == 1
        match = matches[0]
        expected = [2, current[boss_id]["count"], 0, 0, 0, 0, current[boss_id]["cooldown_bits"]]
        if write:
            words = iter(expected)
            replacement = re.sub(r"0x[0-9a-f]+", lambda _: f"0x{next(words):08x}", match[1])
            body = body[:match.start(1)] + replacement + body[match.end(1):]
            source = source[:block.start()] + body + source[block.end():]
        else:
            assert [int(word, 16) for word in re.findall(r"0x[0-9a-f]+", match[1])] == expected, boss_id
    if write:
        CATALOG.write_text(source)
    entries = []
    for row in catalog["phase_summons"]:
        entries.append("    PhaseSummon { boss_id: %d, phase_index: %d, threshold: f32::from_bits(0x%08x), count: %d, yell: %s }," %
                       (row["boss_id"], row["phase_index"], row["threshold_bits"], row["count"], json.dumps(row["yell"]["text"], ensure_ascii=False)))
    generated = "\n".join(entries)
    source = PHASES.read_text()
    pattern = r"(?<=// BEGIN RECOVERED PHASE SUMMONS\n).*?(?=\n// END RECOVERED PHASE SUMMONS)"
    assert re.search(pattern, source, re.S)
    if write:
        PHASES.write_text(re.sub(pattern, lambda _: generated, source, flags=re.S))
    else:
        assert re.search(pattern, source, re.S)[0] == generated
    for locale in catalog["phase_locales"]:
        path = ROOT / "crates/azeroth-survivors-re/assets/locales" / (locale["code"] + ".json")
        decoded = json.loads(path.read_text())
        if write and any(decoded.get(key) != value for key, value in locale["values"].items()):
            decoded.update(locale["values"])
            path.write_text(json.dumps(decoded, ensure_ascii=False, indent=2) + "\n")
        else:
            for key, value in locale["values"].items():
                assert decoded[key] == value, (locale["code"], key)
        for key in locale["absent"]:
            assert key not in decoded, (locale["code"], key)
    # Inspect the live owners, not just the generated table. These assertions
    # are source-tracing guards, not execution or type checking of Rust.
    owners = {
        "crates/azeroth-survivors-re/src/bosses/ai.rs": [
            "actor.tick_with_stage_and_hold(None", "phases.take_actions(definition.id, health, max_health)",
            "queued.append(&mut abilities)", "ability: phase.ability()"],
        "crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs": [
            "row.ai.tick_with_minion_phases(", "&mut row.minion_phases",
            "minion_phases: native::minion_phases::PhaseState::default()",
            "AnnouncementLabel::boss_phase(", "native::ai::dispatch_queued("],
        "crates/azeroth-survivors-re/src/bosses/abilities.rs": [
            'port.yell(context.source_guid, "Minions, to me!")',
            "math.cos(angle) * 5.0 + context.source.x", "minion_enemy_index(index)",
            "port.spawn_minion(MinionSpawn { enemy_index, position }, rng, guid_counter)"],
    }
    for path, tokens in owners.items():
        text = (ROOT / path).read_text()
        for token in tokens:
            assert token in text, (path, token)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--write-source", action="store_true")
    args = parser.parse_args()
    catalog, native = recover()
    WORK.mkdir(parents=True, exist_ok=True)
    for name, value in (("catalog.json", catalog), ("native.json", native)):
        output = serialized(value)
        (WORK / name).write_text(output)
        if args.check:
            assert (EVIDENCE / name).read_text() == output, name
    if args.check:
        manifest = json.loads((EVIDENCE / "manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        target = latest_target(verify=False)
        data = target_bytes(target)
        for entry in manifest["spans"]:
            offset, size = int(entry["file_offset"], 16), entry["byte_count"]
            assert hashlib.sha256(data[offset:offset + size]).hexdigest() == entry["sha256"]
            assert hashlib.sha256((EVIDENCE / entry["assembly"]).read_bytes()).hexdigest() == entry["assembly_sha256"]
        for entry in manifest["constants"]:
            offset, size = int(entry["file_offset"], 16), entry["byte_count"]
            payload = data[offset:offset + size]
            assert hashlib.sha256(payload).hexdigest() == entry["sha256"]
            assert payload.hex() == entry["hex"]
        for record in manifest["rea"]:
            entry = record["original_owner"]
            offset, size = int(entry["file_offset"], 16), entry["byte_count"]
            assert hashlib.sha256(data[offset:offset + size]).hexdigest() == entry["sha256"]
            assert record["subject"]["digest"]["sha256"] == entry["sha256"]
            if "pseudocode" in record:
                assert hashlib.sha256((EVIDENCE / record["pseudocode"]).read_bytes()).hexdigest() == record["pseudocode_sha256"]
    source_check(catalog, args.write_source)
    print("60 scheduled summons, 9 phase summons; " + str(sum(map(len, native["cases"].values()))) + " bounded native cases pass.")


if __name__ == "__main__":
    main()

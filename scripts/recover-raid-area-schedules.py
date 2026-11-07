#!/usr/bin/env python3
"""Recover and check selected current boss circle schedules without compilation.

Reads the configured installed target in place. Bounded Unicorn execution uses
synthetic actor, timer, native move and deferred queue memory, never a game.
The full boss/phase tag census establishes the selected table's scope; remaining
native moves and phase actions still belong to gap42.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
WORK = ROOT / "runtime/analysis/history/raid/raid-area-schedules/2d7891e075b8"
EVIDENCE = ROOT / "docs/analysis/evidence/0.108.0/raid-area-schedules"
SOURCE = ROOT / "crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs"


def serialized(value):
    return json.dumps(value, indent=2, ensure_ascii=False, allow_nan=False) + "\n"


def f32(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def recover():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Selected target changed; recover new contracts first"
    data = target_bytes(target)
    module = load_script("area_schedule_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(address, length):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + length]
        assert len(value) == length
        return value

    def span(address, length):
        payload = raw(address, length)
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=length, sha256=hashlib.sha256(payload).hexdigest())

    def text(address):
        pointer, length = struct.unpack("<QQ", raw(address, 16))
        assert length < 4096
        return raw(pointer, length).decode()

    bosses, phases, move_tags, phase_tags = [], [], {}, {}
    for zone_index in range(12):
        zone = 0x146BD7B90 + zone_index * 240
        pointer, count = struct.unpack("<QQ", raw(zone + 0x88, 16))
        assert count == 5
        for boss_index in range(count):
            boss = pointer + boss_index * 104
            boss_id = struct.unpack("<I", raw(boss + 64, 4))[0]
            moves, move_count = struct.unpack("<QQ", raw(boss + 16, 16))
            phase_pointer, phase_count = struct.unpack("<QQ", raw(boss + 48, 16))
            selected = []
            for slot in range(move_count):
                address = moves + slot * 56
                payload = raw(address, 56)
                words = struct.unpack("<14I", payload)
                tag = payload[45]
                move_tags[tag] = move_tags.get(tag, 0) + 1
                if tag not in (3, 5, 6):
                    continue
                semantic = ({3: 5, 5: 2, 6: 6}[tag], *words[:5], words[12])
                if tag == 5:
                    assert words[1:5] == (0, 0, 0, 0)
                selected.append(dict(native_slot=slot, native_tag=tag,
                                     semantic_words=list(semantic), record=span(address, 56),
                                     native_record_hex=payload.hex()))
            assert sum(row["native_tag"] == 5 for row in selected) == 1
            bosses.append(dict(boss_id=boss_id, name=text(boss), zone=text(zone + 8),
                               native_move_count=move_count, moves=selected))
            for phase_index in range(phase_count):
                address = phase_pointer + phase_index * 72
                payload = raw(address, 72)
                tag = payload[61]
                phase_tags[tag] = phase_tags.get(tag, 0) + 1
                phases.append(dict(boss_id=boss_id, phase_index=phase_index, native_tag=tag,
                                   threshold_bits=struct.unpack_from("<I", payload, 64)[0],
                                   record=span(address, 72)))
    assert len(bosses) == 60 and len(phases) == 33
    assert move_tags[3] == 7 and move_tags[6] == 14 and move_tags[5] == 60
    assert not any(row["native_tag"] in (3, 6) for row in phases)
    catalog = dict(target_version=target["version"], target_sha256=SHA, target=target["path"],
                   target_executed=False, move_tag_counts=move_tags, phase_tag_counts=phase_tags,
                   bosses=bosses, phases=phases,
                   limits=["Selected native3/5/6 schedules only; unselected moves and phase actions remain gap42.",
                           "All 33 phase tags were checked: none are selected native3/6.",
                           "Legacy missile/charge effects retain their existing timing and are not certified by this recovery."])

    # Reuse the canonical current-target actor/constructor extracts, rather than
    # retaining a second copy of identical assembly or Ghidra pseudocode.
    manifest = json.loads((ROOT / "docs/analysis/evidence/0.108.0/boss-minions/manifest.json").read_text())
    for record in manifest["spans"]:
        at = int(record["file_offset"], 16)
        assert hashlib.sha256(data[at:at + record["byte_count"]]).hexdigest() == record["sha256"]
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn import x86_const as r
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    for page in range(0x145973000, 0x145974000, 4096):
        uc.mem_map(page, 4096)
        uc.mem_write(page, raw(page, 4096))
    for address in (0x145DCD0B8, 0x145D97610):
        page = address & ~4095
        uc.mem_map(page, 4096)
        uc.mem_write(page, raw(page, 4096))
    actor, timers, table, queue, stack = (0x70000000, 0x70010000, 0x70020000, 0x70030000, 0x70040000)
    for address in (actor, timers, table, queue, stack):
        uc.mem_map(address, 4096)
    frame = stack + 0x400
    cases = 0
    for boss in bosses:
        moves = boss["moves"]
        records = b"".join(bytes.fromhex(row["native_record_hex"]) for row in moves)
        uc.mem_write(table, records)
        for enraged in (False, True):
            for deadline in (9.0, 10.0, 11.0, math.nan):
                for timer in (-1.0, 0.0, 0.5, math.nan):
                    for prior in (None, "same_blocking", "same_minion", "other_blocking"):
                        uc.mem_write(actor, bytes(4096))
                        uc.mem_write(queue, bytes(4096))
                        uc.mem_write(stack, bytes(4096))
                        uc.mem_write(actor + 0x20, struct.pack("<QQ", timers, len(moves)))
                        uc.mem_write(actor + 0x38, struct.pack("<QQ", table, len(moves)))
                        uc.mem_write(actor + 0x48, struct.pack("<f", deadline))
                        uc.mem_write(actor + 0x50, bytes([enraged]))
                        uc.mem_write(timers, struct.pack("<" + "f" * len(moves), *([timer] * len(moves))))
                        uc.mem_write(frame + 0x220, struct.pack("<Q", 7))
                        uc.mem_write(frame + 0x228, struct.pack("<QQQ", 64, queue, int(prior is not None)))
                        uc.mem_write(frame + 0x310, struct.pack("<Q", actor))
                        if prior:
                            uc.mem_write(queue, struct.pack("<Q", 8 if prior == "other_blocking" else 7))
                            uc.mem_write(queue + 0x35, bytes([5 if prior == "same_minion" else 3]))
                        for register, value in ((r.UC_X86_REG_R14, actor), (r.UC_X86_REG_RBP, frame),
                                                (r.UC_X86_REG_XMM6, bits(10.0)), (r.UC_X86_REG_XMM7, bits(0.5)),
                                                (r.UC_X86_REG_XMM13, 0)):
                            uc.reg_write(register, value)
                        uc.reg_write(r.UC_X86_REG_MXCSR, 0x1F80)
                        uc.emu_start(0x145973B45, 0x145973D91, count=4096)
                        assert uc.reg_read(r.UC_X86_REG_RIP) == 0x145973D91
                        count = struct.unpack("<Q", uc.mem_read(frame + 0x238, 8))[0]
                        actual_timers = struct.unpack("<" + "I" * len(moves), uc.mem_read(timers, len(moves) * 4))
                        expected = []
                        blocked = prior == "same_blocking"
                        for index, move in enumerate(moves):
                            after = f32(timer - 0.5)
                            blocking = move["native_tag"] != 5
                            admitted = after <= 0.0 and (not blocking or (not deadline > 10.0 and not blocked))
                            if admitted:
                                expected.append(bytes.fromhex(move["native_record_hex"])[:48])
                                repeat = struct.unpack("<f", struct.pack("<I", move["semantic_words"][6]))[0]
                                after = f32(repeat * (f32(0.7) if enraged else 1.0))
                                blocked |= blocking
                            if math.isnan(after):
                                assert math.isnan(struct.unpack("<f", struct.pack("<I", actual_timers[index]))[0])
                            else:
                                assert actual_timers[index] == bits(after), (boss["boss_id"], index, prior)
                        before = int(prior is not None)
                        assert count == before + len(expected), (boss["boss_id"], deadline, timer, prior, count, expected)
                        for index, payload in enumerate(expected, before):
                            actual = bytes(uc.mem_read(queue + index * 56, 56))
                            assert struct.unpack_from("<Q", actual)[0] == 7
                            assert actual[8:] == payload
                        cases += 1
    native = dict(target_version=target["version"], target_sha256=SHA, target_executed=False,
                  method="Unicorn runs the complete selected native schedule loop with synthetic state and a preallocated deferred queue; no calls are reached.",
                  instruction_span=span(0x145973B45, 0x145973D91 - 0x145973B45),
                  canonical_assembly="docs/analysis/evidence/0.108.0/boss-minions/scheduled-repeat.asm",
                  canonical_ghidra_manifest="docs/analysis/evidence/0.108.0/boss-minions/manifest.json",
                  case_count=cases,
                  cases=dict(bosses=60, enraged=[False, True], cast_deadlines=[9, 10, 11, "NaN"],
                             timers=[-1, 0, 0.5, "NaN"], elapsed=0.5, now=10,
                             earlier_queue=["none", "same actor blocking", "same actor minion", "other actor blocking"]),
                  established=["All selected native slots, original order and repeat cooldown payloads; constructor initial scale is retained by the canonical manifest.",
                               "Timers decrement even while positive, unordered, cast-gated or blocked by an earlier queued request.",
                               "Only admitted requests reset timers; overshoot has no catchup.",
                               "Selected3/6 are blocking; native5 bypasses both active cast and earlier blocking requests.",
                               "Equal/NaN cast deadlines are not active; NaN timers do not fire."],
                  limits=["No Rust compilation, game process or visual/terrain comparison.",
                          "Ordering/interactions with unimplemented native moves/phases remain gap42."])
    return catalog, native


def generated_rows(catalog):
    rows = []
    for boss in catalog["bosses"]:
        rows.append(f"    BossSchedule {{ boss_id: {boss['boss_id']}, moves: &[")
        for move in boss["moves"]:
            words = ", ".join(f"0x{value:08x}" for value in move["semantic_words"])
            rows.append(f"        ScheduledMove {{ native_slot: {move['native_slot']}, native_tag: {move['native_tag']}, ability: RawBossAbility {{ words: [{words}] }} }},")
        rows.append("    ] },")
    return "\n".join(rows)


def check_source(catalog, write):
    source = SOURCE.read_text()
    pattern = r"(?<=// BEGIN CURRENT RAID SCHEDULES\n).*?(?=\n// END CURRENT RAID SCHEDULES)"
    generated = generated_rows(catalog)
    assert re.search(pattern, source, re.S)
    if write:
        SOURCE.write_text(re.sub(pattern, lambda _: generated, source, flags=re.S))
    else:
        assert re.search(pattern, source, re.S)[0] == generated
    for path, tokens in {
        "crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs": [
            "f32::from_bits(row.ability.words[6]) * 0.6", "*timer -= elapsed;", "*timer <= 0.0",
            "!cast_active && !blocking_queued", "blocking_queued |= blocking", "repeat * scale",
            "row.native_tag != 5"],
        "crates/azeroth-survivors-re/src/bosses/ai.rs": [
            "pub raid_cast_until: f32", "pub raid_hold_until: f32", "raid_schedule: super::raid_area_catalog::ScheduleState::new(definition.id)",
            "actor.tick_with_stage_and_hold(None", "self.raid_cast_until > now", "self.raid_schedule.advance(",
            "matches!(ability.words[0], 0 | 2 | 3)"],
    }.items():
        source = (ROOT / path).read_text()
        for token in tokens:
            assert token in source, (path, token)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-source", action="store_true")
    parser.add_argument("--write-evidence", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    catalog, native = recover()
    # Native summon bytes already have a canonical target-bound extract. Keep
    # their selected scheduling metadata here and reference that copy instead
    # of retaining the same sixty raw records a second time.
    canonical_path = "docs/analysis/evidence/0.108.0/boss-minions/catalog.json"
    canonical = json.loads((ROOT / canonical_path).read_text())
    assert canonical["target_sha256"] == SHA
    for index, boss in enumerate(catalog["bosses"]):
        original = canonical["bosses"][index]
        assert original["boss_id"] == boss["boss_id"]
        for move in boss["moves"]:
            if move["native_tag"] == 5:
                assert move.pop("native_record_hex") == original["scheduled"]["record"]["hex"]
                assert all(original["scheduled"]["record"][key] == value
                           for key, value in move["record"].items())
                move["native_record_ref"] = f"{canonical_path}#/bosses/{index}/scheduled/record"
    WORK.mkdir(parents=True, exist_ok=True)
    for name, value in (("catalog.json", catalog), ("native.json", native)):
        content = serialized(value)
        (WORK / name).write_text(content)
        if args.write_evidence:
            EVIDENCE.mkdir(parents=True, exist_ok=True)
            (EVIDENCE / name).write_text(content)
        if args.check:
            assert (EVIDENCE / name).read_text() == content, name
    check_source(catalog, args.write_source)
    print(f"7 ground + 14 strike + 60 minion schedules; all 33 phases checked; {native['case_count']} bounded native schedule cases pass.")


if __name__ == "__main__":
    main()

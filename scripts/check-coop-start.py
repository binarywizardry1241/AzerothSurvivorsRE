#!/usr/bin/env python3
"""Verify movement-driven run start and guest exclusion without compilation."""
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from discovery_native_subject import verify_native_query_subject

BASE = ROOT / "docs/analysis/evidence/0.123.0/coop-start"
CURRENT = ROOT / "docs/analysis/evidence/0.140.0/movement-start.json"


def verify(proof, target):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    assert {key: target[key] for key in proof["target"]} == proof["target"]
    assert proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("coop_start_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    d = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert hex(offset) == row["file_offset"] and raw.hex() == row["bytes_hex"]
        assert hashlib.sha256(raw).hexdigest() == row["sha256"]
        if "end_exclusive" in row:
            assert sum(i.size for i in d.disasm(raw, address)) == len(raw)
    queries = proof.get("queries", [])
    for q in queries:
        path = ROOT / q["result"]["path"]
        assert hashlib.sha256(path.read_bytes()).hexdigest() == q["result"]["sha256"]
        result = json.loads(path.read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert verify_native_query_subject(ROOT, native, q, proof["target"], image=image, pe=pe) == q["subject_verification"]
        canonical = ROOT / q["canonical_extract"]["path"]
        assert canonical.read_text() == native["normalized_result"]
    return len(queries)


def native_cases(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u, mapped = Uc(UC_ARCH_X86, UC_MODE_64), set()
    def put(address, data):
        for page in range(address & ~4095, (address + len(data) + 4095) & ~4095, 4096):
            if page not in mapped:
                u.mem_map(page, 4096); mapped.add(page)
        u.mem_write(address, data)
    for row in proof["native_ranges"] + proof["native_data"]:
        put(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    for address in [0x145b0ac31, 0x145bb79f0, 0x145afc720]:
        put(address, b"\x90")
    game, actor, frame, stack = 0x22000000, 0x22010000, 0x23008000, 0x23000000
    put(game, bytes(0x12000)); put(stack, bytes(0x20000))
    stops, seen, steps = set(), [], 0
    def write(at, fmt, *values):
        put(at, struct.pack("<" + fmt, *values))
    def hook(uc, address, size, _):
        nonlocal steps
        if address in stops:
            uc.emu_stop(); return
        steps += 1
        if address in [0x145bb79f0, 0x145afc720]:
            if address == 0x145bb79f0:
                seen.append(struct.unpack("<Q", uc.mem_read(game + 0xc50, 8))[0])
            sp = uc.reg_read(r.UC_X86_REG_RSP)
            uc.reg_write(r.UC_X86_REG_RAX, 1)
            uc.reg_write(r.UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(sp, 8))[0])
            uc.reg_write(r.UC_X86_REG_RSP, sp + 8)
    u.hook_add(UC_HOOK_CODE, hook)
    def run(at, end):
        nonlocal stops
        stops = set(end)
        u.reg_write(r.UC_X86_REG_RSP, stack + 0x10000)
        u.reg_write(r.UC_X86_REG_RBP, frame)
        u.emu_start(at, 0, count=1000)
        at = u.reg_read(r.UC_X86_REG_RIP)
        assert at in stops, hex(at)
        return at
    def xmm(register, *values):
        raw = struct.pack("<" + "f" * len(values), *values)
        u.reg_write(register, int.from_bytes(raw.ljust(16, b"\0"), "little"))
    f32 = lambda x: struct.unpack("<f", struct.pack("<f", x))[0]
    if proof["target"]["version"] == "0.140.0":
        count = 0
        put(0x145ea7692, b"\x90")
        for opcode in range(0x400):
            u.reg_write(r.UC_X86_REG_EAX, opcode)
            at = run(0x145ea482b, {0x145ea4860, 0x145ea7692})
            admitted = (0xb5 <= opcode <= 0xcb and opcode != 0xc7) or opcode in (0xda, 0xdb, 0xee)
            assert (at == 0x145ea4860) == admitted
            count += 1
        for flags in [0, 1, 2, 4, 8, 15, 0x10, 0x2000, 0x2001, 0x80000000]:
            for previous in [0, 1]:
                for selector in [0, 1, 0x100000001]:
                    write(game + 0x1088, "I", flags)
                    write(game + 0x10c4, "B", previous)
                    write(game + 0xfc0, "Q", selector)
                    u.reg_write(r.UC_X86_REG_RCX, game)
                    u.reg_write(r.UC_X86_REG_RSI, game)
                    run(0x145f97ace, {0x145f97af4})
                    assert u.mem_read(frame + 0x3b, 1)[0] == bool(flags & 15)
                    assert u.reg_read(r.UC_X86_REG_ECX) == previous
                    assert u.mem_read(game + 0x10c4, 1)[0] == (previous if selector else bool(flags & 15))
                    count += 1

        threshold = struct.unpack("<f", bytes.fromhex(proof["native_data"][0]["bytes_hex"]))[0]
        points = [
            ((0., 0., 0.), (0., 0., 0.)),
            ((0.19999, 0., 0.), (0.19999, 0., 0.)),
            ((0.20001, 0., 0.), (0.20001, 0., 0.)),
            ((0., 0., 9.), (0., 0., 9.)),
            ((1., 1., 0.), (1., 1., -0.)),
            ((1., 1., 1.), (2., 1., 1.)),
            ((1., 1., 1.), (1., 2., 1.)),
            ((1., 1., 1.), (1., 1., 2.)),
            ((1., 1., float("nan")), (1., 1., float("nan"))),
        ]
        for phase in [0, 1, 255]:
            for selector in [0, 1]:
                for restriction in [0, 1]:
                    for directional, previous in [(0, 0), (0, 1), (1, 0), (1, 1)]:
                        for reported, position in points:
                            reported = tuple(map(f32, reported))
                            position = tuple(map(f32, position))
                            write(game + 0x5c8, "2f", 0., 0.)
                            write(game + 0x10d1, "B", phase)
                            write(game + 0xfc0, "Q", selector)
                            write(game + 0x10cc, "B", restriction)
                            write(frame + 0x3b, "B", directional)
                            write(frame + 0x45, "B", previous)
                            u.reg_write(r.UC_X86_REG_RSI, game)
                            xmm(r.UC_X86_REG_XMM11, *position[:2])
                            xmm(r.UC_X86_REG_XMM7, position[2])
                            for register, value in zip(
                                (r.UC_X86_REG_XMM8, r.UC_X86_REG_XMM12, r.UC_X86_REG_XMM14),
                                reported,
                            ):
                                xmm(register, value)
                            at = run(0x145f985eb, {0x145f98621, 0x145f98711})
                            assert u.mem_read(game + 0x5c8, 12) == struct.pack("<3f", *position)
                            x, y = position[:2]
                            squared = f32(f32(x * x) + f32(y * y))
                            matches = all(final == raw for final, raw in zip(position, reported))
                            begins = (phase == selector == restriction == 0
                                      and (directional or previous) and squared > threshold and matches)
                            assert (at == 0x145f98711) == bool(begins)
                            count += 1

        # Driver update samples the live connection rows before the next
        # movement gate. No assignment or an already synced row cannot block.
        seconds = struct.unpack("<d", bytes.fromhex(proof["native_data"][1]["bytes_hex"]))[0]
        rows = [(), ((0, 0),), ((1, 0),), ((1, 1),), ((1, 1), (1, 0))]
        for host_state in [0, 3]:
            for waiting in [0, 1]:
                for game_tag in [0, 2]:
                    for elapsed in [-1., 0., 59.99, 60., 61., float("nan")]:
                        for peers in rows:
                            write(frame + 0x1240, "Q", game)
                            write(frame + 0x1160, "d", elapsed)
                            write(game + 0x10, "I", game_tag)
                            write(game + 0x10e8, "Q", host_state)
                            write(game + 0x10f0, "Q", waiting)
                            write(game + 0x10f8, "d", 0.)
                            write(game + 0x10dc, "B", 1)
                            write(game + 0x1120, "Q", actor)
                            write(game + 0x1128, "Q", len(peers))
                            for index, (assigned, synced) in enumerate(peers):
                                row = actor + index * 0x870
                                write(row, "Q", assigned)
                                write(row + 0x86d, "B", synced)
                            run(0x145eab5b1, {0x145eab66e})
                            release = (host_state == 3 and waiting
                                       and (not elapsed < seconds
                                            or all(not assigned or synced for assigned, synced in peers)))
                            assert u.mem_read(game + 0x10f0, 1)[0] == (0 if release else waiting)
                            assert u.mem_read(game + 0x10dc, 1)[0] == (0 if release and game_tag != 2 else 1)
                            count += 1
        return count, steps

    count = 0
    for selector in [1, 2, 3, 4, 5, 0x100000001]:
        seen.clear(); write(frame + 0x1398, "Q", selector); write(frame + 0x1390, "Q", actor)
        write(game + 0xc50, "Q", 0); u.reg_write(r.UC_X86_REG_RSI, game)
        run(0x145ae4adb, {0x145ae4b4c})
        assert seen == [selector]
        assert struct.unpack("<Q", u.mem_read(game + 0xc50, 8))[0] == 0
        count += 1
    threshold = struct.unpack("<f", bytes.fromhex(proof["native_data"][0]["bytes_hex"]))[0]
    for phase in [0, 1, 4, 255]:
        for selector in [0, 1, 2, 5, 0x100000001]:
            for restriction in [0, 1, 255]:
                for point in [(0., 0.), (0.1, 0.), (0.2, 0.), (1., 1.), (float("nan"), 0.)]:
                    write(game + 0xd57, "B", phase); write(game + 0xc50, "Q", selector)
                    write(game + 0xd53, "B", restriction)
                    u.reg_write(r.UC_X86_REG_RSI, game)
                    xmm(r.UC_X86_REG_XMM1, 0., 0.); xmm(r.UC_X86_REG_XMM11, *point)
                    at = run(0x145b0abf5, {0x145b0ac29, 0x145b0ac31})
                    dx, dy = f32(point[0]), f32(point[1])
                    squared = f32(f32(dx * dx) + f32(dy * dy))
                    expected = phase == 0 and squared > threshold and selector == 0 and restriction == 0
                    assert (at == 0x145b0ac29) == expected, (phase, selector, restriction, point)
                    count += 1
    write(game + 0xd57, "B", 0); u.reg_write(r.UC_X86_REG_RCX, game)
    run(0x145b18c74, {0x145b18c7e})
    assert u.mem_read(game + 0xd57, 1) == b"\x01"
    return count + 1, steps


def source_checks(current):
    commands = (ROOT / "crates/azeroth-survivors-re/src/gameplay/coop_commands.rs").read_text()
    assert "began" not in commands and "run.started = true;" not in commands
    assert "game.party_input(" in commands and "runtime.route_movement(slot, relay.clone())" in commands
    assert "record_boss_movement_report" in commands and "motion.recovery.admit_timestamped(" in commands
    local = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mod.rs").read_text()
    commit = local.split("fn commit_movement_report(", 1)[1].split("fn movement_begins(", 1)[0]
    assert "session.started = true;" in commit
    if current:
        tick = local.split("fn tick(", 1)[1].split("fn account_delivery", 1)[0]
        assert tick.index("coop.is_guest()") < tick.index("commit_movement_report(")
        assert tick.index("let Some(opcode) = report.movement_opcode") < tick.index("session.recovery.admit_timestamped(")
        assert "report.position_wow, report.facing, report.flags, admission" in tick
        assert "session.previous_directional_movement = false;" in local
        assert "let directional_movement = flags & 0x0f != 0;" in commit
        assert commit.index("std::mem::replace") < commit.index("Admission::Ignored => return")
        assert commit.index("accepted_position.replace(position)") < commit.index("movement_begins(previous, position)")
        assert "&& (directional_movement || previous_directional)" in commit
        assert "&& position == reported" in commit
        assert "&& session.coop_start_wait_since.is_none()" in commit
        bootstrap = (ROOT / "crates/azeroth-survivors-re/src/gameplay/coop.rs").read_text()
        assert "bootstrap.after(ZoneWorldSet::Ready).before(RunSet::Tick)" in bootstrap
        assert "real_time.elapsed_secs_f64() - since < 60.0" in bootstrap
        assert "client.world_hero.is_some() && !client.synchronized" in bootstrap
        assert "if initial_world && !state.admitted.is_empty()" in bootstrap
    else:
        assert "if !session.started && movement_begins(previous, position)" in commit


if __name__ == "__main__":
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"), str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    target = latest_target(verify=True)
    current = target["version"] == "0.140.0"
    proof = json.loads((CURRENT if current else BASE / "manifest.json").read_text())
    queries = verify(proof, target)
    cases, steps = native_cases(proof)
    source_checks(current)
    print(json.dumps(dict(status="passed", target=proof["target"], reused_native_queries=queries,
                         isolated_original_instruction_cases=cases, original_instruction_steps=steps,
                         compilation=False, game_or_service_execution=False, parity_verified=False), indent=2))

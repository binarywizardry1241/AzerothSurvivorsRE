#!/usr/bin/env python3
"""Verify guest movement cannot start the host run; no compilation or game runs."""
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from discovery_native_subject import verify_native_query_subject

BASE = ROOT / "docs/analysis/evidence/0.123.0/coop-start"


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
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
    for q in proof["queries"]:
        path = ROOT / q["result"]["path"]
        assert hashlib.sha256(path.read_bytes()).hexdigest() == q["result"]["sha256"]
        result = json.loads(path.read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert verify_native_query_subject(ROOT, native, q, proof["target"], image=image, pe=pe) == q["subject_verification"]
        canonical = ROOT / q["canonical_extract"]["path"]
        assert canonical.read_text() == native["normalized_result"]
    return len(proof["queries"])


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


def source_checks():
    commands = (ROOT / "crates/azeroth-survivors-re/src/gameplay/coop_commands.rs").read_text()
    assert "began" not in commands and "run.started = true;" not in commands
    assert "game.party_input(" in commands and "runtime.route_movement(slot, relay.clone())" in commands
    assert "record_boss_movement_report" in commands and "motion.recovery.admit_timestamped(" in commands
    local = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mod.rs").read_text()
    commit = local.split("fn commit_movement_report(", 1)[1].split("fn movement_begins(", 1)[0]
    assert "if !session.started && movement_begins(previous, position)" in commit
    assert "session.started = true;" in commit


if __name__ == "__main__":
    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"), str(ROOT / "runtime/armory-recovery/python-libs")]
    proof = json.loads((BASE / "manifest.json").read_text())
    queries = verify(proof)
    cases, steps = native_cases(proof)
    source_checks()
    print(json.dumps(dict(status="passed", target=proof["target"], reused_native_queries=queries,
                         isolated_original_instruction_cases=cases, original_instruction_steps=steps,
                         compilation=False, game_or_service_execution=False, parity_verified=False), indent=2))

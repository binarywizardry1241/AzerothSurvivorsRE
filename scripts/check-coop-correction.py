#!/usr/bin/env python3
"""Verify current correction/recipient contracts with isolated original instructions.

No compiler, game, network connection or server is run. Ghidra input receipts,
static source wiring and synthetic native instruction vectors are separate checks.
"""

from script_sources import current_path, recorded_input_matches
import argparse
import hashlib
import json
import math
import platform
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/0.123.0/coop-correction"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert {key: target[key] for key in proof["target"]} == proof["target"]
    assert proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("coop_correction_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and sha(raw) == row["sha256"]
        if "end_exclusive" in row:
            assert start + len(raw) == int(row["end_exclusive"], 16)
            assert sum(item.size for item in decoder.disasm(raw, start)) == len(raw)
    for query in proof["queries"]:
        result = json.loads(receipt(query["result"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_sha256"]
        if "canonical_extract" in query:
            assert receipt(query["canonical_extract"]).read_text() == native["normalized_result"]
        assert verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe) == query["subject_verification"]
    return len(proof["queries"])


def native_cases(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine, mapped = Uc(UC_ARCH_X86, UC_MODE_64), set()

    def put(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, raw)

    for row in proof["native_ranges"] + proof["native_data"]:
        put(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    game, actor, stack = 0x22000000, 0x22010000, 0x23000000
    put(game, bytes(0x12000)); put(stack, bytes(0x20000))
    # Stops/callbacks are synthetic seams; no omitted game function executes.
    for address in (0x145b0ac56, 0x145c0ab48, 0x145c2e150):
        put(address, b"\x90")
    stops, destinations, count = set(), [], 0

    def hook(uc, address, size, _):
        nonlocal count
        if address in stops:
            uc.emu_stop(); return
        count += 1
        if address == 0x145c2e150:
            destinations.append(uc.reg_read(reg.UC_X86_REG_RDX))
            sp = uc.reg_read(reg.UC_X86_REG_RSP)
            uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(sp, 8))[0])
            uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
    machine.hook_add(UC_HOOK_CODE, hook)

    def write(address, fmt, *values):
        put(address, struct.pack("<" + fmt, *values))

    def xmm(register, *values):
        raw = struct.pack("<" + "f" * len(values), *values)
        machine.reg_write(register, int.from_bytes(raw.ljust(16, b"\0"), "little"))

    def run(start, end):
        nonlocal stops
        stops = set(end)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x10000)
        machine.reg_write(reg.UC_X86_REG_RBP, stack + 0x8000)
        machine.emu_start(start, 0, count=1000)
        result = machine.reg_read(reg.UC_X86_REG_RIP)
        assert result in stops, hex(result)
        return result

    cases = 0
    points = [(0., 0., 999.), (3., 0., 0.), (-3., 0., 0.), (0., 3., 0.),
              (2., 2., 0.), (2.2, 2.2, 0.), (4., 0., 0.),
              (math.inf, 0., 0.), (math.nan, 0., 0.)]
    times = [100., 102., struct.unpack("<f", bytes.fromhex("ffffcd42"))[0],
             103., 104., math.inf, -math.inf, math.nan]
    for pending in (0, 1, 2, 255):
        for now in times:
            for point in points:
                write(game + 0xbb8, "I", pending)
                write(game + 0xbbc, "3f", 0., 0., 5.)
                write(game + 0xbcc, "f", 100.)
                write(game + 0xc98, "f", now)
                write(actor, "3f", *point)
                machine.reg_write(reg.UC_X86_REG_RCX, game)
                machine.reg_write(reg.UC_X86_REG_RSI, game)
                machine.reg_write(reg.UC_X86_REG_RDX, actor)
                machine.reg_write(reg.UC_X86_REG_RDI, actor)
                end = run(0x145b0a0cf, {0x145b0a149, 0x145b0ac56})
                squared = point[0] ** 2 + point[1] ** 2
                ignored = bool(pending and squared > 9. and now - 100. < 3.)
                assert (end == 0x145b0ac56) == ignored, (pending, now, point)
                assert struct.unpack("<I", machine.mem_read(game + 0xbb8, 4))[0] == (pending if ignored else 0)
                cases += 1
    # Arbitrarily many stale reports do not consume the time deadline.
    write(game + 0xbb8, "I", 1); write(game + 0xc98, "f", 102.)
    write(actor, "3f", 20., 0., 0.)
    for _ in range(100):
        machine.reg_write(reg.UC_X86_REG_RCX, game); machine.reg_write(reg.UC_X86_REG_RDX, actor)
        assert run(0x145b0a0cf, {0x145b0a149, 0x145b0ac56}) == 0x145b0ac56
        cases += 1
    for flags in (0, 1, 2, 3, 0xffffffff):
        write(game + 0xbd0, "I", flags); write(game + 0xbd4, "f", 200.)
        write(game + 0xc98, "f", 7.)
        machine.reg_write(reg.UC_X86_REG_RSI, game)
        run(0x145b0a149, {0x145b0a168})
        value = struct.unpack("<f", (machine.reg_read(reg.UC_X86_REG_XMM15) & 0xffffffff).to_bytes(4, "little"))[0]
        assert value == (200. if flags & 1 else 7.)
        cases += 1
    for stamp in (0, 1, 999, 1000, 0x7fffffff, 0x80000000, 0xffffffff):
        write(actor, "I", stamp)
        machine.reg_write(reg.UC_X86_REG_RCX, actor); machine.reg_write(reg.UC_X86_REG_RSI, game)
        run(0x145ae48e1, {0x145ae4902})
        f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
        assert struct.unpack("<f", machine.mem_read(game + 0xbd4, 4))[0] == f32(f32(stamp) / 1000.)
        cases += 1
    for incoming, final in [((1., 2., 3.), (1., 2., 3.)), ((1., 2., 3.), (2., 2., 3.)),
                            ((1., 2., 3.), (1., 3., 3.)), ((1., 2., 3.), (1., 2., 4.)),
                            ((0., 0., 0.), (-0., 0., -0.)), ((math.nan, 2., 3.), (math.nan, 2., 3.))]:
        xmm(reg.UC_X86_REG_XMM6, incoming[0]); xmm(reg.UC_X86_REG_XMM7, incoming[1])
        xmm(reg.UC_X86_REG_XMM14, incoming[2]); xmm(reg.UC_X86_REG_XMM11, final[0], final[1])
        xmm(reg.UC_X86_REG_XMM8, final[2]); machine.reg_write(reg.UC_X86_REG_RAX, 0)
        run(0x145b0ac31, {0x145b0ac56})
        assert bool(machine.reg_read(reg.UC_X86_REG_RAX) & 0xff) == all(a == b for a, b in zip(incoming, final))
        cases += 1
    for accepted in (0, 1, 2, 255):
        for active in (0, 1, 2, 255):
            machine.reg_write(reg.UC_X86_REG_RAX, accepted); machine.reg_write(reg.UC_X86_REG_RCX, active)
            end = run(0x145c099a7, {0x145c099b7, 0x145c0ab48})
            assert (end == 0x145c099b7) == (accepted == 1 and active != 0)
            cases += 1
    for last in range(6):
        for source in range(7):
            destinations.clear(); write(game + 0xa40, "Q", last)
            machine.reg_write(reg.UC_X86_REG_RDI, game); machine.reg_write(reg.UC_X86_REG_RSI, source)
            run(0x145c2bba0, {0x145c2bbce})
            assert destinations == [slot for slot in range(last + 1) if slot != source]
            cases += 1
    for point in [(10., 20., 30.), (-3., 4., 0.), (0., 0., 0.)]:
        write(game + 0xc98, "f", 42.5)
        machine.reg_write(reg.UC_X86_REG_R12, game); machine.reg_write(reg.UC_X86_REG_RDI, 19)
        xmm(reg.UC_X86_REG_XMM6, *point[:2]); xmm(reg.UC_X86_REG_XMM9, point[2])
        run(0x145b2337e, {0x145b233cc})
        assert struct.unpack("<I3fIf", machine.mem_read(game + 0xbb8, 24)) == (1, *point, 19, 42.5)
        assert struct.unpack("<3f", machine.mem_read(game + 0x520, 12)) == point
        cases += 1
    return cases, count


def source_checks():
    base = ROOT / "crates/azeroth-survivors-re"
    floor = (base / "src/floor_recovery.rs").read_text()
    assert "reports_left" not in floor
    assert "report.now - pending.since < 3.0" in floor
    assert "self.expect_position(position, report.now);" in floor
    assert "timestamp as f32 / 1000.0" in floor
    assert "shallow, movement_time, 0.75" in floor and "blocked, movement_time, 1.0" in floor
    assert "movement_time - anchor.since >= 1.5" in floor
    assert "(movement_time - last.since).abs() < 6.0" in floor
    commands = (base / "src/gameplay/coop_commands.rs").read_text()
    assert "motion.recovery.admit_timestamped(" in commands and "info.timestamp," in commands
    assert "if point != reported" in commands and "runtime.route_movement(slot, relay.clone())" in commands
    assert "body.extend_from_slice(&packet.payload);" in commands and "body.get_mut(prefix" not in commands
    runtime = (base / "src/coop_runtime.rs").read_text()
    assert "if exclude_source { *slot != source } else { !private || *slot == source }" in runtime
    assert "self.engine_events.push((source, packet, true));" in runtime
    assert "self.engine_events.push((source, packet, false));" in runtime
    assert "for (source, packet, exclude_source)" in runtime
    assert "self.route_clients(source, packet, exclude_source);" in runtime
    assert "self.local_admissions.remove(index).2" in runtime
    assert "runtime.take_local_admission(opcode, original)" in runtime
    assert "if point != original { continue; }" in runtime
    assert "payload.get_mut(8..20)" not in runtime
    live = (base / "src/gameplay/mod.rs").read_text()
    assert "game.take_party_forced_positions()" in live
    assert "replica.expect_remote_position(*client, [point.x, point.y, point.z], game.clock);" in live
    assert "session.recovery.expect_position(position, now);" in live
    assert "if let Some(timestamp) = report.timestamp_ms" in live
    assert "session.recovery.admit_timestamped(zone, floor_report, timestamp, floor)" in live
    party = (base / "src/gameplay/mechanics/coop.rs").read_text()
    assert "self.coop.forced_positions.push((slot, point));" in party
    assert "self.coop.forced_positions.push((hero.slot, point));" in party
    paths = [base / "src" / item for item in ("floor_recovery.rs", "coop_runtime.rs", "gameplay/mod.rs", "gameplay/coop_commands.rs", "gameplay/mechanics/coop.rs")]
    paths.append(base / "tests/floor_recovery.rs")
    capture = (ROOT / "crates/benilla-app/src/player/state.rs").read_text()
    movement = (ROOT / "crates/benilla-app/src/player/movement_net.rs").read_text()
    assert "pub movement_opcode: Option<u16>" in capture
    assert movement.count("record_timestamped_movement(wow_pos, facing, wire_flags, None, timestamp)") == 2
    assert "pub timestamp_ms: Option<u32>" in capture
    assert "record_timestamped_movement(wire.pos, wire.facing, wire.flags, Some(kind.opcode()), timestamp)" in movement
    assert "record_timestamped_movement(pos, facing, 0, Some(MoveKind::Stop.opcode()), timestamp)" in movement
    assert movement.count(".map(|_| benilla_protocol::world::client_uptime_ms())") == 4
    writer = (ROOT / "crates/benilla-app/src/net/io.rs").read_text()
    assert "timestamp.unwrap_or_else(benilla_protocol::world::client_uptime_ms)" in writer
    protocol = (ROOT / "crates/benilla-protocol/src/world/writer/self_movement.rs").read_text()
    assert protocol.count("info.timestamp = timestamp;") == 3
    requests = (ROOT / "crates/benilla-app/src/local_client/requests.rs").read_text()
    assert "let ordinary = matches!(&command, ClientCommand::Move{..})" in requests
    assert "if wire.observe_movement && ordinary { wire.packets.push(packet); }" in requests
    assert "let Some(opcode) = report.movement_opcode else { continue; };" in live
    assert "coop.local_admissions.push((opcode,report.position_wow,admitted))" in live
    paths.extend(ROOT / "crates/benilla-app/src/player" / name for name in ("state.rs", "movement_net.rs", "wire_in.rs"))
    paths.extend(ROOT / name for name in (
        "crates/benilla-app/src/net.rs", "crates/benilla-app/src/net/io.rs",
        "crates/benilla-app/src/local_client/requests.rs",
        "crates/benilla-protocol/src/world/mod.rs", "crates/benilla-protocol/src/world/movement.rs",
        "crates/benilla-protocol/src/world/writer/self_movement.rs"))
    hosts = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin", ("Linux", "x86_64"): "x86_64-unknown-linux-gnu", ("Linux", "aarch64"): "aarch64-unknown-linux-gnu"}
    parser = ROOT / ".tools/rust" / ("1.98.1-" + hosts[(platform.system(), platform.machine())]) / "bin/rustfmt"
    for path in paths:
        result = subprocess.run([str(parser), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"], input=path.read_text(), text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert result.returncode == 0, result.stderr
    return len(paths)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-only", action="store_true",
                        help="check retained-contract source connections without replaying historical EXE evidence")
    arguments = parser.parse_args()
    if arguments.source_only:
        files = source_checks()
        print(json.dumps(dict(status="passed", scope="retained_contract_source_connections",
                             rust_files_syntax_parsed=files, rust_regressions_executed=False,
                             native_evidence_revalidated=False, compilation=False,
                             game_or_service_execution=False, parity_verified=False), indent=2))
        sys.exit(0)
    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"), str(ROOT / "runtime/armory-recovery/python-libs")]
    proof = json.loads((BASE / "manifest.json").read_text())
    queries = verify(proof)
    cases, steps = native_cases(proof)
    files = source_checks()
    print(json.dumps(dict(status="passed", target=proof["target"], native_queries=queries,
                         isolated_original_instruction_cases=cases, original_instruction_steps=steps,
                         rust_files_syntax_parsed=files, rust_regressions_executed=False,
                         compilation=False, game_or_service_execution=False, parity_verified=False), indent=2))

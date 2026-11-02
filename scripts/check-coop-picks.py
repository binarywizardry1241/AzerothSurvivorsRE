#!/usr/bin/env python3
"""Verify current pick bytes/receipts and replay isolated native branches.

No compilation, Rust tests, application/client/server or network execution.
Unicorn executes unchanged bounded original instructions with synthetic memory;
this is not an original/rebuilt game comparison.
"""

from script_sources import current_path, recorded_input_matches
import hashlib
import argparse
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes, project_path
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/0.123.0/coop-picks"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def native_cases(image, pe, ranges):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RSI, UC_X86_REG_RDI,
        UC_X86_REG_R8, UC_X86_REG_RDX, UC_X86_REG_RCX, UC_X86_REG_RSP,
        UC_X86_REG_XMM2, UC_X86_REG_RIP)
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()
    for row in ranges:
        start, end = int(row["start"], 0), int(row["end_exclusive"], 0)
        for page in range(start & ~4095, (end + 4095) & ~4095, 4096):
            if page not in pages:
                u.mem_map(page, 4096)
                pages.add(page)
        at = pe.rva_offset(start - pe.image_base)
        u.mem_write(start, image[at:at + end - start])
    u.mem_map(0x1462B9000, 4096)
    u.mem_write(0x1462B9AC8, struct.pack("<d", 4.0))
    scratch = 0x20000000
    u.mem_map(scratch, 0x4000)
    control = scratch + 0x2000
    stops = set()

    def hook(_, address, size, unused):
        if address in stops:
            u.emu_stop()

    u.hook_add(UC_HOOK_CODE, hook)

    def run(start, ends):
        nonlocal stops
        stops = set(ends)
        u.reg_write(UC_X86_REG_RSP, scratch + 0x3000)
        u.emu_start(start, 0, count=100)
        pc = u.reg_read(UC_X86_REG_RIP)
        assert pc in stops, hex(pc)
        return pc

    cases = 0
    identities = [0, 1, 2, 0x7fffffff, 0x80000000, 0xfffffffe, 0xffffffff]
    for current in identities:
        for received in identities:
            u.mem_write(scratch + 0xcc4, struct.pack("<I", current))
            u.mem_write(control + 4, struct.pack("<I", received))
            for start, accepted in [(0x145BBC78C, 0x145BBC79C),
                                    (0x145BBC7AE, 0x145BBC8E3)]:
                u.reg_write(UC_X86_REG_RSI, scratch)
                u.reg_write(UC_X86_REG_R8, control)
                pc = run(start, [accepted, 0x145BBC7C6])
                assert (pc == accepted) == (received == 0 or received == current)
                cases += 1
    for value in identities:
        u.mem_write(scratch + 0xcc4, struct.pack("<I", value))
        u.reg_write(UC_X86_REG_RDI, scratch)
        run(0x145B7F10D, [0x145B7F113])
        assert struct.unpack("<I", u.mem_read(scratch + 0xcc4, 4))[0] == (value + 1) & 0xffffffff
        cases += 1
    for pending in [0, 1, 2]:
        for delay in [-1.0, 0.0, 3.999, 4.0, 4.001, 10.0, float("nan")]:
            u.mem_write(scratch, struct.pack("<QdQ", pending, 10.0, 1))
            u.reg_write(UC_X86_REG_RDX, scratch)
            u.reg_write(UC_X86_REG_RCX, scratch + 0x100)
            u.reg_write(UC_X86_REG_XMM2, struct.unpack("<Q", struct.pack("<d", 10.0 + delay))[0])
            pc = run(0x145BD6FC5, [0x145BD6FE7, 0x145BD6FFC])
            assert (pc == 0x145BD6FE7) == (pending == 1 and delay > 4.0)
            cases += 1
    return cases


def source_guards():
    root = ROOT / "crates/azeroth-survivors-re/src"
    pick = (root / "coop/pick.rs").read_text()
    assert "now - at > 4.0" in pick and "received == 0 || received == current" in pick
    assert 'bytes.starts_with(b"{\\\"type\\\":\\\"")' in pick
    wire = (root / "coop/replication.rs").read_text()
    assert "offer: u32" in wire and "offer.to_le_bytes()" in wire
    overlay = (root / "gameplay/coop_overlay.rs").read_text()
    assert '"offer":game.choice_offer()' in overlay
    assert "choices_json(choices).into_bytes()" in overlay
    assert "cache.resumes.get(&client) != Some(&generation)" in overlay
    assert "state.pick.selected(time.elapsed_secs_f64());" in overlay
    receive = (root / "gameplay/coop.rs").read_text()
    hud = receive.split("NativeMessage::HudJson(text) if guest =>", 1)[1].split("NativeMessage::Resources", 1)[0]
    assert "state.pick.retry(time.elapsed_secs_f64());" in hud
    assert "state.pick.retry(" not in overlay
    command = (root / "gameplay/coop_commands.rs").read_text()
    assert "argument, offer, |xy|" in command and "|| stale" in command
    mechanics = (root / "gameplay/mechanics/coop.rs").read_text()
    assert "pick::admits(kind, offer, game.choice_offer())" in mechanics
    assert "choice_state: choices::ChoiceState" in mechanics
    for name in ["choices", "treasure"]:
        source = (root / f"gameplay/mechanics/{name}.rs").read_text()
        assert source.count("self.choice_state.offer = self.choice_state.offer.wrapping_add(1);") == 1


def check():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    proof = json.loads((BASE / "manifest.json").read_text())
    target = {k: v for k, v in latest_target(verify=True).items()
              if k in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"] and proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("coop_picks_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = 0
    for row in proof["ranges"]:
        start, end = int(row["start"], 0), int(row["end_exclusive"], 0)
        at = pe.rva_offset(start - pe.image_base)
        raw = image[at:at + end - start]
        assert hex(at) == row["file_offset"] and digest(raw) == row["sha256"]
        decoded = list(decoder.disasm(raw, start))
        assert sum(i.size for i in decoded) == len(raw), row["role"]
        instructions += len(decoded)
    for row in proof["data"]:
        at = pe.rva_offset(int(row["start"], 0) - pe.image_base)
        raw = bytes.fromhex(row["hex"])
        assert hex(at) == row["file_offset"] and image[at:at + len(raw)] == raw
        assert digest(raw) == row["sha256"]
    for query in proof["queries"]:
        result = json.loads(receipt(query["result"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe) == query["subject_verification"]
        assert digest(native["normalized_result"].encode()) == query["normalized_sha256"]
    cases = native_cases(image, pe, proof["ranges"])
    source_guards()
    return {"status": "passed", "target": target["sha256"],
            "queries": len(proof["queries"]), "instructions": instructions,
            "isolated_original_instruction_cases": cases,
            "compiled": False, "game_or_service_executed": False,
            "runtime_or_parity_verified": False}


def check_current():
    from unicorn import UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RIP, UC_X86_REG_RDX, UC_X86_REG_RAX
    from coverage_common import file_sha256
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.127.0/coop-picks/manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(target[key] == proof['target'][key] for key in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('current_pick_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['native_spans'] + proof['constants']:
        start = int(row['start'], 16)
        off = pe.rva_offset(start - pe.image_base)
        assert off == int(row['file_offset'], 16)
        assert digest(image[off:off + row['byte_count']]) == row['sha256']
    for query in proof['queries']:
        result = project_path(query['result']['path'])
        assert file_sha256(result) == query['result']['sha256']
        data = json.loads(result.read_text())
        native = data.get('structuredContent') or json.loads(data['content'][0]['text'])
        assert verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe) == query['subject_verification']
    Replay = load_script('pick_current_replay', ROOT / 'scripts/check-revive-choice.py').Replay
    replay = Replay(image, pe, proof)
    state, frame, output = replay.heap, replay.heap + 0x3000, replay.heap + 0x5000
    bits = lambda value: struct.unpack('<Q', struct.pack('<d', value))[0]
    ages = [-1., 0., 2.999, 3., 3.001, 7., float('nan')]
    cases = 0
    for choosing, retained, missing, requested, age, cooldown in itertools.product(
            (False, True), (False, True), (False, True), (False, True), ages, ages):
        replay.put(state + 0x10, '<QdQd', int(missing), 100. - age,
                   int(requested), 100. - cooldown)
        replay.put(state + 0x30, '<q', 0 if retained else -1)
        pc = replay.run(0x145b48ff8, [0x145b49049, 0x145b4907a],
                        {'RSI': state, 'RAX': int(choosing), 'XMM6': bits(100.)})
        expected = choosing and not retained and missing and not age < 3. and (
            not requested or not cooldown < 3.)
        assert (pc == 0x145b4907a) == expected
        if not choosing or retained:
            assert replay.get(state + 0x10, '<Q') == replay.get(state + 0x20, '<Q') == 0
        elif expected:
            assert replay.get(state + 0x28, '<d') == 100.
        cases += 1
    for choosing, retained, age in itertools.product((False, True), (False, True),
            [-1., 0., 3.999, 4., 4.001, 10., float('nan')]):
        replay.put(state, '<Qd', 1, 100. - age)
        replay.put(state + 0x30, '<qQQ', 0 if retained else -1, 0, 0)
        replay.put(output, '<qQQ', -1, 0, 0)
        replay.put(frame + 0x60, '<d', 100.)
        replay.run(0x145b490b4, [0x145b490db, 0x145b490ec, 0x145b4913b],
                   {'RDI': state, 'RSI': output, 'RSP': frame, 'RAX': int(choosing)})
        cleared = not choosing or age > 4.
        assert replay.get(state, '<Q') == (0 if cleared else 1)
        if not choosing:
            assert replay.get(state + 0x30, '<q') == -1
        cases += 1
    emitted = []
    writer_calls = {0x145d159c5, 0x145d160a6, 0x145d160b1}

    def byte_writer(uc, address, size, unused):
        if address in writer_calls:
            emitted.append(uc.reg_read(UC_X86_REG_RDX) & 255)
            uc.reg_write(UC_X86_REG_RAX, frame + 0x58)
            uc.reg_write(UC_X86_REG_RIP, address + size)

    hook = replay.u.hook_add(UC_HOOK_CODE, byte_writer)
    replay.run(0x145d159bf, [0x145d159ca], {'RBP': frame})
    replay.run(0x145d160a0, [0x145d160b7], {'RBP': frame})
    replay.u.hook_del(hook)
    assert emitted == [8, 10, 0]
    cases += 1
    for kind in [10, 11, 255]:
        replay.run(0x145d11763, [0x145d11784, 0x145d1178b], {'RDI': kind, 'RBP': frame})
        pc = replay.u.reg_read(UC_X86_REG_RIP)
        assert (pc == 0x145d11784) == (kind == 10)
        cases += 1
    replay.put(state + 0x6000, '<B', 10)
    replay.run(0x145be43b8, [0x145be44b1], {'R8': state + 0x6000})
    cases += 1
    for offer, phase in itertools.product([0, 1, 255], range(6)):
        replay.put(state + 0xd81, '<B', offer)
        replay.put(state + 0xd83, '<B', phase)
        pc = replay.run(0x145c9873e, [0x145c9875a, 0x145c987d7], {'RCX': state, 'RSI': state})
        assert (pc == 0x145c9875a) == (offer != 255 and phase == 2)
        cases += 1
    root = ROOT / 'crates/azeroth-survivors-re/src'
    pick = (root / 'coop/pick.rs').read_text()
    assert 'text.contains("\\\"phase\\\":\\\"choosing\\\"")' in pick
    assert 'self.retained = None;' in pick.split('pub fn receive_hud', 1)[1]
    assert 'now - since < 3.0' in pick and 'now - at < 3.0' in pick
    receive = (root / 'gameplay/coop.rs').read_text()
    hud = receive.split('NativeMessage::HudJson(text) if guest =>', 1)[1].split('NativeMessage::Resources', 1)[0]
    assert 'state.pick.receive_hud(&text, time.elapsed_secs_f64())' in hud
    assert 'kind: 10, argument: 0, offer: 0' in hud
    command = (root / 'gameplay/coop_commands.rs').read_text()
    assert 'matches!(kind, 0..=3 | 6 | 10)' in command
    mechanics = (root / 'gameplay/mechanics/coop.rs').read_text()
    assert '4 | 10 => true' in mechanics
    wire = (root / 'coop/replication.rs').read_text()
    assert 'if *kind > 10' in wire and 'if kind > 10' in wire
    assert 'if matches!(*kind, 0 | 3)' in wire
    return {'status': 'passed', 'target': target['version'], 'retained_queries': len(proof['queries']),
            'isolated_original_instruction_cases': cases, 'source_connections_checked': True,
            'compiled': False, 'game_or_service_executed': False, 'runtime_or_parity_verified': False}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--current', action='store_true',
                        help='Check the 0.127.0 HUD retry and Control10 contract')
    arguments = parser.parse_args()
    print(json.dumps(check_current() if arguments.current else check(), indent=2))

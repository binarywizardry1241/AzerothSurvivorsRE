#!/usr/bin/env python3
"""Check current raid graph, native gaze suppression and live source wiring.

Uses existing Unicorn for isolated original instructions and the retained
REA/Ghidra result. No compiler, Rust execution or game process is invoked.
"""

import argparse
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, project_path
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
QUEUE = (0x14594A80B, 0x14594A8AD)
QUEUE_SHA = "d77f3afb22b9dca1f8c81b56f49450e2acde1991ed4ef2c8636a200d62df04d7"
DISPATCH = 0x14591D320
PHASE = (0x14594810A, 0x14594824E)
PHASE_SHA = "5c555e4e9a78952ea9f80c14e4a591be7e136157aacc8b069a7c5b0f21153e39"
PHASE_SKIP = 0x145948761
KEPT = ROOT / "docs/analysis/evidence/0.113.2/raid-gaze"


def queue_cases(raw):
    import unicorn as u
    from unicorn import x86_const as r

    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    memory = 0x70000000
    machine.mem_map(memory, 0x100000)
    mapped, calls = set(), []

    def demand(uc, access, address, size, value, user):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True

    def hook(uc, address, size, user):
        if address == QUEUE[1]:
            uc.emu_stop()
        elif address == DISPATCH:
            payload = machine.reg_read(r.UC_X86_REG_R8)
            calls.append((machine.reg_read(r.UC_X86_REG_RDX),
                          bytes(machine.mem_read(payload, 48))))
            stack = machine.reg_read(r.UC_X86_REG_RSP)
            destination = struct.unpack("<Q", machine.mem_read(stack, 8))[0]
            machine.reg_write(r.UC_X86_REG_RSP, stack + 8)
            machine.reg_write(r.UC_X86_REG_RIP, destination)

    machine.hook_add(u.UC_HOOK_MEM_UNMAPPED, demand)
    machine.hook_add(u.UC_HOOK_CODE, hook)
    frame, queue = memory + 0x10000, memory + 0x20000
    cases = [[tag] for tag in range(256)] + [[], [12, 26, 12, 3, 26, 5],
             [3, 255, 6], [12, 26, 255, 3], [18, 12, 32, 5, 26, 33], list(range(35))]
    for tags in cases:
        records = []
        for index, tag in enumerate(tags):
            payload = bytes((index + byte) & 255 for byte in range(45)) + bytes([tag, 91, 92])
            records.append(struct.pack("<Q", 100 + index) + payload)
        queue_bytes = b"".join(records) or bytes(56)
        machine.mem_write(queue, queue_bytes)
        machine.mem_write(frame + 0x280, struct.pack("<Q", len(tags)))
        machine.mem_write(frame + 0x388, struct.pack("<Q", queue))
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_RSP, frame + 0x8000)
        machine.reg_write(r.UC_X86_REG_R12, memory + 0x40000)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        calls.clear()
        machine.emu_start(QUEUE[0], 0, count=100000)
        assert machine.reg_read(r.UC_X86_REG_RIP) == QUEUE[1]
        expected = []
        for index, tag in enumerate(tags):
            if tag == 255:
                break
            if tag not in (12, 26):
                expected.append((100 + index, records[index][8:]))
        assert calls == expected, (tags, calls, expected)
        assert bytes(machine.mem_read(queue, len(queue_bytes))) == queue_bytes
    return len(cases)


def phase_cases(raw):
    import unicorn as u
    from unicorn import x86_const as r

    assert hashlib.sha256(raw(PHASE[0], PHASE[1] - PHASE[0])).hexdigest() == PHASE_SHA
    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    memory = 0x71000000
    machine.mem_map(memory, 0x100000)
    mapped = set()

    def demand(uc, access, address, size, value, user):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True

    def hook(uc, address, size, user):
        if address in (PHASE[1], PHASE_SKIP):
            uc.emu_stop()
        elif 0x145948164 <= address < 0x1459481CC:
            raise AssertionError("Unexpected queue allocation in reserved synthetic vector")

    machine.hook_add(u.UC_HOOK_MEM_UNMAPPED, demand)
    machine.hook_add(u.UC_HOOK_CODE, hook)
    frame, actor, signature, phases, queue = [memory + n * 0x10000 for n in range(1, 6)]
    cases = [(tag, 0, 0) for tag in range(256)]
    cases += [(tag, index, 2) for tag in (12, 26, 25) for index in (7, 31)]
    for tag, index, used in cases:
        payload = bytes(range(45)) + bytes([tag, 91, 92])
        record = bytes(16) + payload + bytes(8)
        machine.mem_write(phases + 72 * index, record)
        machine.mem_write(signature + 0x20, struct.pack("<QQ", phases, index + 1))
        machine.mem_write(actor + 0xA4, struct.pack("<I", used))
        machine.mem_write(frame + 0x270, struct.pack("<QQQ", 128, queue, 0))
        machine.mem_write(frame + 0x2E8, struct.pack("<Q", 42))
        machine.mem_write(frame + 0x3A0, struct.pack("<Q", actor))
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_RSP, frame + 0x8000)
        machine.reg_write(r.UC_X86_REG_RDI, signature)
        machine.reg_write(r.UC_X86_REG_R8, actor)
        machine.reg_write(r.UC_X86_REG_R14, index)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        machine.emu_start(PHASE[0], 0, count=10000)
        expected_exit = PHASE_SKIP if tag in (12, 26) else PHASE[1]
        assert machine.reg_read(r.UC_X86_REG_RIP) == expected_exit, (tag, index)
        assert struct.unpack("<I", machine.mem_read(actor + 0xA4, 4))[0] == used | (1 << index)
        assert struct.unpack("<Q", machine.mem_read(frame + 0x280, 8))[0] == 1
        assert bytes(machine.mem_read(queue, 56)) == struct.pack("<Q", 42) + payload
    return dict(record=dict(va=hex(PHASE[0]), byte_count=PHASE[1] - PHASE[0], sha256=PHASE_SHA),
                eligible_continuation=hex(PHASE[1]), suppressed_continuation=hex(PHASE_SKIP),
                native_cases=len(cases), skipped_native_tags=[12, 26],
                phase_latch_and_full_request_preserved=True,
                announcement_callbacks_not_executed=True, assembly="phase-request.asm")


def source_checks():
    base = ROOT / "crates/azeroth-survivors-re/src"
    abilities = (base / "bosses/abilities.rs").read_text()
    body = abilities.split("pub fn queued_action_enabled(")[1].split("\n}")[0].split("-> bool {")[1]
    assert re.sub(r"\s+", "", body) == (
        "matchrecord.words[0]{13=>initial_raid_action_enabled(12),"
        "17=>super::raid_native_catalog::ACTIONS.get(record.words[1]asusize)"
        ".map_or(true,|action|initial_raid_action_enabled(action.native_tag)),_=>true,}")
    predicate = abilities.split("pub fn initial_raid_action_enabled(")[1].split("\n}")[0].split("-> bool {")[1]
    assert re.sub(r"\s+", "", predicate) == "!matches!(native_tag,12|26)"
    registry = (base / "bosses/raid_native_catalog.rs").read_text()
    rows = re.findall(r"NativeAction \{ native_tag: (\d+),.*?ability: RawBossAbility \{ words: \[([^]]+)\]", registry)
    assert len(rows) == 493
    suppressed, other_generic = [], 0
    for index, (native_tag, words) in enumerate(rows):
        native_tag = int(native_tag)
        semantic, argument, *_ = [int(word.strip(), 16) for word in words.split(",")]
        # Check every current adapter against the native contract. This is a
        # source/data trace, not execution of the Rust predicate above.
        if semantic == 17:
            assert argument == index
            other_generic += native_tag != 26
        enabled = semantic != 13 and not (semantic == 17 and int(rows[argument][0]) in (12, 26))
        assert enabled == (native_tag not in (12, 26)), (index, native_tag, semantic)
        if not enabled:
            suppressed.append(index)
    assert [index for index in suppressed if int(rows[index][0]) == 26] == [179, 428]
    assert len(suppressed) == 7 and other_generic > 0
    for path, scope, sentinel, guard, lookup in (
        ("bosses/ai.rs", "for request in requests {", "if request.ability.words[0]==u32::MAX",
         "queued_action_enabled(&request.ability)", "port.ability_actor("),
        ("gameplay/mechanics/bosses.rs", "for (actor_index, ability) in requests {", "if ability.words[0] == u32::MAX",
         "queued_action_enabled(&ability)", "port.object_counter.sequence()")):
        loop = (base / path).read_text().split(scope)[1]
        assert loop.index(sentinel) < loop.index(guard) < loop.index(lookup)
    for policy in ("queued_action_enabled", "initial_raid_action_enabled"):
        assert policy not in abilities.split("pub fn dispatch_live(")[1].split("pub fn dispatch(")[0]
        assert policy not in (base / "bosses/raid_sequences.rs").read_text()
    phases = (base / "guardians/signatures.rs").read_text().split("for (index, phase)")[1].split("let scale =")[0]
    order = ["self.phases_used |= bit", "blocking_queued |= !nonblocking(phase.native_tag)",
             "due.abilities.push(ability)", "initial_raid_action_enabled(phase.native_tag)",
             "due.phase_yells.push((index, phase.yell))"]
    assert [phases.index(token) for token in order] == sorted(phases.index(token) for token in order)
    assert "for (_phase, yell) in admitted.phase_yells" in (base / "gameplay/mechanics/guardians.rs").read_text()
    return dict(adapters_checked=493, suppressed_action_indices=suppressed,
                unrelated_generic_adapters_admitted=other_generic,
                both_live_queues_filter_before_actor_lookup=True,
                guardian_phase_emote_suppressed_after_latch_and_request=True,
                delayed_and_recursive_dispatch_unmodified=True,
                source_executed=False)


def inspect():
    # Reuse structural discovery/comparison without historical RVAs or queue
    # fixtures. The whole installed image and current queue bytes are checked.
    check = load_script("raid_gaze_graph", ROOT / "scripts/check-release-raid.py")
    check.SHA, check.VERSION = SHA, "0.113.2"
    check.QUEUE, check.QUEUE_SHA, check.DISPATCH = QUEUE, QUEUE_SHA, DISPATCH
    phase_result = {}
    def native_cases(raw):
        phase_result.update(phase_cases(raw))
        return queue_cases(raw)
    check.queue_cases = native_cases
    result = check.inspect()
    result["guardian_phase_filter"] = phase_result
    source = source_checks()
    result["source_review"] = source
    result["limits"] = [
        "Current complete data/graph comparison, bounded source tracing and isolated original queue instructions only.",
        "Synthetic frame/queue memory; dispatcher intercepted before actor lookup/effect production.",
        "No Rust execution, compilation, game process, terrain, rendering or platform/runtime observation.",
        "Retained producers/consumers and other raid dependencies keep their historical target provenance; their runtime/parity work remains open under #42/#43.",
        "Initial suppression preserves catalog roots, timer/phase collection and direct recursive/delayed dispatch; guardian phase announcements follow the same native filter."
    ]
    provenance = json.loads((KEPT / "rea-provenance.json").read_text())
    assert provenance["target_sha256"] == SHA
    assert len(provenance["operations"]) == 2
    for operation, name, extent, digest in zip(provenance["operations"],
            ("queue", "phase-request"), (QUEUE, PHASE), (QUEUE_SHA, PHASE_SHA)):
        assert operation["va"] == hex(extent[0]) and operation["input_sha256"] == digest
        assert operation["byte_count"] == extent[1] - extent[0]
        assert hashlib.sha256((KEPT / operation["pseudocode"]).read_bytes()).hexdigest() == operation["pseudocode_sha256"]
        assembly = (KEPT / (name + ".asm")).read_text()
        instructions = [re.match(r"^([0-9a-f]+): ([0-9a-f]+) ", line) for line in assembly.splitlines()]
        assert all(instructions)
        raw_bytes = b"".join(bytes.fromhex(row[2]) for row in instructions)
        assert hashlib.sha256(raw_bytes).hexdigest() == digest
        assert [int(row[1], 16) for row in instructions] == [
            extent[0] + sum(len(bytes.fromhex(prior[2])) for prior in instructions[:index])
            for index in range(len(instructions))]
    result["rea_provenance"] = "rea-provenance.json"
    result["queue_filter"]["assembly"] = "queue.asm"
    result["queue_filter"]["payload_and_queue_bytes_checked"] = True
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true", help="Write reviewed output under ignored runtime")
    parser.add_argument("--python-libs", action="append", default=[], help="Existing project-local package directory")
    arguments = parser.parse_args()
    sys.path[:0] = [str(project_path(value)) for value in arguments.python_libs]
    result = inspect()
    text = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if arguments.stage:
        out = ROOT / "runtime/native-evidence/0.113.2/raid-gaze/manifest.json"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(text)
    else:
        assert (KEPT / "manifest.json").read_text() == text, "Evidence/source changed; review and restage"
    print("PASS: current 493-node graph, 60 boss headers, 37 guardians; "
          "262 queue + 262 guardian-phase original-instruction cases; "
          "493 source adapters; no compiler/game process")


if __name__ == "__main__":
    main()

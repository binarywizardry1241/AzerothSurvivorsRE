#!/usr/bin/env python3
"""Check the current raid-hazard source gate and removal with original bytes.

Uses an already installed project-local Unicorn/Capstone directory. Synthetic
state and explicit memory/allocator seams only; no Rust, compiler or game runs.
"""

import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
STAGE = ROOT / "runtime/native-evidence/0.115.0/raid-death"
KEPT = ROOT / "docs/analysis/evidence/0.115.0/raid-death"
RANGES = {
    "source-gate": (0x145923D40, 0x145923E05,
                    "2177a8cbf0701c841978b6e811b3bff07b68d99d360abd5838fe1d5ec27204d5"),
    "cancel-admission": (0x145924020, 0x145924034,
                         "fd5fe37c4eacd997a955996b72594068dd0bf61e2be5f6ba364d3b191c63dab7"),
    "removal": (0x145927064, 0x145927198,
                "592eaaed16aef5cf3555286d0a13d39b4ca47304395295e57972d1e2a269e20e"),
    "death-write": (0x145950005, 0x145950018,
                    "6e9e1de0cf22bc341d2ae466a259e19ea3f6ab8cf096308ca962bac49ce8f352"),
    "delayed-visuals": (0x14592B940, 0x14592BABE,
                        "386ba6463b0a69e368fbfaa5bf003a025bdc315ff02bca8ea5e854a2e5f8e507"),
}
GATE_START, LIVE, CANCEL = 0x145923D55, 0x145923E05, 0x145924020
LOOP_END, BOUNDS_ERROR = 0x145926181, 0x145927F58
MEMMOVE, PREALLOC, ALLOC = 0x145D14607, 0x140002200, 0x1400021C0
UNPUBLISHED, PUBLISHED = 0x145927054, 0x145927198
SPELL_SERIALIZER = 0x1459B8330


def digest(value):
    return hashlib.sha256(value).hexdigest()


class Machine:
    BASE = 0x70000000

    def __init__(self, raw):
        import unicorn as u
        from unicorn import x86_const as r
        self.u, self.r = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64), r
        self.u.mem_map(self.BASE, 0x100000)
        self.frame, self.game, self.actors, self.rows, self.indices, self.packets = [
            self.BASE + n * 0x10000 for n in range(1, 7)]
        self.heap = self.BASE + 0x80000
        self.visited, self.seams, self.exits = set(), {}, set()
        self.raw, self.mapped = raw, set()
        self.u.hook_add(u.UC_HOOK_MEM_UNMAPPED, self.demand)
        self.u.hook_add(u.UC_HOOK_CODE, self.step)

    def demand(self, uc, access, address, size, value, user):
        # Synthetic data must be explicitly present. Only installed instruction
        # pages may be demand mapped; unexpected execution is rejected by step.
        import unicorn as u
        assert access == u.UC_MEM_FETCH_UNMAPPED, ("unmapped data", hex(address))
        first, last = address & ~4095, (address + size - 1) & ~4095
        for page in range(first, last + 4096, 4096):
            if page not in self.mapped:
                self.u.mem_map(page, 4096)
                self.u.mem_write(page, self.raw(page, 4096))
                self.mapped.add(page)
        return True

    def step(self, uc, address, size, user):
        if address in self.exits:
            uc.emu_stop()
            return
        if address in self.seams:
            self.seams[address]()
            stack = self.reg("RSP")
            destination = self.get(stack, "Q")[0]
            self.setreg("RSP", stack + 8)
            self.setreg("RIP", destination)
            return
        assert any(a <= address and address + size <= b for a, b, _ in RANGES.values()), (
            "unlisted native instruction", hex(address))
        self.visited.add(address)

    def reg(self, name):
        return self.u.reg_read(getattr(self.r, "UC_X86_REG_" + name))

    def setreg(self, name, value):
        self.u.reg_write(getattr(self.r, "UC_X86_REG_" + name), value)

    def put(self, at, fmt, *values):
        self.u.mem_write(at, struct.pack("<" + fmt, *values))

    def get(self, at, fmt):
        return struct.unpack("<" + fmt, self.u.mem_read(at, struct.calcsize("<" + fmt)))

    def reset(self):
        self.u.mem_write(self.BASE, bytes(0x100000))
        self.seams.clear()
        for name in ["RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "R8", "R9", "R10",
                     "R11", "R12", "R13", "R14", "R15"]:
            self.setreg(name, 0)
        self.setreg("RBP", self.frame)
        self.setreg("RSP", self.frame + 0x8000)
        self.setreg("EFLAGS", 2)
        self.put(self.frame + 0x238, "Q", self.game)

    def run(self, start, exits):
        self.exits = set(exits)
        self.u.emu_start(start, 0, count=100000)
        end = self.reg("RIP")
        assert end in self.exits, ("instruction limit or unexpected exit", hex(end))
        return end


def source_gate_cases(machine):
    # Includes all low-byte values plus non-byte enum values: native rejects
    # exactly dword 1, rather than every nonzero enum or any state whose low
    # byte is 1. Duplicate GUIDs continue scanning past a dead first match.
    guids = [0, 1, 0xFFFFFFFF, 0x100000000, 0x7FFFFFFFFFFFFFFF,
             0x8000000000000000, 0xFFFFFFFFFFFFFFFF]
    profiles = []
    for guid in guids:
        profiles.append((guid, []))
        for state in [0, 1, 2, 255, 256, 257, 0xFFFFFFFF]:
            profiles.append((guid, [(guid, state)]))
        for states in [(1, 0), (1, 2), (1, 1), (0, 1), (2, 1)]:
            profiles.append((guid, [(guid, state) for state in states]))
        profiles.extend((guid, rows) for rows in [
            [(guid ^ 0x55, 0)], [(guid ^ 0x55, 1), (guid, 2)],
            [(guid ^ 0x55, 0), (guid, 1)],
            [(guid ^ 0x55, 0), (guid ^ 0xAA, 0), (guid, 0)]])
    profiles += [(0xAABBCCDD11223344, [(0xAABBCCDD11223344, state)])
                 for state in range(256)]
    results = hashlib.sha256()
    for case, (guid, actors) in enumerate(profiles):
        machine.reset()
        # Distinct arbitrary kind/follow/shape data checks that the common
        # gate does not inspect or mutate any of the 128-byte hazard payload.
        payload = bytearray((case * 37 + i) & 255 for i in range(128))
        struct.pack_into("<Q", payload, 0x20, guid)
        machine.u.mem_write(machine.rows, bytes(payload))
        for index, (actor_guid, state) in enumerate(actors):
            at = machine.actors + 0x1E0 * index
            machine.put(at + 0xF0, "Q", actor_guid)
            machine.put(at + 0xB0, "I", state)
        machine.put(machine.game + 0x578, "QQ", machine.actors, len(actors))
        machine.put(machine.game + 0x5A8, "QQ", machine.rows, 1)
        machine.setreg("RBX", 1)
        actor_bytes = bytes(machine.u.mem_read(machine.actors, 0x1E0 * len(actors)))
        match = next((i for i, (value, state) in enumerate(actors)
                      if value == guid and state != 1), None)
        end = machine.run(GATE_START, [LIVE, CANCEL, LOOP_END, BOUNDS_ERROR])
        assert end == (LIVE if match is not None else CANCEL), (case, guid, actors, hex(end))
        assert machine.reg("R12") == 1 and machine.reg("R14") == 0
        if match is not None:
            assert machine.reg("RDI") == 0x1E0 * match
            assert machine.reg("R15") == machine.rows
        assert bytes(machine.u.mem_read(machine.rows, 128)) == bytes(payload)
        assert bytes(machine.u.mem_read(machine.actors, len(actor_bytes))) == actor_bytes
        results.update(struct.pack("<QQQ", guid, end, (match or 0)))
    # Index/count boundaries are checked independently of GUID admission.
    for cursor, count, hazards, expected in [(0, 0, 0, LOOP_END), (1, 1, 1, LOOP_END),
                                              (2, 1, 1, LOOP_END), (1, 2, 1, BOUNDS_ERROR)]:
        machine.reset()
        machine.put(machine.game + 0x578, "QQ", machine.actors, 1)
        machine.put(machine.game + 0x5A8, "QQ", machine.rows, hazards)
        machine.setreg("R12", cursor)
        machine.setreg("RBX", count)
        assert machine.run(GATE_START, [LIVE, CANCEL, LOOP_END, BOUNDS_ERROR]) == expected
    return dict(source_profiles=len(profiles), index_boundary_profiles=4,
                results_sha256=results.hexdigest(), hazard_and_actor_bytes_preserved=True,
                only_dead_enum_one_rejected=True, duplicate_guid_scanning_checked=True)


def cancellation_append_cases(machine):
    cases = 0
    for used in [0, 1, 3]:
        for index in [0, 1, 0xFFFFFFFF, 0xFFFFFFFFFFFFFFFF]:
            machine.reset()
            machine.put(machine.frame + 0x1B0, "QQQ", 8, machine.indices, used)
            machine.put(machine.indices, "8Q", *([0xCC] * 8))
            machine.setreg("R14", index)
            assert machine.run(CANCEL, [GATE_START]) == GATE_START
            assert machine.get(machine.frame + 0x1C0, "Q")[0] == used + 1
            assert machine.get(machine.indices + used * 8, "Q")[0] == index
            assert machine.get(machine.indices, "8Q") == tuple(
                index if i == used else 0xCC for i in range(8))
            cases += 1
    return cases


def removal_cases(machine):
    cases, packet_profiles, published_profiles = 0, 0, 0
    for index in [0, 1, 2]:
        for guid in [0, 1, 0xFFFFFFFFFFFFFFFF]:
            for published in [0, 1, 2, 255]:
                for kind in [0, 1, 3, 4, 5, 6, 7]:
                    machine.reset()
                    records = [bytearray((i * 67 + j) & 255 for j in range(128))
                               for i in range(3)]
                    struct.pack_into("<Q", records[index], 0, kind)
                    struct.pack_into("<Q", records[index], 0x28, guid)
                    records[index][0x7E] = published
                    payload = b"".join(records)
                    machine.u.mem_write(machine.rows, payload)
                    machine.put(machine.game + 0x5A8, "QQ", machine.rows, 3)
                    machine.put(machine.game + 0x630, "QQQ", 8, machine.packets, 0)
                    machine.put(machine.indices, "Q", index)
                    machine.setreg("RBX", machine.game)
                    machine.setreg("R14", machine.indices + 8)
                    calls = []

                    def move():
                        to, source, size = machine.reg("RCX"), machine.reg("RDX"), machine.reg("R8")
                        assert (to, source, size) == (machine.rows + index * 128,
                            machine.rows + (index + 1) * 128, (2 - index) * 128)
                        if size:
                            machine.u.mem_write(to, bytes(machine.u.mem_read(source, size)))
                        calls.append("move")

                    def allocate():
                        assert (machine.reg("RCX"), machine.reg("RDX")) == (32, 1)
                        machine.setreg("RAX", machine.heap)
                        calls.append("allocate")

                    machine.seams.update({MEMMOVE: move, PREALLOC: lambda: calls.append("prealloc"),
                                          ALLOC: allocate})
                    end = machine.run(RANGES["removal"][0], [UNPUBLISHED, PUBLISHED])
                    assert end == (PUBLISHED if published == 1 else UNPUBLISHED)
                    assert machine.get(machine.game + 0x5B0, "Q")[0] == 2
                    assert bytes(machine.u.mem_read(machine.rows, 256)) == b"".join(
                        row for i, row in enumerate(records) if i != index)
                    assert calls == ["move"] + (["prealloc", "allocate"] if guid else [])
                    assert machine.get(machine.game + 0x640, "Q")[0] == bool(guid)
                    if guid:
                        assert machine.get(machine.heap, "Q")[0] == guid
                        assert machine.get(machine.packets, "QQQH") == (32, machine.heap, 8, 0xAA)
                        packet_profiles += 1
                    published_profiles += published == 1
                    cases += 1
    return dict(profiles=cases, object_removal_packet_profiles=packet_profiles,
                published_marker_branch_profiles=published_profiles,
                final_hzend_serializer_executed=False,
                stable_compaction_checked=True, published_requires_exact_byte_one=True)


def death_write_cases(machine):
    cases = 0
    for old in [0, 1, 2, 0xFFFFFFFF]:
        for time_bits in [0, 0x41200000, 0x80000000, 0x7FC01234]:
            machine.reset()
            payload = bytearray((j * 37) & 255 for j in range(0x1E0))
            struct.pack_into("<I", payload, 0xB0, old)
            machine.u.mem_write(machine.actors, bytes(payload))
            machine.setreg("RCX", machine.actors)
            machine.setreg("XMM8", time_bits)
            assert machine.run(RANGES["death-write"][0], [RANGES["death-write"][1]]) == RANGES["death-write"][1]
            struct.pack_into("<II", payload, 0xB0, 1, time_bits)
            assert bytes(machine.u.mem_read(machine.actors, 0x1E0)) == bytes(payload)
            cases += 1
    return cases


def delayed_visual_cases(machine):
    cases, result_hash = 0, hashlib.sha256()
    patterns = [(), (-1.,), (1.,), (math.nan,), (-1., math.nan, 0.), (1., 0., -1.)]
    for source in [0, 1, 0xFFFFFFFFFFFFFFFF]:
        for state in [None, 0, 1, 2]:
            for now in [0., 1., math.nan]:
                for deadlines in patterns:
                    machine.reset()
                    machine.put(machine.actors + 0xF0, "Q", source)
                    machine.put(machine.actors + 0xB0, "I", state or 0)
                    machine.put(machine.game + 0x578, "QQ", machine.actors, int(state is not None))
                    machine.put(machine.game + 0x5D0, "QQQ", 8, machine.rows, len(deadlines))
                    machine.put(machine.game + 0x630, "QQQ", 8, machine.packets, 1)
                    machine.put(machine.game + 0xB9C, "f", now)
                    machine.u.mem_write(machine.packets, b"P" * 32)
                    records = [struct.pack("<QfI3fI", source, when, 200 + i,
                        float(i), 2., 3., 0x11223344) for i, when in enumerate(deadlines)]
                    if records:
                        machine.u.mem_write(machine.rows, b"".join(records))
                    wanted = [row for row, when in zip(records, deadlines) if not now >= when]
                    messages = [row[:8] + row[12:28] + bytes(8)
                                for row, when in zip(records, deadlines) if now >= when]
                    actual = []

                    def move():
                        to, origin, count = machine.reg("RCX"), machine.reg("RDX"), machine.reg("R8")
                        assert machine.rows <= to <= machine.rows + len(records) * 32
                        assert origin == to + 32 and count <= len(records) * 32
                        if count:
                            machine.u.mem_write(to, bytes(machine.u.mem_read(origin, count)))

                    def spell():
                        assert machine.reg("R9") == 8
                        actor, spell_id = machine.reg("RDX"), machine.reg("R8") & 0xFFFFFFFF
                        point = bytes(machine.u.mem_read(machine.reg("RBP") - 0x34, 12))
                        packet = struct.pack("<QI", actor, spell_id) + point + bytes(8)
                        machine.u.mem_write(machine.reg("RCX"), packet)
                        actual.append(packet)

                    machine.seams.update({MEMMOVE: move, SPELL_SERIALIZER: spell})
                    done = machine.BASE + 0xF0000
                    stack = machine.frame + 0x8008
                    machine.setreg("RSP", stack)
                    machine.setreg("RCX", machine.game)
                    machine.setreg("MXCSR", 0x1F80)
                    machine.put(stack, "Q", done)
                    actor_bytes = bytes(machine.u.mem_read(machine.actors, 0x1E0))
                    assert machine.run(RANGES["delayed-visuals"][0], [done]) == done
                    assert actual == messages
                    assert machine.get(machine.game + 0x5E0, "Q")[0] == len(wanted)
                    assert machine.get(machine.game + 0x640, "Q")[0] == 1 + len(messages)
                    assert bytes(machine.u.mem_read(machine.rows, len(wanted) * 32)) == b"".join(wanted)
                    assert bytes(machine.u.mem_read(machine.packets, 32)) == b"P" * 32
                    assert bytes(machine.u.mem_read(machine.packets + 32, len(messages) * 32)) == b"".join(messages)
                    assert bytes(machine.u.mem_read(machine.actors, 0x1E0)) == actor_bytes
                    result_hash.update(struct.pack("<QI", source, 0xFFFFFFFF if state is None else state))
                    result_hash.update(struct.pack("<f", now) + b"".join(wanted) + b"".join(messages))
                    cases += 1
    return dict(profiles=cases, results_sha256=result_hash.hexdigest(),
                absent_dead_live_sources_share_deadline_behavior=True,
                nan_clock_and_deadline_retained=True, stable_queue_compaction_and_publication_checked=True,
                serializer_executed=False)


def source_checks():
    base = ROOT / "crates/azeroth-survivors-re/src"
    source = (base / "bosses/raid_areas.rs").read_text()
    body = source.split("fn tick_areas(", 1)[1].split("impl Area {", 1)[0]
    # This check is deliberately confined to the corrected common admission,
    # not a translation/execution of the remaining hazard implementation.
    loop = body.split("while index < self.rows.len() {", 1)[1]
    gate = loop.index("port.raid_source(row.source)")
    assert gate < loop.index("if now < row.follow_player_until")
    assert gate < loop.index("row.advance_extra(")
    before_mutation = loop[gate:loop.index("if now < row.follow_player_until")]
    for token in ["ended.push(row.removal(original_indices[index]))",
                  "self.rows.remove(index)", "original_indices.remove(index)", "continue"]:
        assert token in before_mutation, token
    cleanup = source.split("fn removal(&mut self, index: usize)", 1)[1].split("fn danger(", 1)[0]
    for token in ["Extra::Aftershock", "object.take()", "published: self.published", "id: self.id"]:
        assert token in cleanup, token
    assert 'ended.into_iter().rev()' in body
    publication = body.split("for row in ended.into_iter().rev() {", 1)[1].split('let mut clock =', 1)[0]
    assert publication.index("port.remove_ground_object(guid)") < publication.index('"type":"hzend"')
    assert 'if row.published { port.raid_marker(' in publication
    extra = (base / "bosses/raid_extra.rs").read_text().split("Extra::Aftershock {", 2)[-1]
    assert "port.remove_ground_object(" not in extra
    port = (base / "gameplay/mechanics/bosses.rs").read_text()
    lookup = port.split("fn raid_source(&self, guid: u64)", 1)[1].split("fn raid_source_scale", 1)[0]
    assert lookup.count("!row.actor.dead") == 3
    for token in ["self.bosses.iter()", "self.actors.iter()", "self.wards.actors.iter()"]:
        assert token in lookup
    visuals = (base / "bosses/raid_actions.rs").read_text().split("pub fn advance(", 1)[1].split("#[cfg(test)]", 1)[0]
    assert "raid_source(" not in visuals and "port.cast_spell(" in visuals
    return dict(common_gate_before_row_mutation=True, existing_live_source_port_reused=True,
                aftershock_object_cleanup_and_published_end_traced=True,
                independent_delayed_visual_queue_preserved=True, source_executed=False)


def prepare_rea():
    """Recreate the exact bounded input and durable query, without launching REA."""
    target = latest_target(verify=True)
    assert target["version"] == "0.115.0" and target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("raid_death_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    offset = pe.rva_offset(GATE_START - pe.image_base)
    value = data[offset:offset + LIVE - GATE_START]
    assert digest(value) == "913c11df87a209d1bb502440e4f2c4c7d72c41193c2888448275596d4508fdab"
    directory = ROOT / "runtime/raid-death-0.115.0"
    directory.mkdir(parents=True, exist_ok=True)
    (directory / "source-gate.bin").write_bytes(value)
    plan = dict(target="runtime/raid-death-0.115.0/source-gate.bin",
        output="runtime/raid-death-0.115.0/rea-source-gate", init_timeout=60, timeout=240,
        open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(GATE_START)),
        operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(GATE_START)),
                         label="source-gate")])
    (directory / "source-gate-plan.json").write_text(json.dumps(plan, indent=2) + "\n")
    print("Prepared runtime/raid-death-0.115.0/source-gate-plan.json; no native query/game run")


def check_rea(raw, directory):
    proof = json.loads((directory / "rea-provenance.json").read_text())
    assert proof["target_sha256"] == SHA and proof["target_executed"] is False
    assert proof["provider"] == dict(id="ghidra", name="Ghidra", version="12.1.4")
    operation, = proof["operations"]
    assert operation["operation"] == "procedure_pseudo_code"
    assert int(operation["va"], 0) == GATE_START
    assert operation["byte_count"] == LIVE - GATE_START
    assert digest(raw(GATE_START, LIVE - GATE_START)) == operation["input_sha256"]
    assert operation["pseudocode"] == "source-gate.c"
    assert digest((directory / operation["pseudocode"]).read_bytes()) == operation["pseudocode_sha256"]


def inspect(stage=False):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert target["version"] == "0.115.0" and target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("raid_death_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert pe.rva_offset(address + count - 1 - pe.image_base) == offset + count - 1
        value = data[offset:offset + count]
        assert len(value) == count
        return value

    ranges, assembly = {}, []
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for name, (start, end, sha) in RANGES.items():
        value = raw(start, end - start)
        assert digest(value) == sha, name
        decoded = list(decoder.disasm(value, start))
        assert sum(i.size for i in decoded) == len(value)
        assembly.extend(f"{i.address:x}: {bytes(i.bytes).hex()} {i.mnemonic} {i.op_str}".rstrip()
                        for i in decoded)
        ranges[name] = dict(va=hex(start), end_exclusive=hex(end),
                           file_offset=hex(pe.rva_offset(start - pe.image_base)),
                           byte_count=end - start, sha256=sha)
    check_rea(raw, STAGE if stage else KEPT)
    machine = Machine(raw)
    result = dict(schema_version=1,
        target={key: target[key] for key in ["version", "path", "sha256", "size_bytes"]},
        gap_ids=[42], lead="HAZARD01", target_process_executed=False,
        native_ranges=ranges, source_gate=source_gate_cases(machine),
        cancellation_append_profiles=cancellation_append_cases(machine),
        removal=removal_cases(machine), death_write_profiles=death_write_cases(machine),
        delayed_visuals=delayed_visual_cases(machine),
        source_review=source_checks(),
        visited_instructions=len(machine.visited), assembly="selected-native.asm",
        rea_provenance="rea-provenance.json",
        explicit_seams={hex(MEMMOVE): "Reserved synthetic vector's overlapping move with exact argument checks",
            hex(PREALLOC): "Allocator preparation; no native OS/library body executes",
            hex(ALLOC): "Return one reserved 32-byte synthetic packet allocation; size/alignment checked",
            hex(SPELL_SERIALIZER): "Capture source/spell/position and return a reserved opaque 32-byte descriptor; actual spell serializer does not execute"},
        limits=["Only the common hazard source-admission and selected removal fragments execute with synthetic memory.",
            "The live-source continuation stops before movement, terrain or kind-specific behavior; source enum state is checked as the original dword, rejecting only 1.",
            "Removal executes native compaction argument setup, count update and optional opcode 0xaa object-removal descriptor construction, with memory movement/allocation seams.",
            "The complete delayed-visual consumer executes with reserved source/output vectors; memmove and spell-packet construction are explicit seams. Current dead/missing source cases retain its independent lifetime.",
            "The published-byte branch stops before hzend formatting; no packet serializer, actual client, terrain, original/rebuilt game or Rust implementation executes.",
            "Static source guards establish placement/connections only. Compilation, runtime timing, presentation and original/rebuilt parity remain unverified."])
    text = json.dumps(result, indent=2) + "\n"
    asm = "\n".join(assembly) + "\n"
    if stage:
        STAGE.mkdir(parents=True, exist_ok=True)
        (STAGE / "manifest.json").write_text(text)
        (STAGE / "selected-native.asm").write_text(asm)
    else:
        assert (KEPT / "manifest.json").read_text() == text, "Evidence/source changed; review and restage"
        assert (KEPT / "selected-native.asm").read_text() == asm
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true", help="Write reviewed evidence under ignored runtime")
    parser.add_argument("--prepare-rea", action="store_true", help="Prepare the exact raw input/query under runtime")
    parser.add_argument("--python-libs", action="append", default=[], help="Existing project-local package directory")
    args = parser.parse_args()
    sys.path[:0] = [str(project_path(value)) for value in args.python_libs]
    if args.prepare_rea:
        prepare_rea()
        return
    result = inspect(args.stage)
    print("PASS: " + json.dumps({key: result[key] for key in ["source_gate", "cancellation_append_profiles", "removal", "death_write_profiles", "delayed_visuals"]})
          + "; no compiler/Rust/game process")


if __name__ == "__main__":
    main()

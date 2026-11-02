#!/usr/bin/env python3
"""Check bounded guest loot/Tester/receiver contracts without compiling or a game.

Original instruction islands run with synthetic state and explicit data-copy,
allocation and interface-call seams. Mutexes, native services and Rust do not run.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import itertools
import json
import struct

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as reg

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

HERE = ROOT / "docs/analysis/evidence/0.120.0/gear-receiver"
SHA = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
RANGES = [
    ("ownership-and-newness", 0x145B023FC, 0x145B025CA),
    ("guest-notice-or-local-queue", 0x145B02AB8, 0x145B02B4D),
    ("ownership-dirty-accumulator", 0x145B02B81, 0x145B02B9E),
    ("save-admission", 0x145B02C33, 0x145B02C3C),
    ("constructor-receiver-arguments", 0x145B064ED, 0x145B06505),
    ("constructor-receiver-fields", 0x145B06C09, 0x145B06C25),
    ("app-receiver-installation", 0x14002BE7F, 0x14002BE9A),
    ("receiver-owned-string-copy-and-append", 0x145ACEF85, 0x145ACF05A),
    ("guest-lifecycle-admission", 0x145B26ED9, 0x145B26EF6),
    ("guest-grant-budget-and-dispatch", 0x145B26F49, 0x145B26F9D),
    ("frontend-drop-discriminator", 0x14027972B, 0x140279737),
    ("frontend-drop-value-and-time-queues", 0x14027A2E5, 0x14027A3C5),
]


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def query_receipts():
    rows = json.loads((HERE / "queries.json").read_text())
    expected = {"0x145b022d0", "0x145b064c0", "0x145b28a90", "0x145ae9390",
                "0x14002bd20", "0x145aceed0", "0x145b261f0", "0x140278d90", "0x140231310"}
    assert {row["procedure"] for row in rows} == expected and len(rows) == len(expected)
    for row in rows:
        expected_role = "supporting-Drops-page-navigation-context" if row["procedure"] == "0x140231310" else "receiver-or-drop-queue"
        assert row["role"] == expected_role
        journal = json.loads((ROOT / row["journal"]).read_text())
        assert sha(json.dumps(journal["identity"], sort_keys=True,
                              separators=(",", ":")).encode()) == row["query_identity_sha256"]
        operation = journal["operations"][row["operation_id"]]
        assert operation["status"] == "completed" and operation["result"] == row["result"]
        assert operation["arguments"] == dict(procedure=row["procedure"])
        raw = (ROOT / row["result"]["path"]).read_bytes()
        assert sha(raw) == row["result"]["sha256"]
        result = json.loads(raw)["structuredContent"]
        assert result["subject"]["digest"]["sha256"] == SHA
        assert result["provider"]["id"] == "ghidra"
        assert result["evidence_id"] == row["evidence_id"]
        assert result["analysis_profile"]["digest"] == row["analysis_profile_sha256"]
    return rows


class Machine:
    heap, stack = 0x200000000, 0x300000000

    def __init__(self, image, pe):
        self.cpu = Uc(UC_ARCH_X86, UC_MODE_64)
        size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
        self.cpu.mem_map(pe.image_base, (size + 4095) & ~4095)
        for s in pe.sections:
            self.cpu.mem_write(pe.image_base + s["rva"], image[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
        for address in (self.heap, self.stack):
            self.cpu.mem_map(address, 0x20000)
        self.count, self.stops, self.stubs = 0, set(), {}
        self.cpu.hook_add(UC_HOOK_CODE, self.hook)

    def hook(self, cpu, pc, size, unused):
        if pc in self.stops:
            cpu.emu_stop()
        elif pc in self.stubs:
            self.stubs[pc]()
            sp = self.get("RSP")
            self.set("RSP", sp + 8)
            self.set("RIP", self.q(sp))
        else:
            assert any(a <= pc < b for _, a, b in RANGES), hex(pc)
            self.count += 1

    def reset(self):
        self.cpu.mem_write(self.heap, bytes(0x20000))
        self.cpu.mem_write(self.stack, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            self.set(name, 0)
        for i in range(16):
            self.set(f"XMM{i}", 0)
        self.set("RSP", self.stack + 0x1F000)
        self.set("RBP", self.stack + 0x1000)
        self.set("MXCSR", 0x1F80)
        self.set("EFLAGS", 2)
        self.stubs = {}

    def set(self, name, value):
        self.cpu.reg_write(getattr(reg, "UC_X86_REG_" + name), value)

    def get(self, name):
        return self.cpu.reg_read(getattr(reg, "UC_X86_REG_" + name))

    def putq(self, at, value):
        self.cpu.mem_write(at, struct.pack("<Q", value))

    def putu(self, at, value):
        self.cpu.mem_write(at, struct.pack("<I", value))

    def q(self, at):
        return struct.unpack("<Q", self.cpu.mem_read(at, 8))[0]

    def byte(self, at):
        return self.cpu.mem_read(at, 1)[0]

    def run(self, start, *stops):
        self.stops = set(stops)
        self.cpu.emu_start(start, 0, count=10000)
        assert self.get("RIP") in self.stops, hex(self.get("RIP"))
        return self.get("RIP")

    def copy(self):
        self.cpu.mem_write(self.get("RCX"), bytes(self.cpu.mem_read(self.get("RDX"), self.get("R8"))))
        self.set("RAX", self.get("RCX"))


def native_cases(m):
    records = []
    for receiver, table in itertools.product([0, m.heap + 0x5000], [0, 0x146175030]):
        m.reset()
        m.set("RCX", m.heap)
        m.set("RDX", receiver)
        m.set("R8", table)
        m.set("R9", 0x11223344)
        m.run(0x145B064ED, 0x145B06505)
        assert m.get("RSI") == m.heap
        assert m.q(m.get("RBP") + 0x838) == receiver
        assert m.q(m.get("RBP") + 0x830) == table
        m.run(0x145B06C09, 0x145B06C25)
        assert m.q(m.heap + 0x17B8) == receiver and m.q(m.heap + 0x17C0) == table
        records.append(["constructor-receiver", receiver, table])
    for receiver in [m.heap + 0x5000, m.heap + 0x6000]:
        m.reset()
        m.set("RAX", receiver)
        calls = []
        m.stubs[0x145AE9390] = lambda: calls.append([m.get("RDX"), m.get("R8"), m.get("R9")])
        m.run(0x14002BE7F, 0x14002BE9A)
        assert calls == [[13, receiver, 0x146175030]]
        records.append(["app-receiver-table", receiver])
    # Lookup is an explicit seam: these cases begin after a valid item descriptor.
    for guid, initial, items in itertools.product(
            [0, 1, 0xFFFFFF, 0xFFFFFFFFFFFFFFFF], [[], [5], [1, 5, 9]],
            [[], [5], [6], [5, 5], [7, 5, 7], [0, 0xFFFFFFFF]]):
        m.reset()
        state, owned, frame = m.heap, m.heap + 0x4000, m.get("RBP")
        m.putq(state + 0x1050, 128)
        m.putq(state + 0x1058, owned)
        m.putq(state + 0x1060, len(initial))
        for i, item in enumerate(initial):
            m.putu(owned + i * 4, item)
        m.putq(frame + 0x58, guid)
        m.putq(frame + 0x60, state + 0x1050)
        m.putq(frame + 0x110, state)
        m.stubs[0x145FA3AB7] = m.copy
        expected, observed_new, dirty = sorted(initial), [], False
        for item in items:
            m.set("R12", state)
            m.set("RDI", item)
            m.run(0x145B023FC, 0x145B02543, 0x145B025C2)
            new = item not in expected
            if guid != 0xFFFFFF and new:
                expected = sorted(expected + [item])
            observed_new.append(m.byte(frame + 0x158))
            assert bool(observed_new[-1]) == new
            assert bool(m.byte(frame + 0x157)) == (guid != 0xFFFFFF)
            actual = [struct.unpack("<I", m.cpu.mem_read(owned + i * 4, 4))[0]
                      for i in range(m.q(state + 0x1060))]
            assert actual == expected
            m.run(0x145B02B81, 0x145B02B9E)
            dirty |= new and guid != 0xFFFFFF
            assert bool(m.byte(frame + 0xF8) & 1) == dirty
        destination = m.run(0x145B02C33, 0x145B02C3C, 0x145B02CB8)
        assert (destination == 0x145B02C3C) == dirty
        records.append(["ownership", guid, initial, items, observed_new, expected, dirty])

    for mode, length in itertools.product([0, 1, 2, 3, 0xFFFFFFFF], [0, 1, 11, 65]):
        m.reset()
        state, payload, queue, frame = m.heap, m.heap + 0x4000, m.heap + 0x6000, m.get("RBP")
        m.putu(state + 0x10, mode)
        m.putq(state + 0x17B8, m.heap + 0x5000)
        m.putq(state + 0x17C0, 0x146175030)
        m.putq(state + 0x668, 8)
        m.putq(state + 0x670, queue)
        m.putq(frame + 0x148, length)
        m.putq(frame + 0x118, payload)
        m.set("R12", state)
        m.set("RDX", payload)
        m.set("R13", length)
        calls = []
        m.stubs[0x145ACEED0] = lambda: calls.append([m.get("RCX"), m.get("RDX"), m.get("R8")])
        m.stubs[0x1400021D0] = lambda: None  # source String deallocation seam
        m.run(0x145B02AB8, 0x145B02B4D)
        assert calls == ([[m.heap + 0x5000, payload, length]] if mode == 2 else [])
        assert m.q(state + 0x678) == (0 if mode == 2 else 1)
        if mode != 2:
            assert [m.q(queue + i * 8) for i in range(3)] == [length, payload, length]
        records.append(["delivery", mode, length, len(calls)])

    for used, count in itertools.product([0, 1, 63, 64, 65, 0xFFFFFFFFFFFFFFFF], [0, 1, 2, 63, 64, 65, 128]):
        m.reset()
        frame = m.get("RBP")
        m.set("RSI", m.heap)
        m.set("RBX", 4)
        m.putq(m.heap + 0xFC0, used)
        m.putq(frame + 0x3E0, count)
        calls = []
        m.stubs[0x145B022D0] = lambda: calls.append([m.get("RCX"), m.get("RDX"), m.get("R8") & 255])
        m.run(0x145B26F49, 0x145B26F9D)
        admitted = min(count, max(64 - used, 0))
        assert m.q(frame + 0x3E0) == admitted and m.q(m.heap + 0xFC0) == used + admitted
        assert calls == [[m.heap, frame + 0x3D0, 4]]
        records.append(["guest-budget", used, count, admitted])

    for lifecycle_state, sender in itertools.product([0, 1, 2, 3, 0xFFFFFFFF], [0, 1, 2]):
        m.reset()
        m.set("RSI", m.heap)
        m.putu(m.heap + 0xCA0, lifecycle_state)
        m.putq(m.heap + 0xFA8, sender)
        dest = m.run(0x145B26ED9, 0x145B26EF6, 0x145B2708E)
        assert (dest == 0x145B26EF6) == (lifecycle_state <= 1 and sender != 0)
        records.append(["guest-admission", lifecycle_state, sender, dest])

    for payload, head, count in itertools.product(
            [b"", b"x", b'{"type":"drop","new":true}', 'loot: \u017e'.encode()], [0, 7], [0, 1]):
        m.reset()
        frame, queue, incoming, copied, rows = m.get("RBP"), m.heap, m.heap + 0x4000, m.heap + 0x5000, m.heap + 0x6000
        m.cpu.mem_write(incoming, payload)
        for at, value in [(queue + 0x18, 8), (queue + 0x20, rows), (queue + 0x28, head),
                          (queue + 0x30, count), (frame - 0x30, incoming), (frame - 0x28, len(payload))]:
            m.putq(at, value)
        m.set("R15", queue)
        m.stubs[0x140002200] = lambda: None
        m.stubs[0x1400021C0] = lambda: m.set("RAX", copied)
        m.stubs[0x145FA3AAB] = m.copy
        m.run(0x145ACEF85, 0x145ACF05A)
        slot = rows + ((head + count) % 8) * 24
        ptr = m.q(slot + 8)
        assert [m.q(slot), ptr, m.q(slot + 16)] == [len(payload), copied if payload else 1, len(payload)]
        assert m.q(queue + 0x30) == count + 1
        if payload:
            m.cpu.mem_write(incoming, b"!" * len(payload))
            assert bytes(m.cpu.mem_read(ptr, len(payload))) == payload
        records.append(["owned-string", payload.hex(), head, count])

    for word in [b"drop", b"Drop", b"drap", bytes(4), b"noop"]:
        m.reset()
        m.cpu.mem_write(m.heap, word)
        m.set("RAX", m.heap)
        dest = m.run(0x14027972B, 0x140279737, 0x14027A430)
        assert (dest == 0x140279737) == (word == b"drop")
        records.append(["drop-discriminator", word.hex(), dest])

    for count, timestamp in itertools.product([0, 1, 7], [0.0, 1.25, 37.5]):
        m.reset()
        frame, front, rows, timed, flag = m.get("RBP"), m.heap, m.heap + 0x4000, m.heap + 0x6000, m.heap + 0x8000
        value, original = bytes(range(32)), bytes(range(32, 64))
        m.cpu.mem_write(frame + 0x150, value)
        m.cpu.mem_write(frame + 0x130, original)
        m.putq(frame + 0x90, front + 0x28)
        m.putq(frame + 0x100, front + 0x18)
        m.putq(frame + 0x1C0, front)
        m.putq(frame + 0x1B0, flag)
        m.putu(frame + 0x1D0, 1)
        for at, value in [(front + 0x18, 8), (front + 0x20, rows), (front + 0x28, count),
                          (front + 0x30, 8), (front + 0x38, timed), (front + 0x40, count)]:
            m.putq(at, value)
        m.set("RBX", 0)
        m.set("XMM6", struct.unpack("<I", struct.pack("<f", timestamp))[0])
        m.run(0x14027A2E5, 0x14027A3C5)
        assert bytes(m.cpu.mem_read(rows + count * 32, 32)) == bytes(range(32))
        assert bytes(m.cpu.mem_read(timed + count * 40, 32)) == original
        assert bytes(m.cpu.mem_read(timed + count * 40 + 32, 4)) == struct.pack("<f", timestamp)
        assert m.q(front + 0x28) == count + 1 and m.q(front + 0x40) == count + 1
        records.append(["frontend-value-time", count, timestamp])

    return dict(native_cases=len(records), original_instructions=m.count,
                result_stream_sha256=sha(json.dumps(records, separators=(",", ":")).encode()),
                case_groups={kind: sum(row[0] == kind for row in records) for kind in sorted({row[0] for row in records})})


def source_connections():
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/coop.rs").read_text()
    start = source.index("fn receive_equipment_grants(")
    opening = source.index("{", start)
    depth, end = 1, opening + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    helper = source[start:end]
    required = ["fn receive_equipment_grants(", "GearSave::read(&menu.backend_save).owned",
                "RunEvent::EquipmentLoot", "game.events.extend(events);", "self.pending_events.extend(events);",
                "state.receive_equipment_grants(&mut run, &mut menu, &ids);",
                "game.events.extend(std::mem::take(&mut state.pending_events));", "self.pending_events.clear();"]
    for fragment in required:
        assert fragment in source, fragment
    gate_present = "guid != crate::startup::TESTER_GUID" in helper
    tester_contract = None
    if gate_present:
        compact = "".join("\n".join(line.split("//", 1)[0] for line in helper.splitlines()).split())
        gates = [
            "let retain = self.entry.and_then(|entry| entry.roster_guid).is_some_and(|guid| guid != crate::startup::TESTER_GUID);",
            "let mut owned = crate::armory::GearSave::read(&menu.backend_save).owned;",
            "let mut dirty = false;",
            """let events = ids.iter().map(|&id| {
                let is_new = !owned.contains(&id);
                if is_new && retain { owned.insert(id); dirty = true; }
                RunEvent::EquipmentLoot { id, is_new }
            }).collect::<Vec<_>>();""",
            "if dirty { menu.backend_save.add_equipment(ids); menu.commit_account(); }",
        ]
        positions = [compact.index("".join(fragment.split())) for fragment in gates]
        assert positions == sorted(positions), "Captured identity/newness/Save order changed"
        assert compact.count(".add_equipment(") == 1 and compact.count(".commit_account(") == 1
        startup = (ROOT / "crates/azeroth-survivors-re/src/startup.rs").read_text()
        assert "const TESTER_GUID: u64 = 0x00ff_ffff;" in startup
        tester_contract = dict(fragments=gates, fragment_sha256=sha("\n".join(gates).encode()),
                               tester_guid="0xffffff", account_write="only-if-new-and-retained",
                               newness="checked-before-optional-insertion-per-item")
    return dict(path="crates/azeroth-survivors-re/src/gameplay/coop.rs", fragments=required,
                fragment_sha256=sha("\n".join(required).encode()),
                tester_save_gate_present=gate_present, tester_contract=tester_contract)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-proof", action="store_true")
    parser.add_argument("--require-tester-source", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("gear_receiver_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    ranges, listings = [], []
    for role, start, end in RANGES:
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        decoded = list(decoder.disasm(raw, start))
        assert sum(x.size for x in decoded) == len(raw), role
        listing = "".join(f"{x.address:016x} {x.bytes.hex():24s} {x.mnemonic} {x.op_str}".rstrip() + "\n" for x in decoded)
        ranges.append(dict(role=role, start=hex(start), end_exclusive=hex(end), file_offset=hex(offset),
                           byte_count=len(raw), sha256=sha(raw), instructions=len(decoded)))
        listings.append(f"; {role} {hex(start)}..{hex(end)} sha256 {sha(raw)}\n" + listing)
    table = image[pe.rva_offset(0x146175030 - pe.image_base):pe.rva_offset(0x146175030 - pe.image_base) + 32]
    assert struct.unpack_from("<Q", table, 24)[0] == 0x145ACEED0
    table_section = next(s for s in pe.sections if s["rva"] <= 0x146175030 - pe.image_base < s["rva"] + s["virtual_size"])
    assert not int(table_section["characteristics"], 16) & 0x80000000
    literals = []
    for site, text in [(0x145B028C5, b"drop"), (0x145B028EE, b"type"), (0x145B02918, b"name"),
                       (0x145B02958, b"rarity"), (0x145B029AA, b"icon"), (0x145B029F7, b"slot"),
                       (0x145B02A0D, b"new")]:
        off = pe.rva_offset(site - pe.image_base)
        ins = next(decoder.disasm(image[off:off + 15], site))
        address = site + ins.size + ins.operands[-1].mem.disp
        litoff = pe.rva_offset(address - pe.image_base)
        assert image[litoff:litoff + len(text)] == text
        literals.append(dict(site=hex(site), address=hex(address), bytes=text.decode(), sha256=sha(text)))
    source = source_connections()
    if args.require_tester_source:
        assert source["tester_save_gate_present"] and source["tester_contract"], "Tester account-save gate remains unimplemented"
    proof = dict(schema_version=1, target=dict(version=target["version"], sha256=SHA), gap_ids=[41, 192, 193],
                 lead_id="Q41-F01:site=0x145b02ada", native_ranges=ranges,
                 receiver_table=dict(address="0x146175030", byte_count=32, sha256=sha(table), method_18="0x145aceed0",
                                     section=table_section["name"], characteristics=table_section["characteristics"]),
                 payload_literals=literals, queries=query_receipts(), source_connections=source,
                 checks=native_cases(Machine(image, pe)),
                 limits=["Original instruction islands with synthetic preallocated vectors, roster/state fields and finite byte payloads.",
                         "Item lookup/filter, allocation/copy/deallocation and interface delivery are explicit seams; no mutex/service/thread/packet/renderer execution.",
                         "Source guards do not compile or execute Rust; current UI/network/gameplay and original/rebuilt parity remain unverified."])
    if args.write_proof:
        HERE.mkdir(parents=True, exist_ok=True)
        (HERE / "native.asm").write_text("\n".join(listings))
        (HERE / "proof.json").write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert (HERE / "native.asm").read_text() == "\n".join(listings)
        assert portable_record(json.loads((HERE / "proof.json").read_text())) == portable_record(proof)
    print(f"PASS {proof['checks']['native_cases']} native cases / {proof['checks']['original_instructions']} instructions; "
          f"Tester source gate={source['tester_save_gate_present']}; compilation/runtime/parity unverified")


if __name__ == "__main__":
    main()

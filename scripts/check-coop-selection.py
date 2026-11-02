#!/usr/bin/env python3
"""Check current lobby/party selection wire, eligibility and live source wiring.

Selected original instructions execute only in isolated synthetic memory. No
application compilation, socket, game, service or installed-data mutation.
"""
import hashlib
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/0.123.0/coop-selection"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def replay(ranges):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def put(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in mapped:
                uc.mem_map(page, 4096)
                mapped.add(page)
        uc.mem_write(address, raw)

    for row in ranges:
        put(int(row["start"], 0), bytes.fromhex(row["hex"]))
    memory, stack = 0x22000000, 0x23000000
    put(memory, bytes(0x8000))
    put(stack, bytes(0x10000))
    writers = {0x145e640f0: 1, 0x145e64290: 4, 0x145e642f0: 8, 0x145e64190: "bytes"}
    for address in writers:
        put(address, b"\xc3")
    output, stop = bytearray(), 0

    def hook(machine, address, _size, _context):
        if address == stop:
            machine.emu_stop()
        elif address in writers:
            value = machine.reg_read(reg.UC_X86_REG_RDX)
            kind = writers[address]
            if kind == "bytes":
                length = machine.reg_read(reg.UC_X86_REG_R8)
                output.extend(struct.pack("<I", length))
                if length:
                    output.extend(machine.mem_read(value, length))
            else:
                output.extend((value & ((1 << (8 * kind)) - 1)).to_bytes(kind, "little"))
            machine.reg_write(reg.UC_X86_REG_RAX, machine.reg_read(reg.UC_X86_REG_RCX))

    uc.hook_add(UC_HOOK_CODE, hook)

    def run(start, end):
        nonlocal stop
        stop = end
        put(end, b"\xcc")  # Synthetic stop marker; never executed.
        uc.reg_write(reg.UC_X86_REG_RSP, stack + 0x8000)
        try:
            uc.emu_start(start, end + 1, count=10000)
        except Exception as error:
            raise AssertionError((hex(start), hex(end), hex(uc.reg_read(reg.UC_X86_REG_RIP)), output.hex())) from error
        assert uc.reg_read(reg.UC_X86_REG_RIP) == end, (hex(start), hex(end), hex(uc.reg_read(reg.UC_X86_REG_RIP)), output.hex())

    def word(address, value, width=8):
        uc.mem_write(address, value.to_bytes(width, "little"))

    eligibility_cases = 0
    for selected in [0, 1, 3, 5, 255]:
        for cap in [0, 1, 3, 5]:
            for zone in [0, 2, 11]:
                for opened in [0, 1, 3, 12]:
                    for remote in [None, 0, 2, 5, 255]:
                        host, peer, unlocks = memory, memory + 0x3000, memory + 0x6000
                        word(host + 0x1468, selected, 4)
                        word(peer - 0x1e, opened, 1)
                        word(peer - 0x210, 0 if remote is None else 12)
                        word(peer - 0x218, unlocks)
                        uc.mem_write(unlocks, bytes([remote or 0]) * 12)
                        uc.reg_write(reg.UC_X86_REG_R13, host)
                        uc.reg_write(reg.UC_X86_REG_R15, peer)
                        uc.reg_write(reg.UC_X86_REG_RBX, zone)
                        uc.reg_write(reg.UC_X86_REG_RAX, cap)
                        run(0x145caaa72, 0x145caaab7)
                        observed = uc.reg_read(reg.UC_X86_REG_RBX) & 255
                        expected = zone < opened and min(selected, cap, 5) <= (remote or 0)
                        assert observed == expected, (selected, cap, zone, opened, remote)
                        eligibility_cases += 1

    wire_cases = 0
    for count in [0, 1, 5]:
        for rank in [0, 3, 255]:
            snapshot, rows, names, zone = memory, memory + 0x3000, memory + 0x5000, b"sm"
            word(snapshot + 0x10, rows)
            word(snapshot + 0x18, count)
            word(snapshot + 0x28, memory + 0x7000)
            word(snapshot + 0x30, len(zone))
            word(snapshot + 0x38, rank, 1)
            uc.mem_write(memory + 0x7000, zone)
            expected = bytearray([17]) + struct.pack("<I", count)
            for index in range(count):
                row = rows + index * 0x98
                name = ("Hero" if index != 1 else "Héro").encode()
                uc.mem_write(names + index * 32, name)
                word(row + 8, names + index * 32)
                word(row + 0x10, len(name))
                word(row + 0x18, (1 << 64) - 1)  # No optional profile.
                word(row + 0x88, 100 + index)
                word(row + 0x90, 50 + index, 4)
                word(row + 0x94, index % 2, 1)
                word(row + 0x95, 8, 1)
                word(row + 0x96, 1, 1)
                expected.extend(struct.pack("<QI", 100 + index, len(name)) + name)
                expected.extend(bytes([8, 1, 0]) + struct.pack("<I", 50 + index) + bytes([index % 2]))
            expected.extend(struct.pack("<I", len(zone)) + zone + bytes([rank]))
            output.clear()
            uc.reg_write(reg.UC_X86_REG_RDI, snapshot)
            uc.reg_write(reg.UC_X86_REG_RBP, stack + 0x7000)
            run(0x145ccbb20, 0x145ccbf70)
            assert output == expected, (count, rank, output.hex(), expected.hex())
            wire_cases += 1

    rank_cases = 0
    for rank in range(256):
        uc.reg_write(reg.UC_X86_REG_RBP, stack + 0x7000)
        word(stack + 0x6fe0, rank, 4)
        run(0x145c306e0, 0x145c306f0)
        assert uc.mem_read(stack + 0x6fe0, 1)[0] == min(rank, 5)
        # The directory extension distinguishes EOF (unknown) from a present0.
        for present in [False, True]:
            row, source = memory + 0x3000, memory + 0x7000
            word(row + 0xc0, 0, 2)
            word(source, rank, 1)
            uc.reg_write(reg.UC_X86_REG_R15, row)
            uc.reg_write(reg.UC_X86_REG_R9, source)
            uc.reg_write(reg.UC_X86_REG_R8, 0)
            uc.reg_write(reg.UC_X86_REG_R10, int(present))
            run(0x145e65d35, 0x145e65deb)
            observed = tuple(uc.mem_read(row + 0xc0, 2))
            assert observed == ((1, min(rank, 5)) if present else (0, 0))
        rank_cases += 3
    return {"eligibility_cases": eligibility_cases, "tag17_wire_cases": wire_cases,
            "receiver_and_directory_rank_cases": rank_cases}


def check():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    proof = json.loads((BASE / "manifest.json").read_text())
    target = {k: v for k, v in latest_target(verify=True).items()
              if k in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"] and proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("coop_selection123_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder, instructions = Cs(CS_ARCH_X86, CS_MODE_64), {}
    for row in proof["ranges"]:
        start, end = int(row["start"], 0), int(row["end_exclusive"], 0)
        at = pe.rva_offset(start - pe.image_base)
        raw = image[at:at + end - start]
        assert hex(at) == row["file_offset"] and digest(raw) == row["sha256"] and raw.hex() == row["hex"]
        decoded = list(decoder.disasm(raw, start))
        assert sum(v.size for v in decoded) == len(raw), row["role"]
        instructions.update({v.address: (v.mnemonic, v.op_str) for v in decoded})
    tables = {}
    for row in proof["data_ranges"]:
        start = int(row["start"], 0)
        at = pe.rva_offset(start - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert raw.hex() == row["hex"] and digest(raw) == row["sha256"]
        tables[row["role"]] = (start, raw)
    for role, table_base, branch in [
        ("lifecycle-tag17-dispatch", 0x1476b84f4, 0x145ccbb20),
        ("host-Hero-dispatch", 0x1476acc0c, 0x145c2e533),
        ("guest-tag17-dispatch", 0x1476acce4, 0x145c2f75f),
        ("service-response20-dispatch", 0x14772a3bc, 0x145e653dd),
    ]:
        assert table_base + struct.unpack("<i", tables[role][1])[0] == branch
    assert struct.unpack("<d", tables["unknown-directory-rank"][1])[0] == -1.0
    assert instructions[0x145caab46] == ("mov", "byte ptr [rsi + 0x94], bl")
    assert instructions[0x145ccbe30] == ("movzx", "edx, byte ptr [rdi + 0x38]")
    for query in proof["queries"]:
        result = ROOT / query["result"]["path"]
        native = json.loads(json.loads(result.read_text())["content"][0]["text"])
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        assert digest(native["normalized_result"].encode()) == query["normalized_text_sha256"]

    witnesses = {
        "coop/server_party.rs": ["pub struct NativeRoster {", "pub eligible: bool,", "pub zone: String,",
            "bytes(&mut out, roster.zone.as_bytes())?;\n            out.push(roster.heroic_rank);"],
        "coop/session.rs": ["if self.roster.as_ref() == Some(&roster)", "LifecyclePacket::Roster(roster.clone())",
            "pub fn roster_snapshot(&self)"],
        "coop/replication.rs": ["roster.entries.truncate(5);", "roster.zone = crate::zones::resolve(&roster.zone).key.into();",
            "roster.heroic_rank = roster.heroic_rank.min(5);"],
        "coop/service.rs": ["out.push(value.max);\n    out.push(value.heroic_rank);"],
        "coop/directory_wire.rs": ["pub heroic_rank: Option<u8>,", "row.heroic_rank = Some(rank.min(5));",
            '"opened": zone_opened && rank_opened, "lacks": lacks,',
            '"heroic": row.heroic_rank.map_or(-1, i64::from),'],
        "coop_runtime.rs": ["driver.roster_snapshot()", "zone: rows.zone.clone(),", "heroic_rank: rows.heroic_rank,",
            "eligible: row.eligible,"],
        "gameplay/coop.rs": ["roster_row(hero, hero.permits_zone(zone_index, selected_rank))",
            "driver.publish_roster(rows, selected_zone.key.into(), selected_rank);",
            "if !hero.permits_zone(zone_index, admission_rank)"],
    }
    paths = []
    for relative, fragments in witnesses.items():
        path = ROOT / "crates/azeroth-survivors-re/src" / relative
        source = path.read_text()
        assert all(fragment in source for fragment in fragments), relative
        if relative == "gameplay/coop.rs":
            receiving = source.split("match crate::coop_profile::sanitize", 1)[1].split("LifecyclePacket::Synchronize", 1)[0]
            assert "permits_zone" not in receiving and "state.profiles.insert(client, hero)" in receiving
        paths.append(path)
    rustfmt = ROOT / ".tools/rust" / ("1.98.1-" + ("aarch64" if platform.machine() == "arm64" else "x86_64") + "-apple-darwin/bin/rustfmt")
    assert rustfmt.is_file()
    for path in paths:
        parsed = subprocess.run([str(rustfmt), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                                input=path.read_bytes(), capture_output=True)
        assert parsed.returncode == 0, (path, parsed.stderr.decode())
    result = replay(proof["ranges"])
    result.update({"queries": len(proof["queries"]), "original_instructions_checked": len(instructions),
                   "rust_syntax_paths": len(paths), "compilation": "not_run", "runtime_validation": "not_run",
                   "parity": "unverified"})
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    check()

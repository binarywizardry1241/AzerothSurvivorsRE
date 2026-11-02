#!/usr/bin/env python3
"""Replay the current ordinary roster factory and first-match Login lookup.

The shared scratch fixture supplies allocation/byte/free leaves. Original roster
collection, row/String cloning and Login instructions execute; no Rust or game runs.
"""
import hashlib
import json
from pathlib import Path

from native_save_fixture import CPU, ROOT, SHA
from unicorn import x86_const as r

DEST = ROOT / "docs/analysis/evidence/0.109.0/login-roster"
manifest = json.loads((DEST / "manifest.json").read_text())
assert manifest["target_sha256"] == SHA
cpu = CPU()


def verify(row, directory):
    a, b = int(row["start"], 16), int(row.get("end", row.get("end_exclusive")), 16)
    assert hashlib.sha256(cpu.raw(a, b)).hexdigest() == row["sha256"]
    for kind in ("assembly", "pseudocode"):
        if kind in row:
            assert hashlib.sha256((directory / row[kind]).read_bytes()).hexdigest() == row[kind + "_sha256"]
    return a, b


for row in manifest["native_helpers"]:
    a, _ = verify(row, DEST)
    cpu.allow_owner(a)
verify(manifest["login_provider"], DEST)
stock_dir = DEST.parent / "stock-lifecycle"
stock = json.loads((stock_dir / "manifest.json").read_text())
for role in ("roster-factory", "invalid-guid"):
    row = next(row for row in stock["ranges"] if row["role"] == role)
    a, b = verify(row, stock_dir)
    if role == "roster-factory":
        cpu.allow_owner(a)
    else:
        cpu.allow_range(a, b)
commands = json.loads((DEST.parent / "account-commands/manifest.json").read_text())
assert commands["target_sha256"] == SHA
clone = next(row for row in commands["native_helpers"] if int(row["start"], 16) == 0x145BCD2F0)
verify(clone, DEST.parent / "account-commands")
cpu.allow_owner(0x145BCD2F0)

cases = [
    (True, [(0xFFFFFF, "Permanent"), (42, "Other")], 0xFFFFFF, "Optional"),
    (False, [(0xFFFFFF, "Permanent"), (42, "Other")], 0xFFFFFF, "Permanent"),
    (True, [(42, "Other")], 42, "Other"),
    (True, [(42, "First"), (42, "Second")], 42, "First"),
    (False, [], 42, None),
]
results = []
for optional, permanent, wanted, expected in cases:
    cpu.stops.clear()
    cpu.heap = cpu.H + 0x10000
    cpu.u.mem_write(cpu.H, bytes(0x10000))
    server, rows, output = cpu.H + 0x1000, cpu.H + 0x4000, cpu.H + 0x6000
    name_at = cpu.H + 0x7000

    def character(at, guid, name):
        global name_at
        encoded = name.encode()
        cpu.u.mem_write(name_at, encoded)
        cpu.put(at, len(encoded), name_at, len(encoded), guid)
        cpu.u.mem_write(at + 32, (1).to_bytes(4, "little") + bytes(12) + bytes([1, 1, 0, 0, 0, 0, 0, 0]))
        name_at += len(encoded) + 8

    if optional:
        character(server + 0xEE0, 0xFFFFFF, "Optional")
    else:
        cpu.put(server + 0xEE0, 2**64 - 1)
    for index, (guid, name) in enumerate(permanent):
        character(rows + index * 56, guid, name)
    cpu.put(server + 0xB20, len(permanent), rows, len(permanent))
    cpu.call(0x1458BB880, output, server)
    pointer, count = cpu.q(output + 8), cpu.q(output + 16)
    actual = []
    for index in range(count):
        row = pointer + index * 56
        name = bytes(cpu.u.mem_read(cpu.q(row + 8), cpu.q(row + 16))).decode()
        actual.append((cpu.q(row + 24), name))
    assert actual == ([(0xFFFFFF, "Optional")] if optional else []) + permanent
    # Resume after packet decoding with the GUID's native partial fields supplied.
    bp = cpu.S + 0x100000
    cpu.u.mem_write(bp, bytes(0x3000))
    cpu.u.reg_write(r.UC_X86_REG_RBP, bp)
    cpu.u.reg_write(r.UC_X86_REG_RSP, cpu.S + 0xF0000)
    cpu.u.reg_write(r.UC_X86_REG_RAX, count)
    cpu.u.reg_write(r.UC_X86_REG_RBX, pointer)
    cpu.u.reg_write(r.UC_X86_REG_R14, count * 56)
    cpu.u.reg_write(r.UC_X86_REG_R12, pointer + count * 56)
    cpu.u.reg_write(r.UC_X86_REG_R13, wanted & 0xFFFFFFFF)
    cpu.u.reg_write(r.UC_X86_REG_RDI, wanted >> 32)
    cpu.u.reg_write(r.UC_X86_REG_R15, 0)
    cpu.stops = {0x1458B384B, 0x1458B31BF}
    cpu.u.emu_start(0x1458B3141, cpu.D, count=10000)
    pc = cpu.reg(r.UC_X86_REG_RIP)
    assert pc in cpu.stops
    selected = actual[cpu.reg(r.UC_X86_REG_R15) // 56][1] if pc == 0x1458B384B else None
    assert selected == expected, (optional, permanent, wanted, actual, hex(pc), cpu.reg(r.UC_X86_REG_R15), selected, expected)
    results.append(dict(optional=optional, permanent=permanent, wanted=wanted, projected=actual, selected=selected))

source = "".join((ROOT / "crates/azeroth-survivors-re/src/menu_state.rs").read_text().split())
for method in ("select_roster_character", "selected_roster_guid"):
    body = source.split("fn" + method + "(", 1)[1].split("pubfn", 1)[0]
    assert ".startup_character.iter().cloned().chain(self.backend_save.characters())" in body
output = ROOT / "runtime/fixgap-7-9/login-roster-check.json"
output.write_text(json.dumps(dict(target_sha256=SHA, cases=results, limits=[
    "Ordinary roster mode only; all factory/collector/row clone instructions execute.",
    "Packet-decoded GUID partials, scratch allocation/bytes/free are explicit seams.",
    "Lookup stops on selection or silent absence, before world entry; no source compilation or game runs.",
]), indent=2) + "\n")
print(f"PASS {len(results)} complete native ordinary-roster/Login precedence cases and source guards")

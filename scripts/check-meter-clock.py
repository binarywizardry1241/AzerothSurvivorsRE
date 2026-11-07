#!/usr/bin/env python3
"""Check the original HUD clock prefix and the connected guest clock source.

The fixture executes original instructions in synthetic memory. JSON lookup is
an explicit seam; neither reconstructed Rust nor a client/server is executed.
"""
from portable_paths import portable_json, portable_record

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

TARGET = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
SOURCE = "crates/azeroth-survivors-re/src/gameplay/meter/view.rs"
PROOF = "docs/analysis/evidence/0.121.0/meter-clock.json"
FIRST, LAST = 0x1401c8fdf, 0x1401c9048


def sha(value):
    return hashlib.sha256(value).hexdigest()


def derive(root, source_root):
    sys.path.insert(0, str(root / "scripts"))
    import capstone
    import unicorn
    import unicorn.x86_const as r
    from coverage_common import latest_target, target_bytes
    from discovery_native_subject import verify_native_query_subject
    from script_sources import load_script

    target = latest_target(verify=True)
    assert target["version"] == "0.121.0" and target["sha256"] == TARGET
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("meter_clock_pe", root / "scripts/inventory-executable.py").PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    def raw(first, count):
        offset = pe.rva_offset(first - pe.image_base)
        assert pe.rva_offset(first + count - 1 - pe.image_base) == offset + count - 1
        return image[offset:offset + count]

    def binding(name):
        return dict(path=name, sha256=sha((root / name).read_bytes()))

    query_root = "runtime/analysis/history/findings/q41-party-meter/0ed71522308c"
    journal_path = query_root + "/query/journal.json"
    journal = json.loads((root / journal_path).read_text())
    operation = next(row for row in journal["operations"].values()
                     if row.get("name") == "procedure_pseudo_code"
                     and row.get("arguments") == {"procedure": "0x1401c8e30"})
    assert operation["status"] == "completed"
    saved = json.loads((root / operation["result"]["path"]).read_text())
    evidence = saved.get("structuredContent") or json.loads(saved["content"][0]["text"])
    query = dict(role="meter-HUD-clock", procedure="0x1401c8e30",
                 plan=binding(query_root + "/plan.json"), journal=binding(journal_path),
                 result=operation["result"], raw_input=binding(query_root + "/code.bin"),
                 slice_virtual_address="0x1401a5180", evidence_id=evidence["evidence_id"],
                 provider=evidence["provider"], analysis_profile_digest=evidence["analysis_profile"]["digest"],
                 normalized_text_sha256=sha(evidence["normalized_result"].encode()))
    assert sha((root / operation["result"]["path"]).read_bytes()) == operation["result"]["sha256"]
    verify_native_query_subject(root, evidence, query, identity, image=image, pe=pe)

    assert raw(0x1461d8490, 4) == b"time"
    code = raw(FIRST, LAST - FIRST)
    decoded = list(decoder.disasm(code, FIRST))
    assert sum(item.size for item in decoded) == len(code)
    machine = unicorn.Uc(unicorn.UC_ARCH_X86, unicorn.UC_MODE_64)
    mapped = set()

    def memory(first, count):
        for page in range(first & ~4095, (first + count + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    for first, count in [(FIRST, len(code)), (LAST, 1), (0x142ccdb60, 1),
                         (0x1461d8490, 4), (0x146198650, 32),
                         (0x14859c338, 8), (0x20000000, 0x10000)]:
        memory(first, count)
    machine.mem_write(FIRST, code)
    machine.mem_write(0x1461d8490, raw(0x1461d8490, 4))
    machine.mem_write(0x146198650, raw(0x146198650, 32))
    machine.mem_write(0x14859c338, struct.pack("<Q", 0x20004000))
    machine.mem_write(0x20004000, b"\0" * 32)
    allowed = {item.address for item in decoded}
    state, steps = {}, 0

    def hook(_, pc, size, __):
        nonlocal steps
        if pc == LAST:
            state["result_bits"] = machine.reg_read(r.UC_X86_REG_XMM7) & ((1 << 64) - 1)
            machine.emu_stop()
            return
        if pc == 0x142ccdb60:
            assert machine.reg_read(r.UC_X86_REG_RCX) == 0x1461d8490
            assert machine.reg_read(r.UC_X86_REG_RDX) == 4
            assert machine.reg_read(r.UC_X86_REG_R8) == 0x20002000
            state["lookups"] += 1
            machine.reg_write(r.UC_X86_REG_RAX, 0 if state["missing"] else 0x20003000)
            sp = machine.reg_read(r.UC_X86_REG_RSP)
            machine.reg_write(r.UC_X86_REG_RIP, struct.unpack("<Q", machine.mem_read(sp, 8))[0])
            machine.reg_write(r.UC_X86_REG_RSP, sp + 8)
            return
        assert pc in allowed, f"Unreviewed native instruction/callee {pc:#x}"
        steps += 1

    machine.hook_add(unicorn.UC_HOOK_CODE, hook)
    fbits = lambda value: struct.unpack("<Q", struct.pack("<d", value))[0]
    cases = []
    for name, tag, kind, payload, missing, expected in [
        ("HUD-ahead-of-State", 2, 2, fbits(5.25), False, 5.25),
        ("HUD-behind-State", 2, 2, fbits(2.5), False, 2.5),
        ("signed-integer", 2, 1, -7 & ((1 << 64) - 1), False, -7.0),
        ("unsigned-integer", 2, 0, (1 << 63) + 17, False, float((1 << 63) + 17)),
        ("zero", 2, 2, fbits(0.0), False, 0.0),
        ("missing", 0, 0, 0, True, 0.0),
        ("null", 0, 0, 0, False, 0.0),
        ("wrong-type", 3, 0, 0, False, 0.0),
    ]:
        state.clear()
        state.update(missing=missing, lookups=0)
        machine.mem_write(0x20003000, struct.pack("<4Q", tag, kind, payload, 0))
        machine.reg_write(r.UC_X86_REG_RSI, 0x20002000)
        machine.reg_write(r.UC_X86_REG_RSP, 0x2000f000)
        machine.reg_write(r.UC_X86_REG_XMM7, fbits(999.0))
        machine.emu_start(FIRST, 0, count=100)
        assert state.get("result_bits") == fbits(expected), (name, state)
        assert state["lookups"] == 1
        cases.append(dict(name=name, state_clock=81, HUD_tag=tag, numeric_kind=kind,
                          payload_bits=f"0x{payload:016x}", missing=missing,
                          native_clock_bits=f"0x{state['result_bits']:016x}"))

    source = (source_root / SOURCE).read_text()
    first = source.index("        let replica=game.replica_hud();")
    last = source.index("        let damage =", first)
    clock_block = source[first:last]
    assert 'replica.map_or_else(|| f64::from(game.clock), |hud|' in clock_block
    assert 'hud.get("time").and_then(serde_json::Value::as_f64).unwrap_or(0.0)' in clock_block
    return dict(schema_version=1, target=identity, gap_ids=[252],
                generator=dict(path="scripts/check-meter-clock.py",
                               sha256=sha(Path(__file__).read_bytes())),
                dependencies=[binding(name) for name in
                              ["scripts/coverage_common.py", "scripts/discovery_native_subject.py",
                               "scripts/script_sources.py", "scripts/inventory-executable.py"]],
                native_range=dict(virtual_address=hex(FIRST), end_exclusive=hex(LAST),
                                  byte_count=len(code), sha256=sha(code), instruction_count=len(decoded)),
                query=query, source_contract=dict(path=SOURCE, clock_block_sha256=sha(clock_block.encode())),
                fixture=dict(cases=cases, case_count=len(cases), original_instruction_steps=steps,
                             seams=["JSON lookup by exact key/time and root HUD pointer"],
                             synthetic_memory=True),
                limits=["The original Windows x64 prefix supplies the register/stack ABI; raw-slice pseudocode has generic ABI and omits external data/callees.",
                        "The source clock expression is inspected, not executed. No Rust compilation, client/server/game execution or original/rebuilt parity check was performed."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs-root", type=Path)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    source_root = Path(__file__).resolve().parents[1]
    root = args.inputs_root.resolve() if args.inputs_root else source_root
    value = derive(root, source_root)
    path = source_root / PROOF
    if args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(portable_json(value, indent=2) + "\n")
    else:
        assert portable_record(json.loads(path.read_text())) == portable_record(value), "Clock evidence differs; inspect before publishing"
    print(f"Verified {value['fixture']['case_count']} original HUD-clock cases; source expression bound; Rust/client/server/game unrun")


if __name__ == "__main__":
    main()

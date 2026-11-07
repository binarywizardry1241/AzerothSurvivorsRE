#!/usr/bin/env python3
"""Verify native SFNT table filtering and its live AS font-source correction.

Executes bounded original instructions in synthetic memory with explicit
allocation/copy seams; it does not compile or run the game or reconstructed Rust.
"""
from portable_paths import portable_json, portable_record

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

TARGET = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
KEEP = "docs/analysis/evidence/0.121.0/font-table-filter"
SOURCE = "crates/azeroth-survivors-re/src/font_patch.rs"
DROP = (b"DSIG", b"LTSH", b"VDMX", b"hdmx")
REPLACE = (b"cmap", b"glyf", b"head", b"hhea", b"hmtx", b"loca", b"maxp", b"post")
RANGES = [("filter-and-copy", 0x145ac7d85, 0x145ac812a),
          ("iteration-setup", 0x145ac7bd0, 0x145ac7c03),
          ("change-gate", 0x145ac7367, 0x145ac7374),
          ("unchanged-copy", 0x145ac78ed, 0x145ac7973),
          ("modification-count-init", 0x145ac66b2, 0x145ac66bc),
          ("composite-count", 0x145ac6e07, 0x145ac6e12),
          ("alias-count", 0x145ac6e95, 0x145ac6e9d),
          ("mirror-count", 0x145ac71d9, 0x145ac71ec)]


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


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
    pe = load_script("font_table_filter_pe", root / "scripts/inventory-executable.py").PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    def raw(first, count):
        offset = pe.rva_offset(first - pe.image_base)
        assert pe.rva_offset(first + count - 1 - pe.image_base) == offset + count - 1
        return image[offset:offset + count]

    def binding(name):
        return dict(path=name, sha256=sha((root / name).read_bytes()))

    native = []
    for role, first, last in RANGES:
        value = raw(first, last - first)
        decoded = list(decoder.disasm(value, first))
        assert sum(item.size for item in decoded) == len(value)
        native.append(dict(role=role, virtual_address=hex(first), end_exclusive=hex(last),
                           file_offset=hex(pe.rva_offset(first - pe.image_base)), byte_count=len(value),
                           sha256=sha(value), instruction_count=len(decoded)))
    data = [dict(role=role, virtual_address=hex(first), byte_count=count, sha256=sha(raw(first, count)), bytes_hex=raw(first, count).hex())
            for role, first, count in [("first-byte-table", 0x14730de70, 180),
                                       ("h-second-byte-table", 0x14730df24, 40)]]

    query_root = "runtime/analysis/history/findings/q41-font-filter/ec279f17978a"
    plan = binding(query_root + "/plan-v2.json")
    journal_path = query_root + "/query-v2/journal.json"
    journal = json.loads((root / journal_path).read_text())
    operation = next(row for row in journal["operations"].values() if row["name"] == "procedure_pseudo_code")
    assert operation["status"] == "completed" and operation["arguments"] == {"procedure": "0x145ac7d85"}
    saved = json.loads((root / operation["result"]["path"]).read_text())
    evidence = saved.get("structuredContent") or json.loads(saved["content"][0]["text"])
    query = dict(role="SFNT-table-filter", procedure="0x145ac7d85", plan=plan,
                 journal=binding(journal_path), result=operation["result"],
                 raw_input=binding(query_root + "/code.bin"), slice_virtual_address="0x145ac7d85")
    query.update(evidence_id=evidence["evidence_id"], provider=evidence["provider"],
                 analysis_profile_digest=evidence["analysis_profile"]["digest"],
                 normalized_text_sha256=sha(evidence["normalized_result"].encode()))
    assert sha((root / operation["result"]["path"]).read_bytes()) == operation["result"]["sha256"]
    verify_native_query_subject(root, evidence, query, identity, image=image, pe=pe)

    machine = unicorn.Uc(unicorn.UC_ARCH_X86, unicorn.UC_MODE_64)
    mapped = set()

    def memory(first, count):
        for page in range(first & ~4095, (first + count + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    allowed = set()
    for row in native:
        first, count = int(row["virtual_address"], 16), row["byte_count"]
        memory(first, count)
        machine.mem_write(first, raw(first, count))
        allowed.update(item.address for item in decoder.disasm(raw(first, count), first))
    for row in data:
        first, count = int(row["virtual_address"], 16), row["byte_count"]
        memory(first, count)
        machine.mem_write(first, raw(first, count))
    for first in (0x145ac7d38, 0x1404818a0, 0x14017b040, 0x145febc1b, 0x145ac7cfa):
        memory(first, 1)
        machine.mem_write(first, b"\xc3")
    memory(0x20000000, 0x10000)
    memory(0x21000000, 0x10000)
    frame, stack, table_row = 0x20000800, 0x21008000, 0x20002000
    state, steps = {}, 0

    def put(first, *values):
        machine.mem_write(first, struct.pack("<" + "Q" * len(values), *values))

    def word(first):
        return struct.unpack("<Q", machine.mem_read(first, 8))[0]

    def ret():
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        machine.reg_write(r.UC_X86_REG_RIP, word(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, pc, size, __):
        nonlocal steps
        mode = state["mode"]
        if mode == "tag" and pc in (0x145ac7d85, 0x145ac80a7, 0x145ac7d38, 0x1404818a0):
            state["result"] = ("drop" if pc == 0x145ac7d85 else
                               "copy" if pc == 0x145ac80a7 else "replace")
            machine.emu_stop()
            return
        if mode == "gate" and pc in (0x145ac7374, 0x145ac78ed):
            state["result"] = "unchanged" if pc == 0x145ac78ed else "rebuild"
            machine.emu_stop()
            return
        if mode == "copy" and pc in (0x145ac7d49, 0x145ac7cfa):
            state["result"] = "copied"
            machine.emu_stop()
            return
        if mode == "copy" and pc == 0x14017b040:
            output = machine.reg_read(r.UC_X86_REG_RCX)
            size = machine.reg_read(r.UC_X86_REG_RDX)
            assert size == len(state["payload"])
            machine.mem_write(output, b"\0" * 8)
            put(output + 8, size, 0x20006000)
            ret()
            return
        if mode == "copy" and pc == 0x145febc1b:
            output, source, count = (machine.reg_read(reg) for reg in
                                     (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            assert output == 0x20006000 and source == 0x20004000 and count == len(state["payload"])
            machine.mem_write(output, bytes(machine.mem_read(source, count)))
            state["copy_calls"] += 1
            ret()
            return
        assert pc in allowed, f"Unreviewed native instruction/callee {pc:#x}"
        steps += 1

    machine.hook_add(unicorn.UC_HOOK_CODE, hook)

    def reset(mode):
        state.clear()
        state["mode"] = mode
        machine.mem_write(frame - 0x100, b"\0" * 0x500)
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_RSP, stack)
        machine.reg_write(r.UC_X86_REG_R15, 0x14730de70)
        machine.reg_write(r.UC_X86_REG_RBX, frame + 0x210)
        put(frame + 0x238, table_row)

    candidates = {bytes([value]) + b"xyz" for value in range(256)}
    for tag in DROP + REPLACE:
        candidates.add(tag)
        for index in range(4):
            for value in range(256):
                candidates.add(tag[:index] + bytes([value]) + tag[index + 1:])
    cases, classifications = [], {key: 0 for key in ("drop", "replace", "copy")}
    for tag in sorted(candidates):
        reset("tag")
        machine.mem_write(table_row, tag + b"\0" * 20)
        machine.emu_start(0x145ac7d99, 0, count=200)
        expected = "drop" if tag in DROP else "replace" if tag in REPLACE else "copy"
        assert state.get("result") == expected, (tag, state)
        classifications[expected] += 1
        cases.append([tag.hex(), expected])
    gate_cases = []
    for changes in (0, 1, 49, 0xffffffff):
        reset("gate")
        machine.mem_write(frame + 0x1c8, struct.pack("<I", changes))
        machine.emu_start(0x145ac7367, 0, count=20)
        assert state["result"] == ("unchanged" if changes == 0 else "rebuild")
        gate_cases.append([changes, state["result"]])
    copy_cases = []
    for unchanged in (False, True):
        for payload in (b"", b"native-table-payload", bytes(range(256))):
            reset("copy")
            state.update(payload=payload, copy_calls=0)
            machine.mem_write(0x20004000, payload or b"\0")
            put(table_row + 8, 0x20004000, len(payload))
            put(frame + 0x208, 0x20007000)
            put(frame + 0x1f8, 0x20004000)
            if unchanged:
                put(frame + 0x238, len(payload))
            machine.emu_start(0x145ac78ed if unchanged else 0x145ac80a7, 0, count=200)
            assert state.get("result") == "copied"
            assert bytes(machine.mem_read(0x20006000, len(payload))) == payload
            assert state["copy_calls"] == bool(payload)
            if unchanged:
                assert word(0x20007000) == 0 and word(0x20007018) == len(payload)
            else:
                assert word(frame + 0xa0) == len(payload)
            copy_cases.append(["unchanged-input" if unchanged else "unmatched-table", len(payload)])

    source = (source_root / SOURCE).read_text()
    gate_at = source.index("if glyphs.len() == count && !aliases_added")
    filter_at = source.index('for tag in [b"DSIG", b"LTSH", b"VDMX", b"hdmx"]')
    rebuild_at = source.index("let mut glyf = Vec::new();", gate_at)
    assert gate_at < filter_at < rebuild_at
    assert "tables.remove(tag);" in source[filter_at:rebuild_at]
    assert "return Ok(data);" in source[gate_at:filter_at]
    assert source.index('tables.insert(*b"glyf", glyf)') > filter_at
    provider_path = "crates/azeroth-survivors-re/src/menu_fonts.rs"
    provider = (source_root / provider_path).read_text()
    assert "font_patch::augment(bytes.clone())" in provider
    return dict(schema_version=1, target=identity, gap_ids=[41, 250],
                lead_id="Q41-U03:font-SFNT-filter", generator=dict(path="scripts/check-font-table-filter.py", sha256=sha(Path(__file__).read_bytes())),
                native_ranges=native, native_data=data, queries=[query],
                source=[dict(path=name, sha256=sha((source_root / name).read_bytes())) for name in (SOURCE, provider_path)],
                recovered=dict(drop_original_tags=[tag.decode() for tag in DROP], replace_tags=[tag.decode() for tag in REPLACE],
                               other_tags="copy the original table payload", change_gate="zero modifications copies original input; positive modification count rebuilds",
                               source_correction="After unchanged-input return, remove only DSIG/LTSH/VDMX/hdmx before rebuilding the eight replaced tables and serializing."),
                static_validation=dict(tag_cases=len(cases), tag_classifications=classifications,
                                       case_result_sha256=sha(json.dumps(cases, separators=(",", ":")).encode()),
                                       gate_cases=gate_cases, copy_cases=copy_cases, original_instruction_steps=steps),
                limits=["Synthetic preallocated inputs; table payload allocation and memcpy are explicit seams, with real native pointer/length and publication instructions.",
                        "Ghidra raw-range decompilation lacks external data/types and cannot recover its indexed table. Exact current instructions and table bytes govern the tag predicates.",
                        "No reconstructed Rust execution, full-font byte/rendering comparison, application compilation, game/client/network/server operation or parity validation."])


def main():
    checkout = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs-root", type=Path, default=checkout)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = derive(args.inputs_root.resolve(), checkout)
    path = checkout / KEEP / "manifest.json"
    if args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(portable_json(proof, ensure_ascii=False, indent=2) + "\n")
    else:
        assert portable_record(json.loads(path.read_text())) == portable_record(proof)
    print(json.dumps(proof["static_validation"], indent=2))


if __name__ == "__main__":
    main()

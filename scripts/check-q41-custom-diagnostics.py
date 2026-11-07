#!/usr/bin/env python3
"""Classify every C01 site role and replay the selected marker lookup boundary.

The exact original selector and body ownership remain unchanged. Site roles
are not complete gameplay contracts. --stage writes compact evidence below
runtime; default verifies the curated proof. No compiler or game is invoked.
"""
from runtime_layout import retained_runtime_path
import argparse
import bisect
from collections import Counter
import csv
import gzip
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/analysis/history/findings/q41-remaining/687b5b35cf28"
KEEP = ROOT / "docs/analysis/evidence/0.113.2/q41-custom-diagnostics.json"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def artifact(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=sha(path.read_bytes()))


def derive():
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                   str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("custom_diag_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None
        result = image[offset:offset + count]
        assert len(result) == count
        return result

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    queue_path = ROOT / "docs/analysis/evidence/0.113.2/unknown-recovery.json"
    queue = json.loads(queue_path.read_text())
    assert queue["target"]["sha256"] == SHA
    inputs = {k: queue["inputs"][k] for k in ["bodies.tsv.gz", "diagnostic-ownership.json"]}
    for record in inputs.values():
        assert sha((retained_runtime_path(ROOT / record["path"], ROOT)).read_bytes()) == record["sha256"]
    with gzip.open(ROOT / inputs["bodies.tsv.gz"]["path"], "rt") as stream:
        bodies = sorted((int(r["start"], 16), int(r["end"], 16), int(r["entry"], 16))
                        for r in csv.DictReader(stream, delimiter="\t") if r["external"] == "false")
    starts = [r[0] for r in bodies]

    def owner(address):
        i = bisect.bisect_right(starts, address) - 1
        return bodies[i][2] if i >= 0 and address <= bodies[i][1] else None

    selected = []
    for diagnostic in sorted(json.loads((ROOT / inputs["diagnostic-ownership.json"]["path"]).read_text())["diagnostics"],
                             key=lambda d: d["path"]):
        if not diagnostic["custom_game_crate"] or diagnostic["system_id"] in queue["excluded_logic_system_ids"]:
            continue
        for row in diagnostic["verified_references"]:
            if owner(int(row["instruction_address"], 16)) is None:
                selected.append(dict(path=diagnostic["path"], system_id=diagnostic["system_id"], **row))
    projection = [[r["path"], r["system_id"], r["instruction_address"], r["target_address"],
                   r["runtime_function_start"], r["runtime_function_end"], r["instruction_bytes"], None]
                  for r in selected]
    encoded = "".join(json.dumps(r, separators=(",", ":")) + "\n" for r in projection).encode()
    assert len(selected) == 57 and sha(encoded) == queue["selectors"]["Q41-C01"]["output_sha256"]
    roles = {0x145E9C123: "bounds_failure_call", 0x145E9C300: "formatted_failure_call",
             0x145E9C040: "missing_key_failure_call", 0x145E9C080: "option_failure_call",
             0x140074B90: "location_forwarded_to_stable_u64_vector_removal",
             0x14597BC80: "location_forwarded_to_stable_120_byte_vector_removal",
             0x145895AD0: "formatting_key_adjacent_to_diagnostic_filename"}
    classified, decoded = [], {}
    for row in selected:
        start, end = int(row["runtime_function_start"], 16), int(row["runtime_function_end"], 16)
        if start not in decoded:
            data = raw(start, end - start)
            assert sha(data) == row["owner_sha256"]
            instructions = list(decoder.disasm(data, start))
            assert sum(i.size for i in instructions) == len(data)
            decoded[start] = {i.address: i for i in instructions}
        instructions = decoded[start]
        site = int(row["instruction_address"], 16)
        assert instructions[site].bytes.hex() == row["instruction_bytes"]
        current, flow = instructions[site], []
        for _ in range(35):
            flow.append(current)
            if current.mnemonic == "call":
                break
            assert not current.mnemonic.startswith("j") or current.mnemonic == "jmp"
            following = current.operands[0].imm if current.mnemonic == "jmp" else current.address + current.size
            current = instructions[following]
        assert current.mnemonic == "call"
        callee = current.operands[0].imm
        assert callee in roles
        response = next((WORK / "rea-c01").glob(f"*-site-{site:x}.json"))
        ev = json.loads(response.read_text())["response"]["result"]["structuredContent"]
        assert ev["subject"]["digest"]["sha256"] == SHA
        assert ev["normalized_result"]["bytes"] == row["instruction_bytes"]
        record = dict(path=row["path"], system_id=row["system_id"], site=hex(site),
                      diagnostic_target=row["target_address"], reference_kind=row["kind"],
                      source_line=row.get("source_line"), source_column=row.get("source_column"),
                      original_body_owner=None, fresh_body_owner=ev["normalized_result"]["procedure"],
                      declared_extent=[hex(start), hex(end)], extent_sha256=row["owner_sha256"],
                      call_site=hex(current.address), callee=hex(callee), role=roles[callee],
                      local_flow_sites=[hex(i.address) for i in flow],
                      local_flow_bytes_sha256=sha(b"".join(bytes(i.bytes) for i in flow)),
                      ghidra_evidence_id=ev["evidence_id"], ghidra_response=artifact(response))
        if row["kind"] == "path_literal":
            assert callee == 0x145895AD0 and int(row["target_address"], 16) == 0x14730BA40
            assert raw(0x14730BA40, 5) == b"spell"
            assert raw(0x14730BA45, 38) == b"crates\\wenilla-rogue\\src\\game\\auras.rs"
            assert any(i.mnemonic == "mov" and i.op_str == "qword ptr [rbp + 0x170], 5" for i in flow)
            record["classification"] = "supporting_literal_boundary_context_not_a_filename_consumer"
        else:
            record["classification"] = "AS_site_role_only_successful_contract_and_aliases_remain_bounded"
        classified.append(record)

    # The marker's key4 map consumer has two actual failure edges. A supplied
    # hash is the sole call seam: this tests lookup/probe/byte-key selection,
    # not the shared hash implementation, map producer, ECS or GPU.
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    start, end = 0x14017A300, 0x14017CA84
    page = start & ~4095
    machine.mem_map(page, ((end - page + 4095) // 4096) * 4096)
    machine.mem_write(start, raw(start, end - start))
    machine.mem_map(0x140011000, 4096)  # Intercepted hash interface; no instructions execute here.
    heap, stack = 0x200000000, 0x300000000
    machine.mem_map(heap, 0x10000)
    machine.mem_map(stack, 0x10000)
    table, control, frame = heap + 0x1000, heap + 0x5000, stack + 0x1000
    outcome, requested_hash, trace = [], 0, set()

    def hook(uc, address, size, unused):
        if address in [0x14017C99B, 0x14017BE57]:
            outcome.append("missing" if address == 0x14017C99B else "found")
            uc.emu_stop()
        elif address == 0x1400117F0:
            assert uc.reg_read(reg.UC_X86_REG_RCX) == table + 32
            assert bytes(uc.mem_read(uc.reg_read(reg.UC_X86_REG_RDX), 1)) == b"\4"
            rsp = uc.reg_read(reg.UC_X86_REG_RSP)
            ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
            assert ret == 0x14017B8A4
            uc.reg_write(reg.UC_X86_REG_RAX, requested_hash)
            uc.reg_write(reg.UC_X86_REG_RSP, rsp + 8)
            uc.reg_write(reg.UC_X86_REG_RIP, ret)
        else:
            assert 0x14017B825 <= address < 0x14017B943
            trace.add(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = Counter()
    for mode in ["empty", "missing", "found", "collision"]:
        hashes = [(0, 0)] if mode == "empty" else [(a, b) for a in range(128) for b in range(16)]
        for fingerprint, bucket in hashes:
            outcome.clear()
            requested_hash = (fingerprint << 57) | bucket
            controls = bytearray(b"\xff" * 16)
            machine.mem_write(control - 16 * 32, bytes(16 * 32))
            target_bucket = bucket
            if mode == "collision":
                controls[bucket] = fingerprint
                machine.mem_write(control - (bucket + 1) * 32, b"\3")
                target_bucket = (bucket + 1) % 16
            if mode in ["found", "collision"]:
                controls[target_bucket] = fingerprint
                machine.mem_write(control - (target_bucket + 1) * 32, b"\4")
            machine.mem_write(control, bytes(controls + controls))
            machine.mem_write(table, struct.pack("<4Q", control, 15, 0, 0 if mode == "empty" else 1))
            machine.reg_write(reg.UC_X86_REG_RBX, table)
            machine.reg_write(reg.UC_X86_REG_RBP, frame)
            machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x8000)
            machine.emu_start(0x14017B825, 0, count=400)
            assert outcome == ["found" if mode in ["found", "collision"] else "missing"]
            if outcome == ["found"]:
                assert machine.reg_read(reg.UC_X86_REG_R10) == control - target_bucket * 32
            cases[mode] += 1

    helpers, helper_cases = [], Counter()
    for entry, end, width, stem in [(0x140074B90, 0x140074BEB, 8, "005"),
                                    (0x14597BC80, 0x14597BD90, 120, "008")]:
        response = next((WORK / "rea-shared-boundaries").glob(f"{stem}-*.json"))
        ev = json.loads(response.read_text())["response"]["result"]["structuredContent"]
        assert ev["subject"]["digest"]["sha256"] == SHA
        helpers.append(dict(entry=hex(entry), end_exclusive=hex(end), width=width,
                            sha256=sha(raw(entry, end - entry)), evidence_id=ev["evidence_id"],
                            response=artifact(response)))
        uc = Uc(UC_ARCH_X86, UC_MODE_64)
        uc.mem_map(entry & ~4095, 4096)
        uc.mem_write(entry, raw(entry, end - entry))
        uc.mem_map(0x145CF9000, 4096)  # Intercepted memmove.
        uc.mem_map(0x145E9B000, 4096)  # Intercepted invalid-index failure.
        uc.mem_map(heap, 0x10000)
        uc.mem_map(stack, 0x10000)
        stop = 0x400000000
        uc.mem_map(stop, 4096)
        failure = []

        def shared_hook(m, address, size, unused):
            if address == 0x145E9BE5B:
                failure.append(True)
                m.emu_stop()
            elif address == 0x145CF999D:
                dest, src, count = [m.reg_read(r) for r in
                                    [reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8]]
                assert count <= 8 * width
                m.mem_write(dest, bytes(m.mem_read(src, count)))
                rsp = m.reg_read(reg.UC_X86_REG_RSP)
                ret = struct.unpack("<Q", m.mem_read(rsp, 8))[0]
                m.reg_write(reg.UC_X86_REG_RAX, dest)
                m.reg_write(reg.UC_X86_REG_RSP, rsp + 8)
                m.reg_write(reg.UC_X86_REG_RIP, ret)
            else:
                assert entry <= address < end

        uc.hook_add(UC_HOOK_CODE, shared_hook)
        for length in range(9):
            original = [bytes([n + 1]) * width for n in range(length)]
            for index in [*range(length), length, (1 << 64) - 1]:
                failure.clear()
                uc.mem_write(heap, struct.pack("<3Q", length, heap + 0x1000, length))
                uc.mem_write(heap + 0x1000, b"".join(original))
                uc.mem_write(stack + 0x8000, struct.pack("<Q", stop))
                uc.reg_write(reg.UC_X86_REG_RSP, stack + 0x8000)
                if width == 8:
                    uc.reg_write(reg.UC_X86_REG_RCX, heap)
                    uc.reg_write(reg.UC_X86_REG_RDX, index)
                else:
                    uc.reg_write(reg.UC_X86_REG_RCX, heap + 0x2000)
                    uc.reg_write(reg.UC_X86_REG_RDX, heap)
                    uc.reg_write(reg.UC_X86_REG_R8, index)
                uc.emu_start(entry, stop, count=200)
                assert bool(failure) == (index >= length)
                actual_length = struct.unpack("<Q", uc.mem_read(heap + 16, 8))[0]
                assert actual_length == length - int(index < length)
                if index < length:
                    expected = b"".join(original[:index] + original[index + 1:])
                    assert bytes(uc.mem_read(heap + 0x1000, len(expected))) == expected
                    if width == 8:
                        assert uc.reg_read(reg.UC_X86_REG_RAX) == int.from_bytes(original[index], "little")
                    else:
                        assert bytes(uc.mem_read(heap + 0x2000, width)) == original[index]
                helper_cases[str(width)] += 1
        if width == 120:
            # The helper checks the removed leading word after shifting and
            # decrementing, so its unusual failure side effects stay explicit.
            failure.clear()
            original = [bytes([1]) * width, bytes(width), bytes([3]) * width]
            uc.mem_write(heap, struct.pack("<3Q", 3, heap + 0x1000, 3))
            uc.mem_write(heap + 0x1000, b"".join(original))
            uc.mem_write(stack + 0x8000, struct.pack("<Q", stop))
            uc.reg_write(reg.UC_X86_REG_RSP, stack + 0x8000)
            uc.reg_write(reg.UC_X86_REG_RCX, heap + 0x2000)
            uc.reg_write(reg.UC_X86_REG_RDX, heap)
            uc.reg_write(reg.UC_X86_REG_R8, 1)
            uc.emu_start(entry, stop, count=200)
            assert failure == [True]
            assert struct.unpack("<Q", uc.mem_read(heap + 16, 8))[0] == 2
            assert bytes(uc.mem_read(heap + 0x1000, 2 * width)) == original[0] + original[2]
            helper_cases["120_zero_leading_word_failure_after_removal"] += 1

    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/raid_markers.rs").read_text()
    assert "native::MASK_SIZES" in source and "native::mask_pixels(kind)" in source
    assert "renderer.masks = textures(&mut images)" in source
    assert "renderer.masks[group.mask].id()" in source
    masks = (ROOT / "crates/azeroth-survivors-re/src/raid_markers.rs").read_text()
    assert "pub const MASK_SIZES: [(u32, u32); 8]" in masks
    initializer = WORK / "rea-first/004-instructions-14017a300.json"
    initializer_ev = json.loads(initializer.read_text())["response"]["result"]["structuredContent"]
    initializer_ins = "\n".join(initializer_ev["normalized_result"]["instructions"])
    for observed in ["0x14017a3f3: MOV RAX, 0x706050403020100",
                     "0x14017a477: CMP RAX, 0x8", "0x14017a931: CALL 0x14009f300"]:
        assert observed in initializer_ins
    return dict(schema_version=1, target=target, gap_ids=[41, 43],
                selector=queue["selectors"]["Q41-C01"], inputs=inputs,
                site_role_counts=dict(sorted(Counter(r["role"] for r in classified).items())),
                sites=classified, stable_vector_interfaces=dict(helpers=helpers, cases=dict(helper_cases),
                    limits="Synthetic owned vectors and bounded memmove seam; these helper calls are ordinary operations, not failure-path entries. Caller input/index meaning and complete AS consumer equivalence remain separate."),
                marker_lookup=dict(cases=dict(cases), original_instructions=len(trace),
                    source_consumer="crates/azeroth-survivors-re/src/gameplay/raid_markers.rs",
                    source_sha256=sha(source.encode()), producer="Eight generated masks, with key4 present in MASK_SIZES enumeration.",
                    initializer_ghidra=dict(evidence_id=initializer_ev["evidence_id"], response=artifact(initializer)),
                    failure_edges=["0x14017b83a", "0x14017b930"], failure_entry="0x14017c99b",
                    message="no entry found for key", key=4),
                limits=["All 57 original C01 sites are retained; role classification does not repair census body ownership or revalidate every containing AS contract.",
                        "Two raw path leads consume only spell, before an adjacent filename; no source-owner claim follows from the filename.",
                        "Shared bounds/formatting/Option failure callees are interface classifications; generic panic/runtime recovery stops at that boundary.",
                        "Marker hash/table/geometry memory is synthetic. Real initialization, resource handles, complete valid geometry, ECS/GPU and mutable aliases remain unverified.",
                        "No additional source defect is established by these diagnostic roles. All compilation/runtime/parity obligations remain open."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    result = derive()
    text = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.stage:
        (WORK / "custom-diagnostics.json").write_text(text)
    else:
        assert KEEP.read_text() == text
    print(json.dumps(dict(sites=len(result["sites"]), roles=result["site_role_counts"],
                          marker_cases=sum(result["marker_lookup"]["cases"].values()), parity_verified=False)))


if __name__ == "__main__":
    main()

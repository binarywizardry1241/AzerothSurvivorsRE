#!/usr/bin/env python3
"""Check the selected guardian health publication and local notification seam.

No Rust compilation, target process, addon or game is executed. --stage retains
reviewable text evidence in ignored runtime; default verifies curated evidence.
The fixture runs only the selected original instructions with explicit CRT and
descriptor-map callbacks. It does not execute the guardian or engine subsystem.
"""
import argparse
import hashlib
import importlib.util
import json
import math
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
START, END, CONTINUATION = 0x14594AD5C, 0x14594ADDE, 0x14594AF3F
STAGE = ROOT / "runtime/analysis/staging/native-evidence/0.113.2/guardian-target-health"
KEPT = ROOT / "docs/analysis/evidence/0.113.2/guardian-target-health"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover the changed installed target first"
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("guardian_health_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        assert len(value) == count
        return value

    def span(address, count):
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=count, sha256=hashlib.sha256(raw(address, count)).hexdigest())

    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                    str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = list(decoder.disasm(raw(START, CONTINUATION - START), START))
    assert sum(i.size for i in instructions) == CONTINUATION - START
    # The CRT identity is resolved from the current thunk and current PE IAT.
    thunk = next(decoder.disasm(raw(0x145CF99F7, 6), 0x145CF99F7))
    assert thunk.mnemonic == "jmp"
    iat = thunk.address + thunk.size + struct.unpack("<i", thunk.bytes[2:])[0]
    assert any(int(row["iat_start_address"], 16) + i * 8 == iat and name == "ceilf"
               for row in pe.imports() for i, name in enumerate(row["functions"]))
    threshold_load = next(decoder.disasm(raw(0x145949A41, 9), 0x145949A41))
    assert threshold_load.mnemonic == "movss" and threshold_load.op_str.startswith("xmm9, ")
    threshold_address = threshold_load.address + threshold_load.size + struct.unpack("<i", threshold_load.bytes[-4:])[0]
    assert threshold_address == 0x145ED69D4
    assert raw(threshold_address, 4) == bytes.fromhex("ffff7f4f")
    threshold = struct.unpack("<f", raw(threshold_address, 4))[0]
    assert raw(0x14594ABB5, 3) == bytes.fromhex("0f57ff")  # xorps xmm7,xmm7
    assert raw(0x14594AC00, 2) == bytes.fromhex("31f6")  # xor esi,esi
    assert raw(0x14730D06E, 24) == b"Who dares enter my lair?"
    assert any(i.address == 0x14594AEC7 and i.op_str == "0x1458a7490" for i in instructions)
    assert any(i.address == 0x14594AF20 and i.op_str == "qword ptr [rdx + 0x630], rsi" for i in instructions)

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(START & ~4095, 4096)
    machine.mem_write(START, raw(START, END - START))
    for call in (0x145CF99F7, 0x1459A18C0):
        machine.mem_map(call & ~4095, 4096)
    actor, frame, stack = 0x71000000, 0x71010000, 0x71020000
    for base in (actor, frame, stack):
        machine.mem_map(base, 0x10000)
    rows = []

    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]

    def set_float(register, value):
        machine.reg_write(register, struct.unpack("<I", struct.pack("<f", value))[0])

    def return_call():
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        ret = struct.unpack("<Q", machine.mem_read(sp, 8))[0]
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)
        machine.reg_write(r.UC_X86_REG_RIP, ret)

    def hook(_, address, size, user):
        if address == END:
            machine.emu_stop()
        elif address == 0x145CF99F7:
            value = struct.unpack("<f", machine.reg_read(r.UC_X86_REG_XMM0).to_bytes(16, "little")[:4])[0]
            set_float(r.UC_X86_REG_XMM0, float(math.ceil(value)) if math.isfinite(value) else value)
            return_call()
        elif address == 0x1459A18C0:
            rows.append((machine.reg_read(r.UC_X86_REG_DX), machine.reg_read(r.UC_X86_REG_R8D)))
            return_call()
        else:
            assert START <= address < END, hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = 0

    def converted(value):
        value = f32(value)
        if math.isnan(value) or value < 0:
            return 0
        return 0xffffffff if value >= 2**32 else math.ceil(value)

    for health in (-1., 0., .01, .99, 1., 1.1, 24., threshold, 2**32, 2**32 + 512, math.inf, math.nan):
        for maximum in (0., .1, 24.1, 100.):
            machine.mem_write(actor + 0x160, struct.pack("<ff", health, maximum))
            machine.reg_write(r.UC_X86_REG_RBX, actor)
            machine.reg_write(r.UC_X86_REG_RBP, frame)
            machine.reg_write(r.UC_X86_REG_RSP, stack + 0x8000)
            machine.reg_write(r.UC_X86_REG_RSI, 0)
            machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
            machine.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
            set_float(r.UC_X86_REG_XMM7, 0.)
            set_float(r.UC_X86_REG_XMM9, threshold)
            rows.clear()
            machine.emu_start(START, 0, count=200)
            assert machine.reg_read(r.UC_X86_REG_RIP) == END
            assert rows == [(28, converted(maximum)), (22, converted(health))], (health, maximum, rows)
            cases += 1

    # Check the selected live seam and its existing ordering/gating consumers.
    # These are static source guards, not execution of the authored Rust test.
    actors = (ROOT / "crates/benilla-app/src/local_client/actors.rs").read_text()
    merge = actors.split(".merge_diff(fields, |field, old, new| {", 1)[1].split("if changed {", 1)[0]
    for token in ("object_type == ObjectType::Unit", "FIELD_UNIT_HEALTH", "FIELD_UNIT_MAXHEALTH",
                  "Some(field_event::UNIT_HEALTH)", "Some(field_event::UNIT_MAXHEALTH)",
                  "field_notices.write(FieldNotice::Unit", "guid: local.guid"):
        assert token in merge, token
    assert ".before(WorldStage::Net)" in actors
    unit_feed = (ROOT / "crates/benilla-app/src/ui_unit.rs").read_text()
    assert "feed_units\n                    .in_set(field_events::FieldEventPushes)" in unit_feed
    assert "field_events::fire_field_notices\n                    .after(field_events::FieldEventPushes)" in unit_feed
    field_events = (ROOT / "crates/benilla-app/src/ui_unit/field_events.rs").read_text()
    assert "if script.unit_has_field_watchers(guid)" in field_events
    assert "cursor.0.clear(&notices)" in field_events
    assert "for token in script.unit_tokens_of(guid)" in field_events

    out = STAGE if args.stage else KEPT
    if args.stage:
        out.mkdir(parents=True, exist_ok=True)
    assembly = "".join(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in instructions)
    context = [threshold_load, next(decoder.disasm(raw(0x14594ABB5, 3), 0x14594ABB5)),
               next(decoder.disasm(raw(0x14594AC00, 2), 0x14594AC00))]
    context_assembly = "".join(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in context)
    if args.stage:
        result = json.loads((STAGE / "rea-vitals/003-vitals.json").read_text())["response"]["result"]["structuredContent"]
        assert result["subject"]["digest"]["sha256"] == span(START, END - START)["sha256"]
        pseudo = "\n".join(line.rstrip() for line in result["normalized_result"].strip().splitlines()) + "\n"
        provider, evidence_id, profile = result["provider"], result["evidence_id"], result["analysis_profile"]["digest"]
    else:
        retained = json.loads((KEPT / "manifest.json").read_text())
        assert retained["ghidra_range"] == span(START, END - START)
        provider, evidence_id, profile = retained["provider"], retained["evidence_id"], retained["analysis_profile_sha256"]
        pseudo = (KEPT / "vitals.pseudo.c").read_text()
        assert hashlib.sha256(pseudo.encode()).hexdigest() == retained["pseudocode_sha256"]
    manifest = dict(target_version=target["version"], target_sha256=SHA, target_executed=False,
                    native_cases=cases, assembly=span(START, CONTINUATION - START),
                    ghidra_range=span(START, END - START), ceilf_thunk=span(0x145CF99F7, 6),
                    threshold_load=span(threshold_load.address, threshold_load.size),
                    threshold_constant=span(threshold_address, 4),
                    zero_simd=span(0x14594ABB5, 3), zero_integer=span(0x14594AC00, 2),
                    source_trace="actual local merge edges -> FieldNotice::Unit -> updated unit snapshots -> existing watcher gate and GUID token fan-out; absent VM drops notices",
                    guardian_yell=span(0x14730D06E, 24),
                    provider=provider, evidence_id=evidence_id,
                    analysis_profile_sha256=profile,
                    pseudocode_sha256=hashlib.sha256(pseudo.encode()).hexdigest(),
                    seams=["ceilf return supplied by host math", "descriptor-map insert captures field/value", "incoming actor and stack supplied by fixture; SIMD threshold read from verified current producer/constant"],
                    limits=["Raw Ghidra import begins inside the guardian engagement owner and stops before its continuation; bad-data halt is that boundary, not a native instruction.",
                            "Assembly retains current field-map, packet-queue continuation and following guardian yell; the fixture executes only the selected vital conversion block.",
                            "Existing benilla field watcher/token/FrameXML implementation is reused; this is not engine reconstruction or proof of complete native ownership.",
                            "Rust regression is authored, unrun. Compilation, actual game/addon cadence, ReloadUI interaction and original/rebuilt visual/latency parity remain unverified."])
    for name, text in (("native.asm", assembly), ("context.asm", context_assembly), ("vitals.pseudo.c", pseudo), ("manifest.json", json.dumps(manifest, indent=2) + "\n")):
        if args.stage:
            (out / name).write_text(text)
        else:
            assert (out / name).read_text() == text, name
    print(f"Guardian current-target vital publication: {cases} native fixture cases pass; no compilation/game")


if __name__ == "__main__":
    main()

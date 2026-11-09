#!/usr/bin/env python3
"""Check bounded talent selectors without compiling or running a game."""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = 0x145B44670
END = 0x145B44D13
DEFINITION = 0x14767D1F0
PAYLOAD = 0x14767C8B8
TABLE = 0x1476858DC
AGGREGATE = 0x145B38120
DIRECTORY = ROOT / "docs/analysis/evidence/talent-selector"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def recover_runtime_dispatch():
    """Join the 0.143.0 reset and Prepared tables to their source consumers."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    target = latest_target(verify=True)
    if target["sha256"] != "f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b":
        raise ValueError("Runtime dispatch correspondence requires the installed 0.143.0 bytes")
    target = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("dispatch_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        if (offset is None or size <= 0
                or pe.rva_offset(address + size - 1 - pe.image_base) != offset + size - 1):
            raise ValueError(f"Unmapped talent range at {address:#x}")
        return image[offset:offset + size]

    def span(start, end):
        return {"start": hex(start), "end_exclusive": hex(end),
                "file_offset": hex(pe.rva_offset(start - pe.image_base)),
                "sha256": digest(raw(start, end - start))}

    def pair(address):
        return struct.unpack("<QQ", raw(address, 16))

    def string(address):
        pointer, count = pair(address)
        return raw(pointer, count).decode()

    start, end = 0x145FCC910, 0x145FD0C65
    assert any((lo + pe.image_base, hi + pe.image_base) == (start, end)
               for lo, hi, _ in pe.functions())
    code = raw(start, end - start)
    instructions = {i.address: i for i in decoder.disasm(code, start)}
    assert sum(i.size for i in instructions.values()) == len(code)

    def instruction(address, mnemonic, operands):
        item = instructions[address]
        assert (item.mnemonic, item.op_str) == (mnemonic, operands)

    def table(site, address, targets):
        instruction(site, "jmp", "rcx")
        offsets = struct.unpack(f"<{len(targets)}i", raw(address, 4 * len(targets)))
        assert tuple(address + offset for offset in offsets) == targets
        assert all(target in instructions for target in targets)
        return {"selector": f"AS-context-table:{site:#x}", **span(address, address + 4 * len(targets)),
                "targets": [hex(target) for target in targets]}

    reset = table(0x145FCCE5A, 0x147B04F80, (
        0x145FCCE5C, 0x145FCD2C5, 0x145FCD2C5, 0x145FCD25E,
        0x145FCD2C5, 0x145FCD253, 0x145FCD276,
    ))
    prepared = table(0x145FD09C4, 0x147B04E18, (
        0x145FD09C6, 0x145FD0A17, 0x145FD0B76, 0x145FD0BAB, 0x145FD0BDF,
        0x145FCC98E, 0x145FD09F2, 0x145FD0A3C, 0x145FD0A74,
    ))
    outer_cell = 0x147B04E3C + (22 - 12) * 4
    assert 0x147B04E3C + struct.unpack("<i", raw(outer_cell, 4))[0] == 0x145FCCDF8
    instruction(0x145FCCBDE, "mov", "r12, qword ptr [rdx + 8]")
    instruction(0x145FCCE1C, "cmp", "byte ptr [rbp + 0x18d], 2")
    instruction(0x145FCCE30, "cmp", "r12b, 6")
    instruction(0x145FCD2DE, "call", "0x145fc60c0")
    instruction(0x145FCD2FA, "call", "0x145ec8740")
    instruction(0x145FCD2B7, "jbe", "0x145fcfbd1")
    instruction(0x145FCFBD6, "movss", "dword ptr [rax + r10*4], xmm8")
    instruction(0x145FCFC2D, "cmp", "dword ptr [r9 + 0x40], r10d")
    assert raw(0x14656C380, 4) == struct.pack("<f", 0.05)
    instruction(0x145FCC981, "cmp", "byte ptr [rcx + 0x10ee], 0")
    instruction(0x145FCC988, "je", "0x145fd0928")
    instruction(0x145FD09A2, "movzx", "edi, byte ptr [r15 + 0x465]")
    instruction(0x145FD09AA, "lea", "ecx, [rdi - 1]")
    instruction(0x145FD09AD, "cmp", "ecx, 8")
    instruction(0x145FD0C3E, "call", "0x145dde5a0")
    instruction(0x145FD0C45, "sub", "cl, al")
    instruction(0x145FD0C47, "mov", "byte ptr [r15 + 0x10ee], cl")

    catalog = 0x147742E20
    talents = effects = 0
    rows = []
    for class_index, class_id in enumerate((1, 2, 3, 4, 5, 7, 8, 9, 11)):
        descriptor = catalog + class_index * 200
        assert struct.unpack("<Q", raw(descriptor + 192, 8))[0] == class_id
        for tree in range(3):
            records, talent_count = pair(descriptor + tree * 64 + 48)
            assert 13 <= talent_count <= 14
            talents += talent_count
            for talent_index in range(talent_count):
                definition = records + talent_index * 176
                payloads, effect_count = pair(definition + 112)
                assert 1 <= effect_count <= 6
                effects += effect_count
                for effect_index in range(effect_count):
                    payload = payloads + effect_index * 64
                    effect = raw(payload, 64)
                    if struct.unpack_from("<I", effect)[0] != 22:
                        continue
                    selector = effect[8]
                    assert selector in (1, 2)
                    if selector == 1:
                        keys = [string(payload + 16)]
                    else:
                        keys_start, keys_count = pair(payload + 16)
                        keys = [string(keys_start + i * 16) for i in range(keys_count)]
                    rows.append({"talent": string(definition + 64), "selector": selector, "keys": keys,
                                 "seconds": struct.unpack_from("<f", effect, 32)[0],
                                 "effect": span(payload, payload + 64)})
    assert (talents, effects) == (355, 431)
    assert [(r["talent"], r["selector"], r["keys"], r["seconds"]) for r in rows] == [
        ("mortal_wounds", 2, ["mortal_strike", "execute"], 1.0),
        ("kill_shot", 1, ["aimed_shot"], 2.0),
    ]

    work = ROOT / "runtime/analysis/tasks/talent-selector/rea-145fcc910"
    journal_path = work / "journal.json"
    journal = json.loads(journal_path.read_text())
    plan_path = ROOT / journal["identity"]["plan"]["plan_path"]
    plan = json.loads(plan_path.read_text())
    operation, = journal["operations"].values()
    assert journal["status"] == operation["status"] == "completed"
    result = json.loads((ROOT / operation["result"]["path"]).read_text())
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])

    def receipt(path):
        return {"path": path.relative_to(ROOT).as_posix(), "sha256": digest(path.read_bytes())}

    query = {"procedure": hex(start), "slice_virtual_address": hex(start),
             "raw_input": receipt(ROOT / plan["target"]), "plan": receipt(plan_path),
             "journal": receipt(journal_path), "result": operation["result"],
             "provider": native["provider"], "evidence_id": native["evidence_id"],
             "analysis_profile_digest": native["analysis_profile"]["digest"]}
    verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)

    source = ROOT / "crates/azeroth-survivors-re"
    source_catalog = source / "assets/talents.json"
    source_talents = {talent["key"]: talent for cls in json.loads(source_catalog.read_text())["classes"]
                      for tree in cls["trees"] for talent in tree["talents"]}
    for row in rows:
        effect, = (item for item in source_talents[row["talent"]]["effects"] if item["tag"] == 10)
        payload = bytes.fromhex(effect["payload"])
        assert payload[8] == row["selector"]
        assert struct.unpack_from("<f", payload, 4)[0] == row["seconds"]
        keys = [item["value"] for item in effect["strings"] if item["offset"] == 16]
        keys += [key for item in effect["lists"] if item["offset"] == 16 for key in item["values"]]
        assert keys == row["keys"]
    source_bindings = [
        receipt(source_catalog),
        *(receipt(source / f"src/{path}") for path in (
            "run_effects/conditions.rs", "gameplay/mechanics/callbacks.rs",
            "gameplay/mechanics/prepared.rs",
        )),
    ]
    return {
        "schema_version": 1, "target": target, "gap_ids": [141, 148, 315],
        "bounded_contract_system_ids": ["custom-game-game-talents"],
        "owner": span(start, end), "tables": {"kill_reset": reset, "prepared": prepared},
        "ranges": {"reset_outer_cell": span(outer_cell, outer_cell + 4),
                   "reset_lookup": span(0x145FC60C0, 0x145FC624F),
                   "reset_writeback": span(0x145FCFBD1, 0x145FCFCB4),
                   "prepared_class_and_use": span(0x145FD0928, 0x145FD0C53),
                   "prepared_loadout": span(0x145DDE5A0, 0x145DDE7D4)},
        "talent_catalog": {**span(catalog, catalog + 9 * 200), "talents": talents,
                           "effects": effects, "kill_reset_rows": rows},
        "source_bindings": source_bindings, "query": query,
        "limits": "Exact selected runtime dispatches and authored talent reset rows. The raw Ghidra slice omits external tables and callees; original PE bytes bind those boundaries separately. No full talent-module, build, execution or parity claim.",
    }


def recover():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    if target["sha256"] != "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150":
        raise ValueError("This contract requires the registered 0.121.0 bytes")
    target = {k: target[k] for k in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("selector_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        if at is None or count < 0 or at + count > len(image):
            raise ValueError("Unmapped current native range")
        return image[at:at + count]

    def span(address, count):
        return {"virtual_address": hex(address), "file_offset": hex(pe.rva_offset(address - pe.image_base)),
                "byte_count": count, "sha256": digest(raw(address, count))}

    def text(address):
        pointer, count = struct.unpack("<QQ", raw(address, 16))
        return raw(pointer, count).decode()

    assert text(DEFINITION + 48) == "dark_pact"
    assert text(DEFINITION + 64) == "Soul Reaping"
    assert struct.unpack("<QQ", raw(DEFINITION + 96, 16)) == (PAYLOAD, 1)
    assert raw(DEFINITION + 32, 16) == bytes(16)
    assert raw(DEFINITION + 152, 4) == bytes([2, 2, 3, 0])
    assert raw(PAYLOAD, 64) == bytes.fromhex("24000000cdcc4c3d" + "00" * 56)
    assert TABLE + struct.unpack_from("<i", raw(TABLE, 148), 36 * 4)[0] == 0x145B44B43
    code = raw(BASE, END - BASE)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    instructions = list(decoder.disasm(code, BASE))
    assert sum(i.size for i in instructions) == len(code)
    aggregate_instructions = list(decoder.disasm(raw(AGGREGATE, 0x220), AGGREGATE))
    assert sum(i.size for i in aggregate_instructions) == 0x220
    admitted = {i.address for i in instructions + aggregate_instructions}
    constants = {}
    for i in instructions:
        if i.mnemonic == "movss" and i.operands[-1].type == 3 and i.operands[-1].mem.base == 41:
            address = i.address + i.size + i.operands[-1].mem.disp
            constants[i.op_str.split(",")[0]] = (address, raw(address, 4))
    # These are actual prologue loads, rather than inferred formula constants.
    assert struct.unpack("<f", constants["xmm6"][1])[0] == 1.0
    assert struct.unpack("<f", constants["xmm9"][1])[0] == -1.0
    assert struct.unpack("<f", constants["xmm10"][1])[0] == 0.5

    vm = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def memory(address, payload):
        for page in range(address & ~4095, (address + len(payload) + 4095) & ~4095, 4096):
            if page not in mapped:
                vm.mem_map(page, 4096)
                mapped.add(page)
        vm.mem_write(address, payload)

    memory(BASE, code)
    memory(AGGREGATE, raw(AGGREGATE, 0x220))
    memory(TABLE, raw(TABLE, 148))
    for address, value in constants.values():
        memory(address, value)
    memory(0x145FEC4A0, b"\xc3")
    memory(0x22000000, bytes(0x20000))
    memory(0x23000000, bytes(0x20000))
    stop = 0x2301FFF0
    steps = 0

    def q(address):
        return struct.unpack("<Q", vm.mem_read(address, 8))[0]

    def put(address, format_, *values):
        vm.mem_write(address, struct.pack(format_, *values))

    def hook(machine, address, size, data):
        nonlocal steps
        if address == 0x145FEC4A0:
            vector = machine.reg_read(reg.UC_X86_REG_RCX)
            put(vector, "<QQ", 4, 0x22008000)
            sp = machine.reg_read(reg.UC_X86_REG_RSP)
            machine.reg_write(reg.UC_X86_REG_RIP, q(sp))
            machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)
            return
        assert address in admitted, f"outside admitted original instructions: {address:x}"
        steps += 1

    vm.hook_add(UC_HOOK_CODE, hook)
    out, vector, entries, definition, effect = (0x22000000 + n for n in (0, 0x100, 0x200, 0x400, 0x800))
    cases = []
    for rank in range(256):
        memory(out, bytes(0x1000))
        put(vector, "<QQQ", 1, entries, 1)
        put(entries, "<QB", definition, rank)
        put(definition + 0x60, "<QQ", effect, 1)
        memory(effect, raw(PAYLOAD, 64))
        sp = 0x2301F000
        put(sp, "<Q", stop)
        for register, value in ((reg.UC_X86_REG_RCX, out), (reg.UC_X86_REG_RDX, vector),
                                (reg.UC_X86_REG_RSP, sp)):
            vm.reg_write(register, value)
        vm.emu_start(BASE, stop, count=10000)
        assert vm.reg_read(reg.UC_X86_REG_RIP) == stop
        assert q(out + 16) == 1 and q(q(out + 8)) == definition
        row = q(out + 8) + 8
        coefficient = bytes(vm.mem_read(row + 4, 4))
        f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
        factor = max(f32(f32(float(max(rank, 1)) - 1.0) * 0.5) + 1.0, 1.0)
        expected = struct.pack("<f", f32(struct.unpack("<f", raw(PAYLOAD + 4, 4))[0] * factor))
        assert bytes(vm.mem_read(row, 1)) == b"\x24" and coefficient == expected
        # The downstream current aggregate must retain raw36 as a generic row.
        result, generic, metadata = 0x22001000, 0x22002000, 0x22003000
        memory(result, bytes(0x100))
        put(result + 0x30, "<QQQ", 1, generic, 0)
        put(result + 0x48, "<QQQ", 1, metadata, 0)
        label = 0x22004000
        put(label, "<QQQQQ", 0xFFFFFFFFFFFFFFFF, 1, 0, 0, 0)
        put(sp, "<Q", stop)
        for register, value in ((reg.UC_X86_REG_RCX, result), (reg.UC_X86_REG_RDX, row),
                                (reg.UC_X86_REG_R8, label), (reg.UC_X86_REG_RSP, sp)):
            vm.reg_write(register, value)
        vm.emu_start(AGGREGATE, stop, count=10000)
        assert vm.reg_read(reg.UC_X86_REG_RIP) == stop
        assert q(result + 0x40) == 1 and bytes(vm.mem_read(generic, 1)) == b"\x24"
        assert bytes(vm.mem_read(generic + 4, 4)) == coefficient
        cases.append({"rank": rank, "coefficient_bits": coefficient.hex(), "generic_rows": 1})

    sources = ["crates/azeroth-survivors-re/src/run_effects.rs",
               "crates/azeroth-survivors-re/src/player_abilities/behavior/soul_reaping.rs"]
    source = (ROOT / sources[0]).read_text()
    assert "value.bytes[63] == 35" in source and "(f32::from(rank) - 1.0) * 0.5 + 1.0" in source
    assert "row.bytes[63] == 35" in (ROOT / sources[1]).read_text()
    source_bindings = []
    for symbol, start, end in (
        ("EffectRow::talent", "    pub fn talent(", "    pub fn amulet("),
        ("Effects::rebuild", "    pub fn rebuild(", "    pub fn sum("),
    ):
        fragment = source[source.index(start):source.index(end)]
        source_bindings.append({"path": sources[0], "symbol": symbol,
                                "start_marker": start, "end_marker": end,
                                "fragment_sha256": digest(fragment.encode())})
    source_bindings.append({"path": sources[1], "sha256": digest((ROOT / sources[1]).read_bytes())})
    queries = []
    subject_root = ROOT / "runtime/analysis/history/findings/fixgap/de557e34e98e/resource-query/talent-selector"
    for role, plan_path, output, procedure, mapping in (
        ("rank-owner", subject_root / "plan-v2.json", subject_root / "query-v2", BASE, BASE),
        ("aggregate-caller", subject_root / "caller/plan.json", subject_root / "caller/query",
         0x145B383E0, 0x145B383E0),
    ):
        journal_path = output / "journal.json"
        journal = json.loads(journal_path.read_text())
        assert journal["status"] == "completed"
        operation = next(op for op in journal["operations"].values()
                         if op["arguments"].get("procedure") == hex(procedure))
        assert operation["status"] == "completed"
        result_path = ROOT / operation["result"]["path"]
        assert digest(result_path.read_bytes()) == operation["result"]["sha256"]
        result = json.loads(result_path.read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        def receipt(path):
            return {"path": str(path.relative_to(ROOT)), "sha256": digest(path.read_bytes())}
        plan = json.loads(plan_path.read_text())
        query = {"role": role, "procedure": hex(procedure), "evidence_id": native["evidence_id"],
                 "provider": native["provider"], "analysis_profile_digest": native["analysis_profile"]["digest"],
                 "normalized_text_sha256": digest(native["normalized_result"].encode()),
                 "plan": receipt(plan_path), "journal": receipt(journal_path), "result": receipt(result_path),
                 "raw_input": receipt(ROOT / plan["target"]), "slice_virtual_address": hex(mapping)}
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        queries.append(query)
    proof = {"schema_version": 1, "target": target, "gap_ids": [249],
             "bounded_contract_system_ids": ["custom-game-talents"],
             "bounded_contract_owner_scopes": {"custom-game-talents":
                 "Exact Soul Reaping definition/raw36 identity, all-byte rank scaling and generic aggregate publication; full current combat/DoT consumers, source execution and parity remain separate."},
             "classification": "current_raw36_is_retained_Soul_Reaping_not_new_absent_gameplay",
             "definition": {**span(DEFINITION, 160), "key": text(DEFINITION + 48),
                            "name": text(DEFINITION + 64), "description": text(DEFINITION + 112)},
             "payload": {**span(PAYLOAD, 64), "bytes_hex": raw(PAYLOAD, 64).hex()},
             "ranges": [span(BASE, END - BASE), span(AGGREGATE, 0x220), span(TABLE, 148)],
             "constants": [{"register": key, **span(address, 4), "bytes_hex": value.hex()}
                           for key, (address, value) in constants.items()],
             "cases": cases, "original_instruction_steps": steps,
             "queries": queries,
             "source_bindings": source_bindings,
             "seams": ["Synthetic one-entry talent vector and allocator capacity growth",
                       "Aggregate vectors have preallocated capacity; label uses borrowed sentinel"],
             "limits": "Current rank-scaling and generic-row publication only. Retained source marker253/35 preserves semantic identity; no whole current combat/DoT consumer or parity claim. No application compilation, game, network or server execution."}
    return proof, "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in instructions)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--runtime-dispatch", action="store_true", help="Verify the 0.143.0 runtime selectors")
    args = parser.parse_args()
    if args.runtime_dispatch:
        proof = recover_runtime_dispatch()
        path = DIRECTORY / "runtime-dispatch.json"
        value = json.dumps(proof, indent=2, ensure_ascii=False) + "\n"
        if args.write:
            path.write_text(value)
        elif path.read_text() != value:
            raise ValueError("Stale runtime talent dispatch contract")
        print("0.143.0 runtime talent dispatch: 16 table cells, 355 talent records and 2 live reset rows verified")
        return
    proof, assembly = recover()
    outputs = {DIRECTORY / "contract.json": json.dumps(proof, indent=2, ensure_ascii=False) + "\n",
               DIRECTORY / "rank-owner.asm": assembly}
    for path, value in outputs.items():
        if args.write:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(value)
        elif path.read_text() != value:
            raise ValueError("Stale selector contract: " + str(path.relative_to(ROOT)))
    print(f"256 rank and 256 generic-publication cases pass; {proof['original_instruction_steps']} original instruction steps; no compilation or game")


if __name__ == "__main__":
    main()

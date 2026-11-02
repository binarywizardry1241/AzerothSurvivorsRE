#!/usr/bin/env python3
"""Check #249's current Soul Reaping selector without compiling or running a game."""
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
DIRECTORY = ROOT / "docs/analysis/evidence/0.121.0/talent-selector"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


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
    subject_root = ROOT / "runtime/fixgap-0.121.0/resource-query/talent-selector"
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
    args = parser.parse_args()
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

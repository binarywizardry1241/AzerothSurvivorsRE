#!/usr/bin/env python3
"""Replay current Heroic stat consumers with explicit constructor-prefix seams.

No compilation, game, engine, socket or server runs. Curves, powf, actor storage
and party health have independent owners; this checks rank selection and the
original final stat arithmetic with synthetic finite inputs.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

KEPT = ROOT / "docs/analysis/evidence/0.121.0/heroic-scaling"
RANGES = {
    "ordinary-health": (0x145c14eb3, 0x145c14ee0),
    "ordinary-damage": (0x145c150c5, 0x145c150dc),
    "ordinary-packed-stats": (0x145c15176, 0x145c15189),
    "boss-rank": (0x145c27846, 0x145c27886),
    "boss-health": (0x145c27a0a, 0x145c27a2b),
    "boss-damage": (0x145c27c9d, 0x145c27cd8),
}


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def f(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def receipt(path):
    return dict(path=str(path.relative_to(ROOT)), sha256=sha(path.read_bytes()))


def context():
    selected = latest_target(verify=True)
    assert selected["version"] == "0.121.0"
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("heroic_scaling_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    return target, image, pe


def query_record(directory, procedure, plan_name="plan.json", output="query"):
    plan_path = directory / plan_name
    plan = json.loads(plan_path.read_text())
    journal = json.loads((directory / output / "journal.json").read_text())
    operation = next(row for row in journal["operations"].values()
                     if row["arguments"] == dict(procedure=procedure) and row["status"] == "completed")
    result_path = project_path(operation["result"]["path"])
    response = json.loads(result_path.read_text())
    native = response.get("structuredContent") or json.loads(response["content"][0]["text"])
    return dict(procedure=procedure, evidence_id=native["evidence_id"], provider=native["provider"],
                analysis_profile_digest=native["analysis_profile"]["digest"],
                slice_virtual_address=plan["open_options"]["entry_point"],
                raw_input=receipt(project_path(plan["target"])), plan=receipt(plan_path),
                journal=receipt(directory / output / "journal.json"), result=receipt(result_path))


def run(write):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    import unicorn.x86_const as reg
    target, image, pe = context()
    path = KEPT / "manifest.json"
    old = None if write else json.loads(path.read_text())
    core = json.loads((ROOT / "docs/analysis/evidence/0.121.0/heroic-source.json").read_text())
    descriptor = next(row for row in core["native_data"] if row["role"] == "heroic-five-descriptors")
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def install(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, raw)

    def original(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    table = int(descriptor["virtual_address"], 16)
    raw = original(table, descriptor["byte_count"])
    assert raw == bytes.fromhex(descriptor["bytes_hex"]) and sha(raw) == descriptor["sha256"]
    install(table, raw)
    rows, data = [], {}
    for role, (start, end) in RANGES.items():
        raw = original(start, end - start)
        instructions = list(decoder.disasm(raw, start))
        assert sum(row.size for row in instructions) == len(raw), role
        text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                       for i in instructions)
        assembly = KEPT / f"{role}.asm"
        if write:
            assembly.parent.mkdir(parents=True, exist_ok=True)
            assembly.write_text(text)
        else:
            assert assembly.read_text() == text
        rows.append(dict(role=role, virtual_address=hex(start), byte_count=len(raw), sha256=sha(raw),
                         instruction_count=len(instructions), assembly=receipt(assembly)))
        install(start, raw)
        for instruction in instructions:
            for operand in instruction.operands:
                if operand.type == CS_OP_MEM and instruction.reg_name(operand.mem.base) == "rip":
                    address = instruction.address + instruction.size + operand.mem.disp
                    if address == table:
                        continue
                    payload = original(address, 16)
                    install(address, payload)
                    data[hex(address)] = dict(byte_count=16, sha256=sha(payload))
    queries = [query_record(ROOT / "runtime/analysis/history/findings/fixgap-238-239/efeee1fba607/ordinary-constructor", "0x145c14ae0"),
               query_record(ROOT / "runtime/analysis/history/findings/fixgap219/888a65e3edb9/scaling/boss", "0x145c275f0", "plan-fixed.json", "query-fixed")]
    for query in queries:
        result = json.loads(project_path(query["result"]["path"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    state, frame, definition = 0x22000000, 0x23000080, 0x24000000
    install(state, bytes(4096))
    install(frame - 0x80, bytes(4096))
    install(definition, bytes(4096))
    machine.reg_write(reg.UC_X86_REG_RSI, state)
    machine.reg_write(reg.UC_X86_REG_RBP, frame)

    def xmm(index, value):
        machine.reg_write(getattr(reg, f"UC_X86_REG_XMM{index}"), bits(value))

    def low(index):
        return machine.reg_read(getattr(reg, f"UC_X86_REG_XMM{index}")) & 0xffffffff

    def execute(role):
        start, end = RANGES[role]
        machine.emu_start(start, end, count=100)

    cases = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        hp, damage = (struct.unpack_from("<ff", original(table + (rank - 1) * 48 + 32, 8))
                      if 1 <= rank <= 5 else (1., 1.))
        for prefix in (0.0, 0.125, 37.875, 99999.75):
            machine.reg_write(reg.UC_X86_REG_RDI, rank)
            xmm(6, prefix)
            execute("ordinary-health")
            assert low(6) == bits(f(f(prefix) * hp))
            execute("ordinary-damage")
            assert low(15) == bits(damage)
            xmm(0, prefix)
            xmm(14, 3.2)
            execute("ordinary-packed-stats")
            packed = machine.reg_read(reg.UC_X86_REG_XMM1)
            assert packed & 0xffffffff == bits(f(damage * f(prefix)))
            assert packed >> 32 & 0xffffffff == bits(f(f(1.05) * f(3.2)))
            for zone, independent, power in ((1., 1., 1.), (2.3, 1.37, 1.22)):
                machine.mem_write(state + 0x36f, bytes([rank]))
                execute("boss-rank")
                assert low(1) == bits(hp)
                for index, value in ((0, power), (2, prefix), (3, independent),
                                     (4, 1.), (6, 1.), (8, zone)):
                    xmm(index, value)
                execute("boss-health")
                expected = f(f(prefix) * f(5.75))
                expected = f(expected * f(zone))
                expected = f(expected * f(independent))
                expected = f(f(power) * expected)
                expected = f(expected * hp)
                assert low(6) == bits(expected)
                machine.mem_write(frame + 0x1d8, struct.pack("<Q", definition))
                machine.mem_write(definition + 0x58, struct.pack("<f", prefix))
                machine.mem_write(state + 0xcf8, struct.pack("<f", independent))
                xmm(8, zone)
                xmm(7, power)
                execute("boss-damage")
                expected_damage = f(f(f(zone) * f(independent)) ** 0.5)
                expected_damage = f(expected_damage * f(prefix))
                expected_damage = f(f(power) * expected_damage)
                expected_damage = f(expected_damage * damage)
                assert low(7) == bits(expected_damage)
                cases.append([rank, bits(prefix), bits(zone), low(6), low(7)])
    proof = dict(schema_version=1, target=target, gap_ids=[219],
                 descriptor_reference=dict(path="docs/analysis/evidence/0.121.0/heroic-source.json",
                                           role=descriptor["role"], sha256=descriptor["sha256"]),
                 native_ranges=rows, native_data=data, queries=queries,
                 static_cases=len(cases), cases_sha256=sha(json.dumps(cases).encode()),
                 source_refs=["crates/azeroth-survivors-re/src/enemies/scaling.rs",
                              "crates/azeroth-survivors-re/src/bosses/scaling.rs",
                              "crates/azeroth-survivors-re/src/gameplay/mechanics.rs",
                              "crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs"],
                 limits=__doc__, target_executed=False, runtime_validation="not_run", parity="unverified")
    if write:
        path.write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert old == proof
    print(json.dumps(dict(stat_cases=len(cases), queries=len(queries), native_ranges=len(rows), target_executed=False)))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    run(parser.parse_args().write)

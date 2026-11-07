#!/usr/bin/env python3
"""Verify current star arithmetic with original instructions and synthetic memory.

This does not compile or run the application. Native allocator and roundf calls
are declared synthetic seams; only the selected recovered arithmetic executes.
"""
import hashlib
import argparse
import json
import math
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/gear-stars.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def retained(row):
    path = project_path(row["path"])
    assert digest(path.read_bytes()) == row["sha256"], row["path"]
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"]
    image = target_bytes(target)
    pe = load_script("stars_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert digest(raw) == row["sha256"] and raw == bytes.fromhex(row["bytes_hex"])
        if row.get("instruction_count") is not None:
            instructions = list(decoder.disasm(raw, address))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
    for query in proof["queries"]:
        raw = json.loads(retained(query["result"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert digest(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for row in proof["source_bindings"]:
        retained(row)
    for imported in proof["native_imports"]:
        library = next(row for row in pe.imports() if row["library"] == imported["library"])
        index = library["functions"].index(imported["name"])
        slot = int(library["iat_start_address"], 16) + index * 8
        assert slot == int(imported["iat_address"], 16)
        thunk = int(imported["thunk"], 16)
        at = pe.rva_offset(thunk - pe.image_base)
        raw = image[at:at + 6]
        assert raw[:2] == b"\xff\x25" and thunk + 6 + struct.unpack("<i", raw[2:])[0] == slot
    source = (ROOT / "crates/azeroth-survivors-re/src/gear_stars.rs").read_text()
    arrays = dict(re.findall(r"const (STEP|FINAL): \[f32; 6\] = \[([^]]+)\];", source))
    for name, role in (("STEP", "ordinary-star-table"), ("FINAL", "final-star-table")):
        native = next(row for row in proof["native_data"] if row["role"] == role)
        values = [f32(float(value.strip())) for value in arrays[name].split(",")]
        assert struct.pack("<6f", *values) == bytes.fromhex(native["bytes_hex"])
    assert proof["application_executed"] is False


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for address, size in ((0x145b00000, 0x1000), (0x145c71000, 0x1000),
                          (0x14765c000, 0x1000), (0x147694000, 0x1000),
                          (0x145feb000, 0x1000), (0x140002000, 0x1000),
                          (0x146198000, 0x1000),
                          (0x22000000, 0x20000)):
        machine.mem_map(address, size)
    rows = {r["role"]: r for r in proof["native_ranges"] + proof["native_data"]}
    for role in ("total-star-helper", "increment-star-helper", "effect-projector",
                 "ordinary-star-table", "final-star-table", "effect-first-dispatch",
                 "effect-next-dispatch", "four-star-constant"):
        row = rows[role]
        machine.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    for address in (0x140002200, 0x1400021c0, 0x145febc75):
        machine.mem_write(address, b"\xc3")
    machine.mem_write(0x2201fff0, b"\xcc")
    step = struct.unpack("<6f", bytes.fromhex(rows["ordinary-star-table"]["bytes_hex"]))
    final = struct.unpack("<6f", bytes.fromhex(rows["final-star-table"]["bytes_hex"]))
    state = {"stop": None, "steps": 0}
    cases = []

    def ret(value=None):
        if value is not None:
            machine.reg_write(reg.UC_X86_REG_RAX, value)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, struct.unpack("<Q", machine.mem_read(sp, 8))[0])
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(uc, address, _size, _context):
        state["steps"] += 1
        if address == state["stop"]:
            uc.emu_stop()
        elif address == 0x140002200:
            ret()
        elif address == 0x1400021c0:
            assert uc.reg_read(reg.UC_X86_REG_RCX) == 32
            assert uc.reg_read(reg.UC_X86_REG_RDX) == 4
            ret(0x22001000)
        elif address == 0x145febc75:
            value = struct.unpack("<f", struct.pack("<I", uc.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff))[0]
            rounded = math.copysign(math.floor(abs(value) + 0.5), value)
            uc.reg_write(reg.UC_X86_REG_XMM0, int.from_bytes(struct.pack("<f", rounded), "little"))
            ret()

    machine.hook_add(UC_HOOK_CODE, hook)

    def total(tier, stars):
        ordinary = f32(min(stars, 4) * step[min(tier, 5)])
        return f32(ordinary + final[min(tier, 5)]) if stars > 4 else ordinary

    for tier in [0, 1, 2, 3, 4, 5, 6, 100]:
        for stars in [1, 2, 3, 4, 5, 6, 8, 255]:
            for kind, start, stop in (("total", 0x145b00b15, 0x145b00b5a),
                                      ("increment", 0x145b008b5, 0x145b0096f)):
                machine.mem_write(0x22000848, struct.pack("<Q", tier))
                machine.reg_write(reg.UC_X86_REG_RBP, 0x22000800)
                machine.reg_write(reg.UC_X86_REG_RBX, stars)
                machine.reg_write(reg.UC_X86_REG_XMM0, 0)
                state["stop"] = stop
                try:
                    machine.emu_start(start, 0, count=100)
                except Exception as error:
                    raise AssertionError((kind, tier, stars, hex(machine.reg_read(reg.UC_X86_REG_RIP)))) from error
                actual = machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
                expected = total(tier, stars)
                if kind == "increment":
                    expected = f32(expected - total(tier, stars - 1))
                assert actual == struct.unpack("<I", struct.pack("<f", expected))[0], (kind, tier, stars)
                cases.append({"kind": kind, "tier": tier, "stars": stars, "result_bits": hex(actual)})

    for tag in range(15):
        for value in [0.0, 0.5, 5.0, 10.25, -3.75]:
            for factor in [0.12, 0.6, 4.16]:
                # One record avoids a generic Vec growth call. Allocator and
                # C roundf interfaces are synthetic, explicit fixture seams.
                machine.mem_write(0x22000000, struct.pack("<If", tag, value))
                machine.mem_write(0x22000100, struct.pack("<QQQ", 0x22000000, 0x22000008, 0x22000200))
                machine.mem_write(0x22000200, struct.pack("<f", factor))
                machine.mem_write(0x22000400, struct.pack("<Q", 0x2201fff0))
                machine.reg_write(reg.UC_X86_REG_RSP, 0x22000400)
                machine.reg_write(reg.UC_X86_REG_RCX, 0x22000300)
                machine.reg_write(reg.UC_X86_REG_RDX, 0x22000100)
                state["stop"] = 0x2201fff0
                try:
                    machine.emu_start(0x145c71430, 0, count=1000)
                except Exception as error:
                    raise AssertionError(("projector", tag, value, factor,
                                          hex(machine.reg_read(reg.UC_X86_REG_RIP)))) from error
                _cap, pointer, count = struct.unpack("<QQQ", machine.mem_read(0x22000300, 24))
                assert count == int(tag != 11)
                if count:
                    actual_tag, actual_value = struct.unpack("<If", machine.mem_read(pointer, 8))
                    expected = f32(f32(value) * f32(factor))
                    if tag == 2:
                        expected = f32(math.copysign(math.floor(abs(expected) + 0.5), expected))
                    assert actual_tag == tag and struct.pack("<f", actual_value) == struct.pack("<f", expected)
                cases.append({"kind": "projector", "tag": tag, "value": value, "factor": factor, "rows": count})
    return {"cases": len(cases), "original_instruction_steps": state["steps"],
            "cases_sha256": digest(json.dumps(cases, sort_keys=True).encode()),
            "synthetic_seams": ["scalar inputs", "one-record allocator", "imported C roundf"],
            "application_executed": False, "compilation": "not_run", "parity": "unverified"}


def replay_current(proof):
    """Replay the changed scalar, missing-tag and armor/weapon boundaries.

    The bridge receives synthetic descriptor rows; its allocation/descriptor
    construction and the application are not executed.
    """
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    rows = {row['role']: row for row in proof['native_ranges'] + proof['native_data']}
    for row in rows.values():
        address = int(row['virtual_address'], 16)
        for page in range(address & ~4095, (address + row['byte_count'] + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, bytes.fromhex(row['bytes_hex']))
    machine.mem_map(0x22000000, 0x40000)
    stop = 0x2203fff0
    machine.mem_write(stop, b'\xcc')
    state = dict(stop=stop, steps=0)

    def hook(uc, address, _size, _context):
        state['steps'] += 1
        if address == state['stop']:
            uc.emu_stop()
        elif address == 0x14606176f:
            bits = uc.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
            value = struct.unpack('<f', struct.pack('<I', bits))[0]
            value = math.copysign(math.floor(abs(value) + 0.5), value)
            uc.reg_write(reg.UC_X86_REG_XMM0, int.from_bytes(struct.pack('<f', value), 'little'))
            sp = uc.reg_read(reg.UC_X86_REG_RSP)
            uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack('<Q', uc.mem_read(sp, 8))[0])
            uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    machine.hook_add(UC_HOOK_CODE, hook)
    steps = struct.unpack('<6f', bytes.fromhex(rows['ordinary-star-table']['bytes_hex']))
    finals = struct.unpack('<6f', bytes.fromhex(rows['final-star-table']['bytes_hex']))
    targets = struct.unpack('<6f', bytes.fromhex(rows['final-target-table']['bytes_hex']))
    assert targets == tuple(f32(v) for v in (0.90, 0.92, 0.94, 0.96, 1.0, 0.98))

    def total(tier, stars):
        ordinary = f32(min(stars, 4) * steps[min(tier, 5)])
        return f32(ordinary + finals[min(tier, 5)]) if stars > 4 else ordinary

    cases = []
    for tier in (0, 1, 2, 3, 4, 5, 6, 100):
        for stars in (1, 2, 3, 4, 5, 6, 8, 255):
            for kind, start, end in (('total', 0x145b85347, 0x145b8538c),
                                     ('increment', 0x145b84f37, 0x145b84ff5)):
                machine.mem_write(0x22000848, struct.pack('<Q', tier))
                machine.reg_write(reg.UC_X86_REG_RBP, 0x22000800)
                machine.reg_write(reg.UC_X86_REG_RBX, stars)
                state['stop'] = end
                machine.emu_start(start, 0, count=100)
                expected = total(tier, stars)
                if kind == 'increment':
                    expected = f32(expected - total(tier, stars - 1))
                actual = machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
                assert actual == int.from_bytes(struct.pack('<f', expected), 'little'), (kind, tier, stars)
                cases.append((kind, tier, stars, actual))

    for slot in range(12):
        machine.reg_write(reg.UC_X86_REG_R13, 4)
        machine.reg_write(reg.UC_X86_REG_R12, slot)
        state['stop'] = 0x145b87404
        machine.emu_start(0x145b873e2, 0, count=20)
        expected = 0x3cac08310000000c if slot < 8 else 0x10000000b
        assert machine.reg_read(reg.UC_X86_REG_R13) == expected
        cases.append(('legendary-extra', slot, expected))

    reference = [(tag, f32((tag + 1) * 0.375)) for tag in range(15)]
    for tier in range(6):
        for present in ([], [2], [12], [0, 1, 2, 4, 12], list(range(15))):
            # Real closure shape: references to descriptor and multiplier.
            machine.mem_write(0x22000000, bytes(0x20000))
            machine.mem_write(0x22001000, b''.join(struct.pack('<If', *row) for row in reference))
            machine.mem_write(0x22002000, b''.join(struct.pack('<If', tag, 1.) for tag in present))
            machine.mem_write(0x22000100, struct.pack('<QQQQ', 0, 0x22001000, 0, 0x22001000 + len(reference) * 8))
            machine.mem_write(0x22000720, struct.pack('<QQ', 0x22002000, len(present)))
            machine.mem_write(0x22000600, struct.pack('<Q', 0x22000700))
            machine.mem_write(0x22000650, struct.pack('<Q', 0x22000680))
            machine.mem_write(0x22000680, struct.pack('<f', targets[tier]))
            machine.mem_write(0x22000900, struct.pack('<QQ', 0x22000600, 0x22000650))
            machine.mem_write(0x2201f000, struct.pack('<Q', stop))
            for name, value in (('RCX', 0x22000100), ('RDX', 0x22008000), ('R8', 0x22008000),
                                ('R9', 0x22000900), ('RSP', 0x2201f000)):
                machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
            state['stop'] = stop
            try:
                machine.emu_start(0x145d0e1a0, 0, count=10000)
            except Exception as error:
                raise AssertionError(('missing-tag-filter', tier, present,
                    hex(machine.reg_read(reg.UC_X86_REG_RIP)))) from error
            end = machine.reg_read(reg.UC_X86_REG_RDX)
            actual = bytes(machine.mem_read(0x22008000, end - 0x22008000))
            expected = []
            for tag, value in reference:
                if tag == 11 or tag in present:
                    continue
                value = f32(value * targets[tier])
                if tag == 2:
                    value = f32(math.copysign(math.floor(abs(value) + 0.5), value))
                expected.append((tag, value))
            assert actual == b''.join(struct.pack('<If', *row) for row in expected), (tier, present)
            cases.append(('missing-tags', tier, present, actual.hex()))
    source = (ROOT / 'crates/azeroth-survivors-re/src/gear_stars.rs').read_text()
    armory = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
    for fragment in ('rarity == 4 || slot >= 8', '0x3f19_9999', '*tag != 11',
                     '!base.iter().any', 'stars == 5', 'FINAL_TARGET[rarity.min(5)]'):
        assert fragment in source, fragment
    for fragment in ('effect.value = f32::from_bits(0x3cac_0831)',
                     'tier3.get(&(class, piece.slot))', 'gear_stars::final_star_effects',
                     '&base, piece.rarity, offer.rank, true, &piece.final_star_effects'):
        assert fragment in armory, fragment
    return dict(cases=len(cases), original_instruction_steps=state['steps'],
                cases_sha256=digest(json.dumps(cases, sort_keys=True).encode()),
                synthetic_seams=['scalar inputs', 'descriptor effects', 'preallocated output', 'C roundf'],
                application_executed=False, compilation='not_run', parity='unverified')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', type=project_path, default=MANIFEST)
    args = parser.parse_args()
    proof = json.loads(args.proof.read_text())
    verify(proof)
    result = replay_current(proof) if proof['target']['version'] == '0.127.0' else replay(proof)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

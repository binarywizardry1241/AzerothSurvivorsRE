#!/usr/bin/env python3
"""Recover the selected 0.105.0 boss records and bounded reach instructions.

This reads the hash-bound PE and optionally runs its no-call reach instructions
with synthetic registers. It never launches the game or compiles source. REA's
constructor pseudocode is one shared canonical extract for catalog and voice work.
"""
from portable_paths import objdump_output, portable_record
from script_sources import load_script
import argparse
import bisect
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
RUN = ROOT / "runtime/boss-catalog-0.105.0"
OUT = ROOT / "docs/analysis/evidence/0.105.0/boss-catalog"
SOURCE = ROOT / "crates/azeroth-survivors-re/src/guardians/catalog.rs"
TABLE, CREATOR, CREATOR_END = 0x146BA9450, 0x14592FF90, 0x145930DF2
REACH_START, REACH_END = 0x145930588, 0x1459305A8
KEYS = ("elwynn", "duskwood", "wsg", "ungoro", "ab", "feralas", "arena", "sm", "av", "brm", "aq", "naxx")
INT_FIELDS = (("id", 12), ("model_id", 13), ("raw_3c", 15), ("raw_50", 20))
FLOAT_FIELDS = (("scale", 14), ("time_minutes", 16), ("base_hp", 17), ("base_damage", 18), ("raw_4c", 19))


def serialized(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def current_reach(contract_path, collect):
    """Replay supplied current constructor arithmetic with immutable bytes."""
    from coverage_common import latest_target, target_bytes
    contract = json.loads((ROOT / contract_path).read_text())
    target = latest_target(verify=True)
    assert target['sha256'] == contract['target']['sha256']
    data = target_bytes(target)
    pe = load_script('inventory', ROOT / 'scripts/inventory-executable.py').PE(data)
    def number(value): return int(value, 0) if isinstance(value, str) else value
    def raw(start, size):
        at = pe.rva_offset(start - pe.image_base)
        return data[at:at + size]
    for row in contract['reach_ranges'] + contract['reach_constants']:
        assert hashlib.sha256(raw(number(row['start']), row['byte_count'])).hexdigest() == row['sha256']
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(row['rva'] + max(row['virtual_size'], row['raw_size']) for row in pe.sections)
    machine.mem_map(pe.image_base, (image_end + 4095) & ~4095)
    for row in pe.sections:
        machine.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    base = 0x20000000
    machine.mem_map(base, 0x4000)
    active = []
    def reg(name, value=None):
        key = getattr(x, 'UC_X86_REG_' + name)
        if value is None: return machine.reg_read(key)
        machine.reg_write(key, value)
    def hook(_, pc, size, unused):
        assert any(lo <= pc and pc + size <= hi for lo, hi in active), f'Unreviewed instruction {pc:#x}'
        assert bytes(machine.mem_read(pc, size)) == raw(pc, size)
    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for kind, spec in contract['reach_sequences'].items():
        inputs = [dict(id=row['id'], scale_bits=row['scale_bits']) for row in contract['entries']
                  if row['kind'] == ('bosses' if kind == 'bosses' else 'enemies')]
        inputs += [dict(id=None, scale_bits=value) for value in
                   (0, 0x80000000, 0xbf800000, 0x406aaaa9, 0x406aaaaa, 0x406aaaab,
                    0x7f800000, 0xff800000, 0x7fc00000)]
        for row in inputs:
            machine.mem_write(base, bytes(0x4000))
            reg('MXCSR', 0x1f80)
            for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
                reg(name, 0)
            for i in range(16): reg('XMM' + str(i), 0)
            for name in spec['definition_registers']: reg(name, base)
            reg('RBP', base + 0x1000)
            machine.mem_write(base + spec['scale_offset'], struct.pack('<I', row['scale_bits']))
            for name in spec['ranges']:
                selected = next(value for value in contract['reach_ranges'] if value['role'] == name)
                start = number(selected['start']); end = start + selected['byte_count']
                active[:] = [(start, end)]; machine.emu_start(start, end, count=100)
            cases.append(dict(kind=kind, **row, melee_reach_bits=reg(spec['output_register']) & 0xffffffff))
    result = dict(target_sha256=target['sha256'], cases=cases,
                  limits=['Only supplied no-call constructor ranges execute in synthetic memory; no client/game/server/network or reconstructed code runs.'])
    path = ROOT / contract['reach_vectors']
    assert path.resolve().is_relative_to(ROOT)
    if collect: path.write_text(serialized(result))
    else: assert portable_record(json.loads(path.read_text())) == portable_record(result)
    print(f'Verified {len(cases)} current enemy, guardian and boss reach instruction cases')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--write-source", action="store_true")
    parser.add_argument("--prepare-rea", action="store_true")
    parser.add_argument("--find-current-reach", action="store_true",
                        help="Locate current MINSS 9.0 candidates for the retained boss reach contract")
    parser.add_argument("--reach-contract", help="Current target/ranges/layout input for bounded reach checks")
    parser.add_argument("--collect-reach", action="store_true", help="Save selected --reach-contract instruction vectors")
    args = parser.parse_args()
    if args.reach_contract:
        current_reach(args.reach_contract, args.collect_reach)
        return
    if args.collect_reach:
        parser.error('--collect-reach requires --reach-contract')
    if args.find_current_reach:
        from coverage_common import latest_target, target_bytes
        target = latest_target(verify=True)
        data = target_bytes(target)
        module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
        pe = module.PE(data)
        functions = sorted((pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions())
        starts = [a for a, _ in functions]
        for match in re.finditer(rb'\xf3\x0f\x5d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]....', data, re.S):
            va = pe.offset_va(match.start())
            if va is None:
                continue
            pointer = va + 8 + struct.unpack_from('<i', match[0], 4)[0]
            try:
                offset = pe.rva_offset(pointer - pe.image_base)
            except ValueError:
                continue
            if data[offset:offset + 4] != struct.pack('<f', 9.0):
                continue
            index = bisect.bisect_right(starts, va) - 1
            owner = functions[index] if index >= 0 and va < functions[index][1] else None
            print(json.dumps(dict(site=hex(va), constant=hex(pointer),
                                  declared_owner=[hex(value) for value in owner] if owner else None)))
        return
    assert not (args.check and args.write_source)
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE hash mismatch"
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    bounds = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    assert bounds[CREATOR] == CREATOR_END

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        result = data[offset:offset + size]
        assert len(result) == size
        return result

    def span(address, size, include_hex=True):
        value = dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                     byte_count=size, sha256=hashlib.sha256(raw(address, size)).hexdigest())
        if include_hex:
            value["hex"] = raw(address, size).hex()
        return value

    def text(address):
        pointer, size = struct.unpack("<QQ", raw(address, 16))
        assert size < 4096
        return dict(text=raw(pointer, size).decode(), source=span(pointer, size))

    RUN.mkdir(parents=True, exist_ok=True)
    if args.prepare_rea:
        (RUN / "constructor.bin").write_bytes(raw(CREATOR, CREATOR_END - CREATOR))
        plan = dict(target=str((RUN / "constructor.bin").relative_to(ROOT)),
                    output=str((RUN / "rea-constructor").relative_to(ROOT)), init_timeout=60, timeout=240,
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(CREATOR)),
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(CREATOR)))])
        (RUN / "constructor-plan.json").write_text(serialized(plan))
        print("Prepared current-hash constructor REA/Ghidra plan under runtime/boss-catalog-0.105.0")
        return

    zones = []
    for index, key in enumerate(KEYS):
        address = TABLE + index * 240
        assert text(address + 8)["text"] == key
        pointer, count = struct.unpack("<QQ", raw(address + 0x88, 16))
        assert count == 5
        points_pointer, point_count = struct.unpack("<QQ", raw(address + 0x68, 16))
        points = [dict(index=n, record=span(points_pointer + n * 8, 8),
                       xy_bits=list(struct.unpack("<2I", raw(points_pointer + n * 8, 8))))
                  for n in range(point_count)]
        bosses = []
        for n in range(count):
            row = pointer + n * 88
            ability_pointer, ability_count = struct.unpack("<QQ", raw(row + 16, 16))
            assert ability_count <= 32
            bosses.append(dict(index=n, record=span(row, 88), name=text(row), yell=text(row + 32),
                               words=list(struct.unpack("<22I", raw(row, 88))),
                               abilities=[dict(index=k, record=span(ability_pointer + k * 28, 28),
                                               words=list(struct.unpack("<7I", raw(ability_pointer + k * 28, 28))))
                                          for k in range(ability_count)]))
        zones.append(dict(index=index, key=key, name=text(address + 24)["text"], record=span(address, 240),
                          boss_slice=dict(va=hex(pointer), count=count, stride=88),
                          spawn_points=points, bosses=bosses))
    catalog = dict(target_version="0.105.0", target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
                   target_executed=False, zone_count=12, boss_count=60,
                   ability_count=sum(len(boss["abilities"]) for zone in zones for boss in zone["bosses"]),
                   method="SHA-bound PE strings/slices and exact words; canonical boss source remains guardian catalog owned.",
                   zones=zones,
                   limitations=["Tables and source contracts do not establish gameplay or rendered parity.",
                                "Historical enemy/guardian records retain their separate provenance."])
    original = [boss for zone in zones for boss in zone["bosses"]]
    source = SOURCE.read_text()
    zone_blocks = re.findall(r"^    ZoneDefinition \{(.*?)(?=^    ZoneDefinition \{|^\];)", source, re.M | re.S)
    assert len(zone_blocks) == len(zones) == 12
    for block, zone in zip(zone_blocks, zones):
        address = int(zone["record"]["va"], 16)
        assert portable_record(json.loads(re.search(r'key:\s*("[^"\n]+")', block)[1])) == portable_record(zone["key"])
        assert portable_record(json.loads(re.search(r'name:\s*("[^"\n]+")', block)[1])) == portable_record(zone["name"])
        center = re.search(r"center:\s*\[(.*?)\]", block, re.S)[1]
        assert [int(word, 16) for word in re.findall(r"0x[0-9a-f]+", center)] == list(struct.unpack("<3I", raw(address + 200, 12)))
        for field, offset in (("scalar_e0", 224), ("radius", 216), ("placement_angle", 212)):
            actual = int(re.search(field + r":\s*f32::from_bits\(0x([0-9a-f]+)\)", block)[1], 16)
            assert actual == struct.unpack("<I", raw(address + offset, 4))[0], (zone["key"], field)
    point_source = (ROOT / "crates/azeroth-survivors-re/src/bosses/catalog.rs").read_text()
    point_blocks = dict(re.findall(r'"([^"\n]+)" => \{(.*?)\];', point_source, re.S))
    assert set(point_blocks) == {zone["key"] for zone in zones if zone["spawn_points"]}
    for zone in zones:
        if zone["spawn_points"]:
            actual = [int(word, 16) for word in re.findall(r"0x[0-9a-f]+", point_blocks[zone["key"]])]
            assert actual == [word for point in zone["spawn_points"] for word in point["xy_bits"]]
    pattern = r"^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)"
    blocks = list(re.finditer(pattern, source, re.M | re.S))
    assert len(blocks) == len(original) == 60
    if args.write_source:
        for match, native in reversed(list(zip(blocks, original))):
            block = match[0]
            for field, index in INT_FIELDS:
                block = re.sub(r"(\b" + field + r":\s*)\d+", lambda m: m[1] + str(native["words"][index]), block, count=1)
            for field, index in FLOAT_FIELDS:
                block = re.sub(r"(\b" + field + r":\s*f32::from_bits\()0x[0-9a-f]+",
                               lambda m: m[1] + f"0x{native['words'][index]:08x}", block, count=1)
            for field in ("name", "yell"):
                block = re.sub(r"(\b" + field + r':\s*)"(?:\\.|[^"\\])*"',
                               lambda m: m[1] + json.dumps(native[field]["text"], ensure_ascii=False), block, count=1)
            source = source[:match.start()] + block + source[match.end():]
        SOURCE.write_text(source)
    blocks = re.findall(pattern, source, re.M | re.S)
    for block, native in zip(blocks, original):
        words = native["words"]
        for field, index in INT_FIELDS:
            assert int(re.search(r"\b" + field + r":\s*(\d+)", block)[1]) == words[index], (native["name"]["text"], field)
        for field, index in FLOAT_FIELDS:
            assert int(re.search(r"\b" + field + r":\s*f32::from_bits\(0x([0-9a-f]+)\)", block)[1], 16) == words[index]
        for field in ("name", "yell"):
            assert portable_record(json.loads(re.search(r"\b" + field + r':\s*("(?:\\.|[^"\\])*")', block)[1])) == portable_record(native[field]["text"])
        assert int(re.search(r"\bflag_54:\s*(\d+)", block)[1]) == words[21] & 255
        abilities = re.findall(r"words:\s*\[(.*?)\]", block, re.S)
        # Current volley/summon inputs have independent 0.108.0 oracles;
        # preserve this target's remaining contracts without shifted slots.
        current_words = [[int(word, 16) for word in re.findall(r"0x[0-9a-f]+", values)] for values in abilities]
        current_words = [words for words in current_words if words[0] not in (1, 2)]
        historical_words = [ability["words"] for ability in native["abilities"] if ability["words"][0] not in (1, 2)]
        assert current_words == historical_words

    # Execute only five no-call native instructions with synthetic XMM9 scale.
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(section["rva"] + max(section["virtual_size"], section["raw_size"]) for section in pe.sections)
    uc.mem_map(pe.image_base, (end + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])

    def hook(_, address, size, unused):
        assert REACH_START <= address < REACH_END, "Unreviewed instruction " + hex(address)
    uc.hook_add(UC_HOOK_CODE, hook)
    scales = [(boss["words"][12], boss["words"][14]) for boss in original]
    scales += [(None, bits) for bits in (0x00000000, 0x80000000, 0xbf800000, 0x406aaaa9, 0x406aaaaa,
                                        0x406aaaab, 0x7f800000, 0xff800000, 0x7fc00000)]
    cases = []
    for boss_id, scale_bits in scales:
        uc.reg_write(x.UC_X86_REG_MXCSR, 0x1f80)
        uc.reg_write(x.UC_X86_REG_XMM9, scale_bits)
        uc.emu_start(REACH_START, REACH_END, count=10)
        result = uc.reg_read(x.UC_X86_REG_XMM6) & 0xffffffff
        scale = struct.unpack("<f", struct.pack("<I", scale_bits))[0]
        product = struct.unpack("<f", struct.pack("<f", scale * 1.5))[0]
        reach = struct.unpack("<f", struct.pack("<f", product + 3.5))[0]
        expected = reach if reach < 9.0 else 9.0
        assert result == struct.unpack("<I", struct.pack("<f", expected))[0]
        cases.append(dict(boss_id=boss_id, scale_bits=scale_bits, melee_reach_bits=result))
    native = dict(target_sha256=SHA, target_process_launched=False,
                  method="Unicorn executes current no-call reach instructions with synthetic XMM9; source-order scalar check is independent.",
                  reach_owner=span(REACH_START, REACH_END - REACH_START),
                  constants=[span(address, 4) for address in (0x145D9AE9C, 0x14609DD44, 0x145D9AEA0)],
                  cases=cases,
                  limitations=["69 instruction cases do not establish compiled Rust, engine actor interaction or rendered model-size parity.",
                               "Complete boss health/damage constructors and WinCRT powf remain outside these bounded cases."])
    scaling_source = (ROOT / "crates/azeroth-survivors-re/src/bosses/scaling.rs").read_text()
    assert "let reach = definition.scale * 1.5 + 3.5;" in scaling_source
    assert "let melee_reach = if reach < 9.0 { reach } else { 9.0 };" in scaling_source
    adapter = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs").read_text()
    assert "native::scaling::initial_stats(" in adapter and "native::ai::make_combat_actor(guid, position, self.now, &stats)" in adapter
    assert "melee_reach: stats.melee_reach" in (ROOT / "crates/azeroth-survivors-re/src/bosses/ai.rs").read_text()
    assert "scale: row.definition.scale" in (ROOT / "crates/azeroth-survivors-re/src/gameplay/visuals.rs").read_text()
    for name, value in (("catalog.json", catalog), ("reach-native.json", native)):
        generated = serialized(value)
        (RUN / name).write_text(generated)
        if args.check:
            assert (OUT / name).read_text() == generated, name + " differs from current EXE"
    assembly = objdump_output(["objdump", "-d", "--no-show-raw-insn", f"--start-address={CREATOR:#x}",
                                        f"--stop-address={CREATOR_END:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
    (RUN / "constructor.asm").write_text(assembly)
    if args.check:
        assert (OUT / "constructor.asm").read_text() == assembly
        manifest = json.loads((OUT / "manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        assert manifest["constructor"] == span(CREATOR, CREATOR_END - CREATOR, False)
        for constant in manifest["constant_spans"]:
            address, count = int(constant["va"], 16), constant["byte_count"]
            assert constant == dict(role=constant["role"], **span(address, count))
        assert manifest["assembly_sha256"] == hashlib.sha256(assembly.encode()).hexdigest()
        pseudo = (OUT / "constructor.pseudo.c").read_bytes()
        assert manifest["pseudocode_sha256"] == hashlib.sha256(pseudo).hexdigest()
    print(f"Checked 12 zones / 60 primary bosses / {catalog['ability_count']} abilities / 10 points / {len(cases)} native reach cases; no compilation or game launch")


if __name__ == "__main__":
    main()

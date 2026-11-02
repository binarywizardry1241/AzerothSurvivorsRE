#!/usr/bin/env python3
"""Verify the bounded 0.123.0 pool-query provenance and recipient delta.

This checks original PE bytes, retained Ghidra results and the reviewed source,
then replays bounded original instructions in synthetic memory. It compiles no
Rust, starts no application/server and establishes no gameplay or parity.
"""
from portable_paths import portable_json
import hashlib
import json
import struct
import argparse
import itertools
import platform
import re
import subprocess
import sys

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


def digest(path):
    return hashlib.sha256((ROOT / path).read_bytes()).hexdigest()


def replay(manifest, image, pe):
    """Execute original predicate/constructor fragments in synthetic memory."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_R15, UC_X86_REG_R13, UC_X86_REG_R12
    from unicorn.x86_const import UC_X86_REG_RBP, UC_X86_REG_RBX, UC_X86_REG_RDX
    from unicorn.x86_const import UC_X86_REG_XMM0, UC_X86_REG_XMM6, UC_X86_REG_XMM7

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()
    def install(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in pages:
                machine.mem_map(page, 4096)
                pages.add(page)
        machine.mem_write(address, raw)
    for row in manifest['native_ranges']:
        install(int(row['virtual_address'], 16), bytes.fromhex(row['bytes_hex']))
    base = 0x200000
    machine.mem_map(base, 0x10000)
    state = dict(steps=0, total_steps=0, cases=0)
    def step(_, address, size, __):
        state['steps'] += 1
        state['total_steps'] += 1
        assert state['steps'] < 100, 'Unexpected predicate/constructor escape'
        if address in state['stops']:
            state['exit'] = address
            machine.emu_stop()
    machine.hook_add(UC_HOOK_CODE, step)
    def run(begin, stops):
        state.update(stops=set(stops), steps=0, exit=None)
        machine.emu_start(begin, max(stops) + 1)
        assert state['exit'] in stops
        state['cases'] += 1
        return state['exit']
    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack('<' + fmt, *values))
    def get(address, fmt):
        return struct.unpack('<' + fmt, machine.mem_read(address, struct.calcsize('<' + fmt)))[0]
    def xmm(register, value):
        machine.reg_write(register, int.from_bytes(struct.pack('<f', value), 'little'))

    # Every gate independently excludes a record, including present zero-length
    # boss/guardian vectors whose niche is zero rather than the absent -1.
    for dead, ward, boss, guardian in itertools.product((0, 1, 2), (-1, 0, 3), (-1, 0, 3), (-1, 0, 3)):
        machine.mem_write(base, bytes(0x300))
        put(base + 0xb0, 'B', dead)
        put(base + 0xd0, 'i', ward)
        put(base + 0x18, 'q', boss)
        put(base + 0x58, 'q', guardian)
        machine.reg_write(UC_X86_REG_R15, base + 0x1e0)
        admitted = run(0x145ca034f, (0x145ca0343, 0x145ca0377)) == 0x145ca0377
        assert admitted == (dead == 0 and ward == -1 and boss == -1 and guardian == -1)
    predicate_cases = state['cases']

    # Original sampled-XY admission includes distance six, ignores Z and uses
    # current interpolation rather than the movement's final destination.
    radius_cases = [
        (0.0, 0.0, 0.0, 0.0, 0.0, True),
        (6.0, 0.0, 0.0, 0.0, 0.0, True),
        (6.001, 0.0, 0.0, 0.0, 0.0, False),
        (float('nan'), 0.0, 0.0, 0.0, 0.0, False),
        (12.0, 0.0, 0.0, 2.0, 1.0, True),
        (12.0, 0.0, 0.0, 2.0, 1.01, False),
    ]
    for target_x, target_y, start_x, duration, now, expected in radius_cases:
        put(base + 0xb0, 'B', 0)
        put(base + 0xd0, 'i', -1)
        put(base + 0x18, 'q', -1)
        put(base + 0x58, 'q', -1)
        put(base + 0x17c, '3f', start_x, 0.0, 9000.0)
        put(base + 0x188, '3f', target_x, target_y, -9000.0)
        put(base + 0x194, '2f', 0.0, duration)
        put(base + 0x1000, 'f', now)
        put(base + 0x1100, '3f', 0.0, 0.0, 0.0)
        machine.reg_write(UC_X86_REG_R15, base + 0x1e0)
        machine.reg_write(UC_X86_REG_R12, base + 0x1000)
        machine.reg_write(UC_X86_REG_R13, base + 0x1100)
        xmm(UC_X86_REG_XMM0, 0.0)
        xmm(UC_X86_REG_XMM6, 1.0)
        xmm(UC_X86_REG_XMM7, 36.0)
        admitted = run(0x145ca034f, (0x145ca0343, 0x145ca03da)) == 0x145ca03da
        assert admitted == expected

    frame = base + 0x4000
    for header in (0, 1, 3):
        # Ordinary and elite construction uses the same subtype initialization.
        machine.mem_write(frame - 0x100, bytes(0x800))
        machine.reg_write(UC_X86_REG_RBP, frame)
        run(0x145b51ad2, (0x145b51b1c,))
        actor = frame - 0x40
        assert [get(actor + field, fmt) for field, fmt in [(0x18, 'q'), (0x58, 'q'), (0xd0, 'i'), (0xb0, 'B')]] == [-1, -1, -1, 0]

        machine.reg_write(UC_X86_REG_R15, header)
        run(0x145b8c48e, (0x145b8c4f7,))
        actor = frame - 0x38
        assert [get(actor + field, fmt) for field, fmt in [(0x18, 'q'), (0x58, 'q'), (0xd0, 'i'), (0xb0, 'B')]] == [-1, header, -1, 0]

        machine.reg_write(UC_X86_REG_R13, header)
        run(0x145b652de, (0x145b65413,))
        assert [get(actor + field, fmt) for field, fmt in [(0x18, 'q'), (0x58, 'q'), (0xd0, 'i'), (0xb0, 'B')]] == [header, -1, -1, 0]

        machine.reg_write(UC_X86_REG_RBX, base + 0x1200)
        machine.reg_write(UC_X86_REG_R15, base + 0x1100)
        put(base + 0x1200, '4I', header, 0, 0, 0)
        run(0x145b2274f, (0x145b22865,))
        assert [get(actor + field, fmt) for field, fmt in [(0x18, 'q'), (0x58, 'q'), (0xd0, 'i'), (0xb0, 'B')]] == [-1, -1, header, 0]
    return dict(original_instruction_cases=state['cases'], predicate_cases=predicate_cases,
                radius_cases=len(radius_cases), constructor_cases=12,
                original_instruction_steps=state['total_steps'],
                fixture_seams=['synthetic actor/frame/register inputs; stops before external calls'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-path', action='append', default=[])
    parser.add_argument('--write', action='store_true', help='Save the durable bounded check result')
    args = parser.parse_args()
    sys.path[:0] = args.python_path
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    manifest = json.loads((ROOT / "docs/analysis/evidence/0.123.0/sanguine-native.json").read_text())
    target = latest_target(verify=True)
    assert target["sha256"] == manifest["target"]["sha256"], "Selected target changed"
    image = target_bytes(target)
    assert len(image) == target["size_bytes"]
    pe = load_script("sanguine_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    radius = manifest["recipient_predicate"]
    offset = pe.rva_offset(int(radius["radius_squared_address"], 16) - pe.image_base)
    assert struct.unpack_from("<f", image, offset)[0] == radius["radius_squared"] == 36.0
    results = {}
    for query in manifest["queries"] + manifest['producer_queries']:
        for key in ("raw_input", "plan", "journal", "result"):
            assert digest(query[key]["path"]) == query[key]["sha256"], key + " changed"
        result = json.loads((ROOT / query["result"]["path"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        verify_native_query_subject(ROOT, native, query, target)
        results[query["role"]] = native["normalized_result"]
    pool, recipients = results["pool_tick"], results["recipient_filter"]
    assert "func_0x000145ca02b0()" in pool
    assert "in_RCX + 0x5b8" in pool and "in_RCX + 0x5c0" in pool
    for gate in ("+ 0xb0) == '\\0'", "+ 0xd0) == -1", "+ 0x18) == -1", "+ 0x58) == -1"):
        assert gate in recipients, "Missing reviewed recipient gate: " + gate
    assert "0x1e0" in recipients and "_DAT_1461dd868" in recipients
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in manifest['native_ranges']:
        address = int(row['virtual_address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert raw == bytes.fromhex(row['bytes_hex'])
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        instructions = list(decoder.disasm(raw, address))
        assert len(instructions) == row['instruction_count']
        assert sum(ins.size for ins in instructions) == len(raw)
        assembly = ''.join(f'{ins.address:016x} {ins.bytes.hex():<30} {ins.mnemonic} {ins.op_str}'.rstrip() + '\n' for ins in instructions)
        assert (ROOT / row['assembly']['path']).read_text() == assembly
        assert digest(row['assembly']['path']) == row['assembly']['sha256']
    templates = manifest['ward_templates']
    offset = pe.rva_offset(int(templates['virtual_address'], 16) - pe.image_base)
    raw = image[offset:offset + templates['byte_count']]
    assert raw == bytes.fromhex(templates['bytes_hex'])
    assert hashlib.sha256(raw).hexdigest() == templates['sha256']
    ward_source = (ROOT / 'crates/azeroth-survivors-re/src/bosses/raid_wards.rs').read_text()
    entries = re.findall(r'Template \{ name: "([^"]+)", entry: (\d+), display: (\d+), scale: f32::from_bits\(0x([a-f0-9]+)\)', ward_source)
    assert len(entries) == 13
    for index, (name, entry, display, scale) in enumerate(entries):
        pointer, length, actual_entry, actual_display, actual_scale = struct.unpack_from('<QQIII', raw, index * 32)
        at = pe.rva_offset(pointer - pe.image_base)
        assert image[at:at + length].decode() == name
        assert (actual_entry, actual_display, actual_scale) == (int(entry), int(display), int(scale, 16))
    for receipt in manifest["curated_exports"]:
        assert digest(receipt["path"]) == receipt["sha256"], "Curated export changed"
    source = manifest["source_review"]
    current_source = digest(source["path"]) == source["sha256"]
    assert current_source, "Reviewed source changed; revalidate the recipient/source assessment"
    text = (ROOT / source["path"]).read_text()
    start = text.index("pub(super) fn tick_affix_pools")
    end = text.index("// Native removes expired", start)
    assert "self.actors.iter_mut()" in text[start:end]
    assert "!row.actor.dead && !self.guardian_state.contains(row.guid)" in text[start:end]
    assert "self.bosses.iter_mut()" not in text[start:end]
    assert "self.boss_state.wards" not in text[start:end]
    assert "pool.next_tick += 1.0" in text[start:end]
    assert "in_radius(row.actor.movement.position_at(now), pool.position, 36.0)" in text[start:end]
    guardians = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs').read_text()
    assert "self.actors.push(RunActor" in guardians and "self.guardian_state.actors.insert(" in guardians
    assert "self.actors.contains_key(&guid)" in guardians
    mechanics = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text()
    assert "self.tick_affix_pools();" in mechanics
    rustfmt = ROOT / '.tools/rust' / ('1.98.1-' + {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin', ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    parsed = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'], input=text, text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
    assert parsed.returncode == 0, parsed.stderr
    for name in manifest['source_regressions']['tests']:
        assert 'fn ' + name in text
    replayed = replay(manifest, image, pe)
    result = {"target": target["sha256"], "verified_native_queries": len(results),
                      "recipient_gate_fields": ["0xb0", "0xd0", "0x18", "0x58"],
                      "original_source_receipt_current": current_source,
                      "source_delta": "Live pool healing admits living ordinary/elite horde, excluding guardians, primary bosses and wards",
                      **replayed, "rust_source_parsed": True, "authored_rust_regressions": 2,
                      "compilation": "not_run", "rust_tests_executed": False,
                      "application_compiled_or_executed": False,
                      "parity_verified": False}
    if args.write:
        (ROOT / 'docs/analysis/evidence/0.123.0/sanguine/static-check.json').write_text(portable_json(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

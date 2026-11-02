#!/usr/bin/env python3
"""Verify #62 current native ranges and bounded predicates without compiling Rust."""
import hashlib
import json
import re
from pathlib import Path
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

EVIDENCE = ROOT / 'docs/analysis/evidence/0.113.2/legacy-config'
manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
target = latest_target(verify=True)
assert target['sha256'] == manifest['target']['sha256']
data = target_bytes(target)
pe = load_script('legacy_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
def raw(a, b):
    off = pe.rva_offset(a - pe.image_base)
    return data[off:off + b - a]
for row in manifest['functions']:
    assert hashlib.sha256(raw(int(row['start'], 16), int(row['end_exclusive'], 16))).hexdigest() == row['sha256']
for name, expected in manifest['extracts'].items():
    assert hashlib.sha256((EVIDENCE / name).read_bytes()).hexdigest() == expected

sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_RBP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSI, UC_X86_REG_RBX

def machine(a, b):
    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    first, last = a & ~4095, (b + 4095) & ~4095
    cpu.mem_map(first, last - first)
    cpu.mem_write(a, raw(a, b))
    cpu.mem_map(0x200000000, 0x10000)
    return cpu

rows = []
for previous in (-2**63, -1, 0, 1, 2**63-1):
    for candidate in (-2**63, -1, 0, 1, 2**63-1):
        cpu = machine(0x140024c10, 0x140024de8)
        pointer = 0x200001000
        cpu.mem_write(pointer - 0x28, struct.pack('<q', previous))
        cpu.mem_write(pointer, struct.pack('<q', candidate))
        cpu.reg_write(UC_X86_REG_RDX, pointer)
        cpu.reg_write(UC_X86_REG_RCX, pointer - 0x28)
        result = []
        def stop(uc, address, size, unused):
            if address in (0x140024c68, 0x140024cbb, 0x140024dd4):
                result.append({0x140024c68:'path-tie', 0x140024cbb:'move-earlier', 0x140024dd4:'keep'}[address])
                uc.emu_stop()
        cpu.hook_add(UC_HOOK_CODE, stop)
        cpu.emu_start(0x140024c33, 0, count=30)
        expected = 'path-tie' if candidate == previous else ('move-earlier' if candidate < previous else 'keep')
        assert result == [expected], (previous, candidate, result)
        rows.append([previous, candidate, expected])
for name in ('cache', 'Diagnostics', 'Cache', 'saved', 'AddOns', 'cachex', 'diagnostics'):
    for nested in (False, True):
        cpu = machine(0x140017550, 0x14001790b)
        pointer = 0x200001000
        cpu.mem_write(pointer, name.encode())
        frame = 0x200003000
        cpu.reg_write(UC_X86_REG_RBP, frame)
        cpu.mem_write(frame + 0xc50, struct.pack('<Q', pointer))
        cpu.reg_write(UC_X86_REG_RCX, pointer)
        cpu.reg_write(UC_X86_REG_RBX, len(name))
        cpu.reg_write(UC_X86_REG_RSI, int(nested))
        result = []
        def stop(uc, address, size, unused):
            if address in (0x1400177b9, 0x14001781f):
                result.append(address == 0x14001781f)
                uc.emu_stop()
        cpu.hook_add(UC_HOOK_CODE, stop)
        cpu.emu_start(0x1400177b0, 0, count=60)
        assert result == [not nested and name in ('cache', 'Diagnostics')]
        rows.append([name, nested, result[0]])
source = (ROOT / 'crates/azeroth-survivors-re/src/legacy_config.rs').read_text()
main = (ROOT / 'crates/azeroth-survivors-re/src/main.rs').read_text()
assert main.index('legacy_config::migrate();') < main.index('let mut arguments')
for token in ('destination.with_extension("part")', 'fs::rename(staging, destination)?',
              'a.modified.cmp(&b.modified)', '.then_with(|| a.path.cmp(&b.path))',
              'cvars.extend(table.clone())', "line.starts_with('#')", 'metadata.file_type().is_symlink()'):
    assert re.sub(r'\s+', '', token) in re.sub(r'\s+', '', source), token
# The account-save owner stays separate from local-state migration.
assert 'characters.txt' not in source
assert 'WOW_ROGUE_SAVE' in (ROOT / 'crates/azeroth-survivors-re/src/save.rs').read_text()
output = ROOT / 'runtime/fixgap-62-63/migration-native-cases.json'
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(json.dumps(rows, indent=2) + '\n')
print(f'#62: native byte/extract hashes, {len(rows)} native predicate cases and startup/source connections pass; Rust/Windows/runtime unverified')

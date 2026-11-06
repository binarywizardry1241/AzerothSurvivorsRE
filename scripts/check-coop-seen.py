#!/usr/bin/env python3
"""Verify current Seen admission keys against native comparison bytes; no compilation."""
import hashlib
import json
import re
import struct

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
CURRENT_SHA = '47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6'


def check_current(target):
    """Replay the original bounded filter with its recovered sorted Codex input."""
    import unicorn as uc
    from unicorn import x86_const as x86

    data = target_bytes(target)
    pe = load_script('coop_seen_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def read(address, size):
        start = pe.rva_offset(address - pe.image_base)
        return data[start:start + size]

    def qwords(address, count):
        return struct.unpack('<' + 'Q' * count, read(address, 8 * count))

    def key_at(address):
        return read(*qwords(address, 2)).decode('ascii')

    def records(global_slot, stride):
        start, count = qwords(qwords(global_slot, 1)[0], 2)
        return range(start, start + count * stride, stride)

    source = ROOT / 'crates/azeroth-survivors-re/src'
    assets = source.parent / 'assets'
    pools = {}
    talent_only = {}
    for cls in records(0x148acbb68, 144):
        class_id = read(cls + 0x8c, 1)[0]
        start, count = qwords(cls + 0x30, 2)
        pool = [key_at(start + 16 * i) for i in range(count)]
        pools[class_id] = pool
        talents = next(row for row in range(0x147722d40, 0x147723448, 200)
                       if read(row + 0xc0, 1)[0] == class_id)
        extra = []
        for offset in (0x30, 0x70, 0xb0):
            start, count = qwords(talents + offset, 2)
            for talent in range(start, start + count * 176, 176):
                effects, count = qwords(talent + 0x70, 2)
                for row in range(effects, effects + count * 64, 64):
                    if read(row, 4) == b'\x29\0\0\0':
                        key = key_at(row + 8)
                        if key not in pool and key not in extra:
                            extra.append(key)
        talent_only[class_id] = extra
    assert {cls: keys for cls, keys in talent_only.items() if keys} == {7: ['rockbiter']}
    source_pools = {
        int(cls): re.findall(r'"([^"]+)"', keys)
        for cls, keys in re.findall(r'ClassAbilities \{ class_id: (\d+).*?pool: &\[([^]]+)\]',
                                    (source / 'player_abilities/catalog.rs').read_text())
    }
    assert source_pools == pools
    exclusions = {read(address, size).decode('ascii') for address, size in
                  ((0x147701285, 16), (0x147701295, 12), (0x1477012a1, 14))}
    legendary = ['legendary:' + key for cls, pool in pools.items()
                 for key in pool + talent_only[cls] if key not in exclusions]
    jewelry = [key_at(row) for row in records(0x148acbba0, 72)]
    shared = [key_at(row) for row in records(0x148acbba8, 80)]
    assert re.findall(r'JewelryDefinition \{ key: "([^"]+)"',
                      (source / 'loot_rewards/catalog_01120.rs').read_text()) == jewelry
    definitions = json.loads((assets / 'native-amulets-0.100.1.json').read_text())
    assert {row['key'] for row in definitions['shared']} - {'star_of_mystaria'} == set(shared)
    generated = {row['key'] for row in definitions['generated']}
    for name in ('legionlord-0.112.0.json', 'enhancement-amulets-0.140.0.json'):
        extra = json.loads((assets / name).read_text())
        generated.update(row['key'] for row in extra.get('definitions', [extra.get('definition')]))
    assert set(legendary) <= generated | {'legendary:kill_command'}
    listed = set(jewelry + shared + legendary)
    assert len(listed) == len(jewelry) + len(shared) + len(legendary) == 141
    old_catalog = json.loads((assets / 'codex-0.105.0.json').read_text())['entries']
    assert {row['key'] for row in old_catalog if row['group'] != 'legendary'} == set(jewelry + shared)

    machine = uc.Uc(uc.UC_ARCH_X86, uc.UC_MODE_64)
    validator, end = 0x1460563f0, 0x146057cf7
    assert hashlib.sha256(read(validator, end - validator)).hexdigest() == (
        'd25184eee40dc5b76ca2e787439fc338f0d491226ba0f9340988a4e50af2fe29'
    )
    for start, stop in ((validator, end), (0x145e6ba71, 0x145e6bab5),
                        (0x1463ac991, 0x1463ac992), (0x1400021d0, 0x1400021d1)):
        page, size = start & ~0xfff, ((stop + 0xfff) & ~0xfff) - (start & ~0xfff)
        machine.mem_map(page, size)
        machine.mem_write(start, read(start, stop - start))
    for section in pe.sections:
        if section['name'] == '.rdata':
            start, size = section['raw_offset'], section['raw_size']
            address = pe.image_base + section['rva']
            machine.mem_map(address, (size + 0xfff) & ~0xfff)
            machine.mem_write(address, data[start:start + size])

    base = 0x100000000
    machine.mem_map(base, 0x20000)
    return_to, stack, rows, state = (base + off for off in (0x80, 0x1ff08, 0x1000, 0x3000))
    result, input_keys, codex = (base + off for off in (0x3100, 0x4000, 0x8000))

    def words(*values):
        return struct.pack('<' + 'Q' * len(values), *values)

    def return_from_seam(vm, address, _size, _context):
        if address == 0x1463ac991:
            left, right, count = [vm.reg_read(reg) for reg in
                                  (x86.UC_X86_REG_RCX, x86.UC_X86_REG_RDX, x86.UC_X86_REG_R8)]
            left, right = vm.mem_read(left, count), vm.mem_read(right, count)
            vm.reg_write(x86.UC_X86_REG_EAX, ((left > right) - (left < right)) & 0xffffffff)
        rsp = vm.reg_read(x86.UC_X86_REG_RSP)
        vm.reg_write(x86.UC_X86_REG_RIP, struct.unpack('<Q', vm.mem_read(rsp, 8))[0])
        vm.reg_write(x86.UC_X86_REG_RSP, rsp + 8)

    for address in (0x1463ac991, 0x1400021d0):
        machine.hook_add(uc.UC_HOOK_CODE, return_from_seam, begin=address, end=address)
    machine.mem_write(codex, words(codex + 0x20))
    machine.mem_write(codex + 0x20, words(len(listed), codex + 0x100, len(listed)))
    for i, key in enumerate(sorted(listed)):
        address = codex + 0x2000 + i * 48
        machine.mem_write(address, key.encode())
        machine.mem_write(codex + 0x100 + i * 24, words(0, address, len(key)))

    def check_filter(values, expected):
        for i, (key, quality) in enumerate(values):
            address = input_keys + i * 48
            machine.mem_write(address, key.encode())
            machine.mem_write(rows + i * 32, words(0, address, len(key), quality))
        machine.mem_write(state, words(rows, rows, len(values), rows + 32 * len(values), codex, 32))
        machine.mem_write(stack, words(return_to))
        for reg, value in ((x86.UC_X86_REG_RCX, result), (x86.UC_X86_REG_RDX, state),
                           (x86.UC_X86_REG_RSP, stack)):
            machine.reg_write(reg, value)
        machine.emu_start(validator, return_to, count=120000)
        assert machine.reg_read(x86.UC_X86_REG_RIP) == return_to
        _, _, accepted = struct.unpack('<QQQ', machine.mem_read(result, 24))
        assert accepted == expected, values

    extra = {'legendary:healing_wave', 'legendary:lightning_shield'}
    rejected = {'legendary:call_of_flame', 'legendary:explosive_trap', 'legendary:rockbite',
                'legendary:rockbiters', 'Legendary:rockbiter', 'unlisted'}
    for key in sorted(listed | extra | rejected):
        check_filter([(key, 4)], int(key not in rejected))
    rockbiter = 'legendary:rockbiter'
    check_filter([(rockbiter, 0), (rockbiter, 5)], 1)
    check_filter([('unlisted', 4)] * 4 + [(rockbiter, 4)] * 33, 32)
    for percent, expected in ((50, 71), (100, 141)):
        machine.reg_write(x86.UC_X86_REG_RSI, percent)
        machine.reg_write(x86.UC_X86_REG_R15, len(listed))
        machine.emu_start(0x145e6ba71, 0x145e6bab5, count=30)
        assert machine.reg_read(x86.UC_X86_REG_RDI) == expected
    print('PASS: 141 native Codex keys, both achievement thresholds, 149 guest keys and two packet boundary cases')


def main():
    installed = installed_identity()
    if installed['sha256'] == CURRENT_SHA:
        check_current(installed)
        return
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    retained = json.loads((ROOT / 'docs/analysis/evidence/0.115.0/coop-seen/manifest.json').read_text())
    assert retained['target']['sha256'] == SHA
    assert not retained['compiled'] and not retained['target_executed']
    data = target_bytes(target)
    pe = load_script('coop_seen_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    owner = retained['owner']
    start, end = int(owner['start'], 16), int(owner['end_exclusive'], 16)
    offset = pe.rva_offset(start - pe.image_base)
    assert offset == int(owner['file_offset'], 16)
    assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == owner['sha256']
    extract = (ROOT / owner['extract']).read_bytes()
    assert hashlib.sha256(extract).hexdigest() == owner['extract_sha256']
    assert retained['ghidra']['subject_sha256'] == owner['sha256']
    assert retained['ghidra']['evidence_id'].startswith('ev_')
    assert len(retained['ghidra']['analysis_profile_sha256']) == 64
    assembly = extract.decode()
    assert 'cmp r14b, 4' in assembly and 'ja 0x1458e5b70' in assembly
    assert 'movabs r10, 0x7261646e6567656c' in assembly and 'xor r10, 0x3a79' in assembly
    keys = []
    for row in retained['keys']:
        combined = {}
        for piece in row['pieces']:
            raw = bytes.fromhex(piece['hex'])
            at = pe.rva_offset(int(piece['address'], 16) - pe.image_base)
            assert at == int(piece['file_offset'], 16)
            assert data[at:at + len(raw)] == raw, row['key']
            assert f"{piece['load']}: " in assembly
            compare = next(line for line in assembly.splitlines()
                           if line.startswith(piece['compare'] + ': '))
            assert row['base'] in compare, (row['key'], compare)
            for n, byte in enumerate(raw, piece['offset']):
                assert combined.get(n, byte) == byte
                combined[n] = byte
        literal = bytes(combined[n] for n in range(len(combined))).decode('ascii')
        key = ('legendary:' if row['base'] == 'r9' else '') + literal
        assert key == row['key']
        keys.append(key)
    assert len(keys) == len(set(keys)) == 142
    assert sum(key.startswith('legendary:') for key in keys) == 103
    assert 'legendary:hammer_of_justice' in keys and 'legendary:demonic_empowerment' in keys
    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/client_state.rs').read_text()
    implementation = source.split('pub fn recognized_seen_key(key: &str) -> bool {', 1)[1]
    source_keys = re.findall(r'^\s*"([a-z_:]+)",$', implementation, flags=re.M)
    assert source_keys == sorted(keys)
    assert 'KEYS.binary_search(&key).is_ok()' in implementation
    assert 'starts_with' not in implementation and 'strip_prefix' not in implementation
    assert '*quality <= 4 && recognized_key(key)' in source and '400' in source
    print('PASS: current6148-byte Seen filter,142 exact literal keys (39 jewelry/103 legendary),'
          'source membership and separate quality/quota gates; no compilation or runtime claim')


if __name__ == '__main__':
    main()

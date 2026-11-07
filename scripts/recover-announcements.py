#!/usr/bin/env python3
"""Check selected-target announcement producers and unchanged native serializers.

No game, compiler, allocator or OS callee executes. Synthetic memory supplies
allocation, byte-copy and Vec growth seams only; unknown native calls fail.
Generated material is staged under runtime/ for review; --check is read-only.
"""
from portable_paths import objdump_output
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK = ROOT / 'runtime/analysis/history/native-recovery/arrival-announcements/cce8ae90fdde'
OUT = ROOT / 'docs/analysis/evidence/arrival-announcements'
RANGES = [
    ('elite', 0x14590E0D4, 0x14590E273),
    ('pack', 0x14590EAE3, 0x14590EB02),
    ('swarm', 0x14590EF43, 0x14590EF62),
    ('wall', 0x14590F432, 0x14590F451),
    ('formation', 0x14590F7B3, 0x14590F913),
    ('guardian-refill', 0x145910ACF, 0x145910C67),
    ('guardian-death', 0x1459354CF, 0x145935566),
    ('boss-death', 0x145935754, 0x145935813),
    ('summon-yell', 0x14593E5A3, 0x14593E64B),
    ('guardian-wake', 0x14593F9CC, 0x14593FA4B),
    ('yell-packet', 0x1458AAE00, 0x1458AB145),
]
CANONICAL = [
    ('emote-packet', 0x1458A9500, 0x1458A97D9,
     'docs/analysis/evidence/terminal/notification-packet.asm'),
    ('boss-constructor', 0x14592FF90, 0x145930DF2,
     'docs/analysis/evidence/boss-catalog/constructor.asm'),
]
LITERALS = [
    (0x146E79CE8, '%s approaches!'),
    (0x146E79B78, 'Swarm surrounds you!'),
    (0x146E79BA8, 'A stampede charges through!'),
    (0x146E79BC3, 'A wall of foes closes in!'),
    (0x146E79BDC, 'A pack hunts you!'),
    (0x146E7AF10, '%s claims its lair once more.'),
    (0x146E7AFA8, '%s is slain! Its lair yields treasure and its strength, and the other guardians grow stronger.'),
    (0x146E79AC8, '%s enters the battlefield!'),
    (0x146E79D4F, 'Impossible...'),
    (0x146E79D88, 'Minions, to me!'),
    (0x146E79C86, 'Who dares enter my lair?'),
]

def formatted(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.105.0' and target['sha256'] == SHA
    exe = ROOT / target['path']
    data = exe.read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        assert len(value) == count
        return value

    def values(address, fmt):
        return struct.unpack(fmt, raw(address, struct.calcsize(fmt)))

    def span(address, count):
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=count, sha256=hashlib.sha256(raw(address, count)).hexdigest())

    def string(address):
        pointer, count = values(address, '<QQ')
        assert 0 < count < 4096
        return raw(pointer, count).decode()

    if args.prepare_rea:
        assert not args.check
        WORK.mkdir(parents=True, exist_ok=True)
        start, end = 0x1458AAE00, 0x1458AB145
        (WORK / 'yell-packet.bin').write_bytes(raw(start, end - start))
        plan = dict(target=str((WORK / 'yell-packet.bin').relative_to(ROOT)),
                    output=str((WORK / 'rea-yell-packet').relative_to(ROOT)), init_timeout=60, timeout=240,
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
        (WORK / 'yell-packet-plan.json').write_text(formatted(plan))
        print('Prepared hash-bound Ghidra yell-packet plan under runtime/')
        return

    # Fallback speaker names are still consumed from two historical catalogs.
    # Revalidate their exact current name/id contracts, without certifying the
    # remaining combat/scaling fields of those old records.
    native_enemies = []
    for index in range(12):
        pointer, count = values(0x146BA9450 + index * 240 + 120, '<QQ')
        for row in range(count):
            address = pointer + row * 80
            native_enemies.append((values(address + 32, '<I')[0], string(address + 16)))
    source_names = []
    for path in ['enemies/catalog.rs', 'guardians/catalog.rs']:
        source = (ROOT / 'crates/azeroth-survivors-re/src' / path).read_text()
        blocks = re.findall(r'^    EnemyDefinition \{(.*?)(?=^    EnemyDefinition \{|^\];)', source, re.M | re.S)
        names = [(int(re.search(r'\bid:\s*(\d+)', block)[1]),
                  json.loads(re.search(r'\bname:\s*("(?:\\.|[^"\\])*")', block)[1])) for block in blocks]
        assert names == native_enemies, f'Current enemy announcement names differ: {path}'
        source_names.append(dict(path='crates/azeroth-survivors-re/src/' + path,
                                 matching_name_id_rows=len(names)))
    literals = []
    for address, text in LITERALS:
        assert raw(address, len(text.encode())) == text.encode()
        literals.append(dict(text=text, source=span(address, len(text.encode()))))
    assert raw(0x146BA0D60, 9) == b'\x06enemy.\xc0\x00'
    assert raw(0x146BA0D69, 14) == b'\x05boss.\xc0\x05.name\x00'
    assert raw(0x146BA0D77, 14) == b'\x05boss.\xc0\x05.yell\x00'
    locales = []
    for path in sorted((ROOT / 'crates/azeroth-survivors-re/assets/locales').glob('*.json')):
        catalog = json.loads(path.read_text())
        assert all(text in catalog for _, text in LITERALS)
        locales.append(path.stem)

    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as registers
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section['rva'],
                     data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    BASE, SIZE, DONE = 0x20000000, 0x40000, 0x2003F000
    uc.mem_map(BASE, SIZE)
    OUTPUT, NAME, BODY, SP, HEAP = [BASE + n for n in (0x1000, 0x2000, 0x6000, 0x10008, 0x20000)]
    next_heap = HEAP
    active = None
    calls = []

    def reg(name, value=None):
        key = getattr(registers, 'UC_X86_REG_' + name)
        if value is not None:
            uc.reg_write(key, value)
        return uc.reg_read(key)

    def put(address, fmt, *items):
        uc.mem_write(address, struct.pack(fmt, *items))

    def get(address, fmt):
        return struct.unpack(fmt, uc.mem_read(address, struct.calcsize(fmt)))

    def allocate(count):
        nonlocal next_heap
        pointer = next_heap
        next_heap += (count + 15) & ~15
        assert next_heap < DONE
        return pointer

    def hook(_, address, size, unused):
        if address == DONE:
            uc.emu_stop()
            return
        if active[0] <= address < active[1]:
            assert address + size <= active[1]
            assert bytes(uc.mem_read(address, size)) == raw(address, size)
            return
        calls.append(hex(address))
        if address == 0x140002200:
            pass
        elif address == 0x1400021C0:
            assert (reg('RCX'), reg('RDX')) == (32, 1)
            reg('RAX', allocate(32))
        elif address == 0x145BC977B:
            uc.mem_write(reg('RCX'), bytes(uc.mem_read(reg('RDX'), reg('R8'))))
        elif address in (0x145BCB2D0, 0x145D69340):
            vector = reg('RCX')
            capacity, pointer, length = get(vector, '<QQQ')
            if address == 0x145BCB2D0:
                assert reg('RDX') == length and reg('R9') == 1
                assert get(reg('RSP') + 0x28, '<Q')[0] == 1
                required = length + reg('R8')
            else:
                required = length + 1
            grown_capacity = max(capacity * 2, required)
            grown = allocate(grown_capacity)
            uc.mem_write(grown, bytes(uc.mem_read(pointer, length)))
            put(vector, '<QQ', grown_capacity, grown)
        else:
            raise AssertionError(f'Unreviewed native call {address:#x}')
        stack = reg('RSP')
        reg('RIP', get(stack, '<Q')[0])
        reg('RSP', stack + 8)

    uc.hook_add(UC_HOOK_CODE, hook)
    cases = []
    probes = [('', ''), ('A', '%s approaches!'), ('Hogger', 'Grrr... fresh meat!'),
              ('Lair Guardian', LITERALS[6][1]), ('Gardien localisé', '%s approche !'),
              ('守護者', '%sが接近する！'), ('A' * 23, 'B'), ('A' * 24, 'B'),
              ('A' * 31, 'B' * 32), ('A' * 32, 'B' * 256), ('A' * 512, 'B' * 1024)]
    probes += [('Murloc Streamrunner', text) for _, text in LITERALS]
    for kind, start, end in [('emote', 0x1458A9500, 0x1458A97D9), ('yell', 0x1458AAE00, 0x1458AB145)]:
        for name, body in probes:
            uc.mem_write(BASE, bytes(SIZE))
            next_heap = HEAP
            calls.clear()
            active = (start, end)
            a, b = name.encode(), body.encode()
            uc.mem_write(NAME, a or b'\0')
            uc.mem_write(BODY, b or b'\0')
            for key in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
                reg(key, 0)
            reg('RSP', SP)
            reg('RCX', OUTPUT)
            guid = 0xF1300002B2000007
            reg('RDX', guid if kind == 'yell' else NAME)
            reg('R8', NAME if kind == 'yell' else len(a))
            reg('R9', len(a) if kind == 'yell' else BODY)
            if kind == 'yell':
                put(SP + 0x28, '<QQ', BODY, len(b))
            else:
                put(SP + 0x28, '<Q', len(b))
            put(SP, '<Q', DONE)
            uc.emu_start(start, 0, count=10000)
            assert reg('RIP') == DONE, 'Native serializer exhausted instruction budget'
            capacity, pointer, length, opcode = get(OUTPUT, '<QQQH')
            packet = bytes(uc.mem_read(pointer, length))
            expected = bytes([0x0C if kind == 'yell' else 0x5A]) + struct.pack('<I', 0)
            if kind == 'yell':
                expected += struct.pack('<Q', guid)
            expected += struct.pack('<I', len(a) + 1) + a + b'\0' + struct.pack('<Q', 0)
            expected += struct.pack('<I', len(b) + 1) + b + b'\0\0'
            assert opcode == 0x96 and packet == expected and capacity >= length
            cases.append(dict(kind=kind, speaker=name, text=body,
                              sender_guid=guid if kind == 'yell' else 0,
                              opcode=opcode, body_hex=packet.hex(), byte_count=length,
                              vector_growth_calls=sum(call in ('0x145bcb2d0', '0x145d69340') for call in calls)))

    selected = dict(target_version='0.105.0', target_sha256=SHA, target_executed=False,
                    enemy_name_id_count=len(native_enemies), source_name_contracts=source_names,
                    locales_checked=locales, literals=literals,
                    native_packet_cases=cases,
                    seams=['Synthetic allocation and byte copy; no native allocator/memcpy runs.',
                           'Vec reserve/grow preserves bytes and supplies synthetic capacity; unreviewed calls fail.'],
                    limits=['Original instructions execute only inside the two reviewed packet serializers.',
                            'Producer/localization/name fields are inspected statically; timing and game/client execution are unverified.',
                            'No Rust compilation/tests, game process or original/rebuilt UI comparison.'])
    result = formatted(selected)
    if args.check:
        assert (OUT / 'packet-vectors.json').read_text() == result, 'Retained announcement vectors differ'
        manifest = json.loads((OUT / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        for row in manifest['ranges']:
            assert row['source'] == span(int(row['source']['va'], 16), row['source']['byte_count'])
            assert hashlib.sha256((ROOT / row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
        assert hashlib.sha256((OUT / 'yell-packet.pseudo.c').read_bytes()).hexdigest() == manifest['rea_yell']['pseudocode_sha256']
    else:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / 'packet-vectors.json').write_text(result)
        ranges = []
        for name, start, end in RANGES:
            assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                f'--start-address={start:#x}', f'--stop-address={end:#x}', str(exe.relative_to(ROOT))], cwd=ROOT)
            (WORK / f'{name}.asm').write_bytes(assembly)
            ranges.append(dict(role=name, source=span(start, end-start),
                               assembly=str((OUT / f'{name}.asm').relative_to(ROOT)),
                               assembly_sha256=hashlib.sha256(assembly).hexdigest()))
        for name, start, end, assembly in CANONICAL:
            ranges.append(dict(role=name, source=span(start, end-start), assembly=assembly,
                               assembly_sha256=hashlib.sha256((ROOT / assembly).read_bytes()).hexdigest()))
        rea_path = WORK / 'rea-yell-packet/003-procedure_pseudo_code.json'
        evidence = json.loads(rea_path.read_text())['response']['result']['structuredContent']
        pseudo = '\n'.join(line.rstrip() for line in evidence['normalized_result'].splitlines()).strip() + '\n'
        (WORK / 'yell-packet.pseudo.c').write_text(pseudo)
        rea = dict(evidence_id=evidence['evidence_id'], source=span(0x1458AAE00, 0x345),
                   provider=evidence['provider'], analysis_profile=evidence['analysis_profile'],
                   pseudocode='yell-packet.pseudo.c', pseudocode_sha256=hashlib.sha256(pseudo.encode()).hexdigest())
        manifest = dict(target=target['path'], target_sha256=SHA, target_process_launched=False,
                        ranges=ranges, rea_yell=rea,
                        limitations=['Ghidra generic raw ABI does not recover original Rust/Win64 types; actual PE instructions govern operands.',
                                     'Canonical emote serializer and boss constructor are referenced without copying existing extracts.',
                                     'Static evidence and bounded packet replay do not establish compilation or game/UI parity.'])
        (WORK / 'manifest.json').write_text(formatted(manifest))
    print(f'Passed {len(cases)} unchanged-native announcement packet cases; {len(native_enemies)} current name/id rows in two catalogs; {len(locales)} locale catalogs')


if __name__ == '__main__':
    main()

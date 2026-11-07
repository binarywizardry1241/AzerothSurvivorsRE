#!/usr/bin/env python3
"""Replay current #58 visibility/emote contracts without compiling or running a game.

Unicorn executes original instructions. Allocation, memcpy and Vec growth are
explicit host seams. This cannot establish the reported sustained duplicate's
cause, addon hook activity, rendered visibility or original/rebuilt parity.
"""

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

import argparse
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
OUT = ROOT / 'docs/analysis/evidence/banner-takeover'
WORK = ROOT / 'runtime/analysis/history/addon/banner-takeover/d697375a5b27/checks'
RANGES = {
    'banner-registry-read': (0x1402B220F, 0x1402B226C),
    'banner-predicate': (0x1402B2258, 0x1402B226C),
    'emote-packet': (0x1459A9360, 0x1459A96AE),
    'scoped-locale': (0x1458D6DC0, 0x1458D6F35),
    'pack-producer': (0x14596062A, 0x145960649),
    'wall-producer': (0x145960ADC, 0x145960AFB),
    'swarm-producer': (0x145960EF1, 0x145960F10),
    'stampede-producer': (0x145961330, 0x14596134A),
    'wave-delivery': (0x14596134A, 0x14596140A),
    'boss-entry-delivery': (0x14594C61C, 0x14594C657),
}


def digest(value):
    return hashlib.sha256(value).hexdigest()


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def function_body(source, name):
    marker = 'function ' + name + '('
    assert source.count(marker) == 1, name
    return source.split(marker, 1)[1].split('\nend', 1)[0]


def scoped_locale_cases(data, pe, unicorn, registers):
    code_start, code_end = 0x1458D6DC0, 0x1458D6F35
    file_offset = pe.rva_offset(code_start - pe.image_base)
    native_bytes = data[file_offset:file_offset + code_end - code_start]

    cpu = unicorn.Uc(unicorn.UC_ARCH_X86, unicorn.UC_MODE_64)
    cpu.mem_map(code_start & ~4095, 4096)
    cpu.mem_write(code_start, native_bytes)
    cpu.mem_map(0x148217000, 4096)
    cpu.mem_map(0x145853000, 4096)
    cpu.mem_map(0x20000000, 0x20000)

    base = 0x20000000
    stop = base + 0x1F000
    tls = base + 0x10000

    def put(address, fmt, *values):
        cpu.mem_write(address, struct.pack('<' + fmt, *values))

    def get(address, fmt):
        packed_format = '<' + fmt
        return struct.unpack(
            packed_format,
            cpu.mem_read(address, struct.calcsize(packed_format)),
        )

    def reg(name, value=None):
        key = getattr(registers, 'UC_X86_REG_' + name)
        if value is not None:
            cpu.reg_write(key, value)
        return cpu.reg_read(key)

    put(0x1482172F0, 'I', 0)
    reg('GS_BASE', base)
    put(base + 0x58, 'Q', base + 0x2000)
    put(base + 0x2000, 'Q', tls)

    parser_calls = []

    def hook(_, address, size, unused):
        if address == stop:
            cpu.emu_stop()
            return
        if address == 0x145853470:
            parser_calls.append(dict(
                tls=get(tls + 0x330, 'QQ'),
                arguments=[
                    reg('RDX'),
                    reg('R8'),
                    reg('R9'),
                    get(reg('RSP') + 0x28, 'Q')[0],
                ],
            ))
            put(reg('RCX'), 'QQQ', 4, base + 0x12000, 5)
            stack_pointer = reg('RSP')
            reg('RIP', get(stack_pointer, 'Q')[0])
            reg('RSP', stack_pointer + 8)
        else:
            assert code_start <= address < code_end, (
                hex(address), 'unexpected native address'
            )

    cpu.hook_add(unicorn.UC_HOOK_CODE, hook)
    supported_locales = [
        'en', 'pl', 'cs', 'de', 'pt', 'es', 'fr', 'ro', 'tr', 'ru',
        'uk', 'zh', 'ja', 'ko',
    ]
    locale_cases = supported_locales + ['xx', 'EN', 'e', None]
    rows = []
    for locale_code in locale_cases:
        for index in [0, 1]:
            put(tls + 0x330, 'QQ', 1, 8)
            put(base + 0x3000, 'QQQ',
                base + 0x4000, base + 0x5000, base + 0x6000)
            put(base + 0x4000, 'QQQ', 0, base + 0x7000, 123)
            put(base + 0x5000, 'Q', base + 0x5500)
            put(base + 0x5500, 'QQQ', 1, base + 0x8000, 1)
            put(base + 0x6000, 'Q', index)
            put(base + 0x8000, 'QQ', base + 0x9000, 7)

            cpu.mem_write(base + 0xA000, (locale_code or '').encode() + b'\0')
            reg('RDX', base + 0xA000 if locale_code is not None else 0)
            reg('R8', len(locale_code or ''))
            reg('RCX', base + 0xB000)
            reg('R9', base + 0x3000)
            reg('RSP', base + 0xF008)
            put(base + 0xF008, 'Q', stop)

            calls_before = len(parser_calls)
            cpu.emu_start(code_start, stop, count=2000)
            assert reg('RIP') == stop
            assert len(parser_calls) == calls_before + 1
            assert reg('RAX') == base + 0xB000
            assert get(base + 0xB000, 'QQQ') == (4, base + 0x12000, 5)
            assert get(tls + 0x330, 'QQ') == (1, 8)

            parser_call = parser_calls[-1]
            valid_locale = locale_code in supported_locales
            assert bool(parser_call['tls'][0]) == valid_locale
            if valid_locale:
                assert parser_call['tls'][1] == supported_locales.index(locale_code)
            assert parser_call['arguments'][:2] == [base + 0x7000, 123]
            if index == 0:
                assert parser_call['arguments'][2:] == [base + 0x9000, 7]
            else:
                assert parser_call['arguments'][2] == 0
            rows.append(dict(
                locale=locale_code,
                index=index,
                valid=valid_locale,
                ordinal=parser_call['tls'][1] if valid_locale else None,
            ))
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed target needs fresh recovery'
    data = target_bytes(target)
    pe = load_script('current_banner_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    for directory in ('runtime/tool-state/python/camera/python-libs',
                      'runtime/tool-state/python/armory/python-libs'):
        sys.path.insert(0, str(ROOT / directory))
    import capstone as c
    import unicorn as u
    from unicorn import x86_const as r
    decoder = c.Cs(c.CS_ARCH_X86, c.CS_MODE_64)
    records, extracts = [], {}
    for name, (start, end) in RANGES.items():
        path = 'banner-registry-read.asm' if name == 'banner-predicate' else name + '.asm'
        records.append(dict(role=name, start=hex(start), end_exclusive=hex(end),
                            file_offset=hex(pe.rva_offset(start-pe.image_base)),
                            sha256=digest(raw(start, end-start)), assembly=path))
        if name != 'banner-predicate':
            extracts[path] = ''.join(f'{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'
                                     for i in decoder.disasm(raw(start, end-start), start))
    # Bind the settings read to its actual key and trim call, not a relocated RVA alone.
    start, end = RANGES['banner-registry-read']
    read = list(decoder.disasm(raw(start, end-start), start))
    assert read[0].bytes[:3] == b'\x4c\x8d\x05'
    key = read[0].address + read[0].size + struct.unpack('<i', read[0].bytes[3:])[0]
    assert raw(key, 10) == b'hudBanners'
    assert any(i.mnemonic == 'call' and i.op_str == '0x1401edaa0' for i in read)
    producers = []
    for role, text in [('pack', 'A pack hunts you!'), ('wall', 'A wall of foes closes in!'),
                       ('swarm', 'Swarm surrounds you!'), ('stampede', 'A stampede charges through!'),
                       ('boss-entry', '%s enters the battlefield!')]:
        name = 'boss-entry-delivery' if role == 'boss-entry' else role + '-producer'
        start, end = RANGES[name]
        instructions = list(decoder.disasm(raw(start, end-start), start))
        first = instructions[0]
        assert first.mnemonic == 'lea' and first.bytes[:2] == b'\x4c\x8d'
        template = first.address + first.size + struct.unpack('<i', first.bytes[3:])[0]
        assert raw(template, len(text)) == text.encode()
        assert any(i.mnemonic == 'call' and i.op_str == '0x1458dff90' for i in instructions)
        if role != 'boss-entry':
            tail = instructions[-1]
            if role != 'stampede':
                assert tail.mnemonic == 'jmp' and tail.op_str == '0x14596134a'
        producers.append(dict(role=role, template=text, address=hex(template), site=hex(start)))
    for name in ['wave-delivery', 'boss-entry-delivery']:
        start, end = RANGES[name]
        instructions = list(decoder.disasm(raw(start, end-start), start))
        assert instructions[-1].mnemonic == 'call' and instructions[-1].op_str == '0x1459a9360'

    cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    for start, end in (RANGES['banner-predicate'], RANGES['emote-packet']):
        page = start & ~4095
        cpu.mem_map(page, ((end-page+4095)//4096)*4096)
        cpu.mem_write(start, raw(start, end-start))
    base, stop = 0x20000000, 0x2007F000
    cpu.mem_map(base, 0x80000)
    for page in (0x140002000, 0x145D14000, 0x145EB6000):
        cpu.mem_map(page, 4096)
    heap, active = base + 0x40000, None

    def reg(name, value=None):
        key = getattr(r, 'UC_X86_REG_' + name)
        if value is not None:
            cpu.reg_write(key, value)
        return cpu.reg_read(key)

    def put(address, fmt, *values):
        cpu.mem_write(address, struct.pack('<' + fmt, *values))

    def get(address, fmt):
        return struct.unpack('<' + fmt, cpu.mem_read(address, struct.calcsize('<'+fmt)))

    def alloc(count):
        nonlocal heap
        address = heap
        heap += (count+15)&~15
        assert heap < stop
        return address

    def hook(_, address, size, unused):
        if address == stop:
            cpu.emu_stop()
            return
        if active[0] <= address < active[1]:
            assert bytes(cpu.mem_read(address, size)) == raw(address, size)
            return
        if address == 0x140002200:
            pass
        elif address == 0x1400021C0:
            assert (reg('RCX'), reg('RDX')) == (32, 1)
            reg('RAX', alloc(32))
        elif address == 0x145D145FB:
            cpu.mem_write(reg('RCX'), bytes(cpu.mem_read(reg('RDX'), reg('R8'))))
        elif address in (0x145EB6EC0, 0x145D14A10):
            vector = reg('RCX')
            capacity, pointer, length = get(vector, 'QQQ')
            wanted = length + (reg('R8') if address == 0x145D14A10 else 1)
            capacity = max(capacity*2, wanted)
            grown = alloc(capacity)
            cpu.mem_write(grown, bytes(cpu.mem_read(pointer, length)))
            put(vector, 'QQ', capacity, grown)
        else:
            raise AssertionError(f'Unreviewed native callee {address:#x}')
        sp = reg('RSP')
        reg('RIP', get(sp, 'Q')[0])
        reg('RSP', sp+8)

    cpu.hook_add(u.UC_HOOK_CODE, hook)
    predicates = []
    for value in ('', '0', '1', '00', 'false', '0.0', '2', '0x0'):
        active = RANGES['banner-predicate']
        cpu.mem_write(base, value.encode() or b'\0')
        reg('RAX', base)
        reg('RDX', len(value))
        reg('RBP', base+0x1000)
        cpu.emu_start(active[0], active[1], count=20)
        shown = get(base+0x10B8, 'B')[0]
        assert bool(shown) == (value != '0')
        predicates.append([value, shown])

    packets = []
    for name in ('', 'Murloc', 'Gardien localisé', '守護者', 'A'*512):
        for body in ('A pack hunts you!', 'A wall of foes closes in!',
                     'Swarm surrounds you!', 'A stampede charges through!',
                     '%s enters the battlefield!', 'B'*1024):
            active, heap = RANGES['emote-packet'], base+0x40000
            cpu.mem_write(base, bytes(0x70000))
            a, b = name.encode(), body.encode()
            cpu.mem_write(base+0x2000, a or b'\0')
            cpu.mem_write(base+0x6000, b)
            sp = base+0x20008
            reg('RSP', sp)
            put(sp, 'Q', stop)
            put(sp+0x28, 'Q', len(b))
            reg('RCX', base+0x1000)
            reg('RDX', base+0x2000)
            reg('R8', len(a))
            reg('R9', base+0x6000)
            cpu.emu_start(active[0], stop, count=20000)
            assert reg('RIP') == stop
            capacity, pointer, length, opcode = get(base+0x1000, 'QQQH')
            actual = bytes(cpu.mem_read(pointer, length))
            expected = b'\x5a'+bytes(4)+struct.pack('<I', len(a)+1)+a+b'\0'+bytes(8)
            expected += struct.pack('<I', len(b)+1)+b+b'\0\0'
            assert actual == expected and opcode == 0x96 and capacity >= length
            packets.append([name, body, digest(actual)])

    api_path = 'docs/analysis/evidence/embedded-api.lua'
    api = (ROOT / api_path).read_bytes()
    assert data[0x70063F0:0x70063F0 + len(api)] == api
    baseline = (ROOT / 'docs/analysis/evidence/addon-api/bootstrap-contract.lua').read_text()
    functions = ['AZS_SetHudShown', 'AZS_IsHudShown', 'AZS_RegisterBannerHandler',
                 'AZS_UnregisterBannerHandler', 'AZS_ParseBanner', 'AZS_OnBanner']
    for name in functions:
        assert function_body(baseline, name) == function_body(api.decode(), name), name
    bootstrap_path = ROOT / 'crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs'
    bootstrap = bootstrap_path.read_text()
    source_match = re.search(r'const SOURCE: &str =\s*include_str!\("([^"]+)"\);', bootstrap)
    assert source_match, 'Trace the selected bootstrap SOURCE before claiming banner equivalence'
    source_path = (bootstrap_path.parent / source_match[1]).resolve()
    assert source_path.is_relative_to(ROOT)
    connected_api = source_path.read_text()
    for name in functions:
        assert function_body(connected_api, name) == function_body(api.decode(), name), name
    source_guards = {
        'crates/benilla-app/src/local_client.rs': ['script.unflushed_cvar(name)', '*value = applied;'],
        'crates/benilla-ui/src/script/cvars.rs': ['pub fn unflushed_cvar', 'CvarWrite::FillReset { .. } => false'],
        'crates/azeroth-survivors-re/src/gameplay/run_hud/settings.rs': ['("banners", "hudBanners")', 'settings.visible[index - 1] = shown(&mirror.effective)'],
        'crates/azeroth-survivors-re/src/gameplay/notifications.rs': ['settings.shown("banners")', 'if let Some(root) = state.root { commands.entity(root).insert(visibility); }'],
        'crates/azeroth-survivors-re/src/gameplay/client/events.rs': ['SessionEvent::Chat(event.chat(', 'addon_banners::packet(kind,true'],
        'crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs': ['source.replace("HUD_CVARS_LUA", &parts)'],
        'crates/benilla-app/src/ui_chat/frames.rs': ['script.fire_event(event_name(kind), event.script_args())'],
        'crates/benilla-ui/src/script/object.rs': ['wrappers.get::<Value>(id)', 'wrappers.set(id, t.clone())'],
    }
    for path, tokens in source_guards.items():
        source = (ROOT / path).read_text()
        for token in tokens:
            assert token in source, (path, token)
    kinds = ['boss', 'finalboss', 'bossdown', 'guardian', 'achievement', 'unlocked',
             'magnet', 'cache', 'rune', 'downed', 'frienddown', 'revived']
    table = []
    for index, expected in enumerate(kinds):
        address = 0x14700CDA0 + index * 16
        record = raw(address, 16)
        pointer, length = struct.unpack('<QQ', record)
        assert raw(pointer, length).decode() == expected
        table.append(dict(address=hex(address), bytes=record.hex(), kind=expected))
    record_path = OUT / 'record-parser.json'
    record = json.loads(record_path.read_text())
    assert record['target']['sha256'] == SHA
    binding = record['raw_import']
    image_base = int(binding['base'], 16)
    image = bytearray(binding['size_bytes'])
    for segment in binding['segments']:
        start, end = int(segment['start'], 16), int(segment['end_exclusive'], 16)
        contents = raw(start, end-start)
        assert digest(contents) == segment['sha256']
        assert image_base <= start < end <= image_base + len(image)
        image[start-image_base:end-image_base] = contents
    assert binding['padding'] == 'zero' and digest(image) == binding['sha256']
    for row in record['supplemental_data_bindings']:
        contents = raw(int(row['start'], 16), row['byte_count'])
        assert contents.hex() == row['bytes'] and digest(contents) == row['sha256']
    for edge in record['current_direct_edges']:
        start = int(edge['site'], 16)
        code = raw(start, 5)
        assert code[0] == 0xe8
        assert start + 5 + struct.unpack('<i', code[1:])[0] == int(edge['target'], 16)
    for observation in record['observations']:
        if 'canonical_extract' in observation:
            extract = observation['canonical_extract']
            assert digest((ROOT / extract['path']).read_bytes()) == extract['sha256']
        else:
            canonical = json.loads((ROOT / observation['canonical_extract_ref']).read_text())
            assert canonical['target']['sha256'] == SHA
            assert canonical['input_mapping']['runtime_function_start'] == observation['address']
            extract = canonical['canonical_extract']
            assert digest((ROOT / extract['path']).read_bytes()) == extract['sha256']
    assert digest((OUT / record['assembly']['path']).read_bytes()) == record['assembly']['sha256']
    for line in (OUT / record['assembly']['path']).read_text().splitlines():
        address, value, *_ = line.split()
        value = bytes.fromhex(value)
        assert raw(int(address, 16), len(value)) == value
    if args.prepare_rea:
        directory = WORK / ('rea-reproduce-' + binding['sha256'][:16])
        directory.mkdir(parents=True, exist_ok=True)
        raw_path, seed_path = directory / 'owners.bin', directory / 'seeds.tsv'
        entries = [int(row['address'], 16) for row in record['observations']]
        seeds = ''.join(f'{address:#x}\tfunction\n{address:#x}\tcode\n' for address in entries)
        assert digest(seeds.encode()) == record['query']['seed_sha256']
        plan = dict(target=str(raw_path.relative_to(ROOT)),
                    output=str((directory / 'rea').relative_to(ROOT)), init_timeout=60, timeout=180,
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(image_base)),
                    environment={'REA_GHIDRA_SEED_FILE': str(seed_path.relative_to(ROOT))},
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(address)),
                                     label=hex(address)) for address in entries])
        for path, contents in [(raw_path, bytes(image)), (seed_path, seeds.encode()),
                               (directory / 'plan.json', encoded(plan).encode())]:
            if path.exists():
                assert path.read_bytes() == contents, 'Retain changed inputs and select a new output'
            else:
                path.write_bytes(contents)
        print('Prepared durable REA plan:', (directory / 'plan.json').relative_to(ROOT))
    locales = scoped_locale_cases(data, pe, u, r)
    result = dict(target_version=target['version'], target_sha256=SHA, target_executed=False,
                  spans=records, cases=dict(native_predicate=len(predicates), native_emote_packets=len(packets), native_scoped_locale=len(locales)),
                  record_proof_sha256=digest(record_path.read_bytes()),
                  api=dict(path=api_path, sha256=digest(api), unchanged_function_bodies=functions),
                  source_contracts=source_guards, banner_kinds=table, announcement_producers=producers,
                  case_sha256=digest(encoded([predicates, packets, locales]).encode()),
                  limits=['Predicate starts after trim; trim internals are a separate contract.',
                          'Allocation, memcpy and Vec growth are explicit synthetic host seams.',
                          'Scoped locale replay stubs the record parser; its formatting is separate evidence.',
                          'No actual VM/addon/Bevy schedule or rendered visibility is executed.',
                          'These contracts do not establish sustained duplicate causality or parity.'])
    extracts['native-cases.json'] = encoded(result)
    WORK.mkdir(parents=True, exist_ok=True)
    for name, value in extracts.items():
        (WORK/name).write_text(value)
    if args.write:
        OUT.mkdir(parents=True, exist_ok=True)
        for name, value in extracts.items():
            (OUT/name).write_text(value)
    else:
        for name, value in extracts.items():
            assert (OUT/name).read_text() == value, name
    print(f'PASS: {len(predicates)} current native predicates and {len(packets)} complete emote packets; {len(locales)} scoped-locale cases; no compiler/game')


if __name__ == '__main__':
    main()

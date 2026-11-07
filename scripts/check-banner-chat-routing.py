#!/usr/bin/env python3
"""Replay the selected target's chat-event-name lookup; no build, Lua or game.

This checks the enum/event boundary used by the banner hooks, not hook activity.
--write promotes compact evidence after writing it beneath runtime/ for review.
"""
import argparse
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
OUT = ROOT / 'docs/analysis/evidence/0.113.2/banner-takeover'
WORK = ROOT / 'runtime/analysis/history/findings/fixgap58-dispatch/e85d4625034a/chat-proof'
LOOKUP, LENGTHS, POINTERS = 0x1410330A0, 0x1460CC128, 0x1460CC410
SOURCE = 'crates/benilla-app/src/ui_chat/event.rs'


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def digest(value):
    return hashlib.sha256(value).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Recover the selected target before reusing these addresses'
    data = target_bytes(target)
    pe = load_script('banner_chat_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    for path in ('runtime/tool-state/python/camera/python-libs',
                 'runtime/tool-state/python/armory/python-libs'):
        sys.path.insert(0, str(ROOT / path))
    import capstone as c
    import unicorn as u
    from unicorn import x86_const as r
    md = c.Cs(c.CS_ARCH_X86, c.CS_MODE_64)
    cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    mapped = set()

    def map_bytes(address, contents):
        for page in range(address & ~4095, (address + len(contents) + 4095) & ~4095, 4096):
            if page not in mapped:
                cpu.mem_map(page, 4096)
                mapped.add(page)
        cpu.mem_write(address, contents)

    source = re.sub(r'//[^\n]*', '', (ROOT / SOURCE).read_text())
    enum = source.split('enum ChatEventKind {', 1)[1].split('}', 1)[0]
    kinds = [kind.strip() for kind in enum.split(',') if kind.strip()]
    names = dict(re.findall(r'K::(\w+)\s*=>\s*"(CHAT_MSG_[A-Z_]+)"',
                            source.split('fn event_name(', 1)[1].split('\n}', 1)[0]))
    assert len(kinds) == len(names) == 93
    map_bytes(LOOKUP, raw(LOOKUP, 29))
    map_bytes(LENGTHS, raw(LENGTHS, len(kinds) * 8))
    map_bytes(POINTERS, raw(POINTERS, len(kinds) * 8))
    stack, stop = 0x20000000, 0x20001000
    map_bytes(stack, struct.pack('<Q', stop))
    map_bytes(stop, b'\xcc')
    cases = []
    for index, kind in enumerate(kinds):
        length = struct.unpack('<Q', raw(LENGTHS + index * 8, 8))[0]
        pointer = struct.unpack('<Q', raw(POINTERS + index * 8, 8))[0]
        expected = names[kind].encode()
        assert raw(pointer, length) == expected, (index, kind)
        map_bytes(pointer, expected)
        cpu.reg_write(r.UC_X86_REG_RSP, stack)
        cpu.reg_write(r.UC_X86_REG_RCX, index)
        cpu.emu_start(LOOKUP, stop, count=8)
        assert cpu.reg_read(r.UC_X86_REG_RIP) == stop
        assert cpu.reg_read(r.UC_X86_REG_RAX) == pointer
        assert cpu.reg_read(r.UC_X86_REG_RDX) == length
        cases.append([index, kind, expected.decode()])

    # Bind Ghidra's raw imports back to exact installed-PE bytes, not labels.
    rea = json.loads((OUT / 'chat-routing-rea.json').read_text())
    assert rea['target_sha256'] == SHA
    for observation in rea['observations']:
        binding = observation['raw_import_binding']
        base = int(binding['base'], 16)
        imported = bytearray(binding['size_bytes'])
        assert binding['padding'] == 'zero'
        for segment in binding['segments']:
            start, end = int(segment['start'], 16), int(segment['end_exclusive'], 16)
            contents = raw(start, end - start)
            assert digest(contents) == segment['sha256']
            assert base <= start < end <= base + len(imported)
            imported[start - base:end - base] = contents
        assert digest(imported) == observation['raw_import_sha256']

    extracts, spans = {}, []
    for role, start, end in [('chat-event-name', LOOKUP, LOOKUP + 29),
                             ('chat-event-publication', 0x140C2DA3A, 0x140C2DA61)]:
        contents = raw(start, end - start)
        extracts[role + '.asm'] = ''.join(
            f'{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip() + '\n'
            for i in md.disasm(contents, start))
        spans.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
                          sha256=digest(contents), assembly=role + '.asm'))
    tables = [dict(role=role, start=hex(address), size_bytes=len(kinds) * 8,
                   sha256=digest(raw(address, len(kinds) * 8)))
              for role, address in [('event-name-lengths', LENGTHS), ('event-name-pointers', POINTERS)]]
    result = dict(target_version='0.113.2', target_sha256=SHA, target_executed=False,
                  spans=spans, tables=tables, source=SOURCE,
                  native_event_name_cases=len(cases), case_sha256=digest(encoded(cases).encode()),
                  selected_cases=[case for case in cases if case[1] in
                                  {'System', 'MonsterYell', 'RaidWarning', 'RaidBossEmote'}],
                  attachments={name: digest((OUT / name).read_bytes()) for name in
                               ['chat-routing-rea.json', 'addon-chat-contract.json']},
                  limits=['Only the original event-name lookup executes in Unicorn; it has no external-call seams.',
                          'The publication excerpt is independently decoded; its callees and the full route are not replayed.',
                          'Matching enum/event names do not prove active addon hooks, callback order, rendered visibility or duplicate causality.'])
    extracts['chat-routing.json'] = encoded(result)
    if args.write:
        WORK.mkdir(parents=True, exist_ok=True)
        for name, contents in extracts.items():
            (WORK / name).write_text(contents)
        for name, contents in extracts.items():
            (OUT / name).write_text(contents)
    else:
        for name, contents in extracts.items():
            assert (OUT / name).read_text() == contents, name
    print(f'PASS: {len(cases)} original-instruction event-name cases match source; native publication bytes bound. No build/Lua/game.')


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""Check current warning routing/names/packet instructions without a build or game.

--write stages reviewed evidence under runtime/analysis/staging/native-evidence/raid-warnings.
Optional Capstone/Unicorn packages must already exist; no install is performed.
Allocator, formatter, localization, copy and Vec growth are explicit synthetic
seams. The EXE is read in place; its process and the reconstructed Rust never run.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/raid-warnings'
RETAINED = ROOT / 'docs/analysis/evidence/raid-warnings'
WARNINGS = [
    ('SweepingGaze', 15, 0x1459588b3, 0x14722ac08, "%s's gaze sweeps the field!"),
    ('Eggs', 22, 0x14595c315, 0x14722acb8, 'Destroy them before they hatch!'),
    ('HealingWards', 22, 0x14595be65, 0x14722acd7, '%s is healed by its wards! Destroy them!'),
    ('ShieldingWards', 22, 0x14595c329, 0x14722acff, '%s is shielded by its wards! Destroy them!'),
    ('Tether', 25, 0x14595acd2, 0x14722adb8, "%s's tether drains you! Get away to break it!"),
    ('Gaze', 26, 0x14595b18b, 0x14722ae18, '%s fixes its gaze on you! Do not move!'),
    ('BurningGround', 28, 0x145958e23, 0x14722ae70, 'The ground burns around you! Stay inside the circle!'),
    ('Bomb', 30, 0x145957eea, 0x14722af08, 'You are the bomb! Carry it into the horde!'),
    ('Crystals', 33, 0x14595ab5f, 0x14722af98, 'Stand in a crystal to weaken %s!'),
]


def dump(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def run(write):
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                    str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    import capstone
    import unicorn
    from capstone.x86 import X86_OP_IMM
    from unicorn import x86_const as r

    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed target requires fresh warning recovery'
    data = target_bytes(target)
    module = load_script('warnings_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(a, n):
        offset = pe.rva_offset(a - pe.image_base)
        return data[offset:offset+n]

    def span(a, n):
        return dict(va=hex(a), byte_count=n,
                    file_offset=hex(pe.rva_offset(a-pe.image_base)),
                    sha256=hashlib.sha256(raw(a, n)).hexdigest())

    # This checks current records and the selected dispatcher control flow;
    # these direct instruction paths do not establish complete indirect ownership.
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    md.detail = True
    dispatcher_start, dispatcher_end = 0x1459578e0, 0x14595d1c5
    instructions = {i.address: i for i in md.disasm(raw(dispatcher_start, dispatcher_end-dispatcher_start), dispatcher_start)}
    table = 0x14722ce3c
    sites = {site: name for name, _, site, _, _ in WARNINGS}
    reachable = {}
    for index in range(32):
        entry = table + struct.unpack('<i', raw(table+4*index, 4))[0]
        queue, seen, hits = [entry], set(), set()
        while queue:
            address = queue.pop()
            if address in seen or address not in instructions or address == 0x145957978:
                continue
            seen.add(address)
            ins = instructions[address]
            if address in sites:
                hits.add(sites[address])
            if ins.mnemonic.startswith('ret'):
                continue
            if ins.mnemonic.startswith('j'):
                if ins.operands[0].type == X86_OP_IMM:
                    queue.append(ins.operands[0].imm)
                if ins.mnemonic == 'jmp':
                    continue
            queue.append(address+ins.size)
        if hits:
            reachable[index+3] = sorted(hits)
    expected = {}
    literals = []
    for name, tag, site, address, text in WARNINGS:
        expected.setdefault(tag, []).append(name)
        assert raw(address, len(text.encode())) == text.encode()
        ins = instructions[site]
        assert ins.mnemonic == 'lea'
        assert site+ins.size+ins.operands[1].mem.disp == address
        literals.append(dict(name=name, native_tag=tag, load_site=span(site, ins.size),
                             text=text, source=span(address, len(text.encode()))))
    assert reachable == {tag: sorted(names) for tag, names in expected.items()}
    assert raw(0x146bd251f, 9) == b'\x06enemy.\xc0\0'
    assert raw(0x146bd2540, 14) == b'\x05boss.\xc0\x05.name\0'
    assert raw(0x14720ba90, 5) == b'Enemy'

    # Native ward branch is zero=>eggs, one=>healing, other=>shielding.
    branch = instructions[0x14595be52]
    assert branch.mnemonic == 'test' and branch.op_str == 'r13d, r13d'
    assert instructions[0x14595be55].operands[0].imm == 0x14595c315
    assert instructions[0x14595be5b].mnemonic == 'cmp'
    assert instructions[0x14595be5b].operands[1].imm == 1
    assert instructions[0x14595be5f].operands[0].imm == 0x14595c329

    uc = unicorn.Uc(unicorn.UC_ARCH_X86, unicorn.UC_MODE_64)
    extent = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base, (extent+4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base+section['rva'], data[section['raw_offset']:section['raw_offset']+section['raw_size']])
    BASE, SIZE, DONE = 0x20000000, 0x80000, 0x2007f000
    uc.mem_map(BASE, SIZE)
    OUTPUT, NAME, BODY, STACK, HEAP, ACTOR, DEFINITION, FRAME = [BASE+n for n in (0x1000,0x2000,0x6000,0x10008,0x20000,0x4000,0x5000,0x18000)]
    next_heap, active, localized, captures = HEAP, None, None, []

    def reg(name, value=None):
        key = getattr(r, 'UC_X86_REG_'+name)
        if value is not None:
            uc.reg_write(key, value)
        return uc.reg_read(key)

    def put(a, fmt, *values):
        uc.mem_write(a, struct.pack('<'+fmt, *values))

    def get(a, fmt):
        return struct.unpack('<'+fmt, uc.mem_read(a, struct.calcsize('<'+fmt)))

    def alloc(count):
        nonlocal next_heap
        a = next_heap
        next_heap += (max(count, 1)+15) & ~15
        assert next_heap < DONE
        return a

    def outstr(destination, text):
        value = text.encode()
        a = alloc(len(value))
        uc.mem_write(a, value or b'\0')
        put(destination, 'QQQ', len(value), a, len(value))

    def hook(_, address, size, unused):
        if address == DONE or (active == 'tail' and address == 0x145957978):
            uc.emu_stop()
            return
        if active == 'selector':
            if address in (0x14595c315, 0x14595be65, 0x14595c329):
                captures.append(sites[address])
                uc.emu_stop()
                return
            assert 0x14595be52 <= address < 0x14595be65
            return
        bounds = {'packet': (0x1458c1260, 0x1458c1539),
                  'name': (0x14590d9a0, 0x14590dab7),
                  'tail': (0x14595b19d, 0x14595b1dd)}[active]
        if bounds[0] <= address < bounds[1]:
            assert address+size <= bounds[1]
            return
        if address == 0x140002200:
            pass
        elif address == 0x1400021c0:
            assert (reg('RCX'),reg('RDX')) == (32,1)
            reg('RAX', alloc(32))
        elif address == 0x1400021d0:
            pass
        elif address == 0x145bfa0e7:
            uc.mem_write(reg('RCX'), bytes(uc.mem_read(reg('RDX'), reg('R8'))))
        elif address in (0x145bfa970, 0x145d991b0):
            vector = reg('RCX')
            capacity, pointer, length = get(vector, 'QQQ')
            if address == 0x145bfa970:
                assert reg('RDX') == length and reg('R9') == 1
                required = length+reg('R8')
            else:
                required = length+1
            grown_capacity = max(capacity*2, required)
            grown = alloc(grown_capacity)
            uc.mem_write(grown, bytes(uc.mem_read(pointer, length)))
            put(vector, 'QQ', grown_capacity, grown)
        elif address == 0x145bcce30:
            template = reg('RDX')
            value_ref = get(reg('R8'), 'Q')[0]
            ident = get(value_ref, 'I')[0]
            key = f'enemy.{ident}' if template == 0x146bd251f else f'boss.{ident}.name'
            assert template in (0x146bd251f,0x146bd2540)
            captures.append(('key',key))
            outstr(reg('RCX'), key)
        elif address == 0x1458ec500:
            key = bytes(uc.mem_read(reg('RCX'), reg('RDX'))).decode()
            captures.append(('localized_key',key))
            if localized is None:
                reg('RAX',0)
            else:
                value = localized.encode()
                pointer = alloc(len(value))
                uc.mem_write(pointer,value)
                reg('RAX',pointer)
                reg('RDX',len(value))
        elif address == 0x1458c1260 and active == 'tail':
            captures.append(('emote',bytes(uc.mem_read(reg('RDX'),reg('R8'))).decode(),
                             bytes(uc.mem_read(reg('R9'),get(reg('RSP')+0x28,'Q')[0])).decode()))
        elif address == 0x141196a70 and active == 'tail':
            captures.append(('enqueue',reg('RCX')))
        else:
            raise AssertionError(f'Unreviewed native callee {address:#x} in {active}')
        stack = reg('RSP')
        reg('RIP',get(stack,'Q')[0])
        reg('RSP',stack+8)

    uc.hook_add(unicorn.UC_HOOK_CODE, hook)

    def reset(mode):
        nonlocal active, next_heap
        active, next_heap = mode, HEAP
        uc.mem_write(BASE,bytes(SIZE))
        captures.clear()
        for key in ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15'):
            reg(key,0)
        reg('RSP',STACK)
        put(STACK,'Q',DONE)

    packet_cases = []
    probes = [('', ''),('Guardian','%s approaches!'),('Gardien localisé','%s vous lie !'),('守護者','%sが接近する！'),('A'*24,'B'*256),('A'*512,'B'*1024)]
    probes += [('Guardian', text) for *_,text in WARNINGS]
    for speaker,body in probes:
        reset('packet')
        a,b = speaker.encode(),body.encode()
        uc.mem_write(NAME,a or b'\0');uc.mem_write(BODY,b or b'\0')
        for key,value in [('RCX',OUTPUT),('RDX',NAME),('R8',len(a)),('R9',BODY)]:reg(key,value)
        put(STACK+0x28,'Q',len(b))
        uc.emu_start(0x1458c1260,0,count=10000)
        _,pointer,length,opcode = get(OUTPUT,'QQQH')
        value = bytes(uc.mem_read(pointer,length))
        expected_packet = b'\x5a'+struct.pack('<II',0,len(a)+1)+a+b'\0'+bytes(8)+struct.pack('<I',len(b)+1)+b+b'\0\0'
        assert opcode == 0x96 and value == expected_packet
        packet_cases.append(dict(name=speaker,text=body,opcode=opcode,packet_hex=value.hex()))

    name_cases = []
    for kind in ['enemy','boss','generic']:
        for localized in [None,'Gardien localisé','守護者']:
            reset('name')
            ident, fallback = 1311,'Guardian'
            uc.mem_write(NAME,fallback.encode())
            put(ACTOR+0x18,'Q',0 if kind == 'boss' else 0xffffffffffffffff)
            if kind == 'boss':
                put(ACTOR+0x30,'Q',DEFINITION);put(DEFINITION,'QQ',NAME,len(fallback));put(DEFINITION+0x40,'I',ident)
            elif kind == 'enemy':
                put(ACTOR+0xf8,'Q',DEFINITION);put(DEFINITION+0x10,'QQ',NAME,len(fallback));put(DEFINITION+0x20,'I',ident)
            reg('RCX',ACTOR)
            uc.emu_start(0x14590d9a0,0,count=1000)
            actual = bytes(uc.mem_read(reg('RAX'),reg('RDX'))).decode()
            expected_key = 'Enemy' if kind=='generic' else (f'enemy.{ident}' if kind=='enemy' else f'boss.{ident}.name')
            assert ('localized_key',expected_key) in captures, (kind, localized, captures)
            assert actual == (localized if localized is not None else ('Enemy' if kind=='generic' else fallback))
            name_cases.append(dict(kind=kind,localized=localized,key=expected_key,result=actual))

    tail_cases = 0
    for _,_,_,text_address,text in WARNINGS:
        for localized in [None,'Texte localisé %s']:
            reset('tail')
            speaker = 'Gardien localisé'
            uc.mem_write(NAME,speaker.encode())
            for key,value in [('R14',text_address),('R15',len(text)),('RDI',NAME),('RBX',len(speaker.encode())),('RSI',ACTOR),('RBP',FRAME)]:reg(key,value)
            reg('RDX',len(text))
            uc.emu_start(0x14595b19d,0,count=1000)
            assert captures == [('localized_key',text),('emote',speaker,localized if localized is not None else text),('enqueue',ACTOR)]
            tail_cases += 1

    selector_cases = 0
    for kind in [0, 1, 2, 3, 0x80000000, 0xffffffff]:
        reset('selector')
        reg('R13',kind)
        uc.emu_start(0x14595be52,0,count=20)
        assert captures == ['Eggs' if kind==0 else 'HealingWards' if kind==1 else 'ShieldingWards']
        selector_cases += 1

    source = (ROOT/'crates/azeroth-survivors-re/src/bosses/raid_warnings.rs').read_text()
    for name,_,_,_,text in WARNINGS:
        assert f'Self::{name} => {json.dumps(text)}' in source
    for tag,name in [(15,'SweepingGaze'),(25,'Tether'),(26,'Gaze'),(28,'BurningGround'),(30,'Bomb'),(33,'Crystals')]:
        assert f'{tag} => Self::{name},' in source
    announcements = (ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/announcements.rs').read_text()
    assert 'Self::new(format!("enemy.{id}"), name)' in announcements
    assert 'Self::emote(name, warning.text())' in announcements
    assert '(0x5a, 0, name, text)' in announcements
    event_source = (ROOT/'crates/azeroth-survivors-re/src/gameplay/client/events.rs').read_text()
    assert 'SessionEvent::Chat(event.chat(&|key|locale.label(key).to_owned()))' in event_source
    locales = []
    for path in sorted((ROOT/'crates/azeroth-survivors-re/assets/locales').glob('*.json')):
        catalog = json.loads(path.read_text())
        assert all(text in catalog for *_,text in WARNINGS)
        locales.append(path.stem)

    ranges = []
    out = STAGED if write else RETAINED
    if write:out.mkdir(parents=True,exist_ok=True)
    for role,a,b in [('emote-packet',0x1458c1260,0x1458c1539),('actor-name',0x14590d9a0,0x14590dab7)]:
        assembly='\n'.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip() for i in md.disasm(raw(a,b-a),a))+'\n'
        row=dict(role=role,**span(a,b-a),assembly=role+'.asm',assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest())
        if write:(out/row['assembly']).write_text(assembly)
        else:assert (out/row['assembly']).read_text()==assembly
        ranges.append(row)
    result=dict(schema_version=1,target_version='0.109.0',target_sha256=SHA,target_executed=False,
        ranges=ranges,dispatcher=span(dispatcher_start,dispatcher_end-dispatcher_start),
        common_warning_tail=span(0x14595b19d,0x14595b1dd-0x14595b19d),
        warning_literals=literals,reachable_warning_templates=reachable,
        name_key_templates=[span(0x146bd251f,9),span(0x146bd2540,14),span(0x14720ba90,5)],
        native_packet_cases=len(packet_cases),native_name_cases=len(name_cases),native_tail_cases=tail_cases,native_ward_selector_cases=selector_cases,
        locale_catalogs=locales,
        limits=['Unicorn executes original instructions with synthetic allocator, byte-copy, formatting, localization and Vec seams; the EXE process and reconstructed Rust do not run.',
                'Dispatcher direct CFG reaches selected warning sites; indirect/global ownership is not certified.',
                'Fresh Ghidra actor-name/emote raw imports reached a bridge-handshake identity error; no successful fresh decompiler result is claimed.',
                'Custom boss cast-widget ownership/layout remains unresolved; these warnings use the existing FrameXML RAID_BOSS_EMOTE route.'])
    if write:
        (out/'manifest.json').write_text(dump(result));(out/'packet-vectors.json').write_text(dump(dict(packets=packet_cases,names=name_cases)))
    else:
        assert json.loads((out/'manifest.json').read_text()) == json.loads(dump(result))
        assert json.loads((out/'packet-vectors.json').read_text()) == dict(packets=packet_cases,names=name_cases)
    print(f'PASS: {len(packet_cases)} native packet, {len(name_cases)} native name, {tail_cases} native warning-tail, {selector_cases} ward-selector cases; nine exact templates across {len(locales)} locales; no build/game/Rust execution')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    run(parser.parse_args().write)

#!/usr/bin/env python3
"""Check current volley hazards with bounded EXE instructions; never build or launch.

--write stages evidence under runtime/ for review. Normal use verifies the
curated evidence. Historical flight fixtures supply inputs, not current proof:
both current instruction lanes and the current inline payloads execute afresh.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import math
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
EVIDENCE = ROOT / 'docs/analysis/evidence/raid-volley'
WORK = ROOT / 'runtime/analysis/history/raid/raid-volley/b39e0d299b2e/curated'
RANGES = {
    'speed-prefix': (0x145957ce8, 0x145957d4b),
    'speed-low': (0x14595bf03, 0x14595bf44),
    'speed-high': (0x14595c382, 0x14595c476),
    'speed-special': (0x14595caf0, 0x14595cafd),
    'first-flight-and-payload': (0x14595c5ce, 0x14595c6fe),
    'later-payload': (0x14595c73d, 0x14595c7e7),
    'later-flight': (0x14595ca1f, 0x14595ca71),
    'publish': (0x145950063, 0x145950085),
    'deadline-and-circle': (0x1459503c4, 0x145950436),
    'sum-and-source': (0x14595053a, 0x14595056b),
    'final-damage-scale': (0x145952f18, 0x145952f5c),
    'endless-resume-flag': (0x14591d6cb, 0x14591d6e9),
}


def dump(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed EXE requires fresh recovery'
    data = target_bytes(target)
    module = load_script('volley_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                    str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    raw = lambda a, n: data[pe.rva_offset(a-pe.image_base):pe.rva_offset(a-pe.image_base)+n]
    out = WORK if args.write else EVIDENCE
    if args.write:
        out.mkdir(parents=True, exist_ok=True)
    spans = []
    for name, (a, b) in RANGES.items():
        value = raw(a, b-a)
        ins = list(md.disasm(value, a))
        assert sum(i.size for i in ins) == len(value)
        assembly = ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}\n' for i in ins)
        row = dict(role=name, va=hex(a), byte_count=b-a,
                   file_offset=hex(pe.rva_offset(a-pe.image_base)),
                   sha256=hashlib.sha256(value).hexdigest(), assembly=name+'.asm',
                   assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest())
        if args.write:
            (out/row['assembly']).write_text(assembly)
        else:
            assert (out/row['assembly']).read_text() == assembly
        spans.append(row)

    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def demand(machine, access, address, size, value, unused):
        page = address & ~4095
        assert pe.image_base <= page < pe.image_base + len(data) + 0x100000
        if page not in mapped:
            uc.mem_map(page, 4096)
            uc.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED, demand)
    mem = 0x70000000
    uc.mem_map(mem, 0x100000)
    game, stack, record, rows = mem+0x1000, mem+0x10000, mem+0x20000, mem+0x30000
    allowed, stops = (), ()

    def hook(machine, address, size, unused):
        if address in stops:
            machine.emu_stop()
        else:
            assert any(a <= address < b for a, b in allowed), hex(address)
            instruction = next(md.disasm(bytes(machine.mem_read(address, size)), address))
            assert instruction.mnemonic != 'call', 'Host calls are outside these checks'
    uc.hook_add(UC_HOOK_CODE, hook)

    def run(start, end, intervals=None):
        nonlocal allowed, stops
        stops = (end,) if isinstance(end, int) else end
        allowed = intervals or ((start, max(stops)),)
        uc.reg_write(r.UC_X86_REG_EFLAGS, 2)
        uc.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
        uc.emu_start(start, max(stops)+1, count=1000)
        assert uc.reg_read(r.UC_X86_REG_RIP) in stops
        return uc.reg_read(r.UC_X86_REG_RIP)

    def put(a, fmt, *v): uc.mem_write(a, struct.pack('<'+fmt, *v))
    def get(a, fmt): return struct.unpack('<'+fmt, uc.mem_read(a, struct.calcsize('<'+fmt)))
    def xmm(reg, value): uc.reg_write(reg, int.from_bytes(struct.pack('<f', value), 'little'))
    def f32(value): return struct.unpack('<f', struct.pack('<f', value))[0]

    previous = json.loads((ROOT/'docs/analysis/evidence/boss-volleys/native.json').read_text())
    cases = dict(speed=0, flight=0, payload=0, publication=0, membership=0, aggregation=0, damage_scale=0)
    for case in previous['cases']['speed']:
        put(record, 'II', case['spell_id'], 1)
        uc.reg_write(r.UC_X86_REG_RCX, record)
        uc.reg_write(r.UC_X86_REG_RBP, stack)
        run(0x145957ce8, 0x14595c476, tuple(RANGES[k] for k in
            ('speed-prefix','speed-low','speed-high','speed-special')))
        assert get(stack+0xe0, 'I')[0] == case['speed_bits']
        cases['speed'] += 1
    for case in previous['cases']['flight']:
        speed = next(c['speed_bits'] for c in previous['cases']['speed'] if c['spell_id'] == case['spell_id'])
        put(stack+0xe0, 'I', speed)
        for a,b,result in ((0x14595c5ce,0x14595c609,r.UC_X86_REG_XMM6),
                           (0x14595ca1f,0x14595ca5a,r.UC_X86_REG_XMM7)):
            put(stack+0xf0, 'I', case['source_bits'][1])
            put(stack+0x150, 'I', case['source_bits'][0])
            uc.reg_write(r.UC_X86_REG_XMM10, case['center_bits'][0])
            uc.reg_write(r.UC_X86_REG_XMM11, case['center_bits'][1])
            run(a,b)
            assert uc.reg_read(result) & 0xffffffff == case['delay_bits']
            cases['flight'] += 1
    for lane in ('first','later'):
      for counter in (0,0xffffffff):
       for now in (0.,120.):
        for delay in (0.6,1.2,5.):
         for index in (0,2):
            uc.mem_write(rows, bytes([0xaa])*512)
            put(game+0x590,'QQ',rows,index)
            put(game+0xa34,'fI',now,counter)
            put(stack+0x180,'Q',99)
            put(stack+0x178,'f',45.)
            for reg,value in ((r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RBP,stack),
                              (r.UC_X86_REG_R15,index),(r.UC_X86_REG_R14,index)):
                uc.reg_write(reg,value)
            xmm(r.UC_X86_REG_XMM10,24.)
            uc.reg_write(r.UC_X86_REG_XMM10, int.from_bytes(struct.pack('<2f',24.,-7.),'little'))
            if lane == 'first':
                run(0x14595c609,0x14595c61f)
                xmm(r.UC_X86_REG_XMM6,delay);xmm(r.UC_X86_REG_XMM11,4.);xmm(r.UC_X86_REG_XMM14,45.)
                run(0x14595c657,0x14595c6fe)
            else:
                run(0x14595ca5a,0x14595ca71)
                xmm(r.UC_X86_REG_XMM7,delay);xmm(r.UC_X86_REG_XMM12,4.)
                run(0x14595c73d,0x14595c7e7)
            a=rows+index*128
            assert get(game+0xa38,'I')[0] == (counter+1)&0xffffffff
            assert get(game+0x598,'Q')[0] == index+1
            assert get(a,'Q')[0] == 0 and get(a+0x10,'I')[0] == 0
            assert get(a+0x20,'QQ') == (99,0)
            assert get(a+0x30,'If') == (0,2.5)
            assert get(a+0x3c,'I')[0] == (counter+1)&0xffffffff
            assert get(a+0x40,'4f') == (24.,-7.,4.,0.)
            assert get(a+0x50,'2f') == (now,f32(now+f32(delay)))
            assert get(a+0x58,'If') == (0,0.)
            assert get(a+0x60,'2f') == (45.,float('inf'))
            assert get(a+0x7c,'3B') == (0,0,0)
            cases['payload'] += 1
    row=rows
    uc.reg_write(r.UC_X86_REG_R13,row)
    for now in (-1.,0.,1.3,float('nan')):
     for end in (0.,1.3,120.):
      for lead in (0.,1.6,float('inf')):
        put(row+0x54,'f',end);put(row+0x64,'f',lead)
        put(stack+0x234,'f',now)
        destination=run(0x145950063,(0x145950080,0x145950172),((0x145950063,0x145950080),))
        assert (destination==0x145950080) == (not math.isnan(now) and now>=f32(f32(end)-f32(lead)))
        cases['publication'] += 1
    for radius in (0.,2.5,float('nan')):
     for distance in (0.,2.499,2.5,2.501,float('nan')):
        xmm(r.UC_X86_REG_XMM8,radius);xmm(r.UC_X86_REG_XMM0,distance)
        run(0x14595041b,0x145950422)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&255) == (f32(radius)>=f32(distance))
        cases['membership'] += 1
    for initial in (0.,45.,1e8):
     for source in (0,99,0xffffffffffffffff):
        put(stack+0x238,'f',initial);put(row+0x60,'f',45.);put(row+0x20,'Q',source)
        run(0x14595054a,0x14595056b)
        assert get(stack+0x238,'f')[0] == f32(initial+45.)
        assert get(stack+0x1a8,'Q')[0] == source
        cases['aggregation'] += 1
    for enabled in (False, True):
     for total in (-1.,0.,1.,45.,90.,float('nan')):
        put(stack+0x238,'f',total);put(stack+0xc8,'f',1.)
        put(stack+0x248,'Q',game);put(game+0xab8,'B',int(enabled))
        destination=run(0x145952f18,(0x145952f5c,0x145952fed),
                        ((0x145952f18,0x145952f5c),))
        assert (destination==0x145952f5c)==(total>0.)
        if total>0.:
            actual=struct.unpack('<f',(uc.reg_read(r.UC_X86_REG_XMM1)&0xffffffff).to_bytes(4,'little'))[0]
            assert actual==f32(total*(1. if enabled else 2.))
        cases['damage_scale'] += 1

    # The current descriptor data is recovered afresh, including native slots.
    memberships=[]
    source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
    blocks=re.findall(r'^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)',source,re.M|re.S)
    source_rows={int(re.search(r'\bid:\s*(\d+)',b)[1]):b for b in blocks}
    for zone in range(12):
        pointer,count=struct.unpack('<QQ',raw(0x146bde390+zone*240+0x88,16))
        assert count==5
        for index in range(count):
            a=pointer+index*104
            boss=struct.unpack('<I',raw(a+64,4))[0]
            moves,n=struct.unpack('<QQ',raw(a+16,16))
            expected=[]
            for slot in range(n):
                value=raw(moves+slot*56,56)
                if value[45]==4:
                    words=struct.unpack('<14I',value)
                    expected.append([1,words[0],words[1],0,0,0,words[12]])
            actual=[[int(v,16) for v in re.findall(r'0x[0-9a-f]+',w)] for w in
                    re.findall(r'RawBossAbility \{\s*words:\s*\[(.*?)\]',source_rows[boss],re.S)]
            assert [w for w in actual if w[0]==1] == expected,boss
            memberships.append(dict(boss_id=boss,volleys=expected))
    assert len(memberships)==60 and sum(len(r['volleys']) for r in memberships)==26
    abilities=(ROOT/'crates/azeroth-survivors-re/src/bosses/abilities.rs').read_text()
    volley=abilities.split('Ability::MissileVolley { spell_id, count } => {')[1].split('Ability::Summon')[0]
    assert 'effects.raid_areas.volley_impact' in volley and 'effects.impacts.push' not in volley
    area=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text()
    for token in ('self.next_id.wrapping_add(1)','if self.rows.is_empty() { return; }',
                  'ended.into_iter().rev()', 'total += row.damage',
                  'port.damage_player(total * port.raid_damage_multiplier(), source, spell)', 'follow: false'):
        assert token in area,token
    adapter=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs').read_text()
    assert 'endless_enabled: self.boss_state.completion.endless_enabled' in adapter
    assert 'if self.endless_enabled { 1.0 } else { 2.0 }' in adapter
    manifest=dict(target_version=target['version'],target_sha256=SHA,ranges=spans,
        cases=cases,boss_memberships=memberships,
        limits=['Only selected no-call Win64 instructions run in synthetic preallocated memory.',
                'Historical fixture inputs are replayed against fresh current bytes; RNG/trig, terrain, allocators, serializers and complete scheduling remain separate boundaries.',
                'Source tracing is not Rust compilation or runtime/UI/original-rebuilt parity.'])
    if args.write:
        (out/'manifest.json').write_text(dump(manifest))
    else:
        assert json.loads((out/'manifest.json').read_text())==manifest
    print(f'0.109.0 raid volleys: {sum(cases.values())} bounded native cases, 60 memberships/26 volleys; source tracing passed.')


if __name__=='__main__':
    main()

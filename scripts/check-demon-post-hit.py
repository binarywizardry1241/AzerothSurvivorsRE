#!/usr/bin/env python3
"""Hash-bound static/source checks and bounded original-instruction replay.

No compilation, game process, rendering, native imports or platform integration.
--collect stages compact evidence under runtime for review before promotion.
"""
from portable_paths import objdump_output, portable_json, portable_record
from native_recovery import f32 as _shared_f32, bits as _shared_bits, digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes, project_path

SHA = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
RETAINED = ROOT / "docs/analysis/evidence/0.112.0/demon-post-hit"
OWNERS = {"common-melee": 0x145956D00, "demon-spell-pending": 0x14595A460,
          "generic-effects": 0x145934C50, "main-effects-tick": 0x14592F2B0,
          "effect-rank-scale": 0x14599D900, "melee-packet": 0x1458C4BF0,
          "spell-packet": 0x1458CE7D0}
SPANS = {
    "consume-admission": (0x1459572B0, 0x145957328),
    "consume-target-and-select": (0x145957605, 0x145957766),
    "consume-mutation": (0x1459577D0, 0x145957841),
    "consume-hit-and-attribution": (0x145957851, 0x145957924),
    "consume-select": (0x1459EFC30, 0x1459EFE11),
    "seduction-admission": (0x145956FF0, 0x1459570E8),
    "seduction-producer": (0x145957CFE, 0x145957EB5),
    "coil-query": (0x1459574A4, 0x14595758F),
    "coil-power": (0x145957ACE, 0x145957B7E),
    "coil-soul-effect-sum": (0x145957B7E, 0x145957C8B),
    "coil-soul-dot-sum": (0x145957F2C, 0x145957FD0),
    "coil-capture": (0x145957FD0, 0x1459580CA),
    "coil-pending": (0x1459580EB, 0x145958183),
    "soul-rank-scale": (0x14599DD24, 0x14599DD51),
    "soul-player-gates": (0x1459352B9, 0x1459352E8),
    "soul-player-key": (0x14593566D, 0x1459356B4),
    "soul-player-effect-sum": (0x14593844F, 0x1459384AC),
    "soul-player-dot-sum": (0x1459385DF, 0x14593868C),
    "soul-player-recursion": (0x14593868C, 0x1459386F5),
    "voidwalker-heal": (0x1459570F0, 0x145957160),
    "voidwalker-shield": (0x1459573B9, 0x1459574A4),
    "voidwalker-cap-clamp": (0x145930334, 0x145930378),
    "random-picker": (0x1459EABC0, 0x1459EACD3),
    "proxy-instance": (0x145939FB0, 0x14593A1C5),
    "query-iterator": (0x1459EFE20, 0x1459F0019),
    "melee-packet-call": (0x145956E54, 0x145956E8C),
    "melee-opcode": (0x1458C4C36, 0x1458C4C5C),
    "spell-opcode": (0x1458CE826, 0x1458CE82C),
}
LITERALS = {
    "seduction-icd": (0x145DB14C8, 4),
    "control-durations": (0x145DAD260, 12),
    "coil-speed": (0x145E06064, 4),
    "consume-attack-label": (0x146C0B728, 13),
    "coil-attack-label": (0x146C0B768, 10),
}

def sha(value):
    return _shared_digest(value)
def f(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)
def putf(u, address, value): u.mem_write(address, struct.pack('<f', value))
def getf(u, address): return struct.unpack('<f', u.mem_read(address, 4))[0]
def dump(path, value): path.write_text(portable_json(value, indent=2) + '\n')

def source_check():
    base = ROOT / 'crates/azeroth-survivors-re/src'
    helper = (base/'run_effects/demon_effects.rs').read_text()
    for token in ['pub fn consume_magic_spell', 'map_or(1, |row| row.rank)',
                  '980 => 0, 172 => 1, 348 => 2, 689 => 3',
                  'row.power_per_tick * 0.1', 'row.interval *= 0.9',
                  'native_max(row.next_tick_at - now, 0.0) * 0.9']:
        assert token in helper, token
    soul = (base/'player_abilities/behavior/soul_reaping.rs').read_text()
    for token in ['row.tag() == 253 && row.bytes[63] == 35',
                  '.filter(|row| row.spell_id == 689)',
                  'row.ticks_remaining as f32 * row.power_per_tick']:
        assert token in soul, token
    assert 'iter_mut' not in soul and 'owner_kind' not in soul
    callbacks = (base/'gameplay/mechanics/callbacks.rs').read_text()
    for token in ['row.bytes[63] == 35', 'self.soul_reaping_event(',
                  'event.source_kind != 0', 'row.key == "death_coil"',
                  'captured_source_kind: Some(3)', 'spell_id: event.spell_id',
                  'source_words: [0, 0, original.source_words[2], original.source_words[3]]',
                  'consume_magic_ready_at:', 'succubus_seduction_ready_at:']:
        assert token in callbacks, token
    assert 'soul_devourer_crit_until' not in callbacks
    talents = json.loads((base.parent/'assets/warlock-effects-0.112.0.json').read_text())
    payload = next(row for row in talents['talents'] if row['key']=='dark_pact')['effects'][0]
    raw = bytes.fromhex(payload['raw_hex']);assert raw[0]==253 and raw[63]==35 and raw[4:8]==struct.pack('<f',.05)
    compositor = (base/'run_effects.rs').read_text()
    assert 'value.bytes[63] == 35' in compositor and '(f32::from(rank) - 1.0) * 0.5 + 1.0' in compositor
    link = next(row for row in talents['talents'] if row['key']=='soul_link')['effects'][0]
    raw = bytes.fromhex(link['raw_hex']);assert raw[0]==253 and raw[63]==31 and raw[4:8]==struct.pack('<f',.05)
    assert 'value.bytes[63] == 31' in compositor
    post = (base/'gameplay/mechanics/demon_post_hit.rs').read_text()
    for token in ['self.hit_with_execution', 'demon_effects::consume_magic_spell(rows, self.learned)',
                  'self.core.periodic_rows_mut(target)', 'damage: consumed * 1.5',
                  'primary: "Consume Magic"', 'now + 3.0', 'now + 5.0',
                  'dot.spell_id == 172', 'value: 1.0', ' { 0.5 } else { 1.0 }',
                  'behavior::targeting::random_index(candidates.len(), rng)',
                  'self.context.player, definition.range',
                  'damage::effective_power(&instance, &context.power)',
                  'power = (power + remainder) * 0.5', 'primary: "death_coil"',
                  'sqrt() / 24.0', 'school: 5', 'execution.pending.0.push']:
        assert ''.join(token.split()) in ''.join(post.split()), token
    assert 'self.demon_critical(' not in post
    targeting = (base/'player_abilities/behavior/targeting.rs').read_text()
    assert 'items.swap(bound - 1, random_index(bound, rng))' in targeting
    assert '(rng.next_u64() >> 32) * u64::from(bound)' in targeting
    wiring = (base/'gameplay/mechanics/demon_spells.rs').read_text()
    for token in ['self.demon_consume_magic(', 'self.demon_succubus_seduction(',
                  'self.demon_succubus_coil(']: assert token in wiring, token
    assert 'row.bytes[63] == 31' in wiring and '.fold(-0.0, |sum, row| sum + row.float(4))' in wiring
    proxy = (base/'run_effects/demon_spells.rs').read_text()
    assert 'duration_multiplier: instance.duration_multiplier' in proxy, 'current full learned proxy clone'

def replay():
    from native_talent_fixture import Machine
    from unicorn import x86_const as x
    m = Machine(); u = m.u
    def xmm(reg, value): u.reg_write(reg, bits(value))
    def xf(reg): return struct.unpack('<f',u.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def segment(start, end):
        u.reg_write(x.UC_X86_REG_RSP,m.S+0x100008)
        u.reg_write(x.UC_X86_REG_RBP,m.S+0x101000)
        u.emu_start(start,end,count=20000)
        assert u.reg_read(x.UC_X86_REG_RIP)==end, hex(u.reg_read(x.UC_X86_REG_RIP))
    def periodic(rows):
        at=m.alloc(len(rows)*48)
        for i,(spell,power,ticks,interval,next_at,owner) in enumerate(rows):
            p=at+i*48; u.mem_write(p,struct.pack('<B7xQIfffII',owner,123,spell,power,interval,next_at,ticks,ticks))
        return at
    out={'rank_scale':[], 'consume_selection':[], 'consume_mutation':[], 'drain_remainder':[], 'soul_coefficient':[], 'coil_critical_bonus':[], 'learned_proxy':[], 'shared_cooldown_gate':[], 'random_selection':[], 'voidwalker_clamp':[], 'voidwalker_heal':[], 'voidwalker_shield':[]}
    # Execute exact raw35 scaling instructions, with the original record as input.
    for factor in [0.,1.,2.,3.,4.]:
        at=m.alloc(128); putf(u,at+4,.05); u.reg_write(x.UC_X86_REG_RDX,at);u.reg_write(x.UC_X86_REG_RAX,at+64);xmm(x.UC_X86_REG_XMM2,factor)
        segment(0x14599dd24,0x14599dd51)
        expected=f(f(max(f(f(factor-1.)*.5)+1.,1.)) * f(.05))
        actual=getf(u,at+68);assert bits(actual)==bits(expected)
        out['rank_scale'].append([bits(factor),bits(actual)])
    spells=[980,172,348,689]
    for order in itertools.permutations(spells):
      for ranks in [[],[(spell,1)for spell in spells],[(980,2),(172,3),(348,4),(689,5)]]:
        learned=m.alloc(len(ranks)*88);table=m.alloc(24);holder=m.alloc(8)
        for i,(spell,rank) in enumerate(ranks):
            definition=m.alloc(120);u.mem_write(definition+64,struct.pack('<I',spell));m.put(learned+i*88,definition);u.mem_write(learned+i*88+8,struct.pack('<I',rank))
        m.put(table,len(ranks),learned,len(ranks));m.put(holder,table)
        rows=[(s,10.,3,1.,11.,0)for s in order];at=periodic(rows)
        actual=m.call(0x1459efc30,at,at+48*len(rows),order[0],holder)&0xffffffff
        rankmap=dict(ranks);expected=max(spells,key=lambda s:(rankmap.get(s,1),-spells.index(s)))
        assert actual==expected,(order,ranks,actual,expected)
        out['consume_selection'].append([list(order),[[spell,rank]for spell,rank in ranks],actual])
    # Later duplicate rows deliberately include nonpositive power and other owners.
    for selected in spells:
      for now in [0.,10.,100.25]:
       for next_at in [-1.,10.,120.5]:
        rows=[(selected,10.,3,2.,next_at,0),(selected,-2.,2,1.,next_at,2),
              (172 if selected!=172 else 348,7.,5,3.,next_at,0),(selected,99.,0,4.,next_at,1)]
        at=periodic(rows);u.reg_write(x.UC_X86_REG_RCX,at+48);u.reg_write(x.UC_X86_REG_RAX,at+len(rows)*48);u.reg_write(x.UC_X86_REG_R15,selected);xmm(x.UC_X86_REG_XMM7,now);xmm(x.UC_X86_REG_XMM9,0.);xmm(x.UC_X86_REG_XMM2,0.)
        segment(0x1459577d9,0x145957837)
        total=0.
        for i,(spell,power,ticks,interval,deadline,owner) in enumerate(rows):
            if spell==selected and ticks:
                total=f(total+f(f(f(power)*f(.1))*f(ticks)))
                power=f(f(power)*f(.9));interval=f(f(interval)*f(.9));deadline=f(now+f(max(f(deadline-now),0.)*f(.9)))
            expected=struct.pack('<B7xQIfffII',owner,123,spell,power,interval,deadline,ticks,ticks)
            assert bytes(u.mem_read(at+i*48,40))==expected
        assert bits(xf(x.UC_X86_REG_XMM2))==bits(total)
        out['consume_mutation'].append([selected,bits(now),bits(next_at),bits(total)])
    for length in range(1,10):
      for mode in range(4):
        rows=[(689 if (i+mode)%3 else 172,(-1. if mode==3 else 1.)*(i+.25),[0,1,3,0xffffffff][(i+mode)%4],2.,17.,i%3)for i in range(length)]
        at=periodic(rows);before=bytes(u.mem_read(at,length*48));expected=-0.
        for spell,power,ticks,*_ in rows:
            if spell==689:expected=f(expected+f(f(ticks)*f(power)))
        for kind in ['player','succubus']:
            u.reg_write(x.UC_X86_REG_RAX,at);u.reg_write(x.UC_X86_REG_RCX,length);u.reg_write(x.UC_X86_REG_RDX,0)
            xmm(x.UC_X86_REG_XMM13,-0.);xmm(x.UC_X86_REG_XMM0,-0.);xmm(x.UC_X86_REG_XMM1,-0.)
            if kind=='player': segment(0x1459385df if length>1 else 0x14593865c,0x14593868c);actual=xf(x.UC_X86_REG_XMM0)
            else:segment(0x145957f2c if length>1 else 0x145957f9f,0x145957fc8);actual=xf(x.UC_X86_REG_XMM1)
            assert bits(actual)==bits(expected),(kind,rows,actual,expected)
            assert bytes(u.mem_read(at,length*48))==before
        out['drain_remainder'].append([length,mode,bits(expected)])
    for length in range(1,10):
      for mode in range(4):
        at=m.alloc(length*64);expected=-0.
        for i in range(length):
            tag=35 if (i+mode)%3 else 31;value=f((i-.25)*.05);u.mem_write(at+i*64,bytes([tag]));putf(u,at+i*64+4,value)
            if tag==35:expected=f(expected+value)
        before=bytes(u.mem_read(at,length*64));u.reg_write(x.UC_X86_REG_RAX,at);u.reg_write(x.UC_X86_REG_RCX,length);u.reg_write(x.UC_X86_REG_RDX,0);xmm(x.UC_X86_REG_XMM2,-0.)
        segment(0x14593844f if length>1 else 0x14593849c,0x1459384ac);assert bits(xf(x.UC_X86_REG_XMM2))==bits(expected)
        game=m.alloc(0x900);m.put(game+0x828,at,length);u.reg_write(x.UC_X86_REG_RBX,game);xmm(x.UC_X86_REG_XMM13,-0.);segment(0x145957b7e,0x145957c1f);assert bits(xf(x.UC_X86_REG_XMM0))==bits(expected)
        assert bytes(u.mem_read(at,length*64))==before
        out['soul_coefficient'].append([length,mode,bits(expected)])
    for base,chance,draw_value,bonus in itertools.product([10.,500.5],[-.1,.5,2.],[0.,.5,.75],[-2.25,0.,5.]):
        frame=m.S+0x101000;putf(u,frame+0xcc,draw_value);putf(u,frame+0x34,chance);putf(u,frame-0x40,f(base*1.5));xmm(x.UC_X86_REG_XMM12,base);xmm(x.UC_X86_REG_XMM14,bonus)
        segment(0x14595803d,0x145958074);segment(0x1459580c1,0x1459580ca)
        critical=f(chance)>f(draw_value);expected=f(f(f(base*1.5)if critical else base)+f(bonus));expected=f(expected*.5)
        assert bits(xf(x.UC_X86_REG_XMM15))==bits(expected)and u.mem_read(frame+0xcc,1)[0]==critical
        out['coil_critical_bonus'].append([bits(base),bits(chance),bits(draw_value),bits(bonus),bits(expected),critical])
    for match_index in range(4):
      for variant in range(4):
        key=m.alloc(10);u.mem_write(key,b'death_coil');definition=m.alloc(120);m.put(definition,key,10)
        learned=m.alloc(4*88)
        for i in range(4):
            if i==match_index:row_definition=definition
            else:
                other=m.alloc(10);u.mem_write(other,b'other_coil');row_definition=m.alloc(120);m.put(row_definition,other,10)
            payload=struct.pack('<Q20I',row_definition,*[0x3f800000+variant*97+i*13+j for j in range(20)]);u.mem_write(learned+i*88,payload)
        game=m.alloc(0x400);m.put(game+0x330,learned,4);result=m.alloc(88);m.call(0x145939fb0,result,game,definition)
        # The88-byte stride has84 meaningful bytes; tail padding is not copied.
        expected=bytes(u.mem_read(learned+match_index*88,84));actual=bytes(u.mem_read(result,84));assert actual==expected
        out['learned_proxy'].append([match_index,variant,sha(actual)])
    for now,deadline in itertools.product([10.,float('nan'),float('inf')],[9.,10.,11.,float('nan'),float('inf')]):
        at=m.alloc(4);putf(u,at,deadline);xmm(x.UC_X86_REG_XMM7,now)
        for reg,start,end in [(x.UC_X86_REG_R9,0x145957300,0x145957309),(x.UC_X86_REG_R8,0x1459570c0,0x1459570c9)]:
            u.reg_write(reg,at+16);segment(start,end);flags=u.reg_read(x.UC_X86_REG_EFLAGS);retained=not bool(flags&((1<<0)|(1<<6)))
            assert retained==(deadline>now)
        out['shared_cooldown_gate'].append([bits(now),bits(deadline),retained])
    mask=(1<<64)-1
    def rotate(v,n):return ((v<<n)|(v>>(64-n)))&mask
    def draw(state):
        a,b,c,d=state;result=(rotate((a+d)&mask,23)+a)&mask;shifted=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=shifted;d=rotate(d,45);return result,[a,b,c,d]
    for bound in [1,2,3,7,16,31,0xffffffff,0x100000001]:
      for state in [[1,2,3,4],[0x12345678,0xabcdef0123456789,0xdeadbeef,0x9876543210],[(1<<64)-1,43,54,65]]:
        original=state.copy();width=32 if bound<=0xffffffff else 64;zone=((bound<<(width-bound.bit_length()))-1)&((1<<width)-1);draws=0
        while True:
            value,state=draw(state);draws+=1;product=(value>>32)*bound if width==32 else value*bound
            if product&((1<<width)-1)<=zone:expected=product>>width;break
        vec=m.alloc(8);rng=m.alloc(32);m.put(rng,*original);actual=(m.call(0x1459eabc0,vec,bound,rng)-vec)//8
        assert actual==expected and list(struct.unpack('<4Q',u.mem_read(rng,32)))==state
        out['random_selection'].append([bound,original,expected,draws,state])
    for health,pool,absorb in itertools.product([80.,100.,400.],[0.,25.,60.],[0.,50.,100.]):
        game=m.alloc(0x500);putf(u,game+0x480,health);putf(u,game+0x1a8,pool);putf(u,game+0x4ec,absorb);u.reg_write(x.UC_X86_REG_RSI,game);segment(0x145930334,0x145930378)
        cap=f(health*.25);ep=cap if pool>cap else pool;ea=f(max(f(absorb-f(pool-cap)),0.))if pool>cap else absorb
        assert bits(getf(u,game+0x1a8))==bits(ep)and bits(getf(u,game+0x4ec))==bits(ea)
        out['voidwalker_clamp'].append([bits(health),bits(pool),bits(absorb),bits(ep),bits(ea)])
    for maximum,health in itertools.product([100.,200.],[0.,10.,99.,200.]):
        game=m.alloc(0x500);putf(u,game+0x4e8,health);u.reg_write(x.UC_X86_REG_RBX,game);xmm(x.UC_X86_REG_XMM8,maximum);xmm(x.UC_X86_REG_XMM12,2.5)
        segment(0x14595711f,0x14595715a);expected=f(min(f(health+2.5),maximum));actual=getf(u,game+0x4e8)
        assert bits(actual)==bits(expected)and bits(xf(x.UC_X86_REG_XMM1))==bits(f(expected-health))
        out['voidwalker_heal'].append([bits(maximum),bits(health),bits(actual)])
    for hit,fraction,pool in itertools.product([10.,80.,1000.],[.05,.10,.15],[0.,24.,100.]):
        game=m.alloc(0x500);putf(u,game+0x480,100.);putf(u,game+0x1a8,pool);putf(u,game+0x4ec,50.);u.reg_write(x.UC_X86_REG_RBX,game);xmm(x.UC_X86_REG_XMM0,fraction);xmm(x.UC_X86_REG_XMM7,hit);xmm(x.UC_X86_REG_XMM9,0.);xmm(x.UC_X86_REG_XMM13,.25)
        segment(0x145957453,0x145957479);expected=min(f(hit*f(fraction)),max(f(25.-pool),0.));gain=xf(x.UC_X86_REG_XMM7)
        assert bits(gain)==bits(expected)
        if gain>0.:segment(0x145957483,0x14595749f)
        assert bits(getf(u,game+0x1a8))==bits(f(pool+gain))and bits(getf(u,game+0x4ec))==bits(f(50.+gain))
        out['voidwalker_shield'].append([bits(hit),bits(fraction),bits(pool),bits(gain)])
    return out

def population_caps(args):
    """Current Soul Link and Gate proof; historical post-hit suite stays intact."""
    import subprocess
    target = latest_target(verify=True)
    assert target['sha256'] == '3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb'
    data = target_bytes(target)
    pe = load_script('population_pe', ROOT/'scripts/inventory-executable.py').PE(data)
    output = project_path(args.work) if args.collect else ROOT/'docs/analysis/evidence/0.127.0/warlock-population'
    spans = {
        'soul-link-grant': (0x145c88de0, 0x145c88ec7),
        'soul-link-clamp': (0x145c70e16, 0x145c70e5a),
        'gate-draw-create': (0x145c7067f, 0x145c709ed),
        'gate-fallback-filter': (0x145cf2080, 0x145cf22d2),
    }
    def raw(a, b):
        offset = pe.rva_offset(a-pe.image_base)
        return data[offset:offset+b-a]
    manifest = dict(target={k:target[k] for k in ['version','path','sha256','size_bytes']}, ranges=[])
    for role, (a, b) in spans.items():
        manifest['ranges'].append(dict(role=role,start=hex(a),end_exclusive=hex(b),
            file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=b-a,sha256=sha(raw(a,b))))
    constant = raw(0x146258c70, 0x146258c74)
    assert constant == struct.pack('<f', .1)
    manifest['capacity_literal'] = dict(address='0x146258c70',bytes_hex=constant.hex(),sha256=sha(constant))
    # Resolve actual selected key/name/effect producers instead of treating a
    # historical variant number as the current enum discriminant.
    manifest['talent_inputs']=[]
    source_talents=json.loads((ROOT/'crates/azeroth-survivors-re/assets/warlock-effects-0.112.0.json').read_text())['talents']
    for key,name,native_tag,semantic_marker in [('soul_link','Soul Link',32,31),('legion_gate','Legion Gate',33,32)]:
        found=[];start=0;needle=key.encode()
        while (start:=data.find(needle,start))!=-1:
            pointer=pe.offset_va(start);start+=len(needle)
            if pointer is None:continue
            pair=struct.pack('<QQ',pointer,len(needle));at=0
            while (at:=data.find(pair,at))!=-1:
                address=pe.offset_va(at)-48;at+=1
                try:
                    name_ptr,name_len=struct.unpack('<QQ',raw(address+64,address+80))
                    effect_ptr,count=struct.unpack('<QQ',raw(address+96,address+112))
                    if name_len!=len(name)or raw(name_ptr,name_ptr+name_len)!=name.encode()or not 1<=count<=8:continue
                    payload=raw(effect_ptr,effect_ptr+64)
                    if payload[0]!=native_tag:continue
                    source=bytes.fromhex(next(row for row in source_talents if row['key']==key)['effects'][0]['raw_hex'])
                    assert source[0]==253 and source[63]==semantic_marker
                    assert payload[4:20]==source[4:20],key
                    record=raw(address,address+160)
                    text_ptr,text_len=struct.unpack('<QQ',raw(address+112,address+128))
                    description=raw(text_ptr,text_ptr+text_len).decode()
                    found.append(dict(key=key,definition_address=hex(address),definition_sha256=sha(record),
                        effect_address=hex(effect_ptr),native_raw_hex=payload.hex(),effect_sha256=sha(payload),
                        source_semantic_marker=semantic_marker,source_payload_sha256=sha(source),
                        description_address=hex(text_ptr),description=description,description_sha256=sha(description.encode())))
                except (ValueError,struct.error):continue
        assert len(found)==1,(key,found)
        manifest['talent_inputs'].append(found[0])
    template=next(row['description']for row in manifest['talent_inputs']if row['key']=='soul_link')
    review=load_script('population_locales',ROOT/'scripts/review-current-locale-catalogs.py').derive()
    assert review['target']==manifest['target']
    manifest['localized_capacity']=[]
    for locale in review['locales']:
        payload=locale['payload'];offset=int(payload['file_offset'],16)
        encoded=data[offset:offset+payload['byte_count']]
        assert sha(encoded)==payload['sha256']
        value=json.loads(encoded)[template]
        source_path=ROOT/f"crates/azeroth-survivors-re/assets/locales/{locale['code']}.json"
        assert json.loads(source_path.read_text())[template]==value
        manifest['localized_capacity'].append(dict(code=locale['code'],payload=payload,key=template,value=value))
    if args.collect:
        output.mkdir(parents=True,exist_ok=True)
        manifest['queries'] = []
        for key in ['145c6fa80','145c88720','145cf2080']:
            folder=ROOT/'runtime/analysis/history/combat/warlock-current/867d2347c452'/key
            journal=json.loads((folder/'rea/journal.json').read_text())
            operation=next(v for v in journal['operations'].values() if v['name']=='procedure_pseudo_code')
            assert operation['status']=='completed'
            result_path=project_path(operation['result']['path'])
            result=json.loads(result_path.read_text())
            native=result.get('structuredContent') or json.loads(result['content'][0]['text'])
            def receipt(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=sha(path.read_bytes()))
            query=dict(procedure=hex(int(key,16)),slice_virtual_address=hex(int(key,16)),
                raw_input=receipt(folder/'body.bin'),plan=receipt(folder/'plan.json'),
                journal=receipt(folder/'rea/journal.json'),result=receipt(result_path),
                evidence_id=native['evidence_id'],provider=native['provider'],
                analysis_profile_digest=native['analysis_profile']['digest'])
            from discovery_native_subject import verify_native_query_subject
            verify_native_query_subject(ROOT,native,query,manifest['target'],image=data,pe=pe)
            manifest['queries'].append(query)
        # One canonical assembly file contains only the four selected ranges.
        from coverage_common import artifact_path
        text=''
        for role,(a,b) in spans.items():
            asm=objdump_output(['objdump','-d','--no-show-raw-insn',
                f'--start-address={a:#x}',f'--stop-address={b:#x}',str(artifact_path(target['path']))],text=True)
            lines=asm.splitlines()
            text+=f'// {role}\n'+'\n'.join(line for line in lines if line.startswith('145'))+'\n'
        (output/'selected-native.asm').write_text(text)
        manifest['assembly_sha256']=sha(text.encode())
    else:
        retained=json.loads((output/'manifest.json').read_text())
        for key in ['target','ranges','capacity_literal','talent_inputs','localized_capacity']:assert retained[key]==manifest[key],key
        assert sha((output/'selected-native.asm').read_bytes())==retained['assembly_sha256']
        from discovery_native_subject import verify_native_query_subject
        for query in retained['queries']:
            result=json.loads(project_path(query['result']['path']).read_text())
            native=result.get('structuredContent') or json.loads(result['content'][0]['text'])
            verify_native_query_subject(ROOT,native,query,manifest['target'],image=data,pe=pe)
    base=ROOT/'crates/azeroth-survivors-re/src'
    helper=(base/'run_effects/demon_effects.rs').read_text()
    assert helper.count('vitals.maximum_health * 0.1')==2
    assert 'vitals.maximum_health * 0.25' not in helper
    text=next(row['description']for row in manifest['talent_inputs']if row['key']=='soul_link')
    assert json.dumps(text,ensure_ascii=False)[1:-1]in(base/'save/talents.rs').read_text()
    lifecycle=(base/'gameplay/mechanics/demon_lifecycle.rs').read_text()
    for token in ['fn gate_entry(', 'VOIDWALKER => 4, FELHUNTER => 6, _ => 12',
        'pool.retain(|entry| self.gate_kind_available(*entry))', 'self.requests.iter().filter(|r| r.lifetime.is_some()']:
        assert token in lifecycle,token
    live=(base/'gameplay/mechanics/demons.rs').read_text()
    assert 'let Some(entry) = state.gate_entry(rng)' in live and 'gate_entries(count' not in live
    assert live.index('state.rows.retain') < live.index('state.gate_entry(rng)')
    parser=ROOT/'.tools/rust/1.98.1-aarch64-apple-darwin/bin/rustfmt'
    if not parser.is_file():
        import platform
        hosts={('Darwin','arm64'):'aarch64-apple-darwin',('Linux','x86_64'):'x86_64-unknown-linux-gnu',
               ('Linux','aarch64'):'aarch64-unknown-linux-gnu'}
        parser=ROOT/'.tools/rust'/('1.98.1-'+hosts[(platform.system(),platform.machine())])/'bin/rustfmt'
    for path in ['run_effects/demon_effects.rs','gameplay/mechanics/demon_lifecycle.rs','gameplay/mechanics/demons.rs','save/talents.rs']:
        parsed=subprocess.run([str(parser),'--edition','2024','--emit','stdout','--config','skip_children=true'],
            input=(base/path).read_text(),text=True,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE)
        assert parsed.returncode==0,parsed.stderr
    if args.verify:
        sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
        from native_terminal import NativeReplay
        m=NativeReplay(data,pe);u=m.machine;x=m.registers
        cases=dict(shield=[],shield_cap=[],gate=[])
        for maximum,pool,hit,fraction in itertools.product([0.,100.,1000.],[0.,5.,10.,25.,100.],
                [1.,80.,1000.],[-.1,0.,.05,.15]):
            m.reset('grant',[(0x145c88e69,0x145c88ec2)],[0x145c88840,0x145c88ec2])
            game=m.app;m.put(game+0x4c8,'<f',maximum);m.put(game+0x1a8,'<f',pool);m.put(game+0x53c,'<f',50.)
            u.reg_write(x.UC_X86_REG_RBX,game);m.scalar(x.UC_X86_REG_XMM0,fraction)
            m.scalar(x.UC_X86_REG_XMM7,hit);m.scalar(x.UC_X86_REG_XMM9,0.)
            m.run(0x145c88e69)
            gain=min(f(hit*f(fraction)),max(f(f(maximum*f(.1))-pool),0.)) if fraction > 0. else 0.
            gain=max(gain,0.)
            actual=m.get(game+0x1a8,'<f')[0];absorb=m.get(game+0x53c,'<f')[0]
            assert bits(actual)==bits(f(pool+gain))and bits(absorb)==bits(f(50.+gain))
            cases['shield'].append(dict(maximum_bits=bits(maximum),pool_bits=bits(pool),damage_bits=bits(hit),
                fraction_bits=bits(fraction),absorb_bits=bits(50.),expected_pool_bits=bits(actual),expected_absorb_bits=bits(absorb)))
        for maximum,pool,absorb in itertools.product([0.,50.,100.,1000.],[0.,5.,10.,25.,100.],[0.,5.,120.]):
            m.reset('clamp',[(0x145c70e16,0x145c70e5a)],[0x145c70e5a]);game=m.app
            m.put(game+0x4c8,'<f',maximum);m.put(game+0x1a8,'<f',pool);m.put(game+0x53c,'<f',absorb)
            u.reg_write(x.UC_X86_REG_RSI,game);m.run(0x145c70e16)
            cap=f(maximum*f(.1));expected=cap if pool>cap else pool
            remaining=max(f(absorb-f(pool-cap)),0.)if pool>cap else absorb
            actual=m.get(game+0x1a8,'<f')[0];total=m.get(game+0x53c,'<f')[0]
            assert bits(actual)==bits(expected)and bits(total)==bits(remaining)
            cases['shield_cap'].append(dict(maximum_bits=bits(maximum),pool_bits=bits(pool),absorb_bits=bits(absorb),
                expected_pool_bits=bits(actual),expected_absorb_bits=bits(total)))
        # Native Gate selection, cap filter and reroll execute unchanged. Only
        # the existing talent pool, allocation and synchronous creation APIs
        # are seams; each creation mutates the same population before the next
        # draw, and can consume an additional RNG draw.
        mask=(1<<64)-1
        def next_word(words):
            a,b,c,d=words;result=((((a+d)&mask)<<23)|(((a+d)&mask)>>41))&mask
            result=(result+a)&mask;t=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=t;d=((d<<45)|(d>>19))&mask
            words[:]=[a&mask,b&mask,c&mask,d&mask]
            return result
        seeds=[[1,2,3,4],[0x123456789abcdef0,0x23456789abcdef01,0x3456789abcdef012,0x456789abcdef0123],
               [0xf000000000000001,0x8000000000000002,0x7777777777777777,0x123456789abcdef0]]
        for seed,talents,state,nested in itertools.product(seeds,range(4),
                [(0,0,0,0),(3,5,0,0),(4,6,0,0),(5,7,0,0),(3,6,0,0),(4,5,0,0),(4,6,2,0),(0,0,0,12)],[False,True]):
            m.reset('gate',[(0x145c7067f,0x145c709ed),(0x145cf2080,0x145cf22c1)],[0x145c709ed])
            game=m.app;rows=m.mem+0x6000;descs=m.mem+0x16000;pool_at=m.mem+0x18000
            descriptors={entry:descs+i*0x60 for i,entry in enumerate([9512,9520,9518,9519,9521])}
            for entry,pointer in descriptors.items():
                m.put(pointer+0x20,'<I',entry);m.put(pointer+0x39,'<B',{9512:1,9520:4,9518:2,9519:3,9521:6}[entry])
            pool=[9512,9520]+([9518]if talents&1 else[])+([9519]if talents&2 else[])
            voids,felhunters,permanent,imps=state
            before=[(9519,True)]*voids+[(9518,True)]*felhunters+[(9512,True)]*imps
            before += [(9519,False),(9518,False)] if permanent else []
            for i,(entry,temporary)in enumerate(before):
                m.put(rows+i*128,'<Q',int(temporary));m.put(rows+i*128+0x18,'<Q',descriptors[entry])
            m.put(game+0xd0,'<QQ',rows,len(before));m.put(game+0xc20,'<4Q',*seed)
            m.put(m.bp+0x2c,'<I',4)
            u.reg_write(x.UC_X86_REG_RSI,game);u.reg_write(x.UC_X86_REG_RDI,0);m.scalar(x.UC_X86_REG_XMM7,16.)
            context=dict(heap=m.mem+0x1a000,summons=[],rng_before=[],allocations=0)
            def seam(address):
                if address==0x145b525d0:
                    for i,entry in enumerate(pool):m.put(pool_at+i*8,'<Q',descriptors[entry])
                    m.put(u.reg_read(x.UC_X86_REG_RCX),'<QQQ',0,pool_at,len(pool))
                elif address==0x145c8b5b0:
                    entry=m.get(u.reg_read(x.UC_X86_REG_RDX)+0x20,'<I')[0]
                    words=list(m.get(game+0xc20,'<4Q'));context['rng_before'].append(words[:])
                    context['summons'].append(entry)
                    count=m.get(game+0xd8,'<Q')[0];m.put(rows+count*128,'<Q',1)
                    m.put(rows+count*128+0x18,'<Q',descriptors[entry]);m.put(game+0xd8,'<Q',count+1)
                    if nested:next_word(words);m.put(game+0xc20,'<4Q',*words)
                elif address in [0x140002200,0x1400021d0]:pass
                elif address==0x1400021c0:
                    at=context['heap'];context['heap']+=(u.reg_read(x.UC_X86_REG_RCX)+15)&~15
                    context['allocations']+=1;u.reg_write(x.UC_X86_REG_RAX,at)
                else:return False
                m.return_seam();return True
            m.seam=seam;m.run(0x145c7067f);m.seam=None
            final=before+[(entry,True)for entry in context['summons']]
            for entry,cap in [(9519,4),(9518,6)]:
                initial=sum(e==entry and temporary for e,temporary in before)
                assert sum(e==entry and temporary for e,temporary in final)<=max(cap,initial)
            assert sum(temporary for _,temporary in final)<=max(12,sum(temporary for _,temporary in before))
            cases['gate'].append(dict(seeds=seed,talents=talents,present=list(state),creation_rng=nested,
                entries=context['summons'],rng_before=context['rng_before'],rng_after=list(m.get(game+0xc20,'<4Q'))))
        cases['instruction_steps']=m.instructions
        if args.collect:dump(output/'native-cases.json',cases)
        else:assert portable_record(cases)==portable_record(json.loads((output/'native-cases.json').read_text()))
    if args.collect:dump(output/'manifest.json',manifest)
    print('Current population-cap bytes, query receipts and live source verified'+('; original-instruction cases passed'if args.verify else ''))

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--collect',action='store_true');parser.add_argument('--verify',action='store_true');parser.add_argument('--work',default='runtime/analysis/history/combat/soul-reaping/40796f10ac6f/curated');parser.add_argument('--contract',choices=['post-hit','population-caps'],default='post-hit');args=parser.parse_args()
    if args.contract=='population-caps':return population_caps(args)
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target);pe_module = load_script('post_pe', ROOT/'scripts/inventory-executable.py');pe=pe_module.PE(data)
    def raw(a,b):o=pe.rva_offset(a-pe.image_base);return data[o:o+b-a]
    def record(a,b):return dict(address=hex(a),end_exclusive=hex(b),byte_count=b-a,file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=sha(raw(a,b)))
    manifest=dict(schema_version=1,target={k:target[k]for k in ['version','path','size_bytes','sha256']},ranges=[dict(role=k,**record(a,b))for k,(a,b)in SPANS.items()],literals=[dict(role=k,**record(a,a+n),bytes_hex=raw(a,a+n).hex())for k,(a,n)in LITERALS.items()])
    bounds={a+pe.image_base:b+pe.image_base for a,b,*_ in pe.functions()}
    manifest['owners']=[dict(role=k,**record(a,bounds[a]))for k,a in OWNERS.items()]
    manifest['generator']={'path':'scripts/check-demon-post-hit.py','sha256':sha(Path(__file__).read_bytes())}
    if args.collect:
        sys.path.insert(0,str(ROOT/'runtime/tool-state/python/camera/python-libs'));import capstone
        output=project_path(args.work);output.mkdir(parents=True,exist_ok=True);decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
        for row in manifest['ranges']:
            a,b=int(row['address'],16),int(row['end_exclusive'],16);value=raw(a,b);instructions=list(decoder.disasm(value,a));assert b''.join(bytes(i.bytes)for i in instructions)==value,row['role']
            text=''.join(f'{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions);name=row['role']+'.asm';(output/name).write_text(text);row.update(assembly=name,assembly_sha256=sha(text.encode()))
        manifest['ghidra']=[]
        for key in ['1459efc30','145939fb0','1459eabc0','query-iterator']:
            root=ROOT/'runtime/analysis/history/combat/soul-reaping/40796f10ac6f';d=json.loads((root/(key+'-rea')/'003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent'];manifest['ghidra'].append(dict(role=key,evidence_id=d['evidence_id'],import_sha256=d['subject']['digest']['sha256'],decompiler_sha256=sha(d['normalized_result'].encode()),limitations='Raw Ghidra import; ABI/globals/callers are bounded.'))
        dump(output/'manifest.json',manifest)
        if args.verify:dump(output/'native-cases.json',replay())
        print('Staged native post-hit evidence:',output.relative_to(ROOT))
    else:
        source_check();retained=json.loads((RETAINED/'manifest.json').read_text())
        for key in ['target','literals','generator','owners']:assert retained[key]==manifest[key],key
        for actual,expected in zip(manifest['ranges'],retained['ranges'],strict=True):
            assert all(expected[k]==v for k,v in actual.items());assert sha((RETAINED/expected['assembly']).read_bytes())==expected['assembly_sha256']
        if args.verify:assert portable_record(replay())==portable_record(json.loads((RETAINED/'native-cases.json').read_text()))
        print('Current post-hit bytes and live source verified'+('; selected original-instruction cases passed'if args.verify else ''))
if __name__=='__main__':main()

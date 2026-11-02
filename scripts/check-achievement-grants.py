#!/usr/bin/env python3
"""Replay current feat grant, lethal attribution and incoming history instructions.

No Rust/compiler, application, game, OS clock or save file executes. --stage
writes candidate evidence inside runtime for review; default replays retained proof.
"""
from script_sources import load_script
import argparse
import hashlib
import itertools
import json
import runpy
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
RANGES = {
    'feat-grant': (0x1459b5e40, 0x1459b63a6),
    'utc-duration': (0x145bb81a0, 0x145bb81f0),
    'save-grant': (0x1458d1f00, 0x1458d2112),
    'earned-insert': (0x1458d9e60, 0x1458da02e),
    'lethal-attribution': (0x14593f4a6, 0x14593f677),
    'incoming-boss-history': (0x1458ec805, 0x1458ec940),
    'snapshot-gates': (0x1458c02dd, 0x1458c0334),
    'ordinary-eval': (0x1459b47d0, 0x1459b5cc5),
    'account-grant': (0x1459b6410, 0x1459b69bc),
    'legendary-selector': (0x1459f4ef0, 0x1459f5271),
    'legendary-filter': (0x1459ebde0, 0x1459ebecf),
}
METADATA_RANGES = {
    'primary-present-capacity': (0x14593b6dd, 0x14593b6e1),
    'guardian-primary-absent': (0x145907057, 0x145907062),
    'ward-primary-absent': (0x1459162d4, 0x1459162dc),
    'ward-guardian-absent': (0x145916386, 0x14591638e),
}


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    if args.prepare_rea:
        prepare_rea(); return
    # Reuse the canonical original constructor, rather than a second extract or
    # manually invented native enum fixture. This also verifies all menu data.
    previous = sys.argv
    sys.argv = ['scripts/check-rewards-catalogs.py']
    try:
        native = runpy.run_path(str(ROOT / sys.argv[0]))
    finally:
        sys.argv = previous
    u, raw, rows = native['u'], native['raw'], native['rows']
    assert native['target']['sha256'] == SHA
    from unicorn import UC_HOOK_CODE
    from unicorn import x86_const as r
    sys.path.insert(0, str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    u.hook_del(native['hook_id'])
    scratch = 0x500000000
    u.mem_map(scratch, 0x100000)
    output, account, snapshot, pairs, blows, damaged, selected, actor, game, bp = [scratch+n for n in
        [0, 0x1000, 0x2000, 0x3000, 0x4000, 0x5000, 0x6000, 0x7000, 0x8000, 0x10000]]
    stop = native['STOP']
    stack = native['STACK'] + 0x1f0008
    visited, seams, pending, clocks = {}, set(), [], []
    epoch = 0x019db1ded53e8000
    timestamp = 1700000000
    filetime = epoch + timestamp * 10000000
    ends = set()

    def put(a, fmt, *v):
        u.mem_write(a, struct.pack('<'+fmt, *v))

    def get(a, fmt):
        return struct.unpack('<'+fmt, u.mem_read(a, struct.calcsize('<'+fmt)))

    def reg(name, value):
        u.reg_write(getattr(r, 'UC_X86_REG_'+name), value)

    def ret():
        sp = u.reg_read(r.UC_X86_REG_RSP)
        reg('RIP', get(sp, 'Q')[0]); reg('RSP', sp+8)

    def allocate(n):
        return native['alloc'](n)

    def hook(_, a, n, unused):
        if a == stop or a in ends:
            u.emu_stop(); return
        if any(lo <= a < a+n <= hi for lo, hi in [*RANGES.values(),*METADATA_RANGES.values(),(0x1459d3570,0x1459d3a3b)]):
            assert bytes(u.mem_read(a, n)) == raw(a, n), hex(a)
            visited[a] = raw(a, n)
            if a == 0x1458d1f00:
                key = native['text'](u.reg_read(r.UC_X86_REG_RDX), u.reg_read(r.UC_X86_REG_R8))
                pending.append(key)
            return
        seams.add(a)
        rcx, rdx, r8 = [u.reg_read(v) for v in [r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8]]
        if a == 0x145bb81f0:
            clocks.append(filetime); reg('RAX', filetime & 0xffffffff); reg('RDX', filetime >> 32)
        elif a in [0x140002200, 0x1400021d0]:
            pass
        elif a == 0x1400021c0:
            reg('RAX', allocate(rcx))
        elif a in [0x145c0a3db, 0x145c0a3ed]:
            u.mem_write(rcx, bytes(u.mem_read(rdx, r8))); reg('RAX', rcx)
        elif a == 0x1459963c0:
            # The original filter consumes only current iterator ID rarity.
            # Full item name/effect construction is a separate owner.
            assert rdx in {v for values in native['gear_ids'].values() for v in values}
            u.mem_write(rcx, bytes(96)); put(rcx+48, 'Q', rdx//10%10)
        elif a == 0x145c0d470:
            stride = get(u.reg_read(r.UC_X86_REG_RSP)+0x28, 'Q')[0]
            cap, ptr, length = get(rcx, '3Q'); newcap = max(256, cap*2, length+1)
            new = allocate(newcap*stride)
            if length:
                u.mem_write(new, bytes(u.mem_read(ptr, length*stride)))
            put(rcx, '2Q', newcap, new)
        elif a == 0x145c0a3e7:
            left, right = bytes(u.mem_read(rcx, r8)), bytes(u.mem_read(rdx, r8))
            reg('RAX', (left > right) - (left < right) & 0xffffffff)
        elif a in [0x145c0d930, 0x145c0d9a0, 0x145c0dbd0, 0x145c0dcb0]:
            stride = {0x145c0d930: 8, 0x145c0d9a0: 24, 0x145c0dbd0: 32, 0x145c0dcb0: 16}[a]
            cap, ptr, length = get(rcx, '3Q')
            newcap = max(32, cap*2, length+1); new = allocate(newcap*stride)
            if length:
                u.mem_write(new, bytes(u.mem_read(ptr, length*stride)))
            put(rcx, '2Q', newcap, new)
        else:
            raise AssertionError(('unreviewed external instruction', hex(a)))
        ret()

    u.hook_add(UC_HOOK_CODE, hook)

    def reset():
        u.mem_write(scratch, bytes(0x100000))
        for name in ['RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15']:
            reg(name, 0)
        for i in range(16):
            reg('XMM'+str(i), 0)
        reg('RSP', stack); put(stack, 'Q', stop)
        pending.clear(); clocks.clear(); ends.clear()

    def run(a, end=stop):
        u.emu_start(a, end, count=300000)
        assert u.reg_read(r.UC_X86_REG_RIP) == end, hex(u.reg_read(r.UC_X86_REG_RIP))

    def set_catalog(indices):
        for i, index in enumerate(indices):
            u.mem_write(selected+i*112, bytes(u.mem_read(native['catalog_base']+index*112, 112)))
        put(0x14809d0d8, 'Q', 13)
        put(0x14809a690+13*32, '3QI', len(indices), selected, len(indices), 0)

    def write_inputs(kills=(), damage=(), old_pairs=(), run_input=None):
        for i, hit in enumerate(kills):
            put(blows+i*12, 'IIBBBx', hit['boss_id'], hit['spell_id'], hit['school'], hit['source_kind'], hit['melee'])
        for i, boss in enumerate(damage):
            put(damaged+i*4, 'I', boss)
        for i, pair in enumerate(old_pairs):
            put(pairs+i*8, 'II', *pair)
        put(snapshot, '9Q', len(old_pairs), pairs, len(old_pairs), len(kills), blows, len(kills), len(damage), damaged, len(damage))
        state = dict(elapsed=0., normalized_kills=0, guardians=0, caches=0, won=False, bare=False, full_reward=False)
        state.update(run_input or {})
        put(snapshot+0x48, 'fIIIBBB', *[state[k] for k in ['elapsed','normalized_kills','guardians','caches','won','bare','full_reward']])

    def grant():
        reg('RSP', stack); put(stack, 'Q', stop)
        reg('RCX', output); reg('RDX', account); reg('R8', snapshot)
        run(0x1459b5e40)
        return [
            native['pair'](get(get(output+8,'Q')[0]+8*i,'Q')[0]+8) for i in range(get(output+16,'Q')[0])]

    definitions = json.loads((ROOT/'crates/azeroth-survivors-re/assets/progression.json').read_text())['achievements']
    by = {d['key']:d for d in definitions}
    assert [d['key'] for d in definitions] == [d['key'] for d in rows]
    newrows = [(i, row) for i,row in enumerate(rows) if row['kind']==9 and bytes.fromhex(row['payload'])[3]<8]
    assert len(newrows)==11
    cases, membership = [], []

    def expect(row, hit, damage):
        p = bytes.fromhex(row['payload']); kind=p[3]; spell,boss=struct.unpack('<II',p[7:15])
        if hit['boss_id'] != boss or kind==7 and boss in damage:
            return False
        return [hit['source_kind']!=2 and hit['spell_id']==spell,
                hit['source_kind']!=2 and hit['spell_id']!=0 and hit['school']==p[4],
                hit['school']==p[4], hit['source_kind']==1 and hit['school']==0,
                hit['source_kind']==2, hit['melee'],
                hit['source_kind']!=2 and hit['spell_id'] in [324,467,20925], True][kind]

    for index, row in newrows:
        p=bytes.fromhex(row['payload']); kind=p[3]; spell,boss=struct.unpack('<II',p[7:15])
        source=by[row['key']]
        assert source['feat_kind']==kind and source['target']==boss and source['selector']==p[4]
        assert kind!=0 or source['feat_spell']==spell
        candidates=sorted(set([0,116,133,324,467,20925,spell]))
        for src, school, chosen, melee in itertools.product(range(4), range(7), candidates, [False,True]):
            hit=dict(boss_id=boss,spell_id=chosen,school=school,source_kind=src,melee=melee)
            reset(); set_catalog([index]); write_inputs([hit]); result=grant()
            matched=expect(row,hit,[])
            assert result==([row['key']] if matched else []),(row['key'],hit,result)
            membership.append([row['key'],src,school,chosen,melee,matched])
        # Retain compact direct Rust fixtures for each native predicate and its
        # principal wrong-owner/school/spell/damage boundary.
        good = dict(boss_id=boss, spell_id=spell if kind==0 else 324 if kind==6 else 133,
                    school=p[4] if kind in [1,2] else 0, source_kind=1 if kind==3 else 2 if kind==4 else 0,
                    melee=kind==5)
        variants=[('matching',good,[]),('wrong-boss',dict(good,boss_id=boss+1),[]),
                  ('pet',dict(good,source_kind=2),[]),('periodic',dict(good,source_kind=1),[]),
                  ('zero-spell',dict(good,spell_id=0),[]),('wrong-school',dict(good,school=(good['school']+1)%7),[]),
                  ('nonmelee',dict(good,melee=False),[]),('boss-damage',good,[boss]),
                  ('unrelated-damage',good,[boss+1])]
        for name,hit,damage in variants:
            reset();set_catalog([index]);write_inputs([hit],damage); result=grant()
            cases.append(dict(key=row['key'],name=name,hit=hit,damaged_by_bosses=damage,matches=bool(result)))
            assert bool(result)==expect(row,hit,damage)

    # Full catalog order, live earned-set/date insertion, repeat filtering and
    # legacy feats coexist in one original native grant transaction.
    matching=[]
    for _,row in newrows:
        p=bytes.fromhex(row['payload']);kind=p[3];spell,boss=struct.unpack('<II',p[7:15])
        matching.append(dict(boss_id=boss,spell_id=spell if kind==0 else 324 if kind==6 else 133,
            school=p[4]if kind in[1,2]else 0,source_kind=1 if kind==3 else 2 if kind==4 else 0,melee=kind==5))
    reset();set_catalog(range(len(rows)));write_inputs(matching,[],[(1493,116)],
        dict(elapsed=2400.,normalized_kills=6000,guardians=4,caches=0,won=True,bare=True,full_reward=True))
    ordered=grant();assert ordered==[row['key']for row in rows if row['kind']==9 and row['key']!='feat:lairs']
    date_rows=get(account+0xc8,'Q')[0];dates={native['pair'](date_rows+32*i+8):get(date_rows+32*i+24,'Q')[0] for i in range(get(account+0xd0,'Q')[0])}
    assert dates=={key:timestamp for key in ordered}
    repeated=grant();assert repeated==[]
    assert {native['pair'](date_rows+32*i+8):get(date_rows+32*i+24,'Q')[0]for i in range(get(account+0xd0,'Q')[0])}==dates

    # Native incoming history does not consult HP damage, amount or dead-state
    # fields. The source records after apply_damage's invulnerability gate and
    # before synchronous retaliation, preserving the incoming boss identity.
    incoming=[]
    for count, found, metadata in itertools.product([0,1,16,17], [False,True], [False,True]):
        reset();history=[100+i for i in range(count)];boss=1194
        if found and count:history[-1]=boss
        put(game+0x568,'2Q',actor,1);put(actor+0xf0,'Q',777);put(actor+0x18,'q',0 if metadata else -1);put(actor+0x30,'Q',selected);put(selected+0x40,'I',boss)
        put(game+0x728,'3Q',64,damaged,count)
        for i,value in enumerate(history):put(damaged+4*i,'I',value)
        reg('R13',game);reg('RBP',bp);reg('RSI',777);put(bp+0x90,'Q',777)
        ends.add(0x1458ec940);run(0x1458ec805,0x1458ec940)
        actual=list(get(damaged,'I'*get(game+0x738,'Q')[0]));expected=history+([boss]if metadata and boss not in history else [])
        assert actual==expected;incoming.append(dict(count=count,existing=found,metadata=metadata,result=actual))

    metadata_cases=[]
    for role,(lo,hi)in METADATA_RANGES.items():
        for value in[0,4,123]:
            reset();reg('RBP',bp);reg('R12',value);run(lo,hi)
            offset=-0x28 if role in['primary-present-capacity','ward-primary-absent']else 0xb8 if role=='guardian-primary-absent'else 0x18
            result=get(bp+offset,'Q')[0];assert result==(value if role=='primary-present-capacity'else 0xffffffffffffffff)
            metadata_cases.append([role,value,result])
    # Metadata, dead state, missing/retired source and repeated same-entry GUIDs
    # are independent: the native scan resolves the first matching retained row
    # without filtering dead actors. A fresh same-entry GUID has the same ID.
    source_cases=[]
    for family,dead,exists,reused in itertools.product(['primary','guardian','ward','mob'],[False,True],[False,True],[False,True]):
        reset();count=2 if reused else 1;boss=1194;source_guid=777
        put(game+0x568,'2Q',actor,count);put(game+0x728,'3Q',64,damaged,0)
        for i in range(count):
            at=actor+i*0x1d8;put(at+0xf0,'Q',source_guid if exists else 778)
            put(at+0x18,'q',0 if family=='primary'else -1);put(at+0x30,'Q',selected)
            put(at+0x58,'q',0 if family=='guardian'else -1);put(at+0xb0,'B',dead if i==0 else False)
        put(selected+0x40,'I',boss);reg('R13',game);reg('RBP',bp);reg('RSI',source_guid);put(bp+0x90,'Q',source_guid)
        run(0x1458ec805,0x1458ec940);n=get(game+0x738,'Q')[0]
        assert n==int(family=='primary'and exists)
        assert not n or get(damaged,'I')[0]==boss
        source_cases.append([family,dead,exists,reused,n])
    primary_ids,enemy_ids,ward_ids=set(),set(),set()
    for zone in range(12):
        table=0x146bf2630+240*zone;ptr,n=struct.unpack('<QQ',raw(table+0x88,16))
        primary_ids.update(struct.unpack('<I',raw(ptr+104*i+64,4))[0]for i in range(n))
        ptr,n=struct.unpack('<QQ',raw(table+0x78,16))
        enemy_ids.update(struct.unpack('<I',raw(ptr+80*i+32,4))[0]for i in range(n))
        ward_ids.add(struct.unpack('<I',raw(0x146bf4f18+32*zone+16,4))[0])
    assert not primary_ids.intersection(enemy_ids|ward_ids)

    # Lethal producer: replay each current ability's physical-melee admission,
    # all four source categories and the three visual aliases. The constructor
    # table supplies base power/school/kind; the Rust source table must give
    # the same melee membership rather than assume that every physical hit is
    # melee or that every nonzero spell is a spell attack.
    ability_melee=set()
    for i in range(113):
        address=0x146bf5eb0+i*120
        spell=struct.unpack('<I',raw(address+64,4))[0]
        power=struct.unpack('<f',raw(address+68,4))[0]
        school,kind=raw(address+116,2)
        if school==0 and kind in[2,5,7]and power>0.:
            ability_melee.add(spell)
    source=(ROOT/'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    import re
    source_melee=set()
    for block in source.split('    AbilityDefinition {')[1:]:
        spell=int(re.search(r'spell_id: (\d+)',block)[1])
        power_match=re.search(r'base_power: f32::from_bits\((0x[0-9a-f]+)\)',block)
        power=struct.unpack('<f',struct.pack('<I',int(power_match[1],16)))[0]if power_match else float(re.search(r'base_power: ([0-9.]+)',block)[1])
        school,kind=map(int,re.search(r'school: (\d+), kind: (\d+)',block).groups())
        if school==0 and kind in[2,5,7]and power>0.:source_melee.add(spell)
    assert ability_melee==source_melee,(ability_melee,source_melee)
    record_cases=[]
    spells=sorted(set([0,116,133,324,467,20925,16038,14186,5308]+[struct.unpack('<I',raw(0x146bf5eb0+i*120+64,4))[0]for i in range(113)]))
    for spell,src,health,metadata in itertools.product(spells,range(4),[0.,1.],[False,True]):
        reset();put(game+0x6f8,'3Q',64,pairs,0);put(game+0x710,'3Q',64,blows,0);put(game+0x1ad,'B',src)
        put(bp+0x160,'I',spell);put(bp+0x280,'B',6)
        reg('RBP',bp);reg('RDI',game);reg('R15',0 if metadata else 0xffffffffffffffff);reg('RBX',1194)
        reg('XMM11',struct.unpack('<I',struct.pack('<f',health))[0]);reg('XMM12',0)
        run(0x14593f4a6,0x14593f677)
        present=metadata and health<=0.
        assert get(game+0x708,'Q')[0]==get(game+0x720,'Q')[0]==int(present)
        actual=list(get(blows,'IIBBBx'))if present else None
        normalized={16038:8349,14186:2098,5308:20647}.get(spell,spell)
        expected=[1194,normalized,6,src,int(src==0 and(spell==0 or spell in ability_melee))]if present else None
        assert actual==expected,(spell,src,health,metadata,actual,expected)
        if present:assert get(pairs,'2I')==(1194,normalized)
        record_cases.append([spell,src,health,metadata,actual])

    gate_cases=[]
    for state,guid,showcase,phase in itertools.product([0,1,2],[0xffffff,0xfffffe,17],[False,True],[0,1,2]):
        reset();put(game+0x10,'I',state);put(game+0x10d0,'Q',guid);put(game+0xae8,'B',showcase);put(game+0xaef,'B',phase)
        reg('RDX',game);reg('RCX',output)
        ends.update([0x1458c02e3,0x1458c0334]);u.emu_start(0x1458c02dd,stop,count=1000)
        admitted=u.reg_read(r.UC_X86_REG_RIP)==0x1458c0334
        assert admitted==(state!=2 and guid!=0xffffff and not showcase and phase!=0)
        gate_cases.append([state,guid,showcase,phase,admitted])

    # Current ordinary conditions, including all nine classes, use the same
    # constructor records and full current evaluator/account-normalization path.
    # Historical inputs are reused as test data, never as the current oracle.
    classes=[1,2,3,4,5,7,8,9,11]
    legendary={c:[v for v in values if v//10%10==4]for c,values in native['gear_ids'].items()}
    source_sets=json.loads((ROOT/'crates/azeroth-survivors-re/assets/progression.json').read_text())['legendary_sets']
    assert {int(c):values for c,values in source_sets.items()}==legendary
    for row in rows:
        definition=by[row['key']];p=bytes.fromhex(row['payload']);kind=row['kind']
        assert definition['kind']==kind
        if kind in[0,1]:
            assert definition['selector']==struct.unpack('<Q',p[7:15])[0]
            assert definition['target']==(9 if kind==1 else 1)
        elif kind in[2,3]:
            assert definition['selector']==p[0]and definition['target']==1
            assert definition['zone']==(struct.unpack('<Q',p[7:15])[0]if kind==3 else None)
        elif kind in[4,5]:
            assert definition['target']==struct.unpack('<Q',p[7:15])[0]
        elif kind==7:
            percentage=struct.unpack('<I',p[3:7])[0]
            assert definition['target']==(142*percentage+99)//100
        elif kind==8:
            assert definition['selector']==p[0]and definition['target']==struct.unpack('<Q',p[7:15])[0]
        elif kind==9:
            tag=p[3];low,high=struct.unpack('<II',p[7:15]);assert definition['feat_kind']==tag
            if tag<8:
                assert definition['target']==high
                if tag==0:assert definition['feat_spell']==low
                if tag in[1,2]:assert definition['selector']==p[4]
            elif tag==14:assert definition['target']==low+(high<<32)
            else:assert definition['target']==low

    def vector(at,records,stride):
        records=list(records);pointer=allocate(max(1,len(records))*stride)
        if records:u.mem_write(pointer,b''.join(records))
        put(at,'3Q',max(1,len(records)),pointer,len(records))

    def account_memory(state):
        a=allocate(512)
        vector(a+0x30,[struct.pack('<I',v)for v in sorted(state.get('gear',[]))],4)
        vector(a+0x60,[struct.pack('<IB27x',xp,int(c))for c,xp in state.get('talent_xp',{}).items()],32)
        vector(a+0xd8,[struct.pack('<B7xQ',c,z)for c,z in sorted(state.get('beaten',[]))],16)
        vector(a+0x18,[struct.pack('<B7xQ',c,z)for c,z in sorted(state.get('open',[]))],16)
        vector(a+0xa8,[],24);vector(a+0xc0,[],32)
        vector(a,[bytes(40)+struct.pack('<II8x',runs,wins)for runs,wins in state.get('characters',[])],56)
        put(a+0xa0,'Q',state.get('seen',0))
        for i,value in enumerate(state.get('statistics',[0]*7)):put(a+0x190+i*8,'Q',value)
        return a

    def progress_model(definition,state):
        beaten={tuple(pair)for pair in state.get('beaten',[])};kind=definition['kind'];target=definition['target'];selector=definition['selector']
        gear=set(state.get('gear',[]));xp=state.get('talent_xp',{})
        if kind==0:have=int(any((c,selector)in beaten for c in classes))
        elif kind==1:have=sum((c,selector)in beaten for c in classes)
        elif kind==2:have=int(any((selector,z)in beaten for z in range(12)))
        elif kind==3:have=int((selector,definition['zone'])in beaten)
        elif kind==4:
            have=sum(xp.get(str(c),0)>=sum(80+15*i for i in range(51))for c in classes)
        elif kind==5:have=len(gear)
        elif kind==6:
            best=(sum(v in gear for values in legendary.values()for v in values),sum(map(len,legendary.values())))
            f32=lambda value:struct.unpack('<f',struct.pack('<f',value))[0]
            for c in classes:
                candidate=(sum(v in gear for v in legendary[c]),len(legendary[c]))
                if f32(candidate[0]/max(candidate[1],1))>=f32(best[0]/max(best[1],1)):best=candidate
            return list(best)
        elif kind==7:have=state.get('seen',0)
        elif kind==8:have=state.get('statistics',[0]*7)[selector]
        else:return None
        return[have,target]

    historical=json.loads((ROOT/'docs/analysis/evidence/0.100.1/account-progression/native-account-fixtures.json').read_text())
    states=[dict(row['input'])for row in historical['states']]
    states.extend(dict(name=f'class{c}-zone{z}',beaten=[[c,z]])for c in classes for z in range(12))
    states.extend(dict(name=f'all-classes-zone{z}',beaten=[[c,z]for c in classes])for z in range(12))
    for c in classes:
        states.extend(dict(name=f'class{c}-xp{xp}',talent_xp={str(c):xp})for xp in[0,79,80,23204,23205,23206])
        states.extend(dict(name=f'class{c}-open{n}',open=[[c,n]])for n in[1,2,11,12])
    allgear=sorted({v for values in native['gear_ids'].values()for v in values})
    states.extend(dict(name=f'gear-boundary{n}',gear=allgear[:n])for n in[0,1,497,498])
    states.extend(dict(name=f'current-codex{seen}',seen=seen)for seen in[70,71,141,142,143])
    for definition in definitions:
        if definition['kind']==8:
            for delta in[-1,0,1]:
                stats=[0]*7;stats[definition['selector']]=max(0,definition['target']+delta)
                states.append(dict(name=f"{definition['key']}-{delta}",statistics=stats))
    states.extend(dict(name=f'roster-normalization{n}',open=[[c,12]for c in classes],characters=[[i+1,i//2]for i in range(n)])for n in[0,1,3,4,5,8,9])
    states.extend(dict(name=f'legendary-class{c}',gear=legendary[c])for c in classes)
    account_cases=[];retained_accounts=[];normalization_cases=[];undated_cases=[]
    heap_baseline=native['alloc'].__globals__['next_heap']
    for state in states:
        native['alloc'].__globals__['next_heap']=heap_baseline
        reset();set_catalog(range(len(rows)));save=account_memory(state);progress=[]
        for i,row in enumerate(rows):
            reg('RSP',stack);put(stack,'Q',stop);reg('RCX',output);reg('RDX',save);reg('R8',native['catalog_base']+i*112);run(0x1459b47d0)
            values=list(get(output,'3Q'));actual=values[1:]if values[0]==1 else None
            assert actual==progress_model(by[row['key']],state),(state['name'],row['key'],actual,progress_model(by[row['key']],state))
            progress.append(dict(key=row['key'],progress=actual))
        normalized=dict(state);beaten={tuple(pair)for pair in state.get('beaten',[])}
        for c,n in state.get('open',[]):beaten.update((c,z)for z in range(max(0,min(n-1,12))))
        normalized['beaten']=sorted(beaten);stats=list(state.get('statistics',[0]*7))
        for slot,index in[(4,0),(5,1)]:stats[slot]=max(stats[slot],sum(hero[index]for hero in state.get('characters',[])))
        normalized['statistics']=stats
        expected=[row['key']for row in rows if (value:=progress_model(by[row['key']],normalized))is not None and value[0]>=value[1]]
        reg('RSP',stack);put(stack,'Q',stop);reg('RCX',output);reg('RDX',save);reg('R8',1);reg('R9',timestamp);run(0x1459b6410)
        awarded=[native['pair'](get(get(output+8,'Q')[0]+8*i,'Q')[0]+8)for i in range(get(output+16,'Q')[0])]
        native_dates={native['pair'](get(save+0xc8,'Q')[0]+i*32+8):get(get(save+0xc8,'Q')[0]+i*32+24,'Q')[0]for i in range(get(save+0xd0,'Q')[0])}
        assert awarded==expected,(state['name'],awarded,expected)
        assert native_dates=={key:timestamp for key in expected},state['name']
        assert list(get(save+0x190,'7Q'))==stats
        native_beaten=[list(get(get(save+0xe0,'Q')[0]+16*i,'B7xQ'))for i in range(get(save+0xe8,'Q')[0])]
        assert native_beaten==[list(pair)for pair in sorted(beaten)]
        account_cases.append([state['name'],progress,awarded,native_dates,native_beaten,stats])
        if state['name'].startswith('current-codex')or state['name']in{row['input']['name']for row in historical['states']}:
            retained_accounts.append(dict(input=state,progress=progress,new_in_catalog_order=awarded,dates=native_dates))
        # Undated normalization/grants and repeat delivery are separate gates.
        before_dates=native_dates
        reg('RSP',stack);put(stack,'Q',stop);reg('RCX',output);reg('RDX',save);reg('R8',1);reg('R9',timestamp+1);run(0x1459b6410)
        assert get(output+16,'Q')[0]==0
        assert {native['pair'](get(save+0xc8,'Q')[0]+i*32+8):get(get(save+0xc8,'Q')[0]+i*32+24,'Q')[0]for i in range(get(save+0xd0,'Q')[0])}==before_dates
        normalization_cases.append([state['name'],native_beaten,stats])
        if state['name'].startswith('current-codex'):
            undated=account_memory(state)
            reg('RSP',stack);put(stack,'Q',stop);reg('RCX',output);reg('RDX',undated);reg('R8',0);reg('R9',timestamp);run(0x1459b6410)
            assert get(undated+0xd0,'Q')[0]==0
            assert [native['pair'](get(get(output+8,'Q')[0]+8*i,'Q')[0]+8)for i in range(get(output+16,'Q')[0])]==expected
            undated_cases.append([state['name'],expected])

    source_check(definitions)
    spans=[];assembly=[]
    for role,(lo,hi)in RANGES.items():
        spans.append(dict(role=role,va=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(raw(lo,hi-lo)).hexdigest()))
        assembly.append(f'; {role}: {lo:#x}..{hi:#x}\n'+''.join(
            f'{i.address:x}: {i.bytes.hex()}  {i.mnemonic} {i.op_str}'.rstrip()+'\n'
            for i in md.disasm(raw(lo,hi-lo),lo)))
    result=dict(target_sha256=SHA,constructor='docs/analysis/evidence/0.112.0/rewards-catalogs/catalogs.json',
        ranges=spans,dispatch_tables=[dict(va=hex(a),sha256=hashlib.sha256(raw(a,n)).hexdigest())for a,n in [(0x147243524,32),(0x147243544,32)]],
        checks=dict(predicate_cases=len(membership),predicate_digest=digest(membership),fixture_cases=len(cases),incoming_history=len(incoming),
                    delivered=ordered,dates=dates,repeat_delivered=repeated,
                    lethal_records=len(record_cases),lethal_digest=digest(record_cases),melee_spell_ids=sorted(ability_melee),
                    eligibility_cases=len(gate_cases),eligibility_digest=digest(gate_cases),
                    actor_metadata_cases=len(metadata_cases),actor_metadata_digest=digest(metadata_cases),
                    source_history_cases=len(source_cases),source_history_digest=digest(source_cases)),cases=cases,
        ordinary_account=dict(states=len(states),evaluations=len(states)*len(rows),result_sha256=digest(account_cases),
            normalization_sha256=digest(normalization_cases),retained_states=len(retained_accounts),codex_total=142,
            legendary_ids=sum(map(len,legendary.values())),legendary_sha256=digest(legendary),
            undated_cases=len(undated_cases),undated_sha256=digest(undated_cases)),
        metadata_boundary=dict(primary_ids=sorted(primary_ids),other_entry_counts=dict(enemy=len(enemy_ids),ward=len(ward_ids)),
            disjoint_creature_entries=True,ranges=[dict(role=role,va=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(raw(lo,hi-lo)).hexdigest())for role,(lo,hi)in METADATA_RANGES.items()],
            canonical_owners=['docs/analysis/evidence/0.112.0/raid-boss-lifecycle/manifest.json','docs/analysis/evidence/0.112.0/raid-guardian-lifecycle/manifest.json','docs/analysis/evidence/0.112.0/raid-wards/manifest.json']),
        limits=['Original constructor, complete feat grant, earned-set insertion and dated grant instructions execute with synthetic typed run/account memory.',
                'Allocator/growth, C memory/string operations and FILETIME acquisition are explicit host seams; native UTC conversion executes.',
                'Incoming history uses original instructions with synthetic actor metadata; source ordering/gates are traced, not application-tested.',
                'No compiler, rebuilt Rust, application/game, real save/file/OS clock, rendering or original/rebuilt comparison runs.'])
    account_vectors=dict(target_sha256=SHA,entry='0x1459b47d0',grant='0x1459b6410',keys=[row['key']for row in rows],
        states=[dict(state,progress=[row['progress']for row in state['progress']])for state in retained_accounts])
    destination=ROOT/('runtime/achievement-grants-0.112.0/curated'if args.stage else'docs/analysis/evidence/0.112.0/achievement-grants')
    if args.stage:
        destination.mkdir(parents=True,exist_ok=True);(destination/'native-vectors.json').write_text(json.dumps(result,indent=2)+'\n');(destination/'selected-native.asm').write_text('\n'.join(assembly))
        (destination/'native-account-vectors.json').write_text(json.dumps(account_vectors,indent=2)+'\n')
    else:
        assert json.loads((destination/'native-vectors.json').read_text())==result
        assert (destination/'selected-native.asm').read_text()=='\n'.join(assembly)
        assert json.loads((destination/'native-account-vectors.json').read_text())==account_vectors
        ghidra=json.loads((destination/'ghidra.json').read_text())
        assert ghidra['target_sha256']==SHA
        for query in ghidra['queries']:
            lo,hi=RANGES[query['role']]
            assert hashlib.sha256(raw(lo,hi-lo)).hexdigest()==query['input_sha256']
            assert hashlib.sha256((destination/query['pseudocode']).read_bytes()).hexdigest()==query['pseudocode_sha256']
    print(f'Passed {len(membership)} current feat predicates, {len(cases)} fixtures, {len(record_cases)} lethal records, {len(gate_cases)} eligibility gates, native ordered/date/idempotent delivery and {len(incoming)} incoming histories; no compiler/game')
    print(f'Passed {len(states)*len(rows)} current ordinary evaluations across {len(states)} states, complete normalization/date/repeat grants and current142 Codex threshold')


def source_check(definitions):
    base=ROOT/'crates/azeroth-survivors-re/src'
    account=(base/'account_progression.rs').read_text();delivery=(base/'gameplay/mod.rs').read_text();progress=(base/'progression.rs').read_text()
    kills=(base/'gameplay/mechanics/bosses.rs').read_text();incoming=(base/'gameplay/mechanics/incoming.rs').read_text()
    history=(base/'gameplay/mechanics/kill_feats.rs').read_text()
    assert len(definitions)==84
    for token in ['Some(kind @ 0..=7)','Some(8)','Some(14)','hit.source_kind != 2','hit.source_kind == 1 && hit.school == 0','324 | 467 | 20925','damaged_by_bosses.contains','ability.school == 0','matches!(ability.kind, 2 | 5 | 7)','ability.base_power > 0.0']:
        assert token in account,token
    assert 'meets_feat_with_events('in progress
    assert delivery.count('game.boss_killing_blows(),')==delivery.count('game.damaged_by_bosses(),')==2
    assert kills.index('self.generic.boss_killing_blows.push')<kills.index('row.actor.dead = true',kills.index('self.generic.boss_killing_blows.push'))
    assert incoming.index('self.record_incoming_boss(source_guid)')<incoming.index('self.execution.vitals.health -= applied.amount')<incoming.index('native::reactive_effects(')
    assert 'self.bosses.iter().find(|row| row.guid == source_guid)'in history


def prepare_rea():
    target=latest_target(verify=True);assert target['sha256']==SHA;data=target_bytes(target)
    module = load_script('achievement_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    work=ROOT/'runtime/achievement-grants-0.112.0';work.mkdir(parents=True,exist_ok=True)
    disabled='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'
    scopes=[('feats','feat-grant'),('lethal','lethal-attribution'),('incoming','incoming-boss-history'),('save','save-grant'),('earned','earned-insert'),
            ('ordinary','ordinary-eval'),('account','account-grant'),('legendary','legendary-selector'),('rarity','legendary-filter')]
    for name,role in scopes:
        lo,hi=RANGES[role];offset=pe.rva_offset(lo-pe.image_base)
        binary=work/(name+'.bin');binary.write_bytes(data[offset:offset+hi-lo])
        seeds=work/(name+'-seeds.tsv');entries=[lo]
        if name=='feats':entries += [0x1459b611c,0x1459b6284,0x1459b62eb,0x1459b62ff,0x1459b6309,0x1459b6318,0x1459b632a,0x1459b6337]
        seeds.write_text(''.join(f'{a:#x}\tfunction\n{a:#x}\tcode\n'for a in entries))
        plan=dict(target=str(binary.relative_to(ROOT)),output=str((work/(name+'-rea')).relative_to(ROOT)),init_timeout=60,timeout=240,
            environment=dict(REA_GHIDRA_DISABLED_ANALYZERS=disabled,REA_GHIDRA_SEED_FILE=str(seeds.relative_to(ROOT))),
            open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(lo)),
            operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(a)))for a in entries])
        (work/(name+'-plan.json')).write_text(json.dumps(plan,indent=2)+'\n')
    print('Prepared nine bounded REA/Ghidra plans under runtime/achievement-grants-0.112.0; target not launched')


if __name__=='__main__':
    main()

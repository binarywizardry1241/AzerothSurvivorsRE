#!/usr/bin/env python3
"""Check current native23 defense/aura contracts without compilation or a game."""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT

SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
STAGE=ROOT/'runtime/native-evidence/0.109.0/raid-shields'
KEPT=ROOT/'docs/analysis/evidence/0.109.0/raid-shields'
SOURCE=ROOT/'crates/azeroth-survivors-re/src/bosses/raid_shields.rs'
RANGES={
    'producer':(0x145959aa1,0x145959bc4),
    'deferred37-remove':(0x14594ea43,0x14594ea7b),
    'damage-factor':(0x145971998,0x145971a03),
    'damage-product':(0x145971a45,0x145971a58),
    'aura-helper':(0x145980540,0x145980c5e),
    'aura-applications':(0x14590d560,0x14590d902),
}
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def dump(v):return json.dumps(v,indent=2,ensure_ascii=False)+'\n'

def recover():
    mod = load_script('shield_actions', ROOT/'scripts/recover-raid-actions.py')
    target,raw,span,_,_=mod.recover();rows=[]
    for zi in range(12):
        bosses,n=struct.unpack('<QQ',raw(0x146bde390+zi*240+0x88,16));assert n==5
        for bi in range(n):
            boss=bosses+104*bi;identity=struct.unpack('<I',raw(boss+64,4))[0]
            for phase in [False,True]:
                p,n=struct.unpack('<QQ',raw(boss+(48 if phase else 16),16));stride=72 if phase else 56
                for slot in range(n):
                    at=p+stride*slot;v=raw(at,stride)
                    if v[61 if phase else 45]!=23:continue
                    w=struct.unpack('<'+str(stride//4)+'I',v);w=w[4:] if phase else w
                    rows.append(dict(boss_id=identity,native_slot=slot,phase=phase,index=len(rows),
                        native_tag=23,spell=w[0],duration_bits=w[1],repeat_bits=0 if phase else w[12],
                        record=span(at,stride),native_record_hex=v.hex()))
    guardian_path='docs/analysis/evidence/0.109.0/guardian-signatures/catalog.json'
    guardians=json.loads((ROOT/guardian_path).read_text());assert guardians['target_sha256']==SHA
    for ri,row in enumerate(guardians['rows']):
        for vi,variant in enumerate(row['variants']):
            for mi,move in enumerate(variant):
                if move['tag']!=23:continue
                native=move['record'];assert span(int(native['va'],16),56)['sha256']==native['sha256']
                rows.append(dict(guardian_id=row['enemy_id'],variant=vi,native_slot=mi,index=len(rows),native_tag=23,
                    spell=move['words'][0],duration_bits=move['words'][1],repeat_bits=move['words'][12],
                    canonical_native_record=f'{guardian_path}#/rows/{ri}/variants/{vi}/{mi}/record'))
        for phase in row['phases']:
            if phase['tag']!=23:continue
            native=phase['record'];assert span(int(native['va'],16),72)['sha256']==native['sha256']
            rows.append(dict(guardian_id=row['enemy_id'],phase_index=phase['index'],index=len(rows),native_tag=23,
                spell=phase['words'][4],duration_bits=phase['words'][5],repeat_bits=0,
                canonical_native_record=f'{guardian_path}#/rows/{ri}/phases/{phase["index"]}/record'))
    assert len(rows)==5 and rows[0]['boss_id']==1193
    return target,raw,span,rows

def check_native(raw,rows):
    sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
    from unicorn import x86_const as r
    md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,actors,record,frame,stack,periodic=(0x71000000,0x71010000,0x71020000,0x71030000,0x71040000,0x71050000)
    for base in [game,actors,record,frame,stack,periodic]:uc.mem_map(base,0x10000)
    def put(a,fmt,*values):uc.mem_write(a,struct.pack('<'+fmt,*values))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    stops=set();allowed=(0,0)
    def hook(machine,a,size,user):
        if a in stops:uc.emu_stop();return
        assert allowed[0]<=a<allowed[1],hex(a)
        i=next(md.disasm(bytes(uc.mem_read(a,size)),a));assert i.mnemonic!='call',hex(a)
    uc.hook_add(UC_HOOK_CODE,hook)
    def run(a,b,ends):
        nonlocal allowed,stops
        allowed=(a,b);stops=set(ends);uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP) in stops
    cases=0
    for row in rows:
      seconds=struct.unpack('<f',struct.pack('<I',row['duration_bits']))[0]
      for old in [0.,100.,math.nan]:
        put(game+0x560,'QQ',actors,1);put(record,'II',row['spell'],row['duration_bits'])
        put(frame+0xf0,'Q',0);put(actors+0x1cc,'f',old)
        uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RCX,record)
        uc.reg_write(r.UC_X86_REG_RBX,0);uc.reg_write(r.UC_X86_REG_RBP,frame);sx(r.UC_X86_REG_XMM15,10.)
        run(0x145959aa1,0x145959ada,[0x145959ada]);assert get(actors+0x1cc,'f')[0]==f32(10.+seconds)
        cases+=1
    for primary,guardian in [(False,False),(True,False),(False,True),(True,True)]:
      for shield in [8.,10.,12.,math.nan]:
       for exposed in [8.,10.,12.,math.nan]:
        put(actors+0x18,'q',0 if primary else -1);put(actors+0x58,'q',0 if guardian else -1)
        put(actors+0x1cc,'ff',shield,exposed)
        uc.reg_write(r.UC_X86_REG_R14,actors);uc.reg_write(r.UC_X86_REG_RDX,0x1d8)
        sx(r.UC_X86_REG_XMM0,1.);sx(r.UC_X86_REG_XMM1,10.)
        run(0x1459719bc,0x145971a03,[0x145971a03,0x145971afd])
        expected=1. if not(primary or guardian) else 1.5 if exposed>10 else .25 if shield>10 else 1.
        assert xf(r.UC_X86_REG_XMM0)==expected,(primary,guardian,shield,exposed)
        cases+=1
    for talent in [0.,1.,1.125,3.]:
     for power in [0.,.01,5.,100.,math.nan]:
      for factor in [1.,.25,1.5]:
        sx(r.UC_X86_REG_XMM8,talent);sx(r.UC_X86_REG_XMM6,power);sx(r.UC_X86_REG_XMM0,factor)
        run(*RANGES['damage-product'],[RANGES['damage-product'][1]])
        product=f32(f32(talent*power)*factor);expected=product if product>=1 else 1.
        assert xf(r.UC_X86_REG_XMM8)==expected
        cases+=1
    # Current aura slot admission/mutation reaches its first field insertion;
    # unchanged requests return without touching the map or publishing fields.
    for index in range(16):
     for add in [False,True]:
        slots=[500+i for i in range(16)];spell=900
        slots[index]=0 if add else spell
        put(game+0x560,'QQ',actors,1);put(actors+0xf0,'Q',77);put(actors+0xb0,'I',0)
        put(actors+0x118,'16I',*slots);sp=stack+0x8000;stop=stack+0xf000;put(sp,'Q',stop)
        uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,game)
        uc.reg_write(r.UC_X86_REG_RDX,77);uc.reg_write(r.UC_X86_REG_R8D,spell);uc.reg_write(r.UC_X86_REG_R9D,int(add))
        run(*RANGES['aura-helper'],[0x145980934,stop])
        assert uc.reg_read(r.UC_X86_REG_RIP)==0x145980934
        slots[index]=spell if add else 0
        assert get(actors+0x118,'16I')==tuple(slots)
        bp=uc.reg_read(r.UC_X86_REG_RBP);assert get(bp+0x30,'Q')[0]==79+index
        # Separately execute the native flag-word constructor, not its BTree allocator.
        uc.reg_write(r.UC_X86_REG_RDI,index);uc.reg_write(r.UC_X86_REG_RSI,actors);uc.reg_write(r.UC_X86_REG_R14,0)
        run(0x14598093a,0x145980a01,[0x145980a01])
        group=index//8;flags=sum((2 if v else 0)<<(4*i) for i,v in enumerate(slots[group*8:group*8+8]))
        assert uc.reg_read(r.UC_X86_REG_R8D)==flags
        cases+=1
    patterns=[[],[(0,500,1)],[(0,500,1),(0,500,1)],[(1,500,1),(1,500,1)],
        [(0,500,1),(1,500,1),(1,500,1),(0,501,0),(2,503,3)],
        [(0,500,1)]*260+[(2,501,1)]*5]
    for group in range(4):
     for rows in patterns:
        slots=[0]*16;slots[group*4:group*4+4]=[500,501,0,503]
        put(actors+0x118,'16I',*slots);put(actors+8,'QQ',periodic,len(rows))
        uc.mem_write(periodic,bytes(0x8000))
        for i,(owner,spell,ticks) in enumerate(rows):
            put(periodic+48*i,'B',owner);put(periodic+48*i+0x10,'I',spell);put(periodic+48*i+0x20,'I',ticks)
        sp=stack+0x8000;stop=stack+0xf000;put(sp,'Q',stop)
        uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,actors);uc.reg_write(r.UC_X86_REG_RDX,group)
        run(*RANGES['aura-applications'],[stop])
        expected=0
        for byte,spell in enumerate([500,501,0,503]):
            count=sum(owner==0 and s==spell and ticks!=0 for owner,s,ticks in rows)
            if count==0:count=sum(owner!=0 and s==spell and ticks!=0 for owner,s,ticks in rows)
            if spell:expected|=max(min(count,255)-1,0)<<(byte*8)
        assert uc.reg_read(r.UC_X86_REG_EAX)==expected,(group,len(rows),uc.reg_read(r.UC_X86_REG_EAX),expected)
        cases+=1
    for exposed in [0.,20.,math.nan]:
        put(actors+0x1cc,'ff',12.,exposed);uc.reg_write(r.UC_X86_REG_RCX,actors)
        run(0x14589a13f,0x14589a149,[0x14589a149])
        assert get(actors+0x1cc,'I')[0]==bits(0.) and get(actors+0x1d0,'I')[0]==bits(exposed)
        cases+=1
    assert raw(0x14722ad48,15)==b'%s is shielded!'
    assert raw(0x145dd4cc8,4)==struct.pack('<f',1.5) and raw(0x145dcce84,4)==struct.pack('<f',.25)
    return cases,md

def check_integration():
    paths={name:(ROOT/path).read_text() for name,path in {
        'dispatch':'crates/azeroth-survivors-re/src/bosses/raid_areas.rs',
        'deferred':'crates/azeroth-survivors-re/src/bosses/raid_lines.rs',
        'damage':'crates/azeroth-survivors-re/src/player_abilities/damage.rs',
        'bosses':'crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs',
        'actors':'crates/azeroth-survivors-re/src/gameplay/mechanics.rs',
        'guardians':'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs',
        'auras':'crates/azeroth-survivors-re/src/run_effects/presentation.rs',
    }.items()}
    checks={
        'dispatch':['super::raid_shields::dispatch(record, context, port)','self.lines.remove_aura_at(removal.source, removal.spell, removal.at)'],
        'deferred':['RemoveAura(u32)','fn remove_aura_at(','if self.rows[*index].at > now','self.rows.remove(*index)','port.raid_aura(source, spell, false)'],
        'damage':['apply_hit_with_raid_multiplier(victim, power, context, 1.0)','victim.primary_boss || victim.guardian','native_max((victim_multiplier(victim, context) * power) * factor, 1.0)'],
        'bosses':['pub(super) defenses:','self.defenses.entry(guid).or_default().protect(until)','self.generic.aura_event(guid, spell, present, periodic)','damage::apply_hit_with_raid_multiplier(','self.boss_state.defenses.get(&row.guid)'],
        'actors':['let raid_multiplier = if victim.guardian','damage::apply_hit_with_raid_multiplier(','self.boss_state.defenses.get(&row.guid)'],
        'guardians':['self.boss_state.defenses.get_mut(&row.guid)','defense.reset();'],
        'auras':['self.spells.contains(&spell_id)','79+index as u16','99+(index/8) as u16','121+(index/4) as u16','row.owner_kind==0','count.min(255).saturating_sub(1)'],
    }
    for role,tokens in checks.items():
        for token in tokens:assert token in paths[role],(role,token)
    deferred=paths['deferred']
    assert deferred.index('port.raid_source(source)')<deferred.index('port.raid_aura(source, spell, false)')<deferred.index('from.z = port.primary_height')
    assert 'sort_by' not in deferred and 'sort_unstable' not in deferred

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');ap.add_argument('--check',action='store_true');ap.add_argument('--prepare-rea',action='store_true');ap.add_argument('--check-integration',action='store_true');args=ap.parse_args()
    if args.prepare_rea:
        target,raw,span,rows=recover();work=ROOT/'runtime/raid-shields-0.109.0/reproduce';work.mkdir(parents=True,exist_ok=True)
        disabled='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'
        inputs=[('producer',0x1459578e0,0x14595cd42,0x145959aa1),('damage',0x145971490,0x145974c42,0x145971998),
                ('aura',*RANGES['aura-helper'],RANGES['aura-helper'][0]),('applications',*RANGES['aura-applications'],RANGES['aura-applications'][0])]
        for role,a,b,entry in inputs:
            path=work/(role+'.bin');path.write_bytes(raw(a,b-a));seed=work/(role+'-seeds.tsv')
            environment={'REA_GHIDRA_DISABLED_ANALYZERS':disabled}
            if entry!=a:seed.write_text(f'{entry:#x}\tfunction\n{entry:#x}\tcode\n');environment['REA_GHIDRA_SEED_FILE']=str(seed.relative_to(ROOT))
            plan=dict(target=str(path.relative_to(ROOT)),output=str((work/role).relative_to(ROOT)),init_timeout=60,timeout=180,
                environment=environment,open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(entry)))])
            (work/(role+'-plan.json')).write_text(dump(plan))
        print(work.relative_to(ROOT));return
    target,raw,span,rows=recover();cases,md=check_native(raw,rows)
    check_integration()
    source=SOURCE.read_text();expected=''.join(f'    Shield {{ spell: {r["spell"]}, seconds: f32::from_bits(0x{r["duration_bits"]:08x}) }},\n' for r in rows)
    assert source.split('// BEGIN NATIVE SHIELDS\n')[1].split('// END NATIVE SHIELDS')[0]==expected
    for token in ['record.words[0] != 14','self.shield_until = deadline','self.shield_until = 0.0','self.exposed_until > now','self.shield_until > now','port.raid_aura(context.source_guid, shield.spell, true)','CastTarget::None','RaidWarning::Shielded']:
        assert token in source,token
    # Nested native23 records call the same owner; they cannot omit its
    # untargeted self visual or reorder aura/visual/warning publication.
    assert 'raid_shields::dispatch_payload(w[0], f(1), c, port)' in (ROOT/'crates/azeroth-survivors-re/src/bosses/raid_extra.rs').read_text()
    assert source.index('port.raid_aura(context.source_guid')<source.index('port.cast_spell(SpellCast')<source.index('port.raid_warning(context.source_guid')
    output=STAGE if args.write else KEPT
    if args.write:output.mkdir(parents=True,exist_ok=True)
    ranges=[]
    for role,(a,b) in RANGES.items():
        v=raw(a,b-a);ins=list(md.disasm(v,a));assert sum(i.size for i in ins)==len(v)
        asm=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        path=output/(role+'.asm')
        if args.write:path.write_text(asm)
        else:assert path.read_text()==asm,path
        ranges.append(dict(role=role,**span(a,b-a),assembly=role+'.asm',end_exclusive=hex(b)))
    manifest=dict(target_version=target['version'],target_sha256=SHA,target_executed=False,records=rows,ranges=ranges,native_cases=cases,
        canonical_reset='docs/analysis/evidence/0.109.0/guardian-signatures/decision.asm',
        canonical_exposure='docs/analysis/evidence/0.109.0/raid-native/crystal-exposure.asm',
        canonical_wards='docs/analysis/evidence/0.109.0/raid-wards/manifest.json',
        limits=['Exposure is native33 kind5 crystal resolution; the earlier native38 label was incorrect. Connected native22 ward defenses/lifecycle retain their separate current evidence owner.','Aura map/packet allocation and global source ownership remain external seams.','Synthetic original instructions only; no compilation, game process or original/rebuilt parity.'])
    path=output/'manifest.json'
    if args.write:path.write_text(dump(manifest))
    else:assert path.read_text()==dump(manifest),path
    if not args.write:
        provenance=json.loads((output/'rea-provenance.json').read_text());assert provenance['target_sha256']==SHA
        for row in provenance['records']:
            if 'pseudocode' in row:assert hashlib.sha256((output/row['pseudocode']).read_bytes()).hexdigest()==row['pseudocode_sha256']
    print(f'0.109.0 shields: {len(rows)} current records, {cases} native cases; source/ranges checked')

if __name__=='__main__':main()

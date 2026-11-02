#!/usr/bin/env python3
"""Exercise selected original demon selector instructions; never launch the game.

Queries supply explicit ordered candidates, frees are inert, and all original
code/constants are mapped at their PE addresses. Output stays in runtime/.
"""
from script_sources import load_script
import hashlib
import argparse
import json
import math
from pathlib import Path
import struct
import sys

ROOT=Path(__file__).resolve().parents[1]
SHA='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
OUT=ROOT/'runtime/demon-actors-01050'

def model(case,definition):
    """Independent semantic tracing of the source selector for finite vectors."""
    rows=case['targets'];kind=case['kind'];ordered=case['ordered']
    def dist(a,b):return math.hypot(a[0]-b[0],a[1]-b[1])
    def priority(t):return 2*int(t['boss'])|int(t['elite'])
    if kind==5:
        elites=[t for t in rows if t['alive'] and priority(t) and dist(t['position'],case['player'])<=28]
        retained=next((t for t in elites if t['guid']==case['retained']),None)
        if retained:return retained['guid']
        elites=[t for t in elites if t['selectable_at']<=case['now']]
        if elites:return min(elites,key=lambda t:t['health']/max(1.,t['maximum_health']))['guid']
    if kind==7:
        elite=[t for id in ordered for t in rows if t['guid']==id and t['alive'] and priority(t)]
        current=next((t for t in elite if t['guid']==case['focus']),None)
        if current and (current['boss'] or not any(t['boss'] for t in elite)):return current['guid']
        for bosses in [True,False]:
            first=next((t for t in elite if t['boss'] if bosses),None) if bosses else next(iter(elite),None)
            if first:return first['guid']
    estimated=max(1.,((case['level']-1)*.12+1)*definition['damage']*case['run_damage'])
    chosen=None;best=0
    for id in ordered[:32]:
        t=next(t for t in rows if t['guid']==id)
        if not t['alive'] or t['selectable_at']>case['now']:continue
        if not definition['spell_id'] and dist(t['position'],case['player'])>34:continue
        incoming=sum(m['power'] for m in case['missiles'] if m['target']==id and not m['consumed'])
        if not priority(t) and incoming>=t['health']:continue
        bonus,cap=(2.5,5.) if t['boss'] else (1.5,3.) if t['elite'] else (0.,min(2.,max(1.,t['health']/estimated)))
        d=dist(t['position'],case['player']);allocated=case['allocations'].count(id)
        score=3/(d/6+1)-dist(t['position'],case['position'])*(.03 if definition['spell_id'] else .12)+bonus+allocated*-1.6/cap
        nearby=lambda radius,spell=None:sum(1 for other in rows if other['alive'] and dist(other['position'],t['position'])<=radius and (spell is None or spell in other['spells']))
        if kind==1 and 348 not in t['spells']:score+=.8
        if kind==2:score+=bonus+(1-t['health']/max(1.,t['maximum_health']))*1.5+1.5*(980 in t['spells'])
        if kind==3:score+=3/(d/3+1)
        if kind==4:score+=nearby(8,172)*.4
        if kind in [5,6]:score+=nearby(5)*.3
        if kind==7:score+=bonus*2
        if case['retained']==id:score+=1
        if chosen is None or score>best:chosen=id;best=score
    return chosen

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest()==SHA
    pe_module = load_script('pe', ROOT/'scripts/inventory-executable.py')
    pe=pe_module.PE(data)
    manifest_path=ROOT/'docs/analysis/evidence/0.105.0/demon-actors/manifest.json'
    manifest=json.loads(manifest_path.read_text())
    assert manifest['target_sha256']==SHA
    for row in manifest['ranges']:
        start,end=int(row['start'],16),int(row['end_exclusive'],16)
        at=pe.rva_offset(start-pe.image_base)
        assert at==int(row['file_offset'],16)
        assert hashlib.sha256(data[at:at+end-start]).hexdigest()==row['sha256']
        for field in ['assembly','pseudocode']:
            if field in row:assert (manifest_path.parent/row[field]).is_file()
        for name,digest in row.get('text_sha256',{}).items():
            assert hashlib.sha256((manifest_path.parent/name).read_bytes()).hexdigest()==digest
    sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    import unicorn.x86_const as r
    u=Uc(UC_ARCH_X86,UC_MODE_64)
    image_size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base,(image_size+4095)&~4095)
    for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    mem,stack=0x200000000,0x300000000
    u.mem_map(mem,0x40000);u.mem_map(stack,0x20000)
    game,pets,definitions,actors,ids=mem,mem+0x2000,mem+0x4000,mem+0x10000,mem+0x20000
    statuses,missiles=mem+0x24000,mem+0x30000
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    current={};phase='selector';bounce_hits=[];bounce_packets=[];visual_packets=[]
    def ret():
        sp=u.reg_read(r.UC_X86_REG_RSP);dest,=get(sp,'<Q')
        u.reg_write(r.UC_X86_REG_RSP,sp+8);u.reg_write(r.UC_X86_REG_RIP,dest)
    def hook(uc,a,size,unused):
        if phase=='visual' and a==0x1458b5100:
            out=uc.reg_read(r.UC_X86_REG_RCX);sp=uc.reg_read(r.UC_X86_REG_RSP)
            count,=get(sp+0x28,'<Q');hit_at=uc.reg_read(r.UC_X86_REG_R9)
            hits=list(get(hit_at,'<'+'Q'*count)) if count else []
            visual_packets.append(dict(source=uc.reg_read(r.UC_X86_REG_RDX),spell=uc.reg_read(r.UC_X86_REG_R8),hits=hits))
            u.mem_write(out,bytes(32));ret();return
        if phase=='bounce' and a==0x14590a710:uc.emu_stop();return
        if phase=='bounce' and a==0x14594f150:
            out=uc.reg_read(r.UC_X86_REG_RCX)
            put(out,'<IIf',int(current['gear_present']),current['count'],current['multiplier']);ret();return
        if phase=='bounce' and a==0x1458b5100:
            out=uc.reg_read(r.UC_X86_REG_RCX);u.mem_write(out,bytes(32))
            bounce_packets.append(dict(source=uc.reg_read(r.UC_X86_REG_RDX),spell=uc.reg_read(r.UC_X86_REG_R8)))
            ret();return
        if phase=='bounce' and a==0x145933ec0:
            g=uc.reg_read(r.UC_X86_REG_RCX);sp=uc.reg_read(r.UC_X86_REG_RSP)
            text_at,text_len=get(g+0x140,'<QQ')
            bounce_hits.append(dict(target=uc.reg_read(r.UC_X86_REG_RDX),spell=uc.reg_read(r.UC_X86_REG_R9),
                power_bits=uc.reg_read(r.UC_X86_REG_XMM2)&0xffffffff,critical=bool(get(sp+0x30,'<B')[0]),
                source_kind=get(g+0x195,'<B')[0],caption=bytes(uc.mem_read(text_at,text_len)).decode(),
                descriptor=get(g+0x170,'<Q')[0]))
            ret();return
        if a==0x145925c80:
            result=uc.reg_read(r.UC_X86_REG_RCX)
            for i,guid in enumerate(current['ordered']):put(ids+8*i,'<Q',guid)
            put(result,'<QQQ',0,ids,len(current['ordered']));ret()
        elif a==0x1400021d0:ret()
    u.hook_add(UC_HOOK_CODE,hook)
    def target(guid,x,hp=100,maximum=100,boss=False,elite=False,spells=(),selectable_at=0,alive=True,y=0):
        return dict(guid=guid,position=[x,y,0],health=hp,maximum_health=maximum,
                    boss=boss,elite=elite,spells=list(spells),selectable_at=selectable_at,alive=alive)
    scenarios=[
        dict(name='nearest',targets=[target(51,5),target(52,10)]),
        dict(name='boss_priority',targets=[target(51,5),target(52,14,boss=True)]),
        dict(name='elite_priority',targets=[target(51,5),target(52,10,elite=True)]),
        dict(name='immolate',targets=[target(51,5,spells=[348]),target(52,6)]),
        dict(name='agony',targets=[target(51,5),target(52,6,spells=[980])]),
        dict(name='wounded',targets=[target(51,5),target(52,6,hp=5)]),
        dict(name='packed',targets=[target(51,5),target(52,6,spells=[172]),target(53,6.5,spells=[172]),target(54,7,spells=[172])]),
        dict(name='missile_will_kill',targets=[target(51,5),target(52,10)],missiles=[dict(target=51,power=100,consumed=False)]),
        dict(name='missile_nonlethal',targets=[target(51,5),target(52,10)],missiles=[dict(target=51,power=99,consumed=False)]),
        dict(name='elite_not_skipped_by_missile',targets=[target(51,5,elite=True),target(52,10)],missiles=[dict(target=51,power=100,consumed=False)]),
        dict(name='allocation',targets=[target(51,5),target(52,6)],allocations=[51,51,51]),
        dict(name='retain_bonus',targets=[target(51,5),target(52,6)],retained=52),
        dict(name='felguard_lowest_fraction',targets=[target(51,5,hp=50,elite=True),target(52,10,hp=5,elite=True)]),
        dict(name='felguard_retains',targets=[target(51,5,hp=50,elite=True),target(52,10,hp=5,elite=True)],retained=51),
        dict(name='doomguard_focus',targets=[target(51,5,hp=50,boss=True),target(52,10,hp=5,boss=True)],focus=52),
        dict(name='doomguard_upgrade_focus',targets=[target(51,5,elite=True),target(52,10,boss=True)],focus=51),
        dict(name='dead_and_delayed',targets=[target(51,5,alive=False),target(52,6,selectable_at=11),target(53,10)]),
        dict(name='no_candidates',targets=[],ordered=[]),
    ]
    cases=[]
    for kind in range(1,9):
        for scenario in scenarios:
            u.mem_write(mem,bytes(0x40000));u.mem_write(stack,bytes(0x20000))
            current=dict(scenario)
            current.update(kind=kind,now=10.,level=20,run_damage=1.5,player=[0.,0.,0.],position=[2.5,0.,0.])
            current.setdefault('ordered',[t['guid'] for t in current['targets'] if t['alive'] and t['selectable_at']<=10.])
            current.setdefault('retained',None);current.setdefault('focus',None)
            current.setdefault('allocations',[]);current.setdefault('missiles',[])
            put(game+0xd0,'<QQ',pets,1+len(current['allocations']))
            put(game+0x560,'<QQ',actors,len(current['targets']))
            put(game+0x590,'<QQ',missiles,len(current['missiles']))
            put(game+0x47c,'<f',current['run_damage']);put(game+0x4d8,'<I',current['level'])
            put(game+0x4c8,'<3f',*current['player']);put(game+0x9ec,'<f',current['now'])
            # Exact selected descriptor copied from canonical recovered data.
            entry={1:9512,2:9518,3:9519,4:9520,5:9514,6:9521,7:9522,8:9523}[kind]
            source=json.loads((ROOT/'docs/analysis/evidence/0.105.0/pet-creation/definitions.json').read_text())
            rows=source['definitions'] if isinstance(source,dict) else source
            definition=next(row for row in rows if row['entry']==entry)
            address=int(definition['address'],16)
            at=pe.rva_offset(address-pe.image_base);u.mem_write(definitions,data[at:at+0x40])
            for i,id in enumerate([current['retained']]+current['allocations']):
                pet=pets+i*0x78
                put(pet+0x18,'<Q',definitions);put(pet+0x28,'<Q',id or 0)
                put(pet+0x30,'<Q',current['focus'] or 0);put(pet+0x4c,'<3f',*current['position'])
            for i,t in enumerate(current['targets']):
                a=actors+i*0x160;status=statuses+i*0x100
                put(a+8,'<QQ',status,len(t['spells']));put(a+0x18,'<q',0 if t['boss'] else -1)
                put(a+0x68,'<I',0 if t['alive'] else 1);put(a+0x88,'<Q',t['guid'])
                put(a+0xf0,'<2f',t['health'],t['maximum_health']);put(a+0x118,'<3f',*t['position'])
                put(a+0x140,'<f',t['selectable_at']);put(a+0x15c,'<B',int(t['elite']))
                for j,spell in enumerate(t['spells']):put(status+j*0x30+0x10,'<I',spell)
            for i,t in enumerate(current['missiles']):
                put(missiles+i*0x80+0x50,'<Q',t['target'])
                put(missiles+i*0x80+0x74,'<f',t['power']);put(missiles+i*0x80+0x79,'<B',int(t['consumed']))
            sp=stack+0x18008;put(sp,'<Q',pe.image_base)
            u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,0)
            u.emu_start(0x14594cdc0,pe.image_base,count=100000)
            assert u.reg_read(r.UC_X86_REG_RIP)==pe.image_base
            selected=u.reg_read(r.UC_X86_REG_RDX) if u.reg_read(r.UC_X86_REG_RAX)&1 else None
            assert model(current,definition)==selected,(current['name'],kind,model(current,definition),selected)
            cases.append(dict(input=current,selected=selected))
    OUT.mkdir(parents=True,exist_ok=True)
    result=dict(target_sha256=SHA,owner='docs/analysis/evidence/0.105.0/power-scaling/pet-tick/helpers-manifest.json#special-target',
                method='Unchanged original selector instructions in Unicorn with actual PE jump table and constants.',
                seams=['Supplied ordered radius-query results; no terrain/network/game process.'],cases=cases)
    retained=ROOT/'docs/analysis/evidence/0.105.0/demon-actors/native-target-cases.json'
    if args.check:
        assert json.loads(retained.read_text())==result,'retained selector vectors drift'
    else:(OUT/'native-target-cases.json').write_text(json.dumps(result,indent=2)+'\n')
    critical_cases=[]
    f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
    bits=lambda v:struct.unpack('<I',struct.pack('<f',v))[0]
    seeds=[0x123456789abcdef0,0x23456789abcdef01,0x3456789abcdef012,0x456789abcdef0123]
    mask=(1<<64)-1;total=(seeds[0]+seeds[3])&mask
    draw=((((total<<23)&mask)|(total>>41))+seeds[0])&mask
    draw=f32((draw>>40)/2**24)
    defs=json.loads((ROOT/'docs/analysis/evidence/0.105.0/pet-creation/definitions.json').read_text())['definitions']
    for kind in range(1,9):
      for rank in range(4):
       for health in [5.,75.]:
        for agony in [0,2]:
            u.mem_write(mem,bytes(0x40000));u.mem_write(stack,bytes(0x20000))
            definition=next(row for row in defs if row['special']==kind)
            at=pe.rva_offset(int(definition['address'],16)-pe.image_base)
            u.mem_write(definitions,data[at:at+0x40]);put(game+0xd0,'<QQ',pets,1)
            put(pets+0x18,'<Q',definitions);put(pets+0x6c,'<f',1.25)
            put(game+0x560,'<QQ',actors,1);put(actors+0x88,'<Q',51)
            put(actors+8,'<QQ',statuses,agony);put(actors+0xf0,'<2f',health,100.)
            for i in range(agony):put(statuses+i*0x30+0x10,'<I',980)
            put(game+0x778,'<QQ',mem+0x6000,2)
            put(mem+0x6000,'<B3xfB3xf',17,.25,29,.1)
            put(game+0x7a8,'<QQ',mem+0x7000,1);put(mem+0x7000,'<BB',30,rank)
            put(game+0x378,'<QQ',mem+0x8000,1);put(mem+0x8000,'<I3f',10,.3,0,0)
            put(mem+0x8010,'<f',11.)
            put(game+0x9ec,'<f',10.);put(game+0x4b8,'<f',.4)
            put(game+0x484,'<2f',.2,2.);put(game+0x4c4,'<f',.2);put(game+0x498,'<f',.075)
            put(game+0x958,'<4Q',*seeds)
            sp=stack+0x18008;put(sp,'<Q',pe.image_base)
            u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,game)
            u.reg_write(r.UC_X86_REG_RDX,0);u.reg_write(r.UC_X86_REG_R9,51);u.reg_write(r.UC_X86_REG_XMM2,bits(17.5))
            u.emu_start(0x145950e90,pe.image_base,count=100000)
            assert u.reg_read(r.UC_X86_REG_RIP)==pe.image_base
            power_bits=u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff
            critical=bool(u.reg_read(r.UC_X86_REG_RAX)&1)
            empowerment=f32(f32(.3)*f32(f32(.4)+1.))
            multiplier=f32(f32(1.25*f32(f32(.25+1.)+empowerment))*f32(1.3))
            chance=f32(f32(.2)+f32(.1))
            if kind==3:multiplier=f32(multiplier*f32(f32(f32(.2)+1.)+f32(f32(.075)*2.)))
            if kind==2:
                if rank:multiplier=f32(multiplier*f32(f32(f32(f32(1.-f32(health/100.))*100.)*f32([.0075,.015,.03][rank-1]))+1.))
                if agony:multiplier=f32(multiplier*f32(1.3));chance=f32(chance+f32(agony*.25))
            model_critical=min(chance,1.)>draw
            model_power=f32(17.5*multiplier)
            if model_critical:model_power=f32(model_power*2.)
            assert (bits(model_power),model_critical)==(power_bits,critical),(kind,rank,health,agony,power_bits,bits(model_power))
            critical_cases.append(dict(kind=kind,rank=rank,health=health,agony=agony,draw_bits=bits(draw),power_bits=power_bits,critical=critical))
    critical_result=dict(target_sha256=SHA,owner='docs/analysis/evidence/0.105.0/game-mode-audit/native-manifest.json#demon-crit',
        input=dict(base=17.5,power_multiplier=1.25,demon_damage=.25,demon_crit=.1,aura10=.3,buff_bonus=.4,health_bonus=.2,armor=.075,player_crit=.2,critical_multiplier=2.),
        method='Unchanged original complete critical/power helper in Unicorn; actual PE constants; preserved Win64 inputs.',cases=critical_cases)
    retained=ROOT/'docs/analysis/evidence/0.105.0/demon-actors/native-critical-cases.json'
    if args.check:assert json.loads(retained.read_text())==critical_result,'retained critical vectors drift'
    else:(OUT/'native-critical-cases.json').write_text(json.dumps(critical_result,indent=2)+'\n')
    phase='bounce';bounce_cases=[];frame=stack+0x8000
    for gear_present in [False,True]:
      for count in [0,1,2,4]:
        current=dict(gear_present=gear_present,count=count,multiplier=.3,ordered=[52,53])
        u.mem_write(mem,bytes(0x40000));u.mem_write(stack,bytes(0x20000))
        definition=next(row for row in defs if row['special']==7)
        at=pe.rva_offset(int(definition['address'],16)-pe.image_base);u.mem_write(definitions,data[at:at+0x40])
        put(game+0x560,'<QQ',actors,1);put(actors+0x88,'<Q',51);put(actors+0x118,'<3f',2.,3.,4.)
        put(game+0x9ec,'<f',10.);put(game+0x5d0,'<QQQ',100,mem+0x34000,0)
        put(frame+0x378,'<Q',game);put(frame+0x360,'<Q',0xf130002532000001)
        put(frame+0x370,'<Q',game+0x140);put(frame+0x350,'<Q',game+0x5d0);put(frame+0x208,'<Q',game+0x169)
        u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,stack+0x18000)
        u.reg_write(r.UC_X86_REG_R14,definitions);u.reg_write(r.UC_X86_REG_RBX,51)
        u.reg_write(r.UC_X86_REG_XMM7,0);u.reg_write(r.UC_X86_REG_XMM8,bits(100.))
        bounce_hits.clear();bounce_packets.clear()
        u.emu_start(0x14590a838,0,count=100000)
        assert u.reg_read(r.UC_X86_REG_RIP)==0x14590a710
        expected=min(count,2) if gear_present else 0
        assert len(bounce_hits)==len(bounce_packets)==expected
        for row in bounce_hits:
            assert row['spell']==686 and row['caption']=='Shadow Cleave' and row['source_kind']==2
            assert row['power_bits']==bits(f32(100.*f32(.3))) and not row['critical'],row
            assert row['descriptor']==definitions
        assert all(row['spell']==27383 and row['source']==0xf130002532000001 for row in bounce_packets)
        bounce_cases.append(dict(input=current,hits=list(bounce_hits),packets=list(bounce_packets)))
    bounce_result=dict(target_sha256=SHA,owner=dict(start='0x14590a838',end_exclusive='0x14590acc6'),
        method='Unchanged native post-primary-impact tick tail in Unicorn; current gear lookup/query/packet/canonical hit owners are intercepted.',
        limitations=['The preceding launch-marker branch is statically traced; this cohort begins after its admission.',
                     'Query candidates are supplied; primary damage/death has already completed before the tested tail.'],cases=bounce_cases)
    retained=ROOT/'docs/analysis/evidence/0.105.0/demon-actors/native-bounce-cases.json'
    if args.check:assert json.loads(retained.read_text())==bounce_result,'retained bounce vectors drift'
    else:(OUT/'native-bounce-cases.json').write_text(json.dumps(bounce_result,indent=2)+'\n')
    phase='visual';visual_cases=[]
    for kind,visual_id in [(1,6996),(7,27383)]:
        u.mem_write(mem,bytes(0x40000));u.mem_write(stack,bytes(0x20000))
        definition=next(row for row in defs if row['special']==kind)
        at=pe.rva_offset(int(definition['address'],16)-pe.image_base);u.mem_write(definitions,data[at:at+0x40])
        source=0xf130000000000000|(definition['entry']<<24)|1
        put(game+0xd0,'<QQ',pets,1);put(pets+0x18,'<QQ',definitions,source)
        put(game+0x5d0,'<QQQ',100,mem+0x34000,0);put(ids,'<3Q',51,52,53)
        sp=stack+0x18008;put(sp,'<Q',pe.image_base);put(sp+0x28,'<Q',3);put(sp+0x30,'<I',visual_id)
        u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,0)
        u.reg_write(r.UC_X86_REG_R8,51);u.reg_write(r.UC_X86_REG_R9,ids)
        visual_packets.clear();u.emu_start(0x145950ab0,pe.image_base,count=10000)
        assert u.reg_read(r.UC_X86_REG_RIP)==pe.image_base
        assert visual_packets==[dict(source=source,spell=definition['spell_id'],hits=[]),dict(source=source,spell=visual_id,hits=[51,52,53])]
        visual_cases.append(dict(kind=kind,packets=list(visual_packets)))
    visual_result=dict(target_sha256=SHA,owner='0x145950ab0..0x145950c36',
        method='Unchanged shared native Imp/Doomguard packet producer in Unicorn; packet serializer is intercepted to capture its arguments.',cases=visual_cases)
    retained=ROOT/'docs/analysis/evidence/0.105.0/demon-actors/native-visual-cases.json'
    if args.check:assert json.loads(retained.read_text())==visual_result,'retained visual vectors drift'
    else:(OUT/'native-visual-cases.json').write_text(json.dumps(visual_result,indent=2)+'\n')
    print(f'{len(cases)} native special-demon selector cases recorded; game not launched')
    print(f'{len(critical_cases)} native special-demon power/critical cases checked')
    print(f'{len(bounce_cases)} native Doomguard post-impact bounce cases checked')
    print(f'{len(visual_cases)} native Imp/Doomguard two-packet visual cases checked')

if __name__=='__main__':main()

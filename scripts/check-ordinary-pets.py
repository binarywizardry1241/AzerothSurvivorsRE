#!/usr/bin/env python3
"""Replay current ordinary-pet control flow with explicit query/attack seams."""
from script_sources import load_script
import argparse,hashlib,importlib.util,json,math,struct,sys
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
SHA='e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048'
KEPT=ROOT/'docs/analysis/evidence/ordinary-pets';STAGE=ROOT/'runtime/analysis/staging/native-evidence/ordinary-pets'
def dump(x):return json.dumps(x,indent=2,allow_nan=False)+'\n'
def weapon_cases(pe):
    u, r, mem, stack, done = historical.machine(pe)
    from unicorn import UC_HOOK_CODE
    game, stats, targets, packets = [mem + a for a in (0x1000, 0x3000, 0x5000, 0x6000)]
    bp, sp = stack + 0x8000, stack + 0x7000
    context = {}

    def put(a, fmt, *v):
        u.mem_write(a, struct.pack(fmt, *v))

    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))

    def low(reg):
        return u.reg_read(reg) & 0xffffffff

    def ret():
        rsp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, get(rsp, '<Q')[0])
        u.reg_write(r.UC_X86_REG_RSP, rsp + 8)

    def hook(_, address, size, unused):
        if address == 0x1458f761b or address == done:
            u.emu_stop()
        elif address == 0x1459261a0 and context['kind'] == 'stage':
            context['calls'].append('query')
            context['radius_bits'] = low(r.UC_X86_REG_XMM3)
            count = int(context['target'])
            put(u.reg_read(r.UC_X86_REG_RCX), '<3Q', count, targets, count)
            put(targets, '<Q', 77)
            ret()
        elif address == 0x1458bfe80:
            rsp = u.reg_read(r.UC_X86_REG_RSP)
            context['calls'].append('melee')
            context['melee'] = dict(source=u.reg_read(r.UC_X86_REG_RDX),
                                   target=u.reg_read(r.UC_X86_REG_R8),
                                   amount=u.reg_read(r.UC_X86_REG_R9) & 0xffffffff,
                                   critical=bool(get(rsp + 0x28, '<B')[0]))
            put(u.reg_read(r.UC_X86_REG_RCX), '<4Q', 0, 8, 0, 0)
            ret()
        elif address == 0x1459399b0:
            rsp = u.reg_read(r.UC_X86_REG_RSP)
            context['calls'].append('hit')
            context['hit'] = dict(target=u.reg_read(r.UC_X86_REG_RDX),
                                 power_bits=low(r.UC_X86_REG_XMM2),
                                 spell=u.reg_read(r.UC_X86_REG_R9) & 0xffffffff,
                                 school=get(rsp + 0x28, '<B')[0],
                                 critical=bool(get(rsp + 0x30, '<B')[0]),
                                 suppress_log=bool(get(rsp + 0x38, '<B')[0]))
            # A synchronous proc may refresh cooldown before the timer write.
            put(game + 0x490, '<I', context['cooldown_after_bits'])
            ret()
        elif address == 0x1400021d0:
            ret()  # Supplied query storage has no allocator ownership.
        elif not (0x1458f7312 <= address < 0x1458f761b or 0x1458f84ab <= address < 0x1458f84d1):
            raise AssertionError('Unreviewed weapon flow ' + hex(address))

    u.hook_add(UC_HOOK_CODE, hook)

    def reset(kind):
        u.mem_write(mem, bytes(0x400000))
        u.mem_write(stack, bytes(0x10000))
        context.clear()
        context.update(kind=kind, calls=[], allocation=mem + 0x10000)
        u.reg_write(r.UC_X86_REG_RBP, bp)
        u.reg_write(r.UC_X86_REG_RSP, sp)
        u.reg_write(r.UC_X86_REG_R13, game)

    def stage(case):
        reset('stage')
        context.update(case)
        put(game + 0x31c, '<B', case['class'])
        put(game + 0x548, '<I', case['remaining_bits'])
        put(game + 0x800, '<2Q', stats, len(case['stats']))
        for i, (tag, value) in enumerate(case['stats']):
            put(stats + i * 8, '<II', tag, value)
        put(game + 0x470, '<Q', 1)
        put(game + 0x48c, '<4I', case['damage_bits'], case['cooldown_before_bits'],
            case['chance_bits'], case['critical_multiplier_bits'])
        put(game + 0x9c0, '<4Q', *case['rng_before'])
        put(game + 0x628, '<3Q', 8, packets, 0)
        u.reg_write(r.UC_X86_REG_XMM6, case['delta_bits'])
        u.emu_start(0x1458f732d, 0x1458f761b, count=20000)
        assert u.reg_read(r.UC_X86_REG_RIP) == 0x1458f761b
        return dict(**case, calls=context['calls'], radius_bits=context.get('radius_bits'),
                    melee=context.get('melee'), hit=context.get('hit'),
                    remaining_after_bits=get(game + 0x548, '<I')[0],
                    rng_after=list(get(game + 0x9c0, '<4Q')))

    cases = []
    base = dict(remaining_bits=historical.bits(0.), delta_bits=historical.bits(.1), stats=[], target=True,
                damage_bits=historical.bits(1.), cooldown_before_bits=historical.bits(1.), cooldown_after_bits=historical.bits(1.),
                chance_bits=historical.bits(0.), critical_multiplier_bits=historical.bits(2.), rng_before=[1, 2, 3, 4])
    for cls in range(13):
        cases.append(stage(dict(base, name=f'class_{cls}', **{'class': cls})))
    for name, replacement in [
        ('rank_scaling', dict(stats=[(16, historical.bits(.05 * 5)), (17, historical.bits(100.)), (16, historical.bits(.04 * 5))], damage_bits=historical.bits(1.3))),
        ('ordered_cancellation', dict(stats=[(16, historical.bits(16777216.)), (16, historical.bits(1.)), (16, historical.bits(-16777216.))])),
        ('critical', dict(chance_bits=historical.bits(1.), critical_multiplier_bits=historical.bits(2.5), rng_before=[0x8000000000000001, 2, 3, 4])),
        ('critical_equal', dict(chance_bits=historical.bits(0.))),
        ('critical_nan', dict(chance_bits=0x7fc00000)),
        ('no_target', dict(target=False, remaining_bits=historical.bits(.04))),
        ('held', dict(remaining_bits=historical.bits(.5))),
        ('exact_due', dict(remaining_bits=historical.bits(.1))),
        ('nan_timer', dict(remaining_bits=0x7fc00000)),
        ('negative_power', dict(stats=[(16, historical.bits(-2.))])),
        ('nan_power', dict(stats=[(16, 0x7fc00000)])),
        ('saturated_power', dict(damage_bits=historical.bits(1.e20))),
        ('post_hit_cooldown', dict(cooldown_before_bits=historical.bits(.81), cooldown_after_bits=historical.bits(.25))),
        ('nan_cooldown', dict(cooldown_after_bits=0x7fc00000)),
        ('negative_cooldown', dict(cooldown_after_bits=historical.bits(-1.))),
    ]:
        cases.append(stage(dict(base, name=name, **{'class': 1}, **replacement)))

    return cases

def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
 global historical
 historical = load_script('historical_weapon_harness', ROOT/'scripts/recover-weapon-power.py')
 t=latest_target(verify=True);assert t['sha256']==SHA;d=target_bytes(t)
 sp=importlib.util.spec_from_file_location('pe',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(sp);sp.loader.exec_module(m);pe=m.PE(d)
 sys.path[:0]=[str(ROOT/'runtime/tool-state/python/armory/python-libs'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
 import unicorn.x86_const as r
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 u=Uc(UC_ARCH_X86,UC_MODE_64);size=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections);u.mem_map(pe.image_base,(size+4095)&~4095)
 for s in pe.sections:u.mem_write(pe.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
 mem,stack=0x200000000,0x300000000;u.mem_map(mem,0x30000);u.mem_map(stack,0x10000)
 game,pet,definition=mem,mem+0x2000,mem+0x3000;actors,ids=mem+0x4000,mem+0x20000;frame=stack+0x8000
 def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
 def get(a,f):return struct.unpack('<'+f,u.mem_read(a,struct.calcsize('<'+f)))
 def xf(reg):return struct.unpack('<f',u.reg_read(reg).to_bytes(16,'little')[:4])[0]
 def sx(reg,v):u.reg_write(reg,struct.unpack('<I',struct.pack('<f',v))[0])
 def ret():
  sp=u.reg_read(r.UC_X86_REG_RSP);a=get(sp,'Q')[0];u.reg_write(r.UC_X86_REG_RSP,sp+8);u.reg_write(r.UC_X86_REG_RIP,a)
 current={};result={};gate_stops=set();cooldown_phase=False;power_phase=False;sample_bits=0;impact_phase=False;pending_phase=False
 def hook(_,a,n,unused):
  if pending_phase:
   if a==0x1459399b0:
    result['damage_calls'].append(dict(power_bits=u.reg_read(r.UC_X86_REG_XMM2)&0xffffffff,target_guid=u.reg_read(r.UC_X86_REG_RDX),spell_id=u.reg_read(r.UC_X86_REG_R9),suppress_damage_log=bool(get(u.reg_read(r.UC_X86_REG_RSP)+0x38,'B')[0])));ret();return
   if a==0x145925500:
    tag,value,duration=get(u.reg_read(r.UC_X86_REG_R8),'I2f');result['status_calls'].append(dict(tag=tag,value=value,duration=duration,target_guid=u.reg_read(r.UC_X86_REG_RDX),power_bits=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff));ret();return
  if cooldown_phase:
   assert 0x145954780<=a<0x145954a20,hex(a)
   return
  if a in gate_stops:u.emu_stop();return
  if power_phase and a in (0x14592cfb9,0x14592c3c0):u.reg_write(r.UC_X86_REG_XMM14,sample_bits)
  if a==0x14592ddc3:u.emu_stop();return
  if a in [0x145c051d7,0x145c051d1]:
   v=xf(r.UC_X86_REG_XMM0);sx(r.UC_X86_REG_XMM0,math.cos(v)if a==0x145c051d7 else math.sin(v));ret();return
  if a==0x1459348e0:
   result['movement']=dict(destination=[xf(r.UC_X86_REG_XMM2),xf(r.UC_X86_REG_XMM3)],speed=get(u.reg_read(r.UC_X86_REG_RSP)+0x28,'f')[0]);ret();return
  if a==0x1459261a0:
   out=u.reg_read(r.UC_X86_REG_RCX);result['query_radius']=xf(r.UC_X86_REG_XMM3);c=current['ordered_candidate_ids']
   for i,g in enumerate(c):put(ids+i*8,'Q',g)
   put(out,'3Q',0,ids,len(c));ret();return
  if a==0x145954780:sx(r.UC_X86_REG_XMM0,current['period']);result['attack']=get(pet+0x28,'Q')[0];ret();return
  if a==0x14592b483:u.reg_write(r.UC_X86_REG_RIP,0x14592d46e);return
  if a==0x14592b9d9:u.reg_write(r.UC_X86_REG_RIP,0x14592da16);return
  if a in (0x1400021d0,0x145927fa0):ret();return
  if not (0x145929f40<=a<0x14592e0e8 or pending_phase and 0x1458fb585<=a<=0x1458fb6e3):raise AssertionError('Unreviewed flow '+hex(a))
 u.hook_add(UC_HOOK_CODE,hook)
 old=json.loads((ROOT/'docs/analysis/evidence/power-scaling/pet-tick/native-tick.json').read_text())['cases'];cases=[]
 for row in old:
  current=row['input'];result=dict(movement=None,attack=None,query_radius=None);u.mem_write(mem,bytes(0x30000));u.mem_write(stack,bytes(0x10000))
  put(game+0xd0,'2Q',pet,1);put(game+0x49c,'f',current['player_speed_multiplier']);put(game+0x4d8,'3f',*current['player_position']);put(game+0x570,'2Q',actors,len(current['targets']));put(game+0xa54,'f',current['now'])
  put(definition+0x2c,'2fI',12.,current['period'],116 if current['ranged']else 0);put(pet+0x18,'3Q',definition,33,current['target_guid']or 0)
  v=current['motion'];put(pet+0x40,'10f',*v['from_'],*v['to'],v['started_at'],v['duration'],current['next_attack'],current['next_update'])
  for i,target in enumerate(current['targets']):
   a=actors+i*0x1d8;v=target['motion'];put(a+0x18,'Q',0 if target['priority']&2 else 0xffffffffffffffff);put(a+0xb0,'I',0 if target['retained_target_eligible']else 1);put(a+0xf0,'Q',target['guid']);put(a+0x174,'8f',*v['from_'],*v['to'],v['started_at'],v['duration']);put(a+0x1d0,'B',target['priority']&1)
  u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,stack+0x1000);u.emu_start(0x14592b077,0,count=100000)
  assert u.reg_read(r.UC_X86_REG_RIP)==0x14592ddc3
  result['next_attack'],result['next_update']=get(pet+0x60,'2f');result['target_guid']=get(pet+0x28,'Q')[0]or None;result['processed']=result['next_update']!=struct.unpack('<f',struct.pack('<f',current['next_update']))[0]
  assert result==row['output'],(current['name'],result,row['output']);cases.append(dict(input=current,output=result))
 # Direct current deadline predicates, including unordered inputs. Outer JA and
 # ranged JAE deliberately have different NaN behavior.
 gates=[]
 for now in [0.,1.,float('nan'),float('inf')]:
  for deadline in [0.,1.,float('nan'),float('inf')]:
   for kind,a,end,taken,reg in [('update',0x14592b16b,0x14592b177,0x14592b139,r.UC_X86_REG_XMM9),('ranged-attack',0x14592b2f5,0x14592b301,0x14592b3be,r.UC_X86_REG_XMM9)]:
    put(pet+(0x64 if kind=='update'else 0x60),'f',deadline);u.reg_write(r.UC_X86_REG_RAX,pet);u.reg_write(r.UC_X86_REG_RDI,0);sx(reg,now)
    # Run only the compare and branch, independently of the caller fixture hook.
    gate_stops={end,taken};u.emu_start(a,0,count=10);ip=u.reg_read(r.UC_X86_REG_RIP)
    expected=deadline>now if kind=='update'else now>=deadline
    assert (ip==taken)==expected,(kind,now,deadline,hex(ip));gates.append(dict(kind=kind,now_bits=struct.unpack('<I',struct.pack('<f',now))[0],deadline_bits=struct.unpack('<I',struct.pack('<f',deadline))[0],branch_taken=expected))
 gate_stops=set();cooldown_phase=True;cooldowns=[]
 for period in [1.2,2.2]:
  for cooldown in [.1,.5,1.,2.]:
   put(game+0xd0,'2Q',pet,1);put(game+0x490,'f',cooldown);put(pet+0x18,'Q',definition);put(definition+0x30,'f',period);put(definition+0x39,'B',0)
   put(stack+0x8008,'Q',mem+0x2f000);u.reg_write(r.UC_X86_REG_RSP,stack+0x8008);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,0);u.emu_start(0x145954780,mem+0x2f000,count=1000)
   actual=xf(r.UC_X86_REG_XMM0);expected=struct.unpack('<f',struct.pack('<f',period))[0];assert actual==expected
   cooldowns.append(dict(period=expected,cooldown=cooldown,result=actual))
 cooldown_phase=False
 # Fresh current melee and ranged stat17 arithmetic, with a supplied crit draw.
 power_phase=True;power_cases=[]
 old_power=json.loads((ROOT/'docs/analysis/evidence/power-scaling/pet-power/native-power.json').read_text())['cases']
 for v in old_power:
  u.mem_write(mem,bytes(0x30000));put(game+0x800,'2Q',ids,len(v['rows']));put(game+0x4e8,'I',v['level']);put(game+0x48c,'I',v['damage_bits']);put(game+0x494,'2I',v['chance_bits'],v['critical_multiplier_bits']);put(game+0x9c0,'4Q',1,2,3,4)
  put(definition+0x2c,'I',v['base_bits']);put(pet+0x20,'Q',33);put(frame+0x118,'Q',definition)
  for i,(tag,value)in enumerate(v['rows']):put(ids+i*8,'2I',tag,value)
  sample_bits=v['draw_bits'];u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_R13,pet);u.reg_write(r.UC_X86_REG_RSP,stack+0x1000);sx(r.UC_X86_REG_XMM7,0.)
  gate_stops={0x14592d94c};u.emu_start(0x14592cf08,0,count=10000);melee=u.reg_read(r.UC_X86_REG_XMM13)&0xffffffff;assert melee==v['power_bits'],(v,hex(melee))
  u.reg_write(r.UC_X86_REG_R15,definition);gate_stops={0x14592ce5f};u.emu_start(0x14592c320,0,count=10000);normal=u.reg_read(r.UC_X86_REG_XMM13)&0xffffffff;critical=u.reg_read(r.UC_X86_REG_XMM12)&0xffffffff
  assert (normal,critical)==(v['ranged_power_bits'],v['ranged_critical_bits'])
  power_cases.append(dict(input=v,melee_bits=melee,ranged_bits=normal,ranged_critical_bits=critical))
 power_phase=False;priorities=[];gate_stops={0x14592b604}
 for metadata in [False,True]:
  for flag in [0,1,2,3,4,255]:
   put(actors+0x18,'Q',0 if metadata else 0xffffffffffffffff);put(actors+0x1d0,'B',flag);u.reg_write(r.UC_X86_REG_RAX,actors);u.reg_write(r.UC_X86_REG_RCX,0);u.emu_start(0x14592b5f2,0,count=10);actual=u.reg_read(r.UC_X86_REG_RDX)&255;assert actual==(int(metadata)*2|flag)
   priorities.append(dict(metadata=metadata,flag=flag,result=actual))
 gate_stops=set()
 # Frostbolt's current travel-time selection and all pending-row stores.
 impacts=[];impact_phase=True;gate_stops={0x14592dc90};pending_rows=mem+0x23000
 for v in json.loads((ROOT/'docs/analysis/evidence/power-scaling/pet-tick/native-tick.json').read_text())['impact_cases']:
  put(definition+0x34,'I',116);put(definition+0x38,'B',4);put(game+0xa54,'f',v['now']);put(game+0x5e0,'3Q',64,pending_rows,0)
  u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,stack+0x1000);u.reg_write(r.UC_X86_REG_R15,definition);u.reg_write(r.UC_X86_REG_R13,definition);u.reg_write(r.UC_X86_REG_R12,51);u.reg_write(r.UC_X86_REG_R8,116)
  for reg,point in [(r.UC_X86_REG_XMM10,v['target']),(r.UC_X86_REG_XMM1,v['from_'])]:u.reg_write(reg,int.from_bytes(struct.pack('<4f',*point[:2],0.,0.),'little'))
  for reg,value in [(r.UC_X86_REG_XMM13,250.),(r.UC_X86_REG_XMM12,375.),(r.UC_X86_REG_XMM14,0.),(r.UC_X86_REG_XMM15,0.)]:sx(reg,value)
  u.emu_start(0x14592db5b,0,count=1000);tag,value,duration=get(pending_rows+0x60,'I2f');critical,player,overcast,school=get(pending_rows+0x78,'4B')
  actual=dict(now=v['now'],from_=v['from_'],target=v['target'],impact_at=get(pending_rows+0x6c,'f')[0],effect_tag=tag,effect_value=value,effect_duration=duration,critical=bool(critical),damages_player=bool(player),overcast=bool(overcast),school=school);assert actual==v,(actual,v);impacts.append(actual)
 impact_phase=False;pending_phase=True;gate_stops={0x1458fb6e3};pending_gates=[]
 for v in json.loads((ROOT/'docs/analysis/evidence/power-scaling/pet-tick/native-tick.json').read_text())['pending_gate_cases']:
  result=dict(damage_calls=[],status_calls=[]);put(frame+0x350,'Q',game+0x4f0);put(frame+0x438,'Q',game);put(frame+0x11b,'B',4);put(frame+0x100,'I2f',1,.3,2.);put(frame+0xb0,'B',0)
  u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,stack+0x1000);u.reg_write(r.UC_X86_REG_RAX,0);u.reg_write(r.UC_X86_REG_RDI,51);u.reg_write(r.UC_X86_REG_RBX,116);u.reg_write(r.UC_X86_REG_XMM7,v['power_bits']);sx(r.UC_X86_REG_XMM10,0.);u.emu_start(0x1458fb585,0,count=1000)
  actual=dict(power_bits=v['power_bits'],**result);assert actual==v,(actual,v);pending_gates.append(actual)
 pending_phase=False;gate_stops=set()
 # Verify every ordinary descriptor field against its live source declaration.
 descriptors=[];catalog=(ROOT/'crates/azeroth-survivors-re/src/run_effects/pets.rs').read_text()
 import re
 for key,a in [('wolf',0x147242548),('raptor',0x147242598),('treant',0x1472425e0),('spirit_wolf',0x147225318),('water_elemental',0x1472424b8)]:
  o=pe.rva_offset(a-pe.image_base);v=d[o:o+64];block=next(b for b in catalog.split('PetDefinition {')if 'key: "'+key+'"'in b)
  def field(n):return int(re.search(r'\b'+n+r': (\d+)',block)[1])
  def fbits(n):return int(re.search(n+r': f32::from_bits\((0x[0-9a-f]+)\)',block)[1],16)
  actual=struct.unpack_from('<6I2B',v,32);expected=tuple(field(n)for n in ['entry','model'])+tuple(fbits(n)for n in ['scale','damage','period'])+tuple(field(n)for n in ['spell_id','school','special']);assert actual==expected,(key,actual,expected)
  descriptors.append(dict(key=key,va=hex(a),byte_count=64,sha256=hashlib.sha256(v).hexdigest(),fields=list(actual)))
 grants=[]
 for key,a,expected in [('tame_beast',0x14722cc70,[0x147242548]),('bestial_wrath',0x14722d170,[0x147242598]),('force_of_nature',0x14723f930,[0x1472425e0]*2),('stormstrike',0x147236fc0,[0x147225318]*2),('water_elemental',0x14723aec8,[0x1472424b8])]:
  def raw(va,n):o=pe.rva_offset(va-pe.image_base);return d[o:o+n]
  p,n=struct.unpack('<2Q',raw(a,16));assert raw(p,n).decode()==key
  p,n=struct.unpack('<2Q',raw(a+48,16));v=raw(p,n*64);actual=[struct.unpack_from('<Q',v,i+8)[0]for i in range(0,len(v),64)if v[i]==29];assert actual==expected
  grants.append(dict(key=key,va=hex(a),effect_va=hex(p),effect_count=n,grants=[hex(x)for x in actual],effects_sha256=hashlib.sha256(v).hexdigest()))
 source=(ROOT/'crates/azeroth-survivors-re/src/run_effects/pet_tick.rs').read_text();assert 'if !(context.now >= state.next_attack)'in source
 adapter=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/pets.rs').read_text();assert '(u8::from(target.has_metadata) * 2)'in adapter and '| raw_flags.get(&target.actor.guid)'in adapter
 assert 'self.pet_state.grants.iter().copied().enumerate()'in adapter and 'pet_power::attack_power('in adapter and 'normal_ranged_impact_at('in adapter
 rows=[];asm={};bounds={a+pe.image_base:b+pe.image_base for a,b,_ in pe.functions()};md=Cs(CS_ARCH_X86,CS_MODE_64)
 for role,a in [('pet-tick',0x145929f40),('movement',0x1459348e0),('cooldown',0x145954780),('target-query',0x1459261a0),('expired-pet-cleanup',0x145927fa0),('creation',0x145929010),('weapon-stage',0x1458f7312),('weapon-no-target',0x1458f84ab),('pending-gate',0x1458fb585)]:
  b={0x1458f7312:0x1458f761b,0x1458f84ab:0x1458f84d1,0x1458fb585:0x1458fb6e3}.get(a) or bounds[a];o=pe.rva_offset(a-pe.image_base);v=d[o:o+b-a];asm[role+'.asm']=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in md.disasm(v,a));rows.append(dict(role=role,va=hex(a),byte_count=len(v),file_offset=hex(o),sha256=hashlib.sha256(v).hexdigest(),assembly=role+'.asm'))
 weapons=json.loads(json.dumps(weapon_cases(pe)))
 previous=json.loads((ROOT/'docs/analysis/evidence/power-scaling/weapon/native-fixtures.json').read_text())['swings']
 for a,b in zip(weapons,previous):assert a==b,(a['name'],{k:(a.get(k),b.get(k))for k in set(a)|set(b)if a.get(k)!=b.get(k)})
 record=dict(target_sha256=SHA,pet_power_cases=[dict(fixture_index=i,**{k:v[k]for k in ["melee_bits","ranged_bits","ranged_critical_bits"]})for i,v in enumerate(power_cases)],impact_cases=impacts,pending_gate_cases=pending_gates,priority_cases=priorities,weapon_cases=[dict(fixture_index=i,**{k:v[k]for k in ["calls","radius_bits","melee","hit","remaining_after_bits","rng_after"]})for i,v in enumerate(weapons)],cases=[dict(fixture_index=i,output=v["output"])for i,v in enumerate(cases)],deadline_cases=gates,ordinary_cooldown_cases=cooldowns,ordinary_descriptors=descriptors,ordinary_grants=grants,target_process_launched=False,compilation='not_run',parity='unverified')
 manifest=dict(target_sha256=SHA,input_fixtures=[dict(path=n,sha256=hashlib.sha256((ROOT/n).read_bytes()).hexdigest())for n in ["docs/analysis/evidence/power-scaling/weapon/native-fixtures.json","docs/analysis/evidence/power-scaling/pet-tick/native-tick.json","docs/analysis/evidence/power-scaling/pet-power/native-power.json"]],ranges=rows,native_case_count=len(cases)+len(gates)+len(weapons)+len(cooldowns)+len(power_cases)*2+len(priorities)+len(impacts)+len(pending_gates),limits=['Pet controls use supplied ordered target queries, movement and period seams; separate power cases supply critical samples. Weapon cases execute current RNG with packet/hit seams.','Impact cases execute travel and pending-row stores. Pending gates execute prepared captured contexts and intercept final hit/status calls; arbitrary proc/context lifecycles are not executed.','No Rust execution, compilation, MPQ/client/game/platform or parity check.'])
 if args.write:
  STAGE.mkdir(parents=True,exist_ok=True)
  for n,s in asm.items():(STAGE/n).write_text(s)
  (STAGE/'manifest.json').write_text(dump(manifest));(STAGE/'native-tick.json').write_text(dump(record))
 else:
  assert json.loads((KEPT/'manifest.json').read_text())==manifest;assert json.loads((KEPT/'native-tick.json').read_text())==record
  for n,s in asm.items():assert (KEPT/n).read_text()==s
 print('Current weapons/pets:',len(weapons),'weapon,',len(cases),'pet tick,',len(gates),'deadline,',len(cooldowns),'ordinary cooldown,',len(power_cases)*2,'power,',len(priorities),'priority,',len(impacts),'impact,',len(pending_gates),'pending cases; five descriptors/grants; no build/game/parity.')
if __name__=='__main__':main()

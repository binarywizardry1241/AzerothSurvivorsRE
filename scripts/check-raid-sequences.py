#!/usr/bin/env python3
"""Check current native18/24 producers and live shared raid ports; no builds/game."""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path
from coverage_common import ROOT

SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RANGES={'sequence':(0x1459592f4,0x145959449),'drifting-circles':(0x145959ceb,0x14595a082),
 'whirlwind-speed':(0x145979234,0x145979258),'whirlwind-melee':(0x14597adf8,0x14597ae2d),
 'pull-dispatch':(0x145959a10,0x145959aa1),'pull-resolution':(0x14594e993,0x14594ea43),
 'pull-teleport':(0x14594edf2,0x14594f181),'minions':(0x14595914b,0x1459592f4),'weakened-warning':(0x14595345c,0x145953497),'actor-periodic-consume':(0x14597bec5,0x14597bf18),'actor-raid-consume':(0x14597c4bb,0x14597c56c)}

def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
 mod = load_script('sequence_inputs', ROOT/'scripts/recover-raid-actions.py');target,raw,span,_,_=mod.recover();assert target['sha256']==SHA
 catalog=json.loads((ROOT/'docs/analysis/evidence/0.109.0/raid-native/catalog.json').read_text());assert catalog['target_sha256']==SHA
 selected=[(i,row)for i,row in enumerate(catalog['actions'])if row['native_tag']in[18,24]]
 sys.path[:0]=[str(ROOT/'runtime/tool-state/python/armory/python-libs'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
 from unicorn import x86_const as r
 md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
 game,record,frame,stack,queue,hazards=(0x71000000,0x71010000,0x71020000,0x71030000,0x71040000,0x71050000)
 for a in [game,record,frame,stack,queue,hazards]:uc.mem_map(a,0x10000)
 def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
 def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
 def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
 def sx(reg,v):uc.reg_write(reg,bits(v))
 allowed=(0,0);calls=[];stop=0x145957978
 def hook(machine,a,size,user):
  if a==stop:uc.emu_stop();return
  if a in [0x1459578e0,0x1459577f0,0x1458d3d80,0x1458d6f90,0x145bfa11d,0x145bfa117,0x145970560]:
   if a==0x1459578e0:calls.append(bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_R8),48)))
   elif a==0x145970560:calls.append((uc.reg_read(r.UC_X86_REG_RDX),get(uc.reg_read(r.UC_X86_REG_R8),'Ifff')))
   elif a in [0x1458d3d80,0x1458d6f90]:sx(r.UC_X86_REG_XMM0,9.);uc.reg_write(r.UC_X86_REG_RAX,1)
   elif a in [0x145bfa11d,0x145bfa117,0x145970560]:
    import math
    value=struct.unpack('<f',uc.reg_read(r.UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
    sx(r.UC_X86_REG_XMM0,(math.cos if a==0x145bfa11d else math.sin)(value))
   sp=uc.reg_read(r.UC_X86_REG_RSP);dest=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,dest);return
  assert allowed[0]<=a<allowed[1],hex(a)
  ins=next(md.disasm(bytes(uc.mem_read(a,size)),a));assert ins.mnemonic!='call' or int(ins.op_str,16) in [0x1459578e0,0x1459577f0,0x1458d3d80,0x1458d6f90,0x145bfa11d,0x145bfa117,0x145970560],hex(a)
 uc.hook_add(UC_HOOK_CODE,hook);cases=0
 for index,row in selected:
  words=row['words'];tag=row['native_tag'];payload=struct.pack('<12I',*words)
  for now in [0.,10.,100000.]:
   calls.clear();uc.mem_write(record,payload);put(game+0xa34,'f',now);put(game+0x5a0,'QQQ',64,queue,0);put(game+0x588,'QQQ',64,hazards,0)
   put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77);put(frame+0x150,'4f',1.,2.,3.,0.);put(frame+0xd0,'4f',5.,2.,7.,0.);put(frame+0x178,'f',0.)
   uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RCX,record);uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000)
   uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);sx(r.UC_X86_REG_XMM15,now);sx(r.UC_X86_REG_XMM14,10.)
   allowed=RANGES['sequence' if tag==18 else 'drifting-circles'];uc.emu_start(allowed[0],0,count=100000);assert uc.reg_read(r.UC_X86_REG_RIP)==stop
   if tag==18:
    children=row['children'];assert len(calls)==1;first=catalog['actions'][children[0]]
    assert calls[0]==struct.pack('<12I',*first['words']);assert get(game+0x5b0,'Q')[0]==len(children)-1
    spacing=struct.unpack('<f',struct.pack('<I',words[4]))[0]
    for j,child in enumerate(children[1:],1):
     at=queue+(j-1)*64;assert get(at,'Q')[0]==77;assert get(at+8,'f')[0]==f32(f32(j*spacing)+now)
     assert bytes(uc.mem_read(at+16,48))==struct.pack('<12I',*catalog['actions'][child]['words'])
   else:
    import math
    count=max(words[1],1);assert get(game+0x598,'Q')[0]==count
    f=lambda i:struct.unpack('<f',struct.pack('<I',words[i]))[0]
    middle=f32(f32(float(words[1])-1.)*.5)
    for j in range(count):
     at=hazards+j*128;angle=f32(f32(float(j)-middle)*f32(1.2))
     assert get(at+0x10,'I')[0]==3 and get(at+0x30,'I')[0]==0
     assert get(at+0x34,'I')[0]==words[2] and get(at+0x70,'I')[0]==words[3]
     assert get(at+0x14,'f')[0]==f32(f32(now+1.)+f(4));assert get(at+0x54,'f')[0]==f32(now+1.)
     assert get(at+0x60,'f')[0]==f32(10.*f(5));assert get(at+0x18,'f')[0]==.5
     assert get(at+0x40,'f')[0]==f32(f32(f32(math.cos(angle))*3.)+1.)
     assert get(at+0x44,'f')[0]==f32(f32(f32(math.sin(angle))*3.)+2.)
   cases+=1
 # Current minion5 retains the historical semantic count/index/placement
 # contract. The actor constructor remains an explicit live adapter seam.
 import math
 for count in sorted({0,1,2,3,*(row['words'][0] for row in catalog['actions'] if row['native_tag']==5)}):
  calls.clear();put(frame+0x150,'4f',1.,2.,3.,0.);put(game+0x998,'Q',record)
  uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000);uc.reg_write(r.UC_X86_REG_R13D,count)
  allowed=RANGES['minions'];uc.emu_start(0x1459591d6,0,count=100000);assert uc.reg_read(r.UC_X86_REG_RIP)==stop
  assert len(calls)==count
  for index,(enemy,fields) in enumerate(calls):
   assert enemy==int(index%3==2) and fields[0]==1
   angle=f32(f32(index/count)*f32(math.tau))
   assert fields[1:]==(f32(f32(f32(math.cos(angle))*5.)+1.),f32(f32(f32(math.sin(angle))*5.)+2.),9.)
  cases+=1
 assert raw(0x14722ab00,15)==b'Minions, to me!'
 assert raw(0x14722a9e0,15)==b'%s is weakened!'
 # Independent original instructions for the whirlwind multiplier, NaN and strictdeadline.
 for now in [0.,10.,float('nan')]:
  for until in [0.,10.,11.,float('nan')]:
   put(record+0x1c8,'f',until);uc.reg_write(r.UC_X86_REG_R14,record);sx(r.UC_X86_REG_XMM6,now);sx(r.UC_X86_REG_XMM1,2.)
   allowed=RANGES['whirlwind-speed'];end=allowed[1]
   # This fragment has no calls. A separate short engine avoids changing the main hook's stop contract.
   wu=Uc(UC_ARCH_X86,UC_MODE_64);wu.mem_map(0x145979000,4096);wu.mem_write(allowed[0],raw(allowed[0],end-allowed[0]));wu.mem_map(record,4096);wu.mem_write(record+0x1c8,struct.pack('<f',until));wu.mem_map(0x147229000,4096);wu.mem_write(0x147229760,raw(0x147229760,4));wu.reg_write(r.UC_X86_REG_R14,record);wu.reg_write(r.UC_X86_REG_XMM6,bits(now));wu.reg_write(r.UC_X86_REG_XMM1,bits(2.));wu.emu_start(allowed[0],end)
   got=struct.unpack('<f',wu.reg_read(r.UC_X86_REG_XMM2).to_bytes(16,'little')[:4])[0];assert got==f32(2.*f32(1.35)) if now<until else got==2.;cases+=1
 # Trace all live ports and shared queue ordering without treating source
 # text inspection as Rust execution or typechecking.
 base=ROOT/'crates/azeroth-survivors-re/src'
 checks={
  'bosses/raid_sequences.rs':['abilities::dispatch_live(&native_action(first)','effects.raid_areas.lines.ability_at','action.duration'],
  'bosses/abilities.rs':['resolve_due_with_rng','self.raid_areas.lines.take_due','port.raid_context(source, now)','self.raid_areas.tick_elapsed(now, elapsed, port)'],
  'bosses/raid_sequence_areas.rs':['self.push_periodic(row, expires, 0.5, 0.0, f(3))','math.cos(angle)*3.0+c.source.x'],
  'gameplay/mechanics/bosses.rs':['fn raid_context(','fn raid_pull(','fn raid_teleport(','fn raid_transform(','fn raid_spawn_at(','fn apply_raid_post_actions(','wards::heal_source(','raid_transform_fields(index,display,scale)','post_actions.push(RaidPostAction::Expose','self.boss_state.effects.resolve_due_with_rng','RaidWarning::Weakened','pending_actions.extend','fn dispatch_pending_raid_requests('],
  'gameplay/mechanics/actor_frame.rs':['self.boss_state.wards.collect_due(','self.resolve_ward_actions(',],
  'gameplay/mechanics.rs':['self.tick_actor_frame(','self.hit_ward(hit, rng)','self.boss_state.player_override.take()'],
  'enemies/ai.rs':['now < self.whirlwind_until','speed * f32::from_bits(0x3faccccd)'],
 }
 for name,tokens in checks.items():
  source=''.join((base/name).read_text().split())
  for token in tokens:assert ''.join(token.split()) in source,(name,token)
 adapter=(base/'gameplay/mechanics/bosses.rs').read_text()
 assert adapter.index('for (amount, source_guid) in incoming') < adapter.index('self.apply_raid_post_actions(post_actions')
 output=ROOT/('runtime/analysis/staging/native-evidence/0.109.0/raid-sequences'if args.write else'docs/analysis/evidence/0.109.0/raid-sequences')
 if args.write:output.mkdir(parents=True,exist_ok=True)
 ranges=[]
 for role,(a,b)in RANGES.items():
  instructions=list(md.disasm(raw(a,b-a),a));assert sum(i.size for i in instructions)==b-a
  text=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions)
  if args.write:(output/(role+'.asm')).write_text(text)
  else:assert (output/(role+'.asm')).read_text()==text
  ranges.append(dict(role=role,**span(a,b-a),assembly=role+'.asm'))
 manifest=dict(target_version=target['version'],target_sha256=SHA,ranges=ranges,native_cases=cases,actions=[i for i,r in selected],weakened_warning=dict(**span(0x14722a9e0,15),text='%s is weakened!'),target_executed=False,
  limits=['Synthetic original instructions; allocator, nested dispatcher, terrain, trig and spell packets are declared seams.','No compilation, reconstructed execution, game process or original/rebuilt parity.'])
 text=json.dumps(manifest,indent=2)+'\n'
 if args.write:(output/'manifest.json').write_text(text)
 else:assert (output/'manifest.json').read_text()==text
 print(f'Current raid sequences/circles/minions/whirlwind: {len(selected)} indexed actions, {cases} bounded original cases; live paths traced; no compiler/game')
if __name__=='__main__':main()

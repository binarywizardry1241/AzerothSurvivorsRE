#!/usr/bin/env python3
"""Replay current terminal projection, XP parser/budget and animation arithmetic without compiling or launching a game."""
from script_sources import load_script
import argparse, json, math, struct, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--python-libs',default='runtime/armory-recovery/python-libs');p.add_argument('--output',default='runtime/terminal-flow-0.109.0/projection-check.json');args=p.parse_args()
libs=(ROOT/args.python_libs).resolve();out=(ROOT/args.output).resolve()
if not libs.is_relative_to(ROOT)or not out.is_relative_to(ROOT/'runtime'):raise ValueError('All paths must remain project-local; output belongs in runtime/')
sys.path.insert(0,str(libs))
from native_terminal import NativeReplay,verified_input,require
mf,target,data,pe=verified_input(ROOT/'docs/analysis/evidence/0.109.0/terminal-presentation');n=NativeReplay(data,pe);u=n.machine;R=n.registers
put,get,reset,run,scalar=n.put,n.get,n.reset,n.run,n.scalar
m,bp,sp,app=n.mem,n.bp,n.sp,n.app
f = load_script('float_model', ROOT/'scripts/recover-terminal-contracts.py')
f.sub=lambda a,b:f.f32(f.f32(a)-f.f32(b))
def budget(xp):
 for points in range(51):
  cost=80+points*15
  if xp<cost:return points,xp,cost
  xp-=cost
 return 51,0,0

def close(actual,expected,label):require(math.isclose(actual,expected,rel_tol=1e-6,abs_tol=2e-6),label+': '+str((actual,expected)))
def exact(actual,expected,label):require(struct.pack('<f',actual)==struct.pack('<f',expected),label+': '+str((actual,expected)))
def cubic_tail(remaining):return f.add(f.sub(f.mul(f.mul(remaining,remaining),remaining),1.),1.)
def xmm(reg):return struct.unpack('<f',(u.reg_read(reg)&0xffffffff).to_bytes(4,'little'))[0]
def clamped(value):
 if value is None:return 0
 value=float(value)
 return min(0xffffffff,max(0,int(value)))if math.isfinite(value)else 0 if math.isnan(value)or value<0 else 0xffffffff
lookup={};record=[]
def seam(address):
 if address==0x142aeace0:
  key=bytes(u.mem_read(u.reg_read(R.UC_X86_REG_RCX),u.reg_read(R.UC_X86_REG_RDX))).decode();number=lookup.get(key)
  if n.context['mode']=='xp-parts-iterator' and key=='xp':number=n.context['values'][(u.reg_read(R.UC_X86_REG_R8)-(m+0x1a000))//32]
  ptr=m+0x19000;u.mem_write(ptr,bytes(32))
  if number is not None:
   kind,value=number;put(ptr,'<QQ',2,kind);put(ptr+0x10,'<d'if kind==2 else'<q'if kind==1 else'<Q',value)
  u.reg_write(R.UC_X86_REG_RAX,ptr);n.return_seam();return True
 if address==0x145bfa10b:scalar(R.UC_X86_REG_XMM0,f.rnd(xmm(R.UC_X86_REG_XMM0)));n.return_seam();return True
 if address in [0x1458e6910,0x1458e6610,0x1458e6790]:
  key=bytes(u.mem_read(u.reg_read(R.UC_X86_REG_R8),u.reg_read(R.UC_X86_REG_R9))).decode();fmt='<I'if address==0x1458e6910 else'<d'if address==0x1458e6610 else'<f';record.append((key,get(u.reg_read(R.UC_X86_REG_RSP)+0x28,fmt)[0]));n.return_seam();return True
 return False
n.seam=seam
grants=[]
for before in [0,79,300,0xfffffff0,0xffffffff]:
 for gain in [0,1,32,100,100000,0xffffffff]:
  reset('saved-class-xp',[(0x14589cea0,0x14589d032)],{n.done});rows=m+0x18000;put(app+0x60,'<QQQ',1,rows,1);put(rows,'<IB',before,1);u.reg_write(R.UC_X86_REG_RCX,app);u.reg_write(R.UC_X86_REG_RDX,1);u.reg_write(R.UC_X86_REG_R8,gain);run(0x14589cea0);total=min(0xffffffff,before+gain);require(get(rows,'<I')[0]==total,'Native saved XP saturation');require((u.reg_read(R.UC_X86_REG_RAX),u.reg_read(R.UC_X86_REG_RDX))==(budget(before)[0],budget(total)[0]),'Native saved before/after point budgets')
  reset('xp-json-fields',[(0x1458b9091,0x1458b9122)],{0x1458b9122});record.clear();put(bp+0x13c,'<I',gain);put(bp+0x28,'<Q',before);put(bp-0x50,'<Q',total);run(0x1458b9091);require(record==[('xp',gain),('before',before),('total',total)],'Native emitted full delta with explicit before and saturated total');grants.append(dict(before=before,gain=gain,total=total))
parsed=[]
values=[None,(0,0),(0,80),(0,0xffffffff),(0,(1<<64)-1),(1,-100),(1,81),(1,(1<<63)-1),(2,-1.5),(2,81.75),(2,1e30)]
for gained in values:
 for total in values:
  for before in [None,(0,0),(0,400),(2,-10.),(2,1e30)]:
   reset('xp-parser',[(0x1400c40a9,0x1400c4240)],{0x1400c4240});lookup.clear();lookup.update(xp=gained,total=total,before=before);u.reg_write(R.UC_X86_REG_RBX,m+0x18000);run(0x1400c40a9)
   gain=clamped(gained[1])if gained else 0;prior=clamped(before[1])if before else max(0,(clamped(total[1])if total else 0)-gain)
   require((u.reg_read(R.UC_X86_REG_R12),u.reg_read(R.UC_X86_REG_R13))==(gain,prior),'XP numeric clamp/default/explicit before');parsed.append(dict(xp=gained,total=total,before=before,result=[gain,prior]))
part_arrays=[];part_executions=0
for values_in in [[],[None],[(1,-1),(0,0),(0,7),(0,7),(2,8.5)],[(0,(1<<64)-1)],[(1,-10),(1,1),(2,-0.5),(2,1e30)],[(0,1),(0,2),(0,3)],[(0,0),(0,0)]]:
 reset('xp-parts-iterator',[(0x14012a2e0,0x14012a4b2)],{n.done});n.context['values']=values_in;lookup.clear();it=m+0x18000;result=m+0x1b000;put(it,'<QQ',m+0x1a000,m+0x1a000+32*len(values_in));actual=[]
 while True:
  u.reg_write(R.UC_X86_REG_RCX,result);u.reg_write(R.UC_X86_REG_RDX,it);u.reg_write(R.UC_X86_REG_RSP,sp);put(sp,'<Q',n.done);run(0x14012a2e0);part_executions+=1
  if get(result,'<q')[0]==-1:break
  actual.append(get(result+0x18,'<I')[0])
 require(actual==[clamped(x[1])for x in values_in if x and clamped(x[1])],'Native part iterator must clamp, filter zero and preserve repetitions/order');require(get(it,'<Q')[0]==m+0x1a000+32*len(values_in),'Native part iterator advances through rejected elements');part_arrays.append(dict(inputs=values_in,result=actual))
budgets=[];thresholds=[0,0xffffffff];xp=0
for points in range(51):
 xp+=80+15*points;thresholds.extend([xp-1,xp,xp+1])
for xp in thresholds:
 reset('budget',[(0x1400c4342,0x1400c43c2)],{0x1400c43c2});u.reg_write(R.UC_X86_REG_R13,xp);run(0x1400c4342);actual=(get(bp+0x2a4,'<I')[0],get(bp+0x2a0,'<I')[0],get(bp+0x29c,'<I')[0]);require(actual==budget(xp),'51-point native display budget');budgets.append(dict(xp=xp,result=actual))
animations=[];wrapped=0
for before,gain in [(0,100),(79,1),(79,1000),(300,2000),(300,0xffffffff),(23000,100000),(0xffffffff,100),(0xfffffff0,32),(0,0xffffffff)]:
 for parts in [0,1,7]:
  for age in [0.,0.35,0.55,1.,2.,3.2,5.,10.]:
   reset('xp-count',[(0x1400cf187,0x1400cf369)],{0x1400cf369});state=m+0x18000;put(bp+0xd8,'<Q',state);put(state+0x20,'<Q',parts);put(state+0x2c,'<II',before,gain);scalar(R.UC_X86_REG_XMM0,age);scalar(R.UC_X86_REG_XMM7,1.);run(0x1400cf187)
   duration=min(f.add(f.mul(f.f32((budget((before+gain)&0xffffffff)[0]-budget(before)[0])&0xffffffff),.45),.9),f.f32(3.2));delay=f.add(f.add(f.mul(f.f32(parts),.22),.35),.2);progress=min(1.,max(0.,f.div(f.sub(age,delay),duration)));remaining=f.sub(1.,progress);counted=clamped(f.rnd(f.mul(f.f32(gain),f.sub(1.,f.mul(f.mul(remaining,remaining),remaining)))));expected=budget((before+counted)&0xffffffff)
   actual=(u.reg_read(R.UC_X86_REG_RSI)&0xffffffff,u.reg_read(R.UC_X86_REG_R14)&0xffffffff,u.reg_read(R.UC_X86_REG_RBX)&0xffffffff);require(get(bp+0x68,'<I')[0]==counted and actual==expected,'Native count/duration/wrapping/display budget');wrapped+=before+gain>0xffffffff;animations.append(dict(before=before,gain=gain,parts=parts,age=age,counted=counted,budget=actual))
rows=[]
for index in range(7):
 for age in [0.,.35,.40,.55,.57,1.,1.7,3.]:
  reset('row-reveal',[(0x1400cf10e,0x1400cf16d)],{0x1400cf16d});ptr=m+0x18000;put(ptr,'<Q',index);u.reg_write(R.UC_X86_REG_RAX,ptr);scalar(R.UC_X86_REG_XMM1,f.sub(age,.35));scalar(R.UC_X86_REG_XMM2,-.22);scalar(R.UC_X86_REG_XMM3,4.);scalar(R.UC_X86_REG_XMM7,1.);run(0x1400cf10e);alpha=xmm(R.UC_X86_REG_XMM8);close(alpha,min(1.,max(0.,f.mul(f.sub(f.sub(age,.35),f.mul(index,.22)),4.))),'Row alpha')
  reset('row-slide',[(0x1400cee68,0x1400cee94)],{0x1400cee94});u.reg_write(R.UC_X86_REG_R10,ptr);scalar(R.UC_X86_REG_XMM8,alpha);scalar(R.UC_X86_REG_XMM7,1.);scalar(R.UC_X86_REG_XMM4,-1.);scalar(R.UC_X86_REG_XMM5,12.);run(0x1400cee68);exact(xmm(R.UC_X86_REG_XMM8),f.mul(12.,cubic_tail(f.sub(1.,alpha))),'Row exact cubic slide');rows.append(dict(index=index,age=age,alpha=alpha))
pops=[]
for age in [0.,.06,.12,.15,.25,.35,.45,1.]:
 reset('point-pop',[(0x1400cfc2b,0x1400cfcb4)],{0x1400cfcb4});ptr=m+0x18000
 for offset,val in [(0x40,ptr),(0x30,ptr+0x100),(0x10,ptr+0x200),(0x20,ptr+0x300)]:put(bp+offset,'<Q',val)
 scalar(R.UC_X86_REG_XMM6,age);scalar(R.UC_X86_REG_XMM7,1.);run(0x1400cfc2b);close(get(ptr+0x210,'<f')[0],min(1.,age/.12),'Pop alpha');exact(get(ptr+0x110,'<f')[0],f.add(1.,f.mul(.6,cubic_tail(f.sub(1.,min(1.,f.div(age,.35)))))),'Pop exact scale')
 reset('point-flash',[(0x1400d03c5,0x1400d03ec)],{0x1400d03ec});u.reg_write(R.UC_X86_REG_R15,1);scalar(R.UC_X86_REG_XMM6,age);run(0x1400d03c5);close(xmm(R.UC_X86_REG_XMM0),.6*max(1.-age/.45,0.),'Point flash');pops.append(age)
fills=[]
for present in [0,1]:
 for age in [0.,.149,.15,.3]:
  for into,next_cost in [(0,0),(0,80),(19,80),(20,80),(79,80)]:
   reset('point-fill',[(0x1400cfe9d,0x1400cfeda),(0x1400cff14,0x1400cff3c),(0x1400d01b1,0x1400d01b9)],{0x1400d01b9});u.reg_write(R.UC_X86_REG_R15,present);u.reg_write(R.UC_X86_REG_R14,into);u.reg_write(R.UC_X86_REG_RBX,next_cost);scalar(R.UC_X86_REG_XMM6,age);run(0x1400cfe9d);value=100. if next_cost==0 or present and f.f32(age)<f.f32(.15) and into*4<next_cost else into*100./next_cost;close(xmm(R.UC_X86_REG_XMM0),value,'Point fill');fills.append(dict(present=present,age=age,into=into,next=next_cost))
colors=[]
for rarity in range(8):
 reset('loot-rarity',[(0x14020c611,0x14020c652)],{0x14020c652});u.reg_write(R.UC_X86_REG_R14,(rarity-1)&((1<<64)-1));run(0x14020c611);actual=[xmm(reg)for reg in [R.UC_X86_REG_XMM9,R.UC_X86_REG_XMM10,R.UC_X86_REG_XMM15]];expected={1:[.118,1.,0.],2:[.231,.612,1.],3:[.761,.486,1.],4:[1.,.604,.165],5:[.761,.486,1.]}.get(rarity,[.91]*3)
 for a,e in zip(actual,expected):exact(a,e,'Loot rarity RGB')
 colors.append(dict(rarity=rarity,rgb=actual))
source=''.join((ROOT/'crates/azeroth-survivors-re/src/gameplay/terminal_view.rs').read_text().split());menu=''.join((ROOT/'crates/azeroth-survivors-re/src/menu.rs').read_text().split())
for token in ['Color::srgb(1.,0.604,0.165)','Color::srgb(0.88,0.23,0.17)','Color::srgb(0.302,1.,0.416)','Color::srgb(0.443,0.835,1.)','Color::srgb(0.8,0.95,1.)','Color::srgba(0.03,0.08,0.14,0.75)','cyan.with_alpha(0.45)','cyan.with_alpha(0.35)','Color::srgba(0.,0.,0.,0.6)','Color::linear_rgba(0.45,0.8,1.,1.)','Color::linear_rgba(0.13,0.42,0.75,1.)']:
 require(token in source,'Terminal color source '+token)
for token in ['Color::srgb(0.973,0.824,0.416)','Color::srgb(0.949,0.902,0.788)','Color::srgb(0.725,0.663,0.510)']:require(token in menu,'Shared text color source '+token)
literal_groups=[]
def check(name,where,values,kind='tagged-srgba',uses=()):
 expected=struct.pack('<I4f',0,*values)if kind=='tagged-srgba'else struct.pack('<4f',*values)
 actual=n.raw(where,len(expected));require(actual==expected,'Native color literal '+name)
 literal_groups.append(dict(name=name,kind=kind,data_address=hex(where),bytes_hex=actual.hex(),consumer_instructions=[hex(v)for v in uses]))
check('gold',0x145deb878,(.973,.824,.416,1.),uses=(0x1402051fa,0x140205b2b,0x140255a73))
check('muted',0x145deb8bc,(.725,.663,.510,1.),uses=(0x14020509a,0x14025483b,0x140255958))
check('paper',0x145debdd4,(.949,.902,.788,1.),uses=(0x14020471e,0x140255579))
check('unlock-and-new',0x145debac0,(.302,1.,.416,1.),uses=(0x1402049ae,0x14020cb4d))
check('xp-cyan',0x145dec748,(.443,.835,1.,1.),uses=(0x140254299,0x140254b05,0x140254e59))
check('xp-counter',0x145dec75c,(.8,.95,1.,1.),uses=(0x1402543f5,))
check('xp-panel-border-base',0x145dd3b60,(.443,.835,1.,1.),uses=(0x1400c4607,))
check('xp-pop',0x145dd3b9c,(.973,.824,.416,1.),uses=(0x1400cfc50,))
check('xp-panel-background',0x145dd2d60,(.03,.08,.14,.75),'raw-rgba',uses=(0x1400c4653,))
check('xp-gradient-top',0x145deb5f0,(.45,.8,1.,1.),'raw-linear-rgba',uses=(0x1402550f8,))
check('xp-gradient-bottom',0x145deb600,(.13,.42,.75,1.),'raw-linear-rgba',uses=(0x140255126,))
color_stores=[]
for name,start,end,values in [('victory',0x1402040a5,0x1402040b7,(1.,.604,.165,1.)),('fallen-or-left',0x140204144,0x140204156,(.88,.23,.17,1.))]:
 n.reset(name,[(start,end),(0x140204255,0x140204294)],{end,0x140204294});n.run(start);n.run(0x140204255)
 actual=bytes(u.mem_read(n.bp+0x558,20));require(actual==struct.pack('<I4f',0,*values),'Native heading color')
 color_stores.append(dict(name=name,loads=[hex(start),hex(end)],store_window=['0x140204255','0x140204294'],text_color_hex=actual.hex()))
n.reset('xp-panel',[(0x1400c4607,0x1400c4663)],{0x1400c4663});n.run(0x1400c4607)
actual=bytes(u.mem_read(n.bp+0x198,80));require(actual==struct.pack('<I4f',0,.443,.835,1.,.45)*4,'XP panel border')
background=bytes(u.mem_read(n.bp+0x1e8,20));require(background==struct.pack('<I4f',0,.03,.08,.14,.75),'XP panel background')
color_stores.append(dict(name='xp-panel',window=['0x1400c4607','0x1400c4663'],border_hex=actual.hex(),background_hex=background.hex()))
n.reset('xp-bar',[(0x140254e59,0x140254eae)],{0x140254eae});n.run(0x140254e59)
actual=bytes(u.mem_read(n.bp+0x538,80));require(actual==struct.pack('<I4f',0,.443,.835,1.,.35)*4,'XP bar border')
require(n.get(n.bp+0x598,'<I')[0]==struct.unpack('<I',struct.pack('<f',.6))[0],'XP bar background alpha')
color_stores.append(dict(name='xp-bar',window=['0x140254e59','0x140254eae'],border_hex=actual.hex(),background_alpha_bits=n.get(n.bp+0x598,'<I')[0]))

meters=[]
for health in [-1.,0.,1.,20.,1000.]:
 for damage in [1.,7.5,30.,10000.]:
  for movement in [0.,2.]:
   reset('effective-damage',[(0x145971a58,0x145971afb+2),(0x145971b4e,0x145971b98)],{0x145971b98});actor=m+0x18000;u.reg_write(R.UC_X86_REG_R14,actor);u.reg_write(R.UC_X86_REG_RDI,app);put(actor+0x18,'<Q',(1<<64)-1);put(actor+0x158,'<f',health);put(actor+0x190,'<f',movement);put(app+0x708,'<d',3.25);scalar(R.UC_X86_REG_XMM8,damage);run(0x145971a58);require(get(actor+0x158,'<f')[0]==f.sub(health,damage),'Damage health writer');require(get(app+0x708,'<d')[0]==3.25+min(damage,max(health,0.)),'Effective rather than overkill meter');meters.append(dict(health=health,damage=damage,movement=movement))
pop_states=[]
for initial in [0,3,50,51]:
 for points in [0,1,2,3,50,51]:
  for present in [0,1]:
   reset('pop-lifetime',[(0x1400cf8cb,0x1400cf8f0),(0x1400cfbb4,0x1400cfbc4)],{0x1400cf8f0,0x1400cfbc4});state=m+0x18000;u.reg_write(R.UC_X86_REG_R8,state);u.reg_write(R.UC_X86_REG_R11,state+0x100);u.reg_write(R.UC_X86_REG_RSI,points);put(state+0x34,'<I',initial);put(state+0x18,'<If',present,2.);scalar(R.UC_X86_REG_XMM6,5.);pc=run(0x1400cf8cb)
   changed=points>initial;require(get(state+0x34,'<I')[0]==max(initial,points),'Pop last-points monotonicity');require(get(state+0x18,'<If')==(1,5.)if changed else get(state+0x18,'<If')==(present,2.),'Pop time lifetime')
   reset('pop-text-difference',[(0x1400cffbe,0x1400cffc9)],{0x1400cffc9,0x1400d0010});u.reg_write(R.UC_X86_REG_RSI,points);u.reg_write(R.UC_X86_REG_R12,initial);run(0x1400cffbe);require(get(bp+0x64,'<I')[0]==((points-initial)&0xffffffff),'Pop text wrapping difference');pop_states.append(dict(initial=initial,points=points,present=present))
projections=[]
for seed in [0,1,0xffffffff]:
 reset('summary-fields',[(0x14594bfbe,0x14594c123)],{0x14594c123});record.clear();u.reg_write(R.UC_X86_REG_RDI,app);u.reg_write(R.UC_X86_REG_RBX,m+0x18000);u.reg_write(R.UC_X86_REG_R14,m+0x19000);put(app+0xa34,'<f',60.25);put(app+0x4d8,'<I',seed)
 for off in [0x754,0x758,0x75c,0x760,0x764,0x768]:put(app+off,'<I',seed)
 put(app+0x708,'<dd',31.5,47.25);run(0x14594bfbe);require(record==[('time',60.25),('level',seed),('kills',seed),('elites',seed),('guardians',seed),('bosses',seed),('damage',31.5),('taken',47.25),('gold',seed),('chests',seed)],'Summary field projection '+repr(record));projections.append(record[:])
source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/terminal_view.rs').read_text();compact=''.join(source.split())
for token in ['clock.before.wrapping_add(clock.gained)','after_points.wrapping_sub(initial_points)','clock.before.wrapping_add(counted)','points.wrapping_sub(initial_points)','talent.parts.iter().filter(|(_,xp)|*xp>0)','(*xp).min(i64::from(u32::MAX))','(remaining*remaining*remaining-1.)+1.','12.*cubic_tail(remaining)','1.+cubic_tail(remaining)*0.6']:
 require(token in compact,'Current source XP contract: '+token)
result=dict(target=mf['target'],native_executions=2*len(grants)+part_executions+len(parsed)+len(budgets)+len(animations)+2*len(rows)+2*len(pops)+len(fills)+len(colors)+len(meters)+len(projections)+2*len(pop_states)+len(color_stores),color_literal_groups=literal_groups,color_constructor_cases=len(color_stores),saved_grant_and_json_cases=len(grants),part_iterator_arrays=len(part_arrays),part_iterator_calls=part_executions,parser_cases=len(parsed),budget_cases=len(budgets),count_cases=len(animations),wrapping_count_cases=wrapped,row_cases=len(rows),point_pop_cases=len(pops),point_pop_state_cases=len(pop_states),point_fill_cases=len(fills),rarity_color_cases=len(colors),effective_damage_cases=len(meters),summary_field_cases=len(projections),instructions=n.instructions,selected_animation_cases=[r for r in animations if r['age']==5. and r['parts']==7],limits=['JSON lookup is a declared seam returning native enum-number layouts; serde JSON decoding and external callees do not execute.','Roundf is a declared f32 leaf seam. Row slide, pop scale and all audited color literals/stores are compared as exact f32 bits; remaining display comparisons have explicit float tolerance.','Layout/component/graphics query scheduling, icon assets and original/rebuilt visual/gameplay parity remain unverified.'])
out.parent.mkdir(parents=True,exist_ok=True);out.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items()if not isinstance(v,(list,dict))}))

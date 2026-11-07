#!/usr/bin/env python3
"""Check selected native loot and world-flag consumers without compilation.

Unmodified PE instruction blocks run with synthetic state in Unicorn. Typed
Node decoding reuses the existing recovered Bevy map. No application is run.
"""
from portable_paths import objdump_output
from native_recovery import f32 as _shared_f32, bits as _shared_bits, digest as _shared_digest
from script_sources import load_script
import argparse, hashlib, json, struct, subprocess, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from coverage_common import latest_target
SHA='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK=ROOT/'runtime/analysis/history/findings/fixgap32-33/9040a2da4887'
OUT=ROOT/'docs/analysis/evidence/0.105.0/hud-consumers'
SPANS={
 'loot-root':(0x140279050,0x140279ced),
 'loot-row':(0x1401b2970,0x1401b3a63),
 'drop-message-admission':(0x14005c039,0x14005c08c),
 'drop-message-publication':(0x14005d9eb,0x14005dacb),
 'choices-victory-dispatch':(0x14005c388,0x14005c418),
 'choices-publication':(0x14005c90b,0x14005c96d),
 'unpause-dispatch':(0x14005c47d,0x14005c490),
 'pause-dispatch':(0x14005c0c2,0x14005c0dd),
 'pause-set':(0x14005cf53,0x14005cf75),
 'unpause-set':(0x14005c982,0x14005c9a4),
 'flag-command':(0x1458a4ff4,0x1458a5014),
 'flag-name-suffix':(0x145911009,0x1459110e5),
 'flag-packet':(0x1458a9ae0,0x1458a9d86),
 'equipment-loot':(0x1458971b7,0x145897a72),
 'guardian-spawn-invalidate':(0x145910af7,0x145910aff),
}
CONSTANTS={
 'lifetime':(0x145dbe640,4),'entrance-fraction':(0x145d73d48,4),
 'entrance-pixels-alpha':(0x145dbf580,8),'fade-start':(0x145da9024,4),
 'fade-fraction':(0x145d6d424,4),'rarity-name-rgb':(0x145dbd098,60),
 'rarity-edge-rgb':(0x145dbcff0,60),'rarity-background-rgb':(0x145dbd02c,60),
 'neutral-edge-name':(0x145d6d340,8),'neutral-background-r':(0x145d6d3a8,4),
 'neutral-background-g':(0x145db7ca8,4),'neutral-background-b':(0x145d6d4e0,4),
 'loot-header':(0x145db8dab,8),'loot-new':(0x145db8dd8,21),
 'loot-collected':(0x145db8dc3,21),'new-color':(0x145db8a40,20),
 'held-suffix-format':(0x146e7aea8,14),'empty-suffix-format':(0x146e7aeb6,18),
 'flag-resend-seconds':(0x146bb7120,4),
}
def dump(v):return json.dumps(v,indent=2,allow_nan=False)+'\n'
def sha(v):
    return _shared_digest(v)
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--check',action='store_true');args=ap.parse_args()
 target=latest_target(verify=True);assert target['sha256']==SHA
 data=(ROOT/target['path']).read_bytes()
 def module(name,path):
  m = load_script(name, path);return m
 pe=module('pe',ROOT/'scripts/inventory-executable.py').PE(data)
 def raw(a,n):off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
 WORK.mkdir(parents=True,exist_ok=True);OUT.mkdir(parents=True,exist_ok=True)
 def emit(name,value):
  (WORK/name).write_text(value)
  if args.check:assert (OUT/name).read_text()==value,name
  else:(OUT/name).write_text(value)
 records=[]
 old=json.loads((OUT/'manifest.json').read_text())if args.check else None
 for role,(a,b)in SPANS.items():
  text=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',target['path']],cwd=ROOT,text=True)
  emit(role+'.asm',text);row=dict(role=role,start=hex(a),end_exclusive=hex(b),sha256=sha(raw(a,b-a)),assembly=role+'.asm',assembly_sha256=sha(text.encode()))
  if role in ['loot-root','loot-row']:
   if args.check:
    prior=next(r for r in old['spans']if r['role']==role)
    assert sha((OUT/prior['pseudocode']).read_bytes())==prior['pseudocode_sha256']
    row.update({k:prior[k]for k in ['pseudocode','pseudocode_sha256','evidence_id']})
   else:
    ev=json.loads((WORK/('rea-'+role)/'003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
    assert ev['subject']['digest']['sha256']==row['sha256']
    text='\n'.join(l.rstrip()for l in ev['normalized_result'].splitlines()).strip()+'\n';emit(role+'.ghidra.c',text)
    row.update(pseudocode=role+'.ghidra.c',pseudocode_sha256=sha(text.encode()),evidence_id=ev['evidence_id'])
  records.append(row)
 constants=[dict(role=r,address=hex(a),bytes=raw(a,n).hex())for r,(a,n)in CONSTANTS.items()]
 for r,want in [('lifetime',7.),('entrance-fraction',.05),('fade-start',.85),('fade-fraction',.15),('flag-resend-seconds',300.)]:
  a,n=CONSTANTS[r];assert raw(a,n)==struct.pack('<f',want),r
 m=module('hud_probe',ROOT/'scripts/recover-rewards-layout.py')
 class Probe(m.Probe):
  def __init__(self):self.active=[];self.stops=set();super().__init__(0x140279050)
  def hook(self,_,a,n,unused):
   if a in self.stops:self.u.emu_stop()
   elif not any(lo<=a<hi for lo,hi in self.active):raise AssertionError('Unreviewed instruction '+hex(a))
  def run_span(self,a,b,extra=(),stops=()):
   self.active=[(a,b),*extra];self.stops={b,*stops}
   self.u.reg_write(m.UC_X86_REG_MXCSR,0x1f80);self.u.emu_start(a,0,count=2000)
   pc=self.reg(m.UC_X86_REG_RIP);assert pc in self.stops;return pc
 p=Probe();bp=0x300010000;scratch=0x200010000
 def put(a,fmt,*v):p.u.mem_write(a,struct.pack(fmt,*v))
 def scalar(reg,value):p.u.reg_write(reg,bits(value))
 p.u.reg_write(m.UC_X86_REG_RBP,bp)
 p.run_span(0x140279676,0x14027985e)
 nodes={'root':p.node(bp-0x40)}
 assert nodes['root']['right']==[1,24.]and nodes['root']['top']==[2,38.]
 p.u.reg_write(m.UC_X86_REG_R14,bp+0x318);p.u.reg_write(m.UC_X86_REG_RAX,scratch);put(scratch+0x20,'<f',0)
 p.run_span(0x1401b2bb3,0x1401b2d60);nodes['card']=p.node(bp+0x2b0)
 assert nodes['card']['min_width']==[1,280.]and nodes['card']['padding']==[[1,8.],[1,16.],[1,7.],[1,7.]]
 p.u.reg_write(m.UC_X86_REG_RSI,bp+0xf8);p.run_span(0x1401b2f42,0x1401b30ac);nodes['icon']=p.node(bp+0x90)
 assert nodes['icon']['width']==[1,40.]and nodes['icon']['height']==[1,40.]
 p.run_span(0x1401b3205,0x1401b32e4)
 p.u.mem_write(bp+0x2b8,p.read(bp+0x90,0x138)) # exact memcpy length at1401b32f4
 p.run_span(0x1401b32f9,0x1401b337e);nodes['body']=p.node(bp+0x2b8)
 assert nodes['body']['row_gap']==[1,2.]
 lifetime=[]
 state,timing,loading,tick,rows=[scratch+i*0x1000 for i in range(5)]
 for choosing in [False,True]:
  for paused in [False,True]:
   for covered in [False,True]:
    for count in [1,4,5]:
     p.u.mem_write(state,bytes(0x1000));put(state+0x80,'<B',0 if choosing else 255);put(state+0xea,'<B',int(paused));put(state+0x38,'<QQ',rows,count)
     put(timing+0x58,'<ff',.25,20.);put(loading,'<B',int(covered))
     for index in range(count):put(rows+index*40+32,'<f',19.9 if index%2 else 10.)
     put(bp+0x178,'<Q',state);put(bp+0x1b8,'<Q',timing);put(bp+0x230,'<Q',loading);put(bp+0x188,'<Q',tick);put(bp+0x194,'<I',77)
     p.run_span(0x140279188,0x1402792fe,extra=[(0x14027933f,0x14027935a)])
     actual=[struct.unpack('<f',p.read(rows+i*40+32,4))[0]for i in range(count)]
     expected=[min(f32(f32(19.9 if i%2 else 10.)+.25),20.)if choosing or paused or covered else f32(19.9 if i%2 else 10.)for i in range(count)]
     assert actual==expected,(actual,expected)
     lifetime.append(dict(choosing=choosing,paused=paused,loading=covered,born=actual))
 expiry=[]
 for age in [0.,6.999,7.,7.001,20.]:
  scalar(m.UC_X86_REG_XMM6,age);scalar(m.UC_X86_REG_XMM7,7.);p.u.reg_write(m.UC_X86_REG_RCX,rows);put(rows+32,'<f',0.)
  pc=p.run_span(0x140279310,0x140279321,stops=[0x140279bf0]);assert (pc==0x140279bf0)==(f32(age)>=7.)
  expiry.append(dict(age=age,expired=pc==0x140279bf0))
 animation=[]
 for age in [0.,.175,.35,1.,5.95,6.3,6.9,7.]:
  born,transform,colortick,colortag,color=[scratch+i*0x1000 for i in range(5)]
  put(born,'<f',0.)
  for reg,value in [(m.UC_X86_REG_RDI,born),(m.UC_X86_REG_R12,transform),(m.UC_X86_REG_R14,colortick),(m.UC_X86_REG_RSI,colortag),(m.UC_X86_REG_R10,color)]:p.u.reg_write(reg,value)
  for reg,value in [(m.UC_X86_REG_XMM0,7.),(m.UC_X86_REG_XMM1,.05),(m.UC_X86_REG_XMM2,1.),(m.UC_X86_REG_XMM3,60.),(m.UC_X86_REG_XMM4,.85),(m.UC_X86_REG_XMM5,.15),(m.UC_X86_REG_XMM6,age),(m.UC_X86_REG_XMM7,.92)]:scalar(reg,value)
  p.run_span(0x140279b8a,0x140279beb+5,extra=[(0x140279930,0x140279964)],stops=[0x140279964])
  tx=struct.unpack('<f',p.read(transform+4,4))[0];alpha=struct.unpack('<f',p.read(color+16,4))[0]
  progress=f32(f32(age)/7.);want_tx=f32(f32(1.-min(f32(progress/f32(.05)),1.))*60.)
  fade=f32(f32(1.-progress)/f32(.15))if progress>f32(.85)else 1.;want_alpha=f32(min(max(fade,0.),1.)*f32(.92))
  assert tx==want_tx and alpha==want_alpha,(age,tx,alpha,want_tx,want_alpha)
  animation.append(dict(age=age,x=tx,background_alpha=alpha))
 # Same index/held-name changes do not bypass the native300-second hold.
 flags=[]
 for previous in [False,True]:
  for same in [False,True]:
   for visible in [False,True]:
    for age in [0.,300.,300.001]:
     put(state,'<Q',int(previous));put(state+8,'<Q',2 if same else 1);put(state+0xa61,'<B',int(visible));put(state+0xa04,'<f',0.);put(state+0x9ec,'<f',age)
     p.u.reg_write(m.UC_X86_REG_R13,state);p.u.reg_write(m.UC_X86_REG_RCX,2);scalar(m.UC_X86_REG_XMM0,age)
     pc=p.run_span(0x145910d71,0x145910dbb,stops=[0x145910e4d,0x145910e58,0x14590fe6d])
     retained=previous and same and visible and f32(age)<=300.
     assert (pc==0x14590fe6d)==retained
     flags.append(dict(selected=previous,same=same,visible=visible,age=age,retained=retained))
 canonical=ROOT/'docs/analysis/evidence/0.105.0/addon-bridge/native-manifest.json';cm=json.loads(canonical.read_text());assert cm['target_sha256']==SHA
 flag=next(r for r in cm['native_observations']if r['role']=='flag-select');assert sha(raw(int(flag['address'],16),flag['byte_count']))==flag['sha256']
 source_checks={
 'crates/azeroth-survivors-re/src/gameplay/run_hud/loot.rs':['session.paused || choosing || input.loading_screen_covering','row.born + time.delta_secs()','now - row.born < 7.','settings.shown("loot")','state.rows.len(), state.revision','GlobalZIndex(6100)','Val::Percent(38.)','progress / 0.05','progress > 0.85'],
 'crates/azeroth-survivors-re/src/gameplay/mechanics/addon_lists.rs':['self.world_flag.selected = Some(index)','self.world_flag.visible','self.clock - self.world_flag.last_sent > 300.','RunEvent::GuardianFlag','self.world_flag.selected = None'],
 'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs':['self.invalidate_world_flag()'],
 'crates/azeroth-survivors-re/src/gameplay/mod.rs':['guid != 0x00ff_ffff','is_new: !owned.contains(&id)','if saves_equipment','game.update_world_flag','hud_settings.shown("flag")'],
 'crates/azeroth-survivors-re/src/gameplay/client/events.rs':['RunEvent::EquipmentLoot','loot.push(id,is_new,time.elapsed_secs())','SessionEvent::GossipPoi','flags:99','icon:6,data:0','enemy.{id}',' (Guardian)',"'s lair (empty)"],
 }
 for name,tokens in source_checks.items():
  src=''.join((ROOT/name).read_text().split())
  for token in tokens:assert ''.join(token.split())in src,(name,token)
 emit('native.json',dump(dict(target_sha256=SHA,nodes=nodes,lifetime=lifetime,expiry=expiry,animation=animation,flags=flags)))
 emit('manifest.json',dump(dict(target_sha256=SHA,target_process_launched=False,spans=records,constants=constants,canonical_flag_selection='docs/analysis/evidence/0.105.0/addon-bridge/native-manifest.json',canonical_hud_visibility='docs/analysis/evidence/0.105.0/run-hud/layout-manifest.json',limits=['Bounded original instructions cover constructor fields, lifetime, expiry, animation and flag retention; no Bevy layout, shaping or GPU execution.','Node field map and the body memcpy are explicit existing analysis seams.','Drop serializer and ScreenState producers are statically traced; complete JSON dispatch and equipment dictionary lookup are not emulated.','Original/rebuilt compilation, UI input and rendered parity remain unverified.'])))
 print(f'PASS:4 Node snapshots;{len(lifetime)} lifetime,{len(expiry)} expiry,{len(animation)} animation,{len(flags)} flag cases; current producer/packet/source traces; no compilation.')
if __name__=='__main__':main()

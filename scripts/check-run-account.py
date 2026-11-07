#!/usr/bin/env python3
"""Verify current terminal counters, terminal XP/checkpoints and character best lifetimes. No source compiler or game application executes."""
from script_sources import load_script
import argparse, json, random, struct, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--python-libs',default='runtime/tool-state/python/armory/python-libs')
parser.add_argument('--output',default='runtime/analysis/history/native-recovery/run-account/fb344162b37a/static-check.json')
parser.add_argument('--prepare-rea',action='store_true')
args=parser.parse_args()
libs=(ROOT/args.python_libs).resolve();output=(ROOT/args.output).resolve()
if not libs.is_relative_to(ROOT) or not output.is_relative_to(ROOT/'runtime'):raise ValueError('Paths must remain project-local; output belongs in runtime/')
sys.path.insert(0,str(libs))
from native_terminal import NativeReplay, verified_input, prepare_rea, require
EVIDENCE=ROOT/'docs/analysis/evidence/run-account'
manifest,target,data,pe=verified_input(EVIDENCE)
if args.prepare_rea:prepare_rea(EVIDENCE,manifest,data,pe,ROOT/'runtime/analysis/history/native-recovery/run-account/fb344162b37a/reproduction')
model = load_script('xp_model', ROOT/'scripts/recover-terminal-contracts.py')
replay=NativeReplay(data,pe);u=replay.machine;R=replay.registers
mem,stack,done,bp,sp,app=replay.mem,replay.stack,replay.done,replay.bp,replay.sp,replay.app
ctx=replay.context
put,get,reset,run,scalar,raw=replay.put,replay.get,replay.reset,replay.run,replay.scalar,replay.raw

def xp_seam(address):
 if ctx['mode']!='xp':return False
 if address==0x14588d0d0:u.reg_write(R.UC_X86_REG_RAX,ctx['zone']);replay.return_seam();return True
 if address==0x145bfa10b:
  value=struct.unpack('<f',(u.reg_read(R.UC_X86_REG_XMM0)&0xffffffff).to_bytes(4,'little'))[0]
  scalar(R.UC_X86_REG_XMM0,model.rnd(value));replay.return_seam();return True
 return False
replay.seam=xp_seam
cases=[dict(kills=k,bosses=b,seconds=t,won=w,zone=z,mods=mods,veteran=v)for k,b,t,w,z,mods,v in [(100,1,60.,False,0,[100]*4,0.),(5,0,2.5,False,0,[100]*4,0.),(100,1,60.,True,0,[100,300,300,150],.4),(0,0,0.,False,0,[100]*4,0.),(0xffffffff,0xffffffff,36000.,True,11,[500,500,300,150],1.),(100,1,60.,False,0,[100,100,100,0],0.),(1,0,-60.,False,0,[100]*4,0.),(0xffffffff,5,1800.,False,11,[0,100,100,100],.2),(0,0,375.,False,0,[100,125,110,125],0.),(0,0,125.,False,0,[100,125,120,110],0.),(0,0,375.,False,0,[100,150,110,120],0.)]]
rng=random.Random(109009)
for _ in range(1536):
 mods=[rng.randrange(100,maxi+1,step)for maxi,step in zip([500,500,300,150],[25,25,10,5])]
 cases.append(dict(kills=rng.choice([rng.randrange(250000),rng.randrange(0x100000000)]),bosses=rng.randrange(100),seconds=model.f32(rng.uniform(0,36000)),won=bool(rng.randrange(2)),zone=rng.randrange(12),mods=mods,veteran=model.f32(rng.randrange(6)*.2)))
xp=[];disagreements=[]
for c in cases:
 reset('xp',[(0x1458b86d2,0x1458b89c0)],{0x1458b89c0});ctx['zone']=c['zone'];u.reg_write(R.UC_X86_REG_RCX,app);u.reg_write(R.UC_X86_REG_RSI,int(c['won']));scalar(R.UC_X86_REG_XMM8,c['seconds'])
 put(app+0x764,'<I',c['kills']);put(app+0x770,'<I',c['bosses']);put(app+0x2c0,'<4H',*c['mods']);put(app+0x1120,'<f',model.f32(c['veteran']))
 run(0x1458b86d2);parts=list(get(bp-0x28,'<7q'));require(parts==model.model(c),str((c,parts,model.model(c))));xp.append(dict(inputs=c,parts=parts,total_xp=model.total(parts)))
 if parts!=model.model(c,True):disagreements.append(xp[-1])
arrays=[([0]*7,[0]*7),([-1,0,0,0,0,0,0],[0]*7),([1,-2,3,-4,5,-6,7],[0]*7),([0]*7,[1]*7),([(1<<63)-1]*7,[-1]*7),([1<<32,1,0,0,0,0,0],[0]*7),([100,50,200,0,20,15,2],[60,100,100,0,10,25,0])]
arrays.extend((row['parts'],xp[max(0,i-1)]['parts'])for i,row in enumerate(xp[:96]));pairs=[]
for current,previous in arrays:
 reset('parts',[(0x1459ca6e6,0x1459ca845)],{0x1459ca845});buf,it,cur,prev,out=[mem+x for x in [0x10000,0x11000,0x12000,0x13000,0x14000]]
 put(cur,'<7q',*current);put(prev,'<7q',*previous);put(it,'<QQQQ',cur,prev,0,7)
 for reg,val in [(R.UC_X86_REG_RAX,buf),(R.UC_X86_REG_RCX,out),(R.UC_X86_REG_RDX,it),(R.UC_X86_REG_RSI,0),(R.UC_X86_REG_R14,7),(R.UC_X86_REG_R13,7)]:u.reg_write(reg,val)
 run(0x1459ca6e6);delta=[model.signed(a-b)for a,b in zip(current,previous)];require([get(buf+i*16,'<Qq')for i in range(7)]==list(enumerate(delta)),'Delta pairs');require(get(out,'<QQQ')==(7,buf,7),'Delta buffer')
 reset('sum',[(0x1458b8a65,0x1458b8b1f)],{0x1458b8b1f});put(buf,'<14q',*(v for i,d in enumerate(delta)for v in [i,d]));put(bp-0x28,'<7q',*current)
 for reg,val in [(R.UC_X86_REG_R12,7),(R.UC_X86_REG_R11,buf),(R.UC_X86_REG_RDI,app+0x10a8)]:u.reg_write(reg,val)
 run(0x1458b8a65);award=get(bp+0x13c,'<I')[0];require(award==model.total(delta),'Delta total');require(get(app+0x10a8,'<7q')==tuple(current),'Snapshot')
 pairs.append(dict(current=current,previous=previous,delta=delta,awarded_xp=award))
counts=[]
count_inputs=[([10,20,2,1,4],[0]*5,[0]*5),([20,50,3,2,6],[10,20,2,1,4],[100]*5),([0]*5,[0xffffffff]*5,[17]*5),([0xffffffff]*5,[0]*5,[(1<<64)-2]*5),([3,2,1,0,99],[4,1,2,0,90],[10,(1<<64)-1,30,40,50])]
for _ in range(256):count_inputs.append(([rng.randrange(1<<32)for _ in range(5)],[rng.randrange(1<<32)for _ in range(5)],[rng.randrange(1<<64)for _ in range(5)]))
for cur,prev,old in count_inputs:
 reset('counts',[(0x1458af5c6,0x1458af69f)],{0x1458af69f});u.reg_write(R.UC_X86_REG_RSI,app)
 for reg,val in zip([R.UC_X86_REG_RDI,R.UC_X86_REG_R14,R.UC_X86_REG_R15,R.UC_X86_REG_R12,R.UC_X86_REG_R13],cur):u.reg_write(reg,val)
 put(app+0x1124,'<5I',*prev)
 for off,val in zip([0xcb0,0xcb8,0xcc0,0xcc8,0xce0],old):put(app+off,'<Q',val)
 run(0x1458af5c6);after=[get(app+off,'<Q')[0]for off in [0xcb0,0xcb8,0xcc0,0xcc8,0xce0]];delta=[max(a-b,0)for a,b in zip(cur,prev)]
 require(after==[min((1<<64)-1,a+b)for a,b in zip(old,delta)],'Terminal count saturation');require(get(app+0x1124,'<5I')==tuple(cur),'Terminal count checkpoint');counts.append(dict(current=cur,previous=prev,saved_before=old,delta=delta,saved_after=after))
gates=[]
for game in [0,1,2]:
 for guid in [42,0xfffffe,0xffffff]:
  for showcase in [0,1]:
   reset('count-admission',[(0x1458af562,0x1458af58a)],{0x1458af477,0x1458b06bb,0x1458af58a});u.reg_write(R.UC_X86_REG_RSI,app);put(app+0x10,'<I',game);put(app+0x10a0,'<Q',guid);put(app+0xad0,'<B',showcase);pc=run(0x1458af562)
   expected=0x1458af477 if game==2 else 0x1458b06bb if guid==0xffffff or showcase else 0x1458af58a
   require(pc==expected,'Post-summary GUID/showcase gate');gates.append(dict(game=game,guid=guid,showcase=showcase,admitted=pc==0x1458af58a))
phase_edges=[]
for game in [0,1,2]:
 for phase in range(7):
  for last in range(7):
   reset('terminal-phase-edge',[(0x1458af14c,0x1458af17b),(0x1458af554,0x1458af55d)],{0x1458af477,0x1458af17b,0x1458af55d});u.reg_write(R.UC_X86_REG_R12,app+0x10);put(bp+0x528,'<Q',app);put(app+0x10,'<I',game);put(app+0xad7,'<B',phase);put(app+0x1166,'<B',last);pc=run(0x1458af14c)
   admitted=game!=2 and phase in [4,5] and phase!=last
   require(pc==(0x1458af55d if admitted else 0x1458af477 if game==2 else 0x1458af17b),'Enclosing terminal phase edge');require(get(app+0x1166,'<B')[0]==(phase if admitted else last),'Terminal edge acknowledgement');phase_edges.append(dict(game=game,phase=phase,last=last,admitted=admitted))
summary_gates=[]
for game in [0,1,2]:
 for phase in range(7):
  reset('summary-admission',[(0x1458b8684,0x1458b869b)],{0x1458b869b,0x1458b9f7a});u.reg_write(R.UC_X86_REG_RCX,app);put(app+0x10,'<I',game);put(app+0xad7,'<B',phase);pc=run(0x1458b8684);require(pc==(0x1458b869b if game!=2 and phase else 0x1458b9f7a),'Summary full entry admission');summary_gates.append(dict(game=game,phase=phase,admitted=pc==0x1458b869b))
bests=[]
for count in range(7):
 for matching in [None,*range(count)]:
  for old_level,level in [(0,1),(100,50),(0xffffffff,0xffffffff)]:
   for old_seconds,seconds in [(0,60),(1200,900),(0xffffffff,3600)]:
    for saved in [0,1]:
     reset('character-bests',[(0x1458b96cf,0x1458b9758)],{0x1458b9758});rows=mem+0x18000;u.reg_write(R.UC_X86_REG_R15,app);u.reg_write(R.UC_X86_REG_RBX,42);u.reg_write(R.UC_X86_REG_R13,seconds);put(bp+0xc0,'<I',level);put(app+0xb28,'<Q',rows);put(app+0xb30,'<Q',count);put(app+0xee0,'<Q',(1<<64)-1);put(app+0x1162,'<B',saved)
     initial=bytearray([0xa5]*(count*0x38))
     for i in range(count):struct.pack_into('<QII',initial,i*0x38+0x18,42 if matching==i else 100+i,old_level,old_seconds)
     u.mem_write(rows,bytes(initial));run(0x1458b96cf);expected=initial[:]
     if matching is not None:struct.pack_into('<II',expected,matching*0x38+0x20,max(old_level,level),max(old_seconds,seconds))
     require(bytes(u.mem_read(rows,len(initial)))==bytes(expected),'Independent roster maxima or untouched run/win fields');require(get(app+0x1162,'<B')[0]==saved,'Bests must precede/retain result flag');bests.append(dict(rows=count,matching=matching,before=[old_level,old_seconds],current=[level,seconds],already_saved=saved))
fallbacks=[]
for matching in [False,True]:
 for optional in [False,True]:
  for guid in [42,0xfffffe,0xffffff]:
   for showcase in [0,1]:
    for previous,current in [(1,20),(20,1),(0xffffffff,0xffffffff)]:
     reset('transient-bests',[(0x1458b96cf,0x1458b9758)],{0x1458b9758});rows=mem+0x18000;u.reg_write(R.UC_X86_REG_R15,app);u.reg_write(R.UC_X86_REG_RBX,guid);u.reg_write(R.UC_X86_REG_R13,1000);put(bp+0xc0,'<I',current);put(app+0xb28,'<Q',rows);put(app+0xb30,'<Q',int(matching));put(rows+0x18,'<QII',guid,previous,2);put(app+0xee0,'<Q',6 if optional else(1<<64)-1);put(app+0xef8,'<QIIII',0xffffff,previous,3,4,5);put(app+0xad0,'<B',showcase);run(0x1458b96cf)
     expected=max(previous,current)if optional and guid==0xffffff and not matching else previous
     require(get(app+0xf00,'<IIII')==(expected,3,4,5),'Optional row updates only matching level after permanent miss');require(get(rows+0x20,'<II')==((max(previous,current),1000)if matching else(previous,2)),'Saved row maxima take precedence');fallbacks.append(dict(matching=matching,optional=optional,guid=guid,showcase=showcase,previous=previous,current=current))
grants=[]
for saved in [0,1]:
 reset('first-result-flag',[(0x1458b9758,0x1458b9789)],{0x1458b9762,0x1458b9789});u.reg_write(R.UC_X86_REG_R15,app);put(app+0x1162,'<B',saved);pc=run(0x1458b9758);require(pc==(0x1458b9762 if saved else 0x1458b9789),'First-result admission');require(get(app+0x1162,'<B')[0]==1,'First-result flag acknowledgement');grants.append(dict(kind='first-flag',before=saved))
for valid in [0,1]:
 for won in [0,1]:
  for old in [0,(1<<32)-1,(1<<64)-1]:
   reset('first-result-counts',[(0x1458b9ec9,0x1458b9f46)],{0x1458b9f46});rows=mem+0x18000;u.reg_write(R.UC_X86_REG_R15,app);u.reg_write(R.UC_X86_REG_RBX,42);u.reg_write(R.UC_X86_REG_R14,valid);put(app+0xb28,'<Q',rows);put(app+0xb30,'<Q',1);put(rows+0x18,'<Q',42);put(rows+0x28,'<II',old&0xffffffff,old&0xffffffff);put(app+0xcd0,'<QQ',old,old);put(bp+0x38,'<Q',won);run(0x1458b9ec9)
   require(get(rows+0x28,'<II')==((old+1)&0xffffffff,(old+won)&0xffffffff),'Per-character wrapping result counts');require(get(app+0xcd0,'<QQ')==((min((1<<64)-1,old+1),min((1<<64)-1,old+won))if valid else(old,old)),'Account saturating result counts');grants.append(dict(kind='first-counts',valid=valid,won=won,before=old))

xp_gates=[]
for guid in [42,0xfffffe,0xffffff]:
 for showcase in [0,1]:
  for amount in [0,1,0xffffffff]:
   reset('xp-admission',[(0x1458b8b1f,0x1458b8b3c)],{0x1458b8b3c,0x1458b96cf});u.reg_write(R.UC_X86_REG_RBX,guid);u.reg_write(R.UC_X86_REG_R8,amount);put(app+0xad0,'<B',showcase);pc=run(0x1458b8b1f);require((pc==0x1458b8b3c)==(guid!=0xffffff and amount!=0),'XP uses GUID and positive award, independently of showcase');xp_gates.append(dict(guid=guid,showcase=showcase,xp=amount,admitted=pc==0x1458b8b3c))

# Continuous selected phases retain the last observed terminal marker: the
# complete tick contains no running-phase store to +1166.
phase_sequences=[]
for sequence in [(4,1,4),(4,1,5),(5,1,5),(5,1,4),(1,2,3,4,4,5,5),(0,4,0,4)]:
 last=0;admissions=[]
 for phase in sequence:
  reset('continuous-phase',[(0x1458af14c,0x1458af17b),(0x1458af554,0x1458af55d)],{0x1458af17b,0x1458af55d});u.reg_write(R.UC_X86_REG_R12,app+0x10);put(bp+0x528,'<Q',app);put(app+0x10,'<I',0);put(app+0xad7,'<B',phase);put(app+0x1166,'<B',last);pc=run(0x1458af14c)
  expected=phase in [4,5] and phase!=last;require((pc==0x1458af55d)==expected,'Continuous terminal marker');last=get(app+0x1166,'<B')[0];admissions.append(expected)
 phase_sequences.append(dict(phases=sequence,admissions=admissions,last_terminal=last))

# The Save owner compares its sealed round trip, never the existing file. The
# native selector always calls the write leaf with sealed or plaintext bytes.
save_paths=[]
def save_seam(address):
 if ctx['mode']!='save-selector':return False
 if address==0x145bfa0e1:
  a,b,count=[u.reg_read(reg)for reg in [R.UC_X86_REG_RCX,R.UC_X86_REG_RDX,R.UC_X86_REG_R8]];u.reg_write(R.UC_X86_REG_RAX,int(bytes(u.mem_read(a,count))!=bytes(u.mem_read(b,count))));replay.return_seam();return True
 if address in [0x1400021d0,0x145bb6590]:replay.return_seam();return True
 if address==0x1458ef670:
  address,count=[u.reg_read(reg)for reg in [R.UC_X86_REG_RCX,R.UC_X86_REG_RDX]];ctx['writes'].append(bytes(u.mem_read(address,count)).decode());replay.return_seam();return True
 return False
replay.seam=save_seam
for decoded in [None,b'plain',b'wrong',b'longer']:
 for capacity in [0,8]:
  reset('save-selector',[(0x1458a343b,0x1458a34d0),(0x1458a39a4,0x1458a39d0)],{0x1458a34d0});ctx['writes']=[];plain,sealed,restored=mem+0x18000,mem+0x18100,mem+0x18200;u.mem_write(plain,b'plain');u.mem_write(sealed,b'sealed');u.mem_write(restored,decoded or b'');put(bp-0x60,'<qQQ',-1 if decoded is None else capacity,restored,len(decoded or b''));put(bp+0x1b0,'<QQ',plain,sealed);u.reg_write(R.UC_X86_REG_RBX,5);u.reg_write(R.UC_X86_REG_RSI,6);run(0x1458a343b);expected='sealed'if decoded==b'plain'else'plain';require(ctx['writes']==[expected],'Save selector always writes; round-trip comparison is not a dirty guard');save_paths.append(dict(decoded=None if decoded is None else decoded.decode(),capacity=capacity,writes=ctx['writes'][:]))
write_paths=[]
def write_seam(address):
 if ctx['mode']!='write-admission':return False
 if address==0x1458ef460:
  out=u.reg_read(R.UC_X86_REG_RCX);put(out,'<qQQ',4 if ctx['path']else-1,mem+0x18300,4);replay.return_seam();return True
 if address==0x145ba6e70:u.reg_write(R.UC_X86_REG_RAX,0 if not ctx['mkdir']else mem+0x18400);u.reg_write(R.UC_X86_REG_RDX,3);replay.return_seam();return True
 if address==0x145bae140:u.reg_write(R.UC_X86_REG_RAX,2);replay.return_seam();return True
 if address==0x145bbd750:
  ptr,count=[u.reg_read(reg)for reg in [R.UC_X86_REG_R8,R.UC_X86_REG_R9]];ctx['writes'].append(bytes(u.mem_read(ptr,count)).decode());u.reg_write(R.UC_X86_REG_RAX,2 if ctx['failed']else 0);replay.return_seam();return True
 if address in [0x1400021d0,0x145bb6590]:replay.return_seam();return True
 return False
replay.seam=write_seam
for path in [False,True]:
 for mkdir in [False,True]:
  for failed in [False,True]:
   reset('write-admission',[(0x1458ef670,0x1458ef7ac)],{done});ctx.update(path=path,mkdir=mkdir,failed=failed,writes=[]);u.mem_write(mem+0x18000,b'snapshot');u.reg_write(R.UC_X86_REG_RCX,mem+0x18000);u.reg_write(R.UC_X86_REG_RDX,8);run(0x1458ef670);require(ctx['writes']==(['snapshot']if path else[]),'Write leaf ignores mkdir/write errors after logging; only absent path skips');write_paths.append(dict(path=path,mkdir_error=mkdir,write_error=failed,writes=ctx['writes'][:]))
replay.seam=xp_seam

backup_gates=[]
for now,last in [(0,0),(3599,0),(3600,0),(3601,1),(0,1),(1,(1<<64)-1),((1<<64)-1,(1<<64)-1),((1<<64)-1,(1<<64)-3601)]:
 reset('backup-hour',[(0x1458a3a42,0x1458a3a5d)],{0x1458a3a5d,0x1458a3927});u.reg_write(R.UC_X86_REG_RDI,now);u.reg_write(R.UC_X86_REG_RAX,last);pc=run(0x1458a3a42);skip=last<=now and now-last<3600;require((pc==0x1458a3a5d)==skip,'Current hourly backup timestamp gate');backup_gates.append(dict(now=now,last=last,skip=skip))

# Source control flow and ordering are checked against the complete native
# caller: summary XP -> bests -> unlock -> run/win -> final Save -> counters,
# beat/run-feats/account-grants -> second Save. No Rust compiler executes.
source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text();owner=source.split('fn persist_run_at(',1)[1].split('\nfn hud(',1)[0];compact=''.join(owner.split())
for token in ['letaccount_eligible=phase_active&&saves_equipment;','letequipment=ifforce_summary{Vec::new()}else{game.drain_equipment()};','if!force_summary&&saves_equipment{','if!force_summary&&count_eligible{','letcount_eligible=account_eligible&&!showcase;','letterminal_edge=!force_summary&&phase_active&&game.take_terminal_phase_edge();','ifcount_eligible&&terminal_edge{','menu.record_character_bests(guid,result.level,result.seconds);','game.mark_terminal_summary_saved(delivery,false);','game.mark_terminal_summary_saved(delivery,true);']:
 require(token in compact,'Terminal account source: '+token)
ordered=['grant_terminal_xp(result.class,delivery.talent_xp)','menu.record_character_bests','open_next_zone(result.class,result.zone_key)','menu.backend_save.record_character_result','menu.backend_save.apply_run_totals','game.mark_terminal_summary_saved(delivery,false)','menu.commit_account();','menu.backend_save.apply_run_counts(delta)','menu.backend_save.record_beaten_zone','game.mark_terminal_summary_saved(delivery,true)','menu.commit_account();']
segment=compact.split('letdelivery=game.summary_delivery();',1)[1];cursor=0
for token in ordered:
 token=''.join(token.split());index=segment.find(token,cursor);require(index>=0,'Terminal snapshot order '+token);cursor=index+len(token)
require('menu.save'not in owner,'Terminal delivery must not read or mutate the frontend Save')
require('pending_account_counts'not in source and 'apply_run_count_delta'not in source,'Unsupported live-counter lifetime remains')
logout=source.split('fn native_requests(',1)[1].split('fn resolved_requests(',1)[0];require('game.abandon('not in logout,'Ordinary Logout must invoke summary without EndRun mutation')
save=(ROOT/'crates/azeroth-survivors-re/src/save/progress.rs').read_text();compact=''.join(save.split())
for token in ['pubfnrecord_character_bests','self.record_character_result_delta(guid,level,seconds,false,false)','runs.wrapping_add(u32::from(first_result))','wins.wrapping_add(u32::from(first_result&&won))']:
 require(token in compact,'Saved account lifetime: '+token)
menu_state=(ROOT/'crates/azeroth-survivors-re/src/menu_state.rs').read_text();method=menu_state.split('pub(crate) fn record_character_bests(',1)[1].split('    /// Ordinary stock login',1)[0];compact=''.join(method.split());require('ifself.backend_save.record_character_bests(guid,level,seconds){return;}'in compact and 'row.best_level=row.best_level.max(level);'in compact,'Saved-first optional-level fallback')
require('row.best_seconds='not in compact and 'row.runs='not in compact and 'row.wins='not in compact,'Optional row must not receive permanent result fields')
commit=menu_state.split('pub fn commit_account(',1)[1].split('#[cfg(test)]',1)[0];require('self.pending_saves.push(self.backend_save.clone());'in commit,'Ordered account snapshots must clone backend Save')
backend=(ROOT/'crates/azeroth-survivors-re/src/stock_frontend.rs').read_text().split('fn serve(',1)[1];require('startup.character'not in backend and 'menu.startup_character()'in backend,'Runtime roster must use mutable optional-row owner')
result=dict(target=manifest['target'],native_executions=len(xp)+2*len(pairs)+len(counts)+len(gates)+len(bests)+len(grants)+len(phase_edges)+len(summary_gates)+len(fallbacks)+len(save_paths)+len(write_paths)+len(xp_gates)+len(backup_gates)+sum(len(x['phases'])for x in phase_sequences),save_selector_cases=len(save_paths),write_admission_cases=len(write_paths),backup_hour_gate_cases=len(backup_gates),xp_admission_cases=len(xp_gates),continuous_phase_sequences=phase_sequences,xp_cases=len(xp),delta_cases=len(pairs),checkpoint_cases=len(pairs),terminal_count_cases=len(counts),post_summary_count_gate_cases=len(gates),terminal_phase_edge_cases=len(phase_edges),summary_admission_cases=len(summary_gates),character_best_cases=len(bests),transient_best_cases=len(fallbacks),first_result_grant_cases=len(grants),old_float_order_disagreements=len(disagreements),instructions=replay.instructions,xp_selected_cases=xp[:11],delta_boundary_cases=pairs[:7],terminal_count_boundary_cases=counts[:5],first_result_grant_cases_detail=grants,post_summary_count_gate_cases_detail=gates,terminal_phase_edge_cases_detail=phase_edges,summary_admission_cases_detail=summary_gates,character_best_selected=[x for x in bests if x['rows']<=1],limits=manifest['limitations'])
output.parent.mkdir(parents=True,exist_ok=True);output.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items()if not isinstance(v,(list,dict))}))

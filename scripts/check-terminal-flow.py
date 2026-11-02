#!/usr/bin/env python3
"""Verify current terminal command admission, FIFO lifetime and gossip completion. No source compiler or game application executes."""
from script_sources import load_script
import argparse, json, random, struct, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--python-libs',default='runtime/armory-recovery/python-libs')
parser.add_argument('--output',default='runtime/terminal-flow-0.109.0/static-check.json')
parser.add_argument('--prepare-rea',action='store_true')
args=parser.parse_args()
libs=(ROOT/args.python_libs).resolve();output=(ROOT/args.output).resolve()
if not libs.is_relative_to(ROOT) or not output.is_relative_to(ROOT/'runtime'):raise ValueError('Paths must remain project-local; output belongs in runtime/')
sys.path.insert(0,str(libs))
from native_terminal import NativeReplay, verified_input, prepare_rea, require
EVIDENCE=ROOT/'docs/analysis/evidence/0.109.0/terminal-flow'
manifest,target,data,pe=verified_input(EVIDENCE)
if args.prepare_rea:prepare_rea(EVIDENCE,manifest,data,pe,ROOT/'runtime/terminal-flow-0.109.0/reproduction')
model = load_script('xp_model', ROOT/'scripts/recover-terminal-contracts.py')
replay=NativeReplay(data,pe);u=replay.machine;R=replay.registers
mem,stack,done,bp,sp,app=replay.mem,replay.stack,replay.done,replay.bp,replay.sp,replay.app
ctx=replay.context
put,get,reset,run,scalar,raw=replay.put,replay.get,replay.reset,replay.run,replay.scalar,replay.raw
# Native action admission is checked independently of the Python FIFO models.
actions=[]
for action,command in enumerate([6,8,9]):
 reset('action-map',[(0x140287870,0x140287880)],{0x140287880});put(mem+0x15000,'<B',action);u.reg_write(R.UC_X86_REG_RDX,mem+0x15000);run(0x140287870);require(get(bp-0x58,'<I')[0]==command,'Action mapping');actions.append(dict(kind='command-map',action=action,command=command))
for tag in [0,1,2]:
 reset('again-take',[(0x1458bbc66,0x1458bbc7c)],{0x1458bbc7c,0x1458bd1e8});u.reg_write(R.UC_X86_REG_RSI,app);put(app+0x10,'<Q',tag);run(0x1458bbc66);require(get(app+0x10,'<Q')[0]==2,'Again must take Game before client admission');require(u.reg_read(R.UC_X86_REG_RIP)==(0x1458bd1e8 if tag==2 else 0x1458bbc7c),'Absent Again admission');actions.append(dict(kind='again-take',tag=tag))
for count in range(7):
 for mask in range(1<<count):
  expected=next((i for i in range(count)if mask>>i&1),None)
  for kind,start,end,stops,reg in [('again-client',0x1458bbc93,0x1458bbce2,{0x1458bca22,0x1458bd1de},R.UC_X86_REG_RBX),('menu-client',0x1458b831e,0x1458b835e,{0x1458b835e,0x1458b84f9},R.UC_X86_REG_RDI)]:
   reset(kind,[(start,end)],stops);u.reg_write(R.UC_X86_REG_RSI,app);u.reg_write(R.UC_X86_REG_RCX,app);put(app+0xb18,'<Q',count);put(app+0xb10,'<Q',mem+0x18000)
   for i in range(count):put(mem+0x18000+i*0xb0+0xa8,'<B',bool(mask>>i&1))
   pc=run(start);require(pc==(min(stops)if expected is not None else max(stops)),kind+' active path');require(expected is None or u.reg_read(reg)==expected,kind+' first client');actions.append(dict(kind=kind,count=count,mask=mask,index=expected))
for guid in [0,42,(1<<64)-1]:
 reset('again-gossip',[(0x1458bca22,0x1458bca29)],{0x1458bca29,0x1458bca8a});put(bp-0x40,'<Q',guid);pc=run(0x1458bca22);require(pc==(0x1458bca29 if guid else 0x1458bca8a),'Again old-player gossip guard');actions.append(dict(kind='again-gossip',guid=guid,admitted=bool(guid)))
for phase in range(7):
 for elapsed in [0.,300.,1800.25,36000.]:
  reset('continue',[(0x14591d6b0,0x14591d71a)],{0x14591d71a,0x14591d80a});u.reg_write(R.UC_X86_REG_RCX,app);u.mem_write(app,bytes((i*37+11)%256 for i in range(0x2000)));put(app+0xac7,'<B',phase);put(app+0xab8,'<B',0);put(app+0xa34,'<f',elapsed);before=bytes(u.mem_read(app,0x2000));pc=run(0x14591d6b0);after=bytes(u.mem_read(app,0x2000));expected=bytearray(before)
  if phase==5:expected[0xab8]=1;expected[0xac7]=1;struct.pack_into('<f',expected,0xa90,model.add(elapsed,300.));require(pc==0x14591d71a,'Victory admission')
  else:require(pc==0x14591d80a,'Nonvictory admission')
  require(after==bytes(expected),'Continue changed retained Game state');actions.append(dict(kind='continue',phase=phase,elapsed=elapsed,admitted=phase==5))
for phase in range(7):
 for count in [0,2]:
  reset('end-run',[(0x14594b330,0x14594b448)],{0x14594b383,0x14594b3c6,done});u.reg_write(R.UC_X86_REG_RCX,app);u.mem_write(app,bytes((i*53+7)%256 for i in range(0x2000)));put(app+0xac7,'<B',phase);put(app+0x658,'<Q',count);put(app+0x650,'<Q',mem+0x18000);put(app+0xa34,'<f',900.25);before=bytes(u.mem_read(app,0x2000));pc=run(0x14594b330);after=bytes(u.mem_read(app,0x2000));expected=bytearray(before)
  admitted=phase in [1,2,3]
  if admitted:
   struct.pack_into('<Q',expected,0x658,0)
   if count:require(pc==0x14594b383,'Choices retired first')
   else:
    require(pc==0x14594b3c6,'Freeze follows terminal stores');expected[0xac5]=255;expected[0xab7]=1;expected[0xac7]=4;struct.pack_into('<If',expected,0x978,1,900.25)
  else:require(pc==done and u.reg_read(R.UC_X86_REG_RAX)&255==0,'End Run admission')
  require(after==bytes(expected),'End Run changed retained Game state');actions.append(dict(kind='end-run',phase=phase,choices=count,admitted=admitted))
# Independent synchronous native-command model versus the source adapter's FIFO
# with a suspended constructor. No game tick or visibility event completes it.
import itertools
from collections import deque
queue_cases=[];old_disagreements=0
for length in range(5):
 for batch in itertools.product(range(3),repeat=length):
  for initial in [None,0,4,5]:
   for active in [False,True]:
    for factory in [None,0]:
     native=dict(phase=initial,active=active,generation=0,trace=[])
     for action in batch:
      if action==0:
       if native['phase'] is None:continue
       native['phase']=None;native['trace'].append('take')
       if native['active']:
        native['trace'].append('gossip');native['generation']+=1;native['phase']=factory;native['trace'].append(('constructed',native['generation'],factory))
      elif action==1:
       if native['phase']is not None:
        if native['phase']==5:native['phase']=1;native['trace'].extend(['unroot','endless'])
        native['trace'].append('gossip')
      elif native['active']:
       native['phase']=None;native['active']=False;native['trace'].append('logout')
     source=dict(phase=initial,active=active,generation=0,trace=[]);pending=deque(batch);replacing=False
     while pending or replacing:
      if replacing:
       source['generation']+=1;source['phase']=factory;source['trace'].append(('constructed',source['generation'],factory));replacing=False
       # This is enter()->TerminalState::begin, which preserves pending actions.
      if not pending:continue
      action=pending.popleft()
      if action==0:
       if source['phase']is None:continue
       source['trace'].append('take');source['phase']=None
       if not source['active']:continue
       source['trace'].append('gossip');replacing=True
      elif action==1:
       if source['phase']is None:continue
       if source['phase']==5:source['phase']=1;source['trace']+=['unroot','endless']
       source['trace']+=['gossip']
      elif source['active']:
       source['trace'].append('logout');source['active']=False;source['phase']=None
     require(source==native,'FIFO replacement-state disagreement')
     # Former find_map delivers only the first command; compare its complete
     # result, rather than counting a later no-op as a lost effect.
     old=dict(phase=initial,active=active,generation=0,trace=[])
     if batch:
      first=batch[0]
      if first==0 and initial is not None:
       old['phase']=None;old['trace'].append('take')
       if active:old['phase']=factory;old['generation']=1;old['trace'].extend(['gossip',('constructed',1,factory)])
      elif first==1 and initial is not None:
       if initial==5:old['phase']=1;old['trace'].extend(['unroot','endless'])
       old['trace'].append('gossip')
      elif first==2 and active:old['phase']=None;old['active']=False;old['trace'].append('logout')
     old_disagreements+=old!=native
     queue_cases.append(dict(actions=batch,initial_phase=initial,active=active,factory=factory,result=source))
# The one-byte Action table is current native data. The two empty gossip
# packets are current dispatcher instructions, not a convention inferred from WoW.
require(struct.unpack('<3I',raw(0x145df2800,12))==(6,8,9),'Current UI command table')
require(raw(0x1458bc227,7)==bytes.fromhex('66c74408187e01'),'Endless gossip packet')
require(raw(0x1458bca46,9)==bytes.fromhex('66c785980a00007e01'),'Again gossip packet')
source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/terminal.rs').read_text();compact=''.join(source.split())
for token in ['actions:VecDeque<TerminalAction>','if!self.replacing{self.actions.clear();}','whileletSome(action)=state.actions.pop_front()','ifmenu.entering{return;}','ifaction==TerminalAction::Again&&session.mechanics.is_none(){continue;}','ifaction==TerminalAction::Menu&&!active_client{continue;}','ifaction==TerminalAction::Again&&!active_client{session.mechanics=None;continue;}','state.replacing=true;break;']:
 require(token in compact,'Source command lifetime: '+token)
require('clicks.iter().find_map'not in compact,'First-press-only source path remains')
require(compact.count('SessionEvent::GossipComplete')==2,'Both native gossip-completion paths must be connected')
require('ifsession.mechanics.is_some()'in compact and 'player.guid!=0'in compact,'Gossip packet guards')
source_view=(ROOT/'crates/azeroth-survivors-re/src/gameplay/terminal_view.rs').read_text();button=source_view.split('fn button(',1)[1].split('fn survived(',1)[0];require('Interaction::None' in button and '\n        Button,' not in button and 'NativeHover'not in button,'Native Interaction-only terminal bundle')


result=dict(target=manifest['target'],native_executions=len(actions),fifo_model_cases=len(queue_cases),former_first_action_mismatch_cases=old_disagreements,instructions=replay.instructions,action_boundary_cases=actions,fifo_selected_cases=[row for row in queue_cases if row['actions'] in [(0,1,2),(1,0,2),(2,0,1)]],limits=manifest['limitations'])
output.parent.mkdir(parents=True,exist_ok=True);output.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items()if not isinstance(v,(list,dict))}))

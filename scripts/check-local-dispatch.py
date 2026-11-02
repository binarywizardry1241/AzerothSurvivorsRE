#!/usr/bin/env python3
"""Current local opcode-prefix classification and desktop Gossip capability proof."""
import argparse
import collections
import hashlib
import json
import itertools
import struct
from coverage_common import latest_target,file_sha256
from local_dispatch_native import DispatchProbe,H,VT,LEAF,PE,D,ENDS,ROOT
WORK=ROOT/'runtime/q41-local-dispatch-0.113.2'
KEEP=ROOT/'docs/analysis/evidence/0.113.2/local-dispatch.json'
PROFILES=[list(p)for p in itertools.product([False,True],repeat=3)]
def sha(data):return hashlib.sha256(data).hexdigest()
def compact(row):return json.dumps(row,sort_keys=True,separators=(',',':')).encode()
def ranges(values):
 result=[]
 for n in sorted(values):
  if result and result[-1][1]==n:result[-1][1]+=1
  else:result.append([n,n+1])
 return result
def native(a,b):
 off=PE.rva_offset(a-PE.image_base);return D[off:off+b-a]
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true');args=ap.parse_args()
 target=latest_target(verify=True);assert target['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
 p=DispatchProbe();profiles=[];effects=set();all_rows=[]
 for profile in PROFILES:
  digest=hashlib.sha256();groups=collections.defaultdict(list);rows=[]
  for op in range(65536):
   endpoint,trace,steps,access=p.route(op,profile);row=[op,endpoint,trace,steps,access];rows.append(row)
   digest.update(compact(row)+b'\n');groups[(endpoint,trace,steps,access)].append(op)
   if endpoint!='return':effects.add(op)
  profiles.append(dict(fields=profile,cases=len(rows),result_sha256=digest.hexdigest(),
   groups=[dict(endpoint=k[0],trace_sha256=k[1],steps=k[2],host_or_payload_access=k[3],count=len(v),opcode_ranges=ranges(v))for k,v in groups.items()]))
  all_rows.append(rows);print('profile',profile,'cases',len(rows),'groups',len(groups),flush=True)
 expected_effects={0x4b,0x50,0x56,0x5e,0x60,0x95,0xb1,*range(0xb5,0xc7),*range(0xc8,0xcc),0xda,0xdb,0xee,0x10a,0x10b,0x10c,0x10d,0x111,0x12e,0x13d,0x17c,0x17f,0x1ce,0x1dc}
 assert effects==expected_effects and len(effects)==43
 defaults=set(range(65536))-effects
 for rows in all_rows:
  for op in defaults:assert rows[op][1]=='return'and not rows[op][4],rows[op]
 aliases=[]
 for low in [0,0x4b,0x50,0x60,0xb5,0xc7,0x10a,0x136,0x17c,0x1ce,0xffff]:
  for high in [0x10000,0x80000000,0xffff0000]:
   got=p.route(high|low,PROFILES[-1]);assert got==all_rows[-1][low][1:];aliases.append([high|low,got])
 assert native(VT+64,VT+72)==struct.pack('<Q',LEAF)and native(LEAF,LEAF+3)==bytes.fromhex('31c0c3')
 capability=[]
 for previous in [0,1,2,127,128,255,256,65535,0xffffffff,0xffffffffffffffff]:
  got=p.capability(previous);assert got==0;capability.append([previous,got])
 guards=[]
 for cap in [0,1,2]:
  for kind in range(256):
   got=p.guard(0x1459672d0,ENDS[0x1459672d0],0x145967311,cap,kind)
   assert got==(cap!=0 and kind!=255);guards.append(['choice',cap,kind,got])
  got=p.guard(0x145969320,ENDS[0x145969320],0x145969361,cap,0)
  assert got==(cap==1);guards.append(['result',cap,got])
 # Current startup LEA/forwarders/store chain, reviewed with fresh Ghidra.
 code_ranges=[(0x14002ecc5,0x14002ecea),(0x14581ddaa,0x14581ddb8),(0x14581de44,0x14581de90),
  (0x145888036,0x145888064),(0x145867ab2,0x145867ace),(0x145880d6b,0x145880d83),
  (LEAF,LEAF+3),(0x1459672d0,0x145967311),(0x145969320,0x145969361)]
 spans=[dict(start=hex(a),end_exclusive=hex(b),sha256=sha(native(a,b)))for a,b in code_ranges]
 observations=[]
 for directory in [WORK/'rea-local',WORK/'rea-factory',WORK/'rea-host',WORK/'rea-capability']:
  for path in sorted(directory.glob('0*.json')):
   ev=json.loads(path.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
   if ev.get('operation')not in ['procedure_info','procedure_pseudo_code']:continue
   assert ev['subject']['digest']['sha256']==target['sha256']
   observations.append(dict(operation=ev['operation'],parameters=ev['parameters'],evidence_id=ev['evidence_id'],response_sha256=file_sha256(path)))
 assert len(observations)==26
 player=(ROOT/'crates/benilla-app/src/local_client/player.rs').read_text();assert player.count('names.insert_player(')>=2
 gossip=(ROOT/'crates/benilla-app/src/ui_gossip/mod.rs').read_text();assert 'let Some(npc) = state.npc else { continue };'in gossip and 'state.options.get(i as usize)'in gossip
 assert not any('SessionEvent::GossipMessage'in path.read_text()for path in (ROOT/'crates/azeroth-survivors-re/src').rglob('*.rs'))
 clock=(ROOT/'crates/benilla-app/src/ui_quest_log.rs').read_text();assert 'script.set_local_unix_time(local)'in clock
 result=dict(schema_version=1,target=target,gap_ids=[41],lead='Q41-M03-local-dispatch-1458646d0',
  incoming_range=dict(start=hex(H),end_exclusive=hex(ENDS[H]),sha256=sha(native(H,ENDS[H]))),
  profile_fields=['optional Game present: discriminant0 vs2 at wrapper+0x10','Game local/nonlocal flag at wrapper+0xc1d; true fixture is excluded-context prefix classification only','name fallback row present:0 vs-1 at wrapper+0x1390'],
  fixed_input=dict(local_channel_flag=0,channel_index=0,payload_hex=bytes(32).hex(),other_synthetic_host_bytes=0),profiles=profiles,
  opcode_cases=524288,effect_opcode_candidates=sorted(effects),default_opcode_count=len(defaults),default_opcode_ranges=ranges(defaults),
  default_observation='All65493 default opcodes return without reading/writing synthetic host or payload across these profiles; no downstream callee enters. These default traces depend only on opcode/static tables and stack state.',
  high_opcode_aliases=aliases,native_spans=spans,desktop_vtable=dict(address=hex(VT),slot=64,leaf=hex(LEAF),leaf_hex=native(LEAF,LEAF+3).hex(),factory_store='RBP+0xbb6 in Game beginning at RBP-0x48 = Game+0xbfe'),
  capability_cases=capability,choice_guard_cases=768,result_guard_cases=3,guard_results_sha256=sha(compact(guards)),ghidra_observations=observations,
  limits=['Only local-channel opcode prefixes execute, stopping before every callee outside the dispatcher. The true Game+0xc0d profile inventories an excluded nonlocal context; no downstream co-op/helper/network/server behavior executes or is implemented.',
   'Eight synthetic profiles and zero-filled32-byte payloads do not enumerate every live value/state/handler contract. The43 boundary candidates are not43 source defects or a complete semantic protocol enum.',
   'Current desktop LEA/argument/save/store and immutable vtable bytes establish the bounded capability chain. The actual false leaf and factory store execute; arbitrary vtable mutation, alias/resource/thread lifecycle and live runtime identity remain unverified.',
   'Current native choice/result guards suppress their alternative Gossip payloads with the desktop false capability. Full enabled-host Gossip presentation is not a missing desktop overlay and is not reconstructed here.',
   'Source inspection retains preseeded local names, absent AS Gossip-message producers and existing control/movement/template consumers. No reconstructed Rust/client/parser/VM executes; no source repair beyond the separately recorded64-67 findings is established by this classification.',
   'Clock/ping/chat/runtime context does not authorize generic engine or cooperative implementation. Full current native/system/source/alias accounting and original/rebuilt parity remain open; census/queue counts unchanged.'])
 data=json.dumps(result,indent=2)+'\n'
 import re
 data=re.sub(r'\{\n          \"endpoint\":.*?\n        \}',lambda m:json.dumps(json.loads(m[0]),separators=(',',':')),data,flags=re.S)
 out=WORK/'local-dispatch.json'if args.stage else KEEP
 if args.stage:out.write_text(data)
 else:assert out.read_text()==data
 print(json.dumps(dict(opcode_cases=524288,default_opcodes=len(defaults),boundary_candidates=len(effects),capability_cases=len(capability),guard_cases=len(guards),source_executed=False,parity_verified=False)))
if __name__=='__main__':main()

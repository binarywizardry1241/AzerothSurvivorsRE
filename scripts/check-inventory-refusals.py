#!/usr/bin/env python3
"""Reproduce current AS inventory refusal routing and response bytes; no build/game."""
import argparse
import hashlib
import json
import re
import struct
from pathlib import Path
from coverage_common import latest_target,file_sha256
from inventory_refusal_native import RefusalProbe,H,S,PE,D,ENDS,ROOT

WORK=ROOT/'runtime/q41-inventory-refusal-0.113.2'
KEEP=ROOT/'docs/analysis/evidence/0.113.2/inventory-refusals.json'
OPS=[0x10a,0x10b,0x10c,0x10d,0x111]
def encoded(value):return json.dumps(value,sort_keys=True,separators=(',',':')).encode()
def expected(op,payload):
 first=payload[0]if payload else 0;second=payload[1]if len(payload)>1 else 0
 slot=first if op==0x10d else second
 return [0x18 if op==0x111 else 0x15,0x4000000000000100|slot if slot<19 else 0]
def packet(reason,guid):return [0x112,(bytes([reason])+struct.pack('<QQB',guid,0,0)).hex()]
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true');args=ap.parse_args()
 target=latest_target(verify=True);assert target['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
 p=RefusalProbe();prefix=hashlib.sha256();packets=hashlib.sha256();count=0;packet_count=0;short_count=0;fixtures=[]
 for op in OPS:
  for first in range(256):
   for second in range(256):
    payload=bytes([first,second]);want=expected(op,payload);assert p.request(op,payload)==want
    prefix.update(struct.pack('<HBB',op,first,second)+struct.pack('<BQ',*want));count+=1
  for payload in [b'',*(bytes([i])for i in range(256))]:
   want=expected(op,payload);got=p.request(op,payload,True);assert got==packet(*want)
   packets.update(encoded([op,payload.hex(),got])+b'\n');packet_count+=1;short_count+=1
  for slot in range(256):
   payload=bytes([(slot*73+19)%256,slot,slot^255,17,83,0,255]);want=expected(op,payload)
   got=p.request(op,payload,True);assert got==packet(*want)
   packets.update(encoded([op,payload.hex(),got])+b'\n');packet_count+=1
  for first in [0,18,19,255]:
   for second in [0,18,19,255]:
    want=expected(op,bytes([first,second]));got=p.request(op,bytes([first,second]),True)
    assert got==packet(*want)
    fixtures.append(dict(opcode=op,first=first,second=second,reason=want[0],guid=want[1],packet_opcode=got[0],packet_hex=got[1]))
  print(f'{op:#x}: all65536 byte pairs and513 wire cases pass',flush=True)
 assert count==327680 and packet_count==2565 and short_count==1285
 requests=(ROOT/'crates/benilla-app/src/local_client/requests.rs').read_text()
 for clause in ['opcode: 0x10a, first: bag_index, second: slot','opcode: 0x10b, first: src_bag, second: src_slot',
  'opcode: 0x10c, first: dst_bag, second: dst_slot','opcode: 0x10d, first: src_slot, second: dst_slot',
  'opcode: 0x111, first: bag_index, second: slot']:assert clause in requests
 source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/client/inventory_requests.rs').read_text()
 for token in ['0x10a | 0x10b | 0x10c => (0x15, second)','0x10d => (0x15, first)',
  '0x111 => (0x18, second)','slot < 19','0x4000_0000_0000_0100 | u64::from(slot)',
  '&0u64.to_le_bytes()','body.push(0)','parse_server(0x112, &body)','benilla_protocol::decode(packet)']:assert token in source
 gameplay=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
 assert 'LocalClientRequest::InventoryChange { opcode, first, second }'in gameplay
 assert 'client::inventory_requests::refused(opcode, first, second)'in gameplay
 assert 'presentation.0.push(event)'in gameplay
 handler=(ROOT/'crates/benilla-app/src/ui_items/net.rs').read_text()
 assert 'unlocks: [item_guid, item2_guid]'in handler and 'equip_errors.0.push(EquipError'in handler
 ranges=[]
 for a,b in [(H,ENDS[H]),(S,ENDS[S])]:
  off=PE.rva_offset(a-PE.image_base);ranges.append(dict(start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(D[off:off+b-a]).hexdigest()))
 observations=[]
 files=[ROOT/'runtime/q41-creature-query-0.113.2/rea-incoming/003-procedure_info.json',ROOT/'runtime/q41-creature-query-0.113.2/rea-incoming/005-procedure_pseudo_code.json',
  WORK/'rea-refusal/003-procedure_info.json',WORK/'rea-refusal/005-procedure_pseudo_code.json']
 for path in files:
  ev=json.loads(path.read_text())['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==target['sha256']
  observations.append(dict(operation=ev['operation'],parameters=ev['parameters'],evidence_id=ev['evidence_id'],response_sha256=file_sha256(path)))
 result=dict(schema_version=1,target=target,gap_ids=[41,67],lead='Q41-M03-inventory-refusal-1458646d0',native_ranges=ranges,ghidra_observations=observations,
  two_byte_cases=count,two_byte_results_sha256=prefix.hexdigest(),wire_cases=packet_count,wire_results_sha256=packets.hexdigest(),truncated_wire_cases=short_count,
  source_fixtures=fixtures,source_guards='Five actual command/wire-byte projections, AS refusal builder, presentation push and existing error/unlock consumer inspected; source not executed.',
  limits=['Only five selected local request branches and native refusal serializer execute with synthetic host/state; no co-op branch, server, transport or game runs.',
   'Allocation and final sender are explicit seams; the original 18-byte body is captured before sending. No reconstructed Rust or native client parser executes.',
   'First/second bytes are zero-filled when absent. Extra bytes, bag identity, source slot in SwapItem, destination slot in SwapInvItem and destroy count do not affect this native branch.',
   'Source reuses the real protocol decoder and existing InventoryFailure/error/unlock handler. Authored Rust bridge, projection and decoder regressions remain uncompiled/unrun.',
   'Actual inventory drag/destroy/lock/error timing, active/teardown scheduling, FrameXML and original/rebuilt UI parity remain unverified. Other incoming opcodes, full native protocol and global aliases stay open under41; census/selectors unchanged.'])
 data=json.dumps(result,indent=2)+'\n'
 data=re.sub(r'\{\n      \"opcode\":.*?\n    \}',lambda m:json.dumps(json.loads(m[0]),separators=(',',':')),data,flags=re.S)
 out=WORK/'inventory-refusals.json'if args.stage else KEEP
 if args.stage:out.write_text(data)
 else:assert out.read_text()==data
 print(json.dumps(dict(prefix_cases=count,wire_cases=packet_count,source_fixtures=len(fixtures),source_executed=False,parity_verified=False)))
if __name__=='__main__':main()

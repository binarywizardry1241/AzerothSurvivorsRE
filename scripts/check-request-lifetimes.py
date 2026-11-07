#!/usr/bin/env python3
"""Replay stateless local requests across optional-Game states; no compilation/game."""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, file_sha256
from creature_query_native import PE,D,ENDS
from request_lifetime_native import LifetimeProbe,H

WORK=ROOT/'runtime/analysis/history/findings/q41-all/f1125d689593'
KEEP=ROOT/'docs/analysis/evidence/request-lifetimes.json'


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage',action='store_true')
    args=ap.parse_args()
    t=latest_target(verify=True)
    assert t['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    probe,digest,count,fixtures=LifetimeProbe(),hashlib.sha256(),0,[]
    def compare(op,payload,fixture=False):
        nonlocal count
        pair=[probe.response(op,payload,game)for game in [False,True]]
        if op==0x12e:
            spell=int.from_bytes(payload[:4].ljust(4,b'\0'),'little')
            assert pair==[dict(constructor=[spell,0x17],sends=1,post_response_calls=int(game))for game in [False,True]]
        else:
            assert pair[0]==pair[1]
            assert pair[0][0]=={0x5e:0x5f,0x60:0x61}.get(op,0x112)
            if op in [0x10a,0x10b,0x10c,0x10d,0x111]:
                selected=0 if len(payload)<(1 if op==0x10d else 2) else payload[0 if op==0x10d else 1]
                guid=0x4000000000000100|selected if selected<19 else 0
                assert pair[0][1]==struct.pack('<BQQB',0x18 if op==0x111 else 0x15,guid,0,0).hex()
        row=[op,payload.hex(),pair]
        digest.update((json.dumps(row,separators=(',',':'))+'\n').encode())
        count+=2
        if fixture:fixtures.append(row)
    for op in [0x5e,0x60,0x12e]:
        for value in range(65536):compare(op,struct.pack('<I',value))
        print(hex(op),'all65536 values agree across optional Game states',flush=True)
    for op in [0x10a,0x10b,0x10c,0x10d,0x111]:
        for slot in range(256):compare(op,bytes([slot,slot]))
    for op in [0x5e,0x60,0x10a,0x10b,0x10c,0x10d,0x111,0x12e]:
        for n in range(17):compare(op,bytes(range(n)),fixture=n in [0,1,2,3,4,16])
    for op in [0x5e,0x60,0x12e]:
        for value in [0x7fffffff,0x80000000,0xfffffffe,0xffffffff]:compare(op,struct.pack('<I',value),fixture=True)
    driver_path='crates/azeroth-survivors-re/src/gameplay/mod.rs'
    queue_path='crates/benilla-app/src/local_client/requests.rs'
    driver,queue=(ROOT/driver_path).read_text(),(ROOT/queue_path).read_text()
    body=driver[driver.index('fn resolved_requests('):driver.index('fn flush_exit(')]
    assert 'let active = local.as_deref().is_some_and(|s| s.active);' in body
    assert 'let active = session.mechanics.is_some();' not in body
    assert body.index('if !active {')<body.index('LocalClientRequest::InventoryChange')
    verb=body[body.index('LocalClientRequest::GameObjectUse { guid }'):]
    assert verb.index('session.mechanics.is_none()')<verb.index('session.mechanics.as_mut().unwrap().click_cache')
    assert 'if !session.active {' in queue and 'if session.active {' in queue
    observations=[]
    for p in sorted((WORK/'rea-local-contracts').glob('0*.json')):
        e=json.loads(p.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
        if e.get('operation') not in ['procedure_info','procedure_pseudo_code']or e.get('parameters',{}).get('procedure')!=hex(H):continue
        assert e['subject']['digest']['sha256']==t['sha256']
        observations.append(dict(operation=e['operation'],parameters=e['parameters'],evidence_id=e['evidence_id'],response_sha256=file_sha256(p)))
    assert len(observations)==2
    at=PE.rva_offset(H-PE.image_base)
    result=dict(schema_version=1,target={k:t[k]for k in ['version','path','sha256','size_bytes']},gap_ids=[41,64,65,67,70],
        lead='Q41-M03-local-request-lifetimes-1458646d0',native_cases=count,result_sha256=digest.hexdigest(),fixtures=fixtures,
        native_handler=dict(start=hex(H),end_exclusive=hex(ENDS[H]),sha256=hashlib.sha256(D[at:at+ENDS[H]-H]).hexdigest()),
        ghidra_observations=observations,source_hashes={p:file_sha256(ROOT/p)for p in [driver_path,queue_path]},
        limits=[
            'Metadata and inventory refusal wire serializers execute with synthetic wrapper, memory/locale/allocation/copy/sender seams. Existing value/locale/wire proofs retain their narrower service boundaries.',
            'Cast constructor arguments and sender/postresponse calls are observed boundaries. Cast serialization and postresponse player-context behavior do not execute; no new cast-wire or actor-selection equivalence is asserted.',
            'All65536 u16 values for Creature/GameObject/cast in both Game states,256 inventory slot bytes per command,17 payload lengths and four extra u32 boundaries are bounded domains, not exhaustive arbitrary memory/protocol states.',
            'Local source admission uses the existing LocalClientSession.active channel lifecycle. Only GameObjectUse additionally needs mechanics; no host/socket/co-op or generic engine reconstruction.',
            'One new live bridge regression and three adjusted lifecycle fixtures are authored/uncompiled/unrun. No reconstructed Rust/ECS/client/VM/FrameXML, OS, game or original/rebuilt parity executes; original census/selector counts remain unchanged.'])
    text=json.dumps(result,indent=2)+'\n'
    if args.stage:(WORK/'request-lifetimes.json').write_text(text)
    else:assert KEEP.read_text()==text
    print(json.dumps(dict(native_cases=count,fixtures=len(fixtures),parity_verified=False)))


if __name__=='__main__':main()

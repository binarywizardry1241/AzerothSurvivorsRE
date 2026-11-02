#!/usr/bin/env python3
"""Verify bounded 0.120.2 original boss-credit contracts; run no game or Rust code."""
from portable_paths import portable_json
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes,project_path
from script_sources import load_script
from native_terminal import NativeReplay

EVIDENCE=ROOT/'docs/analysis/evidence/0.120.2/party-achievement-share'
def digest(raw):return hashlib.sha256(raw).hexdigest()
def require(value,message):
    if not value:raise ValueError(message)

def replay(data,pe):
    raw=data
    n=NativeReplay(raw,pe);r=n.registers;u=n.machine
    count_cases=history_cases=0
    for recipient,killer,finished,phase,old,total in itertools.product(range(3),range(3),[0,1],[1,4],[0,99,0xffffffff],[0,1,2]):
     n.reset('counter',[(0x145b4691a,0x145b46974)],{0x145b46974});game=n.app;wrapper=n.mem+0x4000;vec=n.mem+0x5000;arr=n.mem+0x6000;calls=[]
     n.put(wrapper+0x10,'<Q',vec);n.put(vec,'<QQQ',8,arr,total);n.put(game+0xb98,'<Q',recipient);n.put(game+0xc8f,'<B',finished);n.put(game+0xca2,'<B',phase);n.put(game+0x7b8,'<I',old)
     killers=[killer,(killer+1)%3][:total]
     for i,k in enumerate(killers):n.put(arr+i*16,'<QQ',k,0x100+i)
     u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_RDI,wrapper)
     def seam(a):
      if a!=0x145bb6b60:return False
      calls.append(u.reg_read(r.UC_X86_REG_RDX));n.return_seam();return True
     n.seam=seam;n.run(0x145b4691a);expected=[0x100+i for i,k in enumerate(killers) if k!=recipient and not finished]
     assert calls==expected,(recipient,killer,finished,phase,total,calls,expected)
     assert n.get(game+0x7b8,'<I')[0]==(old+len(expected))&0xffffffff
     count_cases+=1
    for recipient,killer,finished,phase,prefix,total in itertools.product(range(3),range(3),[0,1],[1,4],[0,1],[0,1,2]):
     n.reset('histories',[(0x145b4697b,0x145b46a51)],{0x145b46a51});game=n.app;wrapper=n.mem+0x4000;vec=n.mem+0x5000;arr=n.mem+0x6000;pairs=n.mem+0x7000;rows=n.mem+0x8000
     n.put(wrapper+0x18,'<Q',vec);n.put(vec,'<QQQ',8,arr,total);n.put(game+0xb98,'<Q',recipient);n.put(game+0xc8f,'<B',finished);n.put(game+0xca2,'<B',phase);n.put(game+0x718,'<QQQ',8,pairs,prefix);n.put(game+0x730,'<QQQ',8,rows,prefix)
     if prefix:n.put(pairs,'<II',1,2);n.put(rows,'<IIBBBx',1,2,3,0,1)
     killers=[killer,(killer+1)%3][:total];payloads=[]
     for i,k in enumerate(killers):
      value=(694+i,133+i,i+1,i%4,i%2);n.put(arr+i*24,'<QIIBBB5x',k,*value);payloads.append(value)
     u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_RDI,wrapper);n.seam=None;n.run(0x145b4697b)
     expected=[v for k,v in zip(killers,payloads) if k!=recipient and not finished]
     assert n.get(game+0x728,'<Q')[0]==prefix+len(expected);assert n.get(game+0x740,'<Q')[0]==prefix+len(expected)
     if prefix:assert n.get(pairs,'<II')==(1,2) and n.get(rows,'<IIBBBx')==(1,2,3,0,1)
     for i,v in enumerate(expected,prefix):assert n.get(pairs+i*8,'<II')==v[:2] and n.get(rows+i*12,'<IIBBBx')==v
     history_cases+=1
    return {'counter_cases':count_cases,'history_cases':history_cases,'instructions':n.instructions}

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--require-retained-queries',action='store_true')
    ap.add_argument('--output')
    ap.add_argument('--source-at', help='Verify historical audit observations at this exact Git commit')
    args=ap.parse_args()
    manifest=json.loads((EVIDENCE/'manifest.json').read_text())
    target=latest_target(verify=True)
    require(all(target[k]==v for k,v in manifest['target'].items()),'Current installed target differs')
    data=target_bytes(target)
    pe=load_script('party_share_pe',ROOT/'scripts/inventory-executable.py').PE(data)
    instructions=0
    for row in manifest['native_ranges']:
        lo,hi=int(row['start'],16),int(row['end_exclusive'],16)
        off=pe.rva_offset(lo-pe.image_base);raw=data[off:off+hi-lo]
        require(off==int(row['file_offset'],16) and len(raw)==row['size_bytes'] and digest(raw)==row['sha256'],row['role']+' original bytes')
        asm=(ROOT/row['assembly']).read_bytes();require(digest(asm)==row['assembly_sha256'],row['role']+' assembly hash')
        cursor=lo;blob=bytearray();count=0
        for line in asm.decode().splitlines():
            address,encoded,_=line.split(' ',2);opcodes=bytes.fromhex(encoded)
            require(int(address,16)==cursor and opcodes,row['role']+' instruction boundary')
            cursor+=len(opcodes);blob.extend(opcodes);count+=1
        require(cursor==hi and bytes(blob)==raw and count==row['instruction_count'],row['role']+' complete byte stream')
        instructions+=count
    retained=0
    for row in manifest['queries']:
        paths={kind:ROOT/row[kind] for kind in ['plan','journal','result']}
        if not all(p.is_file() for p in paths.values()):
            require(not args.require_retained_queries,'Retained query unavailable: '+row['procedure']);continue
        for kind,p in paths.items():require(digest(p.read_bytes())==row[kind+'_sha256'],kind+' receipt')
        s=json.loads(paths['result'].read_text())['structuredContent']
        require(s['subject']['digest']['sha256']==target['sha256'],'Ghidra target hash')
        require(s['evidence_id']==row['evidence_id'] and s['analysis_profile']['digest']==row['analysis_profile_digest'],'Ghidra evidence/profile')
        require(digest(s['normalized_result'].encode())==row['normalized_sha256'],'Ghidra complete result')
        retained+=1
    # These are explicit pre-repair source observations, not implementation assertions.
    for row in manifest['source_observations']:
        if args.source_at:
            require(len(args.source_at)==40 and all(c in '0123456789abcdef' for c in args.source_at),'Expected exact source commit')
            text=subprocess.run(['git','show',args.source_at+':'+row['path']],cwd=ROOT,
                check=True,capture_output=True,text=True).stdout
        else:text=(ROOT/row['path']).read_text()
        lo=text.index(row['start_marker']);hi=text.index(row['end_marker'],lo+len(row['start_marker']))
        require(digest(text[lo:hi].encode())==row['sha256'],'Source observation changed; review independently: '+row['role'])
    result=dict(target_sha256=target['sha256'],native_ranges=len(manifest['native_ranges']),native_bytes=sum(r['size_bytes'] for r in manifest['native_ranges']),native_instructions=instructions,retained_queries_verified=retained,**replay(data,pe),source_omissions=manifest['source_status'],limits=['Original instruction windows in scratch memory; preallocated vectors avoid allocator branches.','Equipment callback is an explicit argument-recording seam; no loot/RNG behavior is executed.','Source observations describe missing reconstruction branches; this passing native proof does not mean source is implemented.','No application compilation, Rust tests, client/game/server/network execution, save operation or parity comparison.'])
    if args.source_at:result['source_observation_commit']=args.source_at
    if args.output:project_path(args.output).write_text(portable_json(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))

if __name__=='__main__':main()

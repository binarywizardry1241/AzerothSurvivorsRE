#!/usr/bin/env python3
"""Check the current native achievement descriptor catalog without compiling.

Original constructor and gear-iterator instructions run with declared synthetic
allocation, formatting and translation interfaces. No game/client/server runs.
"""
from portable_paths import portable_json, portable_record
import sys, struct, json, hashlib, argparse
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r

ASSET = ROOT / 'crates/azeroth-survivors-re/assets/achievement-catalog-0.121.0.json'
PROOF = ROOT / 'docs/analysis/evidence/0.121.0/achievement-catalog.json'

def recover(keys, x, data, p):
    u=Uc(UC_ARCH_X86,UC_MODE_64);size=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in p.sections);u.mem_map(p.image_base,(size+4095)&~4095)
    for s in p.sections:u.mem_write(p.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
    u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);cursor=HEAP+0x1000
    KEYS=keys
    lookups=[]
    calls={};formats=[];replacements=[];visited=set();admitted=[(0x145b973b0,0x145ba0d42)]
    rv,sz=p.directories[3];off=p.rva_offset(rv);entries=[struct.unpack_from('<III',data,a)for a in range(off,off+sz,12)]
    for a in [0x145c7d050]:
     for start,end,unwind in entries:
      if p.image_base+start==a:admitted.append((a,p.image_base+end));None
    def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
    def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
    def alloc(n):
     nonlocal cursor
     a=cursor;cursor+=(n+15)&~15;assert cursor<HEAP+0x1000000;u.mem_write(a,bytes(n));return a
    def text(a,n):return bytes(u.mem_read(a,n)).decode()
    def pair(a):return text(q(a),q(a+8))
    def outstr(dest,value):
     raw=value.encode();a=alloc(len(raw)+1);u.mem_write(a,raw);u.mem_write(dest,struct.pack('<QQQ',len(raw),a,len(raw)))
    def fmarg(a):
     at,fun=q(a),q(a+8)
     if fun>=0x146100000:fun=q(fun+24)
     if fun==0x1400020c0:return pair(at)
     if fun==0x1400020e0:return pair(at+8)
     if fun==0x145fd1310:return str(q(at))
     if fun==0x145fd0420:return str(struct.unpack('<I',u.mem_read(at,4))[0])
     # Exact formatter identities are recovered from incoming constructor args;
     # unknowns fail rather than guessing a representation.
     raise RuntimeError('formatter '+hex(fun)+' data '+hex(at))
    def ret(value=None):
     if value is not None:u.reg_write(r.UC_X86_REG_RAX,value)
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,q(sp));u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,a,n,unused):
     if any(s<=a<e for s,e in admitted):visited.add(a);return
     if a==STOP:u.emu_stop();return
     calls[a]=calls.get(a,0)+1
     rcx=u.reg_read(r.UC_X86_REG_RCX);rdx=u.reg_read(r.UC_X86_REG_RDX);r8=u.reg_read(r.UC_X86_REG_R8);r9=u.reg_read(r.UC_X86_REG_R9);sp=u.reg_read(r.UC_X86_REG_RSP)
     if a==0x145feb0e0:pass
     elif a==0x146051160:
      # Vec capacity grow: inspect exact constructor record storage width below.
      old=q(rcx);new=max(4,old*2);dest=alloc(new*152)
      if old:u.mem_write(dest,bytes(u.mem_read(q(rcx+8),q(rcx+16)*152)))
      wq(rcx,new);wq(rcx+8,dest)
     elif a==0x145fec390:
      old=q(rcx);new=max(4,old*2,rdx+r8);dest=alloc(new*r9)
      if old:u.mem_write(dest,bytes(u.mem_read(q(rcx+8),q(rcx+16)*r9)))
      wq(rcx,new);wq(rcx+8,dest)
     elif a==0x145aeaf60:
      key=text(rcx,rdx);lookups.append(key)
      if KEYS:
       raw=('@'+key+'@').encode();dest=alloc(len(raw)+1);u.mem_write(dest,raw);u.reg_write(r.UC_X86_REG_RAX,dest);u.reg_write(r.UC_X86_REG_RDX,len(raw))
      else:u.reg_write(r.UC_X86_REG_RDX,0);u.reg_write(r.UC_X86_REG_RAX,0)
     elif a in [0x140002200,0x1400021d0]:pass
     elif a==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,alloc(rcx))
     elif a==0x145febc1b:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(r.UC_X86_REG_RAX,rcx)
     elif a==0x145fbe970:
      ptr=rdx;argi=0;value=''
      while True:
       op=u.mem_read(ptr,1)[0];ptr+=1
       if op==0:break
       if op<0x80:value+=text(ptr,op);ptr+=op;continue
       assert op==0xc0,hex(op)
       value+=fmarg(r8+argi*16);argi+=1
      formats.append({'site':hex(q(sp)-5),'value':value});outstr(rcx,value)
     elif a==0x145aeb340:
      value=text(rdx,r8);original=value;tokens={}
      if KEYS:value='@'+value+'@'
      for i in range(q(sp+0x28)):
       key=pair(r9+i*32);arg=fmarg(r9+i*32+16);tokens[key]=arg;value=value.replace('{'+key+'}',arg)
      replacements.append(dict(original=original,tokens=tokens,value=value));outstr(rcx,value)
     else:raise RuntimeError('unreviewed call '+hex(a)+' from '+hex(q(sp)-5)+' regs '+str(list(map(hex,[rcx,rdx,r8,r9]))))
     ret()
    u.hook_add(UC_HOOK_CODE,hook);out=HEAP;sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,out)
    try:u.emu_start(0x145b973b0,STOP,count=3000000)
    except Exception as e:raise RuntimeError('PC '+hex(u.reg_read(r.UC_X86_REG_RIP))+': '+str(e))from e

    rows=[]
    for i in range(q(out+16)):
     a=q(out+8)+i*152;raw=bytes(u.mem_read(a,152));pairs={}
     for j in range(0,137,8):
      ptr,n=struct.unpack_from('<QQ',raw,j)
      if 0<n<1000 and ptr>0x140000000:
       try:pairs[j]=text(ptr,n)
       except:pass
     rows.append({'index':i,'hex':raw.hex(),'pairs':pairs})

    return dict(rows=rows,lookups=lookups,formats=formats,replacements=replacements,visited_count=len(visited),calls={hex(k):v for k,v in calls.items()})

def normalize(raw, keyed):
    def field(value):
        replacements = [row for row in keyed['replacements'] if row['value'] == value]
        if replacements:
            row = replacements[0]
            return row['original'].strip('@'), {key:val.strip('@') for key,val in row['tokens'].items()}
        return value.strip('@'), {}
    rows=[]
    for original, entry in zip(raw['rows'],keyed['rows']):
        assert original['pairs'][8]==entry['pairs'][8]
        name, tokens = field(entry['pairs'][32])
        description, more = field(entry['pairs'][56])
        assert all(key not in tokens or tokens[key]==val for key,val in more.items())
        tokens.update(more)
        binary=bytes.fromhex(original['hex'])
        rows.append(dict(key=entry['pairs'][8], name=name, description=description,
                         icon=entry['pairs'][128],points=struct.unpack_from('<I',binary,144)[0],
                         category=binary[148],tokens=tokens))
    return rows

def query_receipt(folder, procedure):
    from discovery_native_subject import verify_native_query_subject
    folder=ROOT/folder
    plan_path=ROOT/json.loads((folder/'journal.json').read_text())['identity']['plan']['plan_path']
    plan=json.loads(plan_path.read_text())
    result_path=None
    for candidate in (folder/'results').glob('*.json'):
        result=json.loads(candidate.read_text())
        native=result.get('structuredContent') or json.loads(result['content'][0]['text'])
        if native['parameters'].get('procedure')==procedure:
            result_path=candidate
            break
    assert result_path is not None,(folder,procedure)
    def ref(path):
        return dict(path=path.relative_to(ROOT).as_posix(),sha256=hashlib.sha256(path.read_bytes()).hexdigest())
    receipt=dict(procedure=procedure,evidence_id=native['evidence_id'],provider=native['provider'],
        analysis_profile_digest=native['analysis_profile']['digest'],
        normalized_text_sha256=hashlib.sha256(native['normalized_result'].encode()).hexdigest(),
        result=ref(result_path),plan=ref(plan_path),journal=ref(folder/'journal.json'),
        raw_input=ref(ROOT/plan['target']),slice_virtual_address=plan['open_options']['entry_point'])
    return receipt,native

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
    x=latest_target(verify=True)
    assert x['sha256']=='22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
    data=target_bytes(x);p=load_script('catalog_pe',ROOT/'scripts/inventory-executable.py').PE(data)
    rows=normalize(recover(False,x,data,p),recover(True,x,data,p))
    assert len(rows)==len({row['key'] for row in rows})==124
    asset=dict(version=x['version'],target_sha256=x['sha256'],achievements=rows)
    ranges=[]
    for start,end,role in [(0x145b973b0,0x145ba0d42,'catalog-constructor'),(0x145c7d050,0x145c7d51b,'class-gear-iterator')]:
        offset=p.rva_offset(start-p.image_base);raw=data[offset:offset+end-start]
        ranges.append(dict(role=role,virtual_address=hex(start),file_offset=hex(offset),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest()))
    from discovery_native_subject import verify_native_query_subject
    queries=[]
    receipt,native=query_receipt('runtime/analysis/history/findings/fixgap230239/aed9aeb16797/achievements/query','0x145b973b0')
    verify_native_query_subject(ROOT,native,receipt,{k:x[k] for k in ('version','path','sha256','size_bytes')},image=data,pe=p)
    queries.append(receipt)
    consumer_path = 'crates/azeroth-survivors-re/src/progression.rs'
    consumer = (ROOT / consumer_path).read_text()
    start, end = '//145b973b0 supplies the complete current order', '// Native unlock rows retain'
    at = consumer.index(start); stop = consumer.index(end, at)
    selected = consumer[at:stop]
    for anchor in ('../assets/achievement-catalog-0.121.0.json',
                   'catalog.achievements = current.achievements.into_iter()',
                   'entry.unlocks = prior.remove(&entry.key).unwrap_or_default()'):
        assert anchor in selected, anchor
    proof=dict(schema_version=1,target={k:x[k] for k in ('version','path','sha256','size_bytes')},gap_ids=[237],queries=queries,native_ranges=ranges,
               entries=len(rows),total_points=sum(row['points']for row in rows),
               category_counts=[sum(row['category']==cat for row in rows)for cat in range(7)],
               asset_path=ASSET.relative_to(ROOT).as_posix(),
               asset_sha256=hashlib.sha256((json.dumps(asset,ensure_ascii=False,indent=2)+'\n').encode()).hexdigest(),
               source_consumer=dict(path=consumer_path,start=start,end=end,sha256=hashlib.sha256(selected.encode()).hexdigest()),
               seams=['synthetic allocation/Vec growth/memcpy','original formatter identities for strings and u32/u64','missing-locale fallback and keyed locale sentinel','native token-replacement interface'],
               historical_unlocks='Existing source rewards retain their own evidence; current menu descriptors do not independently establish reward grants.',
               compilation='not_run',application_executed=False,parity_verified=False)
    if args.write:
        ASSET.write_text(portable_json(asset,ensure_ascii=False,indent=2)+'\n')
        PROOF.write_text(portable_json(proof,ensure_ascii=False,indent=2)+'\n')
    else:
        assert portable_record(json.loads(ASSET.read_text()))==portable_record(asset),'Current descriptor catalog changed'
        assert portable_record(json.loads(PROOF.read_text()))==portable_record(proof),'Current descriptor proof changed'
    print(f"PASS: {len(rows)} current descriptors / {proof['total_points']} points; original constructor and iterator; no compilation/application")

if __name__=='__main__':main()

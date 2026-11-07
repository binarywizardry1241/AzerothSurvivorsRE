#!/usr/bin/env python3
"""Check current glow rows with native parser instructions and synthetic tokens.

Token splitting, outer line iteration and preallocated Vec storage are explicit
interfaces. No application, filesystem save, network or game executes.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

PROOF=ROOT/'docs/analysis/evidence/0.121.0/weapon-glow-records.json'
CLASSES=(1,2,3,4,5,7,8,9,11)


def model(line, rows):
    fields=line.split('|')
    if len(fields)!=3 or fields[0]!='glow': return rows
    if not all(re.fullmatch(r'\+?[0-9]+',value) for value in fields[1:]): return rows
    owner,enchant=map(int,fields[1:])
    if owner not in CLASSES or enchant not in (0,803,1894,1900): return rows
    return [(key,value)for key,value in rows if key!=owner]+[(owner,enchant)]


def replay(image, pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine=Uc(UC_ARCH_X86,UC_MODE_64)
    size=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections)
    machine.mem_map(pe.image_base,(size+4095)&~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base+section['rva'],image[section['raw_offset']:section['raw_offset']+section['raw_size']])
    heap=0x22000000
    machine.mem_map(heap,0x20000)
    frame,tokens,strings,vector=heap+0x1000,heap+0x4000,heap+0x5000,heap+0x8000
    def wq(a,v): machine.mem_write(a,struct.pack('<Q',v))
    def q(a): return struct.unpack('<Q',machine.mem_read(a,8))[0]
    state={'steps':0,'accepted':False}
    def hook(_machine,address,_size,_context):
        if address==0x145aabb10:
            machine.emu_stop();return
        if 0x145aabae6<=address<0x145aabf86:
            state['steps']+=1;return
        raise AssertionError(f'unreviewed glow parser path {address:#x}')
    machine.hook_add(UC_HOOK_CODE,hook)
    inputs=[f'glow|{owner}|{enchant}'for owner in range(256)for enchant in (0,803,1894,1900,1)]
    inputs += ['glow|'+owner+'|'+enchant for owner in ('','+','-1','256','+1','001','4294967296','１')
               for enchant in ('0','+803','0001894','1900','','+','-0','4294967296','1x')]
    inputs += ['','glow','glow|1','glow|1|0|','glows|1|0','glow||','Glow|1|1894']
    cases=[]
    for baseline in ([],[(1,803),(2,1900)],[(1,803),(2,0),(1,1900)]):
        for line in inputs:
            machine.mem_write(frame,bytes(0x1000))
            machine.mem_write(tokens,bytes(0x200))
            machine.mem_write(strings,bytes(0x2000))
            fields=line.split('|');cursor=strings
            for index,field in enumerate(fields):
                raw=field.encode();machine.mem_write(cursor,raw or b'\0');wq(tokens+index*16,cursor);wq(tokens+index*16+8,len(raw));cursor+=len(raw)+16
            wq(frame+0x308,tokens);wq(frame+0x310,len(fields))
            wq(frame+0x360,64);wq(frame+0x368,vector);wq(frame+0x370,len(baseline))
            machine.mem_write(vector,bytes(64*8))
            for index,(owner,enchant)in enumerate(baseline): machine.mem_write(vector+8*index,struct.pack('<B3xI',owner,enchant))
            machine.reg_write(reg.UC_X86_REG_RBP,frame)
            machine.reg_write(reg.UC_X86_REG_RSP,heap+0x1f008)
            machine.reg_write(reg.UC_X86_REG_EDI,0xbbe)
            machine.reg_write(reg.UC_X86_REG_EBX,10)
            machine.emu_start(0x145aabae6,0x145aabf86,count=10000)
            result=[(machine.mem_read(vector+8*i,1)[0],struct.unpack('<I',machine.mem_read(vector+8*i+4,4))[0])for i in range(q(frame+0x370))]
            expected=model(line,baseline)
            assert result==expected,(line,baseline,result,expected)
            cases.append([line,baseline,result])
    return cases,state['steps']


def replay_writer(image, pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine=Uc(UC_ARCH_X86,UC_MODE_64)
    size=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections)
    machine.mem_map(pe.image_base,(size+4095)&~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base+section['rva'],image[section['raw_offset']:section['raw_offset']+section['raw_size']])
    heap=0x22000000;machine.mem_map(heap,0x10000)
    state={'steps':0}
    def q(a):return struct.unpack('<Q',machine.mem_read(a,8))[0]
    def hook(_machine,address,_size,_context):
        if 0x145ab22f4<=address<0x145ab2380:
            state['steps']+=1;return
        assert address==0x145fbe970,hex(address)
        at=machine.reg_read(reg.UC_X86_REG_RDX);args=machine.reg_read(reg.UC_X86_REG_R8)
        state['format_address']=hex(at);out='';arg=0
        while True:
            opcode=machine.mem_read(at,1)[0];at+=1
            if not opcode:break
            if opcode<0x80:
                out+=bytes(machine.mem_read(at,opcode)).decode();at+=opcode;continue
            assert opcode==0xc0,hex(opcode)
            ptr,formatter=q(args+16*arg),q(args+16*arg+8);arg+=1
            assert formatter in (0x145fccd50,0x145fd0420),hex(formatter)
            value=machine.mem_read(ptr,1)[0]if formatter==0x145fccd50 else struct.unpack('<I',machine.mem_read(ptr,4))[0]
            out+=str(value)
        assert arg==2
        state['line']=out;machine.emu_stop()
    machine.hook_add(UC_HOOK_CODE,hook)
    cases=[]
    for owner in (0,*CLASSES,255):
        for enchant in (0,803,1894,1900,0xffffffff):
            machine.mem_write(heap+0x11e8,struct.pack('<QQ',heap+0x3000,1))
            machine.mem_write(heap+0x3000,struct.pack('<B3xI',owner,enchant))
            machine.reg_write(reg.UC_X86_REG_R12,heap+0x1000)
            machine.reg_write(reg.UC_X86_REG_RBP,heap+0x5000)
            machine.reg_write(reg.UC_X86_REG_RSP,heap+0xf008)
            machine.emu_start(0x145ab22f4,0x145ab2380,count=1000)
            assert state['line']==f'glow|{owner}|{enchant}\n'
            cases.append([owner,enchant,state['line']])
    return dict(case_count=len(cases),original_instruction_steps=state['steps'],format_address=state['format_address'],
                cases_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())


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
    target=latest_target(verify=True);assert target['sha256']=='22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
    image=target_bytes(target);pe=load_script('glow_records_pe',ROOT/'scripts/inventory-executable.py').PE(image)
    cases,steps=replay(image,pe)
    from discovery_native_subject import verify_native_query_subject
    queries=[]
    for procedure in ('0x145aa6a10','0x145aaf840'):
        receipt,native=query_receipt('runtime/analysis/history/findings/fixgap220229/03231eb4cb7b/heroic/save/query-v2',procedure)
        verify_native_query_subject(ROOT,native,receipt,{key:target[key]for key in ('version','path','sha256','size_bytes')},image=image,pe=pe)
        queries.append(receipt)
    source=ROOT/'crates/azeroth-survivors-re/src/save/weapon_glow.rs'
    ranges=[]
    for start,end,role in [(0x145aabae6,0x145aabf86,'glow-token-parser'),(0x145ab22f4,0x145ab2380,'glow-writer-fields')]:
        at=pe.rva_offset(start-pe.image_base);raw=image[at:at+end-start]
        ranges.append(dict(role=role,virtual_address=hex(start),file_offset=hex(at),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest()))
    proof=dict(schema_version=1,target={key:target[key]for key in ('version','path','sha256','size_bytes')},gap_ids=[235],queries=queries,native_ranges=ranges,
        writer=replay_writer(image,pe),case_count=len(cases),original_instruction_steps=steps,cases_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest(),
        source=dict(path=source.relative_to(ROOT).as_posix(),sha256=hashlib.sha256(source.read_bytes()).hexdigest()),
        contract='Exactly three fields glow|class|enchant; class is valid u8 domain0xbbe<12; enchant0/803/1894/1900; last valid class removes all prior class rows then appends; locked known selections survive parser and are rechecked by getter. Writer emits class byte and enchant u32 from eight-byte Save rows.',
        seams=['token splitting/outer line iteration','initial valid-class mask0xbbe and decimal multiplierBL10','preallocated Vec storage'],compilation='not_run',application_executed=False,parity_verified=False)
    if args.write: PROOF.write_text(portable_json(proof,indent=2)+'\n')
    else: assert portable_record(json.loads(PROOF.read_text()))==portable_record(proof),'Glow record proof changed'
    print(f'PASS: {len(cases)} glow-row cases / {steps} original steps; no compilation/application')

if __name__=='__main__':main()

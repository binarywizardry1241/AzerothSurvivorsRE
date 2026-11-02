#!/usr/bin/env python3
"""Current custom-menu roster factory: bounded native instructions and Ghidra evidence.

Only the current custom-mode branch runs. Allocation and String clone are
explicit memory-only seams; unknown instructions/calls fail closed. No original
process or OS/network operation is launched.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
START,END=0x14544d300,0x14544d440
WORK=ROOT/'runtime/consolidation-2026-10-19/custom-roster'
OUT=ROOT/'docs/analysis/evidence/0.100.1/custom-roster'
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('action',choices=['prepare','collect','fixtures']);args=parser.parse_args()
 data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
 iv = load_script('inventory', ROOT/'scripts/inventory-executable.py');pe=iv.PE(data)
 offset=pe.rva_offset(START-pe.image_base);raw=data[offset:offset+END-START]
 WORK.mkdir(parents=True,exist_ok=True);OUT.mkdir(parents=True,exist_ok=True)
 if args.action=='prepare':
  body=WORK/'factory.bin';body.write_bytes(raw)
  plan=dict(target=str(body.relative_to(ROOT)),output=str((WORK/'rea').relative_to(ROOT)),open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(START)),init_timeout=60,timeout=180,open_timeout=60,environment={'REA_GHIDRA_STARTUP_TIMEOUT_MS':'120000','REA_GHIDRA_DISABLED_ANALYZERS':'Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Non-Returning Functions - Discovered'},operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(START)))])
  (WORK/'plan.json').write_text(portable_json(plan,indent=2)+'\n');return
 source=dict(address=hex(START),end_exclusive=hex(END),file_offset=hex(offset),size=len(raw),sha256=hashlib.sha256(raw).hexdigest())
 if args.action=='collect':
  record=json.loads((WORK/'rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent'];assert record['subject']['digest']['sha256']==source['sha256'];assert record['provider']['id']=='ghidra'
  (OUT/'factory.ghidra.c').write_text('\n'.join(line.rstrip()for line in record['normalized_result'].splitlines()).rstrip()+'\n')
  (OUT/'factory.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={START:#x}',f'--stop-address={END:#x}',str(TARGET)],text=True,cwd=ROOT))
  source['rea_evidence_id']=record['evidence_id'];source['limits']=record['limitations']
  bounds={pe.image_base+a:pe.image_base+z for a,z,_ in pe.functions()};entry_chain=[]
  for role,address in [('enter-json',0x140062b50),('enter-keyboard',0x14005f670),('enter-key-inject',0x140038240)]:
   end=bounds[address];offset=pe.rva_offset(address-pe.image_base);body=data[offset:offset+end-address]
   entry_chain.append(dict(role=role,address=hex(address),end_exclusive=hex(end),file_offset=hex(offset),sha256=hashlib.sha256(body).hexdigest()))
   (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={address:#x}',f'--stop-address={end:#x}',str(TARGET)],text=True,cwd=ROOT))
  (OUT/'manifest.json').write_text(portable_json(dict(target_sha256=SHA,source=source,method=__doc__,custom_guid=0xfffffe,entry_chain=entry_chain),indent=2)+'\n');return
 sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
 import unicorn.x86_const as reg
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections);u.mem_map(pe.image_base,(end+4095)&~4095)
 for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
 MEM,STACK,STOP=0x200000000,0x300000000,0x400000000
 u.mem_map(MEM,0x10000);u.mem_map(STACK,0x10000);u.mem_map(STOP,4096)
 def hook(_,a,size,unused):
  if a==STOP:u.emu_stop();return
  if START<=a<END:return
  if a==0x140002200:pass
  elif a==0x1400021c0:
   assert u.reg_read(reg.UC_X86_REG_RCX)==56;u.reg_write(reg.UC_X86_REG_RAX,MEM+0x4000)
  elif a==0x145728850:
   dest=u.reg_read(reg.UC_X86_REG_RCX);src=u.reg_read(reg.UC_X86_REG_RDX);u.mem_write(dest,bytes(u.mem_read(src,24)))
  else:raise RuntimeError('Unreviewed instruction '+hex(a))
  sp=u.reg_read(reg.UC_X86_REG_RSP);u.reg_write(reg.UC_X86_REG_RIP,struct.unpack('<Q',u.mem_read(sp,8))[0]);u.reg_write(reg.UC_X86_REG_RSP,sp+8)
 u.hook_add(UC_HOOK_CODE,hook);cases=[]
 for name,cls,race,sex,features in [('Hero',1,1,0,[0,0,0,0,0]),('Thrall',7,2,0,[1,2,3,4,5]),('Prêtre',5,3,1,[5,4,3,2,1]),('Жрица',5,5,1,[255,0,128,1,254])]:
  u.mem_write(MEM,bytes(0x10000));name_bytes=name.encode();u.mem_write(MEM+0x5000,name_bytes);u.mem_write(MEM+0xbe8,struct.pack('<QQQ',len(name_bytes),MEM+0x5000,len(name_bytes)));u.mem_write(MEM+0xc20,bytes([cls,race,sex,*features]));u.mem_write(MEM+0x1041,b'\x01')
  sp=STACK+0x8008;u.mem_write(sp,struct.pack('<Q',STOP));u.reg_write(reg.UC_X86_REG_RSP,sp);u.reg_write(reg.UC_X86_REG_RCX,MEM+0x2000);u.reg_write(reg.UC_X86_REG_RDX,MEM);u.emu_start(START,STOP,count=10000)
  cap,pointer,count=struct.unpack('<QQQ',u.mem_read(MEM+0x2000,24));assert(cap,count)==(1,1)
  b=bytes(u.mem_read(pointer,56));p,n=struct.unpack_from('<QQ',b,8)
  cases.append(dict(input=dict(name=name,class_id=cls,race=race,sex=sex,features=features),output=dict(name=bytes(u.mem_read(p,n)).decode(),guid=struct.unpack_from('<Q',b,24)[0],statistics=list(struct.unpack_from('<4I',b,32)),race=b[48],class_id=b[49],sex=b[50],features=list(b[51:56]))))
 (OUT/'fixtures.json').write_text(portable_json(dict(target_sha256=SHA,source=source,method=__doc__,cases=cases),indent=2,ensure_ascii=False)+'\n')
 print('Recovered',len(cases),'native custom roster rows')
if __name__=='__main__':main()

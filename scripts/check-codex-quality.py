#!/usr/bin/env python3
"""Replay native Codex quality selection for jewelry/shared/legendary entries."""
import argparse,hashlib,importlib.util,json,struct,sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
target=latest_target(verify=False);assert target['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
d=target_bytes(target);s=importlib.util.spec_from_file_location('pe',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);size=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections);u.mem_map(p.image_base,(size+4095)&~4095)
for s in p.sections:u.mem_write(p.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
u.mem_map(0x200000000,0x10000);u.mem_map(0x300000000,0x20000);u.mem_map(0x400000000,4096)
q=lambda a:struct.unpack('<Q',u.mem_read(a,8))[0]
wq=lambda a,v:u.mem_write(a,struct.pack('<Q',v))
seen=None

def hook(_,a,size,unused):
 if 0x140364670<=a<0x140364725:return
 if a==0x400000000:u.emu_stop();return
 sp=u.reg_read(UC_X86_REG_RSP);c=u.reg_read(UC_X86_REG_RCX)
 if a==0x140364530:u.mem_write(c,struct.pack('<QQQ',0,8,0));u.reg_write(UC_X86_REG_RAX,c)
 elif a==0x14589df20:u.reg_write(UC_X86_REG_RAX,int(seen is not None));u.reg_write(UC_X86_REG_RDX,seen or 0)
 else:raise RuntimeError(f'Unreviewed callee {a:#x}')
 u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
u.hook_add(UC_HOOK_CODE,hook)
# Explicit current static-table fixture replaces only the initialized Vec handle.
wq(0x14808a3e0,0x200000100);wq(0x200000100,0x146bea470);wq(0x200000108,17)
entries=json.loads((ROOT/'crates/azeroth-survivors-re/assets/codex-0.105.0.json').read_text())['entries'];shared=[x for x in entries if x['group']=='amulets']
rows=[]
for kind,items in [(0,[dict(key='jewelry',quality=0)]),(1,shared),(2,[dict(key='legendary',quality=4)])]:
 for index,item in enumerate(items):
  for seen in [None,0,1,2,3,4]:
   sp=0x30001f008;wq(sp,0x400000000);u.mem_write(0x200000200,struct.pack('<QQQ',kind,index,0));u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,0x200000200);u.reg_write(UC_X86_REG_RDX,0x200000300)
   u.emu_start(0x140364670,0x400000000,count=10000);actual=u.reg_read(UC_X86_REG_RAX);expected=(seen or 0) if kind==0 else item['quality'];assert actual==expected,(kind,index,seen,actual,expected)
   rows.append(dict(key=item['key'],kind=kind,seen=seen,native_quality=actual))
source=(ROOT/'crates/azeroth-survivors-re/src/codex.rs').read_text();assert 'let quality = entry_quality(entry, discovered);'in source and '.map(|_| quality_color(entry_quality(entry, known)))'in source
at=p.rva_offset(0x140364670-p.image_base)
proof=dict(target_sha256=target['sha256'],address='0x140364670',end_exclusive='0x140364725',sha256=hashlib.sha256(d[at:at+0xb5]).hexdigest(),cases=rows,limits=['Only native current quality selector executes; key and seen getters are explicit fixtures, and the initialized shared Vec handle points to the actual current17-record table.','The full142-record current constructor pass independently compares all source item qualities. No UI, build or game ran.'])
a=argparse.ArgumentParser(description=__doc__);a.add_argument('--write',action='store_true');args=a.parse_args();path=ROOT/'docs/analysis/evidence/0.109.0/codex/quality.json'
if args.write:path.write_text(json.dumps(proof,indent=2)+'\n')
else:assert json.loads(path.read_text())==proof
print('Passed 114 native quality cases; jewelry reads highest seen rarity, all17 shared amulets and legendary headings keep fixed quality.')

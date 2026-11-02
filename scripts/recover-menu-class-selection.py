"""Bounded native class-selector checks; no process launch or OS calls inside emulation."""
from pathlib import Path
import sys,struct,hashlib,importlib.util,json
R=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(R/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
sp=importlib.util.spec_from_file_location('inv',R/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(sp);sp.loader.exec_module(m)
d=(R/'AzerothSurvivors/AzerothSurvivors.exe').read_bytes();p=m.PE(d)
SHA='47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2';assert hashlib.sha256(d).hexdigest()==SHA
u=Uc(UC_ARCH_X86,UC_MODE_64);base=p.image_base;end=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in p.sections)
u.mem_map(base,(end+4095)&~4095)
for s in p.sections:u.mem_write(base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x10000);u.mem_map(STACK,0x20000);u.mem_map(STOP,0x1000)
calls={}
def hook(uc,at,size,_):
 if 0x1453f9420<=at<0x1453f9603:return
 calls[hex(at)]=calls.get(hex(at),0)+1
 if at==0x14544ee30:u.reg_write(UC_X86_REG_RAX,0) # Optional appearance-data cache unavailable; ignored by selector.
 elif at==0x1453f9130:
  # Exclude the already-separate selected-zone clamp; return the adjusted64-byte Pick unchanged.
  out=u.reg_read(UC_X86_REG_RCX);source=u.reg_read(UC_X86_REG_R8)
  u.mem_write(out,bytes(u.mem_read(source,64)));u.reg_write(UC_X86_REG_RAX,out)
 else:raise RuntimeError(f'Unreviewed external call {at:x}')
 rsp=u.reg_read(UC_X86_REG_RSP);ret=struct.unpack('<Q',u.mem_read(rsp,8))[0]
 u.reg_write(UC_X86_REG_RSP,rsp+8);u.reg_write(UC_X86_REG_RIP,ret)
u.hook_add(UC_HOOK_CODE,hook)
account=HEAP;pick=HEAP+0x1000;out=HEAP+0x1100;hero=HEAP+0x1200
classes=[1,2,3,4,5,7,8,9,11];rows=[];allowed_by_class={}
for cid in classes:
 off=p.rva_offset(0x1466dc138+(cid-1)*8-base);count=struct.unpack_from('<Q',d,off)[0]
 off=p.rva_offset(0x1466dc190+(cid-1)*8-base);ptr=struct.unpack_from('<Q',d,off)[0]
 allowed_by_class[cid]=list(d[p.rva_offset(ptr-base):p.rva_offset(ptr-base)+count])
for cid in classes:
 off=p.rva_offset(0x1466dc138+(cid-1)*8-base);count=struct.unpack_from('<Q',d,off)[0]
 off=p.rva_offset(0x1466dc190+(cid-1)*8-base);ptr=struct.unpack_from('<Q',d,off)[0]
 allowed=list(d[p.rva_offset(ptr-base):p.rva_offset(ptr-base)+count])
 for race in range(1,9):
  for sex in [0,1]:
   input_class=next(c for c in classes if c!=cid and race in allowed_by_class[c])
   input_hero=[input_class,race,sex,2,3,4,5,6]
   u.mem_write(account,bytes(0x1b8));u.mem_write(pick,struct.pack('<6Q',0,1,0,0,1,0)+bytes(8)+bytes(input_hero))
   rsp=STACK+0x1f008;u.mem_write(rsp,struct.pack('<Q',STOP))
   for r,v in [(UC_X86_REG_RSP,rsp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,account),(UC_X86_REG_R8,pick),(UC_X86_REG_R9,cid)]:u.reg_write(r,v)
   u.emu_start(0x1453f9420,STOP,count=10000);assert u.reg_read(UC_X86_REG_RIP)==STOP
   actual=list(u.mem_read(out+56,8))
   rows.append({'kind':'fresh','destination_class':cid,'input':input_hero,'saved_hero':None,'native_output':actual})
# A saved class hero overrides the current race/sex/features exactly.
for cid in classes:
 packed=bytes([cid,allowed_by_class[cid][-1],1,7,8,9,10,11]);u.mem_write(account,bytes(0x1b8));u.mem_write(hero,packed)
 input_class=next(c for c in classes if c!=cid and 1 in allowed_by_class[c]);input_hero=[input_class,1,0,2,3,4,5,6]
 u.mem_write(account+0x120,struct.pack('<QQQ',1,hero,1));u.mem_write(pick,struct.pack('<6Q',0,1,0,0,1,0)+bytes(8)+bytes(input_hero))
 rsp=STACK+0x1f008;u.mem_write(rsp,struct.pack('<Q',STOP))
 for r,v in [(UC_X86_REG_RSP,rsp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,account),(UC_X86_REG_R8,pick),(UC_X86_REG_R9,cid)]:u.reg_write(r,v)
 u.emu_start(0x1453f9420,STOP,count=10000);assert u.reg_read(UC_X86_REG_RIP)==STOP
 rows.append({'kind':'saved','destination_class':cid,'input':input_hero,'saved_hero':list(packed),'native_output':list(u.mem_read(out+56,8))})
result={'target_sha256':SHA,'native_range':['0x1453f9420','0x1453f9603'],'method':'Unchanged native class-selector instructions executed in bounded Unicorn x86_64. All unreviewed external calls abort. Expected test values are the recorded output bytes, not the source reconstruction formula.','unsaved_checks':144,'saved_record_checks':9,'hero_byte_order':['class','race','sex','skin','face','hair_style','hair_color','facial_hair'],'external_stubs':calls,'limits':['Optional appearance-data cache forced unavailable; selected-zone clamping intentionally excluded by a64-byte Pick-copy stub.','No OS/files/network calls are reachable inside the emulated native instructions.','Saved-record copying is checked independently of import/appearance-bound normalization.']}
start,end=0x1453f9420,0x1453f9603
result['native_range_sha256']=hashlib.sha256(d[p.rva_offset(start-base):p.rva_offset(end-base)]).hexdigest()
text=json.dumps(result,indent=2)[:-2]+',\n  "cases": [\n'+',\n'.join('    '+json.dumps(row,separators=(',',':')) for row in rows)+'\n  ]\n}\n'
path=R/'docs/analysis/evidence/0.92/save/class-selection-fixtures.json'
path.write_text(text)
print('Recorded native class selector:144 fresh +9 saved outputs')

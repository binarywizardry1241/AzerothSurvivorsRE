"""Checked current-native fixture for equipped item names and temporary text.

The shared AST body owns compact Rust/locale formatting. Only individually
admitted current native ranges execute. Allocation/string/Unicode/math services
are fixture seams; no game, OS, Rust compiler or Lua VM runs.
"""
import sys,ast,json,struct,hashlib,math
from pathlib import Path
sys.path.insert(0,'scripts')
from coverage_common import ROOT,latest_target,target_bytes
from script_sources import load_script
assert latest_target(verify=True)['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
path=ROOT/'scripts/check-armory-text.py';assert hashlib.sha256(path.read_bytes()).hexdigest()=='dc86584441262a59ac8efac6aafe76eb48c6c7337a1cea9b50c8b522505f8971'
tree=ast.parse(path.read_text());end=next(i for i,n in enumerate(tree.body)if isinstance(n,ast.Assign)and ast.unparse(n.targets[0])=='results');tree.body=tree.body[:end]
tree.body=[n for n in tree.body if not(isinstance(n,ast.Assign)and ast.unparse(n.targets[0])in['parser','args'])and not(isinstance(n,ast.Expr)and(ast.unparse(n.value).startswith('parser.add_argument')or ast.unparse(n.value).startswith('u.hook_add')))]
M=load_script('maptext',ROOT/'scripts/check-equipped-inventory-text.py').ADDRESSES
class Rebind(ast.NodeTransformer):
 def visit_Constant(self,n):
  if n.value=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0':n.value=latest_target()['sha256']
  elif type(n.value)is int and n.value in M:n.value=M[n.value]
  return n
ns={'__name__':'replay','__file__':str(path)};exec(compile(ast.fix_missing_locations(Rebind().visit(tree)),str(path),'exec'),ns)
u=ns['u'];pe=ns['pe'];q=ns['q'];put=ns['put'];output=ns['output'];alloc=ns['alloc'];r=ns['r'];reg=ns['reg'];base=ns['hook']
ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
ranges=[(a,ends[a])for a in [0x1459910d0,0x1459a9c10,0x1459a9e30,0x1457fc970,0x1459af710,0x14584be80,0x14584a3c0,0x14582da90,0x14584a6a0,0x14584bae0,0x145849f20,0x145849050,0x145847c90,0x145825570,0x145824b20,0x1459a85c0,0x1459a8800,0x1459a8380,0x1459a7660,0x145978690,0x145978710,0x145978790,0x1458237f0,0x14581be10]]+[(0x145827080,0x145827099),(0x145826bc0,0x145826bd9)]
def hook(uc,pc,size,unused):
 if any(a<=pc and pc+size<=z for a,z in ranges):return
 rcx,rdx,r8,r9=[reg(v)for v in [r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_R9]]
 if pc==0x145cf9a15:
  values=[struct.unpack('<f',(reg(v)&0xffffffff).to_bytes(4,'little'))[0]for v in [r.UC_X86_REG_XMM0,r.UC_X86_REG_XMM1]];u.reg_write(r.UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',math.pow(*values)),'little'))
 elif pc==0x145cf9a27:
  value=struct.unpack('<f',(reg(r.UC_X86_REG_XMM0)&0xffffffff).to_bytes(4,'little'))[0];u.reg_write(r.UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',math.floor(value)),'little'))
 elif pc==0x145cf999d:
  u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(r.UC_X86_REG_RAX,rcx)
 elif pc==0x145cd5750:
  chars=[ord(v)for v in chr(rdx).upper()];u.mem_write(rcx,struct.pack('<3I',*(chars+[0]*(3-len(chars)))))
 elif pc==0x145cf9991:
  a,b=bytes(u.mem_read(rcx,r8)),bytes(u.mem_read(rdx,r8));u.reg_write(r.UC_X86_REG_RAX,((a>b)-(a<b))&((1<<64)-1))
 elif pc in [0x145cf9da0,0x145d259f0]:
  stride=8 if pc==0x145d259f0 else q(reg(r.UC_X86_REG_RSP)+40);count=q(rcx+16);at=alloc(max(1024,count+max(1,r8))*stride)
  if count:u.mem_write(at,bytes(u.mem_read(q(rcx+8),count*stride)))
  put(rcx,max(1024,count+max(1,r8)),at)
 elif pc==0x140016b50:put(rcx,0,rdx,alloc(rdx*q(reg(r.UC_X86_REG_RSP)+40)))
 elif pc==0x145890070:
  value=ns['pair'](rcx+8);output(rcx,value+(''if rdx&0xffffffff==0xffffffff else chr(rdx)))
 else:return base(uc,pc,size,unused)
 sp=reg(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,q(sp));u.reg_write(r.UC_X86_REG_RSP,sp+8)
u.hook_add(ns['UC_HOOK_CODE'],hook)
def invoke(a,*args,xmm2=None):
 sp=ns['stack']+0x1f0008;put(sp,ns['done']);u.reg_write(r.UC_X86_REG_RSP,sp)
 for rr,v in zip([r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_R9],args):u.reg_write(rr,v)
 if xmm2 is not None:u.reg_write(r.UC_X86_REG_XMM2,int.from_bytes(struct.pack('<f',xmm2),'little'))
 u.reg_write(r.UC_X86_REG_MXCSR,0x1f80);u.emu_start(a,ns['done'],count=100000);assert reg(r.UC_X86_REG_RIP)==ns['done']

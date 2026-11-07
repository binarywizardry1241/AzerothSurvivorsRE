#!/usr/bin/env python3
"""Check current Armory/Codex clicks, gear commands and page retention without a build.

Only admitted native instructions execute. ECS iteration/ticks, descriptor/account
getters, command publication, allocation and memcmp are explicit fixture seams.
"""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
target=latest_target(verify=True);SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0';assert target['sha256']==SHA
data=target_bytes(target);m = load_script('pe', ROOT/'scripts/inventory-executable.py');pe=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in pe.sections);u.mem_map(pe.image_base,(end+4095)&~4095)
for x in pe.sections:u.mem_write(pe.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
H,S,D=0x200000000,0x300000000,0x400000000
u.mem_map(H,0x20000);u.mem_map(S,0x20000);u.mem_map(D,4096)
q=lambda a:struct.unpack('<Q',u.mem_read(a,8))[0]
dword=lambda a:struct.unpack('<I',u.mem_read(a,4))[0]
wq=lambda a,v:u.mem_write(a,struct.pack('<Q',v))
wd=lambda a,v:u.mem_write(a,struct.pack('<I',v))
reg=lambda r:u.reg_read(r)
rsp=S+0x10008;rbp=S+0x8000
stops=set();calls=[];slot=0;item=101000;gear=bytes(232);drop_zone=None;admitted=[]
def hook(_,pc,size,unused):
 if pc in stops or pc==D:u.emu_stop();return
 if any(a<=pc<b for a,b in admitted):return
 sp=reg(UC_X86_REG_RSP);c,d,r8=[reg(x)for x in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8]]
 if pc==0x1458a3e40:u.mem_write(c,gear)
 elif pc==0x1459a4ba0:
  u.mem_write(c,bytes(112));u.mem_write(c+104,bytes([slot]));u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x145bfa0e7:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x145bfa0e1:
  a,b=bytes(u.mem_read(c,r8)),bytes(u.mem_read(d,r8));u.reg_write(UC_X86_REG_RAX,0 if a==b else 1)
 elif pc==0x14589c590:calls.append(dict(call='account-set-gear',bytes=bytes(u.mem_read(d,232)).hex()))
 elif pc==0x1401838a0:calls.append(dict(call='menu-command',bytes=bytes(u.mem_read(d,232)).hex()))
 elif pc==0x1459a6c50:
  # First native drop owner is an explicit getter seam. Actual page navigation
  # and selected-zone update execute for both empty/nonempty getter results.
  u.mem_write(c,struct.pack('<QQQ',0,H+0x6000,int(drop_zone is not None)));wq(H+0x6000,drop_zone or 0)
 elif pc==0x1458d7400:u.mem_write(c,bytes(48))
 elif pc in [0x1400021d0,0x140002200]:pass
 else:raise RuntimeError(f'Unreviewed callee {pc:#x} from {q(sp):#x}')
 u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
u.hook_add(UC_HOOK_CODE,hook)
def reset():
 global calls
 u.mem_write(H,bytes(0x10000));u.mem_write(S,bytes(0x18000));calls=[];wq(rsp,D);u.reg_write(UC_X86_REG_RSP,rsp);u.reg_write(UC_X86_REG_RBP,rbp)
def run(a,b,extra=()):
 global admitted,stops
 admitted=[(a,b),*extra]
 try:u.emu_start(a,D,count=10000)
 except Exception as e:raise RuntimeError(f'{a:#x} stopped at {reg(UC_X86_REG_RIP):#x}, slot {slot}, item {item}, calls {calls}') from e
 assert reg(UC_X86_REG_RIP)in stops|{D},hex(reg(UC_X86_REG_RIP))
rows=[];presses=[]
# Same finite transitions as the old fixture, now executed from the actual current
# owner and current slot layout. Adjacent worn/look slots are canary-filled.
for slot,item in [(0,101000),(2,101100),(15,101800),(16,104900),(17,103800)]:
 for shift in [False,True]:
  for worn in [0,item,item+10]:
   for look in [None,0,item,item+10]:
    reset();wd(rbp+0x40+slot*4,worn);u.mem_write(rbp-0x58+slot*8,struct.pack('<II',look is not None,look or 0));wd(rbp+0x23c,item);u.mem_write(rbp+0x24e,bytes([shift]));u.mem_write(rbp+0x1e0,bytes([slot]));stops={0x14015ff65}
    run(0x140160328,0x140160475)
    present=dword(rbp-0x58+slot*8)!=0
    rows.append(dict(action='piece',slot=slot,item=item,shift=shift,worn=worn,look=look,after_worn=dword(rbp+0x40+slot*4),after_look=dword(rbp-0x54+slot*8)if present else None,changed=bool(dword(rbp+0x248))))
  for worn in [0,item]:
   for look in [None,0,item]:
    reset();wd(rbp+0x40+slot*4,worn);u.mem_write(rbp-0x58+slot*8,struct.pack('<II',look is not None,look or 0));u.mem_write(rbp+0x24e,bytes([shift]));u.mem_write(H+4,bytes([slot]));u.reg_write(UC_X86_REG_RAX,H);stops={0x1401603c6}
    run(0x14016029e,0x1401603c6)
    present=dword(rbp-0x58+slot*8)!=0
    rows.append(dict(action='slot',slot=slot,item=item,shift=shift,worn=worn,look=look,after_worn=dword(rbp+0x40+slot*4),after_look=dword(rbp-0x54+slot*8)if present else None,changed=bool(dword(rbp+0x248))))
for button in range(6):
 for state in range(2):
  reset();u.mem_write(H+0x10,struct.pack('<H',button));u.mem_write(H+0x14,bytes([state]));u.reg_write(UC_X86_REG_RSI,H);u.reg_write(UC_X86_REG_R10,0);u.reg_write(UC_X86_REG_R14,0);stops={0x14015fe4b}
  run(0x14015fe37,0x14015fe4b);presses.append(dict(button=button,state=state,accepted=bool(reg(UC_X86_REG_R14))))
assert sum(x['accepted']for x in presses)==1
# Primary admitted row starts before interaction predicate/account getter/switch.
# Actual descriptor getter is supplied from already revalidated catalog metadata.
primary=[]
for slot,item in [(0,101000),(2,101100),(15,101800),(16,104900),(17,103800)]:
 for kind in ['piece','slot','equip','unequip','look','look-clear']:
  for worn in [0,item,item+10]:
   for interaction in [0,1,2]:
    reset();u.reg_write(UC_X86_REG_RSI,H);u.reg_write(UC_X86_REG_RCX,H+0x100);u.mem_write(H+0x100,bytes([interaction]));wd(H,dict(piece=6,slot=7,equip=8,unequip=9,look=1,**{'look-clear':0})[kind]);wd(H+4,item if kind not in ['slot','unequip'] else slot);u.mem_write(H+8,bytes([slot]));baseline=bytearray(232);struct.pack_into('<I',baseline,152+slot*4,worn);gear=bytes(baseline)
    for off,ptr in [(0x218,H+0x200),(0x220,H+0x300),(0x228,H+0x310),(0x258,H+0x400),(0x1a8,H+0x500),(0x1f8,H+0x600),(0x178,H+0x320)]:wq(rbp+off,ptr)
    u.reg_write(UC_X86_REG_R9,H+0x400);wd(rbp+0x250,7);wd(rbp+0x18c,9);wd(H+0x200+0x48,1);wd(H+0x200+0x4c,item+20)
    stops={0x140161d26,0x140161d34,0x140161d49}
    run(0x140162058,0x1401626e3)
    ui=H+0x200
    out=dict(action=kind,slot=slot,item=item,worn=worn,interaction=interaction,selected=dword(ui+0x4c)if dword(ui+0x48)else None,focused=bytes(u.mem_read(ui+0x70,2)).hex(),after_worn=dword(rbp+0x40+slot*4),account_commands=sum(x['call']=='account-set-gear'for x in calls),menu_commands=sum(x['call']=='menu-command'for x in calls))
    if interaction==0 and kind=='piece':assert out['selected']==item and out['focused']==bytes([1,slot]).hex()
    if interaction==0 and kind=='slot':assert out['selected']==(worn or None) and out['focused']==bytes([1,slot]).hex()
    if interaction==0 and kind in ['equip','unequip','look','look-clear']:assert(out['account_commands'],out['menu_commands'])==(1,1)
    else:assert out['account_commands']==out['menu_commands']==0
    primary.append(out)
# Full current navigation helper, with account/drop getters explicit. Every
# sample preserves all24 selection bytes while updating open/tab/pending/zone.
nav=[]
for oldtab in range(7):
 for newtab in [*range(7),255]:
  for drop_zone in [None,4]:
   reset();selection=struct.pack('<QQQ',2,H+0x700,6);u.mem_write(H,selection);wq(H+0x18,0xffffffffffffffff);u.mem_write(H+0x48,b'\x01');wd(H+0x4c,101000);wq(H+0x50,9);u.mem_write(H+0x72,b'\x01');u.mem_write(H+0x76,bytes([oldtab,254]));u.reg_write(UC_X86_REG_RCX,H);u.reg_write(UC_X86_REG_RDX,newtab);u.reg_write(UC_X86_REG_R8,H+0x800);stops={D}
   run(0x14013ead0,0x14013ecbe);assert bytes(u.mem_read(H,24))==selection
   opened=u.mem_read(H+0x72,1)[0];tab=u.mem_read(H+0x76,1)[0];zone=q(H+0x50)
   assert opened==int(newtab!=255) and tab==(oldtab if newtab==255 else newtab)
   assert zone==(4 if newtab==2 and drop_zone is not None else 9)
   nav.append(dict(oldtab=oldtab,newtab=newtab,drop=drop_zone,open=bool(opened),tab=tab,zone=zone,selection_preserved=True))
# Both current sparse/dense selection mutation branches, including equality and
# Interaction; real original equality uses native enum0/1 indices and enum2 str.
selection=[]
for branch,start,stop in [('sparse',0x14037d695,0x14037d54b),('dense',0x14037d8f8,0x14037d7b0)]:
 for kind in [0,1,2]:
  for old in ['none','same','different','other-kind']:
   for interaction in [0,1,2]:
    reset();entry=struct.pack('<QQQ',kind,3 if kind<2 else H+0x800,4 if kind==2 else 0);u.mem_write(H+0x800,b'abcd');previous=struct.pack('<QQQ',0xffffffffffffffff,0,0)if old=='none'else entry
    if old=='different':previous=struct.pack('<QQQ',kind,8 if kind<2 else H+0x810,4 if kind==2 else 0);u.mem_write(H+0x810,b'efgh')
    if old=='other-kind':previous=struct.pack('<QQQ',(kind+1)%3,0,0)
    u.mem_write(H+0x200,previous);u.mem_write(H+0x300,entry);u.mem_write(H+0x100,bytes([interaction]));u.reg_write(UC_X86_REG_RCX,H+0x100);u.reg_write(UC_X86_REG_R10,H+0x300);wq(rsp+0x28,H+0x200);wq(rsp+0x58,H+0x400);wd(rsp+0x4c,23);stops={stop}
    run(start,0x14037d9b1);changed=interaction==0 and old!='same';assert bytes(u.mem_read(H+0x200,24))==(entry if changed else previous);assert dword(H+0x400)==(23 if changed else 0)
    selection.append(dict(branch=branch,kind=kind,old=old,interaction=interaction,changed=changed))
def span(a,b):
 o=pe.rva_offset(a-pe.image_base);return dict(address=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(data[o:o+b-a]).hexdigest())
OUT=ROOT/'docs/analysis/evidence/0.109.0/armory-pages'
mutation=dict(target_sha256=SHA,method='Bounded current original-instruction execution; explicit slot/descriptor/ownership seams.',mutations=rows,mouse_messages=presses)
proof=dict(target_sha256=SHA,target_executed=False,ranges=[span(0x14015fcf0,0x14016053b),span(0x140161be0,0x140162744),span(0x14013ead0,0x14013ecbe),span(0x14037d490,0x14037d9c5),span(0x145de4bf4,0x145de4c24)],primary_rows=primary,navigation=nav,codex_selection=selection,limits=[
 'Primary rows execute after ECS change/tick iteration, before the real Interaction predicate, account getter and current action jump table. Descriptor/account access, disposal, copy and account/menu-command publication are explicit seams. Mutation and both publication calls execute in native instructions; no actual account, disk or preview receiver runs.',
 'Secondary mutation begins after native descriptor/ownership validation; the whole current owner separately retains those guards and actual right-press/Armory-open ordering. Query iteration and any-shift helper are statically traced, not emulated.',
 'Navigation executes the complete current helper with an absent Rewards snapshot; changed Rewards confirmation is owned by its separate report. Drop getter supplies empty/one-result cases; native selected-zone writes and full24-byte Codex retention execute.',
 'Codex cases execute both current admitted sparse/dense row branches; native enum/index/string equality, Interaction and resource tick/write execute, while ECS iteration/ticks and memcmp are fixture seams.',
 'No compiler, application, save/configuration mutation, GPU or original/rebuilt comparison ran.'])
for name,value in [('native-mutation-fixtures.json',mutation),('input.json',proof)]:
 payload=json.dumps(value,indent=2)+'\n';path=OUT/name
 if args.write:path.write_text(payload)
 else:assert path.read_text()==payload,name
print(f'Passed {len(rows)} secondary mutations, {len(presses)} mouse messages, {len(primary)} primary rows, {len(nav)} complete navigation and {len(selection)} Codex selection cases; no compiler/game.')

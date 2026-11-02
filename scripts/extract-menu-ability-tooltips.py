#!/usr/bin/env python3
"""Recover native 0.92 picker tooltip text and localization expression trees.

Requires the project-local Unicorn runtime used by extract-menu-codex.py.
Executes only explicitly listed native formatter/math paths; reviewed String,
allocation, locale-miss, and math boundaries cannot perform OS or network calls.
Original/rebuilt execution outside this bounded emulation is not performed.
"""
from native_recovery import expression
from pathlib import Path
core=Path('scripts/extract-menu-codex.py').read_text().split('rows=[]')[0]
core=core.replace('u.hook_add(UC_HOOK_CODE,hook)','core_handle=u.hook_add(UC_HOOK_CODE,hook)')
__file__=str(Path('scripts/extract-menu-codex.py').resolve())
exec(compile(core,'scripts/extract-menu-codex.py','exec'))
u.hook_del(core_handle)
allowed.extend([(0x14545dd10,0x14545ddd4),(0x1401638b0,0x140163956),(0x14545dbf0,0x14545dd04),(0x145419710,0x14541985d),(0x1454ac8a0,0x1454ae293),(0x140116ca0,0x14011714e),(0x1453e2530,0x1453e25c7),(0x1453dddd0,0x1453dde64),(0x1454cc0b0,0x1454cc0b5),(0x14540bb90,0x14540ebbd),(0x145493f50,0x145494013),(0x14540baf0,0x14540bb8f),(0x1454117e0,0x145411937)])
core_hook=hook
import math
pieces=[]
boundary_counts={}
def ret():
 sp=reg(UC_X86_REG_RSP);a=q(sp);u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,a)
def hook(uc,a,size,user):
 if any(lo<=a<hi for lo,hi in allowed):return
 boundary_counts[a]=boundary_counts.get(a,0)+1
 rcx,rdx,r8=reg(UC_X86_REG_RCX),reg(UC_X86_REG_RDX),reg(UC_X86_REG_R8)
 if a==0x1400021f0:
  u.reg_write(UC_X86_REG_RAX,alloc(rcx));ret()
 elif a==0x1456ca060:
  outstr(rcx,pair(rdx+8));ret()
 elif a==0x145717840:
  old,cap=q(rcx+8),q(rcx);newcap=max(cap*2,rdx+r8,256);ptr=alloc(newcap*reg(UC_X86_REG_R9));
  if cap:u.mem_write(ptr,bytes(u.mem_read(old,cap*reg(UC_X86_REG_R9))))
  wq(rcx,newcap);wq(rcx+8,ptr);ret()
 elif a in [0x145714a45,0x145714a5d,0x145714a99,0x145714b77]:
  v=struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
  v=math.trunc(v) if a==0x145714a45 else (math.floor(v+0.5) if a==0x145714a5d else (math.ceil(v) if a==0x145714a99 else math.log1p(v)))
  u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',v)+bytes(12),'little'));ret()
 elif a==0x14541f0e0:
  value=st(rcx,rdx);pieces.append((menu['labels'].get(value,value),{'template':value,'values':{}}));u.reg_write(UC_X86_REG_RAX,0);ret()
 elif a==0x14541f030:
  value=st(rcx,rdx);pieces.append((value,{'template':value,'values':{}}));core_hook(uc,a,size,user)
 elif a in [0x14541f400,0x14541f090]:
  template=st(rdx,r8);text=menu['labels'].get(template,template);args=reg(UC_X86_REG_R9);n=q(reg(UC_X86_REG_RSP)+40);vals={}
  for j in range(n):
   at=args+j*32;key=pair(at);valueptr,formatter=q(at+16),q(at+24);method=q(formatter+24)
   if method==0x1400020e0:value=pair(valueptr+8)
   elif method==0x1400020c0:value=pair(valueptr)
   elif method==0x1456dcb50:value=str(struct.unpack('<Q',u.mem_read(valueptr,8))[0])
   elif method==0x1456dbc60:value=str(struct.unpack('<I',u.mem_read(valueptr,4))[0])
   elif method==0x1456daf00:value=format(struct.unpack('<f',u.mem_read(valueptr,4))[0],'.7g')
   else:raise RuntimeError('unknown replacement formatter '+hex(formatter)+' method '+hex(method))
   text=text.replace('{'+key+'}',value);vals[key]=value
  pieces.append((text,{'template':template,'values':vals}));outstr(rcx,text);ret()
 else:core_hook(uc,a,size,user)
u.hook_add(UC_HOOK_CODE,hook)
rows=[]
for ci,c in enumerate(menu['classes']):
 for key in c['spell_keys']:
  next_heap=HEAP+0x1000;pieces=[];out=alloc(64);at=next(i for i,a in enumerate(menu['abilities'])if a['key']==key);ability=0x1466d5b20+at*120
  sp=STACK+0x1f0008;wq(sp,STOP);wq(sp+40,0);wq(sp+48,0)
  for register,value in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,0x1466d4858+ci*144),(UC_X86_REG_R8,q(ability)),(UC_X86_REG_R9,q(ability+8))]:u.reg_write(register,value)
  try:u.emu_start(0x140116ca0,STOP,count=200000)
  except Exception as e:raise RuntimeError(f'{key}pc{reg(UC_X86_REG_RIP):x}: {e}')from e
  assert reg(UC_X86_REG_RIP)==STOP
  row=dict(key=key,subtitle=pair(out+8),body=pair(out+32),name=pair(out+48),pieces=pieces)
  rows.append(row);print(key, flush=True)
Path('runtime/menu-recovery/ability-native-results.json').write_text(json.dumps(rows,indent=2)+'\n')


def render(expr):
 if 'literal'in expr:return expr['literal']
 if 'concat'in expr:return ''.join(map(render,expr['concat']))
 value=menu['labels'].get(expr['template'],expr['template'])
 for key,item in expr['values'].items():value=value.replace('{'+key+'}',render(item))
 return value
result={}
for row in rows:
 result[row['key']]={name:expression(row[name],row['pieces'])for name in ['subtitle','body']}
 for name in ['subtitle','body']:assert render(result[row['key']][name])==row[name],(row['key'],name)
assert len(result)==101
(R/'crates/azeroth-survivors-re/assets/ability-tooltips.json').write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')


# Derived source evidence, never needed to build or open the reconstructed menu.
def va_offset(value):return p.rva_offset(value-p.image_base)
def manifest_range(start,end):
 return dict(start=hex(start),end_exclusive=hex(end),sha256=hashlib.sha256(d[va_offset(start):va_offset(start)+end-start]).hexdigest())
functions=[(0x140116ca0,0x14011714e),(0x14540bb90,0x14540ebbd),(0x145493f50,0x145494013),(0x14540baf0,0x14540bb8f),(0x1454117e0,0x145411937),(0x145419710,0x14541985d),(0x1454ac8a0,0x1454ae293),(0x14545dbf0,0x14545dd04),(0x14545dd10,0x14545ddd4)]
asset=R/'crates/azeroth-survivors-re/assets/ability-tooltips.json'
def templates(expr):
 if 'template'in expr:
  yield expr['template']
  for value in expr['values'].values():yield from templates(value)
 for value in expr.get('concat',[]):yield from templates(value)
keys={key for row in result.values()for expr in row.values()for key in templates(expr)}
locale_keys={}
for locale in (R/'crates/azeroth-survivors-re/assets/locales').glob('*.json'):
 labels=json.loads(locale.read_text());missing=sorted(keys-labels.keys());assert not missing,(locale.name,missing)
 locale_keys[locale.stem]=len(keys)
evidence=dict(date='2026-10-16',target_sha256=SHA,version='0.92.0',authority='derived from shipped artifact',method='Bounded Unicorn x86_64 execution of native picker formatter and helpers with level-zero class stats and default AbilityInstance. Reviewed allocation/String/locale/math primitives are substituted; every other external call fails closed. No OS or network calls are reachable.',functions=[manifest_range(a,b)for a,b in functions],ability_table=dict(address='0x1466d5b20',stride=120,total=111,used_picker_entries=101),base_instance=dict(power=1,modifiers=1,additional_damage=0,additional_projectiles=0,rank=1),native_scale=dict(literal='0x1458a85a4',value=1.4,applies_to=['power','cooldown','duration']),number_format=dict(function='0x1454117e0',threshold=9.95,below='one decimal, trim trailing .0',at_or_above='zero decimals'),math_imports={'0x145714a45':'truncf','0x145714a5d':'roundf','0x145714a99':'ceilf','0x145714b77':'log1pf'},stub_calls={hex(a):n for a,n in boundary_counts.items()},asset=dict(path=str(asset.relative_to(R)),sha256=hashlib.sha256(asset.read_bytes()).hexdigest(),entries=len(result)),validation=dict(english_expressions_equal_native_emulated_output=101,all_template_keys_present_in_locales=locale_keys),limitations=['The reviewed emulation primitives are not original source, and generated results are derived evidence rather than 101 independent original runtime observations.','Cleave66damage/2.1sec is independently observed in original runtime; additional original hover comparisons and rebuilt verification remain necessary.','Base picker tooltips only: upgraded gameplay spell values are outside scope.'])
(R/'docs/analysis/evidence/0.92/ability-tooltip-native-format.json').write_text(json.dumps(evidence,indent=2)+'\n')
print('Recovered101nativepickerabilitytooltips;Englishnativeoutputandall10localeexpressionkeysvalidated.')

#!/usr/bin/env python3
"""Execute unchanged selected-PE generic1/2/5 instruction fragments.

No imported function is stubbed. Explicit stops delimit condition calls,
allocation-free timestamp vectors, freecast entry and companion construction.
The separate angle owner executes its real instructions through its return.
Companion requests are proof of the producer, not a recovered live lifecycle.
"""
from portable_paths import objdump_output
from native_recovery import bits as _shared_bits
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
data = TARGET.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
pe = inventory.PE(data)
u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
MEM, STACK = 0x200000000, 0x300000000
u.mem_map(MEM, 0x10000); u.mem_map(STACK, 0x10000)
SPANS = [(0x1454cbd2a,0x1454cbddd), (0x1454cc99e,0x1454cc9fa),
    (0x1454ccd8a,0x1454cce33), (0x1454cd244,0x1454cd250),
    (0x1454cc248,0x1454cc2c8), (0x1454ce0b4,0x1454ce0e1),
    (0x1454cecba,0x1454ced65), (0x1454ceaf0,0x1454ceaf7),
    (0x14550d590,0x14550d6d6), (0x1454c9fb4,0x1454ca1a1),
    (0x145533c70,0x145533ede)]
stops = set()
def hook(_, address, size, unused):
    if address in stops: u.emu_stop()
    elif not any(a <= address < b for a,b in SPANS):
        raise RuntimeError('Unreviewed instruction ' + hex(address))
u.hook_add(UC_HOOK_CODE, hook)
def run(start, *ends):
    global stops
    stops = set(ends); u.emu_start(start, 0, count=10000)
    address = u.reg_read(UC_X86_REG_RIP)
    assert address in stops, hex(address)
    return address
def bits(value):
    return _shared_bits(value)
def reset():
    u.mem_write(MEM, bytes(0x10000)); u.mem_write(STACK, bytes(0x10000))
    for register,value in [(UC_X86_REG_R12,MEM),(UC_X86_REG_RBP,STACK),
        (UC_X86_REG_RSP,STACK+0x8000),(UC_X86_REG_MXCSR,0x1f80)]:
        u.reg_write(register,value)
def word(address,value): u.mem_write(address,struct.pack('<I',value))
def qword(address,value): u.mem_write(address,struct.pack('<Q',value))
def readword(address): return struct.unpack('<I',u.mem_read(address,4))[0]
def readqword(address): return struct.unpack('<Q',u.mem_read(address,8))[0]

counters=[]
for threshold in [0,1,4,7,0xffffffff]:
 for before in sorted(set([0,1,max(0,threshold-1),threshold,0xfffffffe,0xffffffff])):
  for condition in [False,True]:
   for exists in [False,True]:
    reset(); qword(MEM+0x88,MEM+0x2000); qword(MEM+0x90,3 if exists else 2)
    qword(STACK+0x208,2); word(MEM+0x2008,before)
    u.reg_write(UC_X86_REG_RAX,int(condition)); u.reg_write(UC_X86_REG_RBX,threshold)
    address=run(0x1454cbd2a,0x1454cbd66,0x1454ccde4)
    counters.append(dict(threshold=threshold,before=before,condition=condition,slot_exists=exists,
        after=readword(MEM+0x2008),due=address==0x1454cbd66))

rates=[]
for times in [[],[.2],[.2,.3],[.2,.3,1.2],[float('nan'),.3],[2.,.3],[0.,.5,1.,1.5]]:
 for now in [.8,1.2,2.]:
  for cap in [0,1,2,5]:
   reset(); qword(MEM+0x88,MEM+0x2000); qword(MEM+0x90,3)
   qword(MEM+0xa0,MEM+0x3000); qword(MEM+0xa8,3); qword(STACK+0x208,2)
   word(MEM+0x2008,4); qword(STACK+0x200,cap)
   descriptor=MEM+0x3030
   u.mem_write(descriptor,struct.pack('<QQQ',32,MEM+0x4000,len(times)))
   for index,time in enumerate(times): word(MEM+0x4000+4*index,bits(time))
   u.reg_write(UC_X86_REG_XMM11,bits(now)); u.reg_write(UC_X86_REG_XMM15,bits(1.))
   address=run(0x1454cbd66,0x1454cc9fa,0x1454ccde4)
   length=readqword(descriptor+16)
   rates.append(dict(timestamp_bits=[bits(t) for t in times],now_bits=bits(now),cap=cap,
       admitted=address==0x1454cc9fa,counter_after=readword(MEM+0x2008),
       expected_bits=[readword(MEM+0x4000+4*i) for i in range(length)]))

conversion=[]
for fraction in [0.,.01,.015,.02,-.1,float('nan')]:
 for maximum in [0.,1.,100.,12345.67,float('inf'),float('nan')]:
    reset(); u.reg_write(UC_X86_REG_RAX,MEM+0x2000); u.reg_write(UC_X86_REG_RCX,0)
    word(MEM+0x20f4,bits(maximum)); u.reg_write(UC_X86_REG_XMM2,bits(fraction))
    run(0x1454cd244,0x1454cd250)
    conversion.append(dict(fraction_bits=bits(fraction),maximum_bits=bits(maximum),
        amount_bits=u.reg_read(UC_X86_REG_XMM2)&0xffffffff))

refresh=[]
for old_length in range(6):
 for base in range(6):
  for total in range(base,7):
   if total-min(base,old_length)>1: continue # no memset/allocation stub
   reset(); u.reg_write(UC_X86_REG_RSI,MEM); u.reg_write(UC_X86_REG_R15,base)
   qword(MEM+0x80,32); qword(MEM+0x88,MEM+0x2000); qword(MEM+0x90,old_length)
   qword(MEM+0x718,total); qword(STACK+0x188,base)
   before=[10+i for i in range(old_length)]
   for i,value in enumerate(before): word(MEM+0x2000+i*4,value)
   run(0x1454ca041,0x1454ca0dd)
   length=readqword(MEM+0x90)
   refresh.append(dict(before=before,base=base,total=total,
       after=[readword(MEM+0x2000+4*i) for i in range(length)]))

deadline_refresh=[]
timestamp_refresh=[]
for old_length in range(6):
 for base in range(6):
  for total in range(base,7):
   if total-min(base,old_length)<=1:
    reset(); u.reg_write(UC_X86_REG_RSI,MEM); u.reg_write(UC_X86_REG_R15,base)
    qword(MEM+0x68,32); qword(MEM+0x70,MEM+0x2000); qword(MEM+0x78,old_length)
    qword(MEM+0x718,total); qword(STACK+0x188,base)
    before=[bits(10.+i) for i in range(old_length)]
    for i,value in enumerate(before): word(MEM+0x2000+i*4,value)
    run(0x1454c9fb4,0x1454ca041)
    length=readqword(MEM+0x78)
    deadline_refresh.append(dict(before_bits=before,base=base,total=total,
        after_bits=[readword(MEM+0x2000+4*i) for i in range(length)]))
   reset(); u.reg_write(UC_X86_REG_RSI,MEM); u.reg_write(UC_X86_REG_R15,base)
   qword(MEM+0x98,32); qword(MEM+0xa0,MEM+0x3000); qword(MEM+0xa8,old_length)
   qword(MEM+0x718,total)
   before=[]
   for i in range(old_length):
    # Retained prefix vectors are populated. Removed vectors are empty, so
    # native deallocation is not substituted; that call is retained in ASM.
    values=[bits(10.+i)] if i<base else []
    before.append(values)
    pointer=MEM+0x5000+i*0x100 if values else 4
    u.mem_write(MEM+0x3000+i*24,struct.pack('<QQQ',len(values),pointer,len(values)))
    if values: word(pointer,values[0])
   run(0x1454ca0dd,0x1454ca1a1)
   after=[]
   for i in range(readqword(MEM+0xa8)):
    descriptor=MEM+0x3000+i*24
    pointer=readqword(descriptor+8)
    after.append([readword(pointer+4*j) for j in range(readqword(descriptor+16))])
   timestamp_refresh.append(dict(before_bits=before,base=base,total=total,after_bits=after))

summons=[]
origin_sets=[[],[(False,2)],[(True,2)],[(True,3)],[(True,2)]*5,
    [(True,2),(False,2),(True,3),(True,2),(True,2),(True,2),(True,2)]]
states=[[1,2,3,4],[0xffffffffffffffff]*4,[0x1234567812345678,0x8765432187654321,9,31],
    [0x819cefab44556677,0x1020304050607080,0x40f6c71c69a89562,0x778899aabbccddee]]
for chance in [0.,.08,1.,float('nan')]:
 for initial in states:
  for cap in [0,1,5]:
   for origins in origin_sets:
    reset(); u.mem_write(MEM+0x8a0,struct.pack('<4Q',*initial))
    u.reg_write(UC_X86_REG_RBX,bits(chance)); u.reg_write(UC_X86_REG_XMM14,bits(1./16777216.))
    address=run(0x1454cc248,0x1454ce0b4,0x1454cc2c8)
    chance_pass=address==0x1454ce0b4
    chance_words=list(struct.unpack('<4Q',u.mem_read(MEM+0x8a0,32)))
    admitted=False; angle=None; expires=None
    if chance_pass:
      qword(MEM+0xd0,MEM+0x5000); qword(MEM+0xd8,len(origins))
      qword(STACK+0x208,2); u.reg_write(UC_X86_REG_R13,cap)
      for i,(temporary,index) in enumerate(origins):
        u.mem_write(MEM+0x5000+96*i,bytes([int(temporary)]))
        qword(MEM+0x5010+96*i,index)
      address=run(0x1454ce0b4,0x1454ced34,0x1454ced8d)
      admitted=address==0x1454ced34
      if admitted:
        word(STACK+0x200,bits(15.)); u.reg_write(UC_X86_REG_XMM11,bits(17.5))
        run(0x1454ced34,0x1454ced65)
        expires=readword(STACK+0x148)
        assert readqword(STACK+0x140)==1 and readqword(STACK+0x150)==2
        u.reg_write(UC_X86_REG_RCX,MEM+0x8a0)
        u.reg_write(UC_X86_REG_XMM1,0); u.reg_write(UC_X86_REG_XMM2,readword(0x1459095e4))
        run(0x14550d590,0x14550d6d5)
        angle=u.reg_read(UC_X86_REG_XMM0)&0xffffffff
    summons.append(dict(chance_bits=bits(chance),initial_words=initial,chance_pass=chance_pass,
        chance_words=chance_words,cap=cap,origins=[dict(temporary=t,effect_index=i) for t,i in origins],
        admitted=admitted,expires_bits=expires,angle_bits=angle,
        final_words=list(struct.unpack('<4Q',u.mem_read(MEM+0x8a0,32)))))

OUT=ROOT/'docs/analysis/evidence/0.100.1/run-effects'; OUT.mkdir(parents=True,exist_ok=True)
owners=[]
for role,lo,hi in [
 ('milestone-counter-condition',0x1454cbcf4,0x1454cbddd),
 ('milestone-counter-reset',0x1454cc99e,0x1454cca3c),
 ('milestone-counter-compaction',0x1454ccd8a,0x1454cce33),
 ('milestone-counter-refresh',0x1454ca041,0x1454ca0dd),
 ('milestone-deadline-refresh',0x1454c9fb4,0x1454ca041),
 ('milestone-timestamp-refresh',0x1454ca0dd,0x1454ca1a1),
 ('milestone-empty-timestamp-extension',0x145533c70,0x145533ede),
 ('milestone-freecast',0x1454cde33,0x1454cde8f),
 ('milestone-companion-chance',0x1454cc206,0x1454cc2d4),
 ('milestone-companion-count-entry',0x1454ce0b4,0x1454ce0e1),
 ('milestone-companion-count-empty',0x1454ceaf0,0x1454ceaf7),
 ('milestone-companion-request',0x1454cecba,0x1454ced99),
 ('milestone-conversion-condition',0x1454cc453,0x1454cc506),
 ('milestone-conversion-hit',0x1454cd244,0x1454cd28f),
 ('milestone-companion-angle',0x14550d590,0x14550d70a),
 ('milestone-companion-create',0x1454caaa0,0x1454cb721)]:
    offset=pe.rva_offset(lo-pe.image_base); raw=data[offset:offset+hi-lo]
    row=dict(role=role,address=hex(lo),end_exclusive=hex(hi),file_offset=hex(offset),sha256=hashlib.sha256(raw).hexdigest())
    (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(TARGET)],text=True))
    if role=='milestone-companion-create':
        path=ROOT/'runtime/milestone-effects-0.100.1/rea-companion-create/003-procedure_pseudo_code.json'
        evidence=json.loads(path.read_text())['response']['result']['structuredContent']
        assert evidence['subject']['digest']['sha256']==row['sha256'] and evidence['provider']['id']=='ghidra'
        row['rea_evidence_id']=evidence['evidence_id']; row['analysis_profile']=evidence['analysis_profile']
        (OUT/(role+'.ghidra.c')).write_text(evidence['normalized_result'])
    owners.append(row)
pet_address=0x1469f1e88
pet_offset=pe.rva_offset(pet_address-pe.image_base)
pet=data[pet_offset:pet_offset+48]
name_pointer,name_len=struct.unpack_from('<QQ',pet)
name_offset=pe.rva_offset(name_pointer-pe.image_base)
pet_record=dict(address=hex(pet_address),file_offset=hex(pet_offset),raw_hex=pet.hex(),
    sha256=hashlib.sha256(pet).hexdigest(),name=data[name_offset:name_offset+name_len].decode(),
    entry=struct.unpack_from('<I',pet,16)[0],model=struct.unpack_from('<I',pet,20)[0],
    scale_bits=struct.unpack_from('<I',pet,24)[0],damage_bits=struct.unpack_from('<I',pet,28)[0],
    cooldown_bits=struct.unpack_from('<I',pet,32)[0],spell_id=struct.unpack_from('<I',pet,36)[0],
    school=struct.unpack_from('<I',pet,40)[0])
fixture=dict(target_sha256=SHA,method=__doc__,owners=owners,
    spans=[dict(start=hex(a),end_exclusive=hex(b)) for a,b in SPANS],
    counters=counters,rates=rates,conversion=conversion,refresh=refresh,
    deadline_refresh=deadline_refresh,timestamp_refresh=timestamp_refresh,summons=summons,pet=pet_record,
    findings=['Counter rate rejection retains its capped pending trigger; reset precedes freecast resolution.',
        'Conversion uses fraction times live victim maximum health, original spell/school, source3 and no RNG.',
        'Companion chance precedes source-index cap; admitted requests then draw angle from the shared RNG.',
        'Companion constructor is recovered, but runtime movement/attack/expiry is a separate unresolved consumer.'])
# One native case per line makes the curated fixture reviewable without
# thousands of lines containing only scalar array elements.
case_keys={'counters','rates','conversion','refresh','deadline_refresh','timestamp_refresh','summons'}
parts=[]
for key,value in fixture.items():
    if key in case_keys:
        rendered='[\n'+',\n'.join('    '+json.dumps(case,separators=(',',':')) for case in value)+'\n  ]'
    else:
        rendered=json.dumps(value,indent=2).replace('\n','\n  ')
    parts.append('  '+json.dumps(key)+': '+rendered)
(OUT/'milestone-native.json').write_text('{\n'+',\n'.join(parts)+'\n}\n')
print('Recovered',len(counters),'counter gates,',len(rates),'rate states,',len(conversion),'conversion scalars,',len(refresh),'counter/',len(deadline_refresh),'deadline/',len(timestamp_refresh),'timestamp refresh states and',len(summons),'companion requests')

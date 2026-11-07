#!/usr/bin/env python3
"""Replay current Empowerment/Medallion native contracts without a build or game.

Uses original instructions and full installed-image memory. Memory allocation,
C memory and English fallback are the shared explicit fixture seams. Equipped
scaling cases supply factors directly, keeping Windows powf parity separate.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse
import hashlib
import json
import struct

import native_talent_fixture as n

ROOT=n.ROOT
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT=ROOT/'docs/analysis/evidence/demonic-empowerment/native-cases.json'
ASSET=ROOT/'crates/azeroth-survivors-re/assets/legionlord-0.112.0.json'


def f32(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)
def fget(vm,address):return struct.unpack('<f',vm.u.mem_read(address,4))[0]
def fput(vm,address,value):vm.u.mem_write(address,struct.pack('<f',value))
def xmm(vm,register):return struct.unpack('<f',vm.u.reg_read(register).to_bytes(16,'little')[:4])[0]
def setxmm(vm,register,value):vm.u.reg_write(register,bits(value))


def recover():
 if n.target['sha256']!=SHA:raise ValueError('Exact current installed target required')
 manifest=json.loads((OUT.parent/'manifest.json').read_text())
 if manifest['target_sha256']!=SHA:raise ValueError('Manifest target drift')
 for row in manifest['ranges']:
  offset=n.pe.rva_offset(int(row['address'],16)-n.pe.image_base)
  if hashlib.sha256(n.data[offset:offset+row['byte_count']]).hexdigest()!=row['sha256']:raise ValueError('Current native span drift')
  for key in ['assembly','pseudocode']:
   if key in row and hashlib.sha256((OUT.parent/row[key]).read_bytes()).hexdigest()!=row[key+'_sha256']:raise ValueError('Retained extract drift')
 vm=n.Machine()
 lead=json.loads((ROOT/'docs/analysis/evidence/release-data-leads.json').read_text())['selected_abilities'][0]
 ability=int(lead['record']['virtual_address'],16)
 def instance():
  at=vm.alloc(128);vm.put(at,ability)
  for offset in [0x10,0x14,0x1c,0x20,0x38,0x3c,0x44,0x48,0x50]:fput(vm,at+offset,1.)
  return at
 def pair(at):return bytes(vm.u.mem_read(vm.q(at),vm.q(at+8))).decode()
 result=vm.alloc(112);vm.call(0x1458a1730,result,ability)
 pointer,count=vm.q(result+56),vm.q(result+64)
 if count!=3:raise ValueError('Current Medallion must have exactly three effects')
 native_effects=[bytes(vm.u.mem_read(pointer+i*64,64)) for i in range(count)]
 effects=[]
 for at,raw in enumerate(native_effects):
  converted=bytearray(raw)
  if converted[0]!=37:raise ValueError('Expected current numeric spell effect')
  converted[0]=31
  key=pair(pointer+at*64+16)
  effects.append(dict(tag=37,raw_hex=converted.hex(),strings=[dict(offset=16,value=key)],
                      effect=dict(kind='spell',selector=dict(kind='key',key=key),modifier=raw[36],
                                  amount_bits=struct.unpack_from('<I',raw,32)[0])))
 asset=dict(target_sha256=SHA,definition=dict(ability_key='demonic_empowerment',
            key=pair(result+8),name=pair(result+32),icon=pair(result+72),rarity=vm.q(result+96),effects=effects))
 if asset!=json.loads(ASSET.read_text()):raise ValueError('Current Medallion asset drift')
 upgrade_cases=[]
 for cooldown,duration in [(1.,1.),(.21,5.99),(.2,6.),(.6,3.)]:
  for kind in [1,4]:
   for rarity in range(5):
    at=instance();fput(vm,at+0x14,cooldown);fput(vm,at+0x20,duration)
    vm.call(0x145993420,at,kind,rarity);actual=xmm(vm,n.UC_X86_REG_XMM0)
    if kind==1:expected=f32(f32(max(f32(f32(cooldown)+f32(-.2))/f32(.8),0.))*f32([.07,.10,.13,.17,.23][rarity]))
    else:expected=f32(f32(max(f32(f32(6.)-f32(duration))/f32(5.),0.))*f32([.15,.22,.3,.4,.6][rarity]))
    if bits(actual)!=bits(expected):raise ValueError(('upgrade mismatch',cooldown,duration,kind,rarity,actual,expected))
    upgrade_cases.append(dict(cooldown=cooldown,duration=duration,kind=kind,rarity=rarity,increment_bits=bits(actual)))
 rarity_cases=[]
 for rarity in range(6):
  at=instance();out=vm.alloc(112);vm.call(0x145899d70,out,at,rarity)
  cd=fget(vm,out+0x14);power=fget(vm,out+0x10)
  expected=1. if rarity==0 else f32(1.-f32([.07,.10,.13,.17,.23][rarity-1]))
  if power!=1. or bits(cd)!=bits(expected):raise ValueError(('learned rarity',rarity,cd,power))
  rarity_cases.append(dict(rarity=rarity,cooldown_bits=bits(cd),power_bits=bits(power)))
 scaling=[]
 for factor in [1.,1.1,1.5,2.,3.]:
  it=vm.alloc(24);scalar=vm.alloc(4);fput(vm,scalar,factor);vm.put(it,pointer,pointer+count*64,scalar)
  out=vm.alloc(24);vm.call(0x1459d9940,out,it);p,c=vm.q(out+8),vm.q(out+16)
  if c!=count:raise ValueError('Scaled effect membership drift')
  amounts=[fget(vm,p+i*64+32)for i in range(c)]
  expected=[f32(factor),min(f32(f32(.35)*f32(factor)),.5),f32(factor)]
  if amounts!=expected:raise ValueError(('scaling',factor,amounts,expected))
  scaling.append(dict(factor=factor,amount_bits=[bits(a)for a in amounts]))
 exponent_cases=[]
 for rarity in range(5):
  for picks in [0,1,0x80000000,0x80000001,0xffffffff]:
   for next_rank in [False,True]:
    vm.put(result+96,rarity);vm.u.mem_write(result+104,struct.pack('<I',picks))
    out=vm.alloc(24);sp=vm.S+0x180008;vm.put(sp,vm.D)
    vm.u.reg_write(n.UC_X86_REG_RSP,sp);vm.u.reg_write(n.UC_X86_REG_RCX,out);vm.u.reg_write(n.UC_X86_REG_RDX,result)
    vm.u.emu_start(0x1458a0e10 if next_rank else 0x1458a1550,0x1458a0e74 if next_rank else 0x1458a15af,count=100)
    exponent=xmm(vm,n.UC_X86_REG_XMM1);retention=xmm(vm,n.UC_X86_REG_XMM0)
    count=((picks+1)&0xffffffff)if next_rank else picks
    integer=max(count-1,0);signed=integer if integer<0x80000000 else integer-0x100000000
    expected=f32(signed)
    expected_retention=f32(1.+f32(f32([.6,.5,.35,.25,.2][rarity])*f32(-.5)))
    if bits(exponent)!=bits(expected)or bits(retention)!=bits(expected_retention):raise ValueError(('Current scaling exponent drift',rarity,picks,next_rank,exponent,expected,retention,expected_retention))
    exponent_cases.append(dict(rarity=rarity,picks=picks,next_rank=next_rank,retention_bits=bits(retention),exponent_bits=bits(exponent)))
 payloads=[]
 for strength in [1.,2.,3.]:
  for rank_power in [1.,500.]:
   for former_qualified_slot in [1.,10.]:
    at=instance();fput(vm,at+0x10,rank_power);fput(vm,at+0x50,strength);fput(vm,at+0x54,former_qualified_slot)
    vm.u.reg_write(n.UC_X86_REG_RSI,ability);vm.u.reg_write(n.UC_X86_REG_R12,at)
    vm.u.emu_start(0x145925d75,0x145925da8,count=40)
    actual=xmm(vm,n.UC_X86_REG_XMM10)
    if actual!=f32(f32(.4)*f32(strength)):raise ValueError('Aura composition drift')
    payloads.append(dict(effect_multiplier=strength,rank_power=rank_power,former_qualified_slot=former_qualified_slot,damage_bits=bits(actual)))
 consumer=[]
 for potency in [1.,2.,3.]:
  for bonus in [0.,.5,1.]:
   game=vm.alloc(0xb00);pet=vm.alloc(128);aura=vm.alloc(24)
   fput(vm,pet+0x70,1.);vm.put(game+0x398,1);vm.put(game+0x390,aura)
   vm.u.mem_write(aura,struct.pack('<IffIff',10,f32(f32(.4)*f32(potency)),0.,18708,20.,0.))
   fput(vm,game+0xa4c,10.);fput(vm,game+0x4c0,bonus)
   vm.u.reg_write(n.UC_X86_REG_RCX,game);vm.u.reg_write(n.UC_X86_REG_R10,pet);vm.u.reg_write(n.UC_X86_REG_RDX,0);setxmm(vm,n.UC_X86_REG_XMM3,1.)
   vm.u.emu_start(0x14595c2d4,0x14595c3c1,count=300)
   actual=xmm(vm,n.UC_X86_REG_XMM0);expected=f32(1.+f32(f32(f32(.4)*f32(potency))*f32(1.+bonus)))
   if actual!=expected:raise ValueError(('once-only buff',potency,bonus,actual,expected))
   consumer.append(dict(effect_multiplier=potency,buff_bonus=bonus,power_multiplier_bits=bits(actual)))
 admission=[]
 for supremacy in [False,True]:
  for tag in [29,30,31,32,33,34,36,37]:
   for special in ([0,1,3,4,5,6,7,8]if tag==29 else [0]):
    game=vm.alloc(0xb00);stats=vm.alloc(8);row=vm.alloc(64);descriptor=vm.alloc(64)
    vm.put(game+0x800,1 if supremacy else 0);vm.put(game+0x7f8,stats);vm.u.mem_write(stats,bytes([32,0,0,0])+struct.pack('<f',1.))
    vm.put(game+0x830,1);vm.put(game+0x828,row);vm.u.mem_write(row,bytes([tag]));vm.put(row+8,descriptor);vm.u.mem_write(descriptor+0x39,bytes([special]));vm.u.reg_write(n.UC_X86_REG_R9,game)
    setxmm(vm,n.UC_X86_REG_XMM9,0.);setxmm(vm,n.UC_X86_REG_XMM10,0.)
    stop={0x14595cdce:True,0x14595ccca:False};observed=[]
    def gate_hook(u,address,size,unused):
     if address in stop:observed.append(stop[address]);u.emu_stop()
    handle=vm.u.hook_add(n.UC_HOOK_CODE,gate_hook)
    vm.u.emu_start(0x14595cec8,0,count=1000);vm.u.hook_del(handle)
    expected=((tag==29 and special>(4 if supremacy else 0)) or tag in ([33,34]if supremacy else [32,33,34]))
    if observed!=[expected]:raise ValueError(('learn admission',supremacy,tag,special,observed,expected))
    admission.append(dict(supremacy=supremacy,effect_tag=tag,special=special,admitted=observed[0]))
 live_gates=[]
 for nearby in [0,1]:
  for special in [0,1,3,4,5,6,7,8]:
   game=vm.alloc(0xb00);pets=vm.alloc(128);descriptor=vm.alloc(64);frame=vm.S+0x80000
   vm.put(game+0xd0,pets);vm.put(game+0xd8,1);vm.put(pets+0x18,descriptor);vm.u.mem_write(descriptor+0x39,bytes([special]));vm.put(frame+0x110,ability)
   vm.u.reg_write(n.UC_X86_REG_RBP,frame);vm.u.reg_write(n.UC_X86_REG_RDI,game);vm.u.reg_write(n.UC_X86_REG_RSI,nearby)
   stop={0x145925cdb:True,0x14592684b:False};observed=[]
   def live_hook(u,address,size,unused):
    if address in stop:observed.append(stop[address]);u.emu_stop()
   handle=vm.u.hook_add(n.UC_HOOK_CODE,live_hook);vm.u.emu_start(0x145925c94,0,count=1000);vm.u.hook_del(handle)
   expected=bool(nearby and special!=0)
   if observed!=[expected]:raise ValueError(('live gate',nearby,special,observed,expected))
   live_gates.append(dict(nearby=nearby,special=special,admitted=observed[0]))
 repeat_cases=[]
 for picks in [0,1,9,10,11,4294967295]:
  game=vm.alloc(0xb00);vm.u.mem_write(game+0x408,struct.pack('<I',picks));vm.u.reg_write(n.UC_X86_REG_R12,game)
  vm.u.emu_start(0x145968ace,0x145968ad6,count=4);actual=struct.unpack('<I',vm.u.mem_read(game+0x408,4))[0]
  if actual!=(picks+1)&0xffffffff:raise ValueError('Current repeated Medallion pick count drift')
  repeat_cases.append(dict(picks=picks,next=actual))
 description_cases=[]
 template='Your demons deal {d}% more damage for {dur} sec. Cast once enemies are within 30 yd and a demon fights for you.'
 literal=0x146f44cab;offset=n.pe.rva_offset(literal-n.pe.image_base)
 if n.data[offset:offset+len(template)].decode()!=template:raise ValueError('Current native description literal drift')
 for potency in [1.,2.,3.]:
  for bonus in [0.,.5,1.]:
   frame=vm.S+0x80000;stats=vm.alloc(80);duration=vm.alloc(24);dp=vm.alloc(2);vm.u.mem_write(dp,b'11');vm.put(duration,2,dp,2);fput(vm,stats+0x40,bonus)
   vm.u.reg_write(n.UC_X86_REG_RBP,frame);vm.u.reg_write(n.UC_X86_REG_RDI,ability);vm.u.reg_write(n.UC_X86_REG_R12,stats);vm.u.reg_write(n.UC_X86_REG_R14,duration);vm.u.reg_write(n.UC_X86_REG_RSP,vm.S+0x180008);setxmm(vm,n.UC_X86_REG_XMM7,potency)
   vm.u.emu_start(0x14597c3f8,0x14597c503,count=200000)
   result=bytes(vm.u.mem_read(vm.q(frame+0x98),vm.q(frame+0xa0))).decode()
   damage=f32(f32(f32(.4)*f32(potency))*f32(1.+bonus));expected=template.replace('{d}',f'{f32(damage*100.):.0f}').replace('{dur}','11')
   if result!=expected:raise ValueError(('Current description',potency,bonus,result,expected))
   description_cases.append(dict(effect_multiplier=potency,buff_bonus=bonus,damage_percent_bits=bits(f32(damage*100.)),description=result))
 return dict(target_sha256=SHA,version='0.112.0',native_medallion_effects=[a.hex()for a in native_effects],
             upgrade_cases=upgrade_cases,learned_rarity_cases=rarity_cases,scaling_cases=scaling,generic_scaling_exponent_cases=exponent_cases,
             learn_admission_cases=admission,live_cast_gate_cases=live_gates,repeat_amulet_cases=repeat_cases,
             empowerment_effect_cases=payloads,demon_consumer_cases=consumer,
             empowerment_description_template=template,empowerment_description_cases=description_cases,
             seams=[hex(a)for a in sorted(vm.seams)],executed_instruction_addresses=len(vm.executed),
             limits=['Finite native instruction replay; source Rust is reviewed, not compiled.',
                     'Scaling factors are direct fixtures; generic rarity formula is statically traced and Windows CRT powf parity remains open.',
                     'No game process, audible/rendering/input/persistence test or original/rebuilt comparison.'])


def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');args=p.parse_args();result=recover();value=json.dumps(result,indent=2)+'\n'
 if args.write:OUT.parent.mkdir(parents=True,exist_ok=True);OUT.write_text(value)
 elif OUT.read_text()!=value:raise ValueError('Missing/stale current Empowerment cases')
 print('183 cases pass: 40 upgrade, 6 learned-rarity, 5 Medallion scaling, 50 generic scaling exponent, 12 aura, 9 once-only buff-power, 30 learn-admission, 16 live-cast gate, 6 repeated-pick and 9 current descriptions; no build or game run.')


if __name__=='__main__':main()

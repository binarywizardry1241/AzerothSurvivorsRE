#!/usr/bin/env python3
"""Replay current talent/menu/save instruction contracts; no build or application launch.

The complete selected PE backs instruction and data reads. Rust's actual numeric
formatting, allocation sorting, Unicode trim and parsers execute; declared host
seams supply memory management, C memory/roundf and English fallback localization.
"""
from script_sources import load_script
import argparse
import bisect
import hashlib
import json
import math
from pathlib import Path
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes
sys.path[:0] = [str(ROOT / 'runtime/armory-recovery/python-libs')]
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
EVIDENCE = ROOT / 'docs/analysis/evidence/0.109.0/talents-menu'

class Machine:
 def __init__(self):
  self.u=Uc(UC_ARCH_X86,UC_MODE_64);size=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections);self.u.mem_map(pe.image_base,(size+4095)&~4095)
  for s in pe.sections:self.u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
  self.H,self.S,self.D=0x200000000,0x300000000,0x400000000;self.u.mem_map(self.H,0x2000000);self.u.mem_map(self.S,0x200000);self.u.mem_map(self.D,4096);self.u.mem_map(0x500000000,4096);self.u.mem_write(0x500000010,struct.pack("<Q",self.S));self.u.reg_write(UC_X86_REG_GS_BASE,0x500000000);self.heap=self.H+0x10000;self.executed=set();self.seams=set();self.u.hook_add(UC_HOOK_CODE,self.hook)
 def q(self,a):return struct.unpack('<Q',self.u.mem_read(a,8))[0]
 def put(self,a,*values):self.u.mem_write(a,struct.pack('<'+'Q'*len(values),*values))
 def alloc(self,n):
  a=self.heap;self.heap+=(max(n,1)+15)&~15;assert self.heap<self.H+0x2000000;self.u.mem_write(a,bytes(max(n,1)));return a
 def hook(self,u,a,n,unused):
  if a==self.D:u.emu_stop();return
  if a not in {0x1458ec500,0x140002200,0x1400021d0,0x1400021c0,0x145ba3da0,0x145bfa0db,0x145bfa0e1,0x145bfa0e7,0x145bfa0ed,0x145bfa10b}:
   if pe.image_base+0x1000<=a<0x145d9b000:self.executed.add(a);return
   raise RuntimeError(f'Unreviewed external instruction{a:#x}')
  sp=u.reg_read(UC_X86_REG_RSP);c,d,r8,r9=[u.reg_read(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]]
  if a==0x1458ec500: # Explicit English fallback: no runtime language resource.
   u.reg_write(UC_X86_REG_RAX,0);u.reg_write(UC_X86_REG_RDX,0)
  elif a in [0x140002200,0x1400021d0]:pass
  elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,self.alloc(c))
  elif a==0x145ba3da0:
   at=self.alloc(r9);u.mem_write(at,bytes(u.mem_read(c,min(d,r9))));u.reg_write(UC_X86_REG_RAX,at)
  elif a==0x145bfa0db:u.mem_write(c,bytes([d&255])*r8);u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bfa0e1:
   left,right=bytes(u.mem_read(c,r8)),bytes(u.mem_read(d,r8));u.reg_write(UC_X86_REG_RAX,((left>right)-(left<right))&0xffffffffffffffff)
  elif a in [0x145bfa0e7,0x145bfa0ed]:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bfa10b:
   value=struct.unpack('<f',u.reg_read(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
   value=math.copysign(math.floor(abs(value)+.5),value) if math.isfinite(value) else value
   u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',value),'little'))
  elif pe.image_base+0x1000<=a<0x145d9b000:self.executed.add(a);return
  else:raise RuntimeError(f'Unreviewed external instruction {a:#x}, return{self.q(sp):#x}')
  self.seams.add(a);u.reg_write(UC_X86_REG_RIP,self.q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
 def call(self,a,*values,stack=None):
  sp=self.S+0x100008;self.put(sp,self.D);self.u.reg_write(UC_X86_REG_RSP,sp)
  for r,v in zip([UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9],values):self.u.reg_write(r,v)
  if stack is not None:self.put(sp+40,*stack)
  try:self.u.emu_start(a,self.D,count=3000000)
  except Exception as error:raise RuntimeError(f'pc{self.u.reg_read(UC_X86_REG_RIP):x} ret{self.q(self.u.reg_read(UC_X86_REG_RSP)):x}')from error
  assert self.u.reg_read(UC_X86_REG_RIP)==self.D,hex(self.u.reg_read(UC_X86_REG_RIP));return self.u.reg_read(UC_X86_REG_RAX)
 def vector(self,rows):
  a=self.alloc(24);v=self.alloc(16*len(rows))
  for i,(pointer,rank)in enumerate(rows):self.put(v+i*16,pointer,rank)
  self.put(a,len(rows),v,len(rows));return a
 def values(self,a):
  pointer,count=self.q(a+8),self.q(a+16);out=[]
  for i in range(count):
   t=self.q(pointer+i*16);key=bytes(self.u.mem_read(self.q(t+32),self.q(t+40))).decode();out.append((key,self.u.mem_read(pointer+i*16+8,1)[0]))
  return out
 def parse(self,value):
  self.heap=self.H+0x10000;self.u.mem_write(self.H,bytes(0x10000));raw=value.encode();self.u.mem_write(self.H+0x3000,raw or b'\0');self.call(0x14589e380,self.H,self.H+0x3000,len(raw));return self.H
 def serialize(self,a):
  out=self.alloc(24);self.call(0x1458a4340,out,a);return bytes(self.u.mem_read(self.q(out+8),self.q(out+16))).decode()


def main():
    global pe, data
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--ui', action='store_true', help='also check current page constructor prefixes and UI source connections')
    parser.add_argument('--prepare-rea', action='store_true', help='write project-local raw owner carriers and Ghidra plans')
    args = parser.parse_args()
    target = latest_target()
    data = target_bytes(target)
    module = load_script('talent_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert manifest['target_sha256'] == target['sha256']
    if args.ui:
        ui_manifest=json.loads((EVIDENCE/'ui-manifest.json').read_text())
        assert ui_manifest['target_sha256']==target['sha256']
        manifest['functions'].extend(ui_manifest['functions'])
    def raw(a, n):
        offset = pe.rva_offset(a - pe.image_base)
        assert offset is not None and 0 <= offset <= len(data)-n
        return data[offset:offset+n]
    def text(a):
        pointer, size = struct.unpack('<QQ', raw(a, 16))
        return raw(pointer, size).decode() if pointer else None
    for row in manifest['functions']:
        assert hashlib.sha256(raw(int(row['address'], 16), row['byte_count'])).hexdigest() == row['sha256'], row['name']
        for key in ['assembly', 'pseudocode']:
            if key in row:
                assert hashlib.sha256((ROOT / row[key]).read_bytes()).hexdigest() == row[key+'_sha256']
    if args.ui:
        hover=ui_manifest['shared_hover']
        assert hashlib.sha256(raw(int(hover['vtable'],16),hover['byte_count'])).hexdigest()==hover['sha256']
        for field in hover['fields']:
            assert raw(int(field['typeid_address'],16),16).hex()==field['typeid']
    if args.prepare_rea:
        for row in manifest['functions']:
            folder=ROOT/'runtime/talents-menu-0.109.0/reproduce'/row['name']
            folder.mkdir(parents=True,exist_ok=True)
            carrier=folder/'owner.bin'
            carrier.write_bytes(raw(int(row['address'],16),row['byte_count']))
            plan=dict(target=str(carrier.relative_to(ROOT)),output=str((folder/'rea').relative_to(ROOT)),open_options=dict(format='raw-binary',architecture='x86_64',entry_point=row['address']),timeout=240,operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=row['address']))])
            (folder/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
        print(f"Prepared {len(manifest['functions'])} project-local Ghidra plans. No application launched.")
        return
    asset = json.loads((ROOT / manifest['catalog']['asset']).read_text())
    assert asset['target_sha256'] == target['sha256']
    assert hashlib.sha256((ROOT / manifest['catalog']['asset']).read_bytes()).hexdigest() == manifest['catalog']['asset_sha256']
    vm = Machine()
    definitions = []
    cases = []
    for ci, cls in enumerate(asset['classes']):
        at = int(manifest['catalog']['index_address'], 16)+ci*200
        assert raw(at+192, 1)[0] == cls['id']
        class_records=[]
        for ti, tree in enumerate(cls['trees']):
            descriptor=at+ti*64
            assert [text(descriptor+i) for i in [0,16,32]] == [tree[k] for k in ['name','background','icon']]
            pointer, count=struct.unpack('<QQ',raw(descriptor+48,16))
            assert count == len(tree['talents'])
            for ri, row in enumerate(tree['talents']):
                address=pointer+ri*120
                assert [text(address+i) for i in [32,48,64,96,0,16]] == [row[k] for k in ['key','name','icon','description','prerequisite','alternative_prerequisite']]
                assert list(raw(address+112,4)) == [row['row'],row['column'],row['max_rank'],int(row['exclusive'])]
                assert bool(vm.call(0x14590f1f0,address)&255) == row['milestone']
                class_records.append((address,row))
        definitions.append((cls,class_records))
    descriptions=[]
    for cls, records in definitions:
        for address, row in records:
            for rank in range(1,row['max_rank']+1):
                vm.heap=vm.H+0x10000
                out=vm.alloc(24)
                vm.call(0x14590eaf0,out,address,rank)
                actual=bytes(vm.u.mem_read(vm.q(out+8),vm.q(out+16))).decode()
                value=row['numeric_values'][rank-1]
                expected=row['description'] if value is None else row['description'].replace('{v}',value)
                assert actual == expected,(row['key'],rank,actual,expected)
                descriptions.append([row['key'],rank,actual])
    fixtures=json.loads((EVIDENCE/'native-cases.json').read_text())
    for fixture in fixtures['normalization']:
        cls, records=next(row for row in definitions if row[0]['id']==fixture['class_id'])
        vm.heap=vm.H+0x10000
        values=vm.vector([(address,row['max_rank']) for address,row in reversed(records)])
        out=vm.alloc(24)
        vm.call(0x1459106e0,out,values,cls['id'],fixture['budget'])
        actual=vm.values(out)
        assert actual == [tuple(row) for row in fixture['allocation']]
        cases.append(dict(contract='normalize',class_id=cls['id'],budget=fixture['budget'],allocation=actual))
    for fixture in fixtures['save_rows']:
        save=vm.parse(fixture['input'])
        actual=vm.serialize(save)
        assert actual == fixture['output'],(fixture,actual)
        cases.append(dict(contract='save-rows',**fixture))
    for fixture in fixtures['switch']:
        save=vm.parse(fixture['input'])
        changed=vm.call(0x14589c630,save,1,fixture['slot'])&255
        actual=vm.serialize(save)
        assert (changed,actual)==(fixture['changed'],fixture['output'])
        cases.append(dict(contract='switch',**fixture))
    if args.ui:
        data_case_count=len(cases)
    # Constructor prefixes execute up to the first ECS spawn, with only the
        # parent handle replaced. Node offsets are independently bound to Node384.
        b=vm.H+0x1000
        vm.u.reg_write(UC_X86_REG_RSP,b)
        vm.u.reg_write(UC_X86_REG_RSI,0)
        vm.u.reg_write(UC_X86_REG_RAX,0)
        vm.u.emu_start(0x14026b487,0x14026b831,count=2000)
        node=bytes(vm.u.mem_read(b+0x1a8,384))
        val=lambda blob,offset:struct.unpack_from('<If',blob,offset)
        assert val(node,0x70)==(1,-8.) and val(node,0x80)==(1,-8.)
        assert val(node,0x88)==(0,0.) and val(node,0x90)==(0,0.)
        assert val(node,0xd8)==(1,4.) and val(node,0xe8)==(1,0.)
        assert val(node,0xf8)==(1,1.) and val(node,0x118)==(1,4.)
        cases.append(dict(contract='rank-badge-node',right=-8,bottom=-8,padding_x=4,border=1,radius=4,intrinsic=True))
        for enabled in [0,1]:
            vm.u.mem_write(vm.H+0x6000,bytes(48))
            vm.u.reg_write(UC_X86_REG_RSP,b+0x3e8)
            vm.u.reg_write(UC_X86_REG_RCX,vm.H+0x6000)
            vm.u.reg_write(UC_X86_REG_RDX,vm.H+0x6100)
            vm.u.mem_write(b+0x410,bytes([enabled]))
            vm.u.emu_start(0x14010ae50,0x14010b1cf,count=2000)
            node=bytes(vm.u.mem_read(b+0xb8,384))
            assert val(node,0xd8)==(1,14.) and val(node,0xe8)==(1,6.)
            assert val(node,0xf8)==(1,1.) and val(node,0x118)==(1,5.)
            cases.append(dict(contract='action-button-node',enabled=enabled,padding=[14,6],border=1,radius=5))
        vm.u.reg_write(UC_X86_REG_RBP,b)
        vm.u.reg_write(UC_X86_REG_RSP,vm.S+0x1000)
        vm.u.reg_write(UC_X86_REG_RCX,vm.H+0x6000)
        vm.u.emu_start(0x140109a4e,0x140109d31,count=2000)
        node=bytes(vm.u.mem_read(b-0x28,384))
        assert val(node,0x88)==(2,100.) and val(node,0x90)==(1,8.)
        assert val(node,0xa0)==(0,0.) and val(node,0x118)==(1,4.)
        cases.append(dict(contract='progress-track-node',width_percent=100,height=8,min_height_auto=True,radius=4))
        for value in [-1.,0.,.5,1.,2.,float('nan')]:
            bits=struct.pack('<f',value)
            vm.u.reg_write(UC_X86_REG_XMM6,int.from_bytes(bits,'little'))
            vm.u.emu_start(0x140109d36,0x140109d51,count=30)
            result=struct.unpack('<f',vm.u.reg_read(UC_X86_REG_XMM1).to_bytes(16,'little')[:4])[0]
            assert math.isnan(result) if math.isnan(value) else result==min(max(value,0.),1.)*100
            cases.append(dict(contract='progress-clamp',value='NaN' if math.isnan(value)else value,width='NaN' if math.isnan(result)else result))
        # This fragment is inserted under if args.ui in the durable checker.
        for cls, records in definitions:
            for tree in cls['trees']:
                actual_records=[(address,row)for address,row in records if row in tree['talents']]
                pointer=actual_records[0][0]
                out=vm.alloc(24)
                vm.call(0x1400a2ea0,out,pointer,pointer+120*len(actual_records))
                values,n=vm.q(out+8),vm.q(out+16)
                addresses=[vm.q(values+i*8)for i in range(n)]
                assert addresses==[address for address,row in actual_records if row['milestone']]
                cases.append(dict(contract='milestone-collector',class_id=cls['id'],tree=tree['name'],count=n))
                for level in sorted({row['row']for address,row in actual_records if row['milestone']}):
                    member=next(address for address,row in actual_records if row['milestone']and row['row']==level)
                    iterator=vm.alloc(24);group=vm.alloc(24);vm.put(iterator,values,values+n*8,member)
                    vm.call(0x1400a2d20,group,iterator)
                    members=[vm.q(vm.q(group+8)+i*8)for i in range(vm.q(group+16))]
                    assert members==[address for address,row in actual_records if row['milestone']and row['row']==level]
                    cases.append(dict(contract='milestone-group',class_id=cls['id'],tree=tree['name'],row=level,count=len(members)))
        # Actual current spec card prefixes, with only an empty parent handle.
        for active in [0,1]:
            save=vm.parse('');closure=vm.H+0x5000;state=vm.H+0x7000
            vm.put(state,active);vm.u.mem_write(state+16,b'\1')
            vm.put(closure,state,save,state+16,state+32)
            vm.u.reg_write(UC_X86_REG_RSP,vm.S+0x100008)
            vm.u.reg_write(UC_X86_REG_RCX,vm.H+0x6000)
            vm.u.reg_write(UC_X86_REG_RDX,closure)
            vm.u.emu_start(0x14026dfa0,0x14026e3cd,count=100000)
            bundle=vm.u.reg_read(UC_X86_REG_R8);node=bytes(vm.u.mem_read(bundle+8,384))
            assert val(node,0x88)==(0,0.)and val(node,0x90)==(0,0.)
            assert val(node,0xd8)==(1,6.)and val(node,0xe8)==(1,5.)
            assert val(node,0xf8)==(1,1.)and val(node,0x118)==(1,5.)
            assert struct.unpack('<I4f',vm.u.mem_read(bundle+0x188,20))==struct.unpack('<I4f',struct.pack('<I4f',0,*( [.973,.824,.416,1.]if active==0 else[.69,.541,.227,1.])))
            cases.append(dict(contract='spec-card-node',selected=active==0,intrinsic=True,padding=[6,5],border=1,radius=5))
        # Current selected-detail icon constructor: ordinary and milestone lanes.
        for milestone in [False,True]:
            talent=next(address for cls,records in definitions for address,row in records if row['milestone']==milestone)
            closure=vm.H+0x5000;vm.put(closure,talent,vm.H+0x7000,0,vm.H+0x7020)
            vm.u.reg_write(UC_X86_REG_RSP,vm.S+0x100008);vm.u.reg_write(UC_X86_REG_RCX,vm.H+0x6000);vm.u.reg_write(UC_X86_REG_RDX,closure)
            vm.u.emu_start(0x14026d360,0x14026d614,count=100000)
            b=vm.u.reg_read(UC_X86_REG_RBP);node=bytes(vm.u.mem_read(b+0x310,384))
            assert val(node,0x88)==(1,48.)and val(node,0x90)==(1,48.)
            assert val(node,0xf8)==(1,2.)and val(node,0x118)==(1,6.)
            cases.append(dict(contract='detail-icon-node',milestone=milestone,size=48,border=2,radius=6))
        # Current shared faded divider executes completely, including real Color conversion.
        node=vm.alloc(384);out=vm.alloc(408);color=vm.alloc(20)
        vm.u.mem_write(color,struct.pack('<I4f',0,.973,.824,.416,.25))
        vm.call(0x140100b90,out,node,color)
        assert struct.unpack('<If',vm.u.mem_read(out+0x90,8))==(1,1.)
        gradient=vm.q(out+0x188);assert vm.q(out+0x190)==1 and vm.q(gradient+24)==3
        assert bytes(vm.u.mem_read(gradient+32,4))==struct.pack('<f',math.pi/2)
        stops=vm.q(gradient+16)
        for i,alpha in enumerate([0.,.25,0.]):
            assert bytes(vm.u.mem_read(stops+32*i+12,16))==struct.pack('<4f',.973,.824,.416,alpha)
        cases.append(dict(contract='faded-divider',height=1,angle='pi/2',alpha=[0,.25,0]))
        # Current shared hover paint body, with explicit typed query-row fixtures.
        sp=vm.S+0x1000;style=vm.H+0x1000;inter=vm.H+0x1100;border=vm.H+0x1200;transform=vm.H+0x1300
        for tag in [0,1,2]:
            for present in [False,True]:
                for lift in [-3.,0.,2.5]:
                    vm.u.mem_write(style,struct.pack('<I4fI5f',0,.1,.2,.3,.4,0,.5,.6,.7,.8,lift))
                    vm.u.mem_write(inter,bytes([tag]));vm.u.mem_write(border,bytes(80));vm.u.mem_write(transform,bytes([0xcc])*32)
                    vm.u.reg_write(UC_X86_REG_RSP,sp);vm.put(sp+0x90,inter);vm.put(sp+0x78,vm.H+0x1400);vm.put(sp+0x80,0);vm.put(sp+0x50,vm.H+0x1408)
                    vm.u.mem_write(sp+0x48,struct.pack('<I',0x12345678));vm.u.mem_write(sp+0x8c,struct.pack('<I',0xabcdef12))
                    vm.u.reg_write(UC_X86_REG_R8,style);vm.u.reg_write(UC_X86_REG_R9,border);vm.u.reg_write(UC_X86_REG_RDX,transform if present else 0);vm.u.reg_write(UC_X86_REG_XMM6,0x80000000)
                    vm.u.emu_start(0x140077217,0x140076c1c,count=500)
                    assert bytes(vm.u.mem_read(border,80))==bytes(vm.u.mem_read(style+(0 if tag==2 else 20),20))*4
                    if present:assert bytes(vm.u.mem_read(transform,16))==struct.pack('<IIIf',1,0,1,0. if tag==2 else -lift)
                    else:assert bytes(vm.u.mem_read(transform,32))==bytes([0xcc])*32
                    cases.append(dict(contract='shared-hover-paint',interaction=tag,transform=present,lift=lift))
        source=(ROOT/'crates/azeroth-survivors-re/src/talents.rs').read_text()
        assert 'right: Val::Px(-8.0)' in source and 'bottom: Val::Px(-8.0)' in source
        assert 'f32::from_bits(0xffc0_0000)' in source and 'FRAC_PI_2' in source

    source=(ROOT/'crates/azeroth-survivors-re/src/save/talents.rs').read_text()
    assert 'assets/talents-menu-0.109.0.json' in source
    assert 'talent.alternative_prerequisite' in source and 'talent.exclusive' in source
    assert 'pub(super) fn normalized_rows' in source and 'fields.len() != 4' in source
    assert '.find(|row| row.class == class)' in source
    if args.ui:
        source=(ROOT/'crates/azeroth-survivors-re/src/talents.rs').read_text()
        input_body=source.split('fn input(',1)[1].split('fn text(',1)[0]
        assert 'MouseButton::Left' not in input_body and 'for request in requests' in input_body
        assert 'Every talent point earned.' in source and 'last_class' not in source
        assert 'Action::RightRefund' in input_body and '*interaction == Interaction::Hovered' in input_body
        assert 'A milestone: it changes how your spells play.' in source and '.join(" / ")' in source
        assert 'Color::srgb(1.0, 0.353, 0.235)' in source
    if args.ui:
        retained=json.loads((EVIDENCE/'ui-native-cases.json').read_text())
        assert retained['target_sha256']==target['sha256'] and retained['cases']==cases[data_case_count:]
    report=dict(target_sha256=target['sha256'],target_process_launched=False,description_cases=len(descriptions),description_sha256=hashlib.sha256(json.dumps(descriptions,separators=(',',':')).encode()).hexdigest(),metadata_cases=sum(len(rows)for _,rows in definitions),other_cases=cases,host_seams=[hex(a)for a in sorted(vm.seams)],native_instruction_addresses=len(vm.executed))
    folder=ROOT/'runtime/talents-menu-0.109.0'
    folder.mkdir(parents=True,exist_ok=True)
    (folder/('checked-ui-cases.json' if args.ui else 'checked-cases.json')).write_text(json.dumps(report,indent=2)+'\n')
    print(f"PASS {len(descriptions)} native descriptions; {report['metadata_cases']} metadata/milestone records; {len(cases)} other instruction cases; {len(manifest['functions'])} current owners. No compilation or game launch.")

if __name__ == '__main__':
    main()

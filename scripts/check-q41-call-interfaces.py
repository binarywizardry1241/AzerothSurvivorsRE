#!/usr/bin/env python3
"""Reproduce bounded P01 Pad/local-auth/configuration ABI classifications.

Original instructions and synthetic storage/method/allocator boundaries only.
No reconstructed Rust, real controller/OS/authentication or game session runs.
"""
import struct,sys,json
from pathlib import Path
sys.path.insert(0,'scripts')
from creature_query_native import EquipmentProbe,PE,D,ROOT,ENDS,T
from script_sources import load_script
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/camera/python-libs'))
from capstone import Cs,CS_ARCH_X86,CS_MODE_64

class InterfaceProbe(EquipmentProbe):
 def __init__(self):
  ranges=[(0x144bf4410,0x144bf4415),(0x144bfc300,ENDS[0x144bfc300]),(0x145a4abe0,0x145a4ac00),(0x1400021d0,0x1400021d5),(0x145cdf070,0x145cdf077),(0x140017e4d,0x140017e74),(0x140017f8f,0x140017fbf),(0x140018218,0x140018247),(0x140018399,0x1400183c0),(0x140018e8e,0x140018ecd)]
  super().__init__(D,PE,ranges);self.dealloc=[];self.exit_at=set();self.dispatch=[]
 def hook(self,uc,pc,size,unused):
  if pc in self.exit_at:self.exit=pc;self.native.emu_stop();return
  if pc==0x145cdf070 and self.dispatch_stops:
   ptr=self.reg('RCX');self.dispatch.append(dict(argument=ptr,value=self.q(ptr)));self.native.emu_stop();return
  if pc==0x145ca3160:
   self.dealloc.append([self.reg(r)for r in ['RCX','RDX','R8']]);sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp));return
  return super().hook(uc,pc,size,unused)
 def call(self,address,rcx=0,rdx=0,r8=0,r9=0):
  self.dispatch_stops=False;self.dealloc=[];self.exit_at=set();self.cursor=self.HEAP+0x1000
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE)
  for k,v in [('RSP',sp),('RCX',rcx),('RDX',rdx),('R8',r8),('R9',r9),('MXCSR',0x1f80)]:self.reg(k,v)
  self.native.emu_start(address,self.DONE,count=10000);assert self.reg('RIP')==self.DONE
def replay():
    p=InterfaceProbe();M=p.HEAP+0x10000;input=M;out=M+0x1000
    values=[0,0x80000000,0x3f800000,0xbf800000,0x7f800000,0xff800000,0x7fc00000,0x7fa12345,0x3f791687,0x3f52f1aa,0x3ed4fdf4,0x3f19999a]
    color=[]
    for j in range(4):
     for v in values:
      words=[0x3f791687,0x3f52f1aa,0x3ed4fdf4,0x3f19999a];words[j]=v;p.native.mem_write(input,struct.pack('<5I',0,*words));p.call(0x144bf4410,out,input)
      got=bytes(p.native.mem_read(out,16));assert got==struct.pack('<4I',*words);color.append(words)
    refcount=[]
    for sentinel in [False,True]:
     for count in [0,1,2,3,0x100000000,0xffffffffffffffff]:
      p.put(input,0xffffffffffffffff if sentinel else out);p.put(out,0x1234,count);p.call(0x145a4abe0,input)
      expected=count if sentinel else(count-1)&0xffffffffffffffff;assert p.q(out+8)==expected
      assert p.dealloc==([]if sentinel or count!=1 else[[out,0x170,0x10]])
      refcount.append(dict(sentinel=sentinel,count=count,result=expected,dealloc=p.dealloc))
    dispatch=[]
    for offset in range(8):
     ptr=M+offset*0x80;selfptr=out+offset*0x80;p.put(ptr,selfptr);p.put(selfptr+24,p.DONE)
     p.call(0x145cdf070,ptr,0x12345678,0x80000000,0x7ff00000)
     assert p.reg('RCX')==selfptr and p.reg('RDX')==0x12345678 and p.reg('R8')==0x80000000 and p.reg('R9')==0x7ff00000
     dispatch.append(dict(input=ptr,forwarded=selfptr,rdx=p.reg('RDX'),r8=p.reg('R8'),r9=p.reg('R9')))
    # Each observed config call has the same low-two-bit gate. Stop at the ABI
    # boundary, before dereferencing any actual OS/error-owned object.
    rows=[]
    for start,skip,receiver,tag in [(0x140017e4d,0x140017e74,-0x50,-0x58),(0x140017f8f,0x140017fbf,0x6e0,0x6d8),(0x140018218,0x1400182de,-0x50,-0x58),(0x140018399,0x1400183c0,-0x50,-0x58),(0x140018e8e,0x140018f7f,0x6e0,0x6d8)]:
     for value in [*range(16),0xffffffffffffffff]:
      frame=p.STACK+0x10000;p.native.mem_write(frame-0x100,bytes(0x1000));p.dispatch=[];p.dispatch_stops=True;p.exit_at={skip};p.reg('RAX',value);p.reg('RBP',frame);p.reg('RSP',p.STACK+0x1f0008)
      p.native.emu_start(start,0,count=40);called=value&3==1;assert bool(p.dispatch)==called,(hex(start),value,p.dispatch)
      if called:
       assert p.dispatch==[dict(argument=frame+receiver,value=value-1)];assert p.native.mem_read(frame+tag,1)[0]==3
      rows.append(dict(start=hex(start),value=value,called=called))
    result=dict(color_cases=color,refcount_cases=refcount,dispatch_cases=dispatch,config_gate_cases=rows)
    return result


def main():
    import argparse,hashlib
    from coverage_common import file_sha256
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage',action='store_true');args=parser.parse_args()
    work=ROOT/'runtime/analysis/history/findings/q41-call-interfaces/3d285c807f09'
    parent=ROOT/'docs/analysis/evidence/q41-p01-aura/manifest.json'
    routing=json.loads(parent.read_text())['target_routing']
    assert len(routing)==21 and sum(r['record_count']for r in routing)==244
    wanted={'0x144bf4410':1,'0x145a3dce0':3,'0x145a4abe0':1,'0x145cdf070':5}
    selected=[r for r in routing if r['target']in wanted]
    assert {r['target']:r['record_count']for r in selected}==wanted
    observations=[]
    for path in sorted((work/'rea-interfaces').glob('0*.json')):
        e=json.loads(path.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
        if e.get('operation')not in ['procedure_info','procedure_pseudo_code']:continue
        assert e['subject']['digest']['sha256']==T['sha256']
        row=dict(evidence_id=e['evidence_id'],operation=e['operation'],parameters=e['parameters'],
                 response=dict(path=path.relative_to(ROOT).as_posix(),sha256=file_sha256(path)))
        if e['operation']=='procedure_info':row['actual_body']=e['normalized_result']['body']
        else:
            text=e['normalized_result'];row['pseudocode_sha256']=hashlib.sha256(text.encode()).hexdigest()
            if e['parameters']['procedure']in ['0x145a3dce0','0x145a483b0']:
                assert 'num-bigint-0.4.6' in text and 'biguint' in text and 'power.rs' in text
                assert 'zero modulus' in text
                row['observed_role']='shared_big_unsigned_power_modulus_boundary_not_full_math_or_auth_recovery'
        observations.append(row)
    assert len(observations)==12
    def span(a,b):
        o=PE.rva_offset(a-PE.image_base)
        return dict(start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(D[o:o+b-a]).hexdigest())
    native_ranges=[span(a,b)for a,b in [(0x144bf4410,0x144bf4415),(0x144bfc300,ENDS[0x144bfc300]),
                    (0x145a3dce0,0x145a3dce5),(0x145a483b0,ENDS[0x145a483b0]),
                    (0x145a4abe0,0x145a4ac00),(0x145cdf070,0x145cdf077)]]
    input_words=list(struct.unpack('<4I',D[PE.rva_offset(0x145ed743c-PE.image_base):][:16]))+[0x3f19999a]
    assert input_words==[0,0x3f791687,0x3f52f1aa,0x3ed4fdf4,0x3f19999a]
    source=ROOT/'crates/azeroth-survivors-re/src/native_input/focus.rs'
    assert 'Color::linear_rgba(0.973, 0.824, 0.416, 0.6)'in source.read_text()
    result=dict(schema_version=1,target=T,gap_ids=[9,17,22,41,62],
        original_parent=dict(path=parent.relative_to(ROOT).as_posix(),sha256=file_sha256(parent)),
        original_selected_records=245,static_target_records=244,static_targets=21,
        selected_interfaces=[dict(original_routing_record=r, bounded_classification={
            '0x144bf4410':'Current Pad input has tag0; the admitted leaf copies four RGBA words. Other variants and complete UI identity remain unverified.',
            '0x145a3dce0':'Shared big-unsigned power/modulus library boundary; no authentication or bigint reconstruction.',
            '0x145a4abe0':'Sentinel-aware counter decrement/storage-release ABI; concrete object/ownership identity unclassified.',
            '0x145cdf070':'Five low-tag1 move/gate prefixes plus slot+0x18 tail-forward ABI; concrete runtime payload/method remains unclassified.',
        }[r['target']])for r in selected],native_ranges=native_ranges,ghidra_observations=observations,
        pad_input=dict(call='0x14014181c',input_constant='0x145ed743c',words=input_words,
            observed_tag=0,source_ref=source.relative_to(ROOT).as_posix(),source_sha256=file_sha256(source),
            scope='Selected current tagged-value/RGBA copy and matching source color constant only; broader converter variants, UI element identity, source/ECS/color-pipeline/rendered parity remain unverified.'),
        replay=replay(),limits=[
            '153 synthetic cases:48 tag0 bitwise copies,12 reference-count storage states,8 indirect method forwards,85 already-selected configuration tagged-result gates.',
            'The local-auth power/modulus role follows current Ghidra code/diagnostics. No bigint algorithm or authentication execution/reconstruction; this branch stops at shared-library context.',
            'Reference-count storage release is observed, not a proven concrete Arc/Rc object type or complete ownership protocol. The allocator is intercepted.',
            'Configuration gates retain only low-tag1, subtract1 and move the payload before the slot+0x18 tail dispatcher. The concrete error/payload/method identity remains unclassified; synthetic pointers stop before actual dispatch.',
            'Tag0 copy cases do not classify other converter variants or repair original computed body ownership. All original census/P01 counts/selectors remain unchanged.',
            'No new AS source defect is established. No compiler, source, Windows/controller/filesystem/auth/network/game or original/rebuilt parity execution.'])
    encoded=json.dumps(result,indent=2)+'\n'
    path=work/'call-interfaces.json'if args.stage else ROOT/'docs/analysis/evidence/q41-call-interfaces.json'
    if args.stage:path.write_text(encoded)
    else:assert path.read_text()==encoded
    print(json.dumps(dict(selected_original_records=10,abi_cases=153,source_change_required=False,parity_verified=False)))


if __name__=='__main__':main()

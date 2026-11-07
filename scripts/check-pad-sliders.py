#!/usr/bin/env python3
"""Replay current full Options pad-slider input, formatting and command publication.

All19 actual descriptors and invalid/control gates execute original instructions.
No compiler, reconstructed Rust, live Options window, file or device runs.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse,hashlib,json,math,struct
import native_talent_fixture as n

OUT=n.ROOT/'docs/analysis/evidence/pad/sliders.json'

def f(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def render(v):
 if math.isnan(v):return 'NaN'
 text=f'{v:.2f}'.rstrip('0').rstrip('.')
 return '0'if text=='-0'else text

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');args=p.parse_args()
 rows=json.loads((n.ROOT/'crates/azeroth-survivors-re/assets/options.json').read_text())['rows'];assert len(rows)==105
 vm=n.Machine();cases=[];gates=[]
 def call(index,current,direction,closed=False):
  state=vm.alloc(0x200);values=vm.alloc(24*105);buffer=vm.alloc(56*4);vm.put(state+0x30,4,buffer,0);vm.put(state+0xb0,0xffffffffffffffff if closed else 105,values,105)
  if index<105:
   text=current.encode();at=vm.alloc(len(text));vm.u.mem_write(at,text);vm.put(values+index*24,len(text),at,len(text))
  vm.u.reg_write(n.UC_X86_REG_XMM2,bits(direction));vm.call(0x14011da10,state,index)
  count=vm.q(state+0x40)
  if count:
   assert count==1 and vm.q(buffer)==0x8000000000000000 and vm.q(buffer+32)==index
   return bytes(vm.u.mem_read(vm.q(buffer+16),vm.q(buffer+24))).decode()
  return None
 for index,row in enumerate(rows):
  if row['control']>4:
   assert call(index,'0.5',1.) is None;gates.append([index,row['control'],'non_slider']);continue
  lo,hi,step=map(f,row['range']);assert step>0.,'Current descriptors changed; review fallback and source admission'
  # Current immutable native data is read independently for exact descriptor
  # range/control shape before supplying only dynamic per-row Strings.
  at=0x145dc2250+index*152;off=n.pe.rva_offset(at-n.pe.image_base)
  assert struct.unpack_from('<Q',n.data,off+64)[0]==row['control']
  assert struct.unpack_from('<III',n.data,off+88)==tuple(map(bits,(lo,hi,step)))
  for current in [str(lo),str(f((lo+hi)/2)),str(hi),'invalid','']:
   for direction in [-1.,1.]:
    actual=call(index,current,direction)
    try:value=f(float(current))
    except ValueError:value=lo
    wanted=render(min(max(f(value+f(f(direction)*step)),lo),hi))
    assert actual==wanted,(row['key'],current,direction,actual,wanted)
    cases.append([index,current,direction,actual])
 for index,closed in [(105,False),(0,True),(6,True)]:assert call(index,'0.5',1.,closed) is None;gates.append([index,closed,'bounds_or_closed'])
 source=(n.ROOT/'crates/azeroth-survivors-re/src/options.rs').read_text()
 for token in ['0..=4 => {','Slider(index)','let value = device_slider_value(row.range, current, direction)','state.set(row, slider_string(row, value))','let text = format!("{value:.2}")']:
  assert token in source,token
 proof=dict(target_sha256=n.target['sha256'],slider_owner='0x14011da10',formatter='0x14012bfd0',actual_descriptors=19,positive_step_descriptors=19,native_input_format_publish_cases=len(cases),gate_cases=len(gates),output_sha256=hashlib.sha256(json.dumps([cases,gates],ensure_ascii=False).encode()).hexdigest(),seams=[hex(a)for a in sorted(vm.seams)],limits=['Actual descriptor data, float parsing/formatting and56-byte command publication execute original instructions with synthetic Options state/preallocated command capacity.','Allocator/C-memory are shared explicit seams. Native command consumption, CVar/backend writes, gamma inversion, persistence, ECS/layout, actual device and source Rust execution remain separate.','All19 current steps are positive. The separate nonpositive/NaN fallback math cases do not demonstrate a currently affected default control.'])
 text=json.dumps(proof,indent=2)+'\n'
 if args.write:OUT.write_text(text)
 else:assert OUT.read_text()==text
 print(f'{len(cases)} native slider parse/format/publication cases and{len(gates)} gates pass; all19 current steps positive; no compiler/game')
if __name__=='__main__':main()

#!/usr/bin/env python3
"""Current XInput instruction replay and source wiring checks; never compile or launch.

GetState, Commands allocation, String formatting/cloning, environment and Win32
module lookup are explicit fixture seams. The poll/axis instructions, slot state,
message writes, strict selector, load order and conversion arithmetic are native.
"""
from portable_paths import portable_json
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT = ROOT / 'docs/analysis/evidence/xinput'
WORK = ROOT / 'runtime/analysis/history/movement/input/8d261063d4b4'
RANGES = {'poll': (0x14031d0a0, 0x14031dd31), 'axis': (0x140300240, 0x140300377),
          'backend': (0x140305f10, 0x14030611e), 'loader': (0x1403058d0, 0x140305e82),
          'registration': (0x1401b6e3d, 0x1401b6e75)}
BUTTONS = [(1,15),(2,16),(4,17),(8,18),(16,11),(32,10),(64,13),(128,14),
           (256,6),(512,8),(4096,0),(8192,1),(16384,3),(32768,2)]
AXES = [0,1,3,4]
ZERO = (0,0,0,0,0,0,0)

def f32(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');ap.add_argument('--prepare-rea',action='store_true');args=ap.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target)
    module = load_script('xinput_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    def raw(a,n):
        off=pe.rva_offset(a-pe.image_base);v=data[off:off+n];assert len(v)==n;return v
    if args.prepare_rea:
        for role, (a, b) in RANGES.items():
            if role == 'registration': continue
            work = WORK / ('xinput-' + role); work.mkdir(parents=True, exist_ok=True)
            (work / 'code.bin').write_bytes(raw(a, b-a))
            (work / 'seeds.tsv').write_text(f'{a:#x}\tcode\n{a:#x}\tfunction\n')
            plan = dict(target=str((work/'code.bin').relative_to(ROOT)), output=str((work/'rea').relative_to(ROOT)),
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(a)),
                init_timeout=60, timeout=240, environment={'REA_GHIDRA_SEED_FILE':str((work/'seeds.tsv').relative_to(ROOT))},
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a)))])
            (work/'plan.json').write_text(portable_json(plan, indent=2)+'\n')
        print('Prepared four current REA/Ghidra acquisition plans under project runtime/')
        return
    def cstr(a):
        return raw(a,128).split(b'\0',1)[0].decode('ascii')
    sys.path[:0]=[str(ROOT/'runtime/tool-state/python/armory/python-libs'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as x
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    def keep(path,value):
        if args.write:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
        else:assert path.read_text()==value,path
    spans=[]
    for role,(a,b) in RANGES.items():
        v=raw(a,b-a);ins=list(md.disasm(v,a));assert sum(i.size for i in ins)==len(v)
        asm=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        keep(OUT/(role+'.asm'),asm)
        row=dict(role=role,address=hex(a),end_exclusive=hex(b),file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=b-a,sha256=hashlib.sha256(v).hexdigest(),assembly=role+'.asm',assembly_sha256=hashlib.sha256(asm.encode()).hexdigest())
        if role!='registration':
            # These IDs attest the fresh raw import/decompilation, not OS/ECS behavior.
            if args.write:
                ev=json.loads((WORK/f'xinput-{role}/rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
                row.update(rea_evidence_id=ev['evidence_id'],analysis_profile_digest=ev['analysis_profile']['digest'],raw_input_sha256=ev['subject']['digest']['sha256'])
            else:
                old=json.loads((OUT/'manifest.json').read_text());prior=next(s for s in old['ranges'] if s['role']==role)
                row.update({k:prior[k] for k in ['rea_evidence_id','analysis_profile_digest','raw_input_sha256']})
            assert row['raw_input_sha256']==row['sha256']
        spans.append(row)
    assert list(struct.iter_unpack('<HH',raw(0x145e16a50,56)))==BUTTONS
    u=Uc(UC_ARCH_X86,UC_MODE_64);mem=0x200000000;u.mem_map(mem,0x200000);mapped=set()
    def demand(_,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:u.mem_map(page,4096);u.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
    def get(a,f):return struct.unpack('<'+f,u.mem_read(a,struct.calcsize('<'+f)))
    def reg(k):return u.reg_read(getattr(x,'UC_X86_REG_'+k))
    def setreg(k,v):u.reg_write(getattr(x,'UC_X86_REG_'+k),v)
    stop=mem+0x1ff000;stub=mem+0x1fe000;obj=mem+0x30000;cmd=mem+0x31000;rsrc=mem+0x32000;timedesc=mem+0x33000;time=mem+0x34000;tick=mem+0x35000;rsp=mem+0x18000
    context={}
    def return_stub():
        address=get(reg('RSP'),'Q')[0];setreg('RSP',reg('RSP')+8);setreg('RIP',address)
    def hook(_,a,n,user):
        if a in context['stops']:u.emu_stop();return
        # Calls are seam-mocked by their exact observed site or helper entry.
        if context.get('kind')=='backend':
            if a==0x140305f2a:
                value=context['environment'];out=reg('RCX')
                if value is None:put(out,'q',-1)
                else:
                    v=value.encode();u.mem_write(mem+0xb0000,v);put(out,'qQQQ',-2,0,mem+0xb0000,len(v))
                setreg('RIP',a+n);return
            if a in [0x140305ffa,0x140306013]:
                assert cstr(reg('RCX') if a==0x140305ffa else reg('RDX'))==('ntdll.dll' if a==0x140305ffa else 'wine_get_version')
                setreg('RAX',int(context['wine']));setreg('RIP',a+n);return
        if context.get('kind')=='loader' and a in [0x1403058fc,0x140305923,0x14030594a,0x140305911,0x140305938,0x140305963]:
            index=[0x1403058fc,0x140305923,0x14030594a].index(a) if a in [0x1403058fc,0x140305923,0x14030594a] else [0x140305911,0x140305938,0x140305963].index(a)
            library= a in [0x1403058fc,0x140305923,0x14030594a]
            assert cstr(reg('RCX') if library else reg('RDX'))==(['xinput1_4.dll','xinput1_3.dll','xinput9_1_0.dll'][index] if library else 'XInputGetState')
            context['loads'].append((index,library));value=context['libraries'][index][0 if library else 1]
            setreg('RAX',0x12345678 if value else 0);setreg('RIP',a+n);return
        if a==stub:
            slot=reg('RCX');context['polled'].append(slot);sample=context['samples'][slot]
            if sample is None:setreg('RAX',1167)
            else:u.mem_write(reg('RDX'),struct.pack('<IHBBhhhh',context.get('packet',1),*sample));setreg('RAX',0)
        elif a==0x144e818d0:
            context['serial']+=1;put(reg('RCX'),'Q',(1<<32)|context['serial'])
        elif a==0x145bdd130:
            pointer=get(reg('R8'),'Q')[0];number=get(pointer,'Q')[0];context['names'].append(number)
            put(reg('RCX'),'QQQ',20,mem+0xa0000,19)
        elif a==0x145bdd5f0:u.mem_write(reg('RCX'),bytes(u.mem_read(reg('RDX'),24)))
        else:
            assert any(a0<=a and a+n<=b for a0,b in RANGES.values()),hex(a)
            assert bytes(u.mem_read(a,n))==raw(a,n),hex(a)
            assert raw(a,1)!=b'\xe8' or a in [0x14031d4f8,0x14031d54c,0x14031d5b5,0x14031dc8f,0x14031dca6,0x14031dcbd,0x14031dcd5],hex(a)
            return
        return_stub()
    u.hook_add(UC_HOOK_CODE,hook)
    def run(start,stops=None):
        context['stops']=set(stops or [stop]);setreg('EFLAGS',2);setreg('MXCSR',0x1f80)
        u.emu_start(start,0,count=100000);assert reg('RIP') in context['stops']
    def clear():
        u.mem_write(mem,bytes(0x200000));put(rsp,'Q',stop);setreg('RSP',rsp);context.clear()
    count=0
    for value in range(-32768,32768):
        context.update(kind='axis');setreg('RDI',value&65535);run(0x1403002ae,[0x1403002d5]);assert reg('XMM6')&0xffffffff==bits(min(1.,max(-1.,value/32767.)));count+=1
    for value in range(256):
        context.update(kind='trigger');setreg('RBP',mem);put(mem+0x1c7,'B',value);setreg('XMM9',bits(255.));run(0x14031da6c,[0x14031da81]);assert reg('XMM13')&0xffffffff==bits(value/255.);count+=1
    selector_cases=0
    # Disable only diagnostic logging; the actual selector branch still executes.
    page=0x14808c000
    if page not in mapped:u.mem_map(page,4096);mapped.add(page)
    put(0x14808cfa8,'Q',mem+0xc0000)
    for value in [None,'','xinput','gilrs','wgi','off','XINPUT',' xinput','xinput\n','other']:
      for wine in [False,True]:
        clear();put(mem+0xc0000,'Q',3);context.update(kind='backend',environment=value,wine=wine)
        run(RANGES['backend'][0]);expected={'xinput':1,'gilrs':0,'wgi':0,'off':2}.get(value,int(wine));assert reg('RAX')&255==expected,(value,wine,reg('RAX'));selector_cases+=1
    loader_cases=0
    for mask in range(64):
        libraries=[(bool(mask&(1<<(i*2))),bool(mask&(2<<(i*2)))) for i in range(3)]
        clear();context.update(kind='loader',libraries=libraries,loads=[])
        run(RANGES['loader'][0],[0x140305972,0x140305bf0])
        expected=[];found=False
        for i,(loaded,symbol) in enumerate(libraries):
            expected.append((i,True))
            if loaded:
                expected.append((i,False))
                if symbol:found=True;break
        assert context['loads']==expected
        assert (reg('RIP')==0x140305972)==found;loader_cases+=1
    def poll(previous,samples,now,deadline,packet=1):
        clear();context.update(kind='poll',samples=samples,polled=[],serial=100,names=[],packet=packet)
        put(obj,'Q',stub);put(obj+0x68,'f',deadline)
        for i,p in enumerate(previous):
            if p is not None:put(obj+8+i*24,'QHBBhhhh',p[0],*p[1])
        put(rsrc,'QQQQ',obj,0,tick,1<<32);put(timedesc,'Q',time);put(time+0x8c,'f',now)
        lanes=[]
        for i in range(4):
            desc=mem+0x40000+i*0x1000;head=mem+0x50000+i*0x1000;buf=mem+0x60000+i*0x10000
            put(desc,'QQQQ',head,0,tick,1<<32);put(head+0x20,'QQQ',1000,buf,0);put(head+0x40,'Q',0);lanes.append((desc,head,buf));put(rsp+0x28+i*8,'Q',desc)
        setreg('RCX',cmd);setreg('RDX',cmd);setreg('R8',rsrc);setreg('R9',timedesc);run(RANGES['poll'][0])
        expected=[];polled=[];names=[];serial=100
        for slot,(old,sample) in enumerate(zip(previous,samples)):
            if old is None and now<deadline:continue
            polled.append(slot)
            if sample is None:
                if old is not None:expected.append(('connection',old[0],False))
                assert get(obj+8+slot*24,'I')[0]==0
                continue
            if old is None:
                serial+=1;entity=(1<<32)|serial;expected.append(('connection',entity,True));names.append(slot+1);old_sample=None
            else:entity,old_sample=old
            assert get(obj+8+slot*24,'QHBBhhhh')==(entity,*sample)
            for mask,tag in BUTTONS:
                if old_sample is None or (sample[0]^old_sample[0])&mask:expected.append(('button',entity,tag,bits(float(bool(sample[0]&mask)))))
            for field,tag in [(1,7),(2,9)]:
                if old_sample is None or old_sample[field]!=sample[field]:expected.append(('button',entity,tag,bits(sample[field]/255.)))
            for field,tag in enumerate(AXES,3):
                if old_sample is None or old_sample[field]!=sample[field]:expected.append(('axis',entity,tag,bits(min(1.,max(-1.,sample[field]/32767.)))))
        assert context['polled']==polled and context['names']==names
        assert get(obj+0x68,'f')[0]==(f32(now+2.) if now>=deadline else deadline)
        actual=[]
        for _,h,b in lanes[:1]:
            for i in range(get(h+0x30,'Q')[0]):
                at=b+48*i;kind=get(at,'Q')[0]
                if kind==0xffffffffffffffff:actual.append(('connection',get(at+32,'Q')[0],False))
                elif kind==0x8000000000000000:actual.append(('button',get(at+8,'Q')[0],get(at+20,'H')[0],get(at+16,'I')[0]))
                elif kind==0x8000000000000001:actual.append(('axis',get(at+8,'Q')[0],get(at+20,'B')[0],get(at+16,'I')[0]))
                else:actual.append(('connection',get(at+32,'Q')[0],True))
        assert actual==expected,(actual,expected)
        for kind,(_,h,b) in zip(['connection','button','axis'],lanes[1:]):
            rows=[r for r in expected if r[0]==kind];assert get(h+0x30,'Q')[0]==len(rows)
            for i,row in enumerate(rows):
                at=b+i*(48 if kind=='connection' else 24)
                if kind=='connection':assert get(at+32,'Q')[0]==row[1] and (get(at,'Q')[0]!=0xffffffffffffffff)==row[2]
                else:assert get(at+8,'Q')[0]==row[1] and get(at+20,'B')[0]==row[2] and get(at+16,'I')[0]==row[3]
        return expected
    poll_cases=0
    for connected in range(16):
      for acquired in range(16):
       for now in [1.,2.,3.]:
        previous=[((1<<32)|(i+1),ZERO) if connected&(1<<i) else None for i in range(4)]
        samples=[ZERO if acquired&(1<<i) else None for i in range(4)]
        poll(previous,samples,now,2.);poll_cases+=1
    # Every physical bit, both edges, both triggers, each stick endpoint and
    # one-word updates; packet-only differences must remain completely silent.
    samples=[(1<<bit,0,0,0,0,0,0) for bit in range(16)]
    for field,values in [(1,[0,1,127,254,255]),(2,[0,1,127,254,255])]+[(i,[-32768,-32767,-1,0,1,32767]) for i in range(3,7)]:
      for value in values:
        s=list(ZERO);s[field]=value;samples.append(tuple(s))
    for sample in samples:
      for old,new in [(ZERO,sample),(sample,ZERO),(sample,sample)]:
        poll([((1<<32)|1,old),None,None,None],[new,None,None,None],1.,2.,packet=999);poll_cases+=1
    source=(ROOT/'crates/azeroth-survivors-re/src/native_input/acquisition.rs').read_text()
    for token in ['slots: [Option<(Entity, Sample)>; 4]','next_probe: 0.','now >= acquisition.next_probe','now + 2.','for slot in 0..4','commands.spawn_empty()',
                  'acquisition.slots[slot].take()','old == Some(sample)','sample.buttons','/ 255.','/ 32767.','poll.before(InputSystems)','plugins.disable::<bevy::gilrs::GilrsPlugin>()']:
        assert token in source,token
    assert source.index('c"xinput1_4.dll"')<source.index('c"xinput1_3.dll"')<source.index('c"xinput9_1_0.dll"')
    assert 'native_input::device_plugins(DefaultPlugins.set(WindowPlugin' in (ROOT/'crates/azeroth-survivors-re/src/main.rs').read_text()
    assert 'acquisition::register(app)' in (ROOT/'crates/azeroth-survivors-re/src/native_input/mod.rs').read_text()
    manifest=dict(target=target,ranges=spans,button_mask_to_bevy_tag=BUTTONS,axis_tags=AXES,
                  counts=dict(signed_axis_cases=65536,trigger_cases=256,backend_cases=selector_cases,loader_cases=loader_cases,complete_poll_cases=poll_cases),
                  seams=['XInputGetState outcome/raw bytes','Commands entity allocation','String formatting and cloning','Environment and Win32 module/symbol lookup','ECS/event consumption, device/platform and Rust source execution do not run'],
                  compilation_run=False,target_executed=False,parity_verified=False)
    keep(OUT/'manifest.json',json.dumps(manifest,indent=2)+'\n')
    print(json.dumps(manifest['counts']));print('Current native poll state, aggregate/typed events and source wiring pass; compilation, devices and parity unverified')

if __name__=='__main__':main()

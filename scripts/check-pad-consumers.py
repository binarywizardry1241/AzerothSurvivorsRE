#!/usr/bin/env python3
"""Bound current controller input, focus and presentation to original instructions.

No compilation, games, input devices or native ECS/OS calls. Arithmetic blocks
run with synthetic native state, target bytes and preallocated event storage.
"""
from portable_paths import portable_json
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import itertools
import struct
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT=ROOT/'docs/analysis/evidence/0.112.0/pad'
WORK=ROOT/'runtime/input-0.112.0'
OWNERS={'pad-state':(0x1401b8090,0x1401b8543),'pad-handoff':(0x1401c0a70,0x1401c114e),
        'pad-world':(0x1401c1150,0x1401c18d2),'pad-focus':(0x1401c1c50,0x1401c3673),
        'pad-settings':(0x1401c3da0,0x1401c4260),'button-edge':(0x1401b6c60,0x1401b6e10),
        'focus-occlusion':(0x14019e980,0x14019ef65),'focus-stack':(0x1401e2c40,0x1401e3034),
        'focus-parents':(0x14018c230,0x14018c2f5),'focus-occluder':(0x1401c0280,0x1401c0388),
        'ring':(0x1401c18e0,0x1401c1c11),'ring-shadow':(0x1426554b0,0x14265556d),
        'ring-color':(0x144c91200,0x144c91976),'ring-placement':(0x1401c0390,0x1401c0a6d),
        'scroll-clamp':(0x1401b5bb0,0x1401b5c19),
        'pad-settings-leaf':(0x144598df0,0x144598e3f),'pad-raw-stick':(0x144592340,0x14459238a),
        'pad-axis-get':(0x14003a2d0,0x14003a5a2)}
SPANS={'radial':(0x1401b84e6,0x1401b8519), 'jump':(0x1401c15cc,0x1401c15e6),
       'repeat':(0x1401c2c5a,0x1401c2cdb),'score':(0x1401c2e0e,0x1401c2e68),
       'secondary-tag':(0x1401c319a,0x1401c31ae),'secondary-events':(0x1401c31ae,0x1401c324e),
       'cursor-step':(0x1401c1020,0x1401c1054),'handoff':(0x1401c10a5,0x1401c110a),
       'look-speed':(0x1401c3fec,0x1401c3ffb),'zoom-speed':(0x1401c4068,0x1401c4077),
       'button-edge':(0x1401b6c60,0x1401b6e10),'mode-activity':(0x1401c0d85,0x1401c0dce),
       'keyboard-latch':(0x1401c18c9,0x1401c18cd),
       'focus-wait':(0x1401c2994,0x1401c2a1b),
       'focus-inactive':(0x1401c20a1,0x1401c20ba),
       'focus-occlusion':(0x14019e980,0x14019ef65),'focus-bounds':(0x1401c02ff,0x1401c0388),
       'keyboard-queue':(0x1401c0dce,0x1401c0ea8),'mouse-queue':(0x1401c0ea8,0x1401c0f86),
       'ring':(0x1401c18e0,0x1401c1c11),'ring-shadow':(0x1426554b0,0x14265556d),
       'ring-color-copy':(0x144c91246,0x144c91251),
       'ring-padding':(0x1401c08c6,0x1401c08ee),'ring-hide':(0x1401c091f,0x1401c0933),
       'focus-scroll':(0x1401c3394,0x1401c34f0),'scroll-clamp':(0x1401b5bb0,0x1401b5bcc),
       'pad-settings-leaf':(0x144598df0,0x144598e3f),
       'pad-raw-stick':(0x144592340,0x14459238a),'pad-axis-clamp':(0x14003a57f,0x14003a5a2),
       'character-key':(0x1401c179f,0x1401c18c9),
       'start-menu':(0x1401c148c,0x1401c14ac),'back-menu':(0x1401c317d,0x1401c319a)}

def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');ap.add_argument('--prepare-rea',action='store_true');args=ap.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA;data=target_bytes(target)
    m = load_script('pad_pe', ROOT/'scripts/inventory-executable.py');pe=m.PE(data)
    def raw(a,n):
        off=pe.rva_offset(a-pe.image_base);v=data[off:off+n];assert len(v)==n;return v
    sys.path[:0]=[str(ROOT/'runtime/armory-recovery/python-libs'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as x
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    def keep(path,text):
        if args.write:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text)
        else:assert path.read_text()==text,path
    if args.prepare_rea:
        for role,(a,b) in OWNERS.items():
            folder=WORK/'dependencies'/role;folder.mkdir(parents=True,exist_ok=True)
            (folder/'code.bin').write_bytes(raw(a,b-a));(folder/'seeds.tsv').write_text(f'{a:#x}\tcode\n{a:#x}\tfunction\n')
            plan=dict(target=str((folder/'code.bin').relative_to(ROOT)),output=str((folder/'rea').relative_to(ROOT)),
                open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),init_timeout=60,timeout=240,
                environment={'REA_GHIDRA_SEED_FILE':str((folder/'seeds.tsv').relative_to(ROOT))},
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(a)))])
            (folder/'plan.json').write_text(portable_json(plan,indent=2)+'\n')
        print('Prepared18 current Ghidra input/focus owners under project runtime/')
        return
    owners=[]
    for role,(a,b) in OWNERS.items():
        row=dict(role=role,address=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
        evpath=WORK/'dependencies'/role/'rea/003-procedure_pseudo_code.json'
        if args.write and evpath.exists():
            ev=json.loads(evpath.read_text())['response']['result']['structuredContent']
            row.update(rea_evidence_id=ev['evidence_id'],analysis_profile_digest=ev['analysis_profile']['digest'],raw_input_sha256=ev['subject']['digest']['sha256'])
        else:
            old=json.loads((OUT/'manifest.json').read_text());previous=next(r for r in old['owners']if r['role']==role)
            row.update({k:previous[k]for k in ['rea_evidence_id','analysis_profile_digest','raw_input_sha256']})
            if 'raw_input_range'in previous:row['raw_input_range']=previous['raw_input_range']
        if 'raw_input_range'in row:
            lo,hi=map(lambda v:int(v,16),row['raw_input_range']);assert hashlib.sha256(raw(lo,hi-lo)).hexdigest()==row['raw_input_sha256']
        else:assert row['sha256']==row['raw_input_sha256']
        owners.append(row)
    ranges=[]
    for role,(a,b) in SPANS.items():
        v=raw(a,b-a);ins=list(md.disasm(v,a));assert sum(i.size for i in ins)==len(v),role
        asm=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins);assembly_name={'cursor-step':'cursor','mode-activity':'activity','focus-wait':'wait','focus-inactive':'inactive','start-menu':'start','back-menu':'back'}.get(role,role)+'.asm';keep(OUT/assembly_name,asm)
        ranges.append(dict(role=role,address=hex(a),end_exclusive=hex(b),file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=b-a,sha256=hashlib.sha256(v).hexdigest(),assembly=assembly_name,assembly_sha256=hashlib.sha256(asm.encode()).hexdigest()))
    u=Uc(UC_ARCH_X86,UC_MODE_64);mem=0x200000000;u.mem_map(mem,0x100000);mapped=set()
    def demand(_,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:u.mem_map(page,4096);u.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
    def get(a,f):return struct.unpack('<'+f,u.mem_read(a,struct.calcsize('<'+f)))
    def reg(k):return u.reg_read(getattr(x,'UC_X86_REG_'+k))
    def setreg(k,v):u.reg_write(getattr(x,'UC_X86_REG_'+k),v)
    def xmm(k,*v):setreg(k,int.from_bytes(struct.pack('<4f',*(list(v)+[0.]*(4-len(v)))),'little'))
    def low(k):return struct.unpack('<f',reg(k).to_bytes(16,'little')[:4])[0]
    stop=set();allowed=(0,0);predicate=None;seams={}
    def hook(_,a,n,user):
        if a in stop:u.emu_stop();return
        if a in seams:
            rsp=reg('RSP');ret=get(rsp,'Q')[0]
            assert allowed[0]<=ret-5<allowed[1] and raw(ret-5,1)==b'\xe8'
            assert ret+struct.unpack('<i',raw(ret-4,4))[0]==a
            result=seams[a]()
            if result is not None:setreg('RAX',result)
            setreg('RSP',rsp+8);setreg('RIP',ret);return
        if a==0x1445923e0 and predicate is not None:
            # Only this ButtonInput predicate is supplied by the fixture. The
            # original query traversal/call sites/early return still execute.
            result=predicate(reg('RCX'),reg('EDX'));rsp=reg('RSP');ret=get(rsp,'Q')[0]
            assert ret in [0x1401b6cd3,0x1401b6d6b]
            setreg('RAX',int(result));setreg('RSP',rsp+8);setreg('RIP',ret);return
        assert allowed[0]<=a and a+n<=allowed[1],hex(a)
        if raw(a,1)==b'\xe8':
            callee=a+5+struct.unpack('<i',raw(a+1,4))[0]
            assert callee in seams or (predicate is not None and a in [0x1401b6cce,0x1401b6d66]),'Unexpected native call'
        assert bytes(u.mem_read(a,n))==raw(a,n)
    u.hook_add(UC_HOOK_CODE,hook)
    def run(role,endpoints=None,start=None):
        nonlocal stop,allowed
        allowed=SPANS[role];stop=set(endpoints or [allowed[1]]);setreg('EFLAGS',2);setreg('MXCSR',0x1f80)
        u.emu_start(start or allowed[0],0,count=10000);assert reg('RIP') in stop
    counts={}
    assert raw(0x1401c18c9,4)==bytes.fromhex('c6434e01')
    # Native settings consumers select positive zero for unordered/negative/zero
    # inputs. Compare raw bits so negative zero or a preserved NaN cannot pass.
    n=0
    values=[0xff800000,0xbf800000,0x80000001,0x80000000,0,1,0x3e800000,
            0x3f800000,0x7f7fffff,0x7f800000,0x7fc00000,0x7fa00001,0xffc12345]
    for role,output in [('look-speed','XMM6'),('zoom-speed','XMM7')]:
      for value_bits in values:
        setreg('RDI',(value_bits<<32)|1);run(role)
        value=struct.unpack('<f',struct.pack('<I',value_bits))[0]
        expected=value_bits if value>0. else 0
        assert reg(output)&0xffffffff==expected,(role,hex(value_bits));n+=1
    counts['speed_bits']=n
    n=0;stack=mem+0xf0000
    points=[(0.,0.),(.1,.2),(.3,.4),(.300001,.4),(.6,.8),(-.6,.8),(float('nan'),0.),(float('inf'),0.)]
    for left in points:
     for right in points:
        put(stack+0x58,'4f',*(left+right));setreg('RSP',stack);run('mode-activity')
        def active(pair):return f32(math.sqrt(f32(f32(pair[0]*pair[0])+f32(pair[1]*pair[1]))))>.5
        assert get(stack+0x28,'B')[0]==int(active(left) or active(right));n+=1
    counts['mode_activity']=n
    # Original vector arithmetic and equality/NaN radial admission.
    n=0
    for dead in [0.,.25,.9,float('nan')]:
      for left in [(0.,0.),(.1,.2),(.15,.2),(.25,0.),(.6,.8),(-.6,.8),(1.,-1.)]:
       for right in [(0.,0.),(.15,.2),(-.6,-.8)]:
        for k,v in [('XMM8',left[0]),('XMM7',left[1]),('XMM0',right[0]),('XMM1',right[1]),('XMM6',dead)]:xmm(k,v)
        setreg('RSI',mem);run('radial');got=get(mem,'4f');expected=[]
        for pair in [left,right]:
            length=f32(math.sqrt(f32(f32(pair[0]*pair[0])+f32(pair[1]*pair[1]))))
            expected.extend((0.,0.) if length<dead else pair)
        assert all(math.isclose(a,b,rel_tol=2e-6,abs_tol=2e-6) for a,b in zip(got,expected));n+=1
    counts['radial']=n
    n=0;state=mem+0x1000;inputs=mem+0x2000;dirty=mem+0x3000
    for blocked in [0,1]:
      for held in [0,1]:
        put(state+0x4f,'B',blocked)
        for k,v in [('RBX',state),('R12',held),('RDI',dirty),('RSI',inputs),('R15',42)]:setreg(k,v)
        run('jump');assert get(state+0x4f,'B')[0]==(blocked&held);assert get(inputs+0x15,'B')[0]==((blocked&held)^1)&held;n+=1
    counts['jump_release']=n
    n=0;candidate=mem+0x4000
    for direction in [(1.,0.),(0.,-1.),(.6,.8)]:
      for point in [(0.,0.),(4.,0.),(5.,0.),(10.,3.),(-20.,15.),(100.,-100.)]:
        put(candidate,'Q4f',2,*point,*point);setreg('RCX',candidate);xmm('XMM0',*direction);xmm('XMM1',0.,0.);xmm('XMM2',4.);xmm('XMM8',.5,.5)
        run('score',[0x1401c2df0,0x1401c2e68]);forward=sum(a*b for a,b in zip(point,direction));admit=reg('RIP')==0x1401c2e68
        assert admit==(forward>4.)
        if admit:assert math.isclose(low('XMM3'),forward+2*math.hypot(*(a-forward*b for a,b in zip(point,direction))),rel_tol=2e-6,abs_tol=2e-6)
        n+=1
    counts['focus_score']=n
    n=0;bp=mem+0x8000;time=mem+0xa000
    for active,now,deadline,same in [(0,0.,0.,True),(1,.37,.38,True),(1,.38,.38,True),(1,1.,2.,False),(1,2.,1.,True)]:
        put(state+0x34,'Iii',active,1 if same else -1,0);put(state+0x20,'f',deadline);put(time+0x5c,'f',now)
        put(bp+0x360,'Q',state);put(bp+0x358,'Q',dirty);put(bp+0x370,'I',42)
        for k,v in [('RBP',bp),('R13',time),('RSI',1),('RDX',0)]:setreg(k,v)
        run('repeat',[0x1401c2cdb,0x1401c2f50]);fired=reg('RIP')==0x1401c2cdb;expected=not active or not same or f32(now)>=f32(deadline)
        assert fired==expected;assert math.isclose(get(state+0x20,'f')[0],now+(.38 if not active or not same else .11) if fired else deadline,rel_tol=2e-6,abs_tol=2e-6);n+=1
    counts['focus_repeat']=n
    n=0
    for counter in range(256):
     for remembered in [0,1]:
        put(state+0x10,'Q',0);put(state+0x4c,'B',counter);put(state+0x28,'I2f',remembered,42.,27.)
        put(bp+0x370,'I',42);setreg('R11',state);setreg('R10',dirty);setreg('RBP',bp);xmm('XMM9',200.,100.)
        run('focus-wait',[0x1401c2a1b,0x1401c2aee,0x1401c2a60])
        updated=min(counter+1,255);assert get(state+0x4c,'B')[0]==updated
        select=not remembered or updated>=3;assert (reg('RIP')==0x1401c2a1b)==select
        if select:
            got=struct.unpack('<2f',reg('XMM9').to_bytes(16,'little')[:8]);assert got==((42.,27.) if remembered else (100.,50.))
        n+=1
    counts['focus_wait']=n
    n=0
    for remembered in [0,1]:
        put(state+0x10,'Q',123);put(state+0x4c,'B',255);put(state+0x28,'I',remembered)
        put(bp+0x358,'Q',dirty);setreg('R11',state);setreg('R10',dirty);setreg('RBP',bp)
        run('focus-wait',[0x1401c2a02],start=0x1401c29c8);assert get(state+0x10,'I')[0]==0 and get(state+0x4c,'B')[0]==1;n+=1
    counts['focus_lost']=n
    n=0
    for counter in [0,1,2,255]:
     for remembered in [0,1]:
      for focus_id in [0,42]:
       for repeating in [0,1]:
        put(state+0x10,'I',focus_id);put(state+0x34,'I',repeating);put(state+0x4c,'B',counter);put(state+0x28,'I',remembered)
        setreg('R9',state);setreg('R14',dirty);setreg('RBP',bp);run('focus-inactive')
        assert get(state+0x10,'I')[0]==0 and get(state+0x34,'I')[0]==0
        assert get(state+0x4c,'B')[0]==counter and get(state+0x28,'I')[0]==remembered;n+=1
    counts['focus_inactive']=n
    # Exact West tag at the just-pressed query; the remaining block emits a
    # MouseButtonInput pair (Right=1, Pressed=0, Released=1) plus window Entity.
    assert raw(0x1401c319e,2)==bytes.fromhex('b203')
    n=0;head=mem+0xb000;events=mem+0xc000;window=0x1000000ff
    for existing in [0,1,7]:
      for serial in [0,123]:
        u.mem_write(head,bytes(80));put(head+0x20,'QQQ',64,events,existing);put(head+0x40,'Q',serial)
        put(bp+0xec,'I',42);put(bp+0xd0,'Q',head);put(bp+0xe0,'Q',dirty);put(bp+0x240,'Q',window)
        put(bp+0x358,'Q',dirty);put(bp+0x360,'Q',state);put(bp+0x370,'I',42);put(state+0x4e,'B',0);setreg('RBP',bp)
        run('secondary-events');assert get(head+0x30,'Q')[0]==existing+2 and get(head+0x40,'Q')[0]==serial+2
        for i in range(2):
            at=events+(existing+i)*24;assert get(at,'QQH')[0:3]==(serial+i,window,1);assert get(at+20,'B')[0]==i
        assert get(state+0x4e,'B')[0]==1;n+=1
    counts['secondary_event_pairs']=n
    # Each CursorMoved position contributes f32 distance, even when it returns
    # to the start. This tests the original step independently of queue storage.
    n=0
    for points in [[(0.,0.),(10.,0.),(0.,0.)],[(0.,0.),(3.,4.),(6.,8.)],[(1.,1.)],[]]:
        total=0.;previous=None
        for point in points:
            if previous is not None:
                put(state+0x44,'2f',*previous);put(events+0x10,'2f',*point);setreg('RBX',events);setreg('R8',state);setreg('R9',dirty);setreg('R10',42);xmm('XMM0',total)
                run('cursor-step',start=0x1401c1020);total=low('XMM0');assert get(state+0x44,'2f')==point
            previous=point
        expected=sum(math.dist(a,b) for a,b in zip(points,points[1:]));assert math.isclose(total,expected,rel_tol=2e-6,abs_tol=2e-6);n+=1
    counts['cursor_paths']=n
    # Native .4e clears once and skips *all* handoff. Pad activity restores mode
    # and clears travel only when changing mode, rather than on every held pass.
    n=0;rsp=mem+0xe000
    for latch in [0,1]:
     for pad_mode in [0,1]:
      for activity in [0,1]:
       for keyboard in [0,1]:
        for mouse in [0,1]:
         for travel in [0.,12.,12.01]:
          put(state+0x4e,'B',latch);put(state+0x4d,'B',pad_mode);put(state+0x24,'f',travel);put(state+0x10,'I',99);put(rsp+0x28,'B',activity)
          setreg('RSP',rsp);setreg('R8',state);setreg('R9',dirty);setreg('R10',42);setreg('RCX',keyboard);setreg('RDX',mouse);xmm('XMM0',0.)
          run('handoff');expected=pad_mode if latch else 1 if activity else pad_mode and not(keyboard or mouse or f32(travel)>12.)
          assert get(state+0x4e,'B')[0]==0 and get(state+0x4d,'B')[0]==expected
          assert get(state+0x24,'f')[0]==(0. if not latch and activity and not pad_mode else f32(travel));n+=1
    counts['handoff']=n
    n=0;messages=mem+0x50000;buf_a=mem+0x51000;buf_b=mem+0x52000;reader=mem+0x53000
    for role,stride,state_offset,reader_reg,result_reg,stack_offset in [
        ('keyboard-queue',88,84,'R12','CL',0x48),('mouse-queue',24,20,'R14','DL',0x50)]:
     for length in range(5):
      for states in itertools.product([0,1],repeat=length):
       for split in range(length+1):
        base=7
        for cursor in sorted(set([base-2,base,base+1,base+length,base+length+2])):
            for buffer,items in [(buf_a,states[:split]),(buf_b,states[split:])]:
                u.mem_write(buffer,bytes(stride*4))
                for i,value in enumerate(items):put(buffer+i*stride+state_offset,'B',value)
            put(messages,'9Q',split,buf_a,split,base,length-split,buf_b,length-split,base+split,base+length)
            put(reader,'Q',cursor);stack=mem+0xf0000;put(stack+stack_offset,'Q',messages)
            setreg('RSP',stack);setreg(reader_reg,reader);run(role)
            start=min(max(cursor-base,0),length);hit=next((i for i in range(start,length) if states[i]==0),None)
            assert reg(result_reg)==int(hit is not None)
            assert get(reader,'Q')[0]==base+(hit+1 if hit is not None else length);n+=1
    counts['handoff_message_queues']=n
    # Both native query-storage branches walk every matching entity. Exercise
    # empty tables, multiple tables/archetypes, reverse row mappings, and hits
    # after the fourth controller. This fixture supplies the per-pad predicate;
    # it does not claim native query construction or ECS equivalence.
    n=0;query=mem+0x10000;qs=mem+0x11000;world=mem+0x12000;ids=mem+0x13000
    tables=mem+0x14000;archetypes=mem+0x16000;columns=mem+0x18000
    maps=mem+0x1a000;entities=mem+0x1c000;pads=mem+0x20000
    for table_dense in [0,1]:
     for sizes in [[],[0],[1],[4],[8],[3,0,5],[0,5,3,0]]:
      total=sum(sizes)
      for hit in range(-1,total):
       for tag in [0,3,12]:
        u.mem_write(query,bytes(0x20000));put(query,'QQ',qs,world)
        put(qs+0xf8,'QQB',ids,len(sizes),table_dense);put(qs+0x110,'Q',0)
        put(world+0x1a8,'Q',tables);put(world+0x108,'Q',archetypes)
        order=[];offset=0
        for i,size in enumerate(sizes):
            put(ids+i*4,'I',i);t=tables+i*72;a=archetypes+i*160
            put(t+0x10,'QQ',size,columns+i*48);put(t+0x38,'QQ',maps+i*8,1)
            put(maps+i*8,'Q',0xffffffffffffffff);put(columns+i*48+0x10,'Q',pads+offset*136)
            put(a+0x50,'QQ',entities+i*0x100,size);put(a+0x94,'I',i)
            local=list(range(size)) if table_dense else list(reversed(range(size)))
            for j,index in enumerate(local):
                put(entities+i*0x100+j*16+8,'I',index^0xffffffff)
                order.append(pads+(offset+index)*136)
            offset+=size
        visits=[]
        def test_pad(address,button):
            assert button==tag;assert address==order[len(visits)]
            visits.append(address);return len(visits)-1==hit
        predicate=test_pad;stack=mem+0xf0000;sentinel=mem+0xff000
        put(stack,'Q',sentinel);setreg('RSP',stack);setreg('RCX',query);setreg('EDX',tag)
        run('button-edge',[sentinel]);predicate=None
        assert reg('AL')==int(hit>=0) and visits==order[:hit+1 if hit>=0 else total];n+=1
    counts['generic_query']=n
    n=0;transform=mem+0x35000;scale_ptr=mem+0x36000;rect_out=mem+0x37000
    for size in [(1.,1.),(2.,2.),(100.,40.)]:
     for matrix in [(1.,0.,0.,1.,0.,0.),(.70710677,.70710677,-.70710677,.70710677,5.,7.),
                    (0.,1.,-1.,0.,-5.,7.),(1.,.4,.2,1.,100.,-50.),(-1.,0.,0.,1.,0.,0.)]:
      for scale in [0.,.005,.01,1.,2.,float('nan')]:
        stack=mem+0xf0000;put(stack+0x30,'Q',transform);put(transform,'6f',*matrix);put(scale_ptr,'f',scale)
        setreg('RSP',stack);setreg('R14',scale_ptr);setreg('RSI',rect_out);setreg('RBX',123);setreg('RDI',7);xmm('XMM0',*size)
        run('focus-bounds',[0x1401c02f2]);m=[f32(v) for v in matrix];s=f32(scale)
        s=s if s>f32(.01) else f32(.01);inverse=f32(1/s);corners=[]
        for sign in [-1,1]:
            a=f32(f32(size[0]*.5)*sign);b=f32(f32(size[1]*.5)*sign)
            corners.append(tuple(f32(f32(f32(f32(a*m[j])+f32(b*m[j+2]))+m[j+4])*inverse) for j in [0,1]))
        expected=tuple(min(a,b) for a,b in zip(*corners))+tuple(max(a,b) for a,b in zip(*corners))
        assert get(rect_out,'QQ')==(123,7)
        assert all(math.isclose(a,b,rel_tol=2e-6,abs_tol=2e-5) for a,b in zip(get(rect_out+16,'4f'),expected));n+=1
    counts['focus_bounds']=n
    # Full native retain/filter loop. Hashing, RNG, temporary set allocation,
    # parent-query reads and deallocation are supplied; draw-order comparisons,
    # inclusive center coverage, exclusion/ancestry decisions and vector
    # retention/publication execute original instructions.
    n=0;ctx=mem+0x40000;vec=mem+0x41000;result=mem+0x42000;stackmap=mem+0x43000
    excluded=mem+0x44000;parent_query=mem+0x45000;occluders=mem+0x46000;rng=mem+0x47000
    def table(desc,entries,width,ctrl):
        u.mem_write(ctrl,bytes([255])*16)
        for i,row in enumerate(entries):
            u.mem_write(ctrl+i,b'\0');put(ctrl-(i+1)*width,'Q'*len(row),*row)
        put(desc,'QQQQ',ctrl,15,15-len(entries),len(entries))
    for order in [(1,2,3),(3,2,1),(1,3)]:
     for cover in [(-20.,-20.,20.,20.),(15.,15.,30.,30.),(0.,0.,0.,0.),(float('nan'),0.,20.,20.)]:
      for parents in [{},{3:1},{1:3},{1:2,3:2}]:
       for absent in [False,True]:
        candidates=[(1,(-2.,-2.,2.,2.)),(2,(18.,18.,22.,22.))]
        source_parents=set()
        for entity,_ in candidates:
            while entity in parents:entity=parents[entity];source_parents.add(entity)
        for i,(entity,rect) in enumerate(candidates):put(vec+i*24,'Q4f',entity,*rect)
        positions={entity:i for i,entity in enumerate(order)}
        if absent:positions.pop(1,None)
        table(stackmap,list(positions.items()),16,mem+0x48100)
        table(excluded,[(p,) for p in sorted(source_parents)],8,mem+0x49100)
        put(occluders,'QQQ',1,mem+0x4a000,1);put(mem+0x4a000,'QQ4f',3,positions.get(3,0),*cover)
        put(ctx,'8Q',vec,vec,2,vec+48,excluded,stackmap,parent_query,occluders)
        put(parent_query,'Q',0);put(rng,'QQB',10,0,1);set_counter=[0]
        def parent_step():
            ptr=reg('RCX');entity=get(ptr+8,'Q')[0];parent=parents.get(entity,0);put(ptr+8,'Q',parent);return parent
        def insert():
            desc=reg('RCX');entity=reg('RDX');current=get(desc,'QQQQ')
            rows=[] if current[3]==0 else [get(current[0]-(i+1)*8,'Q') for i in range(current[3])]
            if (entity,) not in rows:rows.append((entity,))
            ctrl=mem+0x4c100+set_counter[0]*0x200;set_counter[0]+=1;table(desc,rows,8,ctrl);return None
        seams={0x1401a43e0:lambda:0,0x145bb3a70:lambda:rng,0x14018c230:parent_step,
               0x14009bd90:insert,0x1400021d0:lambda:None}
        stack=mem+0xf0008;sentinel=mem+0xff000;put(stack,'Q',sentinel)
        setreg('RSP',stack);setreg('RCX',result);setreg('RDX',ctx);run('focus-occlusion',[sentinel]);seams={}
        expected=[]
        for entity,rect in candidates:
            if entity in source_parents or entity not in positions:continue
            center=((rect[0]+rect[2])*.5,(rect[1]+rect[3])*.5)
            covered=cover[0]<=center[0]<=cover[2] and cover[1]<=center[1]<=cover[3]
            related=False;child=entity
            while child in parents:
                child=parents[child];related|=child==3
            child=3
            while child in parents:
                child=parents[child];related|=child==entity
            blocked=positions.get(3,0)>positions[entity] and covered and not related
            if not blocked:expected.append(entity)
        assert get(result+16,'Q')[0]==len(expected),(order,cover,parents,absent,get(result,'3Q'),expected,[get(vec+i*24,'Q')[0] for i in range(2)])
        assert [get(vec+i*24,'Q')[0] for i in range(len(expected))]==expected;n+=1
    counts['focus_occlusion']=n
    # Current color branch 0 is a direct RGBA copy; branch 1 uses the linear
    # to sRGB transfer (threshold .0031308, exponent 1/2.4). The ring copies
    # border kind0 and constructs its shadow with kind1 after the copy branch.
    color=mem+0x60000;color_out=mem+0x61000;bundle=mem+0x62000;shadow=mem+0x63000
    assert struct.unpack('<i',raw(0x146b020d8,4))[0]+0x146b020d8==0x144c91246
    put(color,'I4f',0,.973,.824,.416,.6);setreg('RAX',color+4);setreg('RSI',color_out)
    run('ring-color-copy',[0x144c9192b]);assert bytes(u.mem_read(color_out,16))==bytes(u.mem_read(color+4,16))
    counts['ring_color_copy']=1
    stack=mem+0xf0008;sentinel=mem+0xff000
    put(color,'I4f',1,.973,.824,.416,.6);put(stack,'Q',sentinel)
    for offset,value in [(0x28,1),(0x38,1),(0x48,1)]:put(stack+offset,'I',value)
    for offset,value in [(0x30,0.),(0x40,1.),(0x50,8.)]:put(stack+offset,'f',value)
    setreg('RSP',stack);setreg('RCX',bundle);setreg('RDX',color);setreg('R8D',1);xmm('XMM3',0.)
    seams={0x140002200:lambda:None,0x1400021c0:lambda:shadow};run('ring-shadow',[sentinel]);seams={}
    assert get(bundle,'3Q')==(1,shadow,1)
    expected_shadow=struct.pack('<IfIfIfIfI4f',1,0.,1,0.,1,1.,1,8.,1,.973,.824,.416,.6)
    assert bytes(u.mem_read(shadow,52))==expected_shadow;counts['ring_shadow_constructor']=1
    submissions=[]
    def convert_ring_color():
        assert get(reg('RDX'),'I')[0]==0
        u.mem_write(reg('RCX'),bytes(u.mem_read(reg('RDX')+4,16)))
    def make_ring_shadow():
        rsp=reg('RSP');assert reg('R8D')==1 and low('XMM3')==0.
        for offset,value in [(0x28,1),(0x38,1),(0x48,1)]:assert get(rsp+offset,'I')[0]==value
        for offset,value in [(0x30,0.),(0x40,1.),(0x50,8.)]:assert get(rsp+offset,'f')[0]==value
        assert bytes(u.mem_read(reg('RDX'),20))==struct.pack('<I4f',1,.973,.824,.416,.6)
        put(reg('RCX'),'3Q',1,shadow,1)
    def native_copy():u.mem_write(reg('RCX'),bytes(u.mem_read(reg('RDX'),reg('R8'))))
    def submit_ring():submissions.append(bytes(u.mem_read(reg('R8'),496)))
    seams={0x144c892e0:convert_ring_color,0x1426554b0:make_ring_shadow,0x145c0a3db:native_copy,0x1402452e0:submit_ring}
    put(stack,'Q',sentinel);setreg('RSP',stack);setreg('RDX',mem+0x64000);run('ring',[sentinel]);seams={}
    assert len(submissions)==1;ring_bytes=submissions[0]
    assert ring_bytes[384:408]==struct.pack('<3Q',1,shadow,1)
    assert ring_bytes[408:488]==struct.pack('<I4f',0,1.,.914,.659,1.)*4
    assert ring_bytes[488:494]==struct.pack('<iBB',100000,0,0);counts['ring_constructor']=1
    n=0
    for rect in [(0.,0.,10.,20.),(-10.,-20.,0.,0.),(1.5,3.5,4.25,8.25),(0.,0.,0.,0.)]:
        xmm('XMM2',rect[0]);xmm('XMM4',rect[1]);xmm('XMM0',rect[2]);xmm('XMM1',rect[3]);run('ring-padding')
        assert tuple(low(k) for k in ['XMM2','XMM3','XMM0','XMM1'])==(rect[0]-3,rect[1]-3,rect[2]-rect[0]+6,rect[3]-rect[1]+6);n+=1
    counts['ring_padding']=n
    n=0
    for display in range(4):
        put(state+0x175,'B',display);put(dirty,'I',0);setreg('R9',state);setreg('RCX',dirty);setreg('EAX',42);run('ring-hide')
        assert get(state+0x175,'B')[0]==3 and get(dirty,'I')[0]==(0 if display==3 else 42);n+=1
    counts['ring_hide']=n
    n=0
    for value in [-float('inf'),-1.,-0.,0.,1.,float('inf'),float('nan')]:
     for maximum in [0.,1.,40.]:
        put(stack,'Q',sentinel);setreg('RSP',stack);xmm('XMM0',value);xmm('XMM1',maximum);run('scroll-clamp',[sentinel])
        expected=0. if value<0 else maximum if value>maximum else value
        assert math.isnan(low('XMM0')) if math.isnan(expected) else bits(low('XMM0'))==bits(expected);n+=1
    counts['scroll_clamp']=n
    n=0;node=mem+0x65000;affine=mem+0x66000;position=mem+0x67000;tick=mem+0x68000;options=mem+0x69000
    def clamp_scroll():
        value=low('XMM0');maximum=low('XMM1');assert maximum>=0
        xmm('XMM0',0. if value<0 else maximum if value>maximum else value)
    for y_scale,window_scale,inverse,content,old,mode,open_options in itertools.product(
        [.005,1.,2.],[1.,2.],[.5,1.],[100.,300.],[0.,40.],range(5),[0,1]):
        ys=f32(y_scale);ws=f32(window_scale);inv=f32(inverse)
        view_top=f32(f32(f32(-50*ys)+50)*f32(1/ws));view_bottom=f32(f32(f32(50*ys)+50)*f32(1/ws));height=f32(view_bottom-view_top)
        top,bottom=[(view_top-10,view_top+10),(view_top+.2*height,view_top+.4*height),
                    (view_bottom-10,view_bottom+10),(view_top-10,view_bottom+10),(view_top,view_bottom)][mode]
        top=f32(top);bottom=f32(bottom)
        put(node+0x30,'4f',100.,100.,100.,content);put(node+0x64,'f',inv);put(affine,'6f',1.,0.,0.,ys,0.,50.)
        put(position,'2f',0.,old);put(tick,'I',0);put(options+0x1c0,'B',open_options);put(options+0x1bc,'f',-123.)
        put(bp+0x34c,'f',ws);put(bp+0x90,'Q',options);put(bp+0xa0,'Q',dirty);put(bp+0xac,'I',42)
        put(stack,'Q',sentinel);setreg('RSP',stack);setreg('RBP',bp);setreg('RAX',node);setreg('RCX',affine)
        setreg('RBX',position);setreg('RDI',0);setreg('R14',tick);setreg('ESI',42)
        xmm('XMM6',.01);xmm('XMM7',1.);xmm('XMM10',0.,top);xmm('XMM9',0.,bottom)
        seams={0x1401b5bb0:clamp_scroll};run('focus-scroll');seams={}
        delta=f32(f32(top-view_top)-8) if top<view_top else f32(f32(bottom-view_bottom)+8) if bottom>view_bottom else None
        ratio=f32(max(abs(ys),f32(.01))/max(f32(ws*inv),f32(.01)));maximum=max(f32(f32(content-100)*inv),0.)
        expected=old if delta is None else min(max(f32(old+f32(delta/ratio)),0.),maximum)
        assert math.isclose(get(position+4,'f')[0],expected,rel_tol=2e-6,abs_tol=2e-5),(y_scale,window_scale,inverse,content,old,mode,expected,get(position+4,'f'))
        assert get(tick,'I')[0]==(0 if delta is None else 42)
        assert get(options+0x1bc,'f')[0]==(expected if delta is not None and open_options else -123.);n+=1
    counts['focus_scroll']=n
    # Ordinary Bevy settings remain intact. The direct native initializer
    # produces three empty override maps plus ten exact default floats.
    settings=mem+0x6a000
    put(stack,'Q',sentinel);setreg('RSP',stack);setreg('RCX',settings);run('pad-settings-leaf',[sentinel])
    defaults=bytes(u.mem_read(settings,136))
    assert defaults[96:136]==struct.pack('<10f',.75,.65,1.,.05,-.05,-1.,.01,.95,.05,.01)
    counts['engine_settings_factories']=1
    n=0;sample=mem+0x6c000
    for value in [-2.,-1.,-.2,-0.,0.,.2,1.,2.,float('nan')]:
        put(sample,'f',value);put(stack,'3Q',0,0,sentinel);setreg('RSP',stack);setreg('RAX',sample+4);setreg('R8',0)
        run('pad-axis-clamp',[sentinel]);expected=-1. if value<-1 else 1. if value>1 else value
        assert math.isnan(low('XMM0')) if math.isnan(expected) else bits(low('XMM0'))==bits(expected);n+=1
    counts['engine_axis_clamp']=n
    n=0;gamepad=mem+0x6d000
    for left,right in itertools.product([None,0.,.02,.2,.6,-.6],repeat=2):
        def get_axis():
            assert reg('RCX')==gamepad+0x60 and reg('EDX') in [0,0x100]
            value=left if reg('EDX')==0 else right;xmm('XMM0',value or 0.);return int(value is not None)
        put(stack,'Q',sentinel);setreg('RSP',stack);setreg('RCX',gamepad)
        seams={0x14003a2d0:get_axis};run('pad-raw-stick',[sentinel]);seams={}
        assert (bits(low('XMM0')),bits(low('XMM1')))==(bits(left or 0.),bits(right or 0.));n+=1
    counts['engine_stick_getter']=n
    n=0;head=mem+0x70000;events=mem+0x71000
    for existing,serial in itertools.product([0,1,7],[0,123]):
        put(head+0x20,'3Q',64,events,existing);put(head+0x40,'Q',serial);put(state+0x4e,'B',0)
        rsp=mem+0xe0000;u.mem_write(rsp,bytes(0x300));put(rsp+0x214,'I',42)
        put(rsp+0x208,'Q',dirty);put(rsp+0x1f8,'Q',head);setreg('RSP',rsp);setreg('RAX',0x1000000ff)
        setreg('RBX',state);setreg('R14',dirty);setreg('EBP',42)
        def append_key():
            assert reg('RCX')==head+0x20;index=get(head+0x30,'Q')[0]
            u.mem_write(events+index*88,bytes(u.mem_read(reg('RDX'),88)));put(head+0x30,'Q',index+1)
        seams={0x140011360:append_key};run('character-key');seams={};run('keyboard-latch')
        assert get(head+0x30,'Q')[0]==existing+2 and get(head+0x40,'Q')[0]==serial+2 and get(state+0x4e,'B')[0]==1
        for i in range(2):
            event=events+(existing+i)*88
            assert get(event,'Q')[0]==serial+i and get(event+64,'Q')[0]==0x1000000ff
            assert get(event+72,'I')[0]==22 and get(event+84,'2B')==(i,0)
            assert get(event+8,'I')[0]==0 and bytes(u.mem_read(event+16,2))==b'\x01c'
            assert get(event+40,'B')[0]==(1 if i==0 else 255)
            if i==0:assert get(event+41,'B')[0]==ord('c')
        n+=1
    counts['character_key_pairs']=n
    n=0;menu_flag=mem+0x72000
    assert raw(0x1401c1485,2)==bytes.fromhex('b20b') and raw(0x1401c3175,2)==bytes.fromhex('b201')
    for role,pressed,latch in itertools.product(['start-menu','back-menu'],[0,1],[0,1]):
        put(menu_flag,'B',0);put(dirty,'I',0);put(state+0x4e,'B',latch);setreg('AL',pressed)
        if role=='start-menu':
            rsp=mem+0xe0000;put(rsp+0x1f4,'I',42);put(rsp+0x1e8,'Q',dirty);put(rsp+0x1d8,'Q',menu_flag);setreg('RSP',rsp)
        else:
            put(bp+0xcc,'I',42);put(bp+0xc0,'Q',dirty);put(bp+0xb0,'Q',menu_flag);setreg('RBP',bp)
        run(role);assert get(menu_flag,'B')[0]==pressed and get(dirty,'I')[0]==(42 if pressed else 0)
        assert get(state+0x4e,'B')[0]==latch;n+=1
    counts['logical_menu_requests']=n
    version_bytes=b'bevy_input-0.18.1';version_offset=data.find(version_bytes);assert version_offset>=0
    source=(ROOT/'crates/azeroth-survivors-re/src/native_input/mod.rs').read_text();focus=(ROOT/'crates/azeroth-survivors-re/src/native_input/focus.rs').read_text()
    assert 'unfilter_sticks' not in source and 'AxisSettings::new' not in source
    assert 'KeyCode::KeyC, Key::Character("c".into())' in source and 'TOGGLECHARACTER0' not in source
    assert '(ButtonState::Pressed, Key::Character(text)) => Some(text.clone())' in source
    assert 'output.menu_requested = focused && state.pad_mode && pad.pause;' in source
    assert 'if pad.back && state.focus.is_some()' in focus and 'menu_requested = true;' in focus
    assert 'if pad.pause || pad.back' not in source
    bridge=(ROOT/'crates/benilla-app/src/local_client.rs').read_text()
    assert 'input.custom_game_menu_requested = device.as_ref().is_some_and(|device| device.menu_requested);' in bridge
    menu_source=(ROOT/'crates/azeroth-survivors-re/src/menu.rs').read_text();assert 'device.menu_requested' in menu_source
    assert 'name = "bevy_input"\nversion = "0.18.1"' in (ROOT/'Cargo.lock').read_text()
    assert 'pads.truncate' not in source and 'query.iter(world).collect()' in source
    assert 'if !synthetic_input && pad.activity && focused {' in source
    for token in ['state.keyboard_events','state.mouse_events','.any(|event| event.state == ButtonState::Pressed)','if handoff_keyboard || handoff_mouse || state.mouse_travel > 12.']:
        assert ''.join(token.split()) in ''.join(source.split()),token
    assert 'out.left.length() > policy::MODE_THRESHOLD' in source and 'out.right.length() > policy::MODE_THRESHOLD' in source
    assert 'out.zoom != 0.' not in source
    key_producer=source.split('fn pulse_key(',1)[1].split('fn pulse_secondary(',1)[0]
    assert 'state.synthetic_input = true;' in key_producer and 'state.keys' not in source
    for token in ['pad.just_pressed(West)','out.secondary_pressed','MessageCursor<CursorMoved>','state.cursor_events.read','previous.distance(event.position)','state.previous_cursor = Some(event.position)','std::mem::take(&mut state.synthetic_input)','state.pad_mode && !synthetic_input','Messages<MouseButtonInput>','button: MouseButton::Right']:
        assert ''.join(token.split()) in ''.join(source.split()),token
    assert 'pad.secondary_pressed && state.focus.is_some()' in focus and 'pulse_secondary(world, state, window)' in focus and 'OverlayAction::Reroll' not in focus
    for token in ['state.focus_missing = 0','state.focus_missing.saturating_add(1)','state.focus_missing >= 3 || state.previous_center.is_none()','state.focus.is_some() && state.repeat.tick','state.repeat = policy::Repeat::default()']:
        assert token in focus,token
    assert source.count('focus::deactivate(world, &mut state)')==2
    for token in ['resource::<UiStack>()','With<Interaction>','ancestors.contains(&target.entity)','rect.contains(target.rect.center())','other > index','is_ancestor(world, target.entity, *entity)']:
        assert token in focus,token
    assert 'is_ancestor(world, *entity, target.entity)' in focus and focus.count('transform_point2(')==2
    for token in ['BoxShadow::new(', 'Pickable::IGNORE','GlobalZIndex(100_000)','Color::srgba(1., 0.914, 0.659, 1.)','Color::linear_rgba(0.973, 0.824, 0.416, 0.6)']:
        assert token in focus,token
    assert 'BackgroundColor(' not in focus
    for token in ['reveal(world, target)','OverflowAxis::Scroll','matrix2.y_axis.length().max(0.01)','node.inverse_scale_factor','device_scroll_position(world, next)']:
        assert token in focus,token
    for token in ['node.display = Display::None','target.rect.min.x - 3.','target.rect.width() + 6.']:
        assert token in focus,token
    assert 'CalculatedClip' not in focus and 'out.retain(|t| t.layer == top)' not in focus
    # These live consumers retain their transaction/admission ownership.
    assert 'mouse.just_pressed(MouseButton::Right)' in (ROOT/'crates/azeroth-survivors-re/src/talents.rs').read_text()
    armory=(ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text();assert 'MessageReader<MouseButtonInput>' in armory and 'secondary_press(message)' in armory
    policy=(ROOT/'crates/azeroth-survivors-re/src/native_input/policy.rs').read_text()
    assert 'target.min.y - viewport.min.y - 8.' in policy and 'target.max.y - viewport.max.y + 8.' in policy
    assert 'Some((offset + delta / ratio).clamp(0., maximum))' in policy
    options_source=(ROOT/'crates/azeroth-survivors-re/src/options.rs').read_text()
    assert 'input.menu_requested' in options_source and 'if back {' in options_source
    assert 'fn device_scroll_position(' in options_source and 'state.scroll = position;' in options_source
    assert 'pub const MODE_THRESHOLD: f32 = 0.5;' in policy
    assert 'if value > 0. {\n        value\n    } else {\n        0.\n    }' in policy
    for key in ['padLookSpeed','padZoomSpeed']:assert f'policy::speed(read(world, "{key}", 1.))' in source
    result=dict(target={k:target[k] for k in ['version','path','sha256','size_bytes']},owners=owners,ranges=ranges,counts=counts,
                engine_settings_fixture={'native_defaults_hex':defaults.hex(),'native_version':{'file_offset':hex(version_offset),'byte_count':len(version_bytes),'sha256':hashlib.sha256(version_bytes).hexdigest(),'utf8':version_bytes.decode()},'limits':['The selected raw getter uses a supplied axis lookup; its native clamp is replayed separately. Engine event processing, real device values/settings, callback reachability and platform scheduling are not executed.','The selected leaf initializer is supplemental local Ghidra recovery; the canonical whole-image ownership partition is unchanged.']},
                ring_fixture={'native_bundle_hex':ring_bytes.hex(),'native_shadow_hex':expected_shadow.hex(),'seams':['Native ring spawn/copy/color/shadow publication use supplied helpers; the exact color copy branch and complete shadow constructor execute separately. No real ECS allocation/spawn or GPU executes.']},
                limits=['Bounded original instructions only; layout, actual input systems and Rust source do not execute. Query traversal uses synthetic ECS descriptors and a supplied ButtonInput predicate. Focus filtering supplies hashing, RNG, temporary set allocation/insertion/free and parent-query reads; real ECS/scene construction and complete UI equivalence are not certified.','Mouse event type/fields are traced against the existing Bevy input/window baseline; generic source or whole input-system equivalence is not certified.','Current input backend/filtering and broader #41 contracts retain their own scope.'],compilation_run=False,target_executed=False,parity_verified=False)
    keep(OUT/'manifest.json',json.dumps(result,indent=2)+'\n');print(json.dumps(counts));print('Native pad arithmetic, secondary events, cursor queue and handoff/source routes pass; no compilation or game/device execution')

if __name__=='__main__':main()

#!/usr/bin/env python3
"""Check current boss arithmetic and guardian schedules with original instructions.

No compilation or game process. --stage writes reviewed candidate evidence to
ignored runtime; default verifies its canonical copy. Windows power results are
injected explicitly. Call-free guardian fragments reject every external call.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import struct
import sys
from coverage_common import ROOT

KEPT = ROOT/'docs/analysis/evidence/0.112.0/raid-inputs'
STAGE = ROOT/'runtime/analysis/staging/native-evidence/0.112.0/raid-inputs'
RANGES = {
    'boss-health-endless': (0x14593b2d9, 0x14593b386),
    'boss-damage-actor-stats': (0x14593b6e1, 0x14593b848),
    'guardian-selector': (0x145898f10, 0x145899272),
    'guardian-decision-reset': (0x1459b7f00, 0x1459b82a6),
    'guardian-selection-constructor': (0x145906d20, 0x145907018),
    'guardian-phase-gates': (0x145947420, 0x1459475e0),
    'guardian-scheduler': (0x145947b30, 0x145947d91),
    'boss-enrage': (0x145947d91, 0x145947dca),
    'boss-phase-ratio': (0x145947dca, 0x145947e20),
    'boss-phase-actions': (0x145947e20,0x145948135),
    'boss-phase-yell': (0x145897ec0,0x145897f87),
    'replacement-timers': (0x1459da880,0x1459da9e7),
    'boss-recurring': (0x145948135, 0x145948381),
}


def load():
    mod = load_script('current_raid', ROOT/'scripts/check-raid-target.py')
    return mod


def f32(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def fixture(raw):
    sys.path[:0] = [str(ROOT/'runtime/tool-state/python/camera/python-libs'),
                   str(ROOT/'runtime/tool-state/python/armory/python-libs')]
    import unicorn as u
    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    mem = 0x70000000
    machine.mem_map(mem, 0x100000)
    mapped = set()
    def demand(uc, access, address, size, value, user):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True
    machine.hook_add(u.UC_HOOK_MEM_UNMAPPED, demand)
    return machine, mem


def boss_arithmetic(raw):
    from unicorn import UC_HOOK_CODE
    from unicorn import x86_const as x
    machine, mem = fixture(raw)
    frame, calls, injected, stop = mem+0x8000, [], [], 0
    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack('<'+fmt, *values))
    def hook(uc, address, size, user):
        if address == stop:
            uc.emu_stop()
        elif address == 0x145c0a465:
            value = injected[len(calls)]
            calls.append([uc.reg_read(x.UC_X86_REG_XMM0)&0xffffffff,
                          uc.reg_read(x.UC_X86_REG_XMM1)&0xffffffff, bits(value)])
            uc.reg_write(x.UC_X86_REG_XMM0, bits(value))
            sp = uc.reg_read(x.UC_X86_REG_RSP)
            ret, = struct.unpack('<Q', uc.mem_read(sp, 8))
            uc.reg_write(x.UC_X86_REG_RSP, sp+8)
            uc.reg_write(x.UC_X86_REG_RIP, ret)
    machine.hook_add(UC_HOOK_CODE, hook)
    profiles = [[0.,1.,100,100,100,0,False,0.,7.,9.],
                [600.,1.5,175,80,140,0,False,0.,1.,1.],
                [600.,1.,0,0,0,0,False,0.,1.,1.],
                [1200.,.75,65535,65535,65535,0,False,0.,1.,1.],
                [817.5,2.25,140,120,75,1,True,720.,1.375,2.],
                [600.,1.,100,100,100,1,True,720.,1.,1.],
                [817.5,1.,100,100,100,0,True,720.,3.,4.],
                [720.,1.,100,100,100,1,True,720.,1.,1.]]
    results = []
    for zi in range(12):
        zone = 0x146bf2630+zi*240
        pointer, count = struct.unpack('<QQ', raw(zone+0x88, 16))
        scale, = struct.unpack('<f', raw(zone+224, 4))
        for bi in range(count):
            boss = pointer+bi*104
            words = struct.unpack('<26I', raw(boss,104))
            def value(index):
                return struct.unpack('<f', struct.pack('<I', words[index]))[0]
            for pi, p in enumerate(profiles):
                clock,difficulty,hp,damage,speed,phase,endless,start,pdamage,php = p
                machine.mem_write(mem, bytes(0x10000))
                put(mem+0x988,'If',phase,start)
                put(mem+0xad0,'B',int(endless))
                put(mem+0xa4c,'f',clock)
                put(mem+0xac0,'f',difficulty)
                put(mem+0x2ca,'HHH',hp,damage,speed)
                for reg, v in [(x.UC_X86_REG_RSI,mem),(x.UC_X86_REG_R13,boss),
                               (x.UC_X86_REG_R14,zone),(x.UC_X86_REG_RBP,frame),
                               (x.UC_X86_REG_RSP,frame-0x200)]:
                    machine.reg_write(reg,v)
                machine.reg_write(x.UC_X86_REG_MXCSR,0x1f80)
                machine.reg_write(x.UC_X86_REG_EFLAGS,2)
                calls.clear()
                injected = [pdamage,php]
                stop = RANGES['boss-health-endless'][1]
                machine.emu_start(RANGES['boss-health-endless'][0],0,count=1000)
                assert machine.reg_read(x.UC_X86_REG_RIP)==stop
                machine.reg_write(x.UC_X86_REG_XMM8,words[18])
                stop = RANGES['boss-damage-actor-stats'][1]
                machine.emu_start(RANGES['boss-damage-actor-stats'][0],0,count=1000)
                assert machine.reg_read(x.UC_X86_REG_RIP)==stop
                result = [struct.unpack('<I',machine.mem_read(frame+o,4))[0]
                          for o in [0x118,0x11c,0x120,0x124,0x128,0x12c,0x130,0x154,0x16c,0x170]]
                exponent = max(f32(f32(clock-start)/60.),0.) if phase==1 and endless else 0.
                expected_calls = [[bits(1.096),bits(exponent),bits(pdamage)],
                                  [bits(1.22),bits(exponent),bits(php)]] if phase==1 and endless else []
                assert calls==expected_calls,(zi,bi,pi,calls)
                health = f32(f32(f32(f32(value(21)*5.75)*scale)*difficulty)*
                             (php if phase==1 and endless else 1.))
                health = f32(f32(hp/100.)*health)
                dmg = f32(f32(math.sqrt(f32(scale*difficulty)))*value(22))
                dmg = f32(f32(dmg*(pdamage if phase==1 and endless else 1.))*f32(damage/100.))
                movement = f32(f32(speed/100.)*value(23))
                reach = min(f32(f32(value(18)*1.5)+3.5),9.)
                expected = list(map(bits,[health,health,dmg,movement,2.,reach,value(18),
                                          f32(clock+1.),f32(clock+1.5),clock]))
                assert result==expected,(zi,bi,pi,result,expected)
                results.append([zi,bi,pi,calls.copy(),result])
    return dict(profiles=profiles,cases=len(results),
                snapshots_sha256=hashlib.sha256(json.dumps(results,separators=(',',':')).encode()).hexdigest())


def guardian_schedules(raw, graph):
    from unicorn import UC_HOOK_CODE
    from unicorn import x86_const as x
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    machine, mem = fixture(raw)
    md = Cs(CS_ARCH_X86,CS_MODE_64)
    allowed, endpoints = (0,0), set()
    def put(address, fmt, *values):
        machine.mem_write(address,struct.pack('<'+fmt,*values))
    def get(address, fmt):
        return struct.unpack('<'+fmt,machine.mem_read(address,struct.calcsize('<'+fmt)))
    def sx(reg,value):
        machine.reg_write(reg,bits(value))
    def hook(uc,address,size,user):
        if address in endpoints:
            uc.emu_stop()
            return
        assert allowed[0]<=address<allowed[1],hex(address)
        ins = next(md.disasm(bytes(uc.mem_read(address,size)),address))
        assert ins.mnemonic!='call',hex(address)
    machine.hook_add(UC_HOOK_CODE,hook)
    def run(start,end,stops):
        nonlocal allowed,endpoints
        allowed,endpoints = (start,end),set(stops)
        machine.reg_write(x.UC_X86_REG_EFLAGS,2)
        machine.reg_write(x.UC_X86_REG_MXCSR,0x1f80)
        machine.emu_start(start,0,count=10000)
        assert machine.reg_read(x.UC_X86_REG_RIP) in endpoints
    counts = dict(selector=0,reset_lists=0,rng=0,variant_index=0,phases=0,scheduler=0)
    ids = {row['enemy_id']:0x146bfb470+i*56 for i,row in enumerate(graph['guardians'])}
    stop = mem+0xff000
    for identity in range(1600):
        put(mem,'Q',stop)
        machine.reg_write(x.UC_X86_REG_RSP,mem)
        machine.reg_write(x.UC_X86_REG_RCX,identity)
        run(*RANGES['guardian-selector'],[stop])
        assert machine.reg_read(x.UC_X86_REG_RAX)==ids.get(identity,0),identity
        counts['selector']+=1
    actor,movebuf,timerbuf = mem+0x10000,mem+0x20000,mem+0x30000
    for row in graph['guardians']:
        for variant in row['variants']:
            machine.mem_write(actor,bytes(0x200))
            put(actor+0x70,'QQ',movebuf,len(variant))
            put(actor+0xa4,'I',0xffffffff)
            machine.reg_write(x.UC_X86_REG_RCX,actor)
            run(0x1459b7fc9,0x1459b7ff9,[0x1459b7ff9])
            assert get(actor+0xa4,'I')[0]==0 and get(actor+0x80,'QQ')==(movebuf,len(variant))
            repeats = []
            for j,item in enumerate(variant):
                at = int(item['record']['va'],16)
                machine.mem_write(movebuf+j*56,raw(at,56))
                repeats.append(graph['actions'][item['action']]['repeat_bits'])
            machine.reg_write(x.UC_X86_REG_R14,len(variant))
            machine.reg_write(x.UC_X86_REG_R15,movebuf)
            machine.reg_write(x.UC_X86_REG_RDI,timerbuf)
            run(0x1459b8054,0x1459b811e,[0x1459b8197])
            expected = tuple(bits(f32(struct.unpack('<f',struct.pack('<I',v))[0]*.5)) for v in repeats)
            assert get(timerbuf,f'{len(variant)}I')==expected
            counts['reset_lists']+=1
    for seed in range(1,33):
        state = [seed,seed+11,seed+23,seed+37]
        expected = state[:]
        while True:
            a,b,c,d = expected
            mask = (1<<64)-1
            def rotate(value,n):
                return ((value<<n)|(value>>(64-n)))&mask
            value = (rotate((a+d)&mask,23)+a)&mask
            shift = (b<<17)&mask
            c^=a;d^=b;b^=c;a^=d;c^=shift;d=rotate(d,45)
            expected = [a,b,c,d]
            if not value&(1<<57):
                break
        registers = [x.UC_X86_REG_R9,x.UC_X86_REG_RDX,x.UC_X86_REG_RAX,x.UC_X86_REG_R8]
        for reg,v in zip(registers,state):
            machine.reg_write(reg,v)
        run(0x145906d20,0x145906d4c,[0x145906d4c])
        assert [machine.reg_read(reg) for reg in registers]==expected
        assert machine.reg_read(x.UC_X86_REG_R14)==value
        counts['rng']+=1
    for high in range(64):
        for alternatives in [0,3]:
            machine.reg_write(x.UC_X86_REG_R9,alternatives)
            machine.reg_write(x.UC_X86_REG_R14,high<<58)
            run(0x145906db7,0x145906ddc,[0x145906ddc])
            assert machine.reg_read(x.UC_X86_REG_R14)==high%(alternatives+1)
            counts['variant_index']+=1
    phasebuf,header = mem+0x40000,mem+0x41000
    for row in graph['guardians']:
        for phase in row['phases']:
            threshold, = struct.unpack('<f',struct.pack('<I',phase['threshold_bits']))
            for health in [threshold*100.,threshold*100.-.01,threshold*100.+.01,float('nan')]:
                for used in [False,True]:
                    machine.mem_write(actor,bytes(0x200))
                    machine.mem_write(phasebuf,raw(int(phase['record']['va'],16),72))
                    put(header+0x20,'QQ',phasebuf,1)
                    put(actor+0xa4,'I',int(used))
                    for reg,v in [(x.UC_X86_REG_RBX,header),(x.UC_X86_REG_R14,actor),
                                  (x.UC_X86_REG_RDX,1),(x.UC_X86_REG_R8,1),
                                  (x.UC_X86_REG_RAX,0x40),(x.UC_X86_REG_RDI,0)]:
                        machine.reg_write(reg,v)
                    sx(x.UC_X86_REG_XMM10,health)
                    sx(x.UC_X86_REG_XMM1,100.)
                    run(0x14594747d,0x1459474df,[0x1459474a0,0x1459474df])
                    admitted = not used and f32(f32(health)/100.)<threshold
                    assert (machine.reg_read(x.UC_X86_REG_RIP)==0x1459474df)==admitted
                    assert get(actor+0xa4,'I')[0]==int(used or admitted)
                    counts['phases']+=1
    bp,queue,timer = mem+0x50000,mem+0x60000,mem+0x70000
    for tag in range(36):
        normalized = tag-3 if tag>=3 else 29
        nonblocking = normalized<32 and bool(0xa0180006>>normalized&1)
        for cast in [False,True]:
            for queued_tag in [None,4,5,6,19,22]:
                put(bp+0x230,'QQ',queue,int(queued_tag is not None))
                put(bp+0x1d8,'Q',77)
                put(queue,'Q',77)
                put(queue+0x35,'B',queued_tag or 0)
                machine.reg_write(x.UC_X86_REG_RBP,bp)
                machine.reg_write(x.UC_X86_REG_RAX,timer)
                machine.reg_write(x.UC_X86_REG_R13,tag)
                sx(x.UC_X86_REG_XMM9,2. if cast else 0.)
                sx(x.UC_X86_REG_XMM6,1.)
                sx(x.UC_X86_REG_XMM0,10.)
                sx(x.UC_X86_REG_XMM10,.7)
                run(0x145947c1b,0x145947d91,[0x145947bad,0x145947ca8])
                queued_blocking = queued_tag is not None and queued_tag not in [4,5,22,23,32,34]
                admitted = nonblocking or (not cast and not queued_blocking)
                assert (machine.reg_read(x.UC_X86_REG_RIP)==0x145947ca8)==admitted,(tag,cast,queued_tag)
                if admitted:
                    assert get(timer,'I')[0]==bits(f32(10.*f32(.7)))
                counts['scheduler']+=1
    return counts


def boss_schedules(raw,graph,headers):
    from unicorn import UC_HOOK_CODE
    from unicorn import x86_const as x
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    machine,mem=fixture(raw);md=Cs(CS_ARCH_X86,CS_MODE_64)
    actor,frame,queue,timers,output,allocated= [mem+i*0x10000 for i in range(1,7)]
    allowed=(0,0);endpoints=set();mode='';calls=[];localized=False;expected_id=expected_slot=0
    def put(a,fmt,*v):machine.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,machine.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):machine.reg_write(reg,bits(v))
    def ret():
        sp=machine.reg_read(x.UC_X86_REG_RSP);target=get(sp,'Q')[0]
        machine.reg_write(x.UC_X86_REG_RSP,sp+8);machine.reg_write(x.UC_X86_REG_RIP,target)
    def hook(uc,address,size,user):
        if address in endpoints:uc.emu_stop();return
        if mode=='yell' and address==0x145bdd130:
            dest=uc.reg_read(x.UC_X86_REG_RCX);args=uc.reg_read(x.UC_X86_REG_R8)
            assert raw(uc.reg_read(x.UC_X86_REG_RDX),15)==b'\x05boss.\xc0\x06.phase\xc0'
            assert get(get(args,'Q')[0],'I')[0]==expected_id
            assert get(get(args+16,'Q')[0],'Q')[0]==expected_slot+1
            key=f'boss.{expected_id}.phase{expected_slot+1}'.encode()
            machine.mem_write(allocated,key);put(dest,'QQQ',0,allocated,len(key))
            calls.append('format-key');ret();return
        if mode=='yell' and address==0x14598ddd0:
            assert bytes(machine.mem_read(uc.reg_read(x.UC_X86_REG_RCX),uc.reg_read(x.UC_X86_REG_RDX)))==f'boss.{expected_id}.phase{expected_slot+1}'.encode()
            uc.reg_write(x.UC_X86_REG_RAX,allocated+0x1000 if localized else 0)
            uc.reg_write(x.UC_X86_REG_RDX,9 if localized else 0)
            calls.append('localized-lookup');ret();return
        if mode=='replacement' and address==0x140002200: calls.append('allocation-marker');ret();return
        if mode=='replacement' and address==0x1400021c0:
            assert uc.reg_read(x.UC_X86_REG_RDX)==4
            calls.append(['allocate',uc.reg_read(x.UC_X86_REG_RCX)])
            uc.reg_write(x.UC_X86_REG_RAX,allocated);ret();return
        assert allowed[0]<=address<allowed[1],(mode,hex(address))
        ins=next(md.disasm(bytes(uc.mem_read(address,size)),address))
        if ins.mnemonic=='call':
            targets={'yell':{0x145bdd130,0x14598ddd0},'replacement':{0x140002200,0x1400021c0}}.get(mode,set())
            assert ins.op_str.startswith('0x')and int(ins.op_str,16)in targets,(mode,hex(address))
    machine.hook_add(UC_HOOK_CODE,hook)
    def run(a,b,stops,lane=''):
        nonlocal allowed,endpoints,mode
        allowed,endpoints,mode=(0x145948150 if lane=='recurring'else a,b),set(stops),lane;calls.clear()
        machine.reg_write(x.UC_X86_REG_EFLAGS,2);machine.reg_write(x.UC_X86_REG_MXCSR,0x1f80)
        machine.emu_start(a,0,count=10000)
        assert machine.reg_read(x.UC_X86_REG_RIP)in endpoints,(lane,hex(machine.reg_read(x.UC_X86_REG_RIP)))
    counts=dict(enrage=0,phase_denominator=0,phase_latch=0,phase_action_queue=0,phase_yell_lookup=0,recurring=0,replacement_timers=0)
    for maximum in [0.,1.,100.,123.25,float('nan')]:
        threshold=f32(f32(maximum)*f32(.3))
        for health in [-1.,0.,threshold,threshold-.001,threshold+.001,100.,float('nan')]:
            for used in [False,True]:
                for primary in [False,True]:
                    put(actor+0x18,'q',0 if primary else -1);put(actor+0x50,'B',int(used));put(actor+0x158,'2f',health,maximum)
                    machine.reg_write(x.UC_X86_REG_R14,actor)
                    run(0x145947d91,0x145947dca,[0x145947dca,0x145948381])
                    expected=used or(primary and threshold>f32(health))
                    assert get(actor+0x50,'B')[0]==int(expected)
                    counts['enrage']+=1
    headermap={h['words'][16]:int(h['record']['va'],16)for h in headers}
    for health in [-1.,0.,.5,1.,100.,float('nan')]:
        for maximum in [-1.,0.,.5,1.,100.,float('nan')]:
            put(actor+0x30,'Q',headermap[690]);machine.reg_write(x.UC_X86_REG_R14,actor)
            sx(x.UC_X86_REG_XMM0,health);sx(x.UC_X86_REG_XMM1,maximum)
            run(0x145947dca,0x145947e20,[0x145947e20])
            denominator=f32(maximum)if f32(maximum)>1. else 1.
            assert machine.reg_read(x.UC_X86_REG_XMM0)&0xffffffff==bits(f32(f32(health)/denominator))
            counts['phase_denominator']+=1
    for boss in graph['bosses']:
        header=headermap[boss['boss_id']]
        for phase in boss['phases']:
            at=int(phase['record']['va'],16);slot=phase['slot'];threshold=phase['threshold_bits']
            base=at-slot*72
            for ratio_bits in [0,threshold-1,threshold,threshold+1,0x3f800000,0x7fc00000]:
                ratio=struct.unpack('<f',struct.pack('<I',ratio_bits))[0];limit=struct.unpack('<f',struct.pack('<I',threshold))[0]
                for used in [False,True]:
                    mask=(1<<slot)if used else 0
                    put(actor+0x4c,'I',mask)
                    for reg,v in [(x.UC_X86_REG_R14,actor),(x.UC_X86_REG_R11,base),(x.UC_X86_REG_R8,64+slot*72),(x.UC_X86_REG_RDI,slot),(x.UC_X86_REG_RDX,len(boss['phases'])),(x.UC_X86_REG_R10,mask),(x.UC_X86_REG_XMM0,ratio_bits)]:machine.reg_write(reg,v)
                    run(0x145947e20,0x145947e4a,[0x145947e10,0x145947e4a])
                    fired=not used and ratio<limit
                    assert(machine.reg_read(x.UC_X86_REG_RIP)==0x145947e4a)==fired
                    assert get(actor+0x4c,'I')[0]==(mask|1<<slot if fired else mask)
                    counts['phase_latch']+=1
            machine.mem_write(frame,bytes(0x400));put(frame+0x228,'QQQ',100,queue,0);put(frame+0x1d8,'Q',777)
            for reg,v in [(x.UC_X86_REG_RAX,header),(x.UC_X86_REG_RDI,slot),(x.UC_X86_REG_R8,64+slot*72),(x.UC_X86_REG_RBP,frame)]:machine.reg_write(reg,v)
            run(0x145947e4a,0x145947f37,[0x145947f37])
            assert get(frame+0x238,'Q')[0]==1 and get(queue,'Q')[0]==777
            assert bytes(machine.mem_read(queue+8,48))==raw(at+16,48)
            counts['phase_action_queue']+=1
            for translated in [False,True]:
                expected_id,expected_slot,localized=boss['boss_id'],slot,translated
                stack=mem+0xe0000;put(stack,'Q',mem+0xff000)
                machine.reg_write(x.UC_X86_REG_RCX,header);machine.reg_write(x.UC_X86_REG_RDX,slot);machine.reg_write(x.UC_X86_REG_RSP,stack)
                run(0x145897ec0,0x145897f87,[mem+0xff000],'yell')
                ptr=machine.reg_read(x.UC_X86_REG_RAX);length=machine.reg_read(x.UC_X86_REG_RDX)
                if translated:assert(ptr,length)==(allocated+0x1000,9)
                else:assert bytes(machine.mem_read(ptr,length)).decode()==phase['yell']
                assert calls==['format-key','localized-lookup']
                counts['phase_yell_lookup']+=1
        for move in boss['moves']:
            at=int(move['record']['va'],16);tag=graph['actions'][move['action']]['native_tag'];repeat=struct.unpack('<f',raw(at+48,4))[0]
            normalized=tag-3 if tag>=3 else 29;nonblocking=normalized<32 and bool(0xa0180006>>normalized&1)
            for enraged in [False,True]:
                for cast in [False,True]:
                    for previous in [None,4,6]:
                        for timer in [1.,.25,0.,-2.,float('nan')]:
                            machine.mem_write(frame,bytes(0x400));put(frame+0x228,'QQQ',100,queue,int(previous is not None));put(frame+0x1d8,'Q',777);put(frame+0x310,'Q',actor)
                            put(queue,'Q',777);put(queue+0x35,'B',previous or 0)
                            put(actor+0x38,'QQ',at-move['slot']*56,len(boss['moves']));put(actor+0x50,'B',int(enraged));put(timers,'f',timer)
                            for reg,v in [(x.UC_X86_REG_R14,actor),(x.UC_X86_REG_R15,timers),(x.UC_X86_REG_RDI,move['slot']),(x.UC_X86_REG_RBP,frame)]:machine.reg_write(reg,v)
                            for reg,v in [(x.UC_X86_REG_XMM7,.25),(x.UC_X86_REG_XMM9,11. if cast else 10.),(x.UC_X86_REG_XMM6,10.),(x.UC_X86_REG_XMM13,0.)]:sx(reg,v)
                            run(0x1459481a6,0x145948381,[0x14594819d],'recurring')
                            remaining=f32(f32(timer)-.25);fired=remaining<=0. and(nonblocking or(not cast and previous!=6))
                            expected=f32(repeat*f32(.7 if enraged else 1.))if fired else remaining
                            assert get(timers,'I')[0]==bits(expected),(boss['boss_id'],move['slot'],enraged,cast,previous,timer)
                            original=int(previous is not None)
                            assert get(frame+0x238,'Q')[0]==original+int(fired)
                            if fired:
                                assert get(queue+original*56,'Q')[0]==777
                                assert bytes(machine.mem_read(queue+original*56+8,48))==raw(at,48)
                            counts['recurring']+=1
    for row in graph['actions']:
        if row['native_tag']not in[0,1,2,32]:continue
        record=mem+0x70000
        for i,index in enumerate(row['children']):
            child=graph['actions'][index];put(record+i*56,'12I',*child['words']);put(record+i*56+48,'I',child['repeat_bits'])
        stack=mem+0xe0000;put(stack,'Q',mem+0xff000)
        for reg,v in [(x.UC_X86_REG_RCX,output),(x.UC_X86_REG_RDX,record),(x.UC_X86_REG_R8,record+56*len(row['children'])),(x.UC_X86_REG_RSP,stack)]:machine.reg_write(reg,v)
        run(0x1459da880,0x1459da9e7,[mem+0xff000],'replacement')
        length,pointer,count=get(output,'QQQ');assert length==count==len(row['children'])
        expected=tuple(bits(f32(f32(struct.unpack('<f',struct.pack('<I',graph['actions'][index]['repeat_bits']))[0]*.5)+1.))for index in row['children'])
        assert get(pointer,f'{count}I')==expected
        assert calls==['allocation-marker',['allocate',4*count]]
        counts['replacement_timers']+=1
    return dict(cases=counts,boss_phase_records=sum(len(b['phases'])for b in graph['bosses']),boss_recurring_records=sum(len(b['moves'])for b in graph['bosses']),
      seams=['Phase label formatting and localization supply controlled output; actual native one-based boss/phase arguments and fallback selection are checked.',
      'Replacement timer allocation supplies controlled writable storage; actual current scalar/vector arithmetic executes.'])


def source_connections():
    import re
    base=ROOT/'crates/azeroth-survivors-re/src'
    checks={
      'bosses/scaling.rs':['if input.phase == 1 && input.endless','powf(1.096, exponent)','powf(1.22, exponent)'],
      'bosses/ai.rs':['if !self.enraged && max_health * 0.3 > health { self.enraged = true; }',
        'phase_yells = phases.take_actions(definition.id, health, max_health)',
        'let blocking_phase = phase_yells.iter().any(|phase| phase.blocking())',
        'self.raid_schedule.advance_with_phases(', 'queued.append(&mut abilities)'],
      'bosses/minion_phases.rs':['let denominator = if maximum_health > 1.0 { maximum_health } else { 1.0 }',
        'self.fired & bit == 0 && ratio < phase.threshold','self.fired |= bit','due.sort_by_key(|phase| phase.phase_index)'],
      'bosses/raid_area_catalog.rs':['f32::from_bits(row.ability.words[6]) * 0.6',
        'ACTIONS[index].repeat * 0.5 + 1.','let scale = if enraged { 0.7 } else { 1.0 }',
        '*timer -= elapsed','if *timer <= 0.0','if !blocking || (!cast_active && !blocking_queued)',
        '*timer = repeat * scale','blocking_queued |= blocking','ACTIONS[index].children.iter().enumerate()'],
      'gameplay/mechanics/bosses.rs':['frame.yells.extend(result.phase_yells.into_iter()',
        'AnnouncementLabel::boss_phase(row.definition.id, phase.phase_index, phase.yell)',
        'row.ai.raid_schedule.replace_moves(index)','self.guardian_state.raid_replace_moves(source,index)'],
      'gameplay/mechanics/announcements.rs':['format!("boss.{id}.phase{}", phase_index + 1)'],
      'guardians/signatures.rs':['ACTIONS[index].repeat * 0.5 + 1.'],
    }
    compact=lambda value:re.sub(r'\s+','',value)
    for path,tokens in checks.items():
        text=compact((base/path).read_text())
        for token in tokens:assert compact(token)in text,(path,token)
    ai=compact((base/'bosses/ai.rs').read_text())
    assert ai.index('phases.take_actions(')<ai.index('self.raid_schedule.advance_with_phases(')
    scaling=(base/'bosses/scaling.rs').read_text()
    assert scaling.index('powf(1.096, exponent)')<scaling.index('powf(1.22, exponent)')
    return dict(files=len(checks),guards=sum(map(len,checks.values()))+2)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage',action='store_true')
    args = parser.parse_args()
    mod = load()
    target,raw,span,graph,headers = mod.recover()
    mod.check_graph(graph,headers)
    fixture(raw)  # Set the project-local native fixture dependency paths.
    arithmetic = boss_arithmetic(raw)
    guardian = guardian_schedules(raw,graph)
    boss_schedule=boss_schedules(raw,graph,headers)
    source=source_connections()
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    md = Cs(CS_ARCH_X86,CS_MODE_64)
    out = STAGE if args.stage else KEPT
    if args.stage:
        out.mkdir(parents=True,exist_ok=True)
    else:
        mod.verify_rea_operations(raw,out,target['sha256'])
    ranges = []
    for role,(start,end) in RANGES.items():
        value = raw(start,end-start)
        ins = list(md.disasm(value,start))
        assert sum(row.size for row in ins)==len(value),role
        asm = ''.join(f'{row.address:x}: {row.bytes.hex()} {row.mnemonic} {row.op_str}'.rstrip()+'\n' for row in ins)
        path = out/(role+'.asm')
        if args.stage:
            path.write_text(asm)
        else:
            assert path.read_text()==asm,role
        ranges.append(dict(role=role,**span(start,end-start),assembly=role+'.asm'))
    result = dict(target_version=target['version'],target_sha256=target['sha256'],
                  target_executed=False,ranges=ranges,boss_arithmetic=arithmetic,
                  guardian_native_cases=guardian,boss_schedule=boss_schedule,source_connections=source,
                  limitations=['Synthetic original-byte instruction fixtures do not execute Rust or a game.',
                  'Windows powf outputs are injected explicitly; its library implementation is not certified.',
                  'Call-free fragments reject calls; phase labels and replacement allocations use only their explicitly named seams. Whole constructors, terrain, packet/publication, rendering, audio and parity remain separate.'])
    text = json.dumps(result,indent=2)+'\n'
    if args.stage:
        (out/'manifest.json').write_text(text)
    else:
        assert (out/'manifest.json').read_text()==text
    print(f'Current raid inputs: {arithmetic["cases"]} boss arithmetic + {sum(guardian.values())} guardian + {sum(boss_schedule["cases"].values())} boss schedule instruction cases; no compilation/game')


if __name__=='__main__':
    main()

#!/usr/bin/env python3
"""Verify selected-target camera bytes and bounded original-instruction contracts.

No compilation or application runs. WMO/terrain/spatial and CRT/glam callees
are explicit synthetic seams; their native bodies do not execute in this check.
"""
import argparse
import hashlib
import importlib.util
import json
import math
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target, json_text
OUT = ROOT / 'docs/analysis/evidence/0.105.0/camera-room'
RUN = ROOT / 'runtime/camera-recovery-0.105.0'


def f32(v):
    return struct.unpack('<f', struct.pack('<f', v))[0]


def source_model(case, inside, cast):
    """Independent scalar transcription of the connected Rust branch; not Rust execution."""
    pivot, eye, tilt, dt = case['pivot'], case['eye'], case['tilt'], case['dt']
    offset = [f32(a-b) for a,b in zip(eye,pivot)]
    distance = f32(math.sqrt(f32(f32(f32(offset[0]*offset[0])+f32(offset[1]*offset[1]))+f32(offset[2]*offset[2]))))
    horizontal = f32(math.sqrt(f32(f32(offset[0]*offset[0])+f32(offset[2]*offset[2]))))
    if case['map'] != 189 or not distance >= 2 or not horizontal > f32(.001) or not inside(pivot):
        return dict(tilt=0.0, eye=eye)
    base = f32(math.asin(f32(offset[1]/distance)))
    maximum = struct.unpack('<f', bytes.fromhex('c3b8b23f'))[0]
    def direction(pitch):
        co, si = f32(math.cos(pitch)), f32(math.sin(pitch))
        inv = f32(1/horizontal)
        return [f32(f32(offset[0]*inv)*co), si, f32(f32(offset[2]*inv)*co)]
    def point(ray, reach):
        return [f32(a+f32(b*reach)) for a,b in zip(pivot,ray)]
    target = 0.0
    if base < maximum and not inside(eye):
        target = f32(maximum-base)
        for step in range(1,11):
            delta = f32(f32(step*f32(maximum-base))/10)
            ray = direction(f32(base+delta))
            move = [f32(v*distance) for v in ray]
            hit = cast(pivot,move)
            if inside(point(ray,distance)) and (hit is None or hit >= f32(distance*f32(.97))):
                target = delta
                break
    rate = 12.0 if target > tilt else 2.5
    gain = f32(1-f32(math.exp(f32(-rate*dt))))
    tilt = f32(f32(gain*f32(target-tilt))+tilt)
    if tilt < f32(.0001) and inside(eye):
        return dict(tilt=tilt, eye=eye)
    pitch = min(f32(base+tilt),max(base,maximum))
    ray = direction(pitch)
    hit = cast(pivot,[f32(v*distance) for v in ray])
    reach = distance if hit is None else min(hit,distance)
    if not inside(point(ray,reach)):
        low = 0.0
        for _ in range(8):
            mid = f32(f32(reach+low)*f32(.5))
            if inside(point(ray,mid)): low = mid
            else: reach = mid
        reach = low
    return dict(tilt=tilt, eye=point(ray,reach))


def vectors(pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, __version__
    from unicorn import x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(p['rva']+max(p['raw_size'],p['virtual_size']) for p in pe.sections)
    u.mem_map(pe.image_base,(extent+4095)&~4095)
    for p in pe.sections:
        u.mem_write(pe.image_base+p['rva'],pe.data[p['raw_offset']:p['raw_offset']+p['raw_size']])
    memory, stack = 0x200000000, 0x300000000
    u.mem_map(memory,0x10000); u.mem_map(stack,0x10000)
    def put(a,fmt,*v): u.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt): return struct.unpack('<'+fmt,u.mem_read(a,struct.calcsize('<'+fmt)))
    def xf(reg): return struct.unpack('<f',u.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def setxf(reg,v): u.reg_write(reg,int.from_bytes(struct.pack('<f',f32(v)),'little'))
    context = {}
    def hook(uc,address,size,unused):
        if address == 0x140b07c05 or context.get('room_tail') and address == 0x1419bd097:
            context['done'] = True; uc.emu_stop(); return
        fn = {0x145bc9829:math.asin,0x145bc97cf:math.exp,
              0x145bc97c3:math.cos,0x145bc97bd:math.sin}.get(address)
        if fn: setxf(r.UC_X86_REG_XMM0,fn(xf(r.UC_X86_REG_XMM0)))
        elif address == 0x1418e5a00:
            uc.reg_write(r.UC_X86_REG_RAX,0); setxf(r.UC_X86_REG_XMM0,0)
        elif address == 0x140acaca0:
            point = get(uc.reg_read(r.UC_X86_REG_RCX),'3f')
            uc.reg_write(r.UC_X86_REG_RAX,int(context['inside'](point)))
        elif address == 0x141898ff0:
            hit = context['cast'](get(uc.reg_read(r.UC_X86_REG_RDX),'3f'),
                                  get(uc.reg_read(r.UC_X86_REG_R8),'3f'))
            uc.reg_write(r.UC_X86_REG_RAX,int(hit is not None))
            if hit is not None: setxf(r.UC_X86_REG_XMM0,hit)
        elif 0x140b07260 <= address < 0x140b080b6 or 0x140ab2310 <= address < 0x140ab2544 or 0x144fe3290 <= address < 0x144fe33ea or context.get('room_tail') and 0x1419bd057 <= address < 0x1419bd097:
            return
        else: raise AssertionError('Unreviewed native instruction '+hex(address))
        rsp = uc.reg_read(r.UC_X86_REG_RSP)
        ret = get(rsp,'Q')[0]
        uc.reg_write(r.UC_X86_REG_RSP,rsp+8); uc.reg_write(r.UC_X86_REG_RIP,ret)
    u.hook_add(UC_HOOK_CODE,hook)
    cases = []
    for map_id,eye in [(None,[0,0,20]),(0,[0,0,20]),(189,[0,0,1.999]),
                       (189,[0,0,2]),(189,[0,20,0]),(189,[.0005,3,0])]:
        cases.append(dict(map=map_id,eye=eye,pivot=[0,0,0],tilt=.5,dt=.1,room='courtyard',hit=None))
    for room in ('all','courtyard','radius','none'):
        for dt in (0,.016,.1,1):
            for tilt in (0,.4):
                cases.append(dict(map=189,eye=[0,3,20],pivot=[0,0,0],tilt=tilt,dt=dt,room=room,hit=None))
    for fraction in (.969,.97,.971):
        cases.append(dict(map=189,eye=[0,0,20],pivot=[0,0,0],tilt=0,dt=1,room='courtyard',hit=fraction))
    cases += [dict(map=189,eye=[13,3,19],pivot=[1,-2,4],tilt=0,dt=.1,room='courtyard',hit=None),
              dict(map=189,eye=[0,20,1],pivot=[0,0,0],tilt=.2,dt=.1,room='courtyard',hit=None)]
    results = []
    for case in cases:
        case = {**case,'eye':list(map(f32,case['eye'])),'pivot':list(map(f32,case['pivot'])),
                'tilt':f32(case['tilt']),'dt':f32(case['dt'])}
        def inside(point):
            p = [f32(a-b) for a,b in zip(point,case['pivot'])]
            return {'all':True,'none':False,'courtyard':p[2]<18,
                    'radius':sum(v*v for v in p)<=25}[case['room']]
        def cast(origin,movement):
            return None if case['hit'] is None else f32(math.sqrt(sum(v*v for v in movement))*case['hit'])
        expected = source_model(case,inside,cast)
        u.mem_write(memory,bytes(0x10000)); u.mem_write(stack,bytes(0x10000))
        rsp = stack+0x8000
        for reg,v in [(r.UC_X86_REG_RSP,rsp),(r.UC_X86_REG_RDI,memory+0x1000),
            (r.UC_X86_REG_R12,memory+0x2000),(r.UC_X86_REG_R11,memory+0x3000),
            (r.UC_X86_REG_R13,memory+0x4000),(r.UC_X86_REG_R14,memory+0x5000),
            (r.UC_X86_REG_R9,0 if case['map'] is None else memory+0x6000),
            (r.UC_X86_REG_RBP,memory+0x7000),(r.UC_X86_REG_R15,rsp+0x1c8),
            (r.UC_X86_REG_RBX,0)]: u.reg_write(reg,v)
        put(memory+0x1000,'4f',0,0,0,1); put(memory+0x1010,'3f',*case['eye'])
        put(memory+0x2058,'f',case['dt']); put(memory+0x3070,'3f',*case['pivot'])
        put(memory+0x404c,'f',0); put(memory+0x5000,'f',case['tilt'])
        put(memory+0x6000,'I',case['map'] or 0)
        context.update(done=False,inside=inside,cast=cast,room_tail=False)
        u.emu_start(0x140b075d1,0,count=10000)
        assert context['done'],'Native instruction budget exhausted'
        actual = dict(tilt=get(memory+0x5000,'f')[0],eye=list(get(memory+0x1010,'3f')))
        for a,b in zip([actual['tilt'],*actual['eye']],[expected['tilt'],*expected['eye']]):
            assert abs(a-b)<.00005,(case,actual,expected)
        results.append(dict(input=case,output=actual))
    rooms = []
    for depth in (999,1000,1001,1759.9999,1760,1760.001):
        for flags in (0,8,0x40,0x48):
            u.reg_write(r.UC_X86_REG_RCX,1)
            u.reg_write(r.UC_X86_REG_RAX,0)
            u.reg_write(r.UC_X86_REG_R12,1)
            u.reg_write(r.UC_X86_REG_R14,memory+0x8000)
            u.reg_write(r.UC_X86_REG_R15,memory+0x9000)
            put(memory+0x9000,'I',flags)
            setxf(r.UC_X86_REG_XMM8,depth);setxf(r.UC_X86_REG_XMM0,0)
            context.update(done=False,room_tail=True)
            u.emu_start(0x1419bd057,0,count=64)
            assert context['done']
            accepted=bool(get(memory+0x8000,'Q')[0])
            assert accepted == (f32(depth)<=1760 and flags&8==0)
            rooms.append(dict(depth=f32(depth),flags=flags,accepted=accepted))
    return dict(emulator='Unicorn '+__version__,cases=results,room_admission_cases=rooms,
        limits=['Original caller and ten-step candidate instructions execute with synthetic resources.',
                'Terrain/WMO admission, solid cast and CRT asin/cos/sin/exp callees are explicit seams.',
                'Bias and position are compared to a scalar source transcription. Native rotation-arc/composition also execute; Rust quaternion behavior, full MPQ geometry and applications are not tested.'])

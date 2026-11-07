#!/usr/bin/env python3
"""Check selected native input contracts; no compilation or application execution.

Uses the existing project-local Unicorn probe/Node384 decoder. Native byte ranges
and curated Ghidra instructions remain hash-bound; UI submissions are seams.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / 'runtime/analysis/history/movement/input/dfe894095d7c'
RETAINED = ROOT / 'docs/analysis/evidence/input'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'


def load():
    m = load_script('input_probe', ROOT / 'scripts/recover-rewards-layout.py')
    assert hashlib.sha256(m.data).hexdigest() == SHA
    return m


def vectors(m):
    class Probe(m.Probe):
        stops = ()
        def hook(self, machine, address, size, unused):
            if address in self.stops:
                self.stopped = address
                self.u.emu_stop()
                return
            return super().hook(machine, address, size, unused)
    out = []
    def xmm(p, reg, values):
        p.u.reg_write(reg, int.from_bytes(struct.pack('<4f', *(list(values) + [0.] * (4 - len(values)))), 'little'))
    def low(p, reg):
        return struct.unpack('<f', p.reg(reg).to_bytes(16, 'little')[:4])[0]
    def close(a, b):
        assert math.isclose(a, b, rel_tol=2e-6, abs_tol=2e-6), (a, b)
    p = Probe(0x1400B7900)
    dest = p.alloc(128)
    shapes = [(0.,0.),(.1,.2),(.15,.2),(.25,0.),(.6,.8),(-.6,.8),(1.,-1.),(-.01,-.01)]
    for dead in [0., .25, .9]:
        for left in shapes:
            for right in [(0.,0.),(.15,.2),(-.6,-.8)]:
                for reg, values in [(m.UC_X86_REG_XMM8,[left[0]]),(m.UC_X86_REG_XMM7,[left[1]]),
                    (m.UC_X86_REG_XMM0,[right[0]]),(m.UC_X86_REG_XMM1,[right[1]]),(m.UC_X86_REG_XMM6,[dead])]: xmm(p,reg,values)
                p.u.reg_write(m.UC_X86_REG_RSI,dest)
                p.u.emu_start(0x1400B7D56,0x1400B7D89,count=100)
                got = struct.unpack('<4f',p.read(dest,16))
                expected = [v for pair in [left,right] for v in ((0.,0.) if math.hypot(*pair)<dead else pair)]
                for a,b in zip(got,expected):close(a,b)
                out.append(dict(kind='radial',left=left,right=right,dead=dead,result=got))
    # Exact held-A block: its stale UI latch clears only when A releases.
    p = Probe(0x1400BF8F0)
    state, inputs, dirty = p.alloc(128), p.alloc(128), p.alloc(8)
    for blocked in [0,1]:
        for held in [0,1]:
            p.u.mem_write(state+0x4f,bytes([blocked]))
            for reg,value in [(m.UC_X86_REG_RBX,state),(m.UC_X86_REG_R12,held),
                (m.UC_X86_REG_RDI,dirty),(m.UC_X86_REG_RSI,inputs),(m.UC_X86_REG_R15,42)]:p.u.reg_write(reg,value)
            p.u.emu_start(0x1400BFD6C,0x1400BFD86,count=100)
            latch, jump = p.read(state+0x4f,1)[0],p.read(inputs+0x15,1)[0]
            assert latch == (blocked & held) and jump == ((blocked & held)^1)&held
            out.append(dict(kind='accept-release',blocked=blocked,held=held,latch=latch,jump=jump))
    # One candidate's unchanged direction/rejection/score instructions.
    p = Probe(0x1400C03F0)
    candidate = p.alloc(24)
    p.stops = (0x1400C15F8,0x1400C16F0)
    for direction in [(1.,0.),(0.,-1.),(.6,.8)]:
        for point in [(0.,0.),(4.,0.),(5.,0.),(10.,3.),(-20.,15.),(100.,-100.)]:
            p.u.mem_write(candidate,struct.pack('<Q4f',2,*point,*point))
            for reg,value in [(m.UC_X86_REG_RCX,candidate),(m.UC_X86_REG_RAX,24),(m.UC_X86_REG_R14,1)]:p.u.reg_write(reg,value)
            for reg,values in [(m.UC_X86_REG_XMM0,direction),(m.UC_X86_REG_XMM1,[0.,0.]),
                (m.UC_X86_REG_XMM2,[4.]),(m.UC_X86_REG_XMM8,[.5,.5])]:xmm(p,reg,values)
            p.u.emu_start(0x1400C15A0,0x1400C16F1,count=100)
            forward = sum(a*b for a,b in zip(point,direction))
            admitted = p.stopped == 0x1400C15F8
            assert admitted == (forward>4.)
            score = low(p,m.UC_X86_REG_XMM3) if admitted else None
            if admitted:close(score,forward+2*math.hypot(*(a-forward*b for a,b in zip(point,direction))))
            out.append(dict(kind='focus-score',direction=direction,point=point,admitted=admitted,score=score))
    # Recovered repeat deadlines; no UI query, callback or screen execution.
    p.stops = (0x1400C147B,0x1400C16F0)
    state, time, bp, dirty = p.alloc(128), p.alloc(128),p.alloc(1024),p.alloc(8)
    p.u.reg_write(m.UC_X86_REG_RBP,bp)
    p.wq(bp+0x360,state);p.wq(bp+0x358,dirty)
    for active, now, deadline, same in [(0,0.,0.,True),(1,.37,.38,True),(1,.38,.38,True),(1,1.,2.,False)]:
        p.u.mem_write(state+0x34,struct.pack('<Iii',active,1 if same else -1,0))
        p.u.mem_write(state+0x20,struct.pack('<f',deadline));p.u.mem_write(time+0x5c,struct.pack('<f',now))
        for reg,value in [(m.UC_X86_REG_R13,time),(m.UC_X86_REG_RSI,1),(m.UC_X86_REG_RDX,0)]:p.u.reg_write(reg,value)
        p.u.emu_start(0x1400C13FA,0x1400C16F1,count=100)
        fired = p.stopped == 0x1400C147B
        expected = not active or not same or now>=deadline
        assert fired == expected
        next_deadline = struct.unpack('<f',p.read(state+0x20,4))[0]
        close(next_deadline,now+(.38 if not active or not same else .11) if fired else deadline)
        out.append(dict(kind='focus-repeat',active=active,now=now,same=same,fired=fired,next=next_deadline))
    # Floating touch base and movement threshold, before the atan2 library call.
    p = Probe(0x140022DF0)
    p.stops = (0x140023541,0x140023564)
    descriptor,state,inputs,dirty=p.alloc(256),p.alloc(128),p.alloc(128),p.alloc(8)
    p.wq(p.sp+0x20,dirty)
    for delta in [(0.,0.),(14.,0.),(14.1,0.),(64.,0.),(65.,0.),(100.,0.),(80.,80.),(-100.,20.)]:
        base=(10.,20.);point=tuple(a+b for a,b in zip(base,delta))
        p.u.mem_write(descriptor+0x78,struct.pack('<2f',*point))
        for reg,value in [(m.UC_X86_REG_RAX,descriptor),(m.UC_X86_REG_R15,state),(m.UC_X86_REG_R12,inputs),
            (m.UC_X86_REG_R13,dirty),(m.UC_X86_REG_RBP,7),(m.UC_X86_REG_R14,42)]:p.u.reg_write(reg,value)
        xmm(p,m.UC_X86_REG_XMM6,base)
        p.u.emu_start(0x1400234AD,0x140023565,count=100)
        got=struct.unpack('<2f',p.read(state+16,8));distance=math.hypot(*delta)
        expected=tuple(point[i]-delta[i]/distance*64. for i in [0,1]) if distance>64. else base
        for a,b in zip(got,expected):close(a,b)
        moving=p.stopped==0x140023541
        assert moving == (min(distance,64.)/64.>.22)
        out.append(dict(kind='floating-touch',delta=delta,base=got,moving=moving))
    # Exact one-finger camera arithmetic and two-finger pinch distance.
    p.stops=()
    previous,current=p.alloc(64),p.alloc(64)
    for dx,dy in [(0.,0.),(10.,-20.),(-15.,30.)]:
        p.u.mem_write(previous+8,struct.pack('<2f',100.,100.));p.u.mem_write(current+8,struct.pack('<2f',100.+dx,100.+dy))
        p.u.mem_write(inputs,bytes(64))
        for reg,value in [(m.UC_X86_REG_RCX,previous),(m.UC_X86_REG_RAX,current),(m.UC_X86_REG_R12,inputs),(m.UC_X86_REG_R13,dirty)]:p.u.reg_write(reg,value)
        p.u.emu_start(0x14002363A,0x140023682,count=100)
        result=struct.unpack('<2f',p.read(inputs+8,8));close(result[0],-dx*.009);close(result[1],dy*.006)
        out.append(dict(kind='touch-pan-native-axes',delta=[dx,dy],result=result))
    for old,new in [(100.,100.),(100.,136.),(136.,100.)]:
        for at,distance in [(previous,old),(current,new)]:p.u.mem_write(at,struct.pack('<Q2fQ2f',1,0.,0.,2,distance,0.))
        p.u.mem_write(inputs,bytes(64))
        for reg,value in [(m.UC_X86_REG_RCX,previous),(m.UC_X86_REG_RAX,current),(m.UC_X86_REG_R12,inputs),(m.UC_X86_REG_R13,dirty)]:p.u.reg_write(reg,value)
        p.u.emu_start(0x1400235CE,0x140023632,count=100)
        result=struct.unpack('<f',p.read(inputs+16,4))[0];close(result,(old-new)/36.)
        out.append(dict(kind='pinch',previous=old,current=new,result=result))
    return out


def layout(m):
    class Probe(m.Probe):
        def hook(self,machine,a,n,unused):
            if self.start<=a<m.bounds[self.start] or a==0x400000000:return super().hook(machine,a,n,unused)
            c,d,r8,sp=[self.reg(x)for x in (m.UC_X86_REG_RCX,m.UC_X86_REG_RDX,m.UC_X86_REG_R8,m.UC_X86_REG_RSP)]
            if a in [0x1401A1660,0x1401A1910,0x1401A13B0,0x14018CB00]:
                offset=8 if a==0x14018CB00 else 0
                row=dict(site=hex(self.q(sp)-5),node=self.node(r8+offset),colors=[list(struct.unpack('<I4f',self.read(r8+offset+384+i*20,20)))for i in range(1 if offset else 4)])
                if not offset:row['tail']=self.read(r8+464,26).hex()
                self.records.append(row);self.u.mem_write(c,self.read(d,40));self.result(c)
            elif a==0x1401D67D0:pass # Child layout is replayed separately below.
            else:return super().hook(machine,a,n,unused)
            self.u.reg_write(m.UC_X86_REG_RIP,self.q(sp));self.u.reg_write(m.UC_X86_REG_RSP,sp+8)
    p=Probe(0x1400225B0);nodes=p.run([p.alloc(128),p.alloc(128)])
    assert [r['node']['width']for r in nodes]==[[1,128.],[1,54.],[1,46.]]
    p=Probe(0x1401D67D0);glyph=p.run([p.alloc(128)])
    assert len(glyph)==2 and all(r['node']['width']==[1,6.]and r['node']['height']==[1,18.]for r in glyph)
    return dict(touch_nodes=nodes,pause_bars=glyph)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true')
    parser.add_argument('--prepare-native',action='store_true',help='stage a scoped REA/Ghidra map/plan without running it')
    args=parser.parse_args();m=load();WORK.mkdir(parents=True,exist_ok=True)
    if args.prepare_native:
        manifest=json.loads((RETAINED/'manifest.json').read_text())
        parents=sorted({int(row['parent'],16)for row in manifest['extracts']})
        base=min(parents)
        ranges=[(a,m.bounds[a])for a in parents]+[(0x145D6C000,0x145DC0000)]
        with (WORK/'reproduction-map.bin').open('wb')as output:
            for a,b in ranges:
                output.seek(a-base);offset=m.pe.rva_offset(a-m.pe.image_base)
                output.write(m.data[offset:offset+b-a])
        seeds=WORK/'reproduction-seeds.tsv'
        seeds.write_text(''.join(f'{a:#x}\tfunction\n{a:#x}\tcode\n'for a in parents))
        plan=dict(target=str((WORK/'reproduction-map.bin').relative_to(ROOT)),
            output='runtime/analysis/history/movement/input/dfe894095d7c/rea-reproduction',init_timeout=60,timeout=240,
            open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(base)),
            environment={'REA_GHIDRA_SEED_FILE':str(seeds.relative_to(ROOT)),
                'REA_GHIDRA_DISABLED_ANALYZERS':'Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls'},
            operations=[dict(name='analyze_function',arguments=dict(procedure=hex(a)),label=hex(a))for a in parents])
        (WORK/'reproduction-plan.json').write_text(json.dumps(plan,indent=2)+'\n')
        print('Staged exact selected input owners/data and zero-filled address holes; REA plan not executed')
        if not args.check:return
    result=dict(target_sha256=SHA,instruction_cases=vectors(m),layout=layout(m),
        seams=['Original-PE instruction blocks, caller-supplied registers/storage and bounded stops.',
               'No transcendental library, controller driver, ECS query, UI focus engine, Lua VM or GPU executes.',
               'Typed UI submissions return empty command spawners; native Node/color stores execute unchanged.',
               'Rust regressions are authored but uncompiled; native cases do not execute the reconstruction.'])
    path=RETAINED/'vectors.json' if args.check else WORK/'vectors.json'
    if args.check:
        assert json.loads(path.read_text())==json.loads(json.dumps(result))
        manifest=json.loads((RETAINED/'manifest.json').read_text());assert manifest['target_sha256']==SHA
        for row in manifest['extracts']:
            raw=m.data[int(row['file_offset'],16):int(row['file_offset'],16)+row['byte_count']]
            assert hashlib.sha256(raw).hexdigest()==row['sha256']
            assert hashlib.sha256((RETAINED/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256']
    else:path.write_text(json.dumps(result,indent=2)+'\n')
    print(f"Passed {len(result['instruction_cases'])} bounded native input cases and 5 typed UI constructor snapshots; no builds or games")

if __name__=='__main__':main()

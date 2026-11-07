#!/usr/bin/env python3
"""Replay bounded unchanged 0.105.0 instructions; no compiler or game process.

Use an existing Unicorn installation via --python-libs or PYTHONPATH. All output
must remain in this checkout. XP hooks only zone-index return and CRT roundf;
checkpoint buffers are preallocated. Action cases stop before external effects.
The Python arithmetic model transcribes the changed Rust helper for comparison;
this does not execute or compile Rust, nor validate Windows CRT/platform parity.
"""
from script_sources import load_script
import argparse, hashlib, json, math, random, struct, sys
from pathlib import Path
ROOT = next(p for p in Path(__file__).resolve().parents if (p/'scripts/inventory-executable.py').is_file())
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK = ROOT/'runtime/analysis/history/interface/terminal-totals/0a6f0cbcd97f'
MASK = (1 << 64)-1

def f32(x):
    try:return struct.unpack('<f',struct.pack('<f',x))[0]
    except OverflowError:return math.copysign(math.inf,x)
def bits(x):return struct.unpack('<I',struct.pack('<f',f32(x)))[0]
def add(a,b):return f32(f32(a)+f32(b))
def mul(a,b):return f32(f32(a)*f32(b))
def div(a,b):
    if b==0:return math.nan if a==0 else math.copysign(math.inf,a*b if b else a)
    return f32(f32(a)/f32(b))
def rnd(x):
    if not math.isfinite(x):return x
    return f32(math.copysign(math.floor(abs(x)+0.5),x))
def cast(x,lo,hi):
    if math.isnan(x):return 0
    if x>=hi:return hi
    if x<=lo:return lo
    return int(x)
def signed(x):return (int(x)+(1<<63))%(1<<64)-(1<<63)
def total(parts):return max(signed(sum(parts)),0)&0xffffffff

def model(c,legacy=False):
    k,b,t,w,z,mods,v=c['kills'],c['bosses'],f32(c['seconds']),c['won'],c['zone'],c['mods'],f32(c['veteran'])
    n=cast(div(f32(k),div(f32(mods[0]),100.)),0,0xffffffff)
    rk=mul(f32(n),.1);rt=mul(div(t,60.),12.);rb=mul(f32(b),40.);rv=200. if w else 0.
    factor=add(1.,div(mul(f32(z),1.6),11.))
    raw=add(add(rb,rt),rk) if legacy else add(rb,add(rt,rk))
    base=cast(rnd(mul(factor,add(raw,rv))),0,0xffffffff)
    parts=[cast(rnd(rt),-(1<<63),(1<<63)-1),cast(rnd(rk),-(1<<63),(1<<63)-1),b*40,200 if w else 0]
    parts.append(signed(base-sum(parts)))
    lanes=[mul(div(add(f32(m),-100.),100.),coef)for m,coef in zip(mods,[.05,.4,.6,2.])]
    op=add(add(add(lanes[3],lanes[2]),lanes[1]),lanes[0])if legacy else add(lanes[3],add(lanes[2],add(lanes[1],lanes[0])))
    op=min(add(op,1.),2.)
    parts.append(cast(rnd(mul(add(op,-1.),f32(base))),-(1<<63),(1<<63)-1))
    parts.append(cast(rnd(mul(f32(signed(base+parts[5])),v)),-(1<<63),(1<<63)-1))
    return parts

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--python-libs',type=Path,default=ROOT/'runtime/tool-state/python/armory/python-libs');p.add_argument('--output',type=Path,default=WORK/'native-fixtures.json');p.add_argument('--compact-output',type=Path,default=WORK/'native-fixtures-summary.json');a=p.parse_args()
    out=a.output.resolve();compact=a.compact_output.resolve();assert out.is_relative_to(ROOT) and compact.is_relative_to(ROOT),'Output escapes checkout'
    sys.path.insert(0,str(a.python_libs.resolve()))
    import unicorn
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    import unicorn.x86_const as R
    m = load_script('pe', ROOT/'scripts/inventory-executable.py')
    data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
    pe=m.PE(data);u=Uc(UC_ARCH_X86,UC_MODE_64)
    extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections)
    u.mem_map(pe.image_base,(extent+4095)&~4095)
    for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    mem,stack,done=0x200000000,0x300000000,0x400000000
    u.mem_map(mem,0x30000);u.mem_map(stack,0x10000);u.mem_map(done,4096)
    bp,sp,app,game=stack+0x8000,stack+0xf000,mem+0x1000,mem+0x6000
    ctx={};nins=[0]
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def ret():
        s=u.reg_read(R.UC_X86_REG_RSP);pc=get(s,'<Q')[0];u.reg_write(R.UC_X86_REG_RSP,s+8);u.reg_write(R.UC_X86_REG_RIP,pc)
    def scalar(reg,x):u.reg_write(reg,bits(x))
    def hook(_,at,size,unused):
        nins[0]+=1
        if at in ctx['stops']:u.emu_stop();return
        if ctx['mode']=='xp'and at==0x1458753b0:u.reg_write(R.UC_X86_REG_RAX,ctx['zone']);ret();return
        if ctx['mode']=='xp'and at==0x145bc97b1:
            x=struct.unpack('<f',(u.reg_read(R.UC_X86_REG_XMM0)&0xffffffff).to_bytes(4,'little'))[0];scalar(R.UC_X86_REG_XMM0,rnd(x));ret();return
        if not any(lo<=at<hi for lo,hi in ctx['ranges']):raise RuntimeError(f'Unreviewed execution {at:#x} in {ctx["mode"]}')
    u.hook_add(UC_HOOK_CODE,hook)
    def reset(mode,ranges,stops):
        u.mem_write(mem,bytes(0x30000));u.mem_write(stack,bytes(0x10000));ctx.clear();ctx.update(mode=mode,ranges=ranges,stops=set(stops))
        for name in ['RAX','RBX','RCX','RDX','RSI','RDI','R8','R9','R10','R11','R12','R13','R14','R15']:
            u.reg_write(getattr(R,'UC_X86_REG_'+name),0)
        for i in range(16):u.reg_write(getattr(R,'UC_X86_REG_XMM'+str(i)),0)
        u.reg_write(R.UC_X86_REG_RBP,bp);u.reg_write(R.UC_X86_REG_RSP,sp);u.reg_write(R.UC_X86_REG_EFLAGS,2);u.reg_write(R.UC_X86_REG_MXCSR,0x1f80);put(sp,'<Q',done)
    def run(at):
        u.emu_start(at,0,count=10000);pc=u.reg_read(R.UC_X86_REG_RIP);assert pc in ctx['stops'],f'Instruction budget reached at {pc:#x}';return pc
    cases=[dict(kills=k,bosses=b,seconds=t,won=w,zone=z,mods=mods,veteran=v)for k,b,t,w,z,mods,v in [
      (100,1,60.,False,0,[100]*4,0.),(5,0,2.5,False,0,[100]*4,0.),(100,1,60.,True,0,[100,300,300,150],.4),
      (0,0,0.,False,0,[100]*4,0.),(0xffffffff,0xffffffff,36000.,True,11,[500,500,300,150],1.),
      (100,1,60.,False,0,[100,100,100,0],0.),(1,0,-60.,False,0,[100]*4,0.),
      (0xffffffff,5,1800.,False,11,[0,100,100,100],.2),
      (0,0,375.,False,0,[100,125,110,125],0.),(0,0,125.,False,0,[100,125,120,110],0.),
      (0,0,375.,False,0,[100,150,110,120],0.)]]
    rng=random.Random(105009)
    for _ in range(1536):
        mods=[rng.randrange(100,maxi+1,step)for maxi,step in zip([500,500,300,150],[25,25,10,5])]
        cases.append(dict(kills=rng.choice([rng.randrange(250000),rng.randrange(0x100000000)]),bosses=rng.randrange(0,100),seconds=f32(rng.uniform(0,36000)),won=bool(rng.randrange(2)),zone=rng.randrange(12),mods=mods,veteran=f32(rng.randrange(0,6)*.2)))
    xp=[];different=[]
    for c in cases:
        reset('xp',[(0x1458a1751,0x1458a1a21)],{0x1458a1a21});ctx['zone']=c['zone'];u.reg_write(R.UC_X86_REG_RCX,app);u.reg_write(R.UC_X86_REG_R15,int(c['won']));scalar(R.UC_X86_REG_XMM8,c['seconds'])
        put(app+0x71c,'<I',c['kills']);put(app+0x728,'<I',c['bosses']);put(app+0x2c0,'<4H',*c['mods']);put(app+0x10d0,'<f',f32(c['veteran']))
        run(0x1458a1751);parts=list(get(bp-0x18,'<7q'));expected=model(c);assert parts==expected,(c,parts,expected)
        row=dict(inputs=c,parts=parts,total_xp=total(parts));xp.append(row)
        legacy=model(c,True)
        if legacy!=parts:different.append(dict(inputs=c,native=parts,legacy_reversed_addition=legacy))
    pairs=[]
    arrays=[([12,10,40,200,0,262,210],[0]*7),([24,20,80,200,0,324,259],[12,10,40,200,0,262,210]),([1,1,0,0,-1,0,0],[0]*7),([0]*7,[1]*7),([(1<<63)-1,1,0,0,0,0,0],[0]*7),([0x100000001,0,0,0,0,0,0],[0]*7),([-(1<<63),0,0,0,0,0,0],[(1<<63)-1,0,0,0,0,0,0])]
    arrays.extend((row['parts'],xp[max(0,i-1)]['parts'])for i,row in enumerate(xp[:96]))
    for current,previous in arrays:
        reset('parts',[(0x1459a9b56,0x1459a9cb5)],{0x1459a9cb5});buf=mem+0x10000;iterator=mem+0x11000;cur=mem+0x12000;prev=mem+0x13000;output=mem+0x14000
        put(cur,'<7q',*current);put(prev,'<7q',*previous);put(iterator,'<QQQQ',cur,prev,0,7)
        for reg,val in [(R.UC_X86_REG_RAX,buf),(R.UC_X86_REG_RCX,output),(R.UC_X86_REG_RDX,iterator),(R.UC_X86_REG_RSI,0),(R.UC_X86_REG_R14,7),(R.UC_X86_REG_R13,7)]:u.reg_write(reg,val)
        run(0x1459a9b56);outpairs=[get(buf+i*16,'<Qq')for i in range(7)];delta=[signed(a-b)for a,b in zip(current,previous)];assert outpairs==list(enumerate(delta));assert get(output,'<QQQ')==(7,buf,7)
        reset('sum',[(0x1458a1ac6,0x1458a1b7f)],{0x1458a1b7f});put(buf,'<14q',*(val for i,d in enumerate(delta)for val in [i,d]));put(bp-0x18,'<7q',*current)
        for reg,val in [(R.UC_X86_REG_R14,7),(R.UC_X86_REG_R15,buf),(R.UC_X86_REG_RDI,app+0x1058)]:u.reg_write(reg,val)
        run(0x1458a1ac6);award=get(bp+0x134,'<I')[0];assert award==total(delta);assert get(app+0x1058,'<7q')==tuple(current)
        pairs.append(dict(current=current,previous=previous,delta=delta,awarded_xp=award))
    counts=[]
    for cur,prev,old in [([10,20,2,1,4],[0]*5,[0]*5),([20,50,3,2,6],[10,20,2,1,4],[100]*5),([0]*5,[0xffffffff]*5,[17]*5),([0xffffffff]*5,[0]*5,[MASK-1]*5),([3,2,1,0,99],[4,1,2,0,90],[10,MASK,30,40,50])]:
        reset('counts',[(0x1458983c6,0x14589849f)],{0x14589849f});u.reg_write(R.UC_X86_REG_RSI,app)
        for reg,val in zip([R.UC_X86_REG_RDI,R.UC_X86_REG_R14,R.UC_X86_REG_R15,R.UC_X86_REG_R12,R.UC_X86_REG_R13],cur):u.reg_write(reg,val)
        put(app+0x10d4,'<5I',*prev)
        for off,val in zip([0xc60,0xc68,0xc70,0xc78,0xc90],old):put(app+off,'<Q',val)
        run(0x1458983c6);after=[get(app+off,'<Q')[0]for off in [0xc60,0xc68,0xc70,0xc78,0xc90]];delta=[max(a-b,0)for a,b in zip(cur,prev)]
        assert after==[min(MASK,a+b)for a,b in zip(old,delta)];assert get(app+0x10d4,'<5I')==tuple(cur);counts.append(dict(current=cur,previous=prev,saved_before=old,delta=delta,saved_after=after))
    continuation=[]
    for phase in range(7):
      for elapsed in [0.,300.,1800.25,36000.]:
        reset('continue',[(0x1458f0110,0x1458f017a)],{0x1458f017a,0x1458f026a});u.reg_write(R.UC_X86_REG_RCX,game)
        u.mem_write(game,bytes((i*37+11)%256 for i in range(0x2000)));put(game+0xa73,'<B',phase);put(game+0xa64,'<B',0);put(game+0x9ec,'<f',elapsed);before=bytes(u.mem_read(game,0x2000));pc=run(0x1458f0110);after=bytes(u.mem_read(game,0x2000));expected=bytearray(before)
        if phase==5:expected[0xa64]=1;expected[0xa73]=1;struct.pack_into('<f',expected,0xa3c,add(elapsed,300.));assert pc==0x1458f017a
        else:assert pc==0x1458f026a
        assert after==bytes(expected);continuation.append(dict(phase=phase,elapsed=elapsed,admitted=phase==5,next_boss_bits=f'{get(game+0xa3c,"<I")[0]:08x}',preserved_other_game_bytes=True))
    abandon=[]
    for phase in range(7):
      for count in [0,2]:
        reset('abandon',[(0x14591d4c0,0x14591d5d8)],{0x14591d513,0x14591d553,done});u.reg_write(R.UC_X86_REG_RCX,game)
        u.mem_write(game,bytes((i*53+7)%256 for i in range(0x2000)));put(game+0xa73,'<B',phase);put(game+0x610,'<Q',count);put(game+0x608,'<Q',mem+0x10000);put(game+0x9ec,'<f',900.25);before=bytes(u.mem_read(game,0x2000));pc=run(0x14591d4c0);after=bytes(u.mem_read(game,0x2000));expected=bytearray(before)
        admitted=phase in [1,2,3]
        if admitted:
            struct.pack_into('<Q',expected,0x610,0)
            if count:assert pc==0x14591d513
            else:
                assert pc==0x14591d553;expected[0xa71]=255;expected[0xa63]=1;expected[0xa73]=4;struct.pack_into('<If',expected,0x930,1,900.25)
        else:assert pc==done;assert u.reg_read(R.UC_X86_REG_RAX)&255==0
        assert after==bytes(expected);abandon.append(dict(phase=phase,choices=count,admitted=admitted,stop=hex(pc),preserved_other_game_bytes=True))
    # The second tick teleport writer belongs to opt-in sink-test injection,
    # not an ordinary gameplay relocation. Check its native default and exact
    # gate before excluding it from the normal player-mover producer path.
    reset('sink-default',[(0x145900d5f,0x145900d69)],{0x145900d69})
    put(bp+0x978,'<I',0xffffffff)
    run(0x145900d5f)
    assert get(bp+0x978,'<I')[0]==0  # Game is constructed at RBP+0x30.
    sink_gate=[]
    for enabled in [0,1,2]:
      for deadline in [-1.,0.,2.,math.inf,math.nan]:
        reset('sink-gate',[(0x1459021c8,0x1459021fa)],{0x1459021fa,0x145902512})
        u.reg_write(R.UC_X86_REG_R13,game);scalar(R.UC_X86_REG_XMM7,1.)
        put(game+0x948,'<I',enabled);put(game+0x94c,'<f',5.);put(game+0xa50,'<f',deadline);put(game+0x548,'<I',1)
        before=get(game+0xa50,'<I')[0];pc=run(0x1459021c8)
        # UCOMISS/JA skips only an ordered future deadline; NaN enters when
        # the explicit enable flag is one. Ghidra's <= expression loses this.
        admitted=enabled==1 and not deadline>1.
        assert pc==(0x1459021fa if admitted else 0x145902512)
        after=get(game+0xa50,'<I')[0]
        assert after==(bits(6.) if admitted else before)
        assert get(game+0x548,'<I')[0]==1
        sink_gate.append(dict(enabled=enabled,deadline_bits=f'{before:08x}',admitted=admitted,next_deadline_bits=f'{after:08x}',counter_preserved=True))
    ranges=[(0x1458a1751,0x1458a1a21),(0x1459a9b56,0x1459a9cb5),(0x1458a1ac6,0x1458a1b7f),(0x1458983c6,0x14589849f),(0x1458f0110,0x1458f017a),(0x14591d4c0,0x14591d5d8),(0x145900d5f,0x145900d69),(0x1459021c8,0x1459021fa)]
    spans=[]
    for lo,hi in ranges:
        at=pe.rva_offset(lo-pe.image_base);spans.append(dict(start=hex(lo),end_exclusive=hex(hi),file_offset=hex(at),sha256=hashlib.sha256(data[at:at+hi-lo]).hexdigest()))
    result=dict(target_version='0.105.0',target_sha256=SHA,target_executed=False,method='Bounded original-instruction Unicorn replay, compared with Python transcription aligned to changed source; no Rust compilation/execution.',unicorn=unicorn.__version__,spans=spans,counts=dict(xp=len(xp),xp_order_regressions=len(different),part_deltas_and_checkpoints=len(pairs),count_deltas=len(counts),continuation=len(continuation),abandon=len(abandon),total=len(xp)+len(pairs)+len(counts)+len(continuation)+len(abandon),executed_instructions=nins[0]),xp=xp,xp_order_examples=different[:12],part_deltas_and_checkpoints=pairs,count_deltas=counts,continuation=continuation,abandon=abandon,seams=['XP zone-index resolver1458753b0 returns explicitly supplied index; native density normalization executes before it.','CRT roundf145bc97b1 supplied C99 ties-away behavior on f32 arguments, including declared nonfinite cases.','Part-difference output buffer preallocated; replay starts after allocation1459a9b56.','Continue stops before first packet builder1458f017a; abandon count0 stops before syncpause14591d553, count>0 stops at first choice destructor14591d513.'],limits=['No compiler, Rust execution, game process, live UI or native CRT execution; source/platform parity unverified.','Action preservation claims cover Game bytes through stated pre-call stops; destructor, packet, localization, queue publication and allocator effects not executed.','No unreviewed callee is stubbed or silently skipped; unknown executed address raises an error.'])
    result['counts']['sink_gate']=len(sink_gate)
    result['counts']['total']+=len(sink_gate)
    result['sink_gate']=sink_gate
    result['seams'].append('Sink-test checks stop before environment lookup1459021fa; native default Game948=0 executes separately. No test injection, floor query or teleport is executed.')
    out.parent.mkdir(parents=True,exist_ok=True);out.write_text(json.dumps(result,indent=2,allow_nan=False)+'\n')
    summary={k:result[k] for k in ['target_version','target_sha256','target_executed','method','unicorn','spans','counts','seams','limits']}
    summary.update(regeneration='python3 scripts/recover-terminal-contracts.py',xp_selected_cases=xp[:11],xp_order_examples=different[:5],delta_boundaries=pairs[:7],counter_boundaries=counts,continuation_and_abandon_cases=dict(continuation=continuation,abandon=abandon))
    summary['sink_gate']=sink_gate
    compact.parent.mkdir(parents=True,exist_ok=True);compact.write_text(json.dumps(summary,indent=2,allow_nan=False)+'\n')
    print(json.dumps(result['counts'],sort_keys=True));print(out.relative_to(ROOT));print(compact.relative_to(ROOT))
if __name__=='__main__':main()

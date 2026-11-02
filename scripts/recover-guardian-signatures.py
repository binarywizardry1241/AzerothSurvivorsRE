#!/usr/bin/env python3
"""Recover selected current guardian signatures; check native instructions without compilation."""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
OUT = ROOT / 'docs/analysis/evidence/0.109.0/guardian-signatures'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/guardians/signature_catalog.rs'
RANGES = {
    'selector': (0x14588d220, 0x14588d582),
    'decision': (0x145899e70, 0x14589a216),
    'selection-constructor': (0x14593e120, 0x14593e4ab),
    'phase-gates': (0x145979b20, 0x145979ce0),
    'scheduler': (0x14597a230, 0x14597a491),
    'zone-health-inputs': (0x14599c230, 0x14599c297),
    'zone-enemy-inputs': (0x14599c612, 0x14599c67a),
    'phase-emote-producer': (0x14597c453, 0x14597c47a),
    'phase-emote-kind': (0x1458c12b0, 0x1458c12ba),
}

def f32(x):
    return _shared_f32(x)
def bits(x):
    return _shared_bits(x)
def text_json(x): return json.dumps(x, ensure_ascii=False)

def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--write', action='store_true')
    ap.add_argument('--check', action='store_true', help='Check retained evidence/source without writing (the default)')
    ap.add_argument('--prepare-rea', action='store_true', help='Stage current raw slices/plans under runtime without running REA')
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Recover the changed installed target before reusing these addresses'
    data = target_bytes(target)
    mod = load_script('guardian_pe', ROOT/'scripts/inventory-executable.py'); pe = mod.PE(data)
    def raw(a, n):
        o = pe.rva_offset(a-pe.image_base); v = data[o:o+n]; assert len(v)==n; return v
    def span(a,n):
        v=raw(a,n); return dict(va=hex(a),file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=n,sha256=hashlib.sha256(v).hexdigest(),hex=v.hex())
    def string(a):
        p,n=struct.unpack('<QQ',raw(a,16)); assert n<4096; return raw(p,n).decode()
    if args.prepare_rea:
        work=ROOT/'runtime/guardian-mechanics-0.109.0';work.mkdir(parents=True,exist_ok=True)
        disabled='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'
        for role in ['selector','decision','scheduler']:
            a,b=RANGES[role];path=work/(role+'.bin');path.write_bytes(raw(a,b-a))
            plan=dict(target=str(path.relative_to(ROOT)),output=str((work/('rea-'+role)).relative_to(ROOT)),init_timeout=60,timeout=240,
                environment={'REA_GHIDRA_DISABLED_ANALYZERS':disabled},open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(a)))])
            (work/(role+'-plan.json')).write_text(json.dumps(plan,indent=2)+'\n')
        print(work.relative_to(ROOT));return
    def moves(p,n):
        assert n<32
        return [dict(slot=i,tag=raw(p+56*i,56)[45],words=list(struct.unpack('<14I',raw(p+56*i,56))),record=span(p+56*i,56)) for i in range(n)]
    rows=[]
    for i in range(37):
        a=0x146be71d8+56*i
        p,n,alts,na,ph,np,identity=struct.unpack('<7Q',raw(a,56))
        variants=[moves(p,n)]
        for j in range(na):
            q,c=struct.unpack('<QQ',raw(alts+16*j,16));variants.append(moves(q,c))
        phases=[]
        for j in range(np):
            at=ph+72*j;v=raw(at,72);w=list(struct.unpack('<18I',v))
            phases.append(dict(index=j,tag=v[61],yell=string(at),words=w,record=span(at,72)))
        rows.append(dict(enemy_id=identity,record=span(a,56),alternatives=span(alts,na*16) if na else None,variants=variants,phases=phases))
    assert len({r['enemy_id'] for r in rows})==37
    sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
    from unicorn import x86_const as x
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    ranges=[]
    def keep(path,value):
        if args.write:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
        else:assert path.read_text()==value, path
    for role,(a,b) in RANGES.items():
        v=raw(a,b-a);ins=list(md.disasm(v,a));assert sum(i.size for i in ins)==len(v),role
        asm=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
        keep(OUT/(role+'.asm'),asm);ranges.append(dict(role=role,**{k:v for k,v in span(a,b-a).items() if k!='hex'},end_exclusive=hex(b),assembly=role+'.asm'))
    uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set();mem=0x200000000;uc.mem_map(mem,0x100000)
    def demand(machine,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    put=lambda a,f,*v:uc.mem_write(a,struct.pack('<'+f,*v))
    get=lambda a,f:struct.unpack('<'+f,uc.mem_read(a,struct.calcsize('<'+f)))
    sx=lambda reg,v:uc.reg_write(reg,bits(v))
    endpoints=set();allowed=(0,0)
    def hook(machine,a,size,user):
        if a in endpoints:uc.emu_stop();return
        assert allowed[0]<=a<allowed[1],hex(a)
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a));assert ins.mnemonic!='call',hex(a)
    uc.hook_add(UC_HOOK_CODE,hook)
    def run(a,b,stops):
        nonlocal allowed,endpoints
        allowed=(a,b);endpoints=set(stops);uc.reg_write(x.UC_X86_REG_EFLAGS,2);uc.reg_write(x.UC_X86_REG_MXCSR,0x1f80);uc.emu_start(a,0,count=10000);assert uc.reg_read(x.UC_X86_REG_RIP) in endpoints
    count=0;stop=mem+0xff000
    ids={r['enemy_id']:int(r['record']['va'],16) for r in rows}
    for identity in range(0,1600):
        put(mem,'Q',stop);uc.reg_write(x.UC_X86_REG_RSP,mem);uc.reg_write(x.UC_X86_REG_RCX,identity);run(*RANGES['selector'],[stop]);assert uc.reg_read(x.UC_X86_REG_RAX)==ids.get(identity,0),identity;count+=1
    # Native call-free reset lanes: phase latch/original move owner restore,
    # followed by the original scalar initial-timer loop and final state clear.
    actor=mem+0x10000;movebuf=mem+0x20000;timerbuf=mem+0x30000
    for row in rows:
      for variant in row['variants']:
        uc.mem_write(actor,bytes(0x200));put(actor+0x70,'QQ',movebuf,len(variant));put(actor+0xa4,'I',0xffffffff)
        uc.reg_write(x.UC_X86_REG_RCX,actor);run(0x145899f39,0x145899f69,[0x145899f69])
        assert get(actor+0xa4,'I')[0]==0 and get(actor+0x80,'QQ')==(movebuf,len(variant))
        for j,v in enumerate(variant):uc.mem_write(movebuf+j*56,bytes.fromhex(v['record']['hex']))
        uc.reg_write(x.UC_X86_REG_R14,len(variant));uc.reg_write(x.UC_X86_REG_R15,movebuf);uc.reg_write(x.UC_X86_REG_RDI,timerbuf)
        run(0x145899fc4,0x14589a08e,[0x14589a107]);assert get(timerbuf,f'{len(variant)}I')==tuple(bits(f32(struct.unpack('<f',struct.pack('<I',v['words'][12]))[0]*f32(.5))) for v in variant);count+=1
    # The constructor always performs the original RNG rejection draw. Check
    # its resulting state and every high-six-bit variant input independently.
    for seed in range(1,33):
        state=[seed,seed+11,seed+23,seed+37]
        expected=state[:]
        while True:
            a,b,c,d=expected; mask=(1<<64)-1
            rotate=lambda value,n:((value<<n)|(value>>(64-n)))&mask
            value=(rotate((a+d)&mask,23)+a)&mask
            shift=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=shift;d=rotate(d,45)
            expected=[a,b,c,d]
            if not value&(1<<57):break
        for reg,v in zip([x.UC_X86_REG_R9,x.UC_X86_REG_RDX,x.UC_X86_REG_RAX,x.UC_X86_REG_R8],state):uc.reg_write(reg,v)
        run(0x14593e130,0x14593e15c,[0x14593e15c])
        assert [uc.reg_read(reg) for reg in [x.UC_X86_REG_R9,x.UC_X86_REG_RDX,x.UC_X86_REG_RAX,x.UC_X86_REG_R8]]==expected
        assert uc.reg_read(x.UC_X86_REG_R13)==value
        count+=1
    for high in range(64):
        for alternatives in [0,3]:
            uc.reg_write(x.UC_X86_REG_R9,alternatives);uc.reg_write(x.UC_X86_REG_R13,high<<58)
            run(0x14593e1c7,0x14593e1ec,[0x14593e1ec])
            assert uc.reg_read(x.UC_X86_REG_R13)==high%(alternatives+1)
            count+=1
    # Strict phase thresholds and one-shot latches, with native MAXSS's numeric
    # maximum operand. Allocation/queue writes are deliberately outside the span.
    phasebuf=mem+0x40000;header=mem+0x41000
    for row in rows:
      for phase in row['phases']:
        threshold=struct.unpack('<f',struct.pack('<I',phase['words'][16]))[0]
        for health in [threshold*100.,threshold*100.-.01,threshold*100.+.01,float('nan')]:
         for used in [False,True]:
            uc.mem_write(actor,bytes(0x200));uc.mem_write(phasebuf,bytes.fromhex(phase['record']['hex']))
            put(header+0x20,'QQ',phasebuf,1);put(actor+0xa4,'I',int(used))
            uc.reg_write(x.UC_X86_REG_RBX,header);uc.reg_write(x.UC_X86_REG_R14,actor);uc.reg_write(x.UC_X86_REG_RDX,1);uc.reg_write(x.UC_X86_REG_R8,1);uc.reg_write(x.UC_X86_REG_RAX,0x40);uc.reg_write(x.UC_X86_REG_RDI,0)
            sx(x.UC_X86_REG_XMM10,health);sx(x.UC_X86_REG_XMM1,100.)
            run(0x145979b7d,0x145979bdf,[0x145979ba0,0x145979bdf])
            admitted=not used and f32(f32(health)/100.)<threshold
            assert (uc.reg_read(x.UC_X86_REG_RIP)==0x145979bdf)==admitted
            assert get(actor+0xa4,'I')[0]==int(used or admitted)
            count+=1
    # Exact tag admission/gate/repeat instructions; unknown tags are included
    # so their blocking ownership cannot accidentally admit a later known move.
    bp=mem+0x50000;queue=mem+0x60000;timer=mem+0x70000
    for tag in range(36):
      normalized=tag-3 if tag>=3 else 29;nonblocking=normalized<32 and bool(0xa0180006>>normalized&1)
      for cast in [False,True]:
       for queued_tag in [None,4,5,6,19,22]:
        put(bp+0x230,'QQ',queue,int(queued_tag is not None));put(bp+0x220,'Q',77);put(queue,'Q',77);put(queue+0x35,'B',queued_tag or 0)
        uc.reg_write(x.UC_X86_REG_RBP,bp);uc.reg_write(x.UC_X86_REG_RAX,timer);uc.reg_write(x.UC_X86_REG_R13,tag)
        sx(x.UC_X86_REG_XMM9,2. if cast else 0.);sx(x.UC_X86_REG_XMM6,1.);sx(x.UC_X86_REG_XMM0,10.);sx(x.UC_X86_REG_XMM10,.7)
        run(0x14597a31b,0x14597a491,[0x14597a2ad,0x14597a3a8])
        queued_blocking=queued_tag is not None and queued_tag not in [4,5,22,23,32,34]
        admitted=nonblocking or (not cast and not queued_blocking)
        assert (uc.reg_read(x.UC_X86_REG_RIP)==0x14597a3a8)==admitted,(tag,cast,queued_tag)
        if admitted:assert get(timer,'I')[0]==bits(f32(10.*f32(.7)))
        count+=1
    # Explicit source tracing is separate from execution of the native fragments.
    state=(ROOT/'crates/azeroth-survivors-re/src/guardians/signatures.rs').read_text()
    integration=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs').read_text()
    constructor=(ROOT/'crates/azeroth-survivors-re/src/guardians/mod.rs').read_text()
    for token in ['0xa018_0006_u32','row.cooldown * 0.5','self.phases_used = 0','ratio < phase.threshold',
                  'maximum * 0.3 > health','self.cast_until > now','value & (1 << 57)','choose_variant(enemy_id, || rng.next_u64())']:
        assert token in state,token
    for token in ['spawn_due_with_signatures','spawn.signature_variant.expect','guardian.raid.advance(',
                  'guardian.raid.reset()','self.boss_state.pending_actions.extend(due)','RunAnnouncement::emote(']:
        assert token in integration,token
    assert 'advance_cooldowns(' not in integration and 'GuardianCombat' not in integration
    assert 'signatures::choose_variant(definition.id, || rng.next_u64())' in constructor
    assert constructor.index('let facing = rng.range_f32') < constructor.index('let signature_variant = current_signatures.then') < constructor.index('port.create_guardian(GuardianSpawn')
    provenance=json.loads((OUT/'rea-provenance.json').read_text())
    assert provenance['target_sha256']==SHA
    for operation in provenance['operations']:
        a,b=RANGES[operation['role']]
        assert operation['input_sha256']==hashlib.sha256(raw(a,b-a)).hexdigest()
        assert hashlib.sha256((OUT/operation['pseudocode']).read_bytes()).hexdigest()==operation['pseudocode_sha256']
    manifest=dict(target_version=target['version'],target_sha256=SHA,target_executed=False,ranges=ranges,
        native_cases=count,limitations=['Native calls are rejected in all instruction cases; synthetic state only.',
        'Source connections are generated independently by connect-raid-mechanics.py; remaining native actions retain gap42.',
        'The complete guardian encounter, spawn/scaling dependencies, compilation and original/rebuilt parity are unverified.'])
    catalog=dict(target_version=target['version'],target_sha256=SHA,table={k:v for k,v in span(0x146be71d8,37*56).items() if k!='hex'},rows=rows)
    keep(OUT/'catalog.json',json.dumps(catalog,indent=2)+'\n');keep(OUT/'manifest.json',json.dumps(manifest,indent=2)+'\n')
    import subprocess
    subprocess.run([sys.executable,'-B',str(ROOT/'scripts/connect-raid-mechanics.py'),*(['--write'] if args.write else [])],check=True,cwd=ROOT)
    print(f'Guardian signatures: 37 IDs, {sum(len(v) for r in rows for v in r["variants"])} moves, {sum(len(r["phases"]) for r in rows)} phases; {count} bounded native cases.')
if __name__=='__main__':main()

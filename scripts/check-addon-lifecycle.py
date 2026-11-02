#!/usr/bin/env python3
"""Check selected native addon cache initialization/reset and poll-clock lifetime.

No compilation or game. Only selected unchanged instructions execute. The
constructor starts after its save-state copy; deallocation is a recorded seam.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
EVIDENCE = ROOT/"docs/analysis/evidence/0.109.0/addon-bridge"
RANGES = {
    "server-cache-init": (0x1458AD22F,0x1458AD4F1),
    "again-cache-reset": (0x1458BCC0E,0x1458BCF0D),
    "login-cache-reset": (0x1458B4313,0x1458B461A),
}
POLL = (0x1458AF477,0x1458AF499)


def encoded(value):
    return json.dumps(value,indent=2,allow_nan=False)+"\n"


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write",action="store_true")
    parser.add_argument("--prepare-rea",action="store_true")
    args=parser.parse_args()
    target=latest_target(verify=True)
    assert target["sha256"]==SHA
    data=target_bytes(target)
    module = load_script("lifecycle_pe", ROOT/"scripts/inventory-executable.py")
    pe=module.PE(data)
    extents={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    def raw(address,size):
        at=pe.rva_offset(address-pe.image_base)
        return data[at:at+size]
    def record(role,a,b):
        return dict(role=role,va=hex(a),file_offset=hex(pe.rva_offset(a-pe.image_base)),
                    byte_count=b-a,sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
    rea=json.loads((EVIDENCE/"lifecycle-rea.json").read_text())
    assert rea["target_sha256"]==SHA
    lo=min(int(row["va"],16) for row in rea["owners"])
    hi=max(int(row["end"],16) for row in rea["owners"])
    carrier=bytearray(hi-lo)
    for row in rea["owners"]:
        a,b=int(row["va"],16),int(row["end"],16)
        assert extents[a]==b and row["size"]==b-a
        assert pe.rva_offset(a-pe.image_base)==int(row["file_offset"],16)
        blob=raw(a,b-a);assert hashlib.sha256(blob).hexdigest()==row["sha256"]
        carrier[a-lo:b-lo]=blob
    assert hashlib.sha256(carrier).hexdigest()==rea["raw_subject_sha256"]
    def call(site,target):
        blob=raw(site,5)
        assert blob[0]==0xE8 and site+5+struct.unpack("<i",blob[1:])[0]==target
    call(0x145891610,0x1458D05C0)
    call(0x1458D05FD,0x1458ACFF0)
    call(0x1458AC963,0x1458AD720)
    call(0x1458BCBD8,0x1458BDF90)
    call(0x1458B42D8,0x1458BDF90)
    for table,index,target in [(0x146BEDD3C,4,0x1458BBC5E),(0x146BEC598,7,0x1458B28C0)]:
        assert table+struct.unpack("<i",raw(table+index*4,4))[0]==target
    if args.prepare_rea:
        work=ROOT/"runtime/addon-bridge-0.109.0/lifecycle/reproduce-rea"
        work.mkdir(parents=True,exist_ok=True)
        (work/"owners.bin").write_bytes(carrier)
        (work/"seeds.tsv").write_text("".join(f"{row['va']}\tfunction\n{row['va']}\tcode\n" for row in rea["owners"]))
        plan=dict(target=str((work/"owners.bin").relative_to(ROOT)),
            output=str((work/"rea").relative_to(ROOT)),init_timeout=60,timeout=240,
            environment={"REA_GHIDRA_SEED_FILE":str((work/"seeds.tsv").relative_to(ROOT))},
            open_options=dict(format="raw-binary",architecture="x86_64",entry_point=hex(lo)),
            operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=row["va"]),label=row["role"])
                        for row in rea["owners"]])
        (work/"plan.json").write_text(encoded(plan));print((work/"plan.json").relative_to(ROOT));return
    sys.path[:0]=[str(ROOT/"runtime/camera-recovery-0.105.0/python-libs"),
                  str(ROOT/"runtime/armory-recovery/python-libs")]
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    import capstone
    md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    class Probe:
        def __init__(self):
            self.u=Uc(UC_ARCH_X86,UC_MODE_64)
            for address,size in [(0x20000000,0x20000),(0x30000000,0x2000),(0x31000000,0x1000)]:
                self.u.mem_map(address,size)
            self.u.mem_write(0x30000000,b"\xa5"*0x2000)
            self.u.reg_write(r.UC_X86_REG_RBP,0x20001000)
            self.u.reg_write(r.UC_X86_REG_RSP,0x20010000)
            self.u.reg_write(r.UC_X86_REG_RSI,0x30000000)
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED,self.missing)
            self.u.hook_add(UC_HOOK_CODE,self.hook)
            self.stop=0;self.freed=[];self.admitted=None
        def missing(self,uc,access,address,size,value,_):
            page=address&~4095;uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));return True
        def q(self,offset):return struct.unpack("<Q",self.u.mem_read(0x30000000+offset,8))[0]
        def put(self,offset,value):self.u.mem_write(0x30000000+offset,struct.pack("<Q",value))
        def clock(self):return struct.unpack("<d",self.u.mem_read(0x300010E0,8))[0]
        def hook(self,uc,address,size,_):
            if address==self.stop or address==0x1458B0501:
                self.admitted=address==POLL[1];uc.emu_stop();return
            if address==0x1400021D0:
                self.freed.append((uc.reg_read(r.UC_X86_REG_RCX),uc.reg_read(r.UC_X86_REG_RDX)))
                sp=uc.reg_read(r.UC_X86_REG_RSP)
                dest=struct.unpack("<Q",uc.mem_read(sp,8))[0]
                uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,dest);return
            assert any(a<=address<b for a,b in [*RANGES.values(),POLL]),hex(address)
        def run(self,span):
            self.stop=span[1];self.u.emu_start(span[0],0,count=1000)
        def slots(self):return [[self.q(a+i) for i in (0,8,16)] for a in range(0xD60,0xEE0,24)]
        def seed(self):
            for index,a in enumerate(range(0xD60,0xEE0,24)):
                for offset,value in [(0,16),(8,0x31000000+index*32),(16,4)]:self.put(a+offset,value)
            self.u.mem_write(0x300010E0,struct.pack("<d",.2));self.put(0x10E8,77)
        def poll(self,now,game):
            self.u.reg_write(r.UC_X86_REG_RSI,0x30000000)
            self.u.reg_write(r.UC_X86_REG_XMM6,int.from_bytes(struct.pack("<d",now),"little"))
            self.put(0x10,game);self.run(POLL)
            return self.admitted,self.clock()
    cases=[]
    ctor=Probe();ctor.run(RANGES["server-cache-init"])
    assert ctor.slots()==[[0,1,0]]*16 and ctor.clock()==0 and ctor.q(0x10E8)==0
    cases.append(dict(kind="constructor",slots=ctor.slots(),polled_at=ctor.clock(),target=ctor.q(0x10E8)))
    for role in ("again-cache-reset","login-cache-reset"):
        probe=Probe();probe.seed();probe.run(RANGES[role])
        expected=[[16,0x31000000,0]]+[[0,1,0]]*15
        assert probe.slots()==expected and probe.clock()==.2 and probe.q(0x10E8)==0
        assert len(probe.freed)==15 and probe.freed==[(0x31000000+i*32,16) for i in range(1,16)]
        cases.append(dict(kind=role,slots=probe.slots(),polled_at=probe.clock(),target=probe.q(0x10E8),released_strings=len(probe.freed)))
    for now,game,admitted,expected_clock in [(.125,2,False,0),(.2,2,True,.2),(.25,0,False,.2),(.4,0,True,.4)]:
        actual,clock=ctor.poll(now,game)
        assert (actual,clock)==(admitted,expected_clock)
        cases.append(dict(kind="continuous-poll",now=now,game_discriminant=game,admitted=actual,polled_at=clock))
    # The current gate stores before testing Game's absent discriminant.
    assert raw(POLL[1],6)==bytes.fromhex("837e10027474")
    source=(ROOT/"crates/azeroth-survivors-re/src/gameplay/client/addon_feed.rs").read_text()
    idle=source.split("pub fn idle(",1)[1].split("    }",1)[0]
    assert "self.cached.clear();" not in idle and "self.poll_due(now);" in idle
    assert "self.identity =" not in idle and "Self::default()" not in idle
    due=source.split("pub fn due(",1)[1].split("fn poll_due(",1)[0]
    assert due.index("self.cached.clear();")<due.index("self.poll_due(now)")
    assert "return true" not in due and "self.polled_at =" not in due
    client=(ROOT/"crates/azeroth-survivors-re/src/gameplay/client.rs").read_text()
    absent=client.split("let Some(game) = session.mechanics.as_ref().filter",1)[1]
    assert absent.index("state.addon.idle(input.ui_time);")<absent.index("if menu.entering && client.active")
    value=dict(target_sha256=SHA,native_ranges=[record(role,*span) for role,span in RANGES.items()],
        shared_poll_evidence="manifest.json#poll-gate",cases=cases,
        seams=["Constructor begins after save-state copy; unrelated stack fields are zero.","String deallocation is recorded without executing the allocator."],
        limits=["Fresh native server/run cache writers and cadence are bounded; no game or reconstructed Rust executes.","ReloadUI registration/cache and terminal queue ownership are covered by producer-rea.json and producer-cases.json; runtime interaction and parity remain unverified."])
    for role,(a,b) in RANGES.items():
        text="\n".join(f"{i.address:x}: {i.mnemonic:9s} {i.op_str}" for i in md.disasm(raw(a,b-a),a))+"\n"
        path=EVIDENCE/(role+".asm")
        if args.write:path.write_text(text)
        else:assert path.read_text()==text
    path=EVIDENCE/"lifecycle-cases.json"
    if args.write:path.write_text(encoded(value))
    else:assert json.loads(path.read_text())==value
    print(f"Verified current server constructor, Again/login cache resets, 15 releases per reset, idle/new-run poll cadence and source wiring ({len(cases)} native cases); no compilation or game execution")


if __name__=="__main__":main()

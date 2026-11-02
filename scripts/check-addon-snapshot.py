#!/usr/bin/env python3
"""Check current addon countdown/poll contracts without compilation or a game.

Executes only unchanged selected native instruction ranges in Unicorn. The
zone-key lookup is an explicit index-zero host seam; memory holds actual
selected EXE bytes. No allocation, game process or rebuilt Rust executes.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
WORK = ROOT / "runtime/addon-bridge-0.109.0"
EVIDENCE = ROOT / "docs/analysis/evidence/0.109.0/addon-bridge"
OWNERS = {
    "poll": 0x1458AD720, "packet": 0x1458C35D0,
    "stats": 0x14591D8A0, "zone": 0x145918690, "run": 0x145917730,
    "bosses": 0x14591B210, "units": 0x145919B40, "debuffs": 0x14591A430,
    "target": 0x145919FE0, "spells": 0x145919EB0, "buffs": 0x145919580,
    "meters": 0x1459A79A0, "chests": 0x145919D70, "lairs": 0x1459196A0,
    "taken": 0x145919820, "end": 0x145916C10,
}
RANGES = {
    "run-countdown": (0x145917730, 0x14591781D),
    "poll-gate": (0x1458AF477, 0x1458AF499),
    "changed-payload": (0x1458B031C, 0x1458B0368),
    "packet-header": (0x1458C363B, 0x1458C3678),
}


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False, allow_nan=False) + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="retain compact checked evidence")
    parser.add_argument("--prepare-rea", action="store_true", help="stage a reproducible static Ghidra plan")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Changed selected target requires fresh recovery"
    data = target_bytes(target)
    module = load_script("addon_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    extents = {pe.image_base+a: pe.image_base+b for a,b,_ in pe.functions()}

    def raw(address, size):
        at = pe.rva_offset(address-pe.image_base)
        value = data[at:at+size]
        assert len(value) == size
        return value

    def record(role, address, size):
        return dict(role=role, va=hex(address), file_offset=hex(pe.rva_offset(address-pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(raw(address,size)).hexdigest())

    api = json.loads((ROOT / "docs/analysis/evidence/0.109.0/discovery-leads.json").read_text())["embedded_addon_api"]
    assert raw(int(api["range"]["virtual_address"],16), api["range"]["byte_count"]) == (ROOT/api["path"]).read_bytes()
    # Current producers use the same ordered stream names and poll duration.
    order = ["AZS", "AZSZONE", "AZSRUN", "AZSBOSSES", "AZSUNITS", "AZSDEBUFFS", "AZSTGT", "AZSSPELLS", "AZSBUFFS", "AZSMETER", "AZSHEAL", "AZSBOSSDMG", "AZSCHESTS", "AZSLAIRS", "AZSTAKEN", "AZSEND"]
    assert raw(0x146BEBEB0, sum(map(len,order))) == "".join(order).encode()
    assert struct.unpack("<d",raw(0x146BEBC78,8))[0] == .2
    assert raw(0x146BEC360,5) == bytes.fromhex("c00109c000")

    # The scalar adapter's retained API-only metadata is current for these fields.
    def pair(address):
        pointer, size = struct.unpack("<QQ",raw(address,16))
        assert size < 10000
        return raw(pointer,size).decode()
    old = json.loads((ROOT/"crates/azeroth-survivors-re/assets/addon-zones-0.105.0.json").read_text())
    for index, expected in enumerate(old):
        address = 0x146BDE390 + index*240
        bosses, count = struct.unpack("<QQ",raw(address+0x88,16))
        actual = dict(key=pair(address+8), name=pair(address+24), subtitle=pair(address+40),
            map_id=struct.unpack("<I",raw(address+0xC0,4))[0],
            area_id=struct.unpack("<I",raw(address+0xC4,4))[0],
            center=list(struct.unpack("<ff",raw(address+0xC8,8))),
            difficulty_f32=struct.unpack("<f",raw(address+0xE0,4))[0],
            bosses=[dict(id=struct.unpack("<I",raw(bosses+i*104+64,4))[0],
                name=pair(bosses+i*104), at_minutes_f32=struct.unpack("<f",raw(bosses+i*104+80,4))[0],
                final=bool(raw(bosses+i*104+100,1)[0])) for i in range(count)])
        assert actual == expected, expected["key"]
    assert len(old) == 12

    if args.prepare_rea:
        work = WORK / "reproduce-rea"
        work.mkdir(parents=True,exist_ok=True)
        lo, hi = min(OWNERS.values()),max(extents[a] for a in OWNERS.values())
        carrier = bytearray(hi-lo)
        for address in OWNERS.values():
            carrier[address-lo:extents[address]-lo] = raw(address,extents[address]-address)
        (work/"owners.bin").write_bytes(carrier)
        (work/"seeds.tsv").write_text("".join(f"{a:#x}\tfunction\n{a:#x}\tcode\n" for a in OWNERS.values()))
        plan = dict(target=str((work/"owners.bin").relative_to(ROOT)),
            output=str((work/"rea").relative_to(ROOT)),init_timeout=60,timeout=240,
            environment={"REA_GHIDRA_SEED_FILE":str((work/"seeds.tsv").relative_to(ROOT))},
            open_options=dict(format="raw-binary",architecture="x86_64",entry_point=hex(lo)),
            operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=hex(a)),label=role)
                        for role,a in OWNERS.items()])
        (work/"plan.json").write_text(encoded(plan))
        print((work/"plan.json").relative_to(ROOT))
        return

    sys.path[:0] = [str(ROOT/"runtime/camera-recovery-0.105.0/python-libs"),
                   str(ROOT/"runtime/armory-recovery/python-libs")]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    import capstone
    md = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    cases = []

    class Probe:
        def __init__(self):
            self.u = Uc(UC_ARCH_X86,UC_MODE_64)
            self.u.mem_map(0x20000000,0x20000)
            self.u.mem_map(0x30000000,0x2000)
            self.u.reg_write(r.UC_X86_REG_RSP,0x20010000)
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED,self.missing)
            self.u.hook_add(UC_HOOK_CODE,self.hook)
            self.poll_due = None

        def missing(self,uc,access,address,size,value,_):
            page = address & ~4095
            uc.mem_map(page,4096)
            uc.mem_write(page,raw(page,4096))
            return True

        def ret(self):
            sp = self.u.reg_read(r.UC_X86_REG_RSP)
            address = struct.unpack("<Q",self.u.mem_read(sp,8))[0]
            self.u.reg_write(r.UC_X86_REG_RSP,sp+8)
            self.u.reg_write(r.UC_X86_REG_RIP,address)

        def hook(self,uc,address,size,_):
            if address == 0x14588D0D0:  # Declared zone-key -> zone index seam.
                uc.reg_write(r.UC_X86_REG_RAX,0)
                self.ret()
            elif address == 0x14591781D:
                uc.emu_stop()
            elif address in (0x1458B0501,0x1458AF499):
                self.poll_due = address == 0x1458AF499
                uc.emu_stop()
            else:
                assert (RANGES["run-countdown"][0] <= address < RANGES["run-countdown"][1]
                        or RANGES["poll-gate"][0] <= address < RANGES["poll-gate"][1]), hex(address)

        def countdown(self,spawned,endless,deadline,clock):
            self.u.mem_write(0x300009D0,struct.pack("<Q",spawned))
            self.u.mem_write(0x30000A34,struct.pack("<f",clock))
            self.u.mem_write(0x30000A90,struct.pack("<f",deadline))
            self.u.mem_write(0x30000AB8,bytes([int(endless)]))
            self.u.reg_write(r.UC_X86_REG_RDX,0x30000000)
            self.u.emu_start(OWNERS["run"],0,count=200)
            return struct.unpack("<f",self.u.reg_read(r.UC_X86_REG_XMM0).to_bytes(16,"little")[:4])[0]

        def poll(self,previous,now):
            self.u.mem_write(0x300010E0,struct.pack("<d",previous))
            self.u.reg_write(r.UC_X86_REG_RSI,0x30000000)
            self.u.reg_write(r.UC_X86_REG_XMM6,int.from_bytes(struct.pack("<d",now),"little"))
            self.u.emu_start(RANGES["poll-gate"][0],0,count=20)
            retained = struct.unpack("<d",self.u.mem_read(0x300010E0,8))[0]
            return self.poll_due, retained

    # Elwynn slot zero currently spawns at 180 real run seconds.
    bosses = struct.unpack("<Q",raw(0x146BDE390+0x88,8))[0]
    first_deadline = struct.unpack("<f",raw(bosses+80,4))[0]*60
    for spawned in (0,5):
        for endless in (False,True):
            for elapsed in (-.25,0.0,1.0,float("nan")):
                clock = first_deadline+elapsed
                actual = Probe().countdown(spawned,endless,first_deadline,clock)
                expected = .25 if elapsed == -.25 and (spawned == 0 or endless) else -1.0
                assert actual == expected, (spawned,endless,elapsed,actual)
                cases.append(dict(kind="countdown",spawned=spawned,endless=endless,
                    elapsed="nan" if elapsed != elapsed else elapsed,result=actual))
    for previous,now,expected in [(0,.199,False),(0,.2,True),(0,.201,True),
            (1,1,False),(1,.5,False),(1,float("nan"),False)]:
        actual,retained = Probe().poll(previous,now)
        assert actual == expected
        assert retained == (now if expected else previous)
        cases.append(dict(kind="poll",previous=previous,now="nan" if now != now else now,
                          due=actual,retained=retained))

    scalar = (ROOT/"crates/azeroth-survivors-re/src/gameplay/client/addon_scalars.rs").read_text()
    feed = (ROOT/"crates/azeroth-survivors-re/src/gameplay/client/addon_feed.rs").read_text()
    assert "let next_seconds = next_boss_seconds(" in scalar
    assert "if remaining > 0.0 { remaining } else { -1.0 }" in scalar
    assert "(\"nb\", format!(\"{next_seconds:.1}\"))" in scalar
    assert "if now - self.polled_at >= 0.2" in feed
    assert 'self.cached.get(message.prefix).map_or("", String::as_str) == message.payload' in feed
    records = [record(role,a,b-a) for role,(a,b) in RANGES.items()]
    # Retained Ghidra provenance covers the freshly located owners, not only
    # the four instruction excerpts used by these bounded contracts.
    rea = json.loads((EVIDENCE/"rea.json").read_text())
    assert rea["target_sha256"] == SHA and len(rea["owners"]) == 16
    lo = min(int(row["va"],16) for row in rea["owners"])
    hi = max(int(row["end"],16) for row in rea["owners"])
    carrier = bytearray(hi-lo)
    for row in rea["owners"]:
        a, b = int(row["va"],16), int(row["end"],16)
        assert extents[a] == b and row["size"] == b-a
        assert pe.rva_offset(a-pe.image_base) == int(row["file_offset"],16)
        blob = raw(a,b-a)
        assert hashlib.sha256(blob).hexdigest() == row["sha256"]
        carrier[a-lo:b-lo] = blob
    assert hashlib.sha256(carrier).hexdigest() == rea["raw_subject_sha256"]
    manifest = dict(target={key:target[key] for key in ("version","path","sha256","size_bytes")},
        native_ranges=records,embedded_api={**api,"native_producer_and_live_consumer_revalidation":"producer-fields.json, producer-rea.json and producer-cases.json"},interval_seconds=.2,prefix_order=order,
        current_metadata="12 zone records and 60 boss API identity/timing/final records match the retained source metadata; other gameplay fields are outside this check.",
        limits=["Unchanged native countdown/poll instructions only; no Rust compilation or application execution.",
                "Countdown uses an explicit zone-key lookup seam returning the first native zone.",
                "Complete producer field/source correspondence is recorded separately in producer-fields.json; this bounded countdown/poll check alone does not establish state equivalence.",
                "Current VM registration/cache/teardown is recovered separately in producer-rea.json; compiled behavior, addon interaction and original/rebuilt parity remain unverified."])
    evidence = dict(target_sha256=SHA,cases=cases,host_seams=["zone-key lookup returns index zero"],
                    executed="Unchanged current EXE countdown prefix and poll gate; original/rebuilt games never launched")
    if args.write:
        EVIDENCE.mkdir(parents=True,exist_ok=True)
    for role,(a,b) in RANGES.items():
        lines=[f"{i.address:x}: {i.mnemonic:9s} {i.op_str}" for i in md.disasm(raw(a,b-a),a)]
        assembly = "\n".join(lines)+"\n"
        if args.write:
            (EVIDENCE/(role+".asm")).write_text(assembly)
        else:
            assert (EVIDENCE/(role+".asm")).read_text() == assembly
    if args.write:
        (EVIDENCE/"manifest.json").write_text(encoded(manifest))
        (EVIDENCE/"native-cases.json").write_text(encoded(evidence))
    else:
        assert json.loads((EVIDENCE/"manifest.json").read_text()) == manifest
        assert json.loads((EVIDENCE/"native-cases.json").read_text()) == evidence
    print(f"Verified selected 0.109.0 identity/API, 12 zone/60 boss metadata records, {len(cases)} unchanged native countdown/poll cases and live source connections; no compilation or game execution")


if __name__ == "__main__":
    main()

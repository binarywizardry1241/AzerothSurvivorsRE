#!/usr/bin/env python3
"""Replay only reviewed 0.105.0 killing-blow branches; no game/build/OS calls."""
from portable_paths import portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
WORK = ROOT / "runtime/fixgap20-26-27/no-u-curated"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/no-u"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (end + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    BASE = 0x20000000
    u.mem_map(BASE, 0x10000)
    BP, GAME, PAIRS = BASE + 0x1000, BASE + 0x3000, BASE + 0x6000
    active = None

    def read(a, n):
        off = pe.rva_offset(a - pe.image_base)
        return data[off:off+n]

    def hook(_, a, n, unused):
        assert active[0] <= a < a+n <= active[1], hex(a)
        raw = bytes(u.mem_read(a, n))
        assert raw == read(a, n), "Changed native instruction"
        assert raw[0] not in (0xe8, 0xc3, 0xcc), "Calls/returns forbidden"

    u.hook_add(UC_HOOK_CODE, hook)
    def put(a, fmt, *v): u.mem_write(a, struct.pack(fmt, *v))
    def reg(name, v): u.reg_write(getattr(x, "UC_X86_REG_" + name), v)
    cases = []
    for name, pairs in [("empty", []), ("match", [(1493,116)]),
                        ("wrong_spell", [(1493,133)]), ("wrong_guardian", [(1492,116)]),
                        ("reversed_lanes", [(116,1493)]), ("later_match", [(1493,133),(1493,116)]),
                        ("multiple_wrong", [(1492,116),(1493,133)]),
                        ("repeated_match", [(1493,116),(1493,116)])]:
        u.mem_write(BASE, bytes(0x10000))
        for i, pair in enumerate(pairs): put(PAIRS + i*8, "<II", *pair)
        put(BP-0x18, "<Q", len(pairs)*8); put(BP-0x20, "<Q", PAIRS)
        put(BP+0x3c, "<I", 1493); put(BP+0xc, "<I",116); reg("RBP",BP)
        active = (0x1458D49AD, 0x1458D49E4)
        u.emu_start(*active, count=1000)
        matched = bool(u.reg_read(x.UC_X86_REG_RAX) & 0xff)
        assert matched == ((1493,116) in pairs)
        cases.append(dict(name=name, pairs=pairs, matches=matched))
    kills = []
    for spell in [0,116,133,16038,14186,5308]:
        for health, metadata in [(0.,True),(-5.,True),(1.,True),(0.,False)]:
            u.mem_write(BASE, bytes(0x10000))
            put(GAME+0x6a8,"<QQQ",1,PAIRS,0);put(BP+0x15c,"<I",spell)
            reg("RBP",BP);reg("RDI",GAME);reg("RSI",0);reg("RBX",0)
            reg("R15",0 if metadata else 0xffffffffffffffff);reg("R12",1493)
            reg("XMM11",struct.unpack("<I",struct.pack("<f",health))[0]);reg("XMM12",0)
            active = (0x145934606,0x145934699)
            u.emu_start(*active,count=1000)
            count = struct.unpack("<Q",u.mem_read(GAME+0x6b8,8))[0]
            assert count == int(metadata and health<=0)
            pair = list(struct.unpack("<II",u.mem_read(PAIRS,8))) if count else None
            expected = {16038:8349,14186:2098,5308:20647}.get(spell,spell)
            assert pair is None or pair == [1493,expected]
            kills.append(dict(spell=spell,remaining_health=health,metadata=metadata,pair=pair))
    asset = json.loads((ROOT / "crates/azeroth-survivors-re/assets/progression.json").read_text())
    row = next(a for a in asset["achievements"] if a["key"]=="feat:nou")
    assert row["kind"]==9 and row["feat_kind"]==6 and row["points"]==25 and row["category"]==3
    assert row["target"] == (116<<32)|1493
    assert read(0x146BBF9A0,16)==struct.pack("<IIII",25,6,1493,116)
    assert read(0x146BC16B8,4).decode()==row["name"]
    assert read(0x146BC16BC,52).decode()==row["description"]
    spans = []
    output = RETAINED if args.check else WORK
    output.mkdir(parents=True,exist_ok=True)
    for role,start,end in [("catalog-row",0x1458D0526,0x1458D05AC),
                           ("kill-pair-match",0x1458D49AD,0x1458D49E4)]:
        raw=read(start,end-start)
        record=dict(role=role,address=hex(start),end_exclusive=hex(end),
                    file_offset=hex(pe.rva_offset(start-pe.image_base)),sha256=hashlib.sha256(raw).hexdigest())
        spans.append(record)
        if not args.check:
            text=subprocess.check_output(["objdump","-d","--no-show-raw-insn",f"--start-address={start:#x}",f"--stop-address={end:#x}",str(TARGET)],text=True).replace(str(TARGET),TARGET.name)
            (output/(role+".asm")).write_text(text)
    result=dict(target_sha256=SHA,spans=spans,kill_record_source="docs/analysis/evidence/0.105.0/run-meters/accounting/hit.asm",
                kill_record_range=["0x145934606","0x145934699"],membership_cases=cases,record_cases=kills,
                limits=["Unchanged native branch replay with synthetic memory; metadata/id/post-hit health are explicit inputs. No allocation, external calls, game or compiled source is executed."])
    if args.check: assert portable_record(json.loads((output/"native-vectors.json").read_text()))==portable_record(json.loads(json.dumps(result)))
    else: (output/"native-vectors.json").write_text(portable_json(result,indent=2)+"\n")
    print(f"Passed {len(cases)} native pair-membership and {len(kills)} killing-blow boundary/alias cases; selected achievement data matches")


if __name__=="__main__": main()

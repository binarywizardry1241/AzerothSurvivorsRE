#!/usr/bin/env python3
"""Retain selected-target enemy constructor/scaling instructions and REA evidence.

Never executes the game. REA/Ghidra plans import unchanged native functions at
original VAs; inspect plans with scripts/rea-batch.py before rerunning this step.
"""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import subprocess
from enemy_evidence import curated_native

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
EXPECTED = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OUTPUT = ROOT / "docs/analysis/evidence/0.97.2/enemies"
RUNTIME = ROOT / "runtime/analysis/history/native-recovery/enemies/b24ae4fa5276/scaling"
FUNCTIONS = [("constructor", 0x1454c2040, 0x1454c293c),
             ("flagged-health-polynomial", 0x1454f0830, 0x1454f0875),
             ("zero-flag-health-polynomial", 0x1454f0880, 0x1454f08c5)]
CONSTANTS = [(0x1458f6620,4),(0x1469aa634,12),(0x1458fce44,4),
             (0x145baac38,4),(0x145c99e40,4),(0x1469aa570,32),
             (0x1469aa534,4),(0x1469aa550,4),(0x1458fcdec,4),
             (0x145a116d8,4),(0x145a2a598,4),(0x14590ae44,4),
             (0x1458ed014,4),(0x1459c78b4,4),(0x1458eb480,4),
             (0x1458eb488,4),(0x1458eb4fc,4),(0x1458eb52c,4),
             (0x145930f00,4),(0x146627ee0,16)]


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == EXPECTED
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    extents = {pe.image_base+a: pe.image_base+b for a,b,_ in pe.functions()}
    OUTPUT.mkdir(parents=True, exist_ok=True)
    RUNTIME.mkdir(parents=True, exist_ok=True)
    def record(va, size):
        offset = pe.rva_offset(va-pe.image_base)
        raw = data[offset:offset+size]
        return {"va":hex(va),"file_offset":hex(offset),"byte_count":size,
                "sha256":hashlib.sha256(raw).hexdigest()}
    functions = []
    for name,start,end in FUNCTIONS:
        assert name != "constructor" or extents[start] == end
        row = {"name": name, **record(start,end-start), "end_exclusive":hex(end),
               "boundary": "PE RUNTIME_FUNCTION" if name == "constructor" else "leaf RET interval"}
        text = objdump_output(["objdump","-d","--no-show-raw-insn",
            f"--start-address={start:#x}",f"--stop-address={end:#x}",str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
        path = OUTPUT / f"scaling-{start:x}.asm"
        path.write_text(text)
        row["assembly"] = path.name
        row["assembly_sha256"] = hashlib.sha256(text.encode()).hexdigest()
        functions.append(row)
        offset = int(row["file_offset"],16)
        (RUNTIME / f"{start:x}.bin").write_bytes(data[offset:offset+end-start])
        plan = {"target":f"runtime/analysis/history/native-recovery/enemies/b24ae4fa5276/scaling/{start:x}.bin",
            "output":f"runtime/analysis/history/native-recovery/enemies/b24ae4fa5276/scaling/rea-{start:x}",
            "open_options":{"format":"raw-binary","architecture":"x86_64","entry_point":hex(start)},
            "timeout":240,"open_timeout":90,
            "operations":[{"name":"analyze_function","arguments":{"procedure":hex(start)}}]}
        (RUNTIME / f"plan-{start:x}.json").write_text(portable_json(plan,indent=2)+"\n")
    constants=[]
    for va,size in CONSTANTS:
        offset=pe.rva_offset(va-pe.image_base)
        constants.append({**record(va,size),"u32_words":list(struct.unpack('<'+'I'*(size//4),data[offset:offset+size]))})
    records=[]
    expected_functions={row['va']:row['sha256'] for row in functions}
    for path in sorted(RUNTIME.glob("rea-*/evidence-bundle.json")):
        bundle=json.loads(path.read_text())
        for evidence in bundle["records"]:
            if evidence["operation"] != "analyze_function": continue
            address=evidence['parameters']['procedure']
            if address not in expected_functions: continue
            assert evidence['subject']['digest']['sha256']==expected_functions[address]
            records.append(curated_native(evidence))
    result={"date":"2026-10-18","version":"0.97.2","target":str(TARGET.relative_to(ROOT)),
            "target_sha256":EXPECTED,"target_executed":False,"functions":functions,"constants":constants,
            "rea_records":records,"limitations":["Ghidra pseudocode signatures are generic; Win64 registers and original instructions govern.",
            "Raw function analyses omit callee implementations and external data; original hash-bound instructions and constants provide the arithmetic specification.",
            "No complete game runtime or world-loop parity is established."]}
    (OUTPUT/"scaling-evidence.json").write_text(portable_json(result,indent=2)+"\n")
    print(f"Retained {len(functions)} functions, {len(constants)} constant spans and {len(records)} REA records")

if __name__ == "__main__": main()

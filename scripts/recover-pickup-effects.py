#!/usr/bin/env python3
"""Bounded 0.105.0 pickup/rune/leech recovery; no builds or game processes.

Unicorn executes unchanged PE instructions. Allocation, translation, terrain,
packet composition and meter insertion are explicit seams. Numeric/state
instructions are never replaced. Raw work is staged under ignored runtime/.
"""
from portable_paths import objdump_output, portable_json, portable_record
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/inventory/pickup-effects/1fa80c104cd1"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/pickup-effects"
RANGES = {
    "create-special": (0x14593A644, 0x14593A920),
    "collect-rune": (0x1459451C0, 0x1459458F0),
    "magnet-sweep": (0x145943BB0, 0x145943E8E),
    "sample-pickup": (0x145933A30, 0x145933EB4),
    "magnet-count": (0x145961E80, 0x145961F76),
    "magnet-windows": (0x145919949, 0x145919B24),
    "guardian-magnet": (0x145932640, 0x145932746),
    "rune-timer": (0x14590FA5F, 0x14590FC5E),
    "collection": (0x14590C4BF, 0x14590CB2D),
    "per-hit-leech": (0x145934B13, 0x145934DE7),
    "timer-defaults": (0x145900A9F, 0x145900ACC),
}


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + "\n")


def bits(value):
    return _shared_bits(value)


def f32(value):
    return _shared_f32(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-rea", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    data = EXE.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE hash mismatch"
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    WORK.mkdir(parents=True, exist_ok=True)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + size]

    def span(name, lo, hi):
        return dict(role=name, address=hex(lo), end_exclusive=hex(hi),
                    file_offset=hex(pe.rva_offset(lo - pe.image_base)),
                    sha256=hashlib.sha256(raw(lo, hi-lo)).hexdigest())

    owners = []
    for name, (lo, hi) in RANGES.items():
        row = span(name, lo, hi)
        row["assembly"] = name + ".asm"
        assembly = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={lo:#x}",
            f"--stop-address={hi:#x}", str(EXE.relative_to(ROOT))], cwd=ROOT, text=True)
        (WORK / row["assembly"]).write_text(assembly)
        # Existing full-function Ghidra runs are retained only for owners which
        # answer this task. Incomplete switch recovery is kept explicit.
        response = WORK / ("rea-" + name) / "003-procedure_pseudo_code.json"
        if response.exists():
            ev = json.loads(response.read_text())["response"]["result"]["structuredContent"]
            assert ev["subject"]["digest"]["sha256"] == row["sha256"]
            assert ev["provider"]["id"] == "ghidra"
            row["evidence_id"] = ev["evidence_id"]
            row["provider"] = ev["provider"]
            row["pseudocode"] = name + ".ghidra.c"
            (WORK / row["pseudocode"]).write_text("\n".join(line.rstrip() for line in ev["normalized_result"].splitlines()).strip() + "\n")
        row["text_sha256"] = {
            key: hashlib.sha256((WORK / row[key]).read_bytes()).hexdigest()
            for key in ("assembly", "pseudocode") if key in row
        }
        owners.append(row)
        if args.prepare_rea and name in ("collect-rune", "magnet-sweep", "sample-pickup"):
            binary = WORK / (name + ".bin")
            binary.write_bytes(raw(lo, hi-lo))
            save(WORK / (name + "-plan.json"), dict(
                target=str(binary.relative_to(ROOT)),
                output=str((WORK / ("rea-" + name)).relative_to(ROOT)),
                init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(lo)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(lo)))]))

    strings = {"magnet-collected": (0x146E79B18, 45),
               "magnet-appeared": (0x146E79CF6, 52),
               "restoration-name": (0x146E79DD0, 11),
               "restoration-icon": (0x146E79DDB, 15)}
    text = {name: raw(address, size).decode() for name, (address, size) in strings.items()}
    for name, (address, size) in strings.items():
        owners.append(span(name, address, address + size))
    assert text["magnet-collected"] == "Magnet! Everything on the field comes to you."
    assert text["magnet-appeared"] == "A magnet has appeared! Look for its pillar of light."
    if args.prepare_rea:
        print("Prepared selected-target pickup REA plans; target not executed")
        return

    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    import unicorn as uni
    import unicorn.x86_const as x86
    uc = uni.Uc(uni.UC_ARCH_X86, uni.UC_MODE_64)
    end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    uc.mem_map(pe.image_base, (end + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    MEM, STACK, STOP = 0x200000000, 0x300000000, 0x400000000
    uc.mem_map(MEM, 0x100000)
    uc.mem_map(STACK, 0x20000)
    uc.mem_map(STOP, 4096)
    frame = STACK + 0x10000
    context = {}

    def reg(name, value=None):
        key = getattr(x86, "UC_X86_REG_" + name)
        if value is not None:
            uc.reg_write(key, value)
        return uc.reg_read(key)

    def xmm(index, value=None):
        if value is not None:
            reg("XMM" + str(index), bits(value))
        return struct.unpack("<f", struct.pack("<I", reg("XMM" + str(index)) & 0xffffffff))[0]

    def put(at, fmt, *values):
        uc.mem_write(at, struct.pack(fmt, *values))

    def get(at, fmt):
        return struct.unpack(fmt, uc.mem_read(at, struct.calcsize(fmt)))

    def ret():
        pointer = reg("RSP")
        reg("RIP", get(pointer, "<Q")[0])
        reg("RSP", pointer + 8)

    def string(at, size):
        return bytes(uc.mem_read(at, size)).decode()

    def hook(_, address, size, unused):
        if address in context["stops"] or address == STOP:
            uc.emu_stop()
        elif address in (0x140002200, 0x1400021D0):
            ret()
        elif address == 0x1458DA590:
            reg("RAX", 0)  # use exact native fallback English keys
            ret()
        elif address == 0x14595F3C0:
            row = reg("RDX")
            name, count, icon, length = get(row + 8, "<QQQQ")
            amount = struct.unpack("<d", struct.pack("<Q", reg("XMM2") & ((1 << 64)-1)))[0]
            context["credits"].append(dict(name=string(name, count), icon=string(icon, length), amount_bits=bits(amount)))
            ret()
        elif address == 0x1458B5100:
            context["casts"].append(dict(source=reg("RDX"), spell=reg("R8"), target=get(reg("R9"), "<Q")[0]))
            uc.mem_write(reg("RCX"), bytes(32))
            ret()
        elif address in (0x1458F96F0, 0x1458F0ED0):
            context["refresh"].append(hex(address))
            ret()
        elif address == 0x145BC981D:
            value = xmm(0)
            xmm(0, value if not math.isfinite(value) else math.ceil(value))
            ret()
        elif address == 0x1458E1710:
            # Field map implementation is an explicit insertion seam.
            context["fields"][get(reg("RDX") + 32, "<Q")[0]] = reg("R8") & 0xffffffff
            ret()
        elif address == 0x145BCB3E0:
            header = reg("RCX")
            put(header, "<QQ", 64, MEM + 0x30000)
            ret()
        elif address == 0x145BFB120:
            put(reg("RCX"), "<QQ", 32, MEM+0x50000)
            ret()
        elif address == 0x1458753B0:
            reg("RAX", context.get("zone", 0))
            ret()
        elif address == 0x1458AA9E0:
            context["moves"].append(dict(guid=reg("RDX"), start=list(get(reg("R8"), "<III")),
                to=list(get(reg("R9"), "<III")), serial=get(reg("RSP")+0x28, "<I")[0],
                milliseconds=get(reg("RSP")+0x30, "<I")[0]))
            uc.mem_write(reg("RCX"), bytes(32))
            ret()
        elif not any(lo <= address < hi for lo, hi in RANGES.values()):
            raise RuntimeError("Unreviewed instruction " + hex(address))

    uc.hook_add(uni.UC_HOOK_CODE, hook)

    def reset(stops):
        uc.mem_write(MEM, bytes(0x100000))
        uc.mem_write(STACK, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            reg(name, 0)
        for index in range(16):
            reg("XMM" + str(index), 0)
        reg("MXCSR", 0x1f80)
        reg("RSP", frame - 0x808)
        reg("RBP", frame)
        put(reg("RSP"), "<Q", STOP)
        context.clear()
        context.update(stops=set(stops), credits=[], casts=[], refresh=[], fields={}, moves=[])
        put(MEM+0x370, "<QQQ", 32, MEM+0x10000, 0)
        put(MEM+0x5d0, "<QQQ", 64, MEM+0x20000, 0)
        put(MEM+0x460, "<Q", 1)

    def run(start):
        uc.emu_start(start, 0, count=100000)
        assert reg("RIP") in context["stops"] | {STOP}, hex(reg("RIP"))

    cases = []
    for rune in (3, 4, 5):
        for health in (0., 95., 100., 110.):
            for duplicate in (False, True):
                reset([0x14594551A])
                put(MEM+0x478, "<f", 100.)
                put(MEM+0x4e0, "<f", health)
                put(MEM+0x9ec, "<f", 50.)
                spell = {3: 23451, 4: 23505, 5: 23493}[rune]
                if duplicate and rune != 5:
                    for index, existing in enumerate((spell, 999, spell)):
                        put(MEM+0x10000+index*24, "<IIIIff", 0, 0, 0, existing, 80., 0.)
                    put(MEM+0x380, "<Q", 3)
                reg("RCX", MEM)
                reg("RDX", rune)
                run(0x1459451C0)
                count = get(MEM+0x380, "<Q")[0]
                auras = [list(get(MEM+0x10000+i*24+12, "<IIf")) for i in range(count)]
                after = get(MEM+0x4e0, "<f")[0]
                assert after == (min(health+50., 100.) if rune == 5 else health)
                if rune != 5:
                    assert [a[0] for a in auras] == ([999, spell] if duplicate else [spell])
                    assert auras[-1][1] == bits(50. + (10. if rune == 3 else 15.))
                    assert context["refresh"] == ["0x1458f96f0", "0x1458f0ed0"]
                assert context["casts"] == [dict(source=1, spell=spell, target=1)], (rune, context["casts"])
                cases.append(dict(rune=rune, health_bits=bits(health), duplicate=duplicate,
                    health_after_bits=bits(after), auras=auras, credits=context["credits"], casts=context["casts"]))

    leech = []
    for health in (0., 95., 100., 110.):
        for damage in (0., 0.5, 10., 1000.):
            for rate in (-0.1, 0., 0.1):
                reset([0x145934B79, 0x145934C20, 0x145934DE7])
                put(MEM+0x478, "<f", 100.)
                put(MEM+0x4e0, "<f", health)
                reg("RDI", MEM)
                xmm(0, rate)
                xmm(8, damage)
                run(0x145934B1B)
                expected = min(f32(health + f32(f32(damage)*f32(rate))), 100.) if rate > 0 else health
                after = get(MEM+0x4e0, "<f")[0]
                assert bits(after) == bits(expected)
                leech.append(dict(health_bits=bits(health), damage_bits=bits(damage), rate_bits=bits(rate),
                    health_after_bits=bits(after), actual_bits=bits(f32(after-health)), credit=reg("RIP") == 0x145934B79))

    flights = []
    for rows in ([], [(0,0,3.,4.)], [(0,0,80.,0.), (0,1,90.,0.), (1,0,40.,0.), (6,0,0.,0.)]):
        reset([])
        put(MEM+0x4c8, "<fff", 0., 0., 7.)
        put(MEM+0x9ec, "<f", 10.)
        put(MEM+0x5c0, "<QQ", MEM+0x40000, len(rows))
        put(MEM+0xa10, "<I", 0xfffffffe)
        for i, (kind, state, x, y) in enumerate(rows):
            base = MEM+0x40000+i*72
            put(base+24, "<I", state)
            put(base+32, "<I", kind)
            put(base+40, "<Q", 100+i)
            put(base+52, "<fff", x, y, 7.)
        reg("RCX", MEM)
        run(0x145943BB0)
        expected = [(i,r) for i,r in enumerate(rows) if r[0] == 0 and r[1] == 0]
        assert len(context["moves"]) == len(expected)
        for move, (i, row) in zip(context["moves"], expected):
            duration = max(f32(f32(math.sqrt(f32(f32(row[2]*row[2])+f32(row[3]*row[3]))))/40.), f32(.15))
            assert move["guid"] == 100+i
            assert get(MEM+0x40000+i*72+28, "<I")[0] == bits(f32(10.+duration))
        flights.append(dict(rows=rows, moves=context["moves"]))

    # Actual descriptor-selection instructions, stopping before terrain/packet seams.
    descriptors = []
    for kind, start in [(3,0x14593A65A),(4,0x14593A686),(5,0x14593A644),(6,0x14593A69C)]:
        reset([0x14593A6BD])
        reg("R15", kind)
        run(start)
        entry = get(frame+0x5c, "<I")[0]
        packed = reg("R15")
        descriptors.append(dict(kind=kind, entry=entry, display=packed & 0xffffffff, scale_bits=packed >> 32))
    assert [(r["entry"], r["display"]) for r in descriptors] == [(9006,5931),(9007,5995),(9008,5991),(9009,342)]

    def next_rng(state):
        mask = (1 << 64)-1
        def rotate(x,n):
            return ((x << n) | (x >> (64-n))) & mask
        result = (rotate((state[0]+state[3]) & mask,23)+state[0]) & mask
        t = (state[1] << 17) & mask
        state[2] ^= state[0]
        state[3] ^= state[1]
        state[1] ^= state[2]
        state[0] ^= state[3]
        state[2] ^= t
        state[3] = rotate(state[3],45)
        return result

    windows = []
    for zone in (0, 1, 11):
        for seed in ([1,2,3,4], [11,22,33,44], [0xffffffffffffffff,2,3,4], [91,72,53,34]):
            reset([0x145919B24])
            context["zone"] = zone
            put(MEM+0x958, "<QQQQ", *seed)
            reg("R13", MEM)
            run(0x145919949)
            pointer, count = get(MEM+0x730, "<QQ")
            actual = [list(get(pointer+i*8, "<II")) for i in range(count)]
            state = list(seed)
            while True:
                product = next_rng(state)*2
                if product & ((1 << 64)-1) <= (1 << 63)-1:
                    expected_count = 2 + (product >> 64)
                    break
            assert count == expected_count
            bosses = struct.unpack("<Q", raw(0x146BA9450+zone*240+0x88, 8))[0]
            seconds = f32(struct.unpack("<f", raw(bosses+4*88+64,4))[0]*60.)
            segment = f32(seconds / expected_count)
            expected = []
            for i in range(expected_count):
                while True:
                    unit = struct.unpack("<f",struct.pack("<I",0x3f800000 | (next_rng(state) >> 41)))[0]-1.
                    fraction = f32(f32(unit*f32(1.-f32(.6)))+f32(.6))
                    if fraction < 1.:
                        break
                eligible = f32(i*segment)
                expected.append([bits(eligible), bits(f32(eligible+f32(fraction*segment)))])
            assert actual == expected
            assert list(get(MEM+0x958,"<QQQQ")) == state
            windows.append(dict(zone=zone, seed=seed, run_seconds_bits=bits(seconds),
                                windows=actual, rng_after=state))

    gold_sweeps = []
    for counter in (0, 0xffffffff):
        reset([0x14590CA04])
        put(frame+0x378,"<Q",MEM)
        put(MEM+0x4c8,"<fff",0.,0.,7.)
        put(MEM+0x9ec,"<f",10.)
        put(MEM+0x724,"<I",counter)
        put(MEM+0x5c0,"<QQ",MEM+0x40000,3)
        for i, (kind,state,x) in enumerate(((1,0,40.),(1,1,80.),(3,0,100.))):
            base=MEM+0x40000+i*72
            put(base+24,"<I",state)
            put(base+32,"<I",kind)
            put(base+52,"<fff",x,0.,7.)
        run(0x14590C85E)
        assert get(MEM+0x724,"<I")[0] == (counter+1) & 0xffffffff
        assert get(MEM+0x40000+24,"<If") == (1,11.)
        assert get(MEM+0x40000+72+24,"<If") == (1,0.)
        assert get(MEM+0x40000+144+24,"<If") == (0,0.)
        gold_sweeps.append(dict(before=counter, after=get(MEM+0x724,"<I")[0],
                               gold_deadline_bits=get(MEM+0x40000+28,"<I")[0]))
    fixtures = dict(target_sha256=SHA, rune_cases=cases, leech_cases=leech,
                    magnet_flights=flights, descriptors=descriptors, strings=text,
                    magnet_windows=windows, magnet_gold_sweeps=gold_sweeps)
    fixtures = json.loads(json.dumps(fixtures, allow_nan=False))
    save(WORK / "native-vectors.json", fixtures)
    save(WORK / "manifest.json", dict(target_sha256=SHA, application_executed=False,
        method=__doc__, owners=owners,
        shared_object_creator="docs/analysis/evidence/0.105.0/boundary-pillars/manifest.json"))
    if args.check:
        assert portable_record(json.loads((RETAINED / "native-vectors.json").read_text())) == portable_record(fixtures)
        retained = json.loads((RETAINED / "manifest.json").read_text())
        assert retained["target_sha256"] == SHA
        for row in retained["owners"]:
            lo, hi = int(row["address"],16), int(row["end_exclusive"],16)
            assert hashlib.sha256(raw(lo,hi-lo)).hexdigest() == row["sha256"]
            for key, digest in row.get("text_sha256",{}).items():
                assert hashlib.sha256((RETAINED / row[key]).read_bytes()).hexdigest() == digest
    print(f"Passed {len(cases)} rune, {len(leech)} per-hit leech, {len(flights)} XP-flight, {len(windows)} schedule, {len(gold_sweeps)} gold/counter and {len(descriptors)} descriptor cases")


if __name__ == "__main__":
    main()

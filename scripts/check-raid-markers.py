#!/usr/bin/env python3
"""Check bounded marker contracts in the installed 0.109.0 instructions.

Uses existing optional Capstone/Unicorn installations; never compiles source or
starts a game. Synthetic memory, allocation and math seams are explicit below.
--write retains compact native evidence; bulk REA output stays under runtime/.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, installed_identity, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
EVIDENCE = ROOT / "docs/analysis/evidence/raid-markers"
OWNERS = {
    'receiver': (0x140165430, 0x140166870),
    'draw': (0x140164000, 0x1401651e8),
    'paint': (0x14013b920, 0x14013bde6),
    'mask': (0x14013d050, 0x14013d447),
    'wedge': (0x1401477f0, 0x140147a43),
    'column': (0x140147a50, 0x140147dc8),
    'clip': (0x140147dd0, 0x140148564),
    'cast': (0x1459577f0, 0x1459578a0),
    'cast_packet': (0x1458c2220, 0x1458c241b),
    'cast_consumer': (0x14067e670, 0x14067f064),
    'mip_average': (0x1400a6800, 0x1400a69ab),
    'geometry': (0x140166bf0, 0x140169364),
    'arc': (0x14013d890, 0x14013de69),
    'project': (0x14013df60, 0x14013e22f),
    'annulus': (0x14013e2a0, 0x14013e9da),
    'terrain_project': (0x14008d020, 0x14008dab1),
    'gather_aabb': (0x1415ec990, 0x1415ecb24),
    'box_clip': (0x1415ed280, 0x1415eda16),
}


def text(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def check_scripted_fill():
    proof = json.loads((EVIDENCE / "scripted-fill.json").read_text())
    target = installed_identity()
    assert all(target[key] == value for key, value in proof["target"].items())
    data = target_bytes(target)
    pe = load_script("scripted_marker_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        offset = pe.rva_offset(int(address, 16) - pe.image_base)
        return data[offset:offset + size]

    for row in proof["ranges"]:
        body = raw(row["start"], row["size"])
        assert len(body) == row["size"] and hashlib.sha256(body).hexdigest() == row["sha256"], row["role"]
    for table in proof["dispatch"]:
        address = int(table["address"], 16)
        payload = raw(table["address"], 4 * len(table["targets"]))
        destinations = [hex(address + delta) for delta, in struct.iter_unpack("<i", payload)]
        assert destinations == table["targets"], table["role"]
    for address, encoded in proof["data"].items():
        assert raw(address, len(encoded) // 2).hex() == encoded, address
    print(text({"target_sha256": target["sha256"], "ranges_checked": len(proof["ranges"]),
                "dispatch_cells_checked": sum(len(table["targets"]) for table in proof["dispatch"]),
                "compiled_source_executed": False}), end="")


def smooth(v):
    v = max(0., min(v, 1.))
    return v * v * (3. - 2. * v)


def mask_model(kind, u, v, edge):
    """Independent scalar transcription, compared with original instructions.

    This does not execute or certify the Rust implementation.
    """
    x, y = 2. * u - 1., 2. * v - 1.
    radius = math.hypot(x, y)

    def trail(d):
        core = (.45 * math.exp(-7. * d) if d > 0 else
                max(1. - smooth((-.03 - d) / .04), .4 * math.exp(2.4 * d)))
        return core * (1. - smooth((abs(d) - .8) / .19999999))

    values = [lambda: (.1 + .22 * min(radius, 1.) ** 3) * max(0., min((1. - radius) / edge, 1.)),
              lambda: max(0., min((1. - radius) / edge, 1.)),
              lambda: .1 + .22 * abs(y) ** 3,
              lambda: 1.,
              lambda: max(.5 * math.exp(-3. * abs(y)), 1. - smooth((abs(y) - .06) / .05)) * (1. - smooth((abs(y) - .8) / .19999999)),
              lambda: trail(y), lambda: trail(u - 1.),
              lambda: .45 + .55 * (math.sin(u * 43.9823) * .5 + .5) * (math.sin(u * 18.849556 + 1.3) * .5 + .5)]
    return max(0., min(values[kind](), 1.))


def prepare_rea(work):
    """Write reproducible bounded Ghidra plans; EXE/MPQs remain in place."""
    work=(ROOT/work).resolve()
    if not work.is_relative_to(ROOT/"runtime"):
        raise ValueError("REA output must stay under project-local runtime/")
    target=latest_target(verify=True)
    if target["sha256"]!=SHA:
        raise ValueError("Marker recovery requires the exact registered 0.109.0 bytes")
    data=target_bytes(target)
    module = load_script("marker_pe", ROOT/"scripts/inventory-executable.py")
    pe=module.PE(data)
    extents={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    groups={"presentation":["receiver","draw","paint","mask","wedge","column","clip",
                            "geometry","arc","project","annulus"],
            "terrain":["terrain_project"],"decal":["gather_aabb","box_clip"],
            "cast_consumer":["cast_consumer"],"cast_packet":["cast_packet"],
            "cast":["cast"],"mip":["mip_average"]}
    disabled="Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables"
    for name,keys in groups.items():
        path=work/name;path.mkdir(parents=True,exist_ok=True)
        lo=min(OWNERS[key][0] for key in keys);hi=max(OWNERS[key][1] for key in keys)
        for key in keys:assert extents[OWNERS[key][0]]==OWNERS[key][1]
        offset=pe.rva_offset(lo-pe.image_base)
        (path/"range.bin").write_bytes(data[offset:offset+hi-lo])
        (path/"seeds.tsv").write_text(''.join(f'{OWNERS[key][0]:#x}\tfunction\n{OWNERS[key][0]:#x}\tcode\n' for key in keys))
        relative=str(path.relative_to(ROOT))
        plan=dict(target=relative+"/range.bin",output=relative+"/rea",init_timeout=60,timeout=240,
                  environment={"REA_GHIDRA_DISABLED_ANALYZERS":disabled,
                               "REA_GHIDRA_SEED_FILE":relative+"/seeds.tsv"},
                  open_options=dict(format="raw-binary",architecture="x86_64",entry_point=hex(lo)),
                  operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=hex(OWNERS[key][0])),label=key) for key in keys])
        (path/"plan.json").write_text(text(plan))
        print(relative+"/plan.json")


def collect_rea(work):
    """Stage compact successful provenance, without copying raw tool logs."""
    work=(ROOT/work).resolve()
    if not work.is_relative_to(ROOT/"runtime"):
        raise ValueError("REA output must stay under project-local runtime/")
    target=latest_target(verify=True)
    if target["sha256"]!=SHA:raise ValueError("Current target changed")
    records=[]
    for plan_path in sorted(work.glob("*/plan.json")):
        plan=json.loads(plan_path.read_text())
        source=(ROOT/plan["target"]).resolve()
        if not source.is_relative_to(work):raise ValueError("Input escapes recovery directory")
        input_hash=hashlib.sha256(source.read_bytes()).hexdigest()
        output=(ROOT/plan["output"]).resolve()
        if not output.is_relative_to(work):raise ValueError("Output escapes recovery directory")
        for operation in plan["operations"]:
            key=operation["label"]
            matches=list(output.glob(f"*-{key}.json"))
            if len(matches)!=1:raise ValueError(f"Missing/ambiguous successful query: {key}")
            response=json.loads(matches[0].read_text())
            assert not response.get("error"),key
            result=response["response"]["result"]
            evidence=result.get("structuredContent") or json.loads(result["content"][0]["text"])
            assert evidence["subject"]["digest"]["sha256"]==input_hash,key
            assert evidence["parameters"]["procedure"]==hex(OWNERS[key][0]),key
            value=evidence["raw_result"]["value"]
            assert isinstance(value,str) and value.strip(),key
            records.append(dict(name=key,va=hex(OWNERS[key][0]),end_va=hex(OWNERS[key][1]),
                                input_range_va=plan["open_options"]["entry_point"],
                                input_byte_count=source.stat().st_size,input_sha256=input_hash,
                                evidence_id=evidence["evidence_id"],provider=evidence["provider"],
                                analysis_profile_digest=evidence["analysis_profile"]["digest"],
                                operation="procedure_pseudo_code"))
    assert {row["name"] for row in records}==set(OWNERS),"Run all generated plans before collection"
    result=dict(target_sha256=SHA,records=records,
                limits=["Raw imports omit outside callees, PE types and most jump-table data.",
                        "Ghidra uses its generic x86-64 compiler model; Win64 parameter roles are checked against instructions and native replay.",
                        "Native direct/indirect ownership outside these ranges remains #41. Successful pseudocode is not parity proof."])
    destination=ROOT/"runtime/analysis/staging/native-evidence/raid-markers/rea-records.json"
    destination.parent.mkdir(parents=True,exist_ok=True)
    destination.write_text(text(result))
    print(str(destination.relative_to(ROOT)))


def check(write):
    global EVIDENCE
    if write:
        EVIDENCE = ROOT / "runtime/analysis/staging/native-evidence/raid-markers"
    target = latest_target(verify=True)
    if target["sha256"] != SHA:
        raise ValueError("Marker recovery requires the exact registered 0.109.0 bytes")
    data = target_bytes(target)
    module = load_script("marker_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                    str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r

    def raw(address, length):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + length]
        assert len(value) == length
        return value

    def span(address, length):
        value = raw(address, length)
        return dict(va=hex(address), byte_count=length,
                    file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    sha256=hashlib.sha256(value).hexdigest())

    # Fail closed if an address ceases to be the declared native extent.
    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    for a, b in OWNERS.values():
        assert extents.get(a) == b
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    md.detail = True
    ranges = []
    for name, (a, b) in OWNERS.items():
        instructions = list(md.disasm(raw(a, b-a), a))
        assert sum(i.size for i in instructions) == b-a
        asm = "\n".join(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip() for i in instructions) + "\n"
        extract = "../raid-waves/cast-start.asm" if name == "cast" else f"{name}.asm"
        record = dict(name=name, **span(a, b-a), extract=extract,
                      extract_sha256=hashlib.sha256(asm.encode()).hexdigest())
        if name == "cast":
            # Reuse the canonical current-target extract; never duplicate it.
            existing = ROOT / "docs/analysis/evidence/raid-waves/cast-start.asm"
            record["extract_sha256"] = hashlib.sha256(existing.read_bytes()).hexdigest()
            assert existing.read_text()==asm
        elif write:
            EVIDENCE.mkdir(parents=True, exist_ok=True)
            (EVIDENCE / record["extract"]).write_text(asm)
        else:
            assert (EVIDENCE / record["extract"]).read_text() == asm
        ranges.append(record)

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def map_native(address):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            mapped.add(page)

    def demand(uc, access, address, size, value, unused):
        # All native reads remain inside the verified PE. Unexpected OS/runtime
        # access fails rather than being replaced by guessed data.
        map_native(address)
        return True

    machine.hook_add(UC_HOOK_MEM_UNMAPPED, demand)
    mem = 0x200000000
    machine.mem_map(mem, 0x100000)
    stop = mem + 0xF0000
    put = lambda a, fmt, *v: machine.mem_write(a, struct.pack("<" + fmt, *v))
    get = lambda a, fmt: struct.unpack("<" + fmt, machine.mem_read(a, struct.calcsize("<" + fmt)))
    f32 = lambda v: struct.unpack("<f", struct.pack("<f", v))[0]
    xf = lambda reg: struct.unpack("<f", machine.reg_read(reg).to_bytes(16, "little")[:4])[0]

    def sx(reg, value):
        machine.reg_write(reg, int.from_bytes(struct.pack("<f", value), "little"))

    machine.mem_map(mem+0x100000,0x1000000)
    heap = mem + 0x100000
    casts = []
    # Actual 0.109.0 CRT thunks, identified in the mask owner. Python libm returns
    # f32 to the native ABI; this does not validate Windows CRT accuracy.
    math_calls = {0x145bfa12f: math.hypot, 0x145bfa135: math.exp,
                  0x145bfa117: math.sin, 0x145bfa11d: math.cos,
                  0x145bfa123: math.atan2, 0x145bfa13b: math.acos, 0x145bfa141: math.ceil}
    line_frames = []
    line_mode = False
    arc_mode = False
    arc_frames = []
    annulus_mode = False
    terrain_vertices = []
    fill_mode = False
    fill_frames = []
    fill_calls = []
    cast_ui_mode = False

    def hook(uc, address, size, unused):
        nonlocal heap
        if cast_ui_mode and address in (0x14067ecf5,0x14067ed63):
            uc.emu_stop()
            return
        if fill_mode and address == 0x140167a8d:
            uc.emu_stop()
            return
        if annulus_mode and address == 0x14013e82f:
            uc.emu_stop()
            return
        if arc_mode and address == 0x14013dcb5:
            uc.emu_stop()
            return
        if address in math_calls:
            args = [xf(r.UC_X86_REG_XMM0)]
            if address in (0x145bfa12f,0x145bfa123):
                args.append(xf(r.UC_X86_REG_XMM1))
            sx(r.UC_X86_REG_XMM0, f32(math_calls[address](*args)))
        elif address == 0x1400021c0:
            count=uc.reg_read(r.UC_X86_REG_RCX)
            assert 0<count<0x100000,count
            uc.reg_write(r.UC_X86_REG_RAX, heap)
            heap += (max(count,0x1000)+4095)&~4095
            assert heap<mem+0x1100000
        elif address in (0x140002200, 0x1400021d0):
            pass  # allocator notification/free; synthetic preallocated buffers
        elif address == 0x1458c2220:
            casts.append((uc.reg_read(r.UC_X86_REG_R8D), uc.reg_read(r.UC_X86_REG_R9D),
                          get(get(uc.reg_read(r.UC_X86_REG_RSP)+0x28, "Q")[0], "I")[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX), bytes(32))
        elif (line_mode or fill_mode) and address == 0x14013df60:
            sp = uc.reg_read(r.UC_X86_REG_RSP)
            frame = list(get(get(sp+0x28,"Q")[0],"11f"))
            if fill_mode:
                fill_frames.append((frame, frame[5:9]))
                planes = get(sp+0x48,"Q")[0]
                fill_calls.append(("project",uc.reg_read(r.UC_X86_REG_R8D)&255,
                                   uc.reg_read(r.UC_X86_REG_R9D)&255,frame,planes))
            else:
                line_frames.append(frame)
            out = uc.reg_read(r.UC_X86_REG_RCX)
            uc.mem_write(out,bytes(48))
            put(out,"3Q",0,4,0)
        elif fill_mode and address in (OWNERS["arc"][0],OWNERS["annulus"][0]):
            sp=uc.reg_read(r.UC_X86_REG_RSP)
            values=[get(sp+offset,"f")[0] for offset in
                    ((0x30,0x38,0x40,0x48) if address==OWNERS["arc"][0] else (0x30,0x38))]
            fill_calls.append(("arc" if address==OWNERS["arc"][0] else "annulus",
                               uc.reg_read(r.UC_X86_REG_R8D)&255,
                               uc.reg_read(r.UC_X86_REG_R9D)&255,values))
            out=uc.reg_read(r.UC_X86_REG_RCX)
            uc.mem_write(out,bytes(48))
            put(out,"3Q",0,4,0)
        elif annulus_mode and address == 0x14008d020:
            header=uc.reg_read(r.UC_X86_REG_RCX)
            for index,vertex in enumerate(terrain_vertices):put(mem+0x50000+index*36,"9f",*vertex)
            put(header,"3Q",4096,mem+0x50000,len(terrain_vertices))
        elif annulus_mode and address == 0x145bfa970:
            header=uc.reg_read(r.UC_X86_REG_RCX)
            _,_,length=get(header,"3Q")
            put(header,"3Q",4096,mem+0x60000,length)
        elif fill_mode and address == 0x14008d020:
            captured=list(get(uc.reg_read(r.UC_X86_REG_R8),"11f"))
            uv_bounds=list(get(uc.reg_read(r.UC_X86_REG_R9)+20,"4f"))
            fill_frames.append((captured,uv_bounds))
            put(uc.reg_read(r.UC_X86_REG_RCX),"3Q",4096,mem+0x50000,0)
        elif line_mode and address == 0x14008d020:
            captured=list(get(uc.reg_read(r.UC_X86_REG_R8),"11f"))
            (arc_frames if arc_mode else line_frames).append(captured)
            if not arc_mode and len(line_frames) == 5:
                uc.emu_stop()
                return
        elif (line_mode or fill_mode) and address == 0x14000d470:
            uc.reg_write(r.UC_X86_REG_RAX,0)
        elif (line_mode or fill_mode) and address == 0x145bfacc0:
            put(uc.reg_read(r.UC_X86_REG_RCX),"3Q",128,mem+0x20000,0)
        else:
            return
        sp = uc.reg_read(r.UC_X86_REG_RSP)
        uc.reg_write(r.UC_X86_REG_RIP, get(sp, "Q")[0])
        uc.reg_write(r.UC_X86_REG_RSP, sp + 8)

    machine.hook_add(UC_HOOK_CODE, hook)

    def call(address, count=100000):
        sp = mem + 0xEFF8
        put(sp, "Q", stop)
        machine.reg_write(r.UC_X86_REG_RSP, sp)
        machine.emu_start(address, stop, count=count)
        assert machine.reg_read(r.UC_X86_REG_RIP) == stop

    worst, mask_cases = 0., 0
    for kind in range(8):
        for u in (.001, .1, .25, .5, .7, .95, .999):
            for v in (.001, .1, .25, .475, .5, .525, .7, .95, .999):
                machine.reg_write(r.UC_X86_REG_RCX, kind)
                for reg, val in ((r.UC_X86_REG_XMM1, u), (r.UC_X86_REG_XMM2, v), (r.UC_X86_REG_XMM3, 1./512)):
                    sx(reg, f32(val))
                call(OWNERS["mask"][0], 1000)
                delta = abs(xf(r.UC_X86_REG_XMM0) - mask_model(kind, f32(u), f32(v), f32(1./512)))
                assert delta < .00007, (kind, u, v, delta)
                worst = max(worst, delta)
                mask_cases += 1

    vertices = [[0.,1.,1.,0.,0.,1.,1.,1.,1.], [0.,2.,-1.,1.,0.,1.,1.,1.,.5], [-2.,3.,0.,.5,1.,1.,1.,1.,0.]]
    for i, vertex in enumerate(vertices):
        put(mem+i*36, "9f", *vertex)
    put(mem+0x1000, "3f", 1., 0., 0.)
    put(mem+0x2000, "3Q", 1024, mem+0x4000, 0)
    for reg, val in ((r.UC_X86_REG_RCX,mem), (r.UC_X86_REG_RDX,3), (r.UC_X86_REG_R8,mem+0x2000), (r.UC_X86_REG_XMM3,0)):
        machine.reg_write(reg,val)
    sp = mem + 0xEFF8
    put(sp+0x28,"f",0.)
    put(sp+0x30,"Q",mem+0x1000)
    put(sp+0x38,"Q",1)
    call(OWNERS["clip"][0])
    assert get(mem+0x2010,"Q")[0] == 6
    actual = [get(mem+0x4000+i*36,"9f") for i in range(6)]
    boundary = (0.,1.5,0.,.5,0.,1.,1.,1.,.75)
    expected = [boundary, tuple(vertices[1]), tuple(vertices[2]), boundary, tuple(vertices[2]), tuple(vertices[2])]
    assert actual == expected

    cast_cases = 0
    for spell in (0, 1234):
        for seconds in (-1., 0., .0019, 1.2349, 5000000.):
            casts.clear()
            put(mem+0x618,"3Q",100,mem+0x5000,0)
            machine.reg_write(r.UC_X86_REG_RCX,mem)
            machine.reg_write(r.UC_X86_REG_RDX,99)
            machine.reg_write(r.UC_X86_REG_R8D,spell)
            sx(r.UC_X86_REG_XMM3,f32(seconds))
            call(OWNERS["cast"][0])
            millis = max(0, min(int(f32(f32(seconds)*1000.)), 0xFFFFFFFF))
            assert casts == ([(spell,millis,2)] if spell else [])
            cast_cases += 1

    cast_ui_mode=True
    cast_ui_cases=0
    bp,queue,buffer=mem+0x8000,mem+0x1000,mem+0x2000
    for caster in (99,100):
        for millis in (0,500):
            for ranged in (False,True):
                put(queue,"3Q",128,buffer,0)
                put(bp+0x1e8,"Q",queue)
                put(bp+0x200,"Q",caster)
                put(bp+0x208,"2I",millis,1234)
                for reg,value in ((r.UC_X86_REG_RDI,99),(r.UC_X86_REG_RBP,bp),
                                  (r.UC_X86_REG_RSP,bp-0x80),(r.UC_X86_REG_RBX,int(ranged))):
                    machine.reg_write(reg,value)
                machine.emu_start(0x14067ec8c,stop,count=1000)
                opened=caster==99 and millis>0 and not ranged
                assert get(queue+16,"Q")[0]==int(opened)
                if opened:assert get(buffer,"3I")== (0,1234,millis)
                cast_ui_cases+=1
    cast_ui_mode=False

    progress_cases = 0
    bp, row = mem+0x8000, mem+0x100
    # Changed current ABI: r14 is the marker and rbp+b8 the extrapolated clock.
    for kind in range(4):
        for fading in (0,1):
            for start,end in ((10.,12.),(10.,10.),(10.,9.)):
                for clock in (9.,10.,10.025,11.,12.,13.):
                    put(row+0x30,"I",fading)
                    put(row+0x7D,"B",kind)
                    put(row+0x70,"2f",start,end)
                    put(bp+0xB8,"f",clock)
                    put(bp+0xB0,"Q",row+128)
                    machine.reg_write(r.UC_X86_REG_RBP,bp)
                    machine.reg_write(r.UC_X86_REG_R14,row)
                    machine.emu_start(0x140167309,0x14016733f,count=100)
                    expected_progress = (max(0.,min(f32(f32(f32(clock)-f32(start))/max(f32(end-start),f32(.05))),1.))
                                         if kind<2 and not fading else 1.)
                    assert abs(xf(r.UC_X86_REG_XMM11)-expected_progress)<.0000002
                    assert bool(get(bp+0x2f0,"I")[0]) == (kind<2 and not fading)
                    progress_cases += 1

    mip_cases = 0
    for width,height in ((4,4),(1,4),(4,1),(1,1)):
        values = [f32((i+1)/17) for i in range(width*height)]
        put(mem+0x4000,f"{len(values)}f",*values)
        put(mem+0x1000,"3Q",len(values),mem+0x4000,len(values))
        put(mem+0x1100,"I",height)
        put(mem+0x1104,"I",width)
        put(mem+0x1200,"3Q",mem+0x1000,mem+0x1100,mem+0x1104)
        put(mem+0x1300+0x30,"Q",mem+0x1200)
        for y in range(max(1,height//2)):
            for x in range(max(1,width//2)):
                put(mem+0x1400,"I",y)
                machine.reg_write(r.UC_X86_REG_RAX,mem+0x1400)
                machine.reg_write(r.UC_X86_REG_RCX,x)
                machine.reg_write(r.UC_X86_REG_RDX,mem+0x1300)
                machine.emu_start(0x1400a68ca,0x1400a695d,count=100)
                at=lambda a,b:values[min(b,height-1)*width+min(a,width-1)]
                expected_average=f32(f32(f32(f32(at(2*x,2*y)+at(2*x+1,2*y))+at(2*x,2*y+1))+at(2*x+1,2*y+1))*.25)
                assert xf(r.UC_X86_REG_XMM0)==expected_average
                mip_cases+=1

    paint_cases = 0
    for style in range(6):
        for occupied in (False,True):
            if (style == 4 and occupied) or (style == 5 and not occupied):
                continue
            for fading in (False,True):
                for burst in (0.,.5,1.):
                    put(mem,"9Q",*(mem+n*0x100 for n in range(1,10)))
                    put(mem+0x100,"3f",1.,.5,.12)
                    put(mem+0x230,"I",int(fading))
                    put(mem+0x27C,"B",int(occupied))
                    put(mem+0x300,"f",burst)
                    put(mem+0x400,"f",1.6 if fading else 1.)
                    put(mem+0x500,"f",.75)
                    put(mem+0x600,"f",.5)
                    put(mem+0xA10,"Q",1)
                    put(mem+0xA2C,"B",style)
                    for reg,value in ((r.UC_X86_REG_RCX,mem),(r.UC_X86_REG_RDX,mem+0xA00),
                                      (r.UC_X86_REG_RBP,mem+0x5000),(r.UC_X86_REG_RSP,mem+0x6000)):
                        machine.reg_write(reg,value)
                    machine.emu_start(0x14013b974,0x14013bbb6,count=2000)
                    white,alpha,glow=[(0.,2. if fading else 1.,0.),(.2,1.,.3+burst*.5),
                                      (.25,.24,0.),(.4,.9,.35),(.3,1.,.3),(.3,.9,.4)][style]
                    rgb=struct.unpack("<4f",machine.reg_read(r.UC_X86_REG_XMM8).to_bytes(16,"little"))[:2]+(xf(r.UC_X86_REG_XMM6),)
                    expected_rgb=tuple(min((v+(1.-v)*white)*(1.6 if fading else 1.),1.) for v in (1.,.5,.12))
                    assert max(abs(a-b) for a,b in zip(rgb,expected_rgb))<.000001
                    assert abs(xf(r.UC_X86_REG_XMM1)-alpha*.75*.5)<.000001
                    assert abs(xf(r.UC_X86_REG_XMM7)-glow*.75*.5)<.000001
                    paint_cases+=1

    # Current line branch: intercept terrain projection, preserving all actual
    # coordinate, bound, cap and frame computations in the original instructions.
    line_mode = True
    bp, row = mem+0x8000, mem+0x100
    put(row+0x54,"I",2)
    put(row+0x58,"6f",20.,6.,100.,200.,3.,0.)
    put(bp+0x350,"3Q",128,mem+0x10000,0)
    for reg,val in ((r.UC_X86_REG_RBP,bp),(r.UC_X86_REG_RSP,bp-0x80),
                    (r.UC_X86_REG_R14,row),(r.UC_X86_REG_RDI,row+0x60),
                    (r.UC_X86_REG_R15,bp+0x1c0),(r.UC_X86_REG_R12,bp+0xe0),
                    (r.UC_X86_REG_R13,bp+0x2c8),(r.UC_X86_REG_RSI,0)):
        machine.reg_write(reg,val)
    table,control=mem+0x2000,mem+0x3000
    put(bp+0x2e8,"Q",table)
    put(table,"4Q",control,15,0,1)
    machine.mem_write(control,bytes([0]+[255]*15))
    put(control-32,"B",4)
    put(control-16,"Q",mem+0x4000)
    sx(r.UC_X86_REG_XMM14,0.)
    machine.emu_start(0x1401673a0,stop,count=100000)
    assert len(line_frames)==5,line_frames
    expected_frames=[(-200.,3.,-100.,1.,0.,0.,20.,-3.,3.,-9.,9.),
                     (-197.,3.,-100.,1.,0.,0.,20.,-.9,.9,-9.,9.),
                     (-203.,3.,-100.,1.,0.,0.,20.,-.9,.9,-9.,9.),
                     (-197.,3.,-100.,0.,-1.,0.,6.,-.9,.9,-9.,9.),
                     (-197.,3.,-120.,0.,-1.,0.,6.,-.9,.9,-9.,9.)]
    for actual_frame,expected_frame in zip(line_frames,expected_frames):
        assert max(abs(a-b) for a,b in zip(actual_frame,expected_frame))<.00002,(actual_frame,expected_frame)

    arc_mode=True
    arc_cases=0
    arc_projection_frames=0
    # Stop after the original arc loop, before its unrelated mesh-handle cache.
    # Empty synthetic terrain lets the real plane clipper run on zero vertices.
    for radius in (0.04,1.,4.,40.,200.):
        for start,end in ((0.,f32(math.tau)),(-.8,.7),(f32(math.tau),0.)):
            arc_frames.clear()
            heap=mem+0x100000
            point,out,context=mem+0x5000,mem+0x6000,mem+0x7000
            put(point,"3f",100.,200.,3.)
            put(context,"5Q",128,mem+0x80000,0,0,0)
            put(out,"3Q",128,mem+0x90000,0)
            sp=mem+0x8fff8
            put(sp,"Q",stop)
            put(sp+0x28,"Q",point)
            width=f32(min(radius*.3,.9))
            for offset,value in ((0x30,radius),(0x38,start),(0x40,end),(0x48,width)):
                put(sp+offset,"f",f32(value))
            for reg,value in ((r.UC_X86_REG_RSP,sp),(r.UC_X86_REG_RCX,out),
                              (r.UC_X86_REG_RDX,context),(r.UC_X86_REG_R8D,1),(r.UC_X86_REG_R9D,4)):
                machine.reg_write(reg,value)
            machine.emu_start(OWNERS["arc"][0],stop,count=100000)
            assert machine.reg_read(r.UC_X86_REG_RIP)==0x14013dcb5
            radius=f32(radius);start=f32(start);end=f32(end)
            cosine=f32(f32(f32(-.02)/max(radius,f32(.04)))+1.)
            step=min(f32(2.*f32(math.acos(cosine))),f32(math.pi/8.))
            count=min(160,max(3,math.ceil(f32(abs(f32(end-start))/step))))
            assert len(arc_frames)==count,(radius,start,end,len(arc_frames),count)
            for index,frame in enumerate(arc_frames):
                first=f32(f32(f32(index*f32(end-start))/count)+start)
                last=f32(f32(f32((index+1)*f32(end-start))/count)+start)
                p=[f32(f32(f32(math.cos(first))*radius)+100.),f32(f32(f32(math.sin(first))*radius)+200.)]
                q=[f32(f32(f32(math.cos(last))*radius)+100.),f32(f32(f32(math.sin(last))*radius)+200.)]
                dx,dy=f32(q[0]-p[0]),f32(q[1]-p[1])
                angle=f32(f32(math.atan2(dy,dx))+f32(math.pi/2.))
                depth=f32(f32(radius*.25)+4.)
                expected=[-p[1],3.,-p[0],f32(math.sin(angle)),f32(math.cos(angle)),
                          -width,f32(f32(math.hypot(dx,dy))+width),-width,width,-depth,depth]
                assert max(abs(a-b)for a,b in zip(frame,expected))<.0002,(radius,index,frame,expected)
            arc_cases+=1
            arc_projection_frames+=len(arc_frames)
    arc_mode=False

    annulus_mode=True
    annulus_cases=0
    annulus_vertices=0
    def polygon_clip(vertices,planes):
        result=[]
        for first in range(0,len(vertices),3):
            polygon=vertices[first:first+3]
            for px,py,offset in planes:
                clipped=[]
                for index,a in enumerate(polygon):
                    b=polygon[(index+1)%len(polygon)]
                    da=f32(f32(f32(-a[2]*px)+f32(-a[0]*py))-offset)
                    db=f32(f32(f32(-b[2]*px)+f32(-b[0]*py))-offset)
                    if da>=0.:clipped.append(a)
                    if (da>=0.)!=(db>=0.):
                        t=f32(da/f32(da-db));clipped.append([f32(x+f32(f32(y-x)*t))for x,y in zip(a,b)])
                polygon=clipped
                if len(polygon)<3:break
            for index in range(1,len(polygon)-1):result.extend([polygon[0],polygon[index],polygon[index+1]])
        return result
    for inner in (1.,3.,8.):
        cosine=f32(f32(f32(-.02)/max(inner,f32(.04)))+1.)
        step=min(f32(2.*f32(math.acos(cosine))),f32(math.pi/8.))
        count=min(160,max(3,math.ceil(f32(f32(math.tau)/step))))
        apothem=f32(f32(math.cos(f32(f32(f32(math.tau)/count)*.5)))*inner)
        for points in [((.1,.1),(.2,.1),(.1,.2)),((12.,1.),(13.,1.),(12.,2.)),
                       ((-.5,-.4),(5.,1.),(1.,5.)),((-6.,-2.),(6.,-2.),(0.,6.))]:
            heap=mem+0x100000
            terrain_vertices=[[-y,float(i),-x,.1+i*.2,.2+i*.1,.2,.3,.4,.4+i*.2]for i,(x,y)in enumerate(points)]
            terrain_vertices=[[f32(v)for v in row]for row in terrain_vertices]
            expected=[]
            radii=[f32(math.sqrt(f32(f32(x*x)+f32(y*y))))for x,y in points]
            edge=max(f32(math.hypot(f32(points[i][0]-points[(i+1)%3][0]),f32(points[i][1]-points[(i+1)%3][1])))for i in range(3))
            if max(radii)>apothem:
                if min(radii)>=f32(inner+f32(f32(edge*edge)/f32(max(inner,.1)*8.))):expected=terrain_vertices
                else:
                    for i in range(count):
                        a=f32(f32(i*f32(math.tau))/count);b=f32(f32((i+1)*f32(math.tau))/count);mid=f32(f32(a+b)*.5)
                        planes=[[-f32(math.sin(a)),f32(math.cos(a)),0.],
                                [f32(math.sin(b)),-f32(math.cos(b)),0.],
                                [f32(math.cos(mid)),f32(math.sin(mid)),apothem]]
                        expected.extend(polygon_clip(terrain_vertices,planes))
            point,out,context=mem+0x5000,mem+0x6000,mem+0x7000
            put(point,"3f",0.,0.,0.);put(context,"5Q",4096,mem+0x50000,0,0,0)
            sp=mem+0x8fff8;put(sp,"Q",stop);put(sp+0x28,"Q",point);put(sp+0x30,"f",20.);put(sp+0x38,"f",inner)
            for reg,value in ((r.UC_X86_REG_RSP,sp),(r.UC_X86_REG_RCX,out),(r.UC_X86_REG_RDX,context),
                              (r.UC_X86_REG_R8D,0),(r.UC_X86_REG_R9D,0)):machine.reg_write(reg,value)
            machine.emu_start(OWNERS["annulus"][0],stop,count=200000)
            assert machine.reg_read(r.UC_X86_REG_RIP)==0x14013e82f
            bp=machine.reg_read(r.UC_X86_REG_RBP);capacity,buffer,length=get(bp+0x38,"3Q")
            assert length==len(expected),(inner,points,length,len(expected))
            actual=[get(buffer+i*36,"9f")for i in range(length)]
            assert all(max(abs(x-y)for x,y in zip(a,b))<.001 for a,b in zip(actual,expected)),(inner,points)
            annulus_cases+=1;annulus_vertices+=length
    annulus_mode=False

    fill_mode=True
    line_fill_cases=0
    native_line_fills=[]
    bp,row=mem+0x8000,mem+0x100
    for progress in (0.,.01,.0101,.04,.2,.5,1.):
        for winding in (False,True):
            fill_frames.clear()
            fill_calls.clear()
            put(row+0x54,"I",2)
            put(row+0x58,"6f",20.,6.,100.,200.,3.,0.)
            put(bp+0x2f0,"I",int(winding))
            put(bp+0x2e8,"Q",table)
            for reg,val in ((r.UC_X86_REG_RBP,bp),(r.UC_X86_REG_RSP,bp-0x80),
                            (r.UC_X86_REG_R14,row),(r.UC_X86_REG_RDI,row+0x60),
                            (r.UC_X86_REG_R15,bp+0x1c0),(r.UC_X86_REG_R12,bp+0xe0),
                            (r.UC_X86_REG_R13,bp+0x2c8),(r.UC_X86_REG_RSI,0)):
                machine.reg_write(reg,val)
            sx(r.UC_X86_REG_XMM11,progress)
            sx(r.UC_X86_REG_XMM14,0.)
            machine.emu_start(0x140167827,stop,count=100000)
            assert machine.reg_read(r.UC_X86_REG_RIP)==0x140167a8d
            admitted=f32(progress)>f32(.01)
            assert len(fill_frames)==(1+int(winding) if admitted else 0),(progress,winding,fill_frames)
            filled=f32(f32(progress)*20.)
            for index,(frame,uv) in enumerate(fill_frames):
                begin=max(f32(filled-f32(1.8)),0.) if index else 0.
                expected=[-200.,3.,-100.,1.,f32(math.cos(f32(math.pi/2.))),begin,filled,-3.,3.,-9.,9.]
                assert max(abs(x-y) for x,y in zip(frame,expected))<.00001,(progress,index,frame,expected)
                assert uv==[begin,filled,-3.,3.],(progress,index,uv)
            native_line_fills.append(dict(progress=progress,winding=winding,
                                          bounds=[frame[5:9] for frame,uv in fill_frames],
                                          uv_bounds=[uv for frame,uv in fill_frames]))
            line_fill_cases+=1
    fill_mode=False

    fill_mode=True
    shape_fill_cases=0
    # Native donut payload is inner, outer; the cone payload is radius, arc.
    for shape,radius,second in [(0,8.,0.),(1,4.,12.),(3,8.,1.2),
                                 (3,8.,4.2),(3,8.,f32(math.tau))]:
        for progress in (0.,.01,.0101,.5,.994,.995,1.):
            for winding in (False,True):
                heap=mem+0x100000
                fill_frames.clear();fill_calls.clear()
                put(row+0x54,"I",shape)
                put(row+0x58,"6f",radius,second,100.,200.,3.,.4)
                put(bp+0x2f0,"I",int(winding))
                put(bp+0x2e8,"Q",table)
                for reg,val in ((r.UC_X86_REG_RBP,bp),(r.UC_X86_REG_RSP,bp-0x80),
                                (r.UC_X86_REG_R14,row),(r.UC_X86_REG_RDI,row+0x60),
                                (r.UC_X86_REG_R15,bp+0x1c0),(r.UC_X86_REG_R12,bp+0xe0),
                                (r.UC_X86_REG_R13,bp+0x2c8),(r.UC_X86_REG_RSI,0)):
                    machine.reg_write(reg,val)
                sx(r.UC_X86_REG_XMM11,progress);sx(r.UC_X86_REG_XMM14,.4)
                machine.emu_start(0x140167827,stop,count=100000)
                assert machine.reg_read(r.UC_X86_REG_RIP)==0x140167a8d
                if f32(progress)<=f32(.01):
                    assert not fill_calls
                elif shape==1:
                    filled=f32(second-f32(f32(progress)*f32(second-radius)))
                    expected=[("annulus",2,1,[second,filled])]
                    if winding and f32(progress)<f32(.995):
                        expected.append(("arc",3,5,[filled,f32(math.tau),0.,f32(min(f32(f32(second-radius)*f32(.3)),f32(1.2)))]))
                    assert len(fill_calls)==len(expected),(shape,progress,winding,fill_calls)
                    for actual,want in zip(fill_calls,expected):
                        assert actual[:3]==want[:3]
                        assert max(abs(a-b) for a,b in zip(actual[3],want[3]))<.00001,(actual,want)
                else:
                    filled=f32(radius*f32(progress))
                    full=shape==0 or second>=f32(6.2731853)
                    wedges=1 if second<=math.pi else 2
                    assert len(fill_calls)==1+int(winding),(shape,progress,winding,fill_calls)
                    for actual in fill_calls[:1]:
                        assert actual[:3]==("project",2,1)
                        assert max(abs(a-b) for a,b in zip(actual[3][5:11],[-filled,filled,-filled,filled,-6.,6.]))<.00001,(shape,progress,actual)
                        assert actual[4]==(0 if full else wedges),(shape,progress,actual)
                    if winding:
                        actual=fill_calls[-1]
                        want=[filled,0.,f32(math.tau),1.2] if full else [filled,f32(f32(.4)-f32(second*.5)),f32(f32(.4)+f32(second*.5)),1.2]
                        assert actual[:3]==("arc",3,5)
                        assert max(abs(a-b) for a,b in zip(actual[3],want))<.00001,(shape,progress,winding,actual,want)
                shape_fill_cases+=1
    fill_mode=False

    column_cases=0
    column_vertices=0
    header,buffer,color=mem+0x1000,mem+0x30000,mem+0x2000
    put(color,"3f",.3,.7,1.)
    for radius in (.9,6.,20.):
        for yaw in (0.,.7):
            put(header,"3Q",4096,buffer,0)
            machine.reg_write(r.UC_X86_REG_RCX,header)
            for reg,value in ((r.UC_X86_REG_XMM1,-200.),(r.UC_X86_REG_XMM2,-100.),(r.UC_X86_REG_XMM3,radius)):
                sx(reg,value)
            sp=mem+0xeff8
            for offset,value in ((0x28,yaw),(0x30,2.5),(0x38,9.5)):
                put(sp+offset,"f",value)
            put(sp+0x40,"2f",.44,.12);put(sp+0x48,"Q",color)
            call(OWNERS["column"][0],100000)
            assert get(header+16,"Q")[0]==192
            expected=[]
            for index in range(32):
                u,v=f32(index*.03125),f32((index+1)*.03125)
                a,b=f32(f32(u*f32(math.tau))+f32(yaw)),f32(f32(v*f32(math.tau))+f32(yaw))
                def vertex(angle,y,u,alpha):
                    return [f32(f32(f32(math.cos(angle))*f32(radius))-200.),y,
                            f32(f32(f32(math.sin(angle))*f32(radius))-100.),u,.5,
                            f32(.3),f32(.7),1.,f32(alpha)]
                a0,b0=vertex(a,2.5,u,.44),vertex(b,2.5,v,.44)
                a1,b1=vertex(a,9.5,u,.12),vertex(b,9.5,v,.12)
                expected.extend([a0,b0,b1,a0,b1,a1])
            actual=[get(buffer+i*36,"9f") for i in range(192)]
            assert all(max(abs(x-y) for x,y in zip(a,b))<.00002 for a,b in zip(actual,expected)),(radius,yaw)
            column_cases+=1;column_vertices+=192

    # The current marker helpers call the real shared-engine projector. Replay
    # its six-plane box clip directly, including its native plane vtables, with
    # synthetic triangles. ECS/collider/BVH selection is still a separate seam.
    box_cases = 0
    triangle, output, frame_ptr = mem+0x5000, mem+0x6000, mem+0x7000
    for yaw in (0., .7, -1.8):
        sin, cos = f32(math.sin(yaw)), f32(math.cos(yaw))
        frame = [3., 2., -4., sin, cos, -1., 1., -1., 1., -1., 1.]
        put(frame_ptr, "11f", *frame)
        def coordinates(point):
            x, y, z = point
            dx, dz = f32(x-frame[0]), f32(z-frame[2])
            return [f32(f32(dx*cos)-f32(dz*sin)), y,
                    f32(f32(dz*cos)+f32(dx*sin))]
        for local in [((0.,0.,0.),(.5,0.,0.),(0.,0.,.5)),
                      ((0.,0.,0.),(2.,.5,0.),(0.,0.,.5)),
                      ((-3.,0.,-3.),(3.,0.,-3.),(0.,0.,3.)),
                      ((0.,-3.,0.),(0.,3.,.5),(.5,0.,0.)),
                      ((4.,0.,4.),(5.,0.,4.),(4.,0.,5.)),
                      ((-1.,0.,-1.),(1.,0.,-1.),(0.,0.,1.))]:
            points = [[f32(frame[0]+f32(f32(x*cos)+f32(z*sin))),
                       f32(frame[1]+y),
                       f32(frame[2]+f32(f32(z*cos)-f32(x*sin)))] for x,y,z in local]
            expected = points
            for axis, bound, sign in [(0,1.,-1.), (0,-1.,1.), (2,1.,-1.),
                                      (2,-1.,1.), (1,3.,-1.), (1,1.,1.)]:
                clipped=[]
                for index,a in enumerate(expected):
                    b=expected[(index+1)%len(expected)]
                    da=f32(f32(coordinates(a)[axis]-bound)*sign)
                    db=f32(f32(coordinates(b)[axis]-bound)*sign)
                    if da>=0.:clipped.append(a)
                    if (da>=0.)!=(db>=0.):
                        t=f32(da/f32(da-db))
                        clipped.append([f32(x+f32(f32(y-x)*t)) for x,y in zip(a,b)])
                expected=clipped
                if len(expected)<3:break
            put(triangle,"9f",*(v for p in points for v in p))
            for reg,value in ((r.UC_X86_REG_RCX,output),(r.UC_X86_REG_RDX,triangle),
                              (r.UC_X86_REG_R8,frame_ptr)):
                machine.reg_write(reg,value)
            call(OWNERS["box_clip"][0], 100000)
            length=get(output+112,"Q")[0]
            assert length==len(expected),(yaw,local,length,len(expected))
            actual=[get(output+i*12,"3f") for i in range(length)]
            assert all(max(abs(x-y) for x,y in zip(a,b))<.00001 for a,b in zip(actual,expected)),(yaw,local,actual,expected)
            box_cases+=1

    source_paths=["crates/azeroth-survivors-re/src/raid_markers.rs",
                  "crates/azeroth-survivors-re/src/gameplay/raid_markers.rs",
                  "crates/azeroth-survivors-re/src/gameplay/raid_markers/geometry.rs",
                  "crates/benilla-world/src/decal.rs","crates/benilla-app/src/spell/net.rs"]
    geometry=(ROOT/source_paths[2]).read_text()
    assert "let begin = (filled - 1.8).max(0.);" in geometry
    assert "[begin, filled, -width * 0.5, width * 0.5]" in geometry
    assert "v.uv[0] =" not in geometry
    result = dict(schema_version=1, target={k:target[k] for k in ("version","path","sha256","size_bytes")},
                  reviewed_source_sha256={path:hashlib.sha256((ROOT/path).read_bytes()).hexdigest() for path in source_paths},
                  ranges=ranges, checks=dict(mask_cases=mask_cases, mask_max_absolute_error=worst,
                                             clipping_cases=1, cast_gate_and_duration_cases=cast_cases, self_cast_bar_gate_cases=cast_ui_cases,
                                             progress_cases=progress_cases, mip_average_cases=mip_cases,
                                             paint_cases=paint_cases, arc_cases=arc_cases, arc_projection_frames=arc_projection_frames, annulus_cases=annulus_cases, annulus_vertices=annulus_vertices, box_clip_cases=box_cases, line_fill_cases=line_fill_cases, shape_fill_cases=shape_fill_cases, column_cases=column_cases, column_vertices=column_vertices,
                                             native_line_projection_frames=line_frames),native_line_fills=native_line_fills,
                  method="Unicorn executes selected EXE instructions with synthetic Win64 memory and explicit allocation/constructor/libm seams; original and rebuilt applications are not launched.",
                  limits=["Mask comparison uses an independent scalar transcription, not compiled Rust.",
                          "Clipping checks one triangle crossing one plane, including interpolated height/UV/alpha and retained duplicate boundary vertices.",
                          "Cast checks stub the packet constructor and preallocate its queue; they do not validate network/UI delivery.",
                          "Eight self-cast gate cases stop before pending-cast clock refinement; a non-self caster is excluded by this native consumer. This does not prove absence of a separate boss UI.",
                          "Arc and annulus cases stop before mesh/image handle cache publication. Shape-fill calls use synthetic helper output; their helper algorithms are checked separately.",
                          "Box clipping uses synthetic triangles and native plane vtables; actual ECS/collider/BVH gathering and terrain availability are not executed.",
                          "Reviewed source fingerprints and text guards record tracing only; the reconstructed Rust is neither compiled nor executed.",
                          "REA/Ghidra raw-range analysis is corroborated by original PE instructions/call sites. External callees and missed jump tables are not complete native semantics.",
                          "Terrain receivers, rendering, complete cast display and original/rebuilt parity remain unverified; source is not compiled or executed."])
    if write:
        (EVIDENCE/"manifest.json").write_text(text(result))
    else:
        assert json.loads((EVIDENCE/"manifest.json").read_text()) == result
    print(text({"target_sha256":SHA, **result["checks"], "compiled_source_executed":False}),end="")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write",action="store_true")
    parser.add_argument("--prepare-rea",action="store_true")
    parser.add_argument("--collect-rea",action="store_true")
    parser.add_argument("--check-scripted-fill", action="store_true")
    parser.add_argument("--work",default="runtime/analysis/history/raid/raid-markers/c4ee1de5a66a")
    args=parser.parse_args()
    if args.prepare_rea:prepare_rea(args.work)
    elif args.collect_rea:collect_rea(args.work)
    elif args.check_scripted_fill:check_scripted_fill()
    else:check(args.write)

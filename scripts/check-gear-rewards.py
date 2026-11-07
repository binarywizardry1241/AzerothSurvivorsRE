#!/usr/bin/env python3
"""Replay current original boss-mark/pity instructions with explicit API seams.

Zone-key lookup, candidate collection, vector growth and free are synthetic;
the native arithmetic, RNG transition, pity increment/reset and output order run
unchanged. No reconstructed code, game, network or server executes.
"""
import hashlib
import argparse
import json
import math
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes, project_path
from native_recovery import f32
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


def replay_lifecycle(proof, target, image, pe):
    """Check the already-curated Continue/reset/final-clear original slices."""
    import bisect
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    assert proof["target"] == {k: target[k] for k in ("version", "path", "sha256", "size_bytes")}
    ranges, data = proof["native_ranges"], proof["native_data"]
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    owners = pe.functions()
    starts = [row[0] for row in owners]
    for row in ranges + data:
        address = int(row["virtual_address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert raw.hex() == row["bytes_hex"]
        assert hashlib.sha256(raw).hexdigest() == row["sha256"]
        if row in ranges:
            decoded = list(decoder.disasm(raw, address))
            assert sum(i.size for i in decoded) == len(raw)
            assert len(decoded) == row["instruction_count"]
            owner = owners[bisect.bisect_right(starts, address - pe.image_base) - 1]
            assert row["containing_unwind_owner"] == [hex(pe.image_base + owner[0]), hex(pe.image_base + owner[1])]
    assert bytes.fromhex(data[0]["bytes_hex"]) == b"end.endless"
    assert struct.unpack("<f", bytes.fromhex(data[1]["bytes_hex"]))[0] == 300.
    u=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def ensure(a,n):
     for page in range(a&~4095,(a+n+4095)&~4095,4096):
      if page not in mapped:u.mem_map(page,4096);mapped.add(page)
    for r in ranges+data:
     a=int(r['virtual_address'],16);ensure(a,r['byte_count']);u.mem_write(a,bytes.fromhex(r['bytes_hex']))
    base=0x33000000;ensure(base,0x20000)
    for a in (0x145bc8b39,0x145c184df):ensure(a,1)
    state={};total=0;counts={}
    wr=lambda name,value:u.reg_write(getattr(reg,'UC_X86_REG_'+name),value)
    put=lambda a,f,*v:u.mem_write(a,struct.pack('<'+f,*v))
    get=lambda a,f:struct.unpack('<'+f,u.mem_read(a,struct.calcsize('<'+f)))
    def hook(_u,a,_n,_d):
     state['steps']+=1;state['last']=a
     if a in state['stops']:state['exit']=a;u.emu_stop()
    u.hook_add(UC_HOOK_CODE,hook)
    def reset(stops):
     u.mem_write(base,bytes(0x20000));state.clear();state.update(stops=set(stops),steps=0)
     for n in ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15'):wr(n,0)
     wr('EFLAGS',2);wr('RBP',base+0x10000);wr('RSP',base+0x1f000)
    def run(a,name):
     nonlocal total
     try:u.emu_start(a,0,count=1000)
     except Exception:print(name,state,flush=True);raise
     assert 'exit'in state;total+=state['steps'];counts[name]=counts.get(name,0)+1
    for mode in range(6):
     for flag in (0,1):
      for phase in (0,1):
       for count in (0,1,9):
        reset([0x145bc8a28,0x145bc8b39]);wr('RCX',base);put(base+0xd2f,'B',mode);put(base+0xd1c,'B',flag);put(base+0xb90,'I',phase);put(base+0xcd8,'I',count);put(base+0xc74,'f',40.);put(base+0xcd4,'f',123.)
        run(0x145bc89eb,'continue_mode_flag_phase_counter');assert get(base+0xb90,'I')[0]==phase and get(base+0xcd8,'I')[0]==count;assert get(base+0xd1c,'B')[0]==(1 if mode==5 else flag);assert get(base+0xd2f,'B')[0]==(1 if mode==5 else mode);assert get(base+0xcd4,'f')[0]==(340. if mode==5 else 123.)
    for final in (0,1,2):
     for phase in (0,1,256):
      reset([0x145c184df]);wr('R13',base+0x1000);put(base+0x1064,'B',final);put(base+0x101e8,'Q',base);put(base+0xb90,'I',phase);put(base+0xb94,'f',123.);wr('XMM13',struct.unpack('<I',struct.pack('<f',40.))[0]);run(0x145c181d8,'post_reward_final_clear');changed=final==1 and phase&255==0;assert get(base+0xb90,'I')[0]==(1 if changed else phase);assert get(base+0xb94,'f')[0]==(40. if changed else 123.)
    for value in (0,1,0xffffffff):
     reset([0x145bdd765]);put(base+0x10ba0,'I',value);put(base+0x10d2c,'B',value&255);run(0x145bdd735,'constructor_resets');assert get(base+0x10ba0,'I')[0]==0 and get(base+0x10d2c,'B')[0]==0
     reset([0x145bdd6f8]);put(base+0x10ce4,'Q',value);run(0x145bdd6ed,'constructor_resets');assert get(base+0x10ce4,'Q')[0]==0
    assert counts == proof["static_check"]["original_instruction_cases"]
    assert total == proof["static_check"]["original_instruction_steps"]
    return {"cases": sum(counts.values()), "native_instruction_steps": total, "result": "passed"}


def replay(verify=True):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    target = latest_target(verify=True)
    assert target["sha256"] == "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
    image = target_bytes(target)
    pe = load_script("gear_rewards_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    data_ranges = []
    for address, expected in (
        (0x14765c370, b"ffffffff" b"ff1eff00" b"ff0070dd" b"ffa335ee" b"ffff8000"),
        (0x14765c3f8, b"\x02|c\xc0\x01[\xc0\x03]|r\x00"),
        (0x147662c68, b"You receive loot:already collected"),
        (0x147662cc0, b"nmarks.gained\x0c |cff9d9d9d(\xc0\x0e)|r |cffffd100\xc0\x02|r\x00New in your collection!"),
    ):
        offset = pe.rva_offset(address - pe.image_base)
        assert image[offset:offset + len(expected)] == expected
        data_ranges.append({"virtual_address": hex(address), "file_offset": hex(offset),
                            "byte_count": len(expected), "sha256": hashlib.sha256(expected).hexdigest()})
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def map_page(address, original=False):
        page = address & ~4095
        if page in mapped: return
        machine.mem_map(page, 4096)
        mapped.add(page)
        if original:
            at = pe.rva_offset(page - pe.image_base)
            machine.mem_write(page, image[at:at + 4096])

    for address in (0x145c135f0, 0x145a9c190, 0x145aff7d0, 0x1400021d0,
                    0x14601b860, 0x145ff0cd0):
        map_page(address)
    for page in range(0x22000000, 0x22060000, 4096): map_page(page)
    for page in range(0x23000000, 0x23020000, 4096): map_page(page)
    for address in (0x146fbe250, 0x146fb2460, 0x146fca2e0, 0x146198260, 0x1462813c0):
        map_page(address, True)
    definitions = []
    for zone in range(12):
        at = pe.rva_offset(0x146fbe250 + zone * 240 + 0x88 - pe.image_base)
        pointer = struct.unpack_from("<Q", image, at)[0]
        definitions.append(pointer)
        for address in range(pointer & ~4095, (pointer + 5 * 0x68 + 4095) & ~4095, 4096):
            map_page(address, True)
    start, end = 0x145c135f0, 0x145c13abf
    at = pe.rva_offset(start - pe.image_base)
    code = image[at:at + end - start]
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(code, start))
    assert sum(i.size for i in instructions) == len(code)
    machine.mem_write(start, code)
    swap_start, swap_end = 0x145be6f10, 0x145be82b7
    swap_at = pe.rva_offset(swap_start - pe.image_base)
    swap_code = image[swap_at:swap_at + swap_end - swap_start]
    swap_instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(swap_code, swap_start))
    assert sum(i.size for i in swap_instructions) == len(swap_code)
    assert not any(i.mnemonic == "call" for i in swap_instructions)
    for page in range(swap_start & ~4095, (swap_end + 4095) & ~4095, 4096): map_page(page)
    machine.mem_write(swap_start, swap_code)
    stop, game = 0x2301fff0, 0x22000000
    state = {}
    for address in (0x145a9c190, 0x145aff7d0, 0x1400021d0, 0x14601b860, 0x145ff0cd0, stop):
        machine.mem_write(address, b"\xc3")

    def word(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def ret():
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        machine.reg_write(r.UC_X86_REG_RIP, word(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(uc, address, _size, _data):
        state["steps"] += 1
        if address == stop:
            uc.emu_stop()
        elif address == 0x145a9c190:
            uc.reg_write(r.UC_X86_REG_RAX, state["zone"])
            ret()
        elif address == 0x145aff7d0:
            assert uc.reg_read(r.UC_X86_REG_RDX) & 0xff == 1
            assert uc.reg_read(r.UC_X86_REG_R8) == state["zone"]
            assert uc.reg_read(r.UC_X86_REG_R9) == state["boss"]
            destination = uc.reg_read(r.UC_X86_REG_RCX)
            uc.mem_write(destination, struct.pack("<QQQ", 3, 0x22030000, 3))
            ret()
        elif address == 0x1400021d0:
            ret()
        else:
            assert (swap_start <= address < swap_end if state.get("mode") == "swap"
                    else start <= address < end), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]

    mask = 2**64 - 1
    def draw(values):
        a, b, c, d = values
        z = (a + d) & mask
        value = (((z << 23) | (z >> 41)) + a) & mask
        t = (b << 17) & mask
        c ^= a;d ^= b;b ^= c;a ^= d;c ^= t
        d = ((d << 45) | (d >> 19)) & mask
        return [a, b, c, d], f32((value >> 40) * 2**-24)

    cases, steps = [], 0
    for zone in range(12):
        for boss in (0, 4):
            for rank in (0, 1, 2, 3, 4, 5, 6, 255):
                for misses in (0, 1, 9, 255):
                    for endless in (None, 0, 3):
                        machine.mem_write(game, bytes(0x60000))
                        machine.mem_write(0x23000000, bytes(0x20000))
                        machine.mem_write(stop, b"\xc3")
                        state.update(zone=zone, boss=boss, steps=0)
                        original_rng = [0x123456789abcdef0, 0xfedcba9876543210, 0x12345678, 0x87654321]
                        machine.mem_write(game + 0xbc0, struct.pack("<4Q", *original_rng))
                        machine.mem_write(game + 0x354, b"\x01")
                        machine.mem_write(game + 0x36f, bytes([rank]))
                        machine.mem_write(game + 0xb90, struct.pack("<I", int(endless is not None)))
                        machine.mem_write(game + 0xcd8, struct.pack("<I", endless or 0))
                        machine.mem_write(game + 0x2c0, struct.pack("<f", -.4))
                        initial_pity = ([(101000, misses)] if misses else []) + [(101020, 7)]
                        machine.mem_write(game + 0x1e8, struct.pack("<QQQ", 128, 0x22010000, len(initial_pity)))
                        machine.mem_write(0x22010000, b"".join(struct.pack("<IB3x", *row) for row in initial_pity))
                        for offset, pointer in ((0x6d0, 0x22020000), (0x6e8, 0x22021000)):
                            machine.mem_write(game + offset, struct.pack("<QQQ", 128, pointer, 0))
                        candidates = [(101000, .6), (101010, .2), (101030, .01)]
                        machine.mem_write(0x22030000, b"".join(struct.pack("<If", *row) for row in candidates))
                        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
                            machine.reg_write(getattr(r, "UC_X86_REG_" + name), 0)
                        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
                        machine.reg_write(r.UC_X86_REG_RSP, 0x2301f008)
                        machine.mem_write(0x2301f008, struct.pack("<Q", stop))
                        machine.reg_write(r.UC_X86_REG_RCX, game)
                        machine.reg_write(r.UC_X86_REG_RDX, definitions[zone] + boss * 0x68)
                        machine.emu_start(start, stop, count=10000)
                        assert machine.reg_read(r.UC_X86_REG_RIP) == stop
                        actual = {}
                        for key, offset in (("items", 0x6d0), ("missed_ids", 0x6e8)):
                            pointer, count = word(game + offset + 8), word(game + offset + 16)
                            actual[key] = list(struct.unpack("<" + "I" * count, machine.mem_read(pointer, count * 4))) if count else []
                        actual["pity"] = sorted(struct.unpack("<IB3x", machine.mem_read(word(game + 0x1f0) + i * 8, 8)) for i in range(word(game + 0x1f8)))
                        actual["marks"] = struct.unpack("<f", machine.mem_read(game + 0xc9c, 4))[0]
                        assert machine.mem_read(game + 0xc9c, 4) == machine.mem_read(game + 0x7f4, 4) == machine.mem_read(game + 0x7f8, 4)
                        multiplier = [1., 1.3, 1.4, 1.5, 1.6, 1.7][rank] if rank <= 5 else 1.
                        mark_multiplier = [.5, 1., 1.25, 1.5, 2., 2.5][rank] if rank <= 5 else .5
                        marks = float(zone // 2 + 1)
                        if endless is not None: marks = f32(marks * max(endless, 1))
                        elif boss == 4: marks = f32(marks * 3)
                        marks = f32(marks * mark_multiplier)
                        expected = {"items": [], "missed_ids": [], "marks": marks}
                        pity = dict(initial_pity)
                        rng = original_rng
                        for item, base in candidates:
                            bonus = f32(pity.get(item, 0) * f32(.1))
                            chance = f32(f32(f32(f32(base) + f32(-.4)) + bonus) * f32(multiplier))
                            rng, value = draw(rng)
                            if chance > value:
                                expected["items"].append(item);pity.pop(item, None)
                            else:
                                expected["missed_ids"].append(item);pity[item] = min(pity.get(item, 0) + 1, 255)
                        expected["pity"] = sorted(pity.items())
                        assert actual == expected, (zone, boss, rank, misses, endless, actual, expected)
                        assert list(struct.unpack("<4Q", machine.mem_read(game + 0xbc0, 32))) == rng
                        cases.append({"zone": zone, "boss": boss, "rank": rank, "misses": misses,
                                      "endless": endless, "expected": json.loads(json.dumps(actual))})
                        steps += state["steps"]
    # Execute the complete current private-hero swap twice. It is involutive
    # while preserving both shared world fields; no engine/function seam runs.
    left, right = game, game + 0x40000
    before_left = bytes((index * 17 + 31) & 255 for index in range(0x3000))
    before_right = bytes((index * 29 + 61) & 255 for index in range(0x3000))
    machine.mem_write(left, before_left)
    machine.mem_write(right, before_right)
    for _ in range(2):
        state.update(mode="swap", steps=0)
        machine.reg_write(r.UC_X86_REG_RSP, 0x2301f008)
        machine.mem_write(0x2301f008, struct.pack("<Q", stop))
        machine.reg_write(r.UC_X86_REG_RCX, left)
        machine.reg_write(r.UC_X86_REG_RDX, right)
        machine.emu_start(swap_start, stop, count=10000)
        assert machine.reg_read(r.UC_X86_REG_RIP) == stop
        assert machine.mem_read(left + 0xcd8, 4) == before_left[0xcd8:0xcdc]
        assert machine.mem_read(left + 0xb90, 4) == before_left[0xb90:0xb94]
        if _ == 0:
            assert machine.mem_read(left + 0x7f4, 4) != before_left[0x7f4:0x7f8]
            assert machine.mem_read(left + 0x7f8, 4) != before_left[0x7f8:0x7fc]
        steps += state["steps"]
    assert machine.mem_read(left, len(before_left)) == before_left
    assert machine.mem_read(right, len(before_right)) == before_right
    result = {"target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
              "range": {"virtual_address": hex(start), "file_offset": hex(at), "byte_count": len(code),
                        "sha256": hashlib.sha256(code).hexdigest(), "instruction_count": len(instructions)},
              "case_count": len(cases), "case_digest": hashlib.sha256(json.dumps(cases, sort_keys=True).encode()).hexdigest(),
              "shared_state_swap_cases": 2,
              "swap_range": {"virtual_address": hex(swap_start), "file_offset": hex(swap_at),
                             "byte_count": len(swap_code), "sha256": hashlib.sha256(swap_code).hexdigest(),
                             "instruction_count": len(swap_instructions)},
              "data_ranges": data_ranges,
              "native_instruction_steps": steps, "result": "passed",
              "limits": "Zone lookup/candidate collection/allocation seams for boss rolls; complete original private swap executes without seams. No application, Rust, game, network or server executes."}
    if verify:
        source_root = Path(__file__).resolve().parents[1]
        proof = json.loads((source_root / "docs/analysis/evidence/gear-rewards.json").read_text())
        for key in result: assert result[key] == proof[key], key
        lifecycle = proof["lifecycle_evidence"]
        lifecycle_path = source_root / lifecycle["path"]
        assert hashlib.sha256(lifecycle_path.read_bytes()).hexdigest() == lifecycle["sha256"]
        replay_lifecycle(json.loads(lifecycle_path.read_text()), target, image, pe)
        for row in proof["source_bindings"]:
            assert hashlib.sha256((source_root / row["path"]).read_bytes()).hexdigest() == row["sha256"]
        for query in proof["queries"]:
            for role in ("plan", "journal", "result", "raw_input"):
                assert hashlib.sha256((ROOT / query[role]["path"]).read_bytes()).hexdigest() == query[role]["sha256"]
            raw = json.loads((ROOT / query["result"]["path"]).read_text())
            native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
            verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    return result


def replay_earned_marks(proof):
    """Current tag13, serial, sanitizer, actual duplicate ledger and snapshot math."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED, UC_MEM_READ_UNMAPPED
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    image = target_bytes(target)
    pe = load_script('earned_marks_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    assert proof['target'] == {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    rows = proof['native_ranges'] + proof['native_data']
    for row in rows:
        address = int(row['virtual_address'], 16)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + row['byte_count']]
        assert raw.hex() == row['bytes_hex'] and hashlib.sha256(raw).hexdigest() == row['sha256']
        if 'instruction_count' in row:
            decoded = list(decoder.disasm(raw, address))
            assert len(decoded) == row['instruction_count'] and sum(i.size for i in decoded) == len(raw)
    values = {row['role']: bytes.fromhex(row['bytes_hex']) for row in proof['native_data']}
    assert values['quantization-ten'] == struct.pack('<f', 10.)
    assert values['quantization-epsilon'] == struct.pack('<f', 0.001)
    assert values['duplicate-mark-table'] == struct.pack('<6f', 1., 2., 3., 5., 8., 6.)
    for imported in proof['native_imports']:
        library = next(row for row in pe.imports() if row['library'] == imported['library'])
        slot = int(library['iat_start_address'], 16) + library['functions'].index(imported['name']) * 8
        assert slot == int(imported['iat_address'], 16)
        thunk = int(imported['thunk'], 16)
        at = pe.rva_offset(thunk - pe.image_base)
        raw = image[at:at + 6]
        assert raw[:2] == b'\xff\x25' and thunk + 6 + struct.unpack('<i', raw[2:])[0] == slot
    for reference in proof['retained_queries']:
        manifest = json.loads(project_path(reference['manifest']).read_text())
        query = next(q for q in manifest['queries'] if q['role'] == reference['role'])
        for key in ('result', 'raw_input', 'plan', 'journal'):
            assert hashlib.sha256(project_path(query[key]['path']).read_bytes()).hexdigest() == query[key]['sha256']
        native = json.loads(project_path(query['result']['path']).read_text())
        native = native.get('structuredContent') or json.loads(native['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    def ensure(a, n):
        for page in range(a & ~4095, (a + n + 4095) & ~4095, 4096):
            if page not in mapped:
                u.mem_map(page, 4096)
                mapped.add(page)
    def original_page(address):
        address &= ~4095
        at = pe.rva_offset(address - pe.image_base)
        ensure(address, 4096)
        u.mem_write(address, image[at:at + 4096])
    for row in rows:
        a = int(row['virtual_address'], 16)
        ensure(a, row['byte_count'])
        u.mem_write(a, bytes.fromhex(row['bytes_hex']))
    base, stack, stop = 0x33000000, 0x3303e000, 0x3303fff0
    ensure(base, 0x40000)
    u.mem_write(stop, b'\xcc')
    writers = {0x145ec0be0: 1, 0x145ec0d80: 4, 0x145ec0c20: 'float'}
    for a in (*writers, 0x14606179f):
        ensure(a, 1)
        u.mem_write(a, b'\xc3')
    state, cases = dict(steps=0, stops={stop}, output=bytearray()), []
    wr = lambda name, value: u.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    rd = lambda name: u.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    put = lambda a, form, *values: u.mem_write(a, struct.pack('<' + form, *values))
    get = lambda a, form: struct.unpack('<' + form, u.mem_read(a, struct.calcsize('<' + form)))
    bits = lambda value: struct.unpack('<I', struct.pack('<f', value))[0]
    def ret():
        sp = rd('RSP')
        wr('RIP', get(sp, 'Q')[0])
        wr('RSP', sp + 8)
    def hook(_u, a, _n, _context):
        if a in state['stops']:
            u.emu_stop()
        elif a in writers:
            kind = writers[a]
            if kind == 'float':
                state['output'].extend(struct.pack('<I', rd('XMM1') & 0xffffffff))
            else:
                state['output'].extend((rd('RDX') & ((1 << (kind * 8)) - 1)).to_bytes(kind, 'little'))
            wr('RAX', rd('RCX'))
            ret()
        elif a == 0x14606179f:
            value = struct.unpack('<f', struct.pack('<I', rd('XMM0') & 0xffffffff))[0]
            wr('XMM0', bits(float(math.floor(value))))
            ret()
        else:
            state['steps'] += 1
    def fault(_u, access, address, _n, _value, _context):
        if access != UC_MEM_READ_UNMAPPED: return False
        try:
            original_page(address)
            return True
        except ValueError:
            return False
    u.hook_add(UC_HOOK_CODE, hook)
    u.hook_add(UC_HOOK_MEM_UNMAPPED, fault)
    def reset(stops):
        u.mem_write(base, bytes(0x30000))
        state['stops'] = set(stops)
        for a in stops:
            ensure(a, 1)
            u.mem_write(a, b'\xcc')
        state['output'].clear()
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
            wr(name, 0)
        for n in range(16): wr('XMM' + str(n), 0)
        wr('EFLAGS', 2)
        wr('RBP', base + 0x20000)
        wr('RSP', stack)
        put(stack, 'Q', stop)
    def run(a):
        try: u.emu_start(a, 0, count=20000)
        except Exception as error: raise AssertionError(hex(rd('RIP'))) from error
        assert rd('RIP') in state['stops']

    for count in (0, 1, 2, 16):
        grants = [(101000 + i * 10, 0xffffffff if i == 1 else i + 1,
                   0x7fc01234 if i == 1 else bits(17.5 + i)) for i in range(count)]
        reset([0x145d15f90])
        wr('RDI', base)
        put(base + 0x10, 'QQ', base + 0x1000, count)
        for index, grant in enumerate(grants): put(base + 0x1000 + index * 12, 'III', *grant)
        run(0x145d14c3a)
        expected = b'\x0d' + struct.pack('<I', count) + b''.join(struct.pack('<III', *row) for row in grants)
        assert state['output'] == expected
        cases.append(('tag13', expected.hex()))

    for serial in (0, 17, 0xffffffff):
        for reward in (0.0, 2.5, 40.0, 100.0):
            reset([0x145c2f47c])
            wr('RSI', base)
            wr('XMM6', bits(reward))
            put(base + 0xce8, 'f', 5.)
            put(base + 0x814, 'ffI', 15., 30., serial)
            run(0x145c2f418)
            expected = (f32(15. + reward), max(30., reward), (serial + 1) & 0xffffffff)
            assert get(base + 0x814, 'ffI') == expected
            assert get(base + 0xce8, 'f')[0] == f32(5. + reward)
            cases.append(('boss-counter', serial, reward, expected))
            # The same successful queue entry retains the now-current serial.
            state['stops'] = {0x145c2f625}
            wr('RBX', 101040)
            wr('R14', 0)
            put(base + 0x6d8, 'Q', base + 0x1000)
            run(0x145c2f602)
            assert get(base + 0x1000, 'III') == (101040, expected[2], bits(reward))
            assert get(base + 0x6e0, 'Q')[0] == 1

    for count in (0, 1, 4, 24):
        reset([stop])
        values = [0x80000000, bits(-1.), bits(500.), 0x7fc01234, bits(17.5), 0x7f800000]
        grants = [(999 if i % 5 == 4 else 101000, i + 7, values[i % len(values)])
                  for i in range(count)]
        for index, grant in enumerate(grants): put(base + 0x1000 + index * 12, 'III', *grant)
        put(base + 0x100, 'QQQQ', 0, base + 0x1000, count, base + 0x1000 + count * 12)
        put(base + 0x2000, 'QQQ', 1, base + 0x2100, 1)
        put(base + 0x2100, 'I', 101000)
        put(base + 0x800, 'Q', base + 0x2000)
        put(base + 0x880, 'Q', 16)
        put(base + 0x900, 'QQ', base + 0x800, base + 0x880)
        wr('RCX', base + 0x300)
        wr('RDX', base + 0x100)
        wr('R8', base + 0x1000)
        wr('R9', base + 0x1000)
        wr('RSP', stack + 8)
        put(stack + 8, 'Q', stop)
        put(stack + 0x30, 'Q', base + 0x900)
        run(0x145d0e000)
        output_end = get(base + 0x310, 'Q')[0]
        actual = bytes(u.mem_read(base + 0x1000, output_end - (base + 0x1000)))
        expected = []
        for item, key, raw in grants:
            if item != 101000: continue
            value = struct.unpack('<f', struct.pack('<I', raw))[0]
            if not math.isfinite(value): value = 0.
            elif value < 0.: value = 0.
            elif value > 400.: value = 400.
            expected.append((item, key, bits(value)))
            if len(expected) == 16: break
        assert actual == b''.join(struct.pack('<III', *row) for row in expected)
        assert get(base + 0x880, 'Q')[0] == 16 - len(expected)
        cases.append(('grant-sanitizer', count, expected))

    for previous in (0, 61, 64, 80):
        for count in (0, 1, 16):
            reset([0x145bd8c18])
            wr('RSI', base)
            put(base + 0x11a8, 'Q', previous)
            put(base + 0x20428, 'Q', count)
            run(0x145bd8be4)
            accepted = min(count, max(64 - previous, 0))
            assert get(base + 0x20428, 'Q')[0] == accepted
            assert get(base + 0x11a8, 'Q')[0] == previous + accepted
            cases.append(('zone-budget', previous, count, accepted))

    # Delayed duplicates from two bosses: the first boss's base is seeded once.
    reset([0x145bac312, 0x145bac34f])
    ledger, pairs = base + 0x8000, base + 0x1000
    put(ledger, 'QQQf', 32, pairs, 0, 0.)
    expected_total, expected_bosses = 0., {}
    for key, base_marks, duplicate in [(1, 40., 8.), (2, 30., 8.), (1, 40., 8.),
                                        (3, 20., 6.8), (3, 20., 0.5)]:
        wr('R15', ledger)
        wr('R12', base)
        wr('RSI', key)
        wr('XMM6', bits(duplicate))
        wr('XMM12', bits(base_marks))
        wr('XMM8', bits(10.))
        wr('XMM9', bits(0.001))
        run(0x145bac2a8)
        earned = f32(math.floor(f32(f32(duplicate * 10.) + f32(0.001))) / 10.)
        expected_total = f32(expected_total + earned)
        expected_bosses[key] = f32(expected_bosses.get(key, base_marks) + earned)
        assert get(ledger + 0x18, 'f')[0] == expected_total
        length = get(ledger + 0x10, 'Q')[0]
        actual = dict(get(pairs + index * 8, 'If') for index in range(length))
        assert actual == expected_bosses
        cases.append(('duplicate-ledger', key, base_marks, duplicate, earned, expected_total, list(actual.items())))

    for base_total, base_max, duplicate_total, duplicate_max in [(0., 0., 0., 0.),
            (70., 40., 24., 56.), (100., 50., 8., 38.), (95., 30., 13.6, 43.6)]:
        reset([0x145bd144d])
        put(base + 0x20130, 'ff', base_total, base_max)
        wr('XMM6', bits(duplicate_total))
        wr('XMM7', bits(duplicate_max))
        run(0x145bd1422)
        actual = (rd('XMM6') & 0xffffffff, rd('XMM0') & 0xffffffff)
        expected = (bits(f32(duplicate_total + base_total)), bits(max(base_max, duplicate_max)))
        assert actual == expected
        cases.append(('snapshot', base_total, base_max, duplicate_total, duplicate_max, actual))

    for path, needles in proof['source_contracts'].items():
        text = project_path(path).read_text()
        for needle in needles: assert needle in text, (path, needle)
    return dict(cases=len(cases), original_instruction_steps=state['steps'],
        case_sha256=hashlib.sha256(json.dumps(cases, sort_keys=True).encode()).hexdigest(),
        application_executed=False, compilation='not_run', parity='unverified',
        seams=['typed append writers', 'preallocated vectors', 'C floorf', 'snapshot scalar inputs'])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', type=project_path)
    args = parser.parse_args()
    print(json.dumps(replay_earned_marks(json.loads(args.proof.read_text())) if args.proof else replay(), indent=2))

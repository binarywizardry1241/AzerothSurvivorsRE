#!/usr/bin/env python3
"""Revalidate current Armory effects, PvP/faction metadata and zone/drop mapping.

--write curates the compact source delta and evidence. Default checks read-only.
Three native scaling consumers replay over preallocated buffers with a roundf seam.
"""
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
WORK = ROOT / "runtime/secondary-pages-0.109.0"
from coverage_common import latest_target, target_bytes
SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
ASSET = ROOT / "crates/azeroth-survivors-re/assets/armory-catalog-delta-0.109.0.json"
CLASS_TABLE, PVP_TABLE = 0x147235b80, 0x147235bd8
BASE, EXTRA, SCALE = 0x147237a1c, 0x147237a88, 0x145de7a30
SCALERS = (0x1459d12e0, 0x1459d1520, 0x1459d1760)


def write(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n")


def f32(value):
    return _shared_f32(value)


def load():
    target = latest_target(verify=False)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    if hashlib.sha256(data).hexdigest() != SHA:
        raise SystemExit("Selected EXE SHA-256 mismatch")
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    return data, module.PE(data)


def recover(data, pe, display_values):
    def read(a, size):
        offset = pe.rva_offset(a - pe.image_base)
        result = data[offset:offset + size]
        assert len(result) == size
        return result

    def unpack(a, fmt):
        return struct.unpack(fmt, read(a, struct.calcsize(fmt)))

    def q(a):
        return unpack(a, "<Q")[0]

    def string(a):
        ptr, size = unpack(a, "<QQ")
        assert 0 < size < 4096
        return read(ptr, size).decode()

    spans = []

    def retain(role, a, size):
        spans.append(dict(role=role, virtual_address=hex(a),
                          file_offset=hex(pe.rva_offset(a - pe.image_base)), byte_count=size,
                          sha256=hashlib.sha256(read(a, size)).hexdigest()))

    def effects(a, count):
        return [unpack(a + i * 8, "<If") for i in range(count)]

    def scaled(rows, rarity, extra=False):
        factor = f32(scale * (extra_scale if extra else base_scale)[rarity])
        return [(tag, float(math.floor(f32(value * factor) + 0.5)) if tag == 2
                 else f32(value * factor)) for tag, value in rows]

    labels = None
    for match in re.finditer(rb'\{\r?\n  "game\.title":', data):
        candidate, _ = json.JSONDecoder().raw_decode(
            data[match.start():match.start() + 400000].decode(errors="replace"))
        if candidate.get("common.male") == "Male" and candidate.get("noun.plate.0") == "Helm":
            assert labels is None
            labels = candidate
    assert labels and labels["rarity.5"] == "PvP"
    base_scale, extra_scale = unpack(BASE, "<6f"), unpack(EXTRA, "<6f")
    scale = unpack(SCALE, "<f")[0]
    armor = [effects(a, n) for a, n in [(0x147231d14, 2), (0x147231d24, 2),
        (0x147231d34, 2), (0x147231d44, 2), (0x147231d54, 2), (0x147231d64, 1),
        (0x147231d6c, 1), (0x147231d74, 3)]]
    extras = [effects(0x147231d8c + i * 16, 2) for i in range(8)]
    inventory = unpack(0x147231cec, "<8I")
    slots = list(read(0x147231d0c, 8))
    ordinary = json.loads((ROOT / "crates/azeroth-survivors-re/assets/armory.json").read_text())
    classes, scaler_cases, unchanged = [], [], 0
    ordinary_changes = []
    preview = {p["id"]: p for p in json.loads((ROOT / "crates/azeroth-survivors-re/assets/save-gear-0.97.2.json").read_text())["preview_items"]}
    for hero in ordinary["classes"]:
        cid = hero["id"]
        record, pvp = q(CLASS_TABLE + (cid - 1) * 8), q(PVP_TABLE + (cid - 1) * 8)
        material, stored = unpack(record + 296, "<BB")
        assert stored == cid
        weapon_count, pvp_count = q(record + 128), q(pvp + 40)
        assert weapon_count == pvp_count and weapon_count in (1, 2)
        retain(f"class-{cid}", record, 304)
        retain(f"pvp-{cid}", pvp, 120)
        retain(f"pvp-weapons-{cid}", q(pvp + 32), pvp_count * 48)
        items = []
        for slot in range(8 + pvp_count):
            if slot < 8:
                raw = armor[slot]
                names = [labels["item.name_prefix"].replace("{noun}", labels[f"noun.{hero['material'].lower()}.{slot}"]).replace("{set}", string(pvp + side * 16)) for side in range(2)]
                displays = [unpack(pvp + 48 + side * 32 + slot * 4, "<I")[0] or unpack(record + 232 + slot * 4, "<I")[0] for side in range(2)]
                metadata = dict(item_class=4, item_subclass=material,
                    inventory_type=20 if slot == 2 and material == 1 else inventory[slot], sheath=0,
                    slot_id=slots[slot], material=hero["material"])
            else:
                weapon = q(record + 120) + (slot - 8) * 144
                variant = q(pvp + 32) + (slot - 8) * 48
                retain(f"weapon-{cid}-{slot}", weapon, 144)
                raw = effects(q(weapon + 88), q(weapon + 96))
                names = [string(variant + side * 24 + 8) for side in range(2)]
                displays = [unpack(variant + side * 24, "<I")[0] for side in range(2)]
                ic, isc, it, sheath = unpack(weapon + 104, "<4I")
                metadata = dict(item_class=ic, item_subclass=isc, inventory_type=it,
                                sheath=sheath, slot_id=read(weapon + 140, 1)[0], material="")
            extra = extras[(cid * 3 + slot) % 8]
            merged = {}
            for tag, value in scaled(raw, 5) + scaled(extra, 5, True):
                merged[tag] = f32(merged.get(tag, 0.) + value)
            item_id = 100000 + cid * 1000 + slot * 100 + 50
            flavor_index = (cid * 3 + slot) % 8
            flavor_ptr = q(0x147234e38 + flavor_index * 176 + (cid - 1) * 8)
            flavor_size = q(0x147234e90 + flavor_index * 176 + (cid - 1) * 8)
            flavor = read(flavor_ptr, flavor_size).decode()
            retain(f"flavor-{cid}-{slot}", flavor_ptr, flavor_size)
            item = dict(id=item_id, slot=slot, rarity=5, name=names[0], display_id=displays[0],
                        **metadata, effects=[dict(tag=t, value=v) for t, v in merged.items()],
                        flavor=flavor, horde=dict(name=names[1], display_id=displays[1]))
            # Both faction IDs have the same numeric tier. Neither receives legendary extras.
            for side in range(2):
                old = preview[item_id + side * 10]
                assert (old["display_id"], old["inventory_type"]) == (displays[side], metadata["inventory_type"]), (item_id,side,old["display_id"],displays[side],old["inventory_type"],metadata["inventory_type"])
            items.append(item)
            scaler_cases += [dict(owner=hex(SCALERS[int(slot >= 8)]), rarity=5, rows=raw,
                                  expected=scaled(raw, 5)),
                             dict(owner=hex(SCALERS[2]), rarity=5, rows=extra,
                                  expected=scaled(extra, 5, True))]
        classes.append(dict(id=cid, items=items))
        for piece in hero["items"]:
            slot, rarity = piece["slot"], piece["rarity"]
            if slot < 8:
                raw = armor[slot]
            else:
                weapon = q(record + 120) + (slot - 8) * 144
                raw = effects(q(weapon + 88), q(weapon + 96))
            if slot < 8:
                display = display_values[(cid,slot,rarity)]
                fields=dict(display_id=display,item_class=4,item_subclass=material,
                    inventory_type=20 if slot==2 and material==1 else inventory[slot],
                    sheath=0,slot_id=slots[slot],material=hero['material'])
            else:
                ic,isc,it,sheath=unpack(weapon+104,'<4I')
                if rarity==4 and read(weapon,1)[0]:isc=unpack(weapon+4,'<I')[0]
                fields=dict(display_id=unpack(weapon+120+rarity*4,'<I')[0],item_class=ic,
                    item_subclass=isc,inventory_type=it,sheath=sheath,
                    slot_id=read(weapon+140,1)[0],material='')
            assert all(piece[k]==v for k,v in fields.items() if k!='display_id'),(piece['id'],fields)
            patch=dict(id=piece['id'])
            if piece['display_id']!=fields['display_id']:patch['display_id']=fields['display_id']
            assert all(preview[piece['id']][k]==fields[k] for k in ['display_id','inventory_type']), (piece['id'], preview[piece['id']],fields)
            if rarity:
                lore=f"lore.{'plain' if rarity<3 else hero['key']}.{(cid*3+slot)%8}"
                assert labels[lore]==piece['flavor'],piece['id']
            rows = scaled(raw, rarity)
            if rarity:
                rows += scaled(extras[(cid * 3 + slot) % 8], rarity, True)
                if rarity == 4:
                    rows.append((11, 1.) if slot >= 8 else (12, struct.unpack("<f", bytes.fromhex("31082c3d"))[0]))
            merged = {}
            for tag, value in rows:
                merged[tag] = f32(merged.get(tag, 0.) + value)
            current = [dict(tag=t, value=v) for t, v in merged.items()]
            if piece["effects"] != current:
                patch["effects"]=current
            else:
                unchanged += 1
            if len(patch)>1:ordinary_changes.append(patch)
            scaler_cases += [dict(owner=hex(SCALERS[int(slot>=8)]),rarity=rarity,rows=raw,expected=scaled(raw,rarity))]
            if rarity:
                extra = extras[(cid*3+slot)%8]
                scaler_cases += [dict(owner=hex(SCALERS[2]),rarity=rarity,rows=extra,expected=scaled(extra,rarity,True))]
    menu = json.loads((ROOT / "crates/azeroth-survivors-re/assets/menu.json").read_text())
    tiers, rates = unpack(0x14722d658, "<12Q"), unpack(0x14722e1c4, "<6f")
    zones = []
    for i, zone in enumerate(menu["zones"]):
        at = 0x146bde390 + i * 240
        assert string(at + 8) == zone["key"] and string(at + 24) == zone["name"]
        ptr, count = q(at + 136), q(at + 144)
        assert count == 5
        peers = [n for n, tier in enumerate(tiers) if tier == tiers[i]]
        ordinal = peers.index(i)
        bosses = []
        for b in range(5):
            assert string(ptr + b * 104) == zone["bosses"][b]["name"]
            final = read(ptr + b * 104 + 100, 1)[0]
            assert bool(final) == (b == 4)
            minute = unpack(ptr + b * 104 + 80, "<f")[0]
            assert minute == zone["bosses"][b]["minute"],(i,b,minute,zone["bosses"][b]["minute"])
            bosses.append(dict(name=zone["bosses"][b]["name"], minute=minute,
                slots=[8, 9] if final else [slot for slot in range(8) if slot % (4 * len(peers)) == ordinal * 4 + b],
                final_boss=bool(final)))
        zones.append(dict(key=zone["key"], name=zone["name"], tier=tiers[i],
                          drop_percent=round(rates[tiers[i]] * 100), bosses=bosses))
        retain(f"zone-{zone['key']}", at, 240)
        retain(f"bosses-{zone['key']}", ptr, 5 * 104)
    for role, a, size in [("base-scale", BASE, 24), ("extra-scale", EXTRA, 24),
        ("global-scale", SCALE, 4), ("armor-effects", 0x147231d14, 120),
        ("extra-effects", 0x147231d8c, 128), ("zone-tiers", 0x14722d658, 96),
        ("drop-rates", 0x14722e1c4, 24), ("collection-order", 0x145dec3e0, 48)]:
        retain(role, a, size)
    order = list(unpack(0x145dec3e0, "<6Q"))
    assert order == [0, 1, 2, 3, 5, 4]
    result = dict(version="0.109.0", target_sha256=SHA, classes=classes, zones=zones)
    evidence = dict(target_sha256=SHA, native_spans=spans,
        base_scale=base_scale, extra_scale=extra_scale, global_scale=scale, collection_order=order,
        pvp_piece_count=sum(len(c["items"]) for c in classes),
        ordinary_effects_unchanged=unchanged, ordinary_record_changes=ordinary_changes, faction_preview_records_unchanged=166,
        limits=["Current ordinary/PvP numeric metadata and effects, faction appearances and twelve-zone drop mapping are independently compared; original English names also match the current name rules.",
                "Source retains unchanged historical base assets with a current71-record correction overlay; starters and display fallback have separate current instruction records.",
                "Controlled original/rebuilt UI and gameplay comparisons are separate evidence."])
    ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    for a in SCALERS:retain('native-scaler',a,ends[a]-a)
    return result, evidence, scaler_cases


def replay(data, pe, cases):
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_XMM0
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    for section in pe.sections:
        if section["name"] not in (".text", ".rdata"):
            continue
        size = (max(section["raw_size"], section["virtual_size"]) + 4095) & ~4095
        u.mem_map(pe.image_base + section["rva"], size)
        u.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x10000)
    u.mem_map(stack, 0x10000)
    u.mem_map(stop, 0x1000)
    ranges = [(pe.image_base + a, pe.image_base + e) for a, e, *_ in pe.functions() if pe.image_base + a in SCALERS]
    def hook(u, a, size, unused):
        if a == stop:
            u.emu_stop()
        elif a == 0x145bfa10b:
            bits = u.reg_read(UC_X86_REG_XMM0) & 0xFFFFFFFF
            value = struct.unpack("<f", struct.pack("<I", bits))[0]
            assert value >= 0 and math.isfinite(value)
            u.reg_write(UC_X86_REG_XMM0, struct.unpack("<I", struct.pack("<f", math.floor(value + 0.5)))[0])
            rsp = u.reg_read(UC_X86_REG_RSP)
            u.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", u.mem_read(rsp, 8))[0])
            u.reg_write(UC_X86_REG_RSP, rsp + 8)
        elif not any(start <= a < end for start, end in ranges):
            raise RuntimeError(f"Unreviewed instruction/call {a:#x}")
    u.hook_add(UC_HOOK_CODE, hook)
    for case in cases:
        source, out, target, rarity, raw = heap, heap + 0x100, heap + 0x200, heap + 0x300, heap + 0x400
        rows = case["rows"]
        u.mem_write(raw, b"".join(struct.pack("<If", *row) for row in rows))
        u.mem_write(source, struct.pack("<QQQ", raw, raw + len(rows) * 8, rarity))
        u.mem_write(out, struct.pack("<QQQ", target, 0, heap + 0x1000))
        u.mem_write(rarity, struct.pack("<Q", case["rarity"]))
        rsp = stack + 0x8008
        u.mem_write(rsp, struct.pack("<Q", stop))
        u.reg_write(UC_X86_REG_RSP, rsp)
        u.reg_write(UC_X86_REG_RCX, source)
        u.reg_write(UC_X86_REG_RDX, out)
        u.emu_start(int(case["owner"], 16), 0, count=10000)
        assert struct.unpack("<Q", u.mem_read(target, 8))[0] == len(rows)
        actual = [struct.unpack("<If", u.mem_read(heap + 0x1000 + i * 8, 8)) for i in range(len(rows))]
        assert actual == case["expected"], (case, actual)
    return dict(target_sha256=SHA, passed=len(cases),
        method="Unchanged native scaling instruction replay with real tables and jump tables.",
        seams=["Preallocated sufficient vector capacity; no allocator or OS calls.",
               "roundf import supplied for finite nonnegative health; no device or game launched."])




def native_displays(data,pe):
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64
    from unicorn.x86_const import UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_RSP,UC_X86_REG_RAX,UC_X86_REG_RIP
    def raw(a,n):o=pe.rva_offset(a-pe.image_base);return data[o:o+n]
    u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(x['rva']+max(x['raw_size'],x['virtual_size'])for x in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
    for x in pe.sections:u.mem_write(pe.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
    heap,stack,stop=0x200000000,0x300000000,0x400000000;u.mem_map(heap,4096);u.mem_map(stack,4096);u.mem_map(stop,4096)
    result={};rows=[]
    for cid in [1,2,3,4,5,7,8,9,11]:
        record=struct.unpack('<Q',raw(CLASS_TABLE+(cid-1)*8,8))[0]
        for slot in range(8):
            for rarity in range(5):
                u.mem_write(heap,struct.pack('<QQQ',heap+0x100,0,5));u.mem_write(heap+0x100,struct.pack('<Q',rarity));u.mem_write(heap+0x200,struct.pack('<QQ',record,heap+0x300));u.mem_write(heap+0x300,struct.pack('<Q',slot));u.mem_write(stack+0xf08,struct.pack('<Q',stop))
                u.reg_write(UC_X86_REG_RCX,heap);u.reg_write(UC_X86_REG_RDX,heap+0x200);u.reg_write(UC_X86_REG_RSP,stack+0xf08)
                u.emu_start(0x1459d0740,stop,count=10000);assert u.reg_read(UC_X86_REG_RIP)==stop
                display=u.reg_read(UC_X86_REG_RDX) if u.reg_read(UC_X86_REG_RAX)&1 else 0
                result[(cid,slot,rarity)]=display;rows.append([cid,slot,rarity,display])
    return result,dict(target_sha256=SHA,address='0x1459d0740',end_exclusive='0x1459d07ec',sha256=hashlib.sha256(raw(0x1459d0740,0xac)).hexdigest(),cases=rows,
        limits=['360 original-instruction fallback cases execute without external calls, with the actual current class display tables and explicit iterator/class/slot register fixtures.','The native iterator scans down from the selected rarity then scans higher rarities, selecting its first nonzero display. No game, compiler or GPU runs.'])


def starters(data,pe):
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_RSP,UC_X86_REG_RIP,UC_X86_REG_RAX
    def raw(a,n):o=pe.rva_offset(a-pe.image_base);return data[o:o+n]
    base=json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory.json').read_text())
    slot_map=raw(0x147235818,23);items=[]
    for index in range(66):
        a=0x14722e578+index*40;ptr,n,item,display,inv,cls,sub,sheath=struct.unpack('<QQ6I',raw(a,40))
        items.append(dict(id=item,name=raw(ptr,n).decode(),display_id=display,inventory_type=inv,
            item_class=cls,item_subclass=sub,sheath=sheath,slot_id=slot_map[inv-1] if 1<=inv<=23 else 17))
    assert items==base['starter_items'];item_map={x['id']:x for x in items}
    u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(x['rva']+max(x['raw_size'],x['virtual_size'])for x in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
    for x in pe.sections:u.mem_write(pe.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
    heap,stack,stop=0x200000000,0x300000000,0x400000000;u.mem_map(heap,4096);u.mem_map(stack,0x20000);u.mem_map(stop,4096)
    def hook(_,a,n,unused):
        if 0x1459a3e80<=a<0x1459a4105:return
        if a==stop:u.emu_stop();return
        if a==0x1459a4150:
            out=u.reg_read(UC_X86_REG_RCX);item=u.reg_read(UC_X86_REG_RDX);row=item_map[item]
            u.mem_write(out,bytes(112));u.mem_write(out+80,struct.pack('<I',item));u.mem_write(out+104,bytes([row['slot_id']]))
            u.reg_write(UC_X86_REG_RAX,out)
        else:raise RuntimeError(f'Unreviewed starter callee {a:#x}')
        sp=u.reg_read(UC_X86_REG_RSP);ret=struct.unpack('<Q',u.mem_read(sp,8))[0];u.reg_write(UC_X86_REG_RIP,ret);u.reg_write(UC_X86_REG_RSP,sp+8)
    u.hook_add(UC_HOOK_CODE,hook);rows=[]
    for race in range(1,9):
        for cls in [1,2,3,4,5,7,8,9,11]:
            sp=stack+0x1f008;u.mem_write(sp,struct.pack('<Q',stop));u.reg_write(UC_X86_REG_RSP,sp)
            u.reg_write(UC_X86_REG_RCX,heap);u.reg_write(UC_X86_REG_RDX,race);u.reg_write(UC_X86_REG_R8,cls)
            u.emu_start(0x1459a3e80,stop,count=10000);slots=list(struct.unpack('<19I',u.mem_read(heap,76)))
            row=dict(race=race,**{'class':cls},slots=slots);assert row in base['starters'];rows.append(row)
    return dict(items=66,outfits=rows,item_table=dict(address='0x14722e578',bytes=2640,sha256=hashlib.sha256(raw(0x14722e578,2640)).hexdigest()),
        slot_map=dict(address='0x147235818',bytes=23,sha256=hashlib.sha256(slot_map).hexdigest()),
        native_getter=dict(address='0x1459a3e80',end_exclusive='0x1459a4105',sha256=hashlib.sha256(raw(0x1459a3e80,0x285)).hexdigest()),
        limits=['The actual current eight-race/nine-class dispatch, native vector tables and nineteen-slot writes execute. The item-reader fixture supplies only the id/slot from the independently compared66 current native metadata records; allocation/name/effect disposal is bypassed.','All source starter metadata and outfits match; no game, build or rendered appearance check ran.'])


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
    data,pe=load();display_values,display_proof=native_displays(data,pe);catalog,evidence,cases=recover(data,pe,display_values)
    evidence=json.loads(json.dumps(evidence))
    prior=json.loads((ROOT/'crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json').read_text())
    assert prior['zones']==catalog['zones']
    changes=list(evidence['ordinary_record_changes'])
    for old,now in zip(prior['classes'],catalog['classes']):
        assert old['id']==now['id']
        for a,b in zip(old['items'],now['items']):
            assert {k:v for k,v in a.items() if k!='effects'}=={k:v for k,v in b.items() if k!='effects'},b['id']
            if a['effects']!=b['effects']:
                changes.extend([dict(id=b['id'],effects=b['effects']),dict(id=b['id']+10,effects=b['effects'])])
    result=dict(target_sha256=SHA,pieces=changes)
    scaling=replay(data,pe,cases)
    starter=starters(data,pe)
    source=(ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text()
    assert ASSET.name in source and 'piece.effects = effects.clone();' in source and 'piece.display_id = display;' in source
    if args.write:
        write(ASSET,result);write(WORK/'armory-catalog-current.json',catalog)
        write(ROOT/'docs/analysis/evidence/0.109.0/armory-pages/catalog.json',evidence)
        write(ROOT/'docs/analysis/evidence/0.109.0/armory-pages/scaling.json',scaling)
        write(ROOT/'docs/analysis/evidence/0.109.0/armory-pages/starters.json',starter)
        write(ROOT/'docs/analysis/evidence/0.109.0/armory-pages/display-fallback.json',display_proof)
    else:
        assert json.loads(ASSET.read_text())==result
        assert json.loads((ROOT/'docs/analysis/evidence/0.109.0/armory-pages/catalog.json').read_text())==evidence
        assert json.loads((ROOT/'docs/analysis/evidence/0.109.0/armory-pages/scaling.json').read_text())==scaling
        assert json.loads((ROOT/'docs/analysis/evidence/0.109.0/armory-pages/starters.json').read_text())==starter
        assert json.loads((ROOT/'docs/analysis/evidence/0.109.0/armory-pages/display-fallback.json').read_text())==display_proof
    print(f'Checked 415 ordinary and 83 PvP effects,166 faction previews and 12 native zone/drop mappings; {len(changes)} current record overrides and {len(cases)} native scaler cases.')

if __name__=='__main__':main()

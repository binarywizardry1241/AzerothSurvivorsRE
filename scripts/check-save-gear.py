#!/usr/bin/env python3
"""Hash-bound current Save Gear/Look/Seen and nineteen-slot native instruction replay.

Default verifies retained vectors without writing. --write curates compact evidence.
No compiled reconstruction, process execution, filesystem API or OS input is reached.
"""
from portable_paths import portable_json, portable_record
import sys, importlib.util, struct, json, hashlib, argparse, os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
os.chdir(ROOT)
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--write", action="store_true")
args = parser.parse_args()
DEST = ROOT / "docs/analysis/evidence/0.109.0/save-gear"
fixtures = {}


def retain(name, rows):
    fixtures[name] = rows


sys.path[:0] = [
    "scripts",
    "runtime/armory-recovery/python-libs",
    "runtime/camera-recovery-0.105.0/python-libs",
]
from coverage_common import latest_target, target_bytes
from unicorn import *
from unicorn.x86_const import *

s = importlib.util.spec_from_file_location("p", "scripts/inventory-executable.py")
m = importlib.util.module_from_spec(s)
s.loader.exec_module(m)
t = latest_target(verify=True)
d = target_bytes(t)
SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
assert t["sha256"] == SHA and hashlib.sha256(d).hexdigest() == SHA
p = m.PE(d)
ends = {p.image_base + a: p.image_base + b for a, b, _ in p.functions()}
u = Uc(UC_ARCH_X86, UC_MODE_64)
size = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in p.sections)
u.mem_map(p.image_base, (size + 4095) & ~4095)
for s in p.sections:
    u.mem_write(
        p.image_base + s["rva"], d[s["raw_offset"] : s["raw_offset"] + s["raw_size"]]
    )
H, S, D = 0x200000000, 0x300000000, 0x400000000
u.mem_map(H, 0x1000000)
u.mem_map(S, 0x200000)
u.mem_map(D, 4096)
q = lambda a: struct.unpack("<Q", u.mem_read(a, 8))[0]
ui = lambda a: struct.unpack("<I", u.mem_read(a, 4))[0]
put = lambda a, *v: u.mem_write(a, struct.pack("<" + "Q" * len(v), *v))
reg = lambda r: u.reg_read(r)
heap = H + 0x10000
admit = {
    0x1458A9410,
    0x1458AABB0,
    0x1459B5800,
    0x14589BC20,
    0x1458A3E40,
    0x1459C3150,
    0x1459B8310,
    0x1459B8000,
}
current = None
granted = set()
stop = None
a = json.loads(Path("crates/azeroth-survivors-re/assets/armory.json").read_text())
pv = json.loads(
    Path("crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json").read_text()
)
metadata = {x["id"]: (c["id"], x["slot_id"]) for c in a["classes"] for x in c["items"]}
inventory = {x["id"]: x["inventory_type"] for c in a["classes"] for x in c["items"]}
for c in pv["classes"]:
    for x in c["items"]:
        metadata[x["id"]] = (c["id"], x["slot_id"])
        metadata[x["id"] + 10] = (c["id"], x["slot_id"])
        inventory[x["id"]] = inventory[x["id"] + 10] = x["inventory_type"]
starter = {}
for row in a["starters"]:
    slots = [0] * 19
    for item in row["slots"]:
        it = next((i for i in a["starter_items"] if i["id"] == item), None)
        if it:
            slots[it["slot_id"]] = item
    starter[row["race"], row["class"]] = slots


def alloc(n):
    global heap
    out = heap
    heap += (n + 15) & ~15
    return out


def hook(_, a, n, x):
    if a == D or a == stop:
        u.emu_stop()
        return
    if a == 0x1458A2435:
        frame = reg(UC_X86_REG_RBP)
        base = q(frame + 0x190)
        count = q(frame + 0x198)
        rows = [bytes(u.mem_read(base + i * 32, 32)) for i in range(count)]
        rows.sort(
            key=lambda b: bytes(
                u.mem_read(
                    struct.unpack_from("<Q", b, 8)[0],
                    struct.unpack_from("<Q", b, 16)[0],
                )
            )
        )
        u.mem_write(base, b"".join(rows))
        u.reg_write(UC_X86_REG_RIP, 0x1458A017D)
        return
    if any(x <= a < ends[x] for x in admit):
        return
    sp = reg(UC_X86_REG_RSP)
    c, d, r8, r9 = [
        reg(x) for x in [UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9]
    ]
    if a == 0x140089200:
        raw = bytes(u.mem_read(c, d))
        trimmed = raw.decode().strip().encode()
        start = len(raw) - len(raw.decode().lstrip().encode())
        u.reg_write(UC_X86_REG_RAX, c + start)
        u.reg_write(UC_X86_REG_RDX, len(trimmed))
    elif a in (0x145BFAE10, 0x145D7E320):
        cap, ptr, length = [q(c + i * 8) for i in range(3)]
        unit = 32 if a == 0x145BFAE10 else 232
        newcap = max(cap * 2, length + 1, 4)
        at = alloc(newcap * unit)
        if length:
            u.mem_write(at, bytes(u.mem_read(ptr, length * unit)))
        put(c, newcap, at, length)
    elif a == 0x145BD5860:
        needle = c & 255
        b = bytes(u.mem_read(d, r8))
        at = b.find(bytes([needle]))
        u.reg_write(UC_X86_REG_RAX, int(at >= 0))
        u.reg_write(UC_X86_REG_RDX, max(at, 0))
    elif a == 0x145BFA0E1:
        u.reg_write(
            UC_X86_REG_RAX, int(bytes(u.mem_read(c, r8)) != bytes(u.mem_read(d, r8)))
        )
    elif a == 0x145BFA0E7:
        u.mem_write(c, bytes(u.mem_read(d, r8)))
        u.reg_write(UC_X86_REG_RAX, c)
    elif a in (0x1400021D0, 0x140002200):
        pass
    elif a == 0x1400021C0:
        u.reg_write(UC_X86_REG_RAX, alloc(c))
    elif a == 0x1459A4BA0:
        u.mem_write(c, bytes(112))
        if d in metadata:
            cl, sl = metadata[d]
            u.mem_write(c + 104, bytes([sl, cl]))
            u.mem_write(c + 96, struct.pack("<I", inventory[d]))
        else:
            put(c, 0xFFFFFFFFFFFFFFFF)
        u.reg_write(UC_X86_REG_RAX, c)
    elif a == 0x1459A3E80:
        u.mem_write(c, struct.pack("<19I", *starter.get((d, r8), [0] * 19)))
        u.reg_write(UC_X86_REG_RAX, c)
    elif a == 0x1458E4E20:
        u.reg_write(UC_X86_REG_RAX, int(ui(d + 0x30) in granted))
    elif a == 0x145BCCE30:
        sl = q(q(r8))
        it = ui(q(r8 + 16))
        b = f"{sl}:{it}".encode()
        at = alloc(len(b))
        u.mem_write(at, b)
        put(c, len(b), at, len(b))
        u.reg_write(UC_X86_REG_RAX, c)
    elif a == 0x145BFA970:
        cap, ptr, length = [q(c + i * 8) for i in range(3)]
        unit = q(sp + 40)
        newcap = max(cap * 2, length + r8, 4)
        at = alloc(newcap * unit)
        u.mem_write(at, bytes(u.mem_read(ptr, length * unit)))
        put(c, newcap, at, length)
    else:
        raise RuntimeError(f"Unknown {a:#x} at {q(sp):#x}")
    u.reg_write(UC_X86_REG_RIP, q(sp))
    u.reg_write(UC_X86_REG_RSP, sp + 8)


u.hook_add(UC_HOOK_CODE, hook)


def call(a, *args):
    sp = S + 0x100008
    put(sp, D)
    u.reg_write(UC_X86_REG_RSP, sp)
    for r, v in zip(
        [UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9], args
    ):
        u.reg_write(r, v)
    for i, v in enumerate(args[4:]):
        put(sp + 40 + i * 8, v)
    u.emu_start(a, D, count=100000)
    return reg(UC_X86_REG_RAX)


rows = []
for kind in ("equip", "look"):
    for values in (
        [None] * 19,
        [0] * 19,
        [None, 101000] + [None] * 16 + [4294967295],
        list(range(19)),
    ):
        raw = b"".join(
            (
                struct.pack("<I", v or 0)
                if kind == "equip"
                else struct.pack("<II", int(v is not None), v or 0)
            )
            for v in values
        )
        u.mem_write(H + 0x1000, raw)
        put(H + 0x2000, H + 0x1000, H + 0x1000 + len(raw), 0)
        call(0x1459B8310 if kind == "equip" else 0x1459B8000, H, H + 0x2000)
        vals = [
            bytes(
                u.mem_read(q(q(H + 8) + i * 24 + 8), q(q(H + 8) + i * 24 + 16))
            ).decode()
            for i in range(q(H + 16))
        ]
        rows.append(dict(kind=kind, values=values, expected=vals))
retain("serialize-slot", rows)
rows = []
for cl in [1, 4, 6, 11, 255]:
    for sl in [0, 2, 15, 16, 18]:
        for item in [
            0,
            101000,
            101800,
            104900,
            104960,
            111000,
            90001,
            90010,
            90024,
            4294967295,
        ]:
            for owned in [[], [item], list(range(16)) + [item]]:
                u.mem_write(H + 0x1000, bytes([cl]))
                u.mem_write(H + 0x2000, struct.pack("<" + "I" * len(owned), *owned))
                put(H, H + 0x1000, H + 0x2000, len(owned))
                got = call(0x14589BC20, H, item, sl) & 255
                tab = (90001 <= item <= 90006 or 90011 <= item <= 90024) and sl == 18
                expected = int(
                    item in owned and (tab or metadata.get(item) == (cl, sl))
                )
                assert got == expected, (cl, sl, item, owned, got, expected)
                rows.append(
                    dict(
                        class_id=cl, slot=sl, item=item, owned=owned, expected=bool(got)
                    )
                )
retain("gear-validator", rows)
rows = []
for cl, race in [(1, 1), (4, 2), (11, 6)]:
    for kind, item, sl, owns, grant in [
        ("equip", 101000, 0, True, False),
        ("equip", 101000, 2, True, False),
        ("equip", 101000, 0, False, False),
        ("equip", 90001, 18, False, True),
        ("equip", 90001, 18, False, False),
        ("look", 0, 0, False, False),
        ("look", 101000, 0, False, False),
        ("look", 101000, 0, True, False),
        ("look", 101000, 2, True, False),
        ("look", starter[race, cl][3], 3, False, False),
        ("look", starter[1, cl][3], 3, False, False),
        ("look", 90024, 18, False, True),
    ]:
        u.mem_write(H, bytes(8192))
        u.mem_write(H + 0x1000, bytes(232))
        u.mem_write(H + 0x1000 + 228, bytes([cl]))
        owned = [item] if owns else []
        u.mem_write(H + 0x2000, struct.pack("<" + "I" * len(owned), *owned))
        put(H + 0x38, H + 0x2000, len(owned))
        put(H + 0x50, H + 0x1000, 1)
        if kind == "equip":
            u.mem_write(H + 0x1000 + 152 + sl * 4, struct.pack("<I", item))
        else:
            u.mem_write(H + 0x1000 + sl * 8, struct.pack("<II", 1, item))
        granted = {item} if grant else set()
        call(0x1458A3E40, H + 0x4000, H, cl, race)
        vals = list(struct.unpack("<19I", u.mem_read(H + 0x4000 + 152, 76)))
        looks = [
            ui(H + 0x4000 + i * 8 + 4) if ui(H + 0x4000 + i * 8) == 1 else None
            for i in range(19)
        ]
        valid = (item in owned or grant) and (
            (90001 <= item <= 90006 or 90011 <= item <= 90024)
            and sl == 18
            or metadata.get(item) == (cl, sl)
        )
        valid = valid or kind == "look" and (item == 0 or starter[race, cl][sl] == item)
        assert (looks[sl] if kind == "look" else vals[sl]) == (
            item if valid else (None if kind == "look" else 0)
        ), (kind, item, cl, sl, owns, grant, vals, looks)
        rows.append(
            dict(
                class_id=cl,
                race=race,
                kind=kind,
                item=item,
                slot=sl,
                owned=owns,
                granted=grant,
                expected=item if valid else None,
            )
        )
retain("gear-getter", rows)

# Current full-parser Seen loop, numeric parser and duplicate reducer execute.
admit.add(0x14589E380)
seen_cases = [
    "seen|a=1,a=4,z=2,a=3\n",
    " seen|unknown=+255,z=256,=3,a=1=2,a=00,b=-1,c=+4 \n",
    "seen|b=2,a=1\nseen|a=3,b=1,c=0\n",
    "seen|a=00000000000000000000000004\n",
    "seen|a=+0,b=+255,c=+256,d=1 , e=2\n",
]
for cl in ["", "+", "-", "0", "+0", "00", "18", "19", "255", "256", "-1", " 1", "1 "]:
    seen_cases.append("seen|a=" + cl + "\n")
rows = []
for text in seen_cases:
    frame = S + 0x100000
    u.mem_write(frame, bytes(0x500))
    raw = text.encode()
    u.mem_write(H + 0x3000, raw)
    put(frame + 0x370, H + 0x3000, len(raw))
    u.reg_write(UC_X86_REG_RBP, frame)
    u.reg_write(UC_X86_REG_RSP, S + 0xF0000)
    stop = 0x1458A0189
    u.emu_start(0x14589FC7B, D, count=500000)
    base = q(frame + 0x190)
    count = q(frame + 0x198)
    got = {
        bytes(u.mem_read(q(base + i * 32 + 8), q(base + i * 32 + 16))).decode(): bytes(
            u.mem_read(base + i * 32 + 24, 1)
        )[0]
        for i in range(count)
    }
    rows.append(dict(input=text, expected=got))
retain("seen", rows)
# Current native equipment class collector, including repeated and empty rows.
admit.update([0x1459BD2C0, 0x1459C01C0, 0x1459C7330])
gear_cases = [
    "equip|1|0:101000,2:0,19:42\nlook|1|0:0,1:101100\n",
    "equip|255|\nequip|1|0:101000\nlook|255|18:0\nequip|1|2:101200\nequip|1|0:0\n",
    "equip|1|1:2|extra\nlook|+1|+0:+1,18:4294967295,19:1\n",
    "equip|256|0:1\nequip|-1|0:1\nequip| 1|0:1\nequip|01|00:0001\n",
]
rows = []
for text in gear_cases:
    frame = S + 0x100000
    u.mem_write(frame, bytes(0x500))
    raw = text.encode()
    u.mem_write(H + 0x3000, raw)
    put(frame + 0x370, H + 0x3000, len(raw))
    u.reg_write(UC_X86_REG_RBP, frame)
    u.reg_write(UC_X86_REG_RSP, S + 0xF0000)
    stop = 0x14589EE1E
    u.emu_start(0x14589ED77, D, count=500000)
    base = q(frame + 0x1A8)
    count = q(frame + 0x1B0)
    got = []
    for i in range(count):
        at = base + i * 232
        got.append(
            dict(
                class_id=bytes(u.mem_read(at + 228, 1))[0],
                equip={
                    str(j): ui(at + 152 + j * 4)
                    for j in range(19)
                    if ui(at + 152 + j * 4)
                },
                look={
                    str(j): ui(at + j * 8 + 4) for j in range(19) if ui(at + j * 8) == 1
                },
            )
        )
    rows.append(dict(input=text, expected=got))
retain("gear-rows", rows)
admit.add(0x1458A4340)
stop = None
u.mem_write(H, bytes(0x400))
put(H + 0x150, 0xFFFFFFFFFFFFFFFF)
call(0x1458A4340, H + 0x4000, H)
assert [q(H + 0x4000), q(H + 0x4008), q(H + 0x4010)] == [0, 1, 0]
retain("default-serialization", "")

admit.add(0x1459A4710)
rows = []
for (race, cl), baseline in starter.items():
    pieces = [
        (id, slot)
        for id, (cid, slot) in metadata.items()
        if cid == cl and id % 100 == 50
    ]
    for mode in (
        "baseline",
        "shirt-hidden",
        "starter-override",
        "pvp-worn",
        "pvp-cosmetic",
    ):
        worn = [0] * 19
        looks = [None] * 19
        if mode == "shirt-hidden":
            looks[3] = 0
        if mode == "starter-override":
            at = next(i for i, v in enumerate(baseline) if v)
            looks[at] = baseline[at]
        if mode == "pvp-worn":
            for id, slot in pieces:
                worn[slot] = id
        if mode == "pvp-cosmetic":
            for id, slot in pieces:
                looks[slot] = id
            looks[18] = 90011
        u.mem_write(H + 0x1000, struct.pack("<19I", *worn))
        u.mem_write(
            H + 0x2000,
            b"".join(struct.pack("<II", int(id is not None), id or 0) for id in looks),
        )
        call(0x1459A4710, H + 0x4000, race, cl, H + 0x1000, H + 0x2000)
        got = list(struct.unpack("<19I", u.mem_read(H + 0x4000, 76)))
        expected = baseline.copy()
        for i in range(19):
            if worn[i]:
                expected[i] = worn[i]
            if looks[i] is not None:
                expected[i] = looks[i]
            if (
                race in (2, 5, 6, 8)
                and expected[i] in metadata
                and expected[i] % 100 == 50
            ):
                expected[i] += 10
        if inventory.get(expected[15]) == 17:
            expected[16] = 0
        assert got == expected, (race, cl, mode, got, expected)
        rows.append(
            dict(
                class_id=cl, race=race, mode=mode, equip=worn, look=looks, expected=got
            )
        )
retain("outfit", rows)
# The current menu-only ranged suppression is an independent three-instruction branch.
admit.add(0x1401612F0)
stop = 0x14016145D
menu_rows = []
for main in (0, 25):
    for off in (0, 2362):
        sp = S + 0x100008
        u.reg_write(UC_X86_REG_RSP, sp)
        u.mem_write(sp + 0x90, struct.pack("<III", main, off, 3111))
        u.emu_start(0x140161442, D, count=100)
        got = ui(sp + 0x98)
        assert got == (0 if main or off else 3111)
        menu_rows.append(dict(main=main, off=off, ranged=3111, expected=got))
retain("menu-ranged", menu_rows)

# Actual current token parser, including decimal overflow and delimiters.
stop = None
rows = []
for slot in [
    "",
    "+",
    "-",
    "0",
    "+0",
    "00",
    "18",
    "19",
    "255",
    "-1",
    " 1",
    "1 ",
    "18446744073709551615",
    "18446744073709551616",
]:
    for item in [
        "",
        "+",
        "0",
        "+1",
        "101000",
        "-1",
        "4294967295",
        "4294967296",
        " 1",
        "1 ",
        "1:2",
    ]:
        token = slot + ":" + item
        raw = token.encode()
        u.mem_write(H, bytes(128))
        u.mem_write(H + 0x1000, raw)
        call(0x1458A9410, H, H + 0x500, H + 0x1000, len(raw))
        rows.append(
            dict(
                token=token,
                slot=q(H + 8) if q(H) else None,
                item=ui(H + 16) if q(H) else None,
            )
        )
retain("slot-token", rows)

# Native metadata callbacks above are fixtures, supplied from already separately
# revalidated catalogs. They do not stand in for the parser/projector/merge code.
roles = {
    "items-parse": 0x1459C3640,
    "items-next": 0x1459B74E0,
    "gear-slots-parse": 0x1459C01C0,
    "gear-slot-pair": 0x1458A9410,
    "seen-merge": 0x1459B5800,
    "gear-get": 0x1458A3E40,
    "gear-valid": 0x14589BC20,
    "gear-granted-items": 0x1459C3150,
    "equip-serialize": 0x1459B8310,
    "look-serialize": 0x1459B8000,
    "gear-outfit-slots": 0x1459A4710,
    "gear-menu-outfit": 0x1401612F0,
}


def raw(a, b):
    off = p.rva_offset(a - p.image_base)
    return d[off : off + b - a]


manifest = {
    "version": "0.109.0",
    "target_sha256": SHA,
    "shared_owners": ["../save-core/manifest.json"],
    "fixture_metadata": [
        {"path": str(path), "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
        for path in [
            Path("crates/azeroth-survivors-re/assets/armory.json"),
            Path("crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json"),
        ]
    ],
    "owners": [],
}
for role, a in roles.items():
    b = ends[a]
    r = raw(a, b)
    record = {
        "role": role,
        "start": hex(a),
        "end": hex(b),
        "bytes": len(r),
        "sha256": hashlib.sha256(r).hexdigest(),
    }
    if args.write:
        DEST.mkdir(parents=True, exist_ok=True)
        response = json.loads(
            (
                ROOT
                / f"runtime/secondary-pages-0.109.0/{role}-rea/003-procedure_pseudo_code.json"
            ).read_text()
        )["response"]["result"]["structuredContent"]
        assert response["subject"]["digest"]["sha256"] == record["sha256"]
        (DEST / (role + ".c")).write_text("\n".join(line.rstrip() for line in response["normalized_result"].splitlines()).strip() + "\n")
        from capstone import Cs, CS_ARCH_X86, CS_MODE_64

        md = Cs(CS_ARCH_X86, CS_MODE_64)
        decoded = list(md.disasm(r, a))
        assert sum(i.size for i in decoded) == len(r)
        (DEST / (role + ".asm")).write_text(
            "\n".join(f"{i.address:x}\t{i.mnemonic}\t{i.op_str}".rstrip() for i in decoded)
            + "\n"
        )
        record["evidence_id"] = response["evidence_id"]
        record["profile_sha256"] = response["analysis_profile"]["digest"]
    else:
        prior = json.loads((DEST / "manifest.json").read_text())
        saved = next(x for x in prior["owners"] if x["role"] == role)
        record["evidence_id"] = saved["evidence_id"]
        record["profile_sha256"] = saved["profile_sha256"]
    for suffix in (".c", ".asm"):
        record[suffix[1:] + "_sha256"] = hashlib.sha256(
            (DEST / (role + suffix)).read_bytes()
        ).hexdigest()
    manifest["owners"].append(record)
manifest["executed_helpers"] = [
    {
        "start": hex(a),
        "end": hex(ends[a]),
        "sha256": hashlib.sha256(raw(a, ends[a])).hexdigest(),
    }
    for a in sorted(admit - set(roles.values()))
]
if args.write:
    DEST.mkdir(parents=True, exist_ok=True)
    (DEST / "fixtures.json").write_text(
        portable_json(fixtures, ensure_ascii=False, separators=(",", ":")) + "\n"
    )
    (DEST / "manifest.json").write_text(portable_json(manifest, indent=2) + "\n")
else:
    assert portable_record(fixtures) == portable_record(json.loads(
        (DEST / "fixtures.json").read_text()
    )), "Native vectors changed"
    assert portable_record(manifest) == portable_record(json.loads(
        (DEST / "manifest.json").read_text()
    )), "Native ownership/evidence changed"
print(
    "Current Gear/Look/Seen replay passed: "
    + ", ".join(f"{key}={len(value)}" for key, value in fixtures.items())
)

#!/usr/bin/env python3
"""Hash-bound banner instructions and source connections; no build/game process.

Uses existing optional Unicorn libraries. Allocation, memcpy/free, final Rust
formatting and JSON serialization are explicit host seams. The selected native
UTF-8 cleaning, field selection, ID increment, queue writes and packet assembly
execute unchanged. --write promotes only compact evidence from runtime/.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
WORK = ROOT / "runtime/addon-bridge-0.109.0"
EVIDENCE = ROOT / "docs/analysis/evidence/0.109.0/addon-bridge/banners"
OWNERS = {
    "sender": 0x14594b0d0, "wire": 0x1458ea070, "clean": 0x1458e6350,
    "json": 0x1458eaaa0, "packet": 0x1458c35d0,
    "achievement": 0x1458ea4b0, "arrival": 0x1458ea670,
    "rune": 0x1458ea950, "guardian": 0x1458ead40,
    "unlocked": 0x1458eaee0, "bossdown": 0x1458eb080,
    "object_name": 0x14588d850,
}


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--prepare-rea", action="store_true", help="stage a current-byte Ghidra plan, without running it")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover fresh contracts for the changed target"
    data = target_bytes(target)
    module = load_script("banner_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

    def raw(va, size):
        at = pe.rva_offset(va - pe.image_base)
        value = data[at:at + size]
        assert len(value) == size
        return value

    def span(role, va, size):
        return dict(role=role, va=hex(va), file_offset=hex(pe.rva_offset(va-pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(raw(va, size)).hexdigest())

    discovery = json.loads((ROOT / "docs/analysis/evidence/0.109.0/discovery-leads.json").read_text())
    api = discovery["embedded_addon_api"]
    api_raw = raw(int(api["range"]["virtual_address"], 16), api["range"]["byte_count"])
    assert api_raw == (ROOT / api["path"]).read_bytes()
    assert hashlib.sha256(api_raw).hexdigest() == api["range"]["sha256"]
    stats = (ROOT / "docs/analysis/evidence/0.105.0/addon-bridge/native-stats-parser.lua").read_bytes()
    # The numeric parser remains byte-identical in the current character pane.
    stats_at = data.find(stats)
    assert stats_at >= 0 and data.find(stats, stats_at + 1) < 0
    assert raw(0x14808a5c8, 4) == struct.pack("<I", 1)
    template = bytes.fromhex("0369643dc0063b6b696e643dc0063b626f73733dc0063b6e616d653dc0063b746578743dc000")
    assert raw(0x146bf1704, len(template)) == template
    assert raw(0x14722a95b, 9) == b"AZSBANNER"
    records = [span(role, address, extents[address]-address) for role, address in OWNERS.items()]
    # Revalidate the exact name/ID/final fields consumed by the arrival adapter;
    # the rest of each boss remains the separate encounter owner's scope.
    source_bosses = {}
    catalog = (ROOT/"crates/azeroth-survivors-re/src/guardians/catalog.rs").read_text()
    for match in re.finditer(r'BossDefinition \{\s+id: (\d+),\s+name: ("(?:[^"\\]|\\.)*"),.*?flag_54: (\d+)',catalog,re.S):
        source_bosses[int(match[1])] = (json.loads(match[2]),int(match[3]))
    assert len(source_bosses) == 60
    boss_fields = []
    for zone in range(12):
        pointer,count = struct.unpack("<QQ",raw(0x146bde390+zone*240+0x88,16))
        assert count == 5
        for index in range(count):
            address = pointer+index*104
            name_pointer,name_len = struct.unpack("<QQ",raw(address,16))
            name = raw(name_pointer,name_len).decode()
            ident = struct.unpack("<I",raw(address+64,4))[0]
            final = raw(address+100,1)[0]
            assert source_bosses[ident] == (name,final)
            boss_fields.append(dict(id=ident,name=name,final=final,record_va=hex(address)))
    calls = []
    for site in [0x1458b9ebc,0x1458bdc74,0x14593a2ae,0x14593a31a,0x14593d6a0,0x14596e515,0x145972cb0,0x145972e2f,0x1459826df,0x145982cec]:
        instruction = raw(site,5)
        assert instruction[0] == 0xE8 and site+5+struct.unpack("<i",instruction[1:])[0] == OWNERS["sender"]
        calls.append(span("direct_banner_publisher_call",site,5))
    if args.prepare_rea:
        output = WORK / "reproduce-rea"
        output.mkdir(parents=True, exist_ok=True)
        lo, hi = min(OWNERS.values()), max(extents[a] for a in OWNERS.values())
        carrier = bytearray(hi-lo)
        for address in OWNERS.values():
            carrier[address-lo:extents[address]-lo] = raw(address, extents[address]-address)
        (output/"owners.bin").write_bytes(carrier)
        (output/"seeds.tsv").write_text("".join(f"{a:#x}\tfunction\n{a:#x}\tcode\n" for a in OWNERS.values()))
        plan = dict(target=str((output/"owners.bin").relative_to(ROOT)),
                    output=str((output/"rea").relative_to(ROOT)), init_timeout=60, timeout=240,
                    environment={"REA_GHIDRA_SEED_FILE":str((output/"seeds.tsv").relative_to(ROOT))},
                    open_options=dict(format="raw-binary",architecture="x86_64",entry_point=hex(lo)),
                    operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=hex(a)),label=k) for k,a in OWNERS.items()])
        (output/"plan.json").write_text(encoded(plan))
        print((output/"plan.json").relative_to(ROOT))
        return

    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
                    str(ROOT / "runtime/armory-recovery/python-libs")]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r

    class Probe:
        def __init__(self):
            self.u = Uc(UC_ARCH_X86, UC_MODE_64)
            self.u.mem_map(0x10000000, 0x1000)
            self.u.mem_map(0x20000000, 0x200000)
            self.u.mem_map(0x30000000, 0x400000)
            self.heap = 0x30000000
            self.formatted, self.ids = [], []
            self.translations = {}
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED, self.missing)
            self.u.hook_add(UC_HOOK_CODE, self.hook)

        def missing(self, uc, access, address, size, value, _):
            page = address & ~4095
            at = pe.rva_offset(page - pe.image_base)
            uc.mem_map(page, 4096)
            uc.mem_write(page, data[at:at+4096])
            return True

        def alloc(self, size):
            address = self.heap
            self.heap += (max(size, 1) + 15) & ~15
            assert self.heap < 0x30400000
            return address

        def q(self, address):
            return struct.unpack("<Q", self.u.mem_read(address, 8))[0]

        def put(self, address, *values):
            self.u.mem_write(address, struct.pack("<" + "Q"*len(values), *values))

        def string(self, text):
            blob = text.encode()
            address = self.alloc(len(blob))
            self.u.mem_write(address, blob)
            return address, len(blob)

        def owned(self, address, text):
            pointer, size = self.string(text)
            self.put(address, size, pointer, size)

        def pair(self, address):
            pointer, size = self.q(address), self.q(address+8)
            value = raw(pointer, size) if pointer >= pe.image_base else bytes(self.u.mem_read(pointer, size))
            return value.decode()

        def owned_text(self, address):
            return self.pair(address+8)

        def record(self, kind, boss, name, text):
            address = self.alloc(72)
            self.owned(address, text)
            self.owned(address+24, name)
            self.put(address+48, *self.string(kind))
            self.u.mem_write(address+64, bytes([int(boss)]))
            return address

        def ret(self):
            sp = self.u.reg_read(r.UC_X86_REG_RSP)
            address = self.q(sp)
            self.u.reg_write(r.UC_X86_REG_RSP, sp+8)
            self.u.reg_write(r.UC_X86_REG_RIP, address)

        def hook(self, uc, address, size, _):
            reg = uc.reg_read
            rcx, rdx, r8 = (reg(v) for v in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            if address == 0x140002200 or address == 0x1400021d0:
                self.ret()
            elif address == 0x1400021c0:
                uc.reg_write(r.UC_X86_REG_RAX, self.alloc(rcx)); self.ret()
            elif address == 0x145bfa0e7:
                uc.mem_write(rcx, bytes(uc.mem_read(rdx, r8)))
                uc.reg_write(r.UC_X86_REG_RAX, rcx); self.ret()
            elif address == 0x145bfa970:
                capacity = max(4096, rdx+r8)
                pointer = self.alloc(capacity)
                if rdx:
                    uc.mem_write(pointer, bytes(uc.mem_read(self.q(rcx+8), rdx)))
                self.put(rcx, capacity, pointer); self.ret()
            elif address == OWNERS["json"]:
                self.ids.append(r8)
                self.put(rcx, 0, 1, 0); self.ret()
            elif address == 0x1458ec500:
                key = raw(rcx, rdx).decode() if rcx >= pe.image_base else bytes(uc.mem_read(rcx,rdx)).decode()
                value = self.translations.get(key)
                pointer, length = (0, 0) if value is None else self.string(value)
                uc.reg_write(r.UC_X86_REG_RAX, pointer)
                uc.reg_write(r.UC_X86_REG_RDX, length)
                self.ret()
            elif address == 0x1458ec8b0:
                template = raw(rdx,r8).decode() if rdx >= pe.image_base else bytes(uc.mem_read(rdx,r8)).decode()
                replacements = reg(r.UC_X86_REG_R9)
                key = raw(self.q(replacements), self.q(replacements+8)).decode()
                value = self.pair(self.q(replacements+16))
                self.owned(rcx, template.replace("{"+key+"}",value)); self.ret()
            elif address == 0x145bcce30:
                if rdx == 0x146bf1704:
                    ident = struct.unpack("<I", uc.mem_read(self.q(r8), 4))[0]
                    kind = self.pair(self.q(r8+16))
                    boss = uc.mem_read(self.q(r8+32), 1)[0]
                    name, text = (self.owned_text(self.q(r8+n)) for n in (48, 64))
                    self.formatted.append(dict(id=ident, kind=kind, boss=boss, name=name, text=text))
                    value = f"id={ident};kind={kind};boss={boss};name={name};text={text}"
                elif rdx == 0x146bec360:
                    value = self.pair(self.q(r8)) + "\t" + self.pair(self.q(r8+16))
                elif rdx == 0x146bf17d3:
                    value = self.pair(self.q(r8)) + "!"
                else:
                    assert rdx == 0x146bd26ae, hex(rdx)
                    value = "object." + self.pair(self.q(r8))
                self.owned(rcx, value); self.ret()
            else:
                # Execute only the recovered cleaning/formatter/sender/packet
                # bodies. An unexpected external call cannot become a fake pass.
                allowed = ["clean", "wire", "sender", "packet", "arrival", "rune", "guardian", "unlocked", "bossdown", "object_name"]
                assert any(OWNERS[key] <= address < extents[OWNERS[key]] for key in allowed), hex(address)

        def call(self, address, *args):
            sp = 0x201F0008
            self.put(sp, 0x10000000)
            for register, value in zip((r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9), args):
                self.u.reg_write(register, value)
            for i, value in enumerate(args[4:]):
                self.put(sp+0x28+i*8, value)
            self.u.reg_write(r.UC_X86_REG_RSP, sp)
            self.u.emu_start(address, 0x10000000, count=100000)
            assert self.u.reg_read(r.UC_X86_REG_RIP) == 0x10000000

    object_names = []
    for ident, key, fallback in [(9006,"object.rune_speed","Speed Rune"),
                                  (9007,"object.rune_berserk","Berserker Rune"),
                                  (9008,"object.rune_restore","Restoration Rune")]:
        for translated in [False,True]:
            probe = Probe()
            if translated:
                probe.translations[key] = "Local " + fallback
            probe.call(OWNERS["object_name"],ident)
            pointer, size = (probe.u.reg_read(reg) for reg in (r.UC_X86_REG_RAX,r.UC_X86_REG_RDX))
            actual = raw(pointer,size).decode() if pointer >= pe.image_base else bytes(probe.u.mem_read(pointer,size)).decode()
            assert actual == ("Local " if translated else "")+fallback, actual
            object_names.append(dict(id=ident,key=key,translated=translated,name=actual))
    vectors = []
    constructors = []
    for role, kind, boss, key, final in [
        ("arrival","boss",True,"{name} approaches!",False),
        ("arrival","finalboss",True,"{name} has come!",True),
        ("rune","rune",False,None,False),
        ("guardian","guardian",True,"{name} is slain! Its hoard and a level.",False),
        ("unlocked","unlocked",False,"{zone} is now open!",False),
        ("bossdown","bossdown",True,"{name} is defeated!",False),
    ]:
        for name in ["", "Name", "É;=,🙂"]:
            for translated in [False,True]:
                probe = Probe()
                template = key
                if key and translated:
                    template = "Local " + key
                    probe.translations[key] = template
                pointer, size = probe.string(name)
                output = probe.alloc(72)
                probe.call(OWNERS[role],output,pointer,size,int(final))
                expected = name+"!" if role=="rune" else template.replace("{name}",name).replace("{zone}",name)
                actual = dict(kind=probe.pair(output+48),boss=probe.u.mem_read(output+64,1)[0],
                              name=probe.owned_text(output+24),text=probe.owned_text(output))
                assert actual == dict(kind=kind,boss=int(boss),name=name,text=expected), actual
                constructors.append(dict(role=role,translated_template=translated,**actual))
    strings = ["", "A", "A,;=B", "\t\n\r", "É中🙂", "a;=\tÉ,🙂\r\nz"]
    for ident in [0, 1, 0x7FFFFFFF, 0xFFFFFFFF]:
        for boss in [False, True]:
            for text in strings:
                probe = Probe()
                source = probe.record("guardian", boss, text, text)
                output = probe.alloc(24)
                probe.call(OWNERS["wire"], output, source, ident)
                expected_text = text.translate(str.maketrans({"\t":" ", "\n":" ", "\r":" "}))
                expected_name = expected_text.replace(";", " ").replace("=", " ")
                expected = dict(id=ident, kind="guardian", boss=int(boss), name=expected_name, text=expected_text)
                assert probe.formatted == [expected], (text, probe.formatted)
                vectors.append(expected)

    # Same native sender instance: equal events are appended twice, wrap keeps
    # the old XADD value, and both JSON and packet queues grow immediately.
    probe = Probe()
    game = probe.alloc(0x1000)
    probe.put(game+0x618, 10, probe.alloc(320), 0)
    probe.put(game+0x630, 10, probe.alloc(240), 0)
    probe.put(game+0x460, 1)
    sender = []
    for ident in [1, 2, 0xFFFFFFFF, 0]:
        # Map the actual initialized atomic page before setting a boundary input.
        if not sender:
            probe.missing(probe.u, 0, 0x14808a5c8, 4, 0, None)
        probe.u.mem_write(0x14808a5c8, struct.pack("<I", ident))
        source = probe.record("cache", False, "", "Same;=,🙂")
        probe.call(OWNERS["sender"], game, source)
        count = len(sender)+1
        assert probe.q(game+0x628) == count and probe.q(game+0x640) == count
        row = probe.q(game+0x620)+(count-1)*32
        wire = bytes(probe.u.mem_read(probe.q(row+8), probe.q(row+16)))
        assert wire[:13] == b"\x06\xff\xff\xff\xff" + struct.pack("<Q", 1)
        payload = f"AZSBANNER\tid={ident};kind=cache;boss=0;name=;text=Same;=,🙂".encode()
        assert wire[13:17] == struct.pack("<I", len(payload)+1)
        assert wire[17:] == payload+b"\0\0"
        assert probe.ids[-1] == ident
        assert struct.unpack("<I", probe.u.mem_read(0x14808a5c8,4))[0] == (ident+1)&0xFFFFFFFF
        sender.append(dict(id=ident, json_rows=count, packet_rows=count, wire_hex=wire.hex()))

    # Trace changed live consumers, without claiming Rust execution.
    source = ROOT / "crates/azeroth-survivors-re/src/gameplay"
    bootstrap = (source / "client/addon_bootstrap.rs").read_text()
    assert 'evidence/0.108.0/addon-api.lua' in bootstrap
    assert 'AZS_RE_RUN_IDENTITY' not in bootstrap
    events = (source / "client/events.rs").read_text()
    for kind in ["achievement", "cache", "finalboss", "boss"]:
        assert '"'+kind+'"' in events
    assert 'addon_banners::packet(kind,true' in events and 'addon_banners::packet(kind,false' in events
    assert 'addon_banners::packet("unlocked",false' in events
    assert 'RunEvent::ZoneUnlocked' in (source / "terminal.rs").read_text()
    assert 'RunEvent::BossBanner' in (source / "mechanics/bosses.rs").read_text()
    pickups = (source / "mechanics/pickups.rs").read_text()
    assert pickups.count('kind: "magnet"') == 2 and 'kind: "rune"' in pickups
    assert 'Text::Literal("!".into())' in pickups

    manifest = dict(target_version="0.109.0", target_sha256=SHA, target_executed=False,
        owners=records, publisher_calls=calls, boss_name_final_fields=boss_fields,
        api=api["range"], numeric_parser=span("unchanged_stats_parser", pe.offset_va(stats_at), len(stats)),
        data=[span("wire_template",0x146bf1704,len(template)), span("prefix",0x14722a95b,9), span("initial_id",0x14808a5c8,4)],
        case_counts=dict(native_rune_name_lookup=len(object_names),native_constructors=len(constructors),native_wire_fields_and_cleaning=len(vectors), native_sender_and_packet=len(sender)),
        limits=["Original instructions execute in Unicorn, not a game or real client VM.",
                "Allocation, memcpy/free, localization/template replacement, JSON construction and final Rust formatting are host seams; their platform/serialization internals are not certified.",
                "The formatter seam captures actual native argument pointers/values; all UTF-8 sanitization executes natively before that seam.",
                "Queue vectors use preallocated synthetic Game lists; allocation-failure/growth and concurrent interleavings remain unverified.",
                "Source traces and authored Rust regressions do not establish compilation, gameplay, banner presentation or original/rebuilt parity."])
    WORK.mkdir(parents=True, exist_ok=True)
    for name, value in [("manifest.json",manifest),("native-cases.json",dict(object_names=object_names,constructors=constructors,wire=vectors,sender=sender))]:
        (WORK/name).write_text(encoded(value))
        if args.write:
            EVIDENCE.mkdir(parents=True, exist_ok=True)
            (EVIDENCE/name).write_text(encoded(value))
        else:
            assert (EVIDENCE/name).read_text() == encoded(value), name
    rea = json.loads((EVIDENCE/"rea.json").read_text())
    assert rea["target_sha256"] == SHA
    for row in rea["extracts"]:
        assert row["provider"] == "ghidra"
        path = (ROOT/row["path"]).resolve()
        assert path.is_relative_to(EVIDENCE)
        assert hashlib.sha256(path.read_bytes()).hexdigest() == row["sha256"]
    print(f"Passed {len(object_names)} rune names, {len(constructors)} native constructors, {len(vectors)} cleaning/field cases and {len(sender)} sender/packet cases, exact API/parser and live source traces; no build/game")


if __name__ == "__main__":
    main()

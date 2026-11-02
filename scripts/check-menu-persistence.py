#!/usr/bin/env python3
"""Check bounded 0.115.0 export-clock and RunMods instructions without a build.

--stage writes candidate evidence under ignored runtime/ for review. Default is
read-only. Clock APIs are explicit synthetic seams; no OS clock or file is used.
"""
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
OUT = ROOT / "docs/analysis/evidence/0.115.0/menu-persistence"
STAGE = ROOT / "runtime/menu-persistence-0.115.0/curated"
RANGES = {
    "export-clock": (0x145002900, 0x145002944),
    "export-account": (0x145836BB0, 0x145836C40),
    "ordinary-write": (0x145831E10, 0x1458324FA),
    "backup-clock": (0x145832209, 0x145832246),
    "utc-calendar": (0x145837500, 0x145837792),
    "export-input": (0x1400AB984, 0x1400ABA00),
    "import-account": (0x145836CB0, 0x145836E33),
    "parse": (0x145829CF0, 0x145829F1F),
    "csv": (0x1459CE220, 0x1459CE895),
    "split": (0x1459D1FE0, 0x1459D219A),
    "memchr": (0x145CEFD80, 0x145CEFE65),
    "difficulty": (0x145829F20, 0x145829F80),
    "adjust": (0x145829F80, 0x145829FF6),
    "reward": (0x14582A000, 0x14582A068),
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Changed target requires fresh recovery"
    data = target_bytes(target)
    pe = load_script("menu_save_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    sys.path[:0] = [
        str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
        str(ROOT / "runtime/armory-recovery/python-libs"),
    ]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r

    def raw(a, n):
        offset = pe.rva_offset(a - pe.image_base)
        return data[offset:offset + n]

    md = Cs(CS_ARCH_X86, CS_MODE_64)
    records, assembly = {}, []
    for name, (start, end) in RANGES.items():
        body = raw(start, end - start)
        records[name] = dict(start=hex(start), end_exclusive=hex(end),
                             sha256=hashlib.sha256(body).hexdigest())
        if name == "backup-clock":
            continue  # Canonical bytes already appear inside ordinary-write.
        assembly.append(f"; {name}\n")
        assembly.extend(f"{i.address:x}\t{i.mnemonic}\t{i.op_str}".rstrip() + "\n"
                        for i in md.disasm(body, start))
    # The export action loads/seals the actual account before obtaining its
    # directory, then sends this shared clock result to the UTC formatter.
    calls = [(i.address, i.op_str) for i in md.disasm(raw(0x1400AB984, 0x7C), 0x1400AB984)
             if i.mnemonic == "call"]
    assert calls == [(0x1400AB988, "0x145836bb0"), (0x1400AB9AD, "0x1458373d0"),
                     (0x1400AB9E7, "0x145002900"), (0x1400AB9FA, "0x145837500")]
    account_calls = [i.op_str for i in md.disasm(raw(0x145836BB0, 0x90), 0x145836BB0)
                     if i.mnemonic == "call"]
    assert account_calls[:3] == ["0x14582beb0", "0x145832a60", "0x1458d32a0"]
    # Descriptor pointers/lengths are read from the current native table, not
    # inferred from the source or a historical RVA.
    descriptor_at = 0x146CCB850
    descriptors = []
    for index, (name, maximum, step, weight) in enumerate([
            ("Enemy density", 500, 25, 0.05), ("Enemy health", 500, 25, 0.4),
            ("Enemy damage", 300, 10, 0.6), ("Enemy speed", 150, 5, 2.0)]):
        record = raw(descriptor_at + 48 * index, 48)
        title, count, description, description_count = struct.unpack_from("<4Q", record)
        actual_weight = struct.unpack_from("<I", record, 32)[0]
        minimum, actual_maximum, actual_step = struct.unpack_from("<3H", record, 36)
        assert raw(title, count).decode() == name
        assert (minimum, actual_maximum, actual_step) == (100, maximum, step)
        assert actual_weight == struct.unpack("<I", struct.pack("<f", weight))[0]
        descriptors.append(dict(title=name, description=raw(description, description_count).decode(),
                                minimum=minimum, maximum=maximum, step=step,
                                weight_bits=f"{actual_weight:08x}"))

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section["rva"],
                    data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    scratch, stop = 0x300000000, 0x400000000
    u.mem_map(scratch, 0x10000)
    u.mem_map(stop, 4096)
    clock_result, seen, permitted = [0, 0], [], []
    utc_fields=[]
    cursor = [scratch + 0x1000]
    def alloc(size):
        result=cursor[0]; cursor[0]+=(size+31)&~15
        assert cursor[0] < scratch+0x7000
        return result
    def q(at): return struct.unpack("<Q",u.mem_read(at,8))[0]

    def ret():
        sp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, struct.unpack("<Q", u.mem_read(sp, 8))[0])
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(uc, pc, size, unused):
        if pc == stop:
            uc.emu_stop()
        elif pc == 0x145CC1FD0:
            seen.append("clock")
            uc.reg_write(r.UC_X86_REG_RAX, 0x1234)
            uc.reg_write(r.UC_X86_REG_RDX, 0x5678)
            ret()
        elif pc == 0x145CC1F80:
            seen.append("duration")
            assert uc.reg_read(r.UC_X86_REG_R8) == 0xD53E8000
            assert uc.reg_read(r.UC_X86_REG_R9) == 0x19DB1DE
            dest = uc.reg_read(r.UC_X86_REG_RCX)
            uc.mem_write(dest, struct.pack("<QQ", *clock_result))
            ret()
        elif pc == 0x145CE7350:
            sp=uc.reg_read(r.UC_X86_REG_RSP)
            # CALL has already pushed its return address. Inspect the six
            # original arithmetic fields passed to the formatting helper.
            fields=struct.unpack("<6Q",uc.mem_read(sp+8+0x20,48))
            utc_fields[:]=[fields[i]for i in (2,1,0,3,4,5)]
            ret()
        elif pc in (0x1400021C0, 0x140002200, 0x1400021D0, 0x145D14601, 0x145D14A10):
            cx,dx,r8,r9=[uc.reg_read(z)for z in (r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_R9)]
            if pc==0x1400021C0: uc.reg_write(r.UC_X86_REG_RAX,alloc(cx))
            elif pc==0x145D14601:
                left,right=bytes(uc.mem_read(cx,r8)),bytes(uc.mem_read(dx,r8))
                uc.reg_write(r.UC_X86_REG_RAX,((left>right)-(left<right))&0xFFFFFFFF)
            elif pc==0x145D14A10:
                cap=max(q(cx)*2,dx+r8,4); at=alloc(cap*r9)
                if dx: uc.mem_write(at,bytes(uc.mem_read(q(cx+8),dx*r9)))
                uc.mem_write(cx,struct.pack("<QQ",cap,at))
            ret()
        else:
            assert any(a <= pc < b for a, b in permitted), hex(pc)

    u.hook_add(UC_HOOK_CODE, hook)

    def call(address):
        sp = scratch + 0x8000
        u.mem_write(sp, struct.pack("<Q", stop))
        u.reg_write(r.UC_X86_REG_RSP, sp)
        u.emu_start(address, 0, count=100000)
        assert u.reg_read(r.UC_X86_REG_RIP) == stop

    clocks = []
    permitted[:] = [RANGES["export-clock"]]
    for failed, seconds in [(0, 0), (0, 1), (0, 1_700_000_000), (0, 2**64 - 1),
                            (1, 0), (1, 1_700_000_000), (1, 2**64 - 1)]:
        clock_result[:] = [failed, seconds]
        seen.clear()
        call(RANGES["export-clock"][0])
        actual = u.reg_read(r.UC_X86_REG_RAX)
        assert actual == (0 if failed else seconds)
        assert seen == ["clock", "duration"]
        clocks.append(dict(duration_failed=bool(failed), seconds=seconds, result=actual))
        permitted[:]=[RANGES["backup-clock"]]
        seen.clear();u.reg_write(r.UC_X86_REG_RSP,scratch+0x8000);u.reg_write(r.UC_X86_REG_RBP,scratch+0x2000)
        u.emu_start(RANGES["backup-clock"][0],RANGES["backup-clock"][1],count=1000)
        assert u.reg_read(r.UC_X86_REG_RIP)==RANGES["backup-clock"][1]
        assert u.reg_read(r.UC_X86_REG_RDI)==actual and seen==["clock","duration"]
        permitted[:]=[RANGES["export-clock"]]
    # Historical inputs/expected outputs are reused as fixtures only. Every
    # arithmetic instruction and data operand executes from the selected EXE.
    vectors_path = ROOT / "docs/analysis/evidence/0.109.0/runmods/native-vectors.json"
    vectors = json.loads(vectors_path.read_text())
    permitted[:] = [RANGES[k] for k in ("parse", "csv", "split", "memchr")]
    for row in vectors["parsed"]:
        cursor[0]=scratch+0x1000; encoded=row["input"].encode(); at=alloc(len(encoded)+32)
        u.mem_write(at,encoded+bytes(32));u.reg_write(r.UC_X86_REG_RCX,at);u.reg_write(r.UC_X86_REG_RDX,len(encoded))
        call(RANGES["parse"][0])
        actual=list(struct.unpack("<4H",u.reg_read(r.UC_X86_REG_RAX).to_bytes(8,"little")))
        assert actual==row["values"],(row,actual)
    permitted[:] = [RANGES[k] for k in ("difficulty", "reward", "adjust")]
    for row in vectors["formulas"]:
        u.mem_write(scratch, struct.pack("<4H", *row["values"]))
        for role in ("difficulty", "reward"):
            u.reg_write(r.UC_X86_REG_RCX, scratch)
            call(RANGES[role][0])
            assert f"{u.reg_read(r.UC_X86_REG_XMM0) & 0xFFFFFFFF:08x}" == row[role + "_bits"]
    for row in vectors["steps"]:
        u.mem_write(scratch, struct.pack("<4H", *row["before"]))
        for register, value in [(r.UC_X86_REG_RCX, scratch), (r.UC_X86_REG_RDX, row["index"]),
                                (r.UC_X86_REG_R8, row["direction"] & 0xFFFFFFFF)]:
            u.reg_write(register, value)
        call(RANGES["adjust"][0])
        assert list(struct.unpack("<4H", u.mem_read(scratch, 8))) == row["after"]
    calendar_path=ROOT/"docs/analysis/evidence/0.109.0/save-backup/native-vectors.json"
    calendar=[x for x in json.loads(calendar_path.read_text())["cases"]if x["contract"]=="utc-calendar"]
    permitted[:]=[RANGES["utc-calendar"]]
    for row in calendar:
        utc_fields.clear();u.reg_write(r.UC_X86_REG_RCX,scratch);u.reg_write(r.UC_X86_REG_RDX,row["seconds"])
        call(RANGES["utc-calendar"][0]);assert utc_fields==row["fields"],(row,utc_fields)
    source = (ROOT / "crates/azeroth-survivors-re/src/save_browser.rs").read_text()
    export = source.split("pub fn export(directory:", 1)[1].split("pub fn import(", 1)[0]
    assert ".map_or(0, |elapsed| elapsed.as_secs())" in export
    assert "Save::write_payload(&path, payload)" in export
    assert "seal(" not in export and "write_export(" not in export
    save_source = (ROOT / "crates/azeroth-survivors-re/src/save.rs").read_text()
    payload_source = save_source.split("pub(crate) fn export_payload(", 1)[1].split("fn payload(", 1)[0]
    assert "seal(&self.plaintext())" in payload_source and "open(" not in payload_source
    options = (ROOT / "crates/azeroth-survivors-re/src/options.rs").read_text()
    export_action=options.split("Action::ExportSave => {",1)[1].split("Action::ImportSave(index)",1)[0]
    assert export_action.index("menu.load_active_save().export_payload()") < export_action.index("state.saves_directory()")
    assert "save_browser::export(&directory, &payload)" in export_action
    writer=save_source.split("fn write_with_clock(",1)[1].split("pub fn write_export(",1)[0]
    assert writer.index("self.payload()?") < writer.index("Self::write_payload(path, &payload)") < writer.index("backup::after_write(self, path, &payload, clock)")
    backup=(ROOT/"crates/azeroth-survivors-re/src/save/backup.rs").read_text().split("pub(super) fn after_write(",1)[1].split("#[cfg(test)]",1)[0]
    assert backup.index("if !has_progress(save)") < backup.index("let seconds = clock()")
    ordinary_calls=[(i.address,i.op_str)for i in md.disasm(raw(0x145831E10,0x6EA),0x145831E10)if i.mnemonic=="call"]
    assert ordinary_calls[:3] == [(0x145831E3F,"0x145832a60"),(0x145831E63,"0x1458d32a0"),(0x145831E85,"0x1458d2fb0")]
    assert (0x145831F1A,"0x14580aee0") in ordinary_calls
    assert (0x145832415,"0x14580aee0") in ordinary_calls
    assert (0x145832209,"0x145cc1fd0") in ordinary_calls
    # Both ordinary-write paths reconverge at the typed-default gate before time.
    assert raw(0x14583241B,5)[0] == 0xE9
    branch=next(md.disasm(raw(0x14583241B,5),0x14583241B))
    assert branch.mnemonic=="jmp" and branch.op_str=="0x145831f20"
    manifest = dict(target_sha256=SHA, ranges=records, descriptors=descriptors,
                    descriptor_range=dict(start=hex(descriptor_at), byte_count=192,
                        sha256=hashlib.sha256(raw(descriptor_at, 192)).hexdigest()),
                    fixture=dict(path=str(vectors_path.relative_to(ROOT)),
                                 sha256=hashlib.sha256(vectors_path.read_bytes()).hexdigest()),
                    clocks=clocks, checks=dict(clock=len(clocks), backup_clock=len(clocks), calendar=len(calendar), parse=len(vectors["parsed"]), descriptors=4,
                        formulas=len(vectors["formulas"]), steps=len(vectors["steps"])),
                    limits=["Clock/duration APIs are synthetic host seams; only native Result selection executes.",
                            "Allocation/free, memcmp and RawVec growth use explicit scratch-only seams for CSV parsing; UTC formatting is a field-capture seam.",
                            "Page layout, complete Save schema/envelope and filesystem timing are not replayed here.",
                            "No OS clock/file mutation, compilation, application or original/rebuilt comparison."])
    rea_path=OUT/"rea.json"
    if rea_path.is_file():
        rea=json.loads(rea_path.read_text());assert rea["target_sha256"]==SHA
        for owner in rea["owners"]:
            assert owner["provider"]["id"]=="ghidra"
            assert hashlib.sha256(raw(int(owner["raw_import_base"],16),owner["raw_import_byte_count"])).hexdigest()==owner["subject_sha256"]
            if "pseudocode_sha256" in owner:
                assert hashlib.sha256((OUT/(owner["role"]+".c")).read_bytes()).hexdigest()==owner["pseudocode_sha256"]
    files = {"manifest.json": json.dumps(manifest, indent=2, ensure_ascii=False) + "\n",
             "native.asm": "".join(assembly)}
    destination = STAGE if args.stage else OUT
    if args.stage:
        destination.mkdir(parents=True, exist_ok=True)
    for name, content in files.items():
        if args.stage:
            (destination / name).write_text(content)
        else:
            assert (destination / name).read_text() == content, name
    print("PASS: 14 export/backup-clock branches, 20 UTC calendars, 4 descriptors, 121 CSV cases, 625 formula pairs and 140 adjustments; source routes checked")


if __name__ == "__main__":
    main()

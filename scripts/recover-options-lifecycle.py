#!/usr/bin/env python3
"""Bound current Options globals/bindings/AddOns without compiling or a game.

--collect stages compact already-completed Ghidra evidence under runtime/;
--check verifies the retained contract and replays unchanged native branches.
Only explicitly declared comparator/formatter seams replace external calls.
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

from coverage_common import latest_target

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/analysis/history/interface/options-lifecycle/9e8ac4b82f89"
RETAINED = ROOT / "docs/analysis/evidence/options-comparison"
STAGED = ROOT / "runtime/analysis/staging/native-evidence/options-lifecycle"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
RANGES = {
    "global-store": (0x14063ADF0, 0x14063B40E),
    "vm-write": (0x14063A4E0, 0x14063A870),
    "line-replace": (0x1408F96C0, 0x1408F9852),
    "replace-next": (0x14091A860, 0x14091A9EA),
    "addon-account-path": (0x1411CF3A0, 0x1411CF47D),
    # Keep the bounded precedence loop, not the whole inventory procedure.
    "addon-account-precedence": (0x1411CBB80, 0x1411CBD5F),
    "addon-account-write": (0x1411CF760, 0x1411CFC65),
}
ANALYSES = ["global-store", "vm-write", "line-replace", "replace-next",
            "addon-account-path", "addon-inventory", "addon-account-write"]


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def load():
    target = latest_target(verify=True)
    assert target["version"] == "0.105.0" and target["sha256"] == SHA
    data = (ROOT / target["path"]).read_bytes()
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    return target, data, module.PE(data)


def binding_excerpts(data, pe):
    commit = b"function BenillaKeyBindings_Commit()"
    at = data.index(commit)
    end = data.index(b"\r\n        end", at) + len(b"\r\n        end")
    reset = data.index(b"LoadBindings(0)")
    start = data.rfind(b"OnAccept = function()", 0, reset)
    last = data.index(b"\r\n            end,", reset) + len(b"\r\n            end,")
    return [dict(role=role, virtual_address=hex(pe.offset_va(a)), byte_count=b-a,
                 sha256=hashlib.sha256(data[a:b]).hexdigest(), text=data[a:b].decode())
            for role,a,b in [("binding-commit",at,end),("binding-reset-accept",start,last)]]


def check_lua(excerpts, vectors):
    commit, reset = (row["text"] for row in excerpts)
    # Run the actual current embedded Lua acceptance/commit, with explicit
    # host seams. Source load(set)'s set-0 rule is traced, not executed here.
    keybind = (ROOT / "crates/benilla-ui/src/script/keybind.rs").read_text()
    assert "if set != 0 {\n            self.current_set = set;\n        }" in keybind
    source = commit + "\nlocal reset = {" + reset + "}\n" + """
function PlaySound() end
function BenillaKeyBindings_SetSelected() end
function BenillaKeyBindings_Output() end
function BenillaKeyBindingsPage_Refresh() end
local count = 0
for _, current in ipairs({1, 2}) do
    local saved
    function LoadBindings(which) assert(which == 0) end
    function GetCurrentBindingSet() return current end
    function SaveBindings(which) saved = which end
    reset.OnAccept()
    assert(saved == current)
    count = count + 1
end
"""
    for row in vectors["numeric_toggles"]:
        source += f"{row['key']} = {row['literal']}\n"
        source += f"assert((not not {row['key']}) == {'true' if row['literal']=='1' else 'false'})\ncount = count + 1\n"
    source += "print('Interpreted current binding reset/commit and exact global literals: ' .. count .. ' cases')\n"
    result = subprocess.run(["lua", "-"], input=source, capture_output=True, text=True, cwd=ROOT)
    assert result.returncode == 0, result.stderr
    return result.stdout.strip()


def replay(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section["rva"],
                    data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    stack, buf, stop = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(stack, 0x10000)
    u.mem_map(buf, 0x10000)
    u.mem_map(stop, 4096)
    mode = None

    def put(at, *values):
        u.mem_write(at, struct.pack("<" + "Q" * len(values), *values))

    def ret(value):
        u.reg_write(r.UC_X86_REG_RAX, value)
        sp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, struct.unpack("<Q", u.mem_read(sp, 8))[0])
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, pc, size, unused):
        if pc == stop or pc in {0x14063ADF0, 0x145B9C990, 0x140002200, 0x1411CBBF1}:
            u.emu_stop()
        elif pc == 0x145BC9787:
            a, b, n = (u.reg_read(x) for x in [r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8])
            ret(int(bytes(u.mem_read(a, n)) != bytes(u.mem_read(b, n))))
        elif pc == 0x140002210:
            a, n, b, m = (u.reg_read(x) for x in
                           [r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9])
            ret(int(bytes(u.mem_read(a, n)).lower() == bytes(u.mem_read(b, m)).lower()))
        elif not (0x1400F2100 <= pc < 0x1400F2668 or
                  0x14091A910 <= pc < 0x14091A9EA or
                  0x1411422D0 <= pc < 0x14114242D or
                  0x14006F550 <= pc < 0x14006F7C9 or
                  0x1411CBBE0 <= pc < 0x1411CBD5F):
            raise RuntimeError(f"Unreviewed native instruction {pc:#x} ({mode})")

    u.hook_add(UC_HOOK_CODE, hook)
    toggles = []
    rows = json.loads((ROOT / "crates/azeroth-survivors-re/assets/options.json").read_text())["rows"]
    for index, row in enumerate(rows):
        if row["storage"] != 2:
            continue
        for value in ["1", "0", "", "01", "true", "1 "]:
            mode = "toggle"
            raw = value.encode()
            u.mem_write(buf, raw or b"\0")
            u.reg_write(r.UC_X86_REG_RSP, stack + 0x8000)
            u.reg_write(r.UC_X86_REG_RCX, 0)
            u.reg_write(r.UC_X86_REG_RDX, index)
            u.reg_write(r.UC_X86_REG_R8, buf)
            u.reg_write(r.UC_X86_REG_R9, len(raw))
            u.emu_start(0x1400F2100, 0, count=500)
            assert u.reg_read(r.UC_X86_REG_RIP) == 0x14063ADF0
            p, n = (u.reg_read(x) for x in [r.UC_X86_REG_R8, r.UC_X86_REG_R9])
            literal = bytes(u.mem_read(p, n)).decode()
            assert literal == ("1" if value == "1" else "nil")
            toggles.append(dict(key=row["key"], input=value, literal=literal))
    matching = []
    name = "SHOW_COMBAT_TEXT"
    for line, expected in [
        (name + ' = "1"', True), (name + '=nil', True),
        (name + " \t = 0", True), (name + " =", True),
        (name + "_EXTRA = 1", False), (" " + name + " = 1", False),
        (name.lower() + " = 1", False), (name, False),
        ("-- " + name + " = 1", False), (name + "\t = false", True),
    ]:
        mode = "assignment-match"
        state, text, key = buf + 0x2000, buf + 0x4000, buf + 0x5000
        u.mem_write(state, b"\0" * 0x100)
        u.mem_write(text, line.encode())
        u.mem_write(key, name.encode())
        put(state, key, len(name), state + 0x90, state + 0xA0)
        u.reg_write(r.UC_X86_REG_RSP, stack + 0x8000)
        u.reg_write(r.UC_X86_REG_RBX, state)
        u.reg_write(r.UC_X86_REG_RDI, text)
        u.reg_write(r.UC_X86_REG_R14, len(line))
        u.emu_start(0x14091A910, 0, count=1000)
        pc = u.reg_read(r.UC_X86_REG_RIP)
        assert pc in {0x145B9C990, 0x140002200}
        matched = pc == 0x145B9C990
        assert matched == expected, (line, hex(pc))
        matching.append(dict(line=line, replaced=matched))
    addons = []
    for name, initial, account, expected in [
        ("Example", True, [], True), ("Example", False, [], False),
        ("Example", True, [("example", False)], False),
        ("Example", False, [("EXAMPLE", True)], True),
        ("Example", True, [("example", False), ("Example", True)], False),
        ("VeryLongAddonName", False, [("verylongaddonname", True)], True),
    ]:
        mode = "account-precedence"
        state, info, records = buf + 0x6000, buf + 0x7000, buf + 0x8000
        u.mem_write(state, b"\0" * 0x400)
        u.mem_write(info, b"\0" * 0x200)
        u.mem_write(info + 0x150, name.encode())
        put(info + 8, info + 0x150, len(name))
        u.mem_write(info + 0x12E, bytes([initial]))
        for i, (key, enabled) in enumerate(account):
            key_at = buf + 0x9000 + i * 0x100
            u.mem_write(key_at, key.encode())
            put(records + i * 32, len(key), key_at, len(key), int(enabled))
        put(state + 0x78, len(account))
        put(state + 0x160, records)
        put(state + 0x178, records + len(account) * 32)
        put(state - 0x10, len(account) * 32)
        u.reg_write(r.UC_X86_REG_RSP, stack + 0x8000)
        u.reg_write(r.UC_X86_REG_RBP, state)
        u.reg_write(r.UC_X86_REG_RDI, info)
        u.emu_start(0x1411CBC63 if account else 0x1411CBBF1, 0, count=1000)
        assert u.reg_read(r.UC_X86_REG_RIP) == 0x1411CBBF1
        result = bool(u.mem_read(info + 0x12E, 1)[0])
        assert result == expected
        addons.append(dict(name=name, character_or_default=initial,
                           account=[list(pair) for pair in account], enabled=result))
    return dict(target_sha256=SHA, numeric_toggles=toggles,
                assignment_matching=matching, addon_precedence=addons,
                seams=["Native memcmp and long-name ASCII-insensitive comparator only; no filesystem, VM, allocator or game callees run.",
                       "Assignment replay begins after native lines() decoding, with an explicit UTF-8 line fixture.",
                       "Addon replay begins after the ordinary character/TOC choice, with explicit account-row fixtures."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--collect", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    target, data, pe = load()
    def raw(a, n):
        at = pe.rva_offset(a - pe.image_base)
        return data[at:at+n]
    vectors = replay(data, pe)
    excerpts = binding_excerpts(data, pe)
    if args.check:
        manifest = json.loads((RETAINED / "lifecycle-manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        assert manifest["lua_excerpts"] == excerpts
        for row in manifest["extracts"] + manifest["literals"]:
            blob = raw(int(row["virtual_address"], 16), row["byte_count"])
            assert hashlib.sha256(blob).hexdigest() == row["sha256"]
            if "assembly" in row:
                assert hashlib.sha256((RETAINED / row["assembly"]).read_bytes()).hexdigest() == row["assembly_sha256"]
            if "text" in row: assert blob.decode() == row["text"]
        assert portable_record(json.loads((RETAINED / "lifecycle-native-vectors.json").read_text())) == portable_record(vectors)
        print(check_lua(excerpts, vectors))
        print("Verified current target, 12 exact 1/nil writes, 10 native assignment matches and 6 account/character/TOC precedence cases; no compilation or game")
        return
    if not args.collect: parser.error("Use --collect or --check")
    STAGED.mkdir(parents=True, exist_ok=True)
    extracts = []
    for label, (a, b) in RANGES.items():
        asm = objdump_output(["objdump", "-d", "--no-show-raw-insn",
            f"--start-address={a:#x}", f"--stop-address={b:#x}", str(ROOT / target["path"])], text=True)
        asm = asm[asm.index("Disassembly of section"):]
        (STAGED / (label + ".asm")).write_text(asm)
        extracts.append(dict(role=label, virtual_address=hex(a), byte_count=b-a,
            sha256=hashlib.sha256(raw(a,b-a)).hexdigest(), assembly=label+".asm",
            assembly_sha256=hashlib.sha256(asm.encode()).hexdigest()))
    analyses = []
    for label in ANALYSES:
        response = json.loads((WORK / ("rea-"+label) / "003-procedure_pseudo_code.json").read_text())["response"]["result"]
        evidence = response.get("structuredContent") or json.loads(response["content"][0]["text"])
        assert evidence["provider"]["id"] == "ghidra"
        analyses.append(dict(role=label, rea_evidence_id=evidence["evidence_id"],
            sha256=evidence["subject"]["digest"]["sha256"],
            retention="Bounded original assembly retained; full ephemeral raw Ghidra output remains under runtime."))
    literals = []
    for a,n in [(0x145FD3CA1,19),(0x145E61633,61),(0x145FD462A,6),(0x145FD4630,11)]:
        blob=raw(a,n)
        literals.append(dict(virtual_address=hex(a),byte_count=n,
            sha256=hashlib.sha256(blob).hexdigest(),text=blob.decode()))
    save(STAGED/"lifecycle-manifest.json",dict(target_sha256=SHA,extracts=extracts,
        literals=literals,analyses=analyses,lua_excerpts=excerpts,
        shared_write_dispatch="manifest.json and write.asm own 1400f2100; not duplicated here.",
        limits=["Raw Ghidra slices omit external globals/tables and use a generic ABI; original assembly supplies Windows argument order.",
                "Bindings lifecycle also uses byte-bound current embedded Lua excerpts retained in this manifest.",
                "Static native branches and connected source do not establish builds or original/rebuilt parity."]))
    save(STAGED/"lifecycle-native-vectors.json",vectors)
    print("Staged compact current Options lifecycle evidence under",STAGED.relative_to(ROOT))


if __name__ == "__main__": main()

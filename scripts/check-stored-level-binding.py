#!/usr/bin/env python3
"""Check selected-target binding evidence and the interpreted Lua body; no build/game.

--prepare-native stages bounded REA inputs/plans without launching analysis.
Retained Ghidra instructions are canonical; raw responses remain in runtime/.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from coverage_common import latest_target

RETAINED = ROOT / "docs/analysis/evidence/stored-level-bindings"
WORK = ROOT / "runtime/analysis/history/movement/keyboard-y/2009d7578a0a"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--prepare-native", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Binding recovery belongs to a different supplied target"
    data = (ROOT / target["path"]).read_bytes()
    module = load_script("binding_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    def span(address, size):
        return dict(virtual_address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(raw(address, size)).hexdigest())

    def pair_text(address):
        pointer, length = struct.unpack("<QQ", raw(address, 16))
        return raw(pointer, length).decode()

    def format_text(address, arguments):
        # This selected format encoding contains literal-length bytes, sequential
        # string-argument opcodes (c0) and a zero terminator. Fail on other forms.
        result, offset, argument = "", 0, 0
        while True:
            code = raw(address + offset, 1)[0]
            offset += 1
            if code == 0:
                break
            if code == 0xc0:
                result += arguments[argument]
                argument += 1
            else:
                assert code < 0x80
                result += raw(address + offset, code).decode()
                offset += code
        assert argument == len(arguments)
        return result, span(address, offset)

    command, header, key = [pair_text(address) for address in (0x146e77ce0, 0x146e77cf8, 0x146e77da8)]
    xml, xml_range = format_text(0x146e77d08, [command, header])
    defaults, default_range = format_text(0x146e77db8, [key, command])
    result = dict(target_sha256=SHA, command=command, header=header, default_key=key,
                  xml=xml, default_suffix=defaults,
                  menu_label=raw(0x145da54c8, 9).decode(),
                  menu_header=raw(0x145d9f46c, 17).decode(),
                  literal_ranges=[xml_range, default_range, span(0x145da54c8, 9),
                                  span(0x145d9f46c, 17), span(0x146e77cce, 58),
                                  span(0x146e77da4, 20)])
    assert (command, header, key) == ("AZS_OPENLEVELS", "AZS", "Y")
    assert defaults == "\r\nbind Y AZS_OPENLEVELS\r\n"
    native = ET.fromstring("<Bindings>" + xml + "</Bindings>")[0]
    source = ET.parse(ROOT / "crates/azeroth-survivors-re/assets/stored-level-bindings-0.105.0.xml").getroot()[0]
    assert native.attrib == source.attrib == {"name": command, "header": header}
    assert native.text.strip() == source.text.strip() == "AZS_OpenStoredLevels();"
    assert result["menu_label"] == "Level Up!" and result["menu_header"] == "Azeroth Survivors"
    manifest = json.loads((RETAINED / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    for row in manifest["extracts"]:
        address, size = int(row["virtual_address"], 16), row["byte_count"]
        assert span(address, size)["file_offset"] == row["file_offset"]
        assert span(address, size)["sha256"] == row["sha256"]
        assert hashlib.sha256((RETAINED / row["assembly"]).read_bytes()).hexdigest() == row["assembly_sha256"]
    WORK.mkdir(parents=True, exist_ok=True)
    if args.check:
        assert json.loads((RETAINED / "selected-data.json").read_text()) == result
        # Standalone interpreter/stub host: executes the actual selected API and
        # the source XML's body, without a client process or a compiled harness.
        body = json.dumps(source.text.strip())
        check = f'''arg = arg or {{}}
arg[1] = "docs/analysis/evidence/addon-api/game-mode-contract.lua"
dofile("scripts/check-addon-bootstrap.lua")
assert(BINDING_HEADER_AZS == "Azeroth Survivors")
assert(BINDING_NAME_AZS_OPENLEVELS == "Open Level-Ups")
SetCVar("spendLevels", "0")
assert((loadstring or load)({body}))()
assert(GetCVar("spendLevels") == "1")
'''
        subprocess.run(["lua", "-"], input=check, text=True, cwd=ROOT, check=True)
        print("Verified selected EXE, four native instruction ranges, binding/default formats and interpreted Lua body; no builds/games")
    else:
        (WORK / "selected-data.json").write_text(json.dumps(result, indent=2) + "\n")
    if args.prepare_native:
        for row in manifest["extracts"]:
            address = int(row["virtual_address"], 16)
            path = WORK / (row["role"] + ".bin")
            path.write_bytes(raw(address, row["byte_count"]))
            plan = dict(target=str(path.relative_to(ROOT)), output=str((WORK / ("rea-" + row["role"])).relative_to(ROOT)),
                        init_timeout=60, timeout=240,
                        open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(address)),
                        operations=[dict(name="analyze_function", arguments=dict(procedure=hex(address)))])
            (WORK / (row["role"] + "-plan.json")).write_text(json.dumps(plan, indent=2) + "\n")
        print("Staged bounded REA/Ghidra inputs and plans; analysis was not launched")


if __name__ == "__main__":
    main()

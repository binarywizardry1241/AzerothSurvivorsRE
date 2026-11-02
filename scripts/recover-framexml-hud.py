#!/usr/bin/env python3
"""Extract/check the selected 0.108.0 FrameXML HUD contract; never build/run a game."""
from script_sources import load_script
import argparse
import hashlib
import json
import re
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
EVIDENCE = ROOT / "docs/analysis/evidence/0.108.0/hud-framexml"
START = b"function UpdateTalentButton()"
END = b"-- Azeroth Survivors: a spell's tooltip beside its action button"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="Stage evidence under ignored runtime")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover new target bytes before using these contracts"
    data = target_bytes(target)
    module = load_script("hud_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    anchor = data.index(b"function AZS_MainBar_Slice(")
    at = data.rfind(b"\0", 0, anchor) + 1
    end = data.index(b"\0", anchor)
    patch = data[at:end]
    assert patch.startswith(b"\n\n-- Azeroth Survivors:") and len(patch) == 10204
    lo, hi = patch.index(START), patch.index(END)
    selected = patch[lo:hi]
    # The native formatting descriptor binds the exact full patch, rather than
    # treating a nearby Lua declaration or a pointer to an array end as a reader.
    descriptor = end + 4
    assert data[descriptor:descriptor + 8] == pe.offset_va(at).to_bytes(8, "little")
    assert int.from_bytes(data[descriptor + 8:descriptor + 16], "little") == len(patch)
    owner, owner_end = 0x1459A01D0, 0x1459A045D
    assert dict((pe.image_base + a, pe.image_base + z) for a, z, _ in pe.functions())[owner] == owner_end
    offset = pe.rva_offset(owner - pe.image_base)
    raw = data[offset:offset + owner_end - owner]
    metadata = dict(
        target_sha256=SHA, source="world-state-patch.lua",
        virtual_address=hex(pe.offset_va(at)), file_offset=hex(at), byte_count=len(patch),
        sha256=hashlib.sha256(patch).hexdigest(),
        selected_range=dict(offset=lo, byte_count=hi-lo, sha256=hashlib.sha256(selected).hexdigest()),
        descriptor=dict(virtual_address=hex(pe.offset_va(descriptor)), byte_count=16,
                        sha256=hashlib.sha256(data[descriptor:descriptor+16]).hexdigest()),
        native_owner=dict(virtual_address=hex(owner), end_exclusive=hex(owner_end), assembly="world-state-loader.asm",
                          file_offset=hex(offset), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest()),
        limits=["Exact Lua and bounded native file/format/write owner only; external callees, complete installer/engine ownership and runtime parity are unverified."])
    if args.write:
        output = ROOT / "runtime/hud-framexml-0.108.0/curated"
        output.mkdir(parents=True, exist_ok=True)
        (output / "world-state-patch.lua").write_bytes(patch)
        (output / "manifest.json").write_text(json.dumps(metadata, indent=2) + "\n")
        sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
                        str(ROOT / "runtime/armory-recovery/python-libs")]
        from capstone import Cs, CS_ARCH_X86, CS_MODE_64
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, owner))
        assert b"".join(bytes(i.bytes) for i in decoded) == raw
        (output / "world-state-loader.asm").write_text("\n".join(
            f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip() for i in decoded) + "\n")
        print(f"Staged {len(patch)} native Lua bytes, selected {len(selected)} bytes: {output.relative_to(ROOT)}")
        return
    assert (EVIDENCE / "world-state-patch.lua").read_bytes() == patch
    assert json.loads((EVIDENCE / "manifest.json").read_text()) == metadata
    recovered = bytearray()
    for line in (EVIDENCE / "world-state-loader.asm").read_text().splitlines():
        address, encoded = re.match(r"([0-9a-f]+) ([0-9a-f]+) ", line).groups()
        assert int(address, 16) == owner + len(recovered)
        recovered.extend(bytes.fromhex(encoded))
    assert recovered == raw, "Canonical native extract differs from current target"
    bridge = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs").read_text()
    assert 'world-state-patch.lua' in bridge and 'SOURCE.into()' in bridge
    assert '.split_once(' not in bridge
    assert r"Interface\FrameXML\WorldStateFrame.lua" in bridge
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client.rs").read_text()
    assert "extension.framexml_appends.splice(0..0, framexml_hud::appends())" in source
    host = ROOT / "crates/benilla-app/src"
    lifecycle = (host / "ui_script/lifecycle.rs").read_text()
    assert "extension.framexml_appends.clone()" in lifecycle
    assert "&binding_commands, &framexml_appends" in lifecycle
    loader = (host / "ui_script/addons.rs").read_text()
    assert "let Some(bytes) = provider(&path)" in loader and "&path, &provider" in loader
    assert "let mut bytes = self.read(req)?" in loader
    manifest = (host / "ui_script/manifest.rs").read_text()
    live = manifest.split("fn load_ingame_ui_with_appends(", 1)[1].split("#[cfg(test)]", 1)[0]
    assert live.index("load_core_with_appends(script, appends)") < live.index("load_layer(script)") < live.index("load_third_party(")
    assert "fn load_core_with_appends" in manifest and "&mut toc, appends" in manifest
    print(f"Verified selected-target Lua ({len(selected)} bytes), descriptor/native owner and live core/include/ReloadUI source routes; no compilation or game execution")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Extract or check the selected EXE's picker footer without running the game."""
import argparse
import hashlib
import re
import struct
import sys
import tempfile
import tomllib
from pathlib import Path

from coverage_common import ROOT, json_text, latest_target, platform_descriptor_versions, target_bytes
from script_sources import load_script

CRATE = ROOT / "crates/azeroth-survivors-re"
# Known x64 formatter argument construction. The LEAs supply the revision
# bytes, version slice descriptor and compact format. The immediate following
# the revision pointer store supplies its exact length.
FOOTER_ARGS = re.compile(
    rb"\x48\x8d\x05(?P<revision>....)\x48\x89\x85....\x48\xc7\x85....(?P<length>....)"
    rb"\x48\x8d\x05(?P<version>....)\x48\x89\x85....\x48\x8d\x05....\x48\x89\x85...."
    rb"\x48\x8d\x8d....\x48\x89\x8d....\x48\x89\x85....\x48\x8d\x15(?P<format>....)"
    rb"\x48\x8d\x8d....\x4c\x8d\x85....\xe8....",
    re.DOTALL,
)


def recover(target, pe):
    data = pe.data
    displays = platform_descriptor_versions(data, display=True, details=True)
    if len(displays) != 1 or displays[0]["version"] != target["version"]:
        raise ValueError("Expected one mapped picker format for the selected version")
    display = displays[0]
    version_at = display["file_offset"]
    descriptor_va = pe.offset_va(display["descriptor_offset"])
    format_va = pe.offset_va(display["descriptor_offset"] + 16)

    def span(start, end):
        return {
            "file_offset": hex(start),
            "virtual_address": hex(pe.offset_va(start)),
            "byte_count": end - start,
            "sha256": hashlib.sha256(data[start:end]).hexdigest(),
        }

    matches = []
    for section in pe.sections:
        if not int(section["characteristics"], 16) & 0x20000000:
            continue
        start = section["raw_offset"]
        end = start + min(section["raw_size"], section["virtual_size"])
        for match in FOOTER_ARGS.finditer(data, start, end):
            def rip_target(operand):
                return pe.offset_va(match.end(operand)) + struct.unpack("<i", match[operand])[0]

            if rip_target("version") != descriptor_va or rip_target("format") != format_va:
                continue
            length = struct.unpack("<I", match["length"])[0]
            revision_at = version_at - length
            if not 7 <= length <= 64 or rip_target("revision") != pe.offset_va(revision_at):
                continue
            revision = data[revision_at:version_at]
            if not re.fullmatch(rb"[0-9a-f]+", revision):
                continue
            matches.append({
                "version": target["version"],
                "build_revision": revision.decode("ascii"),
                "target_sha256": target["sha256"],
                "footer_data": span(revision_at, version_at + display["byte_count"]),
                "formatter_arguments": span(match.start(), match.end()),
            })
    if len(matches) != 1:
        raise ValueError("Picker footer arguments are missing or ambiguous; review the native formatter")
    return matches[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--write", action="store_true", help="Generate the selected target's source asset")
    mode.add_argument("--check", action="store_true", help="Verify the source asset and Cargo version")
    args = parser.parse_args()
    try:
        target = latest_target(verify=False)
        pe = load_script("menu_identity_pe", "inventory-executable.py").PE(target_bytes(target))
        identity = recover(target, pe)
        output = CRATE / "assets/menu-identity" / f"{target['version']}.json"
        expected = json_text(identity)
        asset_matches = output.is_file() and output.read_text(encoding="utf-8") == expected
        if args.check:
            package = tomllib.loads((CRATE / "Cargo.toml").read_text(encoding="utf-8"))["package"]
            if package["version"] != identity["version"]:
                raise ValueError("Cargo package version differs from the selected EXE")
            if not asset_matches:
                raise ValueError("Picker footer asset is stale; run recover-menu-identity.py --write")
        elif not asset_matches:
            output.parent.mkdir(parents=True, exist_ok=True)
            pending = None
            try:
                with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", dir=output.parent,
                                                 prefix=".picker-footer-", delete=False) as stream:
                    pending = Path(stream.name)
                    stream.write(expected)
                pending.replace(output)
            finally:
                if pending is not None:
                    pending.unlink(missing_ok=True)
        print(f"Picker footer: v{identity['version']} ({identity['build_revision']})")
    except (ValueError, OSError, struct.error) as error:
        print(f"Picker footer: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())

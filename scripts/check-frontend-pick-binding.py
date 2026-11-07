#!/usr/bin/env python3
"""Verify the positive frontend Pick resource identity from canonical startup bytes."""

import argparse
import hashlib
import json

from native_save_fixture import CPU, ROOT, SHA

DEST = (
    ROOT / "docs/analysis/evidence/account-commands/frontend-pick-binding.json"
)
TYPE_ID = "069ad40b469b67b8d24e086565767c39"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    cpu = CPU()
    source = ROOT / "docs/analysis/evidence/talents-menu/ui-manifest.json"
    canonical = json.loads(source.read_text())
    assert canonical["target_sha256"] == SHA
    owner = next(row for row in canonical["functions"] if row["name"] == "hover-plugin")
    start, end = int(owner["address"], 16), int(owner["end_exclusive"], 16)
    assert (start, end) == (0x140064930, 0x140065F67)
    assert hashlib.sha256(cpu.raw(start, end)).hexdigest() == owner["sha256"]
    assert (
        hashlib.sha256((ROOT / owner["assembly"]).read_bytes()).hexdigest()
        == owner["assembly_sha256"]
    )
    # Resolve the actual call and RIP operand, rather than identifying by size.
    call = cpu.raw(0x14006495E, 0x140064963)
    assert call[0] == 0xE8
    assert 0x140064963 + int.from_bytes(call[1:], "little", signed=True) == 0x140062330
    compare = cpu.raw(0x1400649CF, 0x1400649D7)
    assert compare[:4] == bytes.fromhex("660f6f15")
    assert (
        0x1400649D7 + int.from_bytes(compare[4:], "little", signed=True) == 0x145D9D780
    )
    # The same exact TypeID is used by resource registrars, including the HUD
    # initializer's descriptor. The canonical HUD chain belongs to its own report.
    descriptors = []
    for address in (0x145D9D780, 0x145D9DF58, 0x145DCD3C0):
        raw = cpu.raw(address, address + 16)
        assert raw.hex() == TYPE_ID
        descriptors.append(
            dict(
                address=hex(address),
                byte_count=16,
                bytes=raw.hex(),
                sha256=hashlib.sha256(raw).hexdigest(),
            )
        )
    # Metadata size is 0x40, and the restored value is copied as four vectors.
    assert cpu.raw(0x140064BC8, 0x140064BD3) == bytes.fromhex("48c785b004000040000000")
    windows = []
    for role, a, b in (
        ("restore-call", 0x140064957, 0x140064963),
        ("typeid-lookup", 0x1400649AB, 0x1400649D7),
        ("resource-layout", 0x140064BA2, 0x140064BD3),
        ("restored-pick-insertion", 0x140064C43, 0x140064D06),
    ):
        windows.append(
            dict(
                role=role,
                start=hex(a),
                end_exclusive=hex(b),
                sha256=hashlib.sha256(cpu.raw(a, b)).hexdigest(),
            )
        )
    result = dict(
        target_sha256=SHA,
        canonical_startup="../talents-menu/ui-manifest.json#hover-plugin",
        canonical_startup_assembly="../talents-menu/hover-plugin.asm",
        canonical_restore="../import-restore/manifest.json#restore",
        startup_owner=dict(
            start=hex(start), end_exclusive=hex(end), sha256=owner["sha256"]
        ),
        restore=dict(
            callsite="0x14006495e",
            callee="0x140062330",
            output="[rbp+0x2b0]",
            byte_count=64,
        ),
        resource=dict(
            typeid=TYPE_ID,
            layout_bytes=64,
            registration="0x140064c43..0x140064d06",
            descriptors=descriptors,
        ),
        code_windows=windows,
        limits=[
            "Static native startup dataflow and TypeID equality; no game, ECS resource insertion or Rust execution.",
            "Full startup/restore extracts are retained by their canonical owners; this file contains only bindings and hashes.",
        ],
    )
    if args.write:
        DEST.write_text(json.dumps(result, indent=2) + "\n")
    else:
        assert json.loads(DEST.read_text()) == result
    print(
        "Current frontend Pick startup binding passed: canonical owner, 3 identical TypeIDs and 4 code windows"
    )


if __name__ == "__main__":
    main()

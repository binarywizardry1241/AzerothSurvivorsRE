#!/usr/bin/env python3
"""Verify the 0.113.0 party addon API evidence without compilation or a game.

--lua executes only the exact extracted Lua with explicit host seams.
--prepare-rea stages original-address native slices and a static REA plan.
"""

import argparse
import hashlib
import json
import shutil
import subprocess

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / "docs/analysis/evidence/0.113.0/party-api"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua", action="store_true")
    parser.add_argument("--prepare-rea", action="store_true")
    args = parser.parse_args()
    evidence = json.loads((EVIDENCE / "manifest.json").read_text())
    target = latest_target(verify=True)
    assert target["sha256"] == evidence["target"]["sha256"], "Changed target needs fresh recovery"
    data = target_bytes(target)

    def check(row):
        offset = int(row["file_offset"], 16)
        value = data[offset:offset + row["size"]]
        assert hashlib.sha256(value).hexdigest() == row["sha256"], row.get("role", row)
        if "bytes_hex" in row:
            assert value.hex() == row["bytes_hex"]
        return value

    lua = check(evidence["embedded_api"])
    assert lua == (EVIDENCE / evidence["embedded_api"]["path"]).read_bytes()
    for row in evidence["native_owners"] + evidence["supplemental_ranges"] + evidence["constants"]:
        check(row)
    for row in evidence["classes"]:
        value = check(dict(file_offset=row["key_file_offset"], size=row["key_size"],
                           sha256=row["key_sha256"]))
        assert value.decode() == row["key"]
    print("PASS: installed target, exact embedded Lua, 8 native owners, 2 instruction excerpts and 7 constants")

    if args.prepare_rea:
        work = ROOT / "runtime/analysis/history/native-recovery/party-addon-api-reproduce/dd0ada42693c" / target["sha256"]
        work.mkdir(parents=True, exist_ok=True)
        owners = evidence["native_owners"]
        start = min(int(row["va"], 16) for row in owners)
        end = max(int(row["end"], 16) for row in owners)
        carrier = bytearray(end - start)
        for row in owners:
            at = int(row["va"], 16) - start
            carrier[at:at + row["size"]] = check(row)
        (work / "owners.bin").write_bytes(carrier)
        (work / "seeds.tsv").write_text("".join(
            f"{row['va']}\tfunction\n{row['va']}\tcode\n" for row in owners))
        plan = dict(target=str((work / "owners.bin").relative_to(ROOT)),
                    output=str((work / "rea").relative_to(ROOT)), init_timeout=60, timeout=240,
                    environment={"REA_GHIDRA_SEED_FILE": str((work / "seeds.tsv").relative_to(ROOT))},
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=row["va"]),
                                     label=row["role"]) for row in owners])
        (work / "plan.json").write_text(json.dumps(plan, indent=2) + "\n")
        print("REA plan:", (work / "plan.json").relative_to(ROOT))

    if args.lua:
        interpreter = shutil.which("lua")
        if interpreter is None:
            raise SystemExit("Existing Lua interpreter unavailable; no package was installed")
        subprocess.run([interpreter, str(EVIDENCE / "lua-contract-cases.lua"),
                        str(EVIDENCE / "embedded-api.lua")], cwd=ROOT, check=True)


if __name__ == "__main__":
    main()

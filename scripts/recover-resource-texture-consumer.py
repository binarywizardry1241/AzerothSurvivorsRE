#!/usr/bin/env python3
"""Trace one current texture name through configured M2 texture/emitter tables.

Read named model members in place, retain only compact exact-match receipts.
No asset export, renderer, application, compiler or game/server execution.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, file_sha256, latest_target
from script_sources import load_script

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
TEXTURE = "WORLD\\GENERIC\\PASSIVEDOODADS\\DUELINGFLAG\\DUST2B.BLP"
OUT = ROOT / "docs/analysis/evidence/texture-consumers.json"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", default=str(OUT))
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    inventory = ROOT / f"runtime/coverage/{SHA}/mpq-members/members.jsonl"
    coverage = json.loads((ROOT / "docs/analysis/evidence/mpq-member-coverage-comparison.json").read_text())
    archive_receipts = {r["path"]: r for r in coverage["archives"]}
    mpq = load_script("texture_member_reader", ROOT / "scripts/check-minimap-lifecycle.py")
    members = {}
    for line in inventory.open():
        row = json.loads(line)
        for name in row["names"]:
            key = name.replace("/", "\\").upper()
            if key.endswith((".M2", ".MDX", ".MDL")) and (
                key not in members or row["source_priority"] > members[key][1]["source_priority"]
            ):
                members[key] = (name, row)
    archives, matches, refused = {}, [], []
    scanned = total = 0
    commitment = hashlib.sha256()
    for key, (name, row) in sorted(members.items()):
        archive = archives.setdefault(row["archive"], None)
        if archive is None:
            archive = archives[row["archive"]] = mpq.Archive(row["archive"])
            receipt = archive_receipts[row["archive"]]
            assert archive.size == receipt["size_bytes"]
            assert hashlib.sha256(archive.hashes).hexdigest() == receipt["hash_table_sha256"]
            assert hashlib.sha256(archive.blocks).hexdigest() == receipt["block_table_sha256"]
        entry = archive.lookup(name)
        assert entry == (row["file_offset"], row["packed_bytes"],
                         row["uncompressed_bytes"], int(row["flags"], 16))
        try:
            raw = archive.read(entry)
        except (AssertionError, ValueError) as error:
            refused.append({"name": name, "archive": row["archive"], "reason": str(error)})
            continue
        scanned += 1
        total += len(raw)
        digest = hashlib.sha256(raw).hexdigest()
        commitment.update(json.dumps([key, row["archive"], digest],
                                     separators=(",", ":")).encode() + b"\n")
        if b"DUST2B" not in raw.upper():
            continue
        assert raw[:4] == b"MD20", (name, raw[:4])
        version = struct.unpack_from("<I", raw, 4)[0]
        assert 256 <= version <= 263, (name, version)
        count, offset = struct.unpack_from("<II", raw, 0x5C)
        assert offset + count * 16 <= len(raw)
        for index in range(count):
            at = offset + index * 16
            kind, flags, size, start = struct.unpack_from("<4I", raw, at)
            assert start + size <= len(raw)
            string = raw[start:start + size].split(b"\0", 1)[0].decode("utf-8")
            if string.replace("/", "\\").upper() != TEXTURE:
                continue
            emitters = []
            if version == 256:
                n, off = struct.unpack_from("<II", raw, 0x13C)
                assert off + n * 0x1F8 <= len(raw)
                for emitter in range(n):
                    record = off + emitter * 0x1F8
                    selected = struct.unpack_from("<H", raw, record + 0x16)[0]
                    if selected == index:
                        emitters.append({"index": emitter, "record_offset": record,
                                         "record_bytes": 0x1F8,
                                         "sha256": hashlib.sha256(raw[record:record + 0x1F8]).hexdigest()})
            matches.append({"name": name, "archive": row["archive"],
                            "member_selector": row, "member_sha256": digest,
                            "version": version, "texture_index": index,
                            "texture_record_offset": at,
                            "texture_record_hex": raw[at:at + 16].hex(),
                            "texture_type": kind, "texture_flags": flags,
                            "filename_offset": start, "filename_bytes": size,
                            "filename": string, "particle_emitters": emitters})
    result = {"schema_version": 1,
              "target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
              "finding_ids": [246], "texture": TEXTURE,
              "model_selector": "current highest-priority named .m2/.mdx/.mdl members from committed MPQ member inventory",
              "inventory": {"path": str(inventory.relative_to(ROOT)), "sha256": file_sha256(inventory)},
              "selected_models": len(members), "models_read": scanned,
              "payload_bytes_read": total, "ordered_payload_commitment": commitment.hexdigest(),
              "refused": refused, "matches": matches,
              "limits": ["Exact authored texture-table matches only; no inferred AS producer, actual loaded model, lifetime or rendering.",
                         "Only registered named model members; no external archives, loose assets or constructed model replacements.",
                         "Particle table interpretation is limited to current source's MD20 v256 schema; no emitter execution."]}
    def receipt(path):
        return {"path": str(path.relative_to(ROOT)), "sha256": file_sha256(path)}
    result["generator"] = receipt(ROOT / "scripts/recover-resource-texture-consumer.py")
    result["parser"] = receipt(ROOT / "scripts/check-minimap-lifecycle.py")
    result["archive_inventory"] = receipt(ROOT / "docs/analysis/evidence/mpq-member-coverage-comparison.json")
    result["parent_resource_proof"] = receipt(ROOT / "docs/analysis/evidence/resource-delta.json")
    result["source_boundaries"] = [receipt(ROOT / name) for name in (
        "crates/benilla-m2/src/lib.rs", "crates/benilla-formats/src/particles.rs",
        "crates/benilla-assets/src/m2.rs", "crates/benilla-formats/src/chain.rs")]
    result["classification"] = "shared-spell-enchantment-world-model-particle-texture; actual AS model selection/lifetime not inferred"
    output = Path(args.output)
    assert output.resolve().is_relative_to(ROOT)
    if args.write:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(result, indent=2) + "\n")
    elif json.loads(output.read_text()) != result:
        raise ValueError("Stale texture consumer receipt: " + str(output.relative_to(ROOT)))
    print(json.dumps({"models_read": scanned, "payload_bytes_read": total,
                      "refused": len(refused), "matches": [(r["name"], r["texture_index"]) for r in matches]}))


if __name__ == "__main__":
    main()

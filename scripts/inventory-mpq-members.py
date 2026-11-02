#!/usr/bin/env python3
"""Inventory all installed MPQ member names, block identities and source overrides.

Uses the existing read-only MPQ parser. No binary members are extracted, compiled
or executed. Default verifies the compact proof; --stage writes the full ignored
member/lead map and proposed proof. Paths, sizes and hash slots do not establish
asset semantics, native mount equivalence, resource-ID meaning or runtime parity.
"""
import argparse
from collections import Counter, defaultdict
import hashlib
import json
from pathlib import PureWindowsPath
import struct

from coverage_common import ROOT, file_sha256, latest_target
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/coverage" / SHA / "mpq-members"
KEEP = ROOT / "docs/analysis/evidence/0.113.2/mpq-member-coverage.json"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded(rows):
    return "".join(json.dumps(row, ensure_ascii=False, separators=(",", ":")) + "\n" for row in rows).encode()


def canonical(name):
    return name.replace("/", "\\").upper()


def derive(stage=False):
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    parser_path = ROOT / "scripts/check-minimap-lifecycle.py"
    mpq = load_script("q41_mpq_inventory_reader", parser_path)
    records = sorted(target["runtime_data"]["archives"],
                     key=lambda r: (not r["path"].lower().endswith("/patch.mpq"), r["path"].lower()))
    assert [r["path"].split("/")[-1] for r in records] == ["patch.MPQ", *[f"patch-{i}.MPQ" for i in range(2, 10)]]
    members, archives, by_name = [], [], defaultdict(list)
    for priority, record in enumerate(records):
        archive = mpq.Archive(record["path"])
        assert archive.size == record["size_bytes"] and file_sha256(archive.path) == record["sha256"]
        entry = archive.lookup("(listfile)")
        assert entry is not None
        listed = archive.read(entry)
        names = [line.strip() for line in listed.decode("utf-8-sig").splitlines() if line.strip()]
        assert len(set(map(canonical, names))) == len(names)
        names = sorted(set(names + ["(listfile)"]), key=canonical)
        hash_names = defaultdict(list)
        for name in names:
            hash_names[(mpq.name_hash(name, 0x100), mpq.name_hash(name, 0x200))].append(name)
        active, named, blocks = 0, set(), set()
        opaque_slots = []
        for slot, (ha, hb, locale, platform, index) in enumerate(struct.iter_unpack("<IIHHI", archive.hashes)):
            if index in [0xFFFFFFFF, 0xFFFFFFFE]:
                continue
            active += 1
            assert index * 16 + 16 <= len(archive.blocks)
            offset, packed, size, flags = struct.unpack_from("<IIII", archive.blocks, index * 16)
            assert flags & 0x80000000 and offset + packed <= archive.size
            candidates = hash_names.get((ha, hb), [])
            if not candidates:
                opaque_slots.append(slot)
            for name in candidates:
                # Independently check probe-chain visibility, rather than only
                # matching a pair appearing anywhere in the hash table.
                assert archive.lookup(name) == (offset, packed, size, flags)
                named.add(canonical(name))
            blocks.add(index)
            row = dict(archive=record["path"], source_priority=priority, hash_slot=slot,
                       hash_a=hex(ha), hash_b=hex(hb), locale=locale, platform=platform,
                       block_index=index, file_offset=offset, packed_bytes=packed,
                       uncompressed_bytes=size, flags=hex(flags), names=candidates)
            members.append(row)
            for name in candidates:
                by_name[canonical(name)].append(row)
        existing_blocks = {i for i, row in enumerate(struct.iter_unpack("<IIII", archive.blocks))
                           if row[3] & 0x80000000}
        assert named == set(map(canonical, names))
        archives.append(dict(path=record["path"], sha256=record["sha256"], size_bytes=archive.size,
                             hash_table_sha256=digest(archive.hashes), block_table_sha256=digest(archive.blocks),
                             listfile_sha256=digest(listed), listed_names=len(names), active_hash_slots=active,
                             opaque_hash_slots=opaque_slots, existing_blocks=len(existing_blocks),
                             blocks_without_active_hash=sorted(existing_blocks - blocks),
                             source_priority=priority))
    resolved = []
    for name, occurrences in sorted(by_name.items()):
        # This records the existing source chain, whose later archives win.
        # It does not revalidate the target's complete mount/locale rules.
        latest = max(r["source_priority"] for r in occurrences)
        winning = [r for r in occurrences if r["source_priority"] == latest]
        resolved.append(dict(name=name, occurrences=len(occurrences),
                             source_archive=winning[0]["archive"],
                             source_hash_slots=[r["hash_slot"] for r in winning],
                             overridden_archives=sorted({r["archive"] for r in occurrences
                                                        if r["source_priority"] < latest})))
    queue = json.loads((ROOT / "docs/analysis/evidence/0.113.2/unknown-recovery.json").read_text())
    inv = queue["inputs"]["inventory.json"]
    assert file_sha256(ROOT / inv["path"]) == inv["sha256"]
    inventory = json.loads((ROOT / inv["path"]).read_text())
    basename = defaultdict(list)
    for name in by_name:
        basename[PureWindowsPath(name).name].append(name)
    leads = []
    for ordinal, record in enumerate(inventory["embedded_candidates"]["resource_path"]):
        literal = record["literal"]
        key = canonical(literal)
        exact = key if key in by_name else None
        candidates = basename.get(PureWindowsPath(key).name, []) if exact is None else []
        leads.append(dict(selector=f"Q41-D03:resource_path:{ordinal}", file_offset=record["file_offset"],
                          literal_sha256=record["sha256"], literal=literal, exact_member_name=exact,
                          basename_candidates=candidates,
                          status="exact_name_observed_not_semantics" if exact else
                                 "basename_candidates_require_native_path_producer" if candidates else
                                 "no_exact_member_path_producer_unclassified"))
    chain_path = ROOT / "crates/benilla-formats/src/chain.rs"
    chain = chain_path.read_text()
    assert "Ascending priority: later archives win" in chain
    assert "self.archives.iter().rev()" in chain
    outputs = {"members.jsonl": members, "source-overrides.jsonl": resolved, "resource-leads.jsonl": leads}
    commitments = {}
    for name, rows in outputs.items():
        data = encoded(rows)
        commitments[name] = dict(path=(WORK / name).relative_to(ROOT).as_posix(), records=len(rows),
                                 bytes=len(data), sha256=digest(data))
        if stage:
            WORK.mkdir(parents=True, exist_ok=True)
            (WORK / name).write_bytes(data)
        else:
            assert (WORK / name).read_bytes() == data
    extensions = Counter(PureWindowsPath(name).suffix.lower() or "[no extension]" for name in by_name)
    return dict(schema_version=1, target=target, gap_ids=[41], lead_ids=["Q41-R01", "Q41-D03"],
                parser=dict(path=parser_path.relative_to(ROOT).as_posix(), sha256=file_sha256(parser_path)),
                source_chain=dict(path=chain_path.relative_to(ROOT).as_posix(), sha256=file_sha256(chain_path)),
                native_resource_candidate_input=inv, archives=archives, outputs=commitments,
                counts=dict(archives=len(archives), active_hash_slots=len(members), unique_names=len(by_name),
                            opaque_hash_slots=sum(len(r["opaque_hash_slots"]) for r in archives),
                            blocks_without_active_hash=sum(len(r["blocks_without_active_hash"]) for r in archives),
                            overridden_names=sum(bool(r["overridden_archives"]) for r in resolved),
                            resource_path_candidates=len(leads),
                            resource_candidate_states=dict(sorted(Counter(r["status"] for r in leads).items())),
                            member_extension_counts=dict(sorted(extensions.items()))),
                current_AS_connection=dict(report="docs/analysis/race-portraits-0.113.2.md",
                    member="Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Races.blp",
                    source="crates/azeroth-survivors-re/src/armory/race_portraits.rs",
                    scope="Existing current race-atlas proof supplies a bounded AS resource/consumer contract. Other members and ambiguous text candidates are not promoted to this proof."),
                limits=["Every active hash slot/block and listfile name is accounted for, but names and table records are not asset semantics or content hashes.",
                        "Only listfiles are decoded; binary assets remain in the supplied archives. Unsupported member codecs/encryption are not exercised by this inventory.",
                        "Source priority is traced to the reused chain; target-specific mount/locale/override equivalence and dynamic resource IDs remain separate native questions.",
                        "All 303 original resource-path candidates remain visible; absent/concatenated/partial paths require their native string producers, not guessed suffix or URI normalization.",
                        "Existing engine world/audio/model consumers are supporting context. No generic engine reconstruction or cooperative behavior is authorized by this resource inventory.",
                        "No compilation, source/game execution, runtime loading, rendering or original/rebuilt parity comparison."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    result = derive(args.stage)
    text = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.stage:
        (WORK / "proof.json").write_text(text)
    else:
        assert KEEP.read_text() == text
    print(json.dumps(result["counts"]))


if __name__ == "__main__":
    main()

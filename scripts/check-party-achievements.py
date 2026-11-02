#!/usr/bin/env python3
"""Replay current party-award delivery evidence without building or running a game."""
import argparse
import hashlib
import json

from coverage_common import ROOT, artifact_path
from script_sources import load_script


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    args = parser.parse_args()
    manifest = json.loads((ROOT / "docs/analysis/evidence/0.117.0/party-achievements/manifest.json").read_text())
    raw = artifact_path("installed-game/AzerothSurvivors.exe").read_bytes()
    assert manifest["schema"] == "as-party-achievement-delivery-v1"
    assert manifest["target"] == {
        "version": "0.117.0", "size_bytes": 145283072,
        "sha256": "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293",
    }
    assert digest(raw) == manifest["target"]["sha256"]
    pe = load_script("party_delivery_pe", ROOT / "scripts/inventory-executable.py").PE(raw)
    owners = {(pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions()}
    expected = {
        "ongoing-feat-delivery": (0x145af9030, 0x145af9103),
        "account-party-delivery": (0x145b154f0, 0x145b15a17),
        "recipient-snapshot": (0x145b16870, 0x145b16aec),
    }
    assert {row["role"] for row in manifest["native_spans"]} == expected.keys()
    writer = json.loads((ROOT / manifest["persistent_writer"]).read_text())
    assert writer["schema"] == "as-party-achievement-delivery-writer-v1"
    assert writer["target"]["sha256"] == manifest["target"]["sha256"]
    expected["persistent-writer"] = (0x145ac2a90, 0x145ac2ca2)
    writer_span = dict(writer["writer"], role="persistent-writer", byte_count=writer["writer"]["size"])
    for row in [*manifest["native_spans"], writer_span]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert (start, end) == expected[row["role"]] and (start, end) in owners
        offset = pe.rva_offset(start - pe.image_base)
        code = raw[offset:offset + end - start]
        assert offset == int(row["file_offset"], 16) and len(code) == row["byte_count"]
        assert digest(code) == row["sha256"]
        assembly = (ROOT / row["extract"]).read_bytes()
        assert digest(assembly) == row["extract_sha256"]
        cursor = start
        for line in assembly.decode().splitlines():
            address, opcodes, _ = line.split(" ", 2)
            opcodes = bytes.fromhex(opcodes)
            assert int(address, 16) == cursor and opcodes
            assert opcodes == code[cursor - start:cursor - start + len(opcodes)]
            cursor += len(opcodes)
        assert cursor == end
    for row in writer["native_dependencies"].values():
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert (start, end) in owners
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16) and end - start == row["size"]
        assert digest(raw[offset:offset + end - start]) == row["sha256"]
    retained = 0
    assert [row["role"] for row in manifest["queries"]] == ["local-feat-wrapper", "party-feat-wrapper"]
    writer_query = dict(writer["query"], role="persistent-writer",
        profile_digest=writer["query"]["analysis_profile_digest"],
        normalized_sha256=writer["query"]["normalized_result_sha256"])
    for row in [*manifest["queries"], writer_query]:
        paths = {key: ROOT / row[key] for key in ("input", "plan", "result")}
        if not all(path.is_file() for path in paths.values()):
            assert not args.require_retained_queries, row["role"]
            continue
        for key, path in paths.items():
            assert digest(path.read_bytes()) == row[key + "_sha256"]
        result = json.loads(paths["result"].read_text())["structuredContent"]
        assert result["provider"]["id"] == "ghidra"
        assert result["subject"]["digest"]["sha256"] == row["input_sha256"]
        assert result["evidence_id"] == row["evidence_id"]
        assert result["analysis_profile"]["digest"] == row["profile_digest"]
        assert digest(result["normalized_result"].encode()) == row["normalized_sha256"]
        retained += 1

    # Replay the live path's selected connections, independently of Rust execution.
    anchors = {
        "crates/azeroth-survivors-re/src/gameplay/mod.rs": [
            "account_eligible && (!showcase || game.is_party_replica())",
            "if let Some(context) = game.cooperative_feat_context()",
            "mark_cooperative_victory(game.zone.key)", "crate::progression::grant_party_feats(",
            "granted.extend(feats)", "menu.commit_account()",
            "shared_killing_blow_reaches_non_killer_save_once_with_first_date",
            "cooperative_victory_uses_recipient_admission_and_persists_history",
        ],
        "crates/azeroth-survivors-re/src/progression.rs": [
            "pub(crate) fn grant_party_feats(", "eligible_cooperative_keys(",
            "save.grant_achievements(&keys, Some(earned_at))",
        ],
        "crates/azeroth-survivors-re/src/gameplay/coop_publish.rs": [
            ".with_party_hero(slot, |game|", "game.native_state()", "NativeMessage::State(native.clone())",
        ],
        "crates/azeroth-survivors-re/src/gameplay/coop.rs": [
            "coop::client_state::validate_state(", "game.apply_replica_native(&value)",
            "NativeMessage::End if guest && state.sync_sent", "run.mechanics = None",
        ],
        "crates/azeroth-survivors-re/src/save/achievements.rs": [
            "!earned.insert(key.clone())", "dates.entry(key.clone()).or_insert(seconds)",
        ],
        "crates/azeroth-survivors-re/src/menu_state.rs": [
            "pub fn commit_account(", "for snapshot in self.pending_saves.drain(..)", "snapshot.write(path)",
        ],
    }
    for path, needles in anchors.items():
        source = (ROOT / path).read_text()
        for needle in needles:
            assert needle in source, (path, needle)
    print(f"Passed three current native delivery owners, the persistent writer and live source connections; {retained}/3 retained Ghidra receipts.")
    print("Rust regressions, compilation, network/save execution and original/rebuilt parity remain unrun.")


if __name__ == "__main__":
    main()

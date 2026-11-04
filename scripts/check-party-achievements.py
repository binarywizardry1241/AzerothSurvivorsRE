#!/usr/bin/env python3
"""Replay current party-award delivery evidence without building or running a game."""
import argparse
import hashlib
from itertools import product
import json

from coverage_common import ROOT, artifact_path, target_bytes
from script_sources import load_script


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def check_current_guest():
    from native_terminal import NativeReplay

    manifest = json.loads((ROOT / "docs/analysis/evidence/0.141.0/party-achievement-settlement.json").read_text())
    raw = target_bytes(manifest["target"])
    pe = load_script("party_delivery_pe", ROOT / "scripts/inventory-executable.py").PE(raw)
    for row in manifest["native_spans"]:
        start, end = (int(row[key], 16) for key in ("start", "end_exclusive"))
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16), row["role"]
        assert digest(raw[offset:offset + end - start]) == row["sha256"], row["role"]

    n = NativeReplay(raw, pe)
    r, u = n.registers, n.machine
    cases = 0
    for guid, mode, flags in product((0, 42, 0xffffff), (0, 1, 2), range(4)):
        for start, end, rejected, base in (
            (0x145ec310f, 0x145ec3133, 0x145ec34b4, r.UC_X86_REG_RSI),
            (0x145ec43d8, 0x145ec4406, 0x145ec4406, r.UC_X86_REG_R14),
        ):
            phases = range(8) if start == 0x145ec43d8 else (None,)
            for phase in phases:
                admitted = 0x145ec444c if phase is not None else end
                n.reset("recipient", [(start, end)], {rejected, admitted})
                n.put(n.app + 0x1fb8, "<Q", guid)
                n.put(n.app + 0x10, "<Q", mode)
                n.put(n.app + 0x10ed, "<B", flags)
                u.reg_write(base, n.app)
                if phase is not None:
                    n.put(n.bp + 0x1a6, "<B", phase)
                eligible = guid != 0xffffff and (mode == 2 or flags & 1 == 0)
                eligible &= phase is None or 1 <= phase <= 5
                assert n.run(start) == (admitted if eligible else rejected)
                cases += 1

    for won, present, members, prior, zone in product(
        (0, 1), (False, True), range(6), ((), (2,), (4,), (1, 5)), (2, 4)
    ):
        n.reset("cooperative history", [(0x145ec324e, 0x145ec331d)], {0x145ec331d})
        history = n.mem + 0x5000
        n.put(n.app + 0x16e0, "<QQQ", 13, history, len(prior))
        for index, value in enumerate(prior):
            n.put(history + index * 8, "<Q", value)
        n.put(n.bp + 0x29b, "<B", won)
        n.put(n.bp + 0x230, "<q", 0 if present else -1)
        n.put(n.bp + 0x240, "<Q", members)
        u.reg_write(r.UC_X86_REG_RSI, n.app)
        u.reg_write(r.UC_X86_REG_RDI, zone)

        def seam(address):
            if address == 0x1463a553b:
                destination = u.reg_read(r.UC_X86_REG_RCX)
                source = u.reg_read(r.UC_X86_REG_RDX)
                count = u.reg_read(r.UC_X86_REG_R8)
                u.mem_write(destination, bytes(u.mem_read(source, count)))
            elif address != 0x145ec1ac0:
                return False
            n.return_seam()
            return True

        n.seam = seam
        n.run(0x145ec324e)
        expected = sorted(set(prior) | ({zone} if won and present and members >= 2 else set()))
        assert n.get(n.app + 0x16f0, "<Q")[0] == len(expected)
        assert [n.get(history + i * 8, "<Q")[0] for i in range(len(expected))] == expected
        cases += 1

    source = ROOT / "crates/azeroth-survivors-re/src"
    local = (source / "gameplay/mod.rs").read_text()
    poll, settlement = local.split("fn account_delivery(", 1)[1].split("fn persist_run_at(", 1)
    assert "replica.receive_live_feats(&mut session, &mut menu, now)" in poll
    live, terminal = settlement.split("let terminal_edge =", 1)
    assert "grant_party_feats(" in live and "mark_cooperative_victory" not in live
    terminal = terminal.split("fn hud(", 1)[0]
    assert terminal.index("if count_eligible && terminal_edge") < terminal.index("mark_cooperative_victory")
    assert terminal.index("mark_cooperative_victory") < terminal.index("grant_account")
    guest = (source / "gameplay/guest_settlement.rs").read_text()
    live, account = guest.split("fn live_feats(", 1)[1].split("fn account(", 1)
    assert "grant_party_feats(" in live and "mark_cooperative_victory" not in live
    assert "self.feats.won && context.members.len() >= 2" in account
    assert account.index("mark_cooperative_victory") < account.index("grant_account")
    assert 'strip_prefix("coopbeat|")' in (source / "save/coop_history.rs").read_text()
    print(f"Passed {cases} original-instruction cases / {n.instructions} steps for recipient and cooperative history admission.")
    print("Host, guest and Save source boundaries checked.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    parser.add_argument("--guest-achievements-0.141.0", dest="current_guest", action="store_true")
    args = parser.parse_args()
    if args.current_guest:
        check_current_guest()
        return
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
            "game.cooperative_feat_context()",
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

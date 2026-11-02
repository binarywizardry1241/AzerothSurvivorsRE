#!/usr/bin/env python3
"""Read-only replay of selected 0.117.0 party-feat native/source contracts.

No compilation, game/server execution, filesystem save operation or parity check.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re

from coverage_common import latest_target, target_bytes

ROOT = Path(__file__).resolve().parent.parent
EVIDENCE = ROOT / "docs/analysis/evidence/0.117.0/party-achievement-producer"


def require(condition, message):
    if not condition:
        raise SystemExit(f"FAIL: {message}")


def digest(data):
    return hashlib.sha256(data).hexdigest()


def local(value):
    path = (ROOT / value).resolve()
    require(path.is_relative_to(ROOT), f"non-project evidence path: {value}")
    return path


def rust(path):
    return re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", local(path).read_text()))


def body(source, name):
    start = source.index(f"fn{name}(")
    start = source.index("{", start)
    depth = 1
    end = start + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start + 1:end - 1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    selected = latest_target(verify=True)
    target = manifest["target"]
    require(all(selected[key] == target[key] for key in ("version", "sha256", "size_bytes")),
            "installed/newest registered target differs from producer evidence")
    data = target_bytes(selected)
    spec = importlib.util.spec_from_file_location("pe_inventory", ROOT / "scripts/inventory-executable.py")
    pe_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(pe_module)
    pe = pe_module.PE(data)
    assemblies = {}
    instruction_bytes = 0
    instructions = 0
    for entry in manifest["native_ranges"]:
        lo, hi = int(entry["start_va"], 16), int(entry["end_va"], 16)
        offset = pe.rva_offset(lo - pe.image_base)
        require(offset == int(entry["file_offset"], 16), f"PE mapping drift: {entry['name']}")
        blob = data[offset:offset + hi - lo]
        require(len(blob) == entry["size_bytes"] and digest(blob) == entry["sha256"],
                f"native byte range drift: {entry['name']}")
        assembly = local(entry["assembly_path"]).read_bytes()
        require(digest(assembly) == entry["assembly_sha256"], f"assembly receipt drift: {entry['name']}")
        cursor, decoded, count = lo, bytearray(), 0
        for line in assembly.decode().splitlines():
            match = re.fullmatch(r"([0-9a-f]+): ([0-9a-f]+) ([a-z0-9]+)(?: (.*))?", line)
            require(match is not None, f"malformed canonical instruction: {entry['name']}")
            address, raw = int(match[1], 16), bytes.fromhex(match[2])
            require(address == cursor and raw, f"noncontiguous canonical instructions: {entry['name']}")
            decoded.extend(raw)
            cursor += len(raw)
            count += 1
        require(cursor == hi and decoded == blob and count == entry["instruction_count"],
                f"canonical instruction bytes disagree with installed EXE: {entry['name']}")
        assemblies[entry["name"]] = assembly.decode()
        instruction_bytes += len(blob)
        instructions += count
    for entry in manifest["constants"]:
        offset = pe.rva_offset(int(entry["start_va"], 16) - pe.image_base)
        require(offset == int(entry["file_offset"], 16), f"constant PE mapping drift: {entry['name']}")
        blob = data[offset:offset + entry["size_bytes"]]
        require(blob.hex() == entry["hex"] and digest(blob) == entry["sha256"],
                f"native constant drift: {entry['name']}")
        if "value" in entry:
            require(int.from_bytes(blob, "little") == entry["value"], f"threshold drift: {entry['name']}")

    # The complete native swap is a straight-line leaf. Prove that no private
    # field store overlaps the shared death/member/event ownership ranges.
    swap = assemblies["hero-swap"]
    require(not re.search(r"\b(?:call|j[a-z]+|loop[a-z]*)\b", swap), "hero swap is no longer a straight-line leaf")
    require(swap.rstrip().endswith(" ret ") or swap.rstrip().endswith(" ret"), "hero swap RET missing")
    protected = ((0xc6c, 0xc70), (0xa90, 0xaa8), (0xaa8, 0xac0))
    sizes = {"byte": 1, "word": 2, "dword": 4, "qword": 8, "xmmword": 16}
    for match in re.finditer(r"^[0-9a-f]+: [0-9a-f]+ mov[a-z]* (byte|word|dword|qword|xmmword) ptr \[rcx(?: \+ (0x[0-9a-f]+))?\],", swap, re.M):
        offset = int(match[2] or "0", 16)
        require(all(offset + sizes[match[1]] <= lo or offset >= hi for lo, hi in protected),
                "native private hero swap overlaps shared party-feat fields")
    require("mov byte ptr [rcx + 0xc77], r9b" in swap
            and "mov byte ptr [rdx + 0x983], r8b" in swap, "native abandonment swap mapping missing")

    prefix = "crates/azeroth-survivors-re/src/gameplay/mechanics/"
    helper = rust(prefix + "party_achievements.rs")
    coop = rust(prefix + "coop.rs")
    bosses = rust(prefix + "bosses.rs")
    incoming = rust(prefix + "incoming.rs")
    member = body(helper, "member")
    for text in ("abilities.iter().map(|row|row.rank).max()",
                 "best.next().filter(|_|best.next().is_none())",
                 ".map_or(0,|row|row.definition.spell_id)",
                 'talents.iter().any(|key|key=="tranquility")',
                 'talents.iter().any(|key|key=="bladestorm")'):
        require(text in member, f"live member selector missing native source connection: {text}")
    refresh = body(coop, "refresh_party_feat_members")
    require("if!self.abandoned" in refresh and "if!hero.state.abandoned" in refresh,
            "member projection must exclude abandoned heroes")
    require(not any(text in refresh for text in ("self.dead", "hero.state.dead", ".health(", ".completed")),
            "member projection must retain down/dead/victorious heroes")
    require(refresh.index("members.push(member(self.class.class_id") < refresh.index("forheroin&self.coop.remotes"),
            "member order must remain local then retained remote order")
    tick = body(coop, "tick_party")
    require(tick.index("self.clock+=delta;") < tick.index("self.refresh_party_feat_members();")
            < tick.index("self.tick_stage("), "membership capture is not between clock advance and hero simulation")
    context = body(coop, "cooperative_feat_context")
    for text in ("self.coop.replica_feats.clone()", "!self.has_party()||(self.coop.remotes.is_empty()&&self.coop.active_slot==0)",
                 "word_30:self.boss_state.party_feats.deaths",
                 "self.rules.density_percent>=500&&self.rules.hp_percent>=500",
                 "self.rules.damage_percent>=300&&self.rules.speed_percent>=150",
                 "events:self.boss_state.party_feats.events.clone()"):
        require(text in context, f"live native context producer missing: {text}")
    require("coop:self.cooperative_feat_context()" in body(coop, "native_state")
            and "self.coop.replica_feats.clone_from(&state.coop)" in body(coop, "apply_replica_native"),
            "party-feat context is not connected to native State15 publication/receipt")
    require("party_feat_context_survives_the_single_remote_swap_and_departure" in coop,
            "recipient projection must retain the temporarily borrowed remote row")
    hero_fields = coop[coop.index("hero_state!{"):coop.index("#[derive(Clone,Copy,Debug)]pubstructPartyInput")]
    require("party_feats" not in hero_fields, "shared party-feat state must not be hero-swapped")
    lethal = bosses.index("self.generic.boss_killing_blows.push(")
    capture = bosses.index("self.boss_state.party_feats.events.push(", lethal)
    dead = bosses.index("row.actor.dead=true;", lethal)
    require(lethal < capture < dead, "shared lethal snapshot must precede death callbacks")
    require("members:self.boss_state.party_feats.members.clone()" in bosses[capture:dead],
            "lethal event must copy the cached tick membership")
    require("pub(super)party_feats:super::party_achievements::State" in bosses,
            "shared state must remain in BossState")
    death = incoming.index("self.execution.vitals.health=0.0;self.dead=true;")
    notice = incoming.index("self.events.push(RunEvent::PlayerDied);", death)
    require("ifself.has_party()&&!self.abandoned{self.boss_state.party_feats.deaths=self.boss_state.party_feats.deaths.wrapping_add(1);}" in incoming[death:notice],
            "actual cooperative irreversible death must update the shared wrapping count without counting solo deaths or abandonment")

    retained, unavailable = 0, []
    for name, query in manifest["queries"].items():
        paths = [local(query[key]) for key in ("plan", "result", "journal")]
        if not all(path.is_file() for path in paths):
            unavailable.append(name)
            continue
        plan, result, journal = paths
        require(digest(plan.read_bytes()) == query["plan_sha256"], f"retained query plan drift: {name}")
        require(digest(result.read_bytes()) == query["result_sha256"], f"retained query result drift: {name}")
        record = json.loads(result.read_text())["structuredContent"]
        require(record["evidence_id"] == query["evidence_id"]
                and record["subject"]["digest"]["sha256"] == query["raw_subject_sha256"],
                f"retained query subject/evidence mismatch: {name}")
        durable = record["analysis_profile"]["parameters"]["durable_queries"]
        require(durable["static_queries_only"]
                and durable["checkpoint_authority"] == "saved-Program-options",
                f"retained query lacks guarded durable profile: {name}")
        receipt = json.loads(journal.read_text())
        require(receipt["status"] == "completed" and all(item["status"] == "completed" for item in receipt["operations"].values()),
                f"retained query is incomplete: {name}")
        retained += 1
    require(not args.require_retained_queries or not unavailable,
            f"required retained queries unavailable: {', '.join(unavailable)}")
    print(f"PASS: {len(manifest['native_ranges'])} current native ranges/{instruction_bytes} bytes/{instructions} instructions, "
          f"{len(manifest['constants'])} exact constants, shared producer source connections, {retained} retained Ghidra queries")
    if unavailable:
        print(f"NOT RUN: retained query receipts unavailable: {', '.join(unavailable)}")
    print("NOT RUN: Rust compilation/tests, client/game/network/server execution, real save delivery and original/rebuilt parity")


if __name__ == "__main__":
    main()

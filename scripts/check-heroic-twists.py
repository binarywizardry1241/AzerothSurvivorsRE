#!/usr/bin/env python3
"""Check recovered Heroic consumers with original instructions in synthetic memory.

No compiler, client, game, socket or server is started. --write publishes the
compact target-bound evidence and canonical assembly used by this check.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import math
import re
import shutil
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
               str(ROOT / "runtime/armory-recovery/python-libs")]

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
KEPT = ROOT / "docs/analysis/evidence/0.121.0/heroic-twists"
RANGES = {
    "healing": (0x145bd10e0, 0x145bd138f),
    "guardian-stats": (0x145c4e9e0, 0x145c4f08f),
    "batch-healing": (0x145bcb438, 0x145bcb794),
    "last-hit-clock": (0x145bcdde8, 0x145bcddf6),
    "last-hit-damage": (0x145bce5cc, 0x145bce5f5),
    "leech": (0x145bfee64, 0x145bfeeb4),
    "totem-healing": (0x145bffd11, 0x145bffd5c),
    "secondary-healing": (0x145c000fb, 0x145c00147),
    "restoration": (0x145c2f36d, 0x145c2f3c1),
    "voidwalker-healing": (0x145c3a0ef, 0x145c3a147),
    "party-healing": (0x145c2142b, 0x145c21489),
    "revive-health": (0x145bc4f2d, 0x145bc4f59),
    "revive-time": (0x145bbc30d, 0x145bbc345),
    "revive-progress": (0x145bb880a, 0x145bb8835),
    "guardian-respawn": (0x145c17cce, 0x145c17d3c),
    "boss-rank": (0x145c1d012, 0x145c1d029),
    "boss-cooldowns": (0x145c1d57a, 0x145c1d5a8),
    "boss-repeat": (0x145c20017, 0x145c2003f),
    "phase-admission": (0x145c1f38f, 0x145c1f3cc),
    "queued-admission": (0x145c21a12, 0x145c21a34),
    "warning": (0x145bf1f80, 0x145bf21ac),
    "cache-cost": (0x145c2f060, 0x145c2f0ad),
    "hazard-factor-default": (0x145be9d85, 0x145be9d95),
    "hazard-damage": (0x145bed763, 0x145bed7e7),
    "lean-rank": (0x145bdcbd9, 0x145bdcbed),
    "cache-initial": (0x145bdcc95, 0x145bdccab),
    "cache-commit": (0x145bdd6d6, 0x145bdd6e2),
    "reroll-initial": (0x145bdcf30, 0x145bdcf59),
    "reroll-commit": (0x145bdd348, 0x145bdd34e),
    "elite-pair": (0x145c2a016, 0x145c2a112),
    "council": (0x145c2bad7, 0x145c2bb77),
    "council-health-input": (0x145c27635, 0x145c2763e),
    "council-health-scale": (0x145c27a0a, 0x145c27a2b),
}
DATA = {
    "healing-factor": (0x14768f420, 8),
    "revive-health-share": (0x14768f400, 8),
    "revive-seconds": (0x14730e500, 8),
    "guardian-health-per-kill": (0x14768f850, 8),
    "guardian-damage-per-kill": (0x14768f860, 8),
    "guardian-respawn-seconds": (0x14768f700, 8),
    "boss-repeat-factors": (0x14768f730, 16),
    "warning-factor": (0x14768f580, 8),
    "cache-cost-increment": (0x14768f7e0, 8),
    "hazard-factor": (0x14768f560, 8),
    "elite-pair-offset": (0x14768f780, 16),
    "council-health-factor": (0x1461988cc, 4),
    "voidwalker-heal": (0x14768f808, 8),
}
SOURCE_ROOT = "crates/azeroth-survivors-re/src/"
SOURCE = {
    "bosses/abilities.rs": ["fn heroic_rank(&self)", "heroic_rank > 3 || !matches!(native_tag, 12 | 26)", "queued_action_enabled_for_rank"],
    "bosses/ai.rs": ["boss_repeat_factor(heroic_rank", "tick_with_minion_phases_for_rank"],
    "bosses/raid_area_catalog.rs": ["advance_with_phases_for_rank", "boss_repeat_factor(heroic_rank"],
    "bosses/raid_areas.rs": ["warning_factor(port.heroic_rank())", "warning_factor(heroic_rank)"],
    "bosses/raid_shapes.rs": ["warning_factor(port.heroic_rank())"],
    "bosses/spawning.rs": ["tick_for_rank", "heroic_rank >= 5 && zone.bosses[index].flag_54 & 1 != 0", "port.spawn_boss_with_health_factor(friend, &zone.bosses[friend], rng, 0.6)", "uniform_index(4, rng)"],
    "coop/game_party.rs": ["pub heroic_rank: u8", "revive_seconds(self.heroic_rank)", "revive_health(self.heroic_rank)"],
    "enemies/waves.rs": ["tick_elite_for_rank", "if heroic_rank != 0", "port.enemy_position(guid, input.clock_seconds)", "Position { x: position.x + 2.5, y: position.y + 1.0, ..position }"],
    "gameplay/mechanics.rs": ["regeneration_amount(", "apply_batch_for_rank(", "tick_elite_for_rank(", "fn enemy_position(&self", "ChestState::for_rank(rules.heroic_rank)", "fn heal_level_up(&mut self)", "PendingHealing::leech(result.amount * self.leech)", "PendingHealing::on_kill(self.stats.heal_on_kill)", "meter_source: Some(azeroth_survivors_re::run_effects::healing::HEALING_ON_KILL)", "let requested = self.requested * azeroth_survivors_re::heroic::healing_factor(heroic_rank)"],
    "gameplay/mechanics/bosses.rs": ["tick_with_minion_phases_for_rank(", "initial_raid_action_enabled_for_rank(phase.native_tag", "queued_action_enabled_for_rank(&ability", "raid_damage_factor(self.rules.heroic_rank", "spawn_boss_with_health_factor", ".tick_for_rank("],
    "gameplay/mechanics/chests.rs": ["native::ChestSystem::for_rank(heroic_rank)"],
    "gameplay/mechanics/coop.rs": ["snapshot.heroic_rank = self.rules.heroic_rank", "revive_seconds(self.rules.heroic_rank)"],
    "gameplay/mechanics/demon_spells.rs": ["voidwalker_kill_heal_for_rank("],
    "gameplay/mechanics/effects.rs": ["calm_regen: 0.0"],
    "gameplay/mechanics/guardians.rs": ["heroic_rank: rules.heroic_rank", "guardian.raid.advance_for_rank(", "system.guardian_died_for_rank("],
    "gameplay/mechanics/passives.rs": ["fn heroic_rank(&self)"],
    "gameplay/mechanics/pickups.rs": ["heroic::healing_factor(self.rules.heroic_rank)"],
    "gameplay/mechanics/progression.rs": ["heroic::free_rerolls_base(self.rules.heroic_rank)"],
    "gameplay/mechanics/shared_healing.rs": ["heroic::healing_factor("],
    "guardians/mod.rs": ["record_death_for_rank", "guardian_died_for_rank", "guardian_respawn_seconds(heroic_rank)"],
    "guardians/scaling.rs": ["guardian_health_per_kill(input.heroic_rank)", "guardian_damage_per_kill(input.heroic_rank)", "health_multiplier(input.heroic_rank)", "damage_multiplier(input.heroic_rank)"],
    "guardians/signatures.rs": ["advance_for_rank", "initial_raid_action_enabled_for_rank("],
    "player_abilities/behavior/totem_passives.rs": ["fn heroic_rank(&self)", "prepulse_heal_for_rank", "healing_factor(heroic_rank)"],
    "player_abilities/behavior/totems.rs": ["prepulse_heal_for_rank("],
    "player_abilities/behavior/incoming.rs": ["state.last_hit_at = now;"],
    "run_effects.rs": ["pub calm_regen: f32", "13 => self.calm_regen += value"],
    "run_effects/demon_effects.rs": ["voidwalker_kill_heal_for_rank", "healing_factor(heroic_rank)"],
    "run_effects/healing.rs": ["pub const HEALING_ON_KILL: MeterSource = MeterSource { name: \"Healing on Kill\", icon: \"Spell_Shadow_DeathPact\", talent: false, };", "pub fn regeneration_amount", "let calm = if now - last_hit_at >= 3.0 { calm_fraction * maximum_health } else { 0.0 }; (calm + flat) * elapsed", "pub fn apply_batch_for_rank", "let multiplier = crate::heroic::healing_factor(heroic_rank); let regeneration = regeneration * multiplier; let total = queued.iter().fold(0.0, |sum, (_, amount)| sum + amount) * multiplier;", "let credited = (amount * effective) / total;"],
    "treasure_chests/mod.rs": ["cache_initial_price(heroic_rank)", "cache_cost_increment(self.heroic_rank)"],
}
for _file in ("raid_actions", "raid_bombs", "raid_extra", "raid_lines", "raid_pools", "raid_sequence_areas", "raid_towers"):
    SOURCE["bosses/" + _file + ".rs"] = ["Area::danger(", "port.heroic_rank()"]


def warning_correspondence(raw):
    """Follow retained dispatcher blocks without depending on its omitted switch pseudo."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    table, nested = 0x147692f84, 0x147693004
    entries = [table + struct.unpack("<i", raw(table + index * 4, 4))[0] for index in range(32)]
    nested_entries = [nested + struct.unpack("<i", raw(nested + index * 4, 4))[0] for index in range(4)]
    cases = []
    for tag, entry in enumerate(entries, 3):
        pending, seen, calls, factors = [entry], {}, set(), set()
        while pending:
            address = pending.pop()
            if address in seen or not 0x145bf29c0 <= address < 0x145bf825a:
                continue
            ins = next(decoder.disasm(raw(address, 15), address))
            seen[address] = ins.bytes.hex()
            if ins.mnemonic == "ret":
                continue
            if ins.mnemonic == "call" and ins.op_str == "0x145bf1f80":
                calls.add(address)
            if "rip + " in ins.op_str:
                displacement = int(ins.op_str.split("rip + ")[1].split("]")[0], 16)
                if address + ins.size + displacement == 0x14768f580:
                    factors.add(address)
            if ins.mnemonic.startswith("j"):
                if ins.op_str.startswith("0x"):
                    pending.append(int(ins.op_str, 16))
                else:
                    assert address == 0x145bf72c3 and ins.op_str == "rax"
                    pending.extend(nested_entries)
                if ins.mnemonic == "jmp":
                    continue
            pending.append(address + ins.size)
        cases.append(dict(native_tag=tag, entry=hex(entry),
                          common_constructor_calls=[hex(at) for at in sorted(calls)],
                          inline_factor_table_references=[hex(at) for at in sorted(factors)],
                          reachable_instruction_count=len(seen),
                          reachable_bytes_sha256=sha(json.dumps(sorted(seen.items()), separators=(",", ":")).encode())))
    assert len({at for row in cases for at in row["common_constructor_calls"]}) == 13
    return dict(table=dict(virtual_address=hex(table), byte_count=128, sha256=sha(raw(table, 128))),
                nested_table=dict(virtual_address=hex(nested), byte_count=16, sha256=sha(raw(nested, 16))),
                cases=cases,
                limits="Original dispatcher conditional CFG and the two explicit current jump tables only. Calls are not recursively expanded; constructor semantics have their separate full native proof. No reconstructed source executes.")


def healing_correspondence(image, pe, raw):
    expected = {
        0x145bcb46d: "batch-regeneration-and-HoTs",
        0x145bd111e: "general-healing",
        0x145be411b: "level-up-through-PendingHealing",
        0x145bfee70: "leech-through-PendingHealing",
        0x145bffd1d: "totem-prepulse",
        0x145c00107: "secondary-through-PendingHealing",
        0x145c0dfad: "actor-hit-leech-through-PendingHealing",
        0x145c0ea2a: "actor-hit-secondary-through-PendingHealing",
        0x145c16bb5: "actor-death-leech-through-PendingHealing",
        0x145c17b88: "healing-on-kill-through-PendingHealing",
        0x145c21442: "party-immediate-healing",
        0x145c2f379: "Restoration",
    }
    sites = []
    for section in pe.sections:
        flags = section["characteristics"]
        if not (int(flags, 0) if isinstance(flags, str) else flags) & 0x20000000:
            continue
        data = image[section["raw_offset"]:section["raw_offset"] + section["raw_size"]]
        for match in re.finditer(b"[\x48\x4c]\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]....", data, re.S):
            address = pe.image_base + section["rva"] + match.start()
            if address + 7 + struct.unpack("<i", match.group()[3:7])[0] == 0x14768f420:
                sites.append(address)
    assert sorted(sites) == sorted(expected), list(map(hex, sites))
    owners = [(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()]
    assert raw(0x1476917ae, 15) == b"Healing on Kill"
    assert raw(0x1476917bd, 22) == b"Spell_Shadow_DeathPact"
    return dict(table=hex(0x14768f420), sites=[dict(site=hex(site), role=expected[site],
                owner=[hex(start), hex(end)], following_96_bytes_sha256=sha(raw(site, 96)))
                for site in sorted(sites) for start, end in owners if start <= site < end],
                healing_on_kill=dict(virtual_address=hex(0x145c17af9), end_exclusive=hex(0x145c17be5),
                                    sha256=sha(raw(0x145c17af9, 0xec)),
                                    name=dict(virtual_address=hex(0x1476917ae), text="Healing on Kill"),
                                    icon=dict(virtual_address=hex(0x1476917bd), text="Spell_Shadow_DeathPact"),
                                    talent=False),
                limits="Complete exact RIP-relative LEA references to this shared table in executable sections; not a claim about every possible indirect reference. Voidwalker's distinct2.5/1.25 table has its separate native range. Rebuilt source is not executed.")


def council_catalog_correspondence(raw):
    path = ROOT / SOURCE_ROOT / "guardians/catalog.rs"
    blocks = re.findall(r"static (\w+)_BOSSES:.*?= &\[(.*?)\n\];", path.read_text(), re.S)
    assert len(blocks) == 12
    zones = []
    for index, (key, body) in enumerate(blocks):
        ids = list(map(int, re.findall(r"\bid: (\d+),", body)))
        flags = list(map(int, re.findall(r"\bflag_54: (\d+),", body)))
        pointer, count = struct.unpack("<QQ", raw(0x146fbe250 + index * 240 + 0x88, 16))
        assert count == 5
        actual = [(struct.unpack("<I", raw(pointer + row * 104 + 0x40, 4))[0],
                   raw(pointer + row * 104 + 0x64, 1)[0]) for row in range(count)]
        assert list(zip(ids, flags)) == actual, key
        zones.append(dict(zone=index, source_array=key + "_BOSSES", native_table=hex(pointer),
                          ids_and_final_flags=[list(row) for row in actual]))
    return dict(source=str(path.relative_to(ROOT)), zones=zones, compared_rows=60,
                limits="Checks the existing five-entry order, identity and final-bit inputs used by the new Council consumer; other boss fields retain their separate provenance.")


def source_evidence(native_path, image, pe, raw, rustfmt=None):
    files = []
    for relative, fragments in sorted(SOURCE.items()):
        path = ROOT / (SOURCE_ROOT + relative)
        payload = path.read_bytes()
        compact = "".join(payload.decode().split())
        for fragment in fragments:
            assert "".join(fragment.split()) in compact, (relative, fragment)
        files.append(dict(path=str(path.relative_to(ROOT)), observed_source_sha256=sha(payload),
                          owned_fragments=[dict(text=fragment,
                                                normalized_sha256=sha("".join(fragment.split()).encode()))
                                           for fragment in fragments]))
    if rustfmt is None:
        rustfmt = shutil.which("rustfmt")
        if rustfmt is None:
            candidates = sorted((ROOT / ".tools/rust").glob("*/bin/rustfmt"))
            rustfmt = str(candidates[-1]) if candidates else None
    assert rustfmt, "An installed Rust formatter is required for non-compiling syntax parsing."
    for row in files:
        result = subprocess.run([rustfmt, "--edition", "2021", "--config", "skip_children=true",
                                 "--emit", "stdout", str(ROOT / row["path"])],
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
        assert result.returncode == 0, (row["path"], result.stderr.decode())
    return dict(schema_version=1, target_sha256=SHA,
                native_manifest=dict(path=str(native_path.relative_to(ROOT)), sha256=sha(native_path.read_bytes())),
                source_files=files, syntax_parsed_files=len(files), compiled=False, source_executed=False,
                warning_dispatch_correspondence=warning_correspondence(raw),
                healing_table_correspondence=healing_correspondence(image, pe, raw),
                council_catalog_correspondence=council_catalog_correspondence(raw),
                limits="Owned fragments and formatter syntax parsing establish the reviewed wiring only. Whole-file hashes are observations, excluded from enforcement because files have independent source owners. Original-instruction CPU cases remain separate; no compilation, game/server execution or parity comparison occurs.")


def enforced_source(value):
    if isinstance(value, list):
        return [enforced_source(row) for row in value]
    if isinstance(value, dict):
        return {key: enforced_source(row) for key, row in value.items() if key != "observed_source_sha256"}
    return value


def sha(data):
    return hashlib.sha256(data).hexdigest()


def f(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def load_image():
    target = latest_target(verify=True)
    assert target["version"] == "0.121.0" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("heroic_twists_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + count]

    return target, image, pe, raw


def assemble_evidence(target, image, pe, raw, write):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    rows = []
    for role, (start, end) in RANGES.items():
        payload = raw(start, end - start)
        instructions = list(decoder.disasm(payload, start))
        assert sum(row.size for row in instructions) == len(payload), role
        text = "".join(f"{row.address:016x} {row.bytes.hex():<30} {row.mnemonic} {row.op_str}".rstrip() + "\n"
                       for row in instructions)
        path = KEPT / (role + ".asm")
        if write:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
        else:
            assert path.read_text() == text, role
        rows.append(dict(role=role, virtual_address=hex(start), end_exclusive=hex(end),
                         file_offset=hex(pe.rva_offset(start - pe.image_base)),
                         byte_count=len(payload), sha256=sha(payload),
                         instruction_count=len(instructions),
                         assembly=dict(path=str(path.relative_to(ROOT)), sha256=sha(text.encode()))))
    data = []
    for role, (address, count) in DATA.items():
        payload = raw(address, count)
        data.append(dict(role=role, virtual_address=hex(address), byte_count=count,
                         sha256=sha(payload), values_bits=list(struct.unpack("<" + "I" * (count // 4), payload))))
    queries = []
    query_inputs = [(family, ROOT / "runtime/fixgap219/twists" / family / "query", None)
                    for family in ("healing", "guardian-stats", "warning", "gold")]
    query_inputs += [
        ("configuration", ROOT / "runtime/fixgap219/constructor/query", None),
        ("shared-spawning", ROOT / "runtime/fixgap220229/affixes/query-fixed",
         ROOT / "runtime/fixgap220229/affixes/plan-fixed.json"),
        ("shared-dispatch", ROOT / "runtime/fixgap225-0.121.0/query", None),
    ]
    for family, output, chosen_plan in query_inputs:
        for path in sorted((output / "results").glob("*.json")):
            response = json.loads(path.read_text())
            evidence = response.get("structuredContent") or json.loads(response["content"][0]["text"])
            assert evidence.get("operation") in ("procedure_pseudo_code", "read_function_instructions")
            plan_path = chosen_plan or output.parent / "plan.json"
            plan = json.loads(plan_path.read_text())
            raw_path = project_path(plan["target"])
            query = dict(family=family, evidence_id=evidence["evidence_id"],
                                procedure=evidence["parameters"]["procedure"],
                                provider=evidence["provider"],
                                analysis_profile_digest=evidence["analysis_profile"]["digest"],
                                slice_virtual_address=plan["open_options"]["entry_point"],
                                raw_input=dict(path=str(raw_path.relative_to(ROOT)),
                                               sha256=sha(raw_path.read_bytes())),
                                normalized_text_sha256=sha((evidence["normalized_result"] if isinstance(evidence["normalized_result"], str)
                                                            else json.dumps(evidence["normalized_result"], sort_keys=True, separators=(",", ":"))).encode()),
                                result=dict(path=str(path.relative_to(ROOT)), sha256=sha(path.read_bytes())),
                                plan=dict(path=str(plan_path.relative_to(ROOT)), sha256=sha(plan_path.read_bytes())),
                                journal=dict(path=str((output / "journal.json").relative_to(ROOT)),
                                             sha256=sha((output / "journal.json").read_bytes())))
            verify_native_query_subject(ROOT, evidence, query, target, image=image, pe=pe)
            queries.append(query)
    return dict(schema_version=1,
                target={k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
                gap_ids=[219], native_ranges=rows, native_data=data, queries=queries,
                target_executed=False,
                limits="Original-instruction synthetic CPU fixtures only. Allocation, zone lookup, health-knot collection, powf and publication are declared seams. No reconstructed code, compiler, game, socket or server executes; runtime and parity remain unverified.")


def machine(raw):
    module = load_script("heroic_twist_cpu", ROOT / "scripts/check-raid-guardian-lifecycle.py")
    module.RANGES = RANGES
    return module.Machine(raw), module.r


def healing_cases(cpu, r):
    rows = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for health in (0., 50., 90., 100., 120.):
            for requested in (-2., 0., 1., 20., 200.):
                for spell in (0, 1):
                    cpu.reset()
                    game = cpu.game
                    effects = cpu.heap
                    cpu.put(game + 0x36f, "B", rank)
                    cpu.put(game + 0x538, "f", health)
                    cpu.put(game + 0x4c8, "f", 100.)
                    cpu.put(game + 0x8c8, "QQ", effects, 2)
                    cpu.put(effects, "B", 20)
                    cpu.put(effects + 4, "f", .5)
                    cpu.put(effects + 64, "B", 21)
                    cpu.u.reg_write(r.UC_X86_REG_RCX, game)
                    cpu.u.reg_write(r.UC_X86_REG_R8, spell)
                    cpu.sx(r.UC_X86_REG_XMM1, requested)
                    cpu.seams[0x145bd0fc0] = lambda: None
                    cpu.run(0x145bd10e0, [0x145bd125f, 0x145bd12f0])
                    amount = f(requested * (.5 if rank >= 5 else 1.))
                    hp = min(f(health + amount), 100.)
                    actual = f(hp - health)
                    excess = max(f(amount - actual), 0.)
                    absorb = min(excess, 50.) if spell and excess > 0 else 0.
                    pool = f(max(actual, 0.) + excess) if spell else 0.
                    got = [cpu.get(game + off, "I")[0] for off in (0x538, 0x53c, 0x1a0)]
                    want = list(map(bits, (hp, absorb, pool)))
                    assert got == want, (rank, health, requested, spell, got, want)
                    rows.append([rank, bits(health), bits(requested), spell, *got])
    return dict(cases=len(rows), sha256=sha(json.dumps(rows, separators=(",", ":")).encode()))


def scalar_cases(cpu, r):
    rows = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for requested in (0., .1, 1., 123.25):
            cpu.reset()
            cpu.u.reg_write(r.UC_X86_REG_R15, rank)
            cpu.sx(r.UC_X86_REG_XMM11, requested)
            cpu.sx(r.UC_X86_REG_XMM9, 42.)
            cpu.run(0x145bf20a1, [0x145bf20bb])
            got = cpu.u.reg_read(r.UC_X86_REG_XMM11) & 0xffffffff
            want = bits(f(f(requested * f(.85 if rank else 1.)) + 42.))
            assert got == want, (rank, requested, got, want)
            rows.append([rank, bits(requested), got])
        cpu.reset()
        cpu.put(cpu.game + 0x36f, "B", rank)
        cpu.u.reg_write(r.UC_X86_REG_RSI, cpu.game)
        cpu.u.reg_write(r.UC_X86_REG_R14, 0)
        cpu.u.reg_write(r.UC_X86_REG_R12, cpu.game)
        cpu.run(0x145c1d012, [0x145c1d029])
        cpu.run(0x145c1d57a, [0x145c1d5a8])
        assert cpu.get(cpu.frame + 0x9c, "I")[0] == bits(.8 if rank >= 2 else 1.)
        assert cpu.get(cpu.frame + 0x94, "I")[0] == bits(.6 if rank >= 2 else .7)
    return dict(warning_cases=len(rows), rank_cooldown_cases=8,
                sha256=sha(json.dumps(rows, separators=(",", ":")).encode()))


def guardian_cases(cpu, r, raw):
    results = []
    knots = [(5., 10000.), (10., 30000.)]
    for zone in (0, 2, 11):
        record = 0x146fbe250 + zone * 240
        pointer, count = struct.unpack("<QQ", raw(record + 0x78, 16))
        index = next(i for i in range(count) if raw(pointer + 80 * i + 0x4c, 1) == b"\x01")
        hp_base, damage_base = struct.unpack("<ff", raw(pointer + 80 * index + 0x30, 8))
        zone_scale = struct.unpack("<f", raw(record + 0xe0, 4))[0]
        for rank in (0, 1, 2, 3, 4, 5, 6, 255):
            health_rank, damage_rank = ((1., 1.) if rank not in range(1, 6) else
                                       struct.unpack("<ff", raw(0x146fca2d0 + rank * 48, 8)))
            for clock, difficulty, kills, phase, endless, start, power in (
                    (0., 1., 0, 1, False, 0., 1.),
                    (30., 1., 1, 1, False, 0., 1.),
                    (337.5, 1.5, 2, 1, False, 0., 1.),
                    (1800., 2.25, 21, 1, False, 0., 1.),
                    (720., .75, 0xffffffff, 1, False, 0., 1.),
                    (780., 1., 3, 1, True, 720., 1.375),
                    (780., 1., 3, 0, True, 720., 1.)):
                cpu.reset()
                game = cpu.game
                cpu.put(game + 0x36f, "B", rank)
                cpu.put(game + 0xc74, "f", clock)
                cpu.put(game + 0xcf8, "f", difficulty)
                cpu.put(game + 0x804, "I", kills)
                cpu.put(game + 0xb90, "If", phase, start)
                cpu.put(game + 0xd1c, "B", endless)
                cpu.put(game + 0x2d0, "QQ", 1, 1)
                calls = []

                def zone_lookup():
                    cpu.u.reg_write(r.UC_X86_REG_RAX, zone)

                def collect_knots():
                    output = cpu.u.reg_read(r.UC_X86_REG_RCX)
                    cpu.put(cpu.heap, "4f", *[value for knot in knots for value in knot])
                    cpu.put(output, "QQQ", 0, cpu.heap, len(knots))

                def powf():
                    calls.append([cpu.u.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff,
                                  cpu.u.reg_read(r.UC_X86_REG_XMM1) & 0xffffffff])
                    cpu.sx(r.UC_X86_REG_XMM0, power)

                cpu.seams[0x145a9c190] = zone_lookup
                cpu.seams[0x145c75580] = collect_knots
                cpu.seams[0x145febcdb] = powf
                outputs = []
                for entry in (0x145c4e9e0, 0x145c4eed0):
                    cpu.put(cpu.stack, "Q", cpu.stop)
                    cpu.u.reg_write(r.UC_X86_REG_RSP, cpu.stack)
                    cpu.u.reg_write(r.UC_X86_REG_RCX, game)
                    cpu.u.reg_write(r.UC_X86_REG_RDX, index)
                    cpu.run(entry)
                    outputs.append(cpu.u.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff)
                minutes = f(clock / 60)
                zd = f(zone_scale * difficulty)
                if minutes <= 5.:
                    curve = f(f(f(f(f(.4) * minutes) / 5.) + f(.6)) * 10000.)
                else:
                    curve = f(f(f(f(minutes - 5.) * 20000.) / 5.) + 10000.)
                selected_curve = f(f(curve * f(.6)) * zd)
                linear = f(f(f(.12) * minutes) + 1.)
                quadratic = f(f(f(.009) * minutes) * minutes)
                polynomial = f(f(f(f(quadratic + linear) * zd) * hp_base) * f(2.5))
                factor = power if phase == 1 and endless else 1.
                selected = f(f(max(selected_curve, polynomial) * 3.) * factor)
                health = f(f(f(f(kills) * f(.35 if rank >= 2 else .25)) + 1.) * selected)
                health = f(health * health_rank)
                linear = f(f(f(.08) * minutes) + 1.)
                quadratic = f(f(f(.004) * minutes) * minutes)
                time_difficulty = f(f(math.sqrt(zd)) * f(quadratic + linear))
                damage = f(f(f(damage_base * time_difficulty) * f(1.4)) * factor)
                damage = f(f(f(f(kills) * f(.07 if rank >= 2 else .05)) + 1.) * damage)
                damage = f(damage * damage_rank)
                assert outputs == list(map(bits, (health, damage))), (zone, rank, clock, outputs,
                                                                      list(map(bits, (health, damage))))
                exponent = f(max(f(f(clock - start) / 60.), 0.))
                assert calls == ([[bits(1.22), bits(exponent)], [bits(1.096), bits(exponent)]]
                                 if phase == 1 and endless else [])
                results.append([zone, rank, bits(clock), kills, *outputs])
    return dict(pairs=len(results), sha256=sha(json.dumps(results, separators=(",", ":")).encode()),
                seams="Selected zone index, two supplied health knots and explicit powf result; party mode is disabled.")


def lifecycle_cases(cpu, r):
    counts = dict(revive_health=0, revive_time=0, guardian_respawn=0,
                  phase_admission=0, queued_admission=0, hazard_damage=0)
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        cpu.reset()
        cpu.put(cpu.game + 0x36f, "B", rank)
        cpu.put(cpu.game + 0x4c8, "f", 123.25)
        cpu.u.reg_write(r.UC_X86_REG_RSI, cpu.game)
        cpu.run(0x145bc4f2d, [0x145bc4f59])
        assert cpu.get(cpu.game + 0x538, "I")[0] == bits(f(123.25 * f(.3 if rank >= 5 else .5)))
        counts["revive_health"] += 1
        for elapsed in (0., 3., 6., 8.999, 9.):
            cpu.reset()
            cpu.put(cpu.game + 0x36f, "B", rank)
            cpu.u.reg_write(r.UC_X86_REG_RSI, cpu.game)
            cpu.sx(r.UC_X86_REG_XMM0, elapsed)
            cpu.run(0x145bbc30d, [0x145bbc325])
            assert cpu.xf(r.UC_X86_REG_XMM1) == (9. if rank >= 5 else 6.)
            cpu.u.reg_write(r.UC_X86_REG_RDI, cpu.game)
            cpu.sx(r.UC_X86_REG_XMM0, elapsed)
            cpu.run(0x145bb880a, [0x145bb8835])
            assert cpu.xf(r.UC_X86_REG_XMM0) == min(f(f(elapsed) / (9. if rank >= 5 else 6.)), 1.)
            counts["revive_time"] += 1
        for index in (0, 1, 0xffffffffffffffff):
            cpu.reset()
            cpu.put(cpu.game + 0x36f, "B", rank)
            cpu.put(cpu.game + 0xc74, "f", 17.5)
            cpu.put(cpu.game + 0x6c0, "QQ", cpu.lairs, 1)
            cpu.put(cpu.game + 0x804, "I", 0xffffffff)
            cpu.put(cpu.lairs, "Q", 777)
            cpu.put(cpu.lairs + 0x24, "f", 999.)
            cpu.put(cpu.frame + 0x120, "Q", 0)
            cpu.put(cpu.frame + 0xe0, "Q", index)
            cpu.u.reg_write(r.UC_X86_REG_R12, cpu.game)
            cpu.run(0x145c17cce, [0x145c17d3c])
            assert cpu.get(cpu.game + 0x804, "I")[0] == 0
            assert cpu.get(cpu.lairs, "Q")[0] == (0 if index == 0 else 777)
            assert cpu.get(cpu.lairs + 0x24, "f")[0] == ((167.5 if rank >= 2 else 197.5) if index == 0 else 999.)
            counts["guardian_respawn"] += 1
        for tag in range(33):
            cpu.reset()
            cpu.put(cpu.frame + 0x33f, "B", rank)
            cpu.put(cpu.game + 0x20, "Q", cpu.actor)
            cpu.put(cpu.actor + 0x3d, "B", tag)
            cpu.u.reg_write(r.UC_X86_REG_RDI, cpu.game)
            cpu.u.reg_write(r.UC_X86_REG_R15, 0)
            end = cpu.run(0x145c1f38f, [0x145c1f3cc, 0x145c1f8d3])
            admitted = rank > 3 or tag not in (12, 26)
            assert (end == 0x145c1f3cc) == admitted
            counts["phase_admission"] += 1
            cpu.reset()
            cpu.put(cpu.game + 0x36f, "B", rank)
            cpu.u.reg_write(r.UC_X86_REG_R12, cpu.game)
            cpu.u.reg_write(r.UC_X86_REG_R15, 29)
            cpu.u.reg_write(r.UC_X86_REG_RAX, tag)
            end = cpu.run(0x145c21a12, [0x145c219c0, 0x145c219cc])
            assert (end == 0x145c219c0) == admitted
            counts["queued_admission"] += 1
        for endless in (False, True):
            for total in (0., 1., 15.25):
                cpu.reset()
                cpu.put(cpu.game + 0x36f, "B", rank)
                cpu.put(cpu.game + 0xd1c, "B", endless)
                cpu.put(cpu.frame + 0x238, "Q", cpu.game)
                cpu.put(cpu.frame + 0x1a8, "f", total)
                cpu.run(0x145be9d85, [0x145be9d95])
                end = cpu.run(0x145bed763, [0x145bed7e7, 0x145bed85c])
                assert (end == 0x145bed85c) == (total == 0.)
                if total:
                    expected = 3. if rank >= 4 else 1. if endless else 2.
                    assert cpu.xf(r.UC_X86_REG_XMM1) == f(total * expected)
                counts["hazard_damage"] += 1
    return counts


def warning_construction(cpu, r):
    results = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for terrain in ("primary", "secondary", "fallback"):
            for grow in (False, True):
                for serial, clock, delay in ((0, 0., 0.), (0xffffffff, 42., 1.25),
                                             (0xfffffffe, 99., 5.), (7, 10., -.5)):
                    cpu.reset()
                    game, world, vector = cpu.game, cpu.world, cpu.heap + 0x2000
                    shape, descriptor = cpu.heap, cpu.heap + 0x100
                    length, cap = (2, 2) if grow else (1, 4)
                    cpu.put(game + 0x36f, "B", rank)
                    cpu.put(game + 0xc74, "fI", clock, serial)
                    cpu.put(game + 0x5e0, "QQQ", cap, vector, length)
                    cpu.put(game + 0xbb8, "Q", world)
                    cpu.put(world + 0x68, "q", 0 if terrain == "secondary" else -1)
                    cpu.put(world + 0xb8, "f", 3.)
                    cpu.put(shape, "3I", 123, 456, 789)
                    cpu.put(descriptor, "2Q", 0x12121212, 0x34343434)
                    cpu.put(cpu.stack + 0x28, "f", 7.)
                    cpu.put(cpu.stack + 0x30, "f", 4.5)
                    cpu.put(cpu.stack + 0x38, "f", delay)
                    cpu.put(cpu.stack + 0x40, "I", 1449)
                    cpu.put(cpu.stack + 0x48, "f", 123.25)
                    cpu.put(cpu.stack + 0x50, "Q", descriptor)
                    cpu.u.reg_write(r.UC_X86_REG_RCX, game)
                    cpu.u.reg_write(r.UC_X86_REG_RDX, 0x12345678)
                    cpu.u.reg_write(r.UC_X86_REG_R8, shape)
                    cpu.sx(r.UC_X86_REG_XMM3, 6.)
                    calls = []

                    def primary():
                        calls.append("primary")
                        cpu.u.reg_write(r.UC_X86_REG_RAX, int(terrain == "primary"))
                        cpu.sx(r.UC_X86_REG_XMM0, 11.)

                    def secondary():
                        calls.append("secondary")
                        output = cpu.u.reg_read(r.UC_X86_REG_RCX)
                        cpu.put(output, "I", 1)
                        cpu.put(output + 12, "f", 13.)

                    def growth():
                        calls.append("growth")
                        assert cpu.u.reg_read(r.UC_X86_REG_RCX) == game + 0x5e0
                        cpu.put(game + 0x5e0, "Q", 4)

                    cpu.seams[0x145b90b60] = primary
                    cpu.seams[0x145b963e0] = secondary
                    cpu.seams[0x145fec5f0] = growth
                    cpu.run(0x145bf1f80)
                    row = vector + 128 * length
                    expected_calls = ["primary"] + (["secondary"] if terrain == "secondary" else []) + (["growth"] if grow else [])
                    assert calls == expected_calls
                    assert cpu.u.reg_read(r.UC_X86_REG_RAX) == length
                    assert cpu.get(game + 0x5f0, "Q")[0] == length + 1
                    assert cpu.get(game + 0xc78, "I")[0] == (serial + 1) & 0xffffffff
                    assert cpu.get(row + 0x20, "Q")[0] == 0x12345678
                    assert cpu.get(row + 0x30, "3I") == (123, 456, 789)
                    assert cpu.get(row + 0x3c, "I")[0] == (serial + 1) & 0xffffffff
                    height = {"primary": 11., "secondary": 13., "fallback": 3.}[terrain]
                    assert cpu.get(row + 0x40, "3f") == (6., 7., height)
                    expected_end = f(f(f(delay) * f(.85 if rank else 1.)) + f(clock))
                    assert cpu.get(row + 0x4c, "3I") == tuple(map(bits, (4.5, clock, expected_end)))
                    assert cpu.get(row + 0x5c, "IfI") == (1449, 123.25, 0x7f800000)
                    assert bytes(cpu.u.mem_read(row + 0x68, 16)) == bytes(16)
                    results.append([rank, terrain, grow, serial, bits(clock), bits(delay),
                                    sha(bytes(cpu.u.mem_read(row, 128)))])
    return dict(cases=len(results), sha256=sha(json.dumps(results, separators=(",", ":")).encode()),
                seams="Primary/secondary terrain answers and successful vector growth only; every constructor instruction executes.")


def purse_cases(cpu, r):
    results = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        cpu.reset()
        cpu.put(cpu.frame + 0x1061, "B", rank)
        cpu.put(cpu.actor + 0x1bf, "B", rank)
        cpu.u.reg_write(r.UC_X86_REG_R15, cpu.actor)
        cpu.u.reg_write(r.UC_X86_REG_RSI, 0)
        cpu.u.reg_write(r.UC_X86_REG_RAX, rank)
        cpu.run(0x145bdcbd9, [0x145bdcbed])
        cpu.run(0x145bdcc95, [0x145bdccab])
        price = cpu.get(cpu.frame + 0x1058, "I")[0]
        assert price == (25 if rank >= 3 else 20)
        cpu.run(0x145bdd6d6, [0x145bdd6e2])
        assert cpu.get(cpu.frame + 0xce0, "I")[0] == price
        for perk in (0, 1, 99, 0xffffffff):
            cpu.u.reg_write(r.UC_X86_REG_R13, cpu.game)
            cpu.u.reg_write(r.UC_X86_REG_R15, cpu.actor)
            cpu.put(cpu.game + 0x108, "I", perk)
            cpu.run(0x145bdcf30, [0x145bdcf59])
            cpu.run(0x145bdd348, [0x145bdd34e])
            free = cpu.get(cpu.frame + 0x5a8, "I")[0]
            assert free == ((perk + (1 if rank >= 3 else 3)) & 0xffffffff)
            results.append([rank, perk, price, free])
        for paid in (0, 1, 20, 25, 12345, 0x7fffffff, 0xffffffff):
            cpu.put(cpu.game + 0x36f, "B", rank)
            cpu.u.reg_write(r.UC_X86_REG_RSI, cpu.game)
            cpu.u.reg_write(r.UC_X86_REG_R15, paid)
            cpu.run(0x145c2f060, [0x145c2f0ad])
            actual = cpu.get(cpu.game + 0xcd0, "I")[0]
            expected = min(int(f(f(f(paid) * f(1.3)) + f(6.25 if rank >= 3 else 5.))), 0xffffffff)
            assert actual == expected, (rank, paid, actual, expected)
            results.append([rank, paid, actual])
    return dict(cases=len(results), sha256=sha(json.dumps(results, separators=(",", ":")).encode()))


def elite_cases(cpu, r):
    results = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for success, match, clock, duration in ((0, True, 10., 4.), (1, False, 10., 4.),
                (1, True, 5., 4.), (1, True, 10., 4.), (1, True, 20., 4.), (1, True, 10., 0.)):
            cpu.reset()
            game, actor = cpu.game, cpu.actor
            cpu.put(game + 0x36f, "B", rank)
            cpu.put(game + 0x5b8, "QQ", actor, 2)
            cpu.put(game + 0xc74, "f", clock)
            cpu.put(actor + 0xf0, "Q", 17)
            actor += 0x1e0
            cpu.put(actor + 0xf0, "Q", 42 if match else 43)
            cpu.put(actor + 0x17c, "3f", 10., 20., 30.)
            cpu.put(actor + 0x188, "3f", 18., 32., 46.)
            cpu.put(actor + 0x194, "ff", 8., duration)
            cpu.u.reg_write(r.UC_X86_REG_RSI, game)
            cpu.u.reg_write(r.UC_X86_REG_RAX, success)
            cpu.u.reg_write(r.UC_X86_REG_RDX, 42)
            cpu.u.reg_write(r.UC_X86_REG_R14, 7)
            calls = []

            def spawn():
                assert cpu.u.reg_read(r.UC_X86_REG_RCX) == game
                assert cpu.u.reg_read(r.UC_X86_REG_RDX) == 7
                option = cpu.u.reg_read(r.UC_X86_REG_R8)
                assert cpu.get(option, "I")[0] == 1
                calls.append(cpu.get(option + 4, "3I"))

            cpu.seams[0x145c14ae0] = spawn
            cpu.run(0x145c2a016, [0x145c2a112])
            expected = []
            if rank and success == 1 and match:
                t = min(max(f(f(clock - 8.) / duration), 0.), 1.) if duration > 0. else 1.
                xyz = [f(f(f(t * f(b - a)) + a) + off) for a, b, off in
                       zip((10., 20., 30.), (18., 32., 46.), (2.5, 1., 0.))]
                expected.append(tuple(map(bits, xyz)))
            assert calls == expected, (rank, success, match, clock, duration, calls, expected)
            results.append([rank, success, match, bits(clock), bits(duration), calls])
    return dict(cases=len(results), sha256=sha(json.dumps(results, separators=(",", ":")).encode()),
                seam="Second enemy creator only; GUID search, position interpolation and offset run as original instructions.")


def council_cases(cpu, r):
    mask = (1 << 64) - 1
    def rol(value, shift):
        return ((value << shift) | (value >> (64 - shift))) & mask
    results = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for flag in (0, 1, 2, 3):
            for seed in ((1, 2, 3, 4), (mask, 0x1234, 0x5678, 0x9abc),
                         (0x234567890abcdef1, 0xfedcba0987654321, 0x8ace, 0x2468)):
                cpu.reset()
                game, definition, records = cpu.game, cpu.actor, cpu.lairs
                cpu.put(game + 0x36f, "B", rank)
                cpu.put(definition + 0x64, "B", flag)
                cpu.put(game + 0xbc0, "4Q", *seed)
                cpu.u.reg_write(r.UC_X86_REG_RSI, game)
                cpu.u.reg_write(r.UC_X86_REG_RBX, definition)
                cpu.u.reg_write(r.UC_X86_REG_RDI, records)
                calls = []
                def spawn():
                    calls.append([cpu.u.reg_read(r.UC_X86_REG_RDX), bits(cpu.xf(r.UC_X86_REG_XMM2))])
                cpu.seams[0x145c275f0] = spawn
                cpu.run(0x145c2bad7, [0x145c2bb77, 0x145c2bc48])
                expected_seed = list(seed)
                expected_calls = []
                draws = 0
                if rank >= 5 and flag & 1:
                    while True:
                        a, b, c, d = expected_seed
                        output = (rol((a + d) & mask, 23) + a) & mask
                        temporary = (b << 17) & mask
                        c ^= a; d ^= b; b ^= c; a ^= d; c ^= temporary; d = rol(d, 45)
                        expected_seed = [a, b, c, d]
                        draws += 1
                        if not output & (1 << 61):
                            expected_calls.append([records + (output >> 62) * 104, bits(.6)])
                            break
                assert calls == expected_calls
                assert list(cpu.get(game + 0xbc0, "4Q")) == expected_seed
                results.append([rank, flag, list(seed), draws, calls, expected_seed])
    # The constructor's factor parameter is held in XMM6 and multiplies only HP.
    for health in (1., 100., 12345.5):
        cpu.reset()
        cpu.sx(r.UC_X86_REG_XMM2, .6)
        cpu.run(0x145c27635, [0x145c2763e])
        assert bits(cpu.xf(r.UC_X86_REG_XMM6)) == bits(.6)
        cpu.sx(r.UC_X86_REG_XMM0, health)
        cpu.run(0x145c27a27, [0x145c27a2b])
        assert bits(cpu.xf(r.UC_X86_REG_XMM6)) == bits(f(f(.6) * health))
    return dict(cases=len(results), health_factor_cases=3,
                sha256=sha(json.dumps(results, separators=(",", ":")).encode()),
                seam="Boss creator only; full rank/final-bit gate and RNG rejection transitions execute.")


def batch_cases(cpu, r):
    results = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for hp in (0., 90., 100., 120.):
            for since in (-1., 0., 2.999, 3., 3.001, 10., math.nan):
                cpu.reset()
                game = cpu.game
                cpu.put(game + 0x36f, "B", rank)
                cpu.put(game + 0x538, "f", hp)
                cpu.put(game + 0x4c8, "f", 100.)
                cpu.put(game + 0x5a8, "f", 0.)
                cpu.put(game + 0x518, "f", .015)
                cpu.put(game + 0x4ec, "f", 2.)
                cpu.put(game + 0x8c8, "QQ", cpu.heap, 2)
                cpu.put(cpu.heap, "If", 20, .5)
                cpu.put(cpu.heap + 64, "B", 21)
                cpu.put(cpu.frame + 0x10, "QQQ", 2, cpu.heap + 0x1000, 2)
                cpu.put(cpu.heap + 0x1000, "IfIf", 11, 3., 12, 7.)
                cpu.u.reg_write(r.UC_X86_REG_RSI, game)
                cpu.sx(r.UC_X86_REG_XMM8, 100.)
                cpu.sx(r.UC_X86_REG_XMM10, since)
                cpu.sx(r.UC_X86_REG_XMM6, .1)
                cpu.sx(r.UC_X86_REG_XMM9, 10.)
                credits = []
                cpu.seams[0x145febc63] = lambda: cpu.sx(r.UC_X86_REG_XMM0, math.ceil(cpu.xf(r.UC_X86_REG_XMM0)))
                cpu.seams[0x145a9a130] = lambda: None
                cpu.seams[0x145aeaf60] = lambda: cpu.u.reg_write(r.UC_X86_REG_RAX, 0)
                cpu.seams[0x145c4f340] = lambda: None
                cpu.seams[0x145bd0fc0] = lambda: credits.append([cpu.u.reg_read(r.UC_X86_REG_R8), bits(cpu.xf(r.UC_X86_REG_XMM1))])
                cpu.run(0x145bcb438, [0x145bcb794])
                factor = .5 if rank >= 5 else 1.
                calm = f(f(.015) * 100.) if since >= 3. else 0.
                regen = f(f(f(calm + 2.) * f(.1)) * factor)
                total = f(10. * factor)
                health = min(f(f(hp + regen) + total), 100.) if hp < 100. else hp
                effective = min(total, max(0., f(f(health - hp) - regen)))
                excess = f(total - effective)
                expected_credits = [[spell, bits(f(f(amount * effective) / total))] for spell, amount in ((11, 3.), (12, 7.))]
                assert credits == expected_credits
                actual = list(cpu.get(game + 0x538, "2I")) + [cpu.get(game + 0x1a0, "I")[0]]
                assert actual == list(map(bits, (health, min(excess, 50.), total))), (rank, hp, since, actual)
                results.append([rank, bits(hp), bits(since), actual, credits])
    # Existing incoming-damage source supplies precisely this native clock lane.
    cpu.reset()
    cpu.put(cpu.game + 0xc74, "f", 123.25)
    cpu.put(cpu.game + 0x538, "f", 90.)
    cpu.u.reg_write(r.UC_X86_REG_R14, cpu.game)
    cpu.sx(r.UC_X86_REG_XMM8, 7.5)
    cpu.run(0x145bcdde8, [0x145bcddf6])
    cpu.run(0x145bce5cc, [0x145bce5f5])
    assert cpu.get(cpu.game + 0x5a8, "f")[0] == 123.25
    assert cpu.get(cpu.game + 0x538, "f")[0] == 82.5
    return dict(cases=len(results), timestamp_producer_cases=1,
                sha256=sha(json.dumps(results, separators=(",", ":")).encode()),
                seams="Field/meter publication, label lookup, ceil and vector disposal only; calm gate, HP/absorb/pool and per-spell credit instructions execute.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--write-source", action="store_true", help="Refresh source receipts without changing native evidence")
    parser.add_argument("--rustfmt", help="Existing formatter used for non-compiling syntax parsing")
    args = parser.parse_args()
    target, image, pe, raw = load_image()
    evidence = assemble_evidence(target, image, pe, raw, args.write)
    cpu, registers = machine(raw)
    evidence["static_validation"] = dict(healing=healing_cases(cpu, registers),
                                         scalars=scalar_cases(cpu, registers),
                                         guardians=guardian_cases(cpu, registers, raw),
                                         lifecycle=lifecycle_cases(cpu, registers),
                                         warning_constructor=warning_construction(cpu, registers),
                                         purse=purse_cases(cpu, registers),
                                         elite_pairs=elite_cases(cpu, registers),
                                         council=council_cases(cpu, registers),
                                         batch_healing=batch_cases(cpu, registers))
    path = KEPT / "manifest.json"
    if args.write:
        path.write_text(portable_json(evidence, indent=2) + "\n")
    else:
        assert portable_record(json.loads(path.read_text())) == portable_record(evidence)
    source = source_evidence(path, image, pe, raw, args.rustfmt)
    source_path = KEPT / "source-static.json"
    if args.write_source:
        source_path.write_text(portable_json(source, indent=2) + "\n")
    else:
        assert enforced_source(json.loads(source_path.read_text())) == enforced_source(source)
    print(json.dumps(evidence["static_validation"], sort_keys=True))
    print(json.dumps(dict(source_files=len(source["source_files"]), syntax_parsed_files=source["syntax_parsed_files"], compiled=False)))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Check the current equipment race provider and its two faction-ID branches.

Only verified native instructions run in scratch memory. Target item metadata,
game/UI/filesystem routines and reconstructed Rust code do not execute.
"""
import json
from pathlib import Path

from native_terminal import NativeReplay, require, verified_input

ROOT = Path(__file__).resolve().parents[1]
manifest, target, data, pe = verified_input(
    ROOT / "docs/analysis/evidence/terminal-presentation"
)
replay = NativeReplay(data, pe)
u, r = replay.machine, replay.registers
cases = []
for race in range(256):
    for item in (100_050, 100_060):
        replay.reset(
            "equipment-race-provider",
            [(0x1458AE3C0, 0x1458AE471), (0x1458AE530, 0x1458AE593)],
            {0x1458AE471},
        )
        game, queue = replay.app, replay.mem + 0x18000
        replay.put(replay.bp + 0x528, "<Q", game)
        replay.put(replay.bp + 0x520, "<Q", queue)
        replay.put(game + 0x315, "<B", race)
        replay.put(game + 0x10A0, "<Q", 1)
        replay.put(queue, "<I", item)
        u.reg_write(r.UC_X86_REG_RAX, 1)
        replay.run(0x1458AE3C0)
        require(u.reg_read(r.UC_X86_REG_R13) == race, "Race must come from Game+315")
        expected = item + (10 if item == 100_050 and race in (2, 5, 6, 8) else 0)
        actual = u.reg_read(r.UC_X86_REG_RDX)
        require(actual == expected, "Current faction metadata ID")
        cases.append(dict(race=race, item=item, metadata_id=actual))

for relative in (
    "gameplay/run_hud/loot.rs",
    "gameplay/terminal.rs",
):
    source = (ROOT / "crates/azeroth-survivors-re/src" / relative).read_text()
    compact = "".join(source.split())
    for token in (
        "piece.name(game.stats.native_race)",
        "piece.display_id(game.stats.native_race)",
    ):
        require(token in compact, f"Run race metadata connection: {relative}: {token}")
    require("menu.race" not in source, f"Frontend race still supplies loot: {relative}")

output = ROOT / "runtime/analysis/history/findings/fixgap-7-9/abb72146abfe/loot-race-check.json"
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(
    json.dumps(
        dict(
            target=target,
            native_cases=cases,
            instruction_count=replay.instructions,
            canonical_evidence="docs/analysis/evidence/0.109.0/terminal-presentation/equipment-delivery.asm",
            limits=[
                "Stops before metadata lookup; item catalog/display contracts have separate current Armory evidence.",
                "Two synthetic IDs cover faction remap and already-remapped branches, not the whole ID space.",
                "Source guards do not execute Rust; no compiler, game, UI or target filesystem routine runs.",
            ],
        ),
        indent=2,
    )
    + "\n"
)
print(f"PASS {len(cases)} native Game-race/faction-ID cases and HUD/terminal source guards")

#!/usr/bin/env python3
"""Verify the current timer evidence/live source route and isolated Lua; no build/game."""
import hashlib
import json
import re
import subprocess
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

EVIDENCE = ROOT / "docs/analysis/evidence/0.115.0/addon-timers"
GAMEPLAY = ROOT / "crates/azeroth-survivors-re/src/gameplay"


def main():
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / "integration.json").read_text())
    assert target["sha256"] == manifest["target_sha256"]
    data = target_bytes(target)
    pe = load_script("timer_bridge_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    for row in manifest["owners"]:
        start, end = int(row["start"], 16), int(row["end"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == row["sha256"]
        assert hashlib.sha256((EVIDENCE / row["pseudocode"]).read_bytes()).hexdigest() == row["pseudocode_sha256"]
    assembly = (EVIDENCE / manifest["assembly"]["path"]).read_bytes()
    assert hashlib.sha256(assembly).hexdigest() == manifest["assembly"]["sha256"]
    for line in assembly.decode().splitlines():
        if not line or line.startswith(";"):
            continue
        address, encoded, *_ = line.split()
        offset = pe.rva_offset(int(address, 16) - pe.image_base)
        value = bytes.fromhex(encoded)
        assert data[offset:offset + len(value)] == value
    for name in manifest["proofs"]:
        proof = json.loads((EVIDENCE / name).read_text())
        assert proof["target_sha256"] == target["sha256"]

    bootstrap = (GAMEPLAY / "client/addon_bootstrap.rs").read_text()
    include = re.search(r'const SOURCE: &str =\s*include_str!\("([^"]+)"\);', bootstrap)
    assert include
    api_path = (GAMEPLAY / "client" / include[1]).resolve()
    assert api_path == ROOT / "docs/analysis/evidence/0.115.0/embedded-api.lua"
    api = api_path.read_text()
    assert 'source.replace("HUD_CVARS_LUA", &parts)' in bootstrap
    assert 'mod addon_timers;' in (GAMEPLAY.parent / "run_effects.rs").read_text()
    mechanics = (GAMEPLAY / "mechanics.rs").read_text()
    assert 'mod addon_timers;' in mechanics
    inputs = re.findall(r'aura_cooldown\(\s*([^,]+),', mechanics)
    assert len(inputs) == 10  # nine live calls and the function definition
    assert all("numeric.recovery" in value or "raw: f32" in value for value in inputs)
    assert "1.0 / (recovery_with_auras(raw, auras, now, buff_bonus) + 1.0)" in mechanics
    assert "!(now >= aura.expires_at) && aura.effect.tag == 9" in mechanics
    for name in ["callbacks", "demon_spells", "demons"]:
        source = (GAMEPLAY / "mechanics" / (name + ".rs")).read_text()
        calls = re.findall(r'aura_cooldown\(\s*([^,]+),', source)
        assert len(calls) == 2 and all("numeric.recovery" in value for value in calls)
    effects = (GAMEPLAY / "mechanics/effects.rs").read_text()
    assert "|seed| seed.recovery" in effects and "f32::from_bits(0x3da3_d70a)" in effects
    assert "self.stats.native_race == 7" in effects
    projection = (GAMEPLAY / "mechanics/addon_timers.rs").read_text()
    for value in ["self.current_cooldown_multiplier()", "self.effect_state.generic.deadlines",
                  "self.effect_state.generic.counters", "self.effect_state.incoming.lethal_talent_ready_at",
                  "self.effect_state.meter_sources.get(timer.index)?", "generated_ability_key"]:
        assert value in projection
    wire = (GAMEPLAY / "client/addon_timers.rs").read_text()
    assert "super::addon_feed::field(name)" in wire and "if ready > 0.0 { ready } else { 0.0 }" in wire
    assert '"{},{},{},{:.1},{:.1}"' in wire
    assert "locale.amulet_name(row.name, row.generated_ability_key)" in wire
    names = (GAMEPLAY.parent / "localization/amulet_names.rs").read_text()
    assert '"ability.{key}.name"' in names and '"renew" => "Vampiric Renew"' in names
    assert '"rejuvenation" => "Vampiric Rejuvenation"' in names
    assert 'None | Some("demonic_empowerment")' in names
    localization = (GAMEPLAY.parent / "localization.rs").read_text()
    assert "mod amulet_names;" in localization and "amulet_names::localized(name, ability_key," in localization
    client = (GAMEPLAY / "client.rs").read_text()
    assert 'next(), M::new("AZSTIMERS", addon_timers::snapshot(game, &locale)),\n                next(), M::new("AZSPETS"' in client
    assert client.index('M::new("AZSBOSSDMG"') < client.index('M::new("AZSPARTY"') < client.index('M::new("AZSREVIVE"')
    assert client.count('M::new("AZSPARTY", coop.as_ref().map_or_else(String::new,') == 1
    assert 'state.party.meter_payload(game.clock)' in client
    party = (GAMEPLAY.parent / "coop/game_party.rs").read_text()
    assert 'if !self.active {' in party and 'return String::new();' in party
    feed = (GAMEPLAY / "client/addon_feed.rs").read_text()
    assert feed.index("self.cached.clear()") < feed.index("self.poll_due(now)", feed.index("pub fn due"))
    assert 'self.cached.get(message.prefix).map_or("", String::as_str) == message.payload' in feed
    assert "now - self.polled_at >= 0.2" in feed

    parts = (GAMEPLAY / "run_hud/settings.rs").read_text().split("const PARTS:", 1)[1].split("\n];", 1)[0]
    parts = re.findall(r'\("([^"]+)", "([^"]+)"\)', parts)
    assert len(parts) == 10
    fields = ", ".join(f"{part} = '{cvar}'" for part, cvar in parts)
    output = ROOT / "runtime/addon-integration-0.115.0/installed-api.lua"
    output.parent.mkdir(parents=True, exist_ok=True)
    assert api.count("HUD_CVARS_LUA") == 1
    output.write_text(api.replace("HUD_CVARS_LUA", fields))
    # The established harness owns its own placeholder substitution; timer
    # checks receive the actual ten-key substitution used by the live extension.
    subprocess.run(["lua", "scripts/check-addon-bootstrap.lua", str(api_path)], cwd=ROOT, check=True)
    subprocess.run(["lua", "scripts/check-addon-timer-api.lua", str(output)], cwd=ROOT, check=True)
    print("PASS: current native owner/extract hashes, live timer inputs/20-stream route and exact installed Lua; Rust/source execution unverified")


if __name__ == "__main__":
    main()

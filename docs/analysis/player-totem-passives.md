# Player totem passives

Date: 2026-10-18. Status: recovered native behavior and implemented source; compilation, tests, emulation and application execution intentionally not run at this source-recovery checkpoint. This report does not establish playable gameplay or runtime parity.

The authoritative target is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. Earlier version findings are not used as the specification. The new implementation is [totem_passives.rs](../../crates/azeroth-survivors-re/src/player_abilities/behavior/totem_passives.rs); the parent integration invokes it directly from [totems.rs](../../crates/azeroth-survivors-re/src/player_abilities/behavior/totems.rs).

## Evidence

[native.json](evidence/0.97.2/player-totem-passives/native.json) binds every retained slice and scalar/string to its original VA, file offset, byte count and SHA-256. The three new unchanged native function slices were analyzed through `./scripts/rea` with Ghidra12.1.4. Generic raw Ghidra signatures use the provider's inferred convention; the original Win64 register/stack instructions bind actual arguments.

| Owner | Recovered behavior | REA evidence |
| --- | --- | --- |
| `1454d43d0..1454d4849` | Shared passive primary/secondary hits and attribution | `ev_7172c1a90dfe447ceac15d46ab684ffe46850761cd094a02b4824b156ec840b9` |
| `1454d49e0..1454d4cfd` | Passive cooldown/deadline/learned-row writes and event publication | `ev_a01795b522da4d050723702751596026fee46b487af12373527b71792c42e0c1` |
| `1455321e0..1455323ac` | Original-target survivor filter | `ev_b06966a9985e627eaabcf2999f589afc4e12b90c05e07ba163f8e784157dbe62` |
| `1454a422c..1454a46a0` | Call of Flame at expired totem removal | Reused current GameTick `ev_c5c9cc29e1e6e39c77e71ac55fc8abbce607fd9cb931b6b010eee7b8f4720299` |
| `1454a46c0..1454a4c10` | Pulse selection and talent22 healing | Same current GameTick evidence |
| `14549f01c..14549f02a` | Cached maximum-health pointer is Game+1112 | Same current GameTick evidence |

Curated original disassembly and decompiler text are beside the manifest. The owning full GameTick evidence is [behavior-native.json](evidence/0.97.2/player-abilities/behavior-native.json). [recover-player-totem-passives.py](../../scripts/recover-player-totem-passives.py) prepares exact PE `RUNTIME_FUNCTION` slices and project-local REA plans; `--collect` records completed analyses and re-extracts the original instruction/data ranges. It refuses another target SHA. Binary slices, full REA bundles and disposable plans remain ignored under `runtime/`.

## Call of Flame

The GameTick removes the expired120-byte totem row before examining its expiry passive. It finds the first learned ability with key `call_of_flame`, retaining that current88-byte instance rather than the expired totem's captured ability. The first matching shared proc deadline must be ready. Missing deadlines use the exact finite sentinel `-f32::MAX` (`0xff7fffff`, VA`1459eb2d0`).

The explosion uses the expired totem position and current Call of Flame area multipliers/global area, including the shared70/10 logarithmic radius softcap. It queries live actors in distance order. An empty result removes the expired object without starting the passive cooldown or emitting an explosion.

With victims present, the order is passive deadline/learned cooldown writes and cooldown/event publication, cast visual8349 from the expired totem GUID with the victim list, effective-power calculation, then shared passive hits. The native object-removal packet follows this work. There is no totem re-summon or automatic recast in this branch.

## Shared passive start

`begin_passive` implements native`1454d49e0`. Exact key exceptions `redemption` and `faerie_fire` return without changing state or publishing an event. For other keys:

```text
common = max(base_cooldown * 1.4 * cooldown_multiplier
             * talent_cooldown_multiplier * global_cooldown, 0.25)
interval = max(passive_minimum_interval(key), common)
           / max(effect_multiplier, 0.1)
deadline = now + interval
```

The current key-floor map comes from the canonical recovered `upgrades::passive_minimum_interval`; Call of Flame's floor is1.5seconds. The first matching shared deadline row is updated, or a new row is appended. The first matching learned instance's `remaining` is set to the same interval. These writes precede publication. `PassiveStarted` retains the interval and saturating truncated `interval*1000` cooldown milliseconds; the native helper`145442f60` cooldown packet precedes opcode`0x135`'s12-byte `[spell_id:u32,player_guid:u64]` event. The latter is not an invented gameplay callback.

## Shared primary and talent13 hits

`multi_hit` implements all hit ordering and RNG itself. For every primary GUID in supplied order, it consumes a shared xoshiro256++ high24-bit crit draw and reads live crit chance/multiplier. The canonical hit/death consumer runs synchronously before the next helper draw, so its own proc draws remain interleaved.

Native Game+273 source kind and all four words at Game+32 and Game+64 are saved once per pass. Before each recursive hit, source kind is3 and only the low64-bit enum tag of each word block is zeroed. The high payload words remain intact. All saved values are restored after each hit. The final native hit flag isfalse. The actual damage spell is always the instance definition's spell ID; the helper's supplied spell ID is only for the optional second visual.

`resolve_passive_hit` exposes the same concrete context wrapper for the native Hunter/Faerie single-hit consumers. Those callers retain their own critical/uncritical decision. The multi-hit helper keeps its once-per-pass snapshot rather than silently changing it to a new per-hit snapshot.

After the first pass, the helper sums ordered talent-effect13 amounts whose key matches the ability, starting at negative zero. Nonpositive totals return. Its actual `ucomiss`/`jae` gate lets an unordered total continue; the source retains that behavior. The survivor helper examines the **original GUID list**, retaining GUIDs whose matching native actor state has bit0 clear. It preserves order and duplicate GUIDs. It does not select nearby actors and does not exclude the original victims.

The second cast visual is emitted only when its source GUID exists in the actor array or equals the player GUID. Thus an expired totem still produces secondary damage without a second visual. Secondary damage is original power times the matching talent sum, with an independent crit roll per surviving original target and the same context save/restore rules.

The source takes the run's ordered equipped-talent records as an immutable slice and computes the sum after primary hits rather than caching a magnitude. Any future adapter permitting talent replacement inside a recursive hit must resample that set at this boundary. Native actor state0/1 is represented by the existing live/dead actor field; the original filter's bit test is retained in evidence for any future additional state representation.

## Talent22 healing before pulses

For each due surviving totem, after selecting its current learned instance or captured fallback and before target selection/hits, native GameTick sums every ordered talent-effect22 amount from negative zero, without an ability-key restriction. Nonpositive or unordered factors skip the entire healing block. A positive factor requests `factor * maximum_health`, where the cached pointer is explicitly Game+1112.

The source applies `min(current_health+requested,maximum_health)` with the native unordered-result rule preserving the original sum. Actual healing is resulting health minus previous health. The first effect22 row selects the same-index40-byte parallel provenance entry when it exists. If it does not, the healing meter uses translated key`Leech` and icon`Spell_Shadow_LifeDrain02`, bound to their current PE string bytes. The meter is skipped when zero is greater than or equal to actual healing; unordered actual follows the native publication arm.

Even if actual healing is zero, a positive factor publishes player health field22 as saturated `ceil(max(health,0))` and maximum-health field28 as saturated `ceil(maximum_health)`. The real publisher updates the native object/update-field maps. No crit draw, heal cooldown or spell visual occurs here. Each due totem heals independently, including pulses with no victims.

## Implemented boundary and remaining work

`TotemPassiveContext` carries real ordered talent effects, shared proc deadlines, learned ability state, global cooldown, vitals and provenance count. The parent integration calls `on_expiry` before removing the object, and calls `prepulse_heal`/`emit_healing` before each pulse. Fresh `PassivePort::targets` snapshots prevent a later totem from targeting actors removed by an earlier explosion or proc. The former opaque expiry/healing callbacks are removed.

`PassivePort` deliberately requires actual actor/target snapshots, live crit stats, native attribution reads/writes, synchronous canonical hits sharing the run RNG, and packet/meter publication. These are world/transport ports; the passive math, gates, state changes, target order and RNG consumption are reconstructed source. The project still needs the real gameplay world/packet/actor integration. This work does not fabricate an engine adapter, serialize every native packet, or establish runtime parity.

Validation performed: current target hash and exact slice/source hashes checked by the collector; new REA/Ghidra outputs inspected against original PE assembly/data; integration reviewed as source. No builds, compiler checks, tests, emulation, game or rebuilt application launches were run. No binary target or disposable REA runtime artifact is intended for Git delivery.

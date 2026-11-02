# Player-ability source recovery — 0.97.2

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Source checkpoint: **2026-10-18**. Authoritative input:
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This checkpoint covers player-ability source recovery. **No compilation,
compiler checks, emulation or game launches were performed.**

## Source and evidence ownership

The public [player_abilities source](../../crates/azeroth-survivors-re/src/player_abilities/mod.rs)
is part of the existing source library. The menu still has no gameplay/world
adapter; this work does not make a playable game or certify runtime parity.
The subsequent class-special source shares concrete hit/timer/totem state,
cooldown helpers and RNG with the active-ability components; the linked
behavior report owns each consumer and its remaining engine boundaries.

| Source | Recovered responsibility |
| --- | --- |
| `catalog.rs` | All112 current definitions,9 class pools, starter keys and exact f32 bits. |
| `damage.rs` | Cast power, interval/duration scaling, effect11 hold, victim modifiers and health/meter inputs. |
| `upgrades.rs` | Five upgrade kinds, diminishing returns, target caps, definition/runtime eligibility, learned rarity and ordered rank growth. |
| `behavior.rs` and `behavior/` | Runtime instances, ordered scheduler, targeting, casts, deferred impacts, periodic and status state. The [behavior report](player-ability-behavior-0.97.2.md) owns exact coverage and gaps. |

The [complete catalog](player-ability-catalog-0.97.2.md) lists every definition's
base power, cooldown, range, radius, targets, duration, tick count and upgrade
tags. [Machine-readable records](evidence/0.97.2/player-abilities/catalog.json)
retain120-byte records, referenced upgrade slices and8 constant tables.
These values are definition inputs, before run, rarity and upgrade modifiers.
Definition+100 stores a totem's pulse spell ID, not its summoned creature entry;
the current object constructor uses creature entry9500 for both totems.
The definition's stored speed at+96 is retained separately; the current
projectile consumer selects travel speed by spell ID rather than reading it.
Keys are the ability identity. Spell IDs are not unique: Holy Shock and Penance
both store25912. The native spell-name lookup`1454193f0` uses the first matching
record; the source retains that policy and also exposes an all-matches iterator.

The [current native evidence](evidence/0.97.2/player-abilities/upgrades-native.json)
retains7 REA/Ghidra analyses, original PE function/span hashes, jump tables and
scalar values. Original disassembly and decompiler text are adjacent. The native
definition lookup is independently bound by [catalog recovery](menu-catalog-0.97.2.md).

| Native owner | Role |
| --- | --- |
| `14540eb90` |112×120-byte current definition lookup at`146719a68`. |
| `1454e7a20` | Current cast dispatcher and power prologue. |
| `14549d550` | Current tick; scheduler slice`14549e46b..14549ed86`. |
| `14540f1c0` | Learned-rarity adjustment; REA`ev_e8ef4a88a86f539d2db14d8c24be7f54f5b6d218d3d862d599f9d85ad955cc62`. |
| `1454f94c0` | Per-kind upgrade magnitude. Indirect switch bound with the original PE jump table. |
| `14540da00` | Definition-level upgrade gates; REA`ev_dd004e0941f614d593c6a66535c370889bdfa060fa2c9987a62e4340aa0b9128`. |
| `145472190` / `1455292b0` | Ordered eligible-type iterator and collection; iterator REA`ev_fcc6d83195a249301bfe55044444c7ab96e0319e79bf07d0a35c379dc39d62f7`. |
| `14541b790` / `14541b8b0` | Class-passive cooldown floor/gate; REA`ev_eab4d27544294fb75fe59693dda9cad696acdb6f5b97e492013803ddb6c387eb` /`ev_279eb666ba6bb3854141667b32eb59a25b5a899896c1beabc2949e18fe06a9f4`. |
| `1454e40a0` | Apply choice; exact upgrade branch`1454e4a29..1454e4b35` in the existing[loot evidence](evidence/0.97.2/loot/manifest.json). |
| `1454c2eb0` | Shared victim hit/death owner. Reused current REA`ev_ba95562638ee7eaae2ea1dc88d80c5df86859a014473f69b678b229aacd357bd` and[original instructions](evidence/0.97.2/loot/enemy-death.asm). |

Raw imports use generic GCC register inference. Windows x64 instructions and
the full hash-checked PE supply the actual arguments and external constants.
Unresolved raw indirect switches are declared, with their original jump table
and individual case instructions controlling the port. No patched target,
invented case branch or older-target RVA supplies missing behavior.

## Power and cooldown

The current cast prologue computes, with separate f32 operations:

`((base_power *1.4 *power_multiplier *talent_power_multiplier *kind_weight)
+ health_power *maximum_health_if_base_positive) *run_damage_multiplier`.

Kinds2,3,8 use weight0.5; other current kinds use1. Maximum health is
Game+1112; outgoing-power multiplier is+1116. The ability instance has88 bytes
in the target: rank and remaining time, five ordinary upgrade values/counts,
five talent modifiers, health-based power and a separate effect multiplier.
The recovered learned constructor starts at rank1 and remaining0.5s. Its last
four bytes are padding, not another guessed multiplier.

Cooldown is`max(base_cooldown *1.4 *cooldown_multiplier
*talent_cooldown_multiplier *global_cooldown_multiplier, .25)`.
Effect11 adds`max(duration *1.4 *duration_multiplier
*talent_duration_multiplier, .1)` afterward. Effect11 is invulnerability;
this extra duration is not a generic channel rule. The ordered scheduler
decrements each instance then casts it at most once per tick; failure retries
after.2s. On success, proc work runs first and the remaining time is the
minimum of its current value and computed interval. Passives(kind11) do not
enter the ordinary auto-cast path.

The shared victim multiplier adds current talent bonuses for controlled
targets(tag18), native special targets(tag19), targets below30% HP(tag20),
guardians(tag21) and the player's active absorb(tag28), plus target-specific
vulnerability/damage-taken values. Each sum follows native record order.
Victim damage floors at1, subtracts the full float amount, records full
damage separately from damage capped to positive previous HP, and publishes
ceil(max(remainingHP,0)) as saturated u32 health. Crit power is already supplied
by the cast/launch path. This prefix is not the complete packet/proc/death
dispatcher and does not fabricate a generic armor or resistance formula.

## Upgrades

Native tags0..4 mean power, cooldown, targets, area and duration. Each definition
also has an ordered allowed-type byte slice. The magnitude table index is0..4:

| Kind | Rarity values | Current-state scaling |
| --- | --- | --- |
| Power |.18,.25,.34,.46,.65 | Divide by`1 + power_upgrade_count*.5`. |
| Cooldown |.07,.10,.13,.17,.23 | Multiply by`max((cooldown_multiplier-.2)/.8,0)`. |
| Targets |1,1,1,2,2 | Cap the added target bonus at12, or2 for Seal Fate/Soul Fire/Lightwell/Faerie Fire passives; other passives cap0. |
| Area |.12,.18,.25,.35,.5 | Multiply by`max((5-area_multiplier)*.25,0)`. |
| Duration |.15,.22,.3,.4,.6 | Multiply by`max((6-duration_multiplier)/5,0)`. |

The native iterator filters definition support, buff duration/cooldown overlap,
passive-specific cooldown floors and increments below.005. It excludes target
upgrades when its rarity index is0; the offer builder's initial probe uses4.
These gates are separate from the magnitude calculation.

Apply order is significant: increment rank, compute the selected magnitude from
the previous per-kind count, apply it, increment that count, then multiply power
by`1 + .04/(1 + rank.saturating_sub(2)*.125)`. This extra power applies to every
upgrade kind. A bundle repeats these steps in order and preserves running cooldown.

Learned rarity uses a different native domain: tag0 has no bonus; tags1..5 index
the power/cooldown tables with tag-1. Power-bearing ordinary abilities, selected
buff status kinds and eligible passives get a multiplicative power bonus;
remaining abilities get a multiplicative cooldown reduction. Invalid rarity
indices retain the original bounds failure instead of being silently clamped.

## Reproduction and validation limits

`python3 scripts/recover-player-abilities.py` regenerates the standalone
Rust catalog, readable roster and provenance from the verified PE. `--check`
compares these generated texts without running Rust or the game.
`--prepare-native` writes7 exact code slices and REA plans inside ignored runtime;
run selected plans through`scripts/rea-batch.py` and`./scripts/rea`.
`--collect-native` retains completed Ghidra evidence and original PE disassembly.
Building the source itself never requires this EXE.

Hash-gated extraction, generated-text reproduction, static instruction review
and Git whitespace review were performed. **No compilation, compiler check,
test harness, native emulation, original game or rebuilt game was run.** Final
Rust integration is uncompiled. Real run-state/stat/talent producers, world
entities, DBC visuals, packets, persistence and complete hit/proc/death scheduling
remain engine integration work. Exact cast-branch recovery boundaries are listed
in the owning behavior report; no complete gameplay/parity claim is made.

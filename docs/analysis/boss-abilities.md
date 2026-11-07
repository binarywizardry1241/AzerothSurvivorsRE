# Boss ability effects recovered from

Date: 2026-10-18. Target: `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.

`crates/azeroth-survivors-re/src/bosses/abilities.rs` implements dispatch and effects for **all five ability tags used by all 191 ability records across the 60 canonical bosses**. It uses the existing canonical `RawBossAbility`, shared run RNG/counters and common actor `Movement`/math interface. It does not duplicate boss definitions. Boss cooldown/enrage/common movement collection is owned by `bosses/ai.rs`; zone/schedule data and boss creation/death are separate owners.

The source constructs concrete terrain-adjusted attacks, delayed hit records, minion requests, dynamic-object update fields and charge movement orders. Actual assets, packets, collision and entity/victim systems remain required engine ports. No playable-world or original/rebuilt runtime parity is claimed.

## Evidence and method

- [Manifest: original PE ranges, constants, jump table and all 191 records](evidence/0.97.2/bosses/abilities-manifest.json).
- [Retained REA/Ghidra decompilation and provenance](evidence/0.97.2/bosses/abilities-rea.json).
- [Original dispatch instructions](evidence/0.97.2/bosses/abilities-dispatch.asm), [delayed effect resolution](evidence/0.97.2/bosses/abilities-effect-resolution.asm).
- [153 bounded original-instruction fixtures](evidence/0.97.2/bosses/abilities-fixtures.json).
- Canonical raw records originate in the already selected-hash-bound [guardian/boss catalog](evidence/0.97.2/guardians/guardian-catalog.json).

`python3 scripts/recover-boss-abilities.py` verifies the selected EXE digest, retains original ranges/bytes digests/constants and prepares project-local plans. `python3 scripts/rea-batch.py runtime/analysis/history/raid/boss-abilities/16e013fe9d5f/plan-<address>.json` invokes `./scripts/rea` with Ghidra. Five raw branch-entry slices at their original virtual addresses recover the jump-table bodies without manufacturing executable behavior. Their end-of-slice decompiler warnings are evidence limitations; original outgoing instructions govern. Complete native helpers and the two leaf lookup intervals are also analyzed.

`python3 scripts/recover-boss-abilities-fixtures.py` runs only declared unchanged x86-64 intervals in bounded Unicorn, using synthetic state and rejecting external instructions/calls. It generated 46 spell lookup cases, six charge durations, five ray clips, 60 minion index cases, 24 radius tests and 12 missile RNG cases. The original and rebuilt applications were not launched; this is not gameplay emulation.

## Dispatch and data layout

Native dispatch owner: `0x1454ccbb0..0x1454cdd0b`. The queue consists of the current actor-vector index followed by the copied ability payload. The dispatcher checks tag `0xffffffff` as a terminator, skips missing/dead actors, re-interpolates the actor's current position and re-reads its damage before dispatching each record. The owning `BossAiState` collects expired slots during the actor stage; their effects execute later in original queue order. A death between collection and dispatch suppresses the effect without undoing the earlier cooldown reset.

Jump table `0x1469acdc0` has these five targets:

| Tag | Native branch | Canonical record count | Decoded fields after the tag |
|---|---|---:|---|
| 0 | `0x1454ccd0a` | 29 | visual spell, impact spell, radius, delay, damage factor, cooldown |
| 1 | `0x1454ccf5e` | 27 | spell, missile count, unused words, cooldown |
| 2 | `0x1454ccd73` | 60 | minion count, unused words, cooldown |
| 3 | `0x1454ccf2a` | 44 | spell, radius, damage factor, unused words, cooldown |
| 4 | `0x1454ccd44` | 31 | charge spell, unused words, cooldown |

Numeric words representing radius, delay, damage factor and cooldown are retained as exact IEEE754 f32 bits in the canonical records. Unknown tags return an explicit source error instead of inventing an attack.

The effective damage supplied at dispatch has the native timed damage reduction and boss enrage multiplier of 1.4 applied once. Spell IDs identify the visual/protocol requests below. No conventional WoW stun, root, silence, poison or other status effect is inferred from an ID or spell name: those effects are not present in these recovered ability branches.

## Tag 0: delayed ground area

The target is the player's position captured at dispatch. Height uses the primary surface, otherwise secondary provider, otherwise the world's configured fallback height. The source immediately creates the original dynamic-object telegraph and appends a kind-one delayed impact:

- Radius: record word 3.
- Resolution: `now + word4_delay`.
- Damage: `word5_factor * effective_damage`.
- Visual spell: word 1, used for the telegraph object.
- Impact spell: word 2, cast at the captured center when the delay expires if nonzero.
- Telegraph object removal: queued after the expiry/hit processing.

This branch does **not** create periodic damage pulses. The shared native queue also has kind-zero player areas with pulse counters, but the boss branch explicitly writes kind one and a zero pulse count.

Dynamic-object creator `0x1454eeaa0` increments the shared Game+`0x904` u32 counter with wrapping arithmetic and creates GUID `0xf100000000000000 | counter`. Its sparse update fields are reconstructed in source:

| Field | Value |
|---|---|
| 0–1 | Dynamic object GUID |
| 2 | `0x41` |
| 3 | Visual spell ID |
| 4 | Requested radius / native visual-radius override; 1 if no override |
| 6–7 | **Player GUID**, as in the target, rather than the boss GUID |
| 8 | 1 |
| 9 | Visual spell ID |
| 10 | Requested radius |
| 11–13 | Terrain-adjusted XYZ |
| 14 | Zero orientation |

Field 5 is absent from the original sparse map. The engine adapter emits the real create/update packet from these fields. The delayed record retains the telegraph GUID for later removal.

## Tag 1: missile volley

The spell's native hardcoded speed is clamped to at least 10; unknown spells return zero from the lookup and therefore use 10 for this branch. Zero missile count exits after that speed calculation.

The first missile aims exactly at the player's captured XY, while still consuming a shared 23-bit `[0,1)` phase draw. For each later missile, the source consumes a fresh phase draw and radius in `[2,6)`, then computes:

```text
angle = (missile_index / missile_count) * 2π + phase
xy = captured_player_xy + radius * (cos(angle), sin(angle))
```

Each point gets its own primary/secondary/default height query and a ground-target spell cast. Each appends a delayed impact with radius **2.5**, damage `effective_damage * .45`, and resolution time `now + XY_distance(source,point)/max(native_spell_speed,10)`.

The delayed record's impact-spell field is zero: the original cast launches the visual; expiry performs only the range/damage test. Native byte+`0x54` is retained as 5. Kind-one expiry does not consult that byte or apply a separate school/status rule.

## Tag 2: summon minions

The source yells the localized native text **“Minions, to me!”**, even for a zero count. For `i = 0..count`, minion aims are a ring centered on the boss at radius **5** and angle `(i/count)*2π`. Every position uses the full terrain-height chain.

The selected zone's enemy index is **1 when `i % 3 == 2`, otherwise 0**. The real ordinary enemy creator receives that definition index and exact position. It applies normal enemy scaling, GUID construction, actor defaults and the live-entity cap using the same shared RNG and Game+`0x904` counter. Native attempts continue through the requested count even when the cap refuses creation; no invented replacement minion is chosen.

## Tag 3: immediate area strike

The branch compares scalar-sqrt XY distance between boss and player against the record radius. Equality hits; Z is ignored. It emits the spell cast even if the player is outside range. The target payload is native tag 2, which the recovered spell packet builder serializes with a zero target mask. Its hit-target list contains the player only on an in-range hit.

An in-range strike applies `effective_damage * damage_factor` immediately and attributes the damage to the boss GUID. No delayed impact or additional status effect is created.

## Tag 4: charge

The source first samples terrain at the player's captured target. With a collision grid, the ray query clips that destination and backs off **0.5** units from a hit:

```text
fraction = max(ray_fraction - .5/max(XY_distance(source,target),.5), 0)
clipped_xy = source_xy + fraction*(target_xy-source_xy)
```

A fraction at least one keeps the target. A present collision grid causes an endpoint height re-query; an absent grid retains the first target-height result, matching native query order. Duration is `max(XY_distance(source,destination)/24,1.1)`.

It casts the record's spell on the player, samples the movement-source Z from the primary terrain provider only (retaining interpolated actor Z on failure), and emits/install a charge movement with:

- Start `now`; destination is the collision-adjusted sampled point.
- Duration encoded as saturated/truncated u32 milliseconds from `duration*1000`.
- Shared Game+`0x908` movement sequence incremented by the packet adapter.
- Next movement deadline `now + duration + .2`.
- Remaining attack delay `duration + .3`.

The branch also appends an arrival impact: spell **6343**, radius **4.5**, damage `effective_damage + effective_damage`, deadline `now + duration`, centered on the charge destination. No contact damage is fabricated along the path.

## Delayed impact resolution

`PendingEffects::resolve_due` implements the kind-one owner from `0x1454a3cd0..0x1454a3f81`. It runs before actor updates and new ability dispatch in each active tick. A newly appended effect cannot resolve in that same tick; the next tick handles it even when the calculated delay was zero.

Impacts preserve insertion order. Expiry is inclusive (`now >= resolves_at`), removes the original entry, emits a nonzero impact spell at the captured center, checks the player's **current** XY against radius, applies its stored damage when in range, and then removes its telegraph object if present. Deferred damage calls the native player-damage owner with **source GUID zero**, even though the spell visual retains the boss GUID. The actor may have died since dispatch; existing impacts still resolve. The source preserves those distinctions.

The owning engine may have non-boss/player kind-zero effects in the same native vector. Its adapter must preserve the original combined queue order; it must not introduce a second gameplay clock or independently seeded RNG.

## Recovered lookup tables

Visual radius helper `0x1454f0710`:

- 8: spells 10, 1510, 1680, 5740, 6343, 8122, 16914, 20549, 26573.
- 10: spells 120, 122, 1160, 1449, 1949, 11113, 13810, 15237.
- 5: spells 779, 2120.
- Other IDs: no override.

Missile speed helper `0x1454f08d0`:

- 20: spells 403, 686, 2812, 5176, 7269.
- 24: spells 133, 6353, 6789, 11366.
- 28: spells 116, 10181.
- 40: spells 75, 1978, 3044, 5116, 6917, 19434.
- 30: spells 1510, 2643.
- 35: spell 24275; 19: spell 3606; other IDs: zero.

These values are recovered native branches, not current WoW/DBC assumptions.

## Validation and remaining work

Performed: selected EXE SHA verification; REA/Ghidra analysis of all ability branches, ground-object creation, spell-target packet builder and native lookup leaves; original Win64 instruction/data audit; bounded original-instruction fixture generation. Independent static review found the root queued-dispatch integration preserves actor-index lookup, sentinel/dead gates, interpolation, current damage and dispatch order.

`tests/boss_abilities.rs` is authored to compare all native fixture families, object fields/GUID wrap, delayed current-position hits, miss visuals, minion definitions, volley impacts and charge follow-ups. **It was intentionally not compiled or run**. No compiler checks, builds or original/rebuilt game launches ran, per static recovery mode.

Remaining required adapters: actual terrain/ray collision resources, enemy creation and live cap, dynamic-object packet/rendering paths, spell packets/assets, movement packets/actor fields, player-damage resolution and shared queue/counters. Imported trigonometric/hypot/CRT bit parity and live Windows/game behavior remain unverified. These are engine integration/parity gaps; the five cataloged ability dispatch/effect rules themselves have source implementations.

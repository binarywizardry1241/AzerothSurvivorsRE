# Totem population and expiry in 0.105.0

Target: supplied Windows x86-64 `AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The target registry and `coverage_common.latest_target(verify=True)` select and
verify that input before recovery or checking. Current implementation status
belongs to [verification-needed](../verification-needed.md), gap **#13**.

The source now enforces the native per-ability-key population contract and
connects cap eviction and deadline expiry to the same live Call of Flame,
cooldown, passive-hit and destroy-object consumers. This is source integration
supported by static native recovery; compilation and gameplay/presentation
parity remain unverified.

## Native contract

The [canonical cap excerpt](evidence/0.105.0/game-mode-audit/totem-kind-cap-branch.asm)
at `145921b3e..145921cb5` belongs to cast dispatcher `14591f620`. Its
[original manifest](evidence/0.105.0/game-mode-audit/native-manifest.json)
retains that byte range and parent REA evidence. The new
[manifest](evidence/0.105.0/totem-cap/manifest.json) references that extract
without duplicating it and retains the additional current-target owners.

| Owner | Recovered behavior |
|---|---|
| `145921b3e..145921c73` | Count existing summons with equal ability-key length and bytes. At fewer than 40, append normally. At 40 or more, remove exactly the **first** equal-key row. Different totem abilities have independent counts. |
| `145997da0..145997eda` | Remove one 136-byte summon row with a stable shift, preserving the order of every remaining row. A preexisting overfull list loses one row, rather than being truncated to 39. |
| `145921c35..145921c73` | Copy the removed row's GUID and saved XYZ, invoke `145949470`, then invoke `145926f60`, before allocating the new summon GUID. |
| `14590b27a..14590b36a` | Ordinary deadline expiry also removes its row first, calls `145949470` with that GUID and position, then queues destruction of the nonzero GUID. |
| `145949470..14594980a` | Find learned `call_of_flame`; use the first matching passive deadline, defaulting to `-f32::MAX`. Require current time to be at least that deadline and at least one eligible target around the removed totem's saved position. NaN time/deadline fails the readiness comparison. Empty target sets do not begin the passive. |
| `14594968b..1459497be` | Begin the passive before the spell visual and damage calls. Emit visual spell 8349 from the removed GUID; call the shared multi-hit owner with the current Call of Flame instance, removed GUID, targets and computed power. Expiry contains no totem re-summon. |
| `145946220..145946559` | Update/append the first matching deadline and update the first matching learned instance's remaining cooldown. Publish the cooldown packet before opcode `0x135` with spell ID and player GUID. The existing source helper retains the common 0.25 floor, key-specific minimum and division by `max(effect_multiplier, 0.1)`. |
| `145945c10..145946089` | Existing multi-hit behavior remains shared: per-hit crit and passive attribution, matching talent-effect variant 13, and an ordered surviving-target second pass. |
| `145926f60..14592700e` | Skip zero GUID; otherwise queue opcode `0xaa`, length 8, containing the exact GUID. |

REA/Ghidra 12.1.4 recovered the expiry, begin-passive and multi-hit functions
from unchanged headerless slices. Their Evidence IDs are in the manifest.
The raw importer uses a GCC ABI; Windows register/stack bindings and external
data/call targets were checked against the PE instructions. Partial pseudocode
is not substituted for the cap's external-jump-table instruction branch.

## Connected source

- [Kind-ten dispatcher](../../crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs)
  applies `remove_for_kind_limit` after summon-position calculation and before
  `Totem::new` allocates the new GUID. It calls the live `expire_totem` port for
  the removed row before publishing/appending the new summon.
- [Totem storage and tick](../../crates/azeroth-survivors-re/src/player_abilities/behavior/totems.rs)
  count by the captured ability key and use ordered `Vec::remove`. Deadline
  expiry enters the same `expire_totem` callback; the pulse still reads the
  current matching learned instance, falling back to the captured instance.
- [Expiry helper](../../crates/azeroth-survivors-re/src/player_abilities/behavior/totem_passives.rs)
  shares target/readiness selection and spell/hit publication between its
  standalone and live entry points. The live entry borrows the actual learned
  rows and deadline storage for `begin_passive`, then releases those field
  borrows before recursive passive hits. It keeps the same run RNG and current
  equipped-talent callbacks.
- [Live passive adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/passives.rs)
  binds `expire_totem` to that helper and destroys the old object afterward.
  Its real `emit_passive_started` publishes the cooldown/start event, and its
  recursive-hit owner retains the class-special passive-hit/death consumers.
- [Run tick](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs) now
  runs the totem loop through `PassiveCombat`, after pending impacts and ground
  effects. Previously deadline expiry used the lower combat adapter, whose
  passive-start publisher was empty. Both removal causes now reach the live
  passive publisher and hit context.
- Ordinary scheduled casts and
  [talent milestone/freecasts](../../crates/azeroth-survivors-re/src/gameplay/mechanics/milestones.rs)
  already share `dispatch::cast` with that live port. Neither path bypasses the
  cap, and evicting a totem does not manufacture another summon or talent proc.

## Static checks and limits

Run from the checkout:

```sh
python3 -B scripts/recover-totem-cap.py check
```

The checker verifies the newest target identity, retained PE byte ranges and
extract hashes, then replays **44 bounded instruction cases** against the
[reviewed vectors](evidence/0.105.0/totem-cap/native-vectors.json):

- 28 cap cases cover both kinds, independent mixed populations, 0/1/38/39/40/41/57
  same-kind rows, stable first-match removal, captured GUID/position and
  expiry-before-destroy ordering.
- Eight expiry cases cover absent learned ability, future/exact/elapsed/missing
  deadlines, no targets, ready targets and NaN readiness inputs. They capture
  target-center/radius and begin-passive, visual and hit call order.
- Three destruction cases verify zero-GUID suppression and exact `0xaa`
  eight-byte GUID packets.
- Five begin-passive cases exercise cooldown/effect floors, deadline update or
  append, learned-row remaining state, and cooldown-before-`0x135` publication.

All 44 cases passed. The emulator executes only immutable recovered instruction
ranges with declared CRT, allocation, target, packet and gameplay seams; it does
not execute the application or Rust source. Full selector, recursive combat,
Windows math-library and display behavior are outside these bounded cases.
A Rust regression reuses the 28 native cap observations against the actual
`remove_for_kind_limit` implementation; that compiling test was added but
intentionally not run. No build, `cargo check`, compiling tests, game launch or
original/rebuilt comparison was performed. Gap #13 retains its runtime and
parity requirements.

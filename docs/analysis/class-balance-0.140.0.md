# Class and combat changes in 0.140.0

The installed AMD64 PE is 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
Addresses below are preferred image VAs. Descriptor observations use the
exact mapped PE bytes and pointer/length pairs. Diagnostic references come
from the [current diagnostic inventory receipt](coverage/diagnostic-ownership.json).
Those references locate code candidates within unwind extents. They leave
specific branch ownership, runtime behavior and parity open. Claim suffixes
below expand to `changelog:0.140.0:<suffix>` and identify individual [release
items](../CHANGELOG.md#01400).

## Hunter pets, offers and Kill Command

[Finding #316](../CURRENT-STATE.md#gap-316) owns the Kill Command lifecycle,
with the retained [ordinary pets #6](../verification-needed.md#gap-6),
[jewelry #143](../CURRENT-STATE.md#gap-143), and
[set mechanics #242](../CURRENT-STATE.md#gap-242) as dependencies.
The new `crates/wenilla-rogue/src/game/kill_command.rs` diagnostic has 33
verified references in 12 candidate extents. In particular, `0x145f807a9`
within `0x145f7bb40` references line 161, and `0x145fc64fd` within
`0x145fc2760` references line 197. Use the complete diagnostic row to separate
the cast path, effect handling and shared failure paths.

| Claim | Current observation and source frontier |
| --- | --- |
| `d02bb19fb7a35f89` Kill Command, pet admission and Counterattack | The Hunter class row at `0x1473b8028` points to eleven pool entries at `0x1473b7400`, with `kill_command` at slot 5 in place of `explosive_trap`. Its 120-byte ability row at `0x1473ba208` binds spell 883, raw power 67, range 35 and cast kind 12. The adjacent `explosive_trap` record at `0x1473ba190` retains spell 13812, and Counterattack's 64-byte effect at `0x1473d1328` selects that key. Source `player_abilities/catalog.rs` still supplies `explosive_trap` in the ordinary pool and `behavior/dispatch.rs` falls through for kind 12. Trace the current pet offer predicate, cast-kind branch, per-pet target and attack queue, and independent Counterattack trigger. Compare with the existing actor lifecycle in `gameplay/mechanics/pets.rs` and `run_effects/pet_tick.rs`. |
| `406566b77dfca87b` Heart of the Packlord | The new title at `0x1473c4624` and retained Heart of the Earthshaker title at `0x1473c43d8` are separate strings. The source loads `legendary:explosive_trap` from `assets/native-amulets-0.100.1.json` through `loot_rewards/amulets.rs`, and the cooperative save registry also carries that key. Resolve the keyed constructor, old-key translation, scaled effects, wolf howl target cap and damage taken, raptor bleed and Matriarch shockwave through jewelry/kill-command consumers. |
| `294bc25772dd45de` Giantstalker eight-piece | The title at `0x1473eeddf` seeds the set lookup. The checkout loads `assets/sets-0.121.0.json` through `sets.rs`. Follow the current descriptor's eight-piece effect through spell selection and effective cooldown/power before recording the 20% and 30% claim values as live rules. |
| `4ce9c90071dde8fd` Beastmaster Matriarch | The pet name begins at `0x1473e640f`; it also appears in set descriptions near `0x1473eb244`. The retained `run_effects/pets.rs` table has the ordinary Wolf/Raptor lifecycle, with no Matriarch descriptor. Follow the set's actor grant and bind normal bite, Hunter's Mark and five-star branches, including whether a bleed producer remains. |

The timed Hunter casts share the [proc dispatcher #90](../CURRENT-STATE.md#gap-90).
The White Devilsaur variant remains a separate appearance constituent under
[#119](../verification-needed.md#gap-119), with the appearance registry in
[#83](../CURRENT-STATE.md#gap-83).

| Claim | Current observation and source frontier |
| --- | --- |
| `bd0b3730a63334f2` Wyvern Sting | Talent record `0x1473d1d20` points to two effect rows at `0x1473d13e0`. They retain `frost_trap` and select `immolation_trap` with f32 `5.0`. Source `assets/talents.json` still selects `explosive_trap` for the timed effect. Follow native tag 39 into the timing, caster and floor-position consumers and compare `player_abilities/behavior/passive_tick.rs`. |
| `b6e494b0be86ca3b` Rapid Fire | Talent record `0x1473d09a0` names the twice-per-second limit. Its effect at `0x1473d0008` selects `aimed_shot`. The checkout's older tag 1 effect describes counted shots without this limit. Trace the current trigger at `game/procs.rs` candidates `0x145fd5db0` and `0x145fdc310`, including count preservation when a cast is suppressed and the clock used by the successful-cast deadline. |
| `350e45ff46b443ac` White Devilsaur | The name at `0x1465c8fe5` and save/switch key at `0x1465c8c98` seed the two-actor investigation. The [0.117.0 proof](white-devilsaur-0.117.0.md) and current `run_effects/pets.rs::replace_white_devilsaur` remove the first Raptor and substitute a single variant for the usual Wolf. Map both original actor IDs 9510/9511 into current effect descriptors, then follow independent bite presentation and combat identity through the actor tick and existing creature queries. |

## Enhancement, Consecration and Mind Blast

[#305](../CURRENT-STATE.md#gap-305) retains the [0.139.2 Enhancement
proof](enhancement-0.139.2.md). Current `game/enhancement.rs:124` is referenced
by `0x145f8f2bb` within `0x145f8c810`. The historical proc driver, repeat rules
and necklace scaling supply correspondence candidates. Continue through that
dispatcher and the ability/setup consumers instead of assigning current
semantics from the old addresses.

| Claim | Current observation and source frontier |
| --- | --- |
| `54b0f4d4dce2fdd3` Sweeping Storm | Record `0x1473da5a8` points to effect `0x1473d9c08`, which carries keyed `stormstrike` target modification. Recover the distinct rank-3 damage branch for the base cast and Windfury; this descriptor alone covers the target lane. `run_effects.rs` still needs the active Enhancement effect integration tracked by #305. |
| `a5da6b75f752b792` Eye of the Tempest first line | Item title `0x1473c4333` and `stormstrike` at `0x1473c4248` seed the current jewelry constructor. The exact concatenated changelog phrase was absent from the PE literal search. Recover the tooltip formatter/key and target qualifiers independently from the actual damage selector. |
| `73fd9cecd0fb1234` Rockbiter base power | The 120-byte descriptor at `0x1473bb450` stores spell 8017, raw power 66 and range 10. Follow the current startup replacement and the cast/tooltip composition to recover the effect of that raw value. The checkout does not have the ordinary Rockbiter startup/picker descriptor. |
| `c4b20ed37f977743` Windfury branching | The `enh_windfury_weapon` descriptor `0x1473da188` points to tag 54 subtype 4 at `0x1473d96a8`. Its description mentions two strikes. Recover the separate three-strike branch, random draw order, rank thresholds and repeat handling at `0x145f8c810` and its callees before registering the 25%/12.5% split. |
| `ee384828482e8aa6` Flametongue Fire Nova | Descriptor `0x1473da238` points to two tag 54 rows at `0x1473d9778`; neither stores the live scalar as a plain damage value. Resolve their rank consumers and proc attribution through #305 and compare the shared Fire Nova path. |
| `13db93523900cc83` Eye of the Tempest damage | The later supplied line adds Guardians to the target conditions. Use `jewelry.rs` candidates `0x145df4440`, `0x145e131e0`, `0x146064c90` and the actual Stormstrike hit consumer to distinguish boss/elite/Guardian flags and test where the modifier enters scaling. |
| `09b7d43f6452dba3` Consecration and Amulet of the Inferno | Descriptor `0x1473b9a10` stores spell 26573 and raw power 144. The checkout still stores 96 in `player_abilities/catalog.rs` and a separate +50% damage effect in `legendary:consecration`, beside area/duration/explosion effects. The literal `consecration` at `0x1473c4410` seeds [#143](../CURRENT-STATE.md#gap-143)'s current constructor check. Trace modifier deletion and retained effect lanes through the existing pulse and item-growth paths. |
| `0009124e18be87bf` Mind Blast and Improved Mind Blast | Spell 8092 at `0x1473baaf0` stores 131.4285736, giving 184 after the retained ordinary ×1.4 scalar. The checkout stores 93 before that scalar. Talent `0x1473d7ae0` points to a pair of tag 73 keyed `mind_blast` rows at `0x1473d70e8`, with f32 0.06 and selector bytes 1 and 0. `assets/talents.json` has only the cooldown row. Follow current rank scaling into the composed damage, cooldown and tooltip paths, preserving [#34's ordinary-balance evidence](../verification-needed.md#gap-34) and [#148's talent applicability](../CURRENT-STATE.md#gap-148). |

## Healing and defensive capacity

Use [#176's Tranquility recovery](../verification-needed.md#gap-176) and
[#288's defensive findings](../CURRENT-STATE.md#gap-288), preserving the
historical [Ice Barrier](ice-barrier-0.139.2.md) and [Divine Shield
lifetime](divine-shield-0.127.0.md) contracts. The current spell rows for Power
Word: Shield, Ice Barrier and Divine Shield are at `0x1473babe0`,
`0x1473bb9f0` and `0x1473b9dd0`. The Eternal Talisman title is at
`0x1473c428f`. Use the current `abilities.rs`, `auras.rs` and `jewelry.rs`
Location rows to recover the new cap, admission and replacement branches.

| Claim | Current observation and source frontier |
| --- | --- |
| `713f1d1f551a5bca` Tranquility credited healing | Talent `0x1473e5948` points to tag 33 at `0x1473e5060`; Tree of Life at `0x1473e5c08` points to tag 32 and a periodic Rejuvenation effect. The current checkout credits all excess in `run_effects/healing.rs::apply` and its batch path. Trace the difference between the requested heal, actual health restored, capped absorb delta and credited pool. |
| `6362d8f7e7f22739` Seed of Life critical rolls | The name at `0x1473eba21` and nearby set descriptions seed the effect producer. The existing `gameplay/mechanics/callbacks.rs::pulse_healing_pool` rolls once per Tranquility victim. Recover both Seed of Life damage emissions, RNG consumption and boss/elite selection independently. |
| `96435f933d14094a` Critical-hit proc reach | Blood Frenzy's current effect is at `0x1473e3c68`; Eye of Hakkar is named at `0x1473c6209`. Trace criticals from both Druid producers through their effect-kind filters into the two proc handlers and the damage meter. Tranquility's prior general hit/kill suppression is retained evidence for 0.119.0. |
| `1d1ef8f6798a0519` Power Word: Shield cap | Recover target maximum-health arithmetic and the Talisman's rank-scaled cap lane through `gameplay/mechanics/shared_healing.rs` and `player_abilities/behavior/buffs.rs`. Distinguish the unmodified capacity, necklace bonus and hard maximum. |
| `74230b7c5f2a2355` Divine Shield lifetime and gap | `player_abilities/damage.rs` caps duration at six seconds and `behavior/dispatch.rs` shares a 10-second cast admission timestamp. The old cooldown floor already expresses a gap after expiry for those bounds. Follow the new Talisman multiplier, actual expiry and minimum-gap owner through the cast, scheduler and overlay tooltip. |
| `19c82c058ebc3fb0` Talisman and Ice Barrier | The retained party recipient adds to a separate counted balance with a 100%-maximum-health cap. Recover base initial absorb, earned additions from damage/talents and the item-specific 200% maximum, plus stat refresh and expiry. |
| `5cab7afd57fd7f22` Shields and precedence | The 0.139.2 model uses an ordinary reservation plus a separate shared Ice Barrier balance and permits bounded additive party contributions. Recover replacement when one source absorbs on behalf of another, the stronger-only same-spell rule across two casters, and refresh/expiry when the weaker shield loses. |

## Attack range, pickups, attribution and input

The new `crates/wenilla-rogue/src/game/attacks.rs` diagnostic has 29 verified
references across six candidate extents. `0x145ee2eb2` in `0x145ee2a90`
references line 158, `0x145ee4db8` in `0x145ee4340` references line 137,
and `0x145f78972` in `0x145f743e0` references line 1392. [#318](../CURRENT-STATE.md#gap-318)
owns these candidate AS-specific ranges and the Rogue reach change. The
existing attack tick and ordinary spell dispatcher remain the source starting
points for classification.

| Claim | Current observation and source frontier |
| --- | --- |
| `78aee98f2e312f8a` Rogue reach | Sinister Strike record `0x1473ba4d8` carries spell 1752 and range 8. The checkout `run_effects/weapon.rs::profile` still assigns range 6 to all enabled melee classes, and the live tick uses that field. Follow current ability and automatic swing target selectors, including target geometry and any separate minimum-reach rule. |
| `a8f504d63cf96bd3` Rune-hound | The `game/companions.rs` Locations within `0x145fd2700` and `0x145fd2940` and Rune-hound literal `0x1465d2c9e` seed [#14](../verification-needed.md#gap-14). Checkout `run_effects/loot_companions.rs::select` rejects every intentional fetch within hero radius before admitting rune kinds for instinct 3. Trace the new inside-radius admission and single pickup ownership across the hero and companion sweeps. |
| `ac3ebee1359ef8ca` Amulet confirmation and chat | [#18](../verification-needed.md#gap-18)'s old modal proof identifies native Enter, numpad Enter and shared Escape. `gameplay/mod.rs::confirmation_controls` and `native_overlays/confirmation.rs::decision` still consume the shared just-pressed view. Use the [#310 InputGate filter](input-gate-native-0.139.2.md) to map the current native choice/modal edge into the FrameXML chat input path and recover where it is consumed. The earlier menu picker repair covers a different UI edge. |
| `952bce7492eb0be8` Meter labels and addon attribution | `game/meterlog.rs` at `0x1473c3b20`, `game/meterfeed.rs` at `0x1473c3e30` and Windfury title `0x1473d9684` seed the join. Follow Windfury and each set damage producer to the stable identity, log aggregation and addon rows through [#75](../CURRENT-STATE.md#gap-75) and [#307](../CURRENT-STATE.md#gap-307); compare against source-kind and proc-source adapters in `gameplay/mechanics/callbacks.rs`. |
| `97b441022c8ea419` Run start intent | The current `MoveForward`/`MoveBackward` bindings at `0x1469e5550`/`0x1469e556f` seed the input side. `gameplay/mod.rs::commit_movement_report` still starts on accepted XY displacement squared greater than 0.04. Map the new intent producer into the [#95/#282 floor gate](coop-start-0.123.0.md), including controller equivalence, landing and excluded guest movement. |
| `e6cc6393427136d3` Stationary slope height | [#1](../CURRENT-STATE.md#gap-1)'s earlier indoor surface proof covers the current source query boundary. `game/enemy.rs` has current candidate extents at `0x145ee1150` and `0x145ee1720` with Location lines 346 and 377–380. Begin at the accepted stop and stationary facing event in `gameplay/mechanics/actor_frame.rs` and `gameplay/mechanics.rs`; map the actual current native transition and inspect which terrain sample supplies its Z coordinate. |
| `094d1782a8db36a3` The Insane | The exact key occurs at `0x1473e8121` and `0x1473f7ab3`. The retained [#285 source](../verification-needed.md#gap-285) evaluates one recipient's life marker plus current party size. Recover the party-wide death history and its reset, departure, rejoin and recipient delivery. Compare with the existing no-death party-clear branch in `account_progression.rs::eligible_cooperative_keys`. |

These observations supply data, verified diagnostic references and source
comparisons. The open consumers above require selected static recovery.
Compilation, authored Rust tests, application and service execution, and
controlled original/rebuilt comparison remain unrun.

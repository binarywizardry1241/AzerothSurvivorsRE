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

The timed Hunter casts share the [proc dispatcher #90](../verification-needed.md#gap-90).
The White Devilsaur variant remains a separate appearance constituent under
[#119](../verification-needed.md#gap-119), with the appearance registry in
[#83](../CURRENT-STATE.md#gap-83).

| Claim | Current observation and source frontier |
| --- | --- |
| `bd0b3730a63334f2` Wyvern Sting | Talent record `0x1473d1d20` points to the startup Frost Trap row (native tag 40) and the Immolation Trap timer at `0x1473d1420` (native tag 39, interval 5.0). The source projects those rows into its existing startup grant and timed freecast payloads. |
| `b6e494b0be86ca3b` Rapid Fire | Talent record `0x1473d09a0` points to native tag 7 at `0x1473d0008`. The four admitted cast keys are Auto Shot, Arcane Shot, Multi-Shot and Concussive Shot. The row selects Aimed Shot with a threshold of six, a rate cap of two and a set count-preservation flag. The source projects it into its existing capped milestone payload. |
| `350e45ff46b443ac` White Devilsaur | The name at `0x1465c8fe5` and save/switch key at `0x1465c8c98` seed the two-actor investigation. The [0.117.0 proof](white-devilsaur-0.117.0.md) and current `run_effects/pets.rs::replace_white_devilsaur` remove the first Raptor and substitute a single variant for the usual Wolf. Map both original actor IDs 9510/9511 into current effect descriptors, then follow independent bite presentation and combat identity through the actor tick and existing creature queries. |

### Timed Hunter casts

The 0.140.0 cast-event caller at `0x145fb8d86` sends kind 3 to
`0x145fbc7c0`. For Rapid Fire the cast selector at `0x145fbd933`
precedes counter increment and saturation at `0x145fbd967..0x145fbd976`.
The flag check at `0x145fbd97c` skips the pre-admission reset.
`0x145fbd993..0x145fbda11` selects the effect-index timestamp row,
dropping timestamps at age 1.0 or older through `0x145fc0512`.
A rejected attempt leaves the capped count intact. The admitted path at
`0x145fbe977..0x145fbe9cd` records the current run time and clears the count
before preparing and dispatching the free cast at `0x145fbea15..0x145fbea5e`.
The existing source milestone decoder and live cast-event callback already
implement these fields. Two attempts may fall within one second, including
when the earlier dispatch finds no target.

For Wyvern Sting, `0x145fb8ac7..0x145fb8b0f` subtracts the frame delta,
loads the selected timer's ability and override, and prepares its free
instance. Cast dispatch at `0x145fb8cac` shares the ordinary ground spell
path. The timer writes the positive override times current recovery, with a
0.25-second floor, following a successful cast. Failure writes 0.3 seconds
at `0x145fb8da0`. The source reuses that live timed path. Its zero-range
Immolation Trap selects the hero position and samples the floor before
publishing the ground spell. The startup Frost Trap and the independent
Counterattack explosive effect keep their own selectors.

The shared Ghidra runner returned `ev_266451b1d5c0afdb1debbc05e6b4fac1744fe917cbe7fec1462bc0ef3f1b23de`
for the counted dispatcher and
`ev_4eab61f91c33f42d5d1a5dfd5127a7d5c35e497ce30a952d5f1f96c50bbbd6c2`
for the timer. Both are exact current PE slices mapped at their original
unwind starts, with input digests
`b0a3a34ba67d4e07d7853bf709fd4546e915757b44a48172039b36dd696b7c48`
and `238fcb524f00b94fb6c5f4ff43fc5849fffaf50dd4f6f6e953d707f6e4625978`.
Instruction review resolves Windows x64 register ownership where the raw
decompiler's signatures are ambiguous. The localized descriptions come from
the installed target's fourteen embedded catalogs. The between-run talent menu reads
those two descriptions from the live talent catalog. Wyvern Sting's spell
tooltip uses the trap key from that same timed effect.

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
| `0009124e18be87bf` Mind Blast and Improved Mind Blast | [#34](../verification-needed.md#gap-34) connects spell 8092's current power and both keyed rank effects. |

### Mind Blast power, cooldown and descriptions

Spell 8092 at `0x1473baaf0` stores raw power bits `0x43036db7` and
cooldown 4.0. The ordinary ×1.4 composition gives neutral base values
of 184 damage and 5.6 seconds. Talent `0x1473d7ae0` retains the key
`imp_mind_blast` and points to two tag-73 rows at `0x1473d70e8`. Both
select `mind_blast` and have amount bits `0x3d75c28f`. Modifier bytes
`+0x24` are 1 (cooldown) and 0 (power), respectively. The native record
contains the per-rank wording at `0x1473d7168`.

The talent catalog uses internal tag 31 for these keyed modifiers. It scales
each lane by the purchased rank, then composes both with other equipped
modifiers through `Equipped::spell_modifiers`. The same spell instance inputs
reach the live damage and cooldown calculations and the run tooltip.
The pre-run picker now displays 184 damage. The talent menu uses the current
per-rank description with the original allocation key and maximum rank.

A read-only PE and source comparison verified the two rows, neutral ability
values, rank scaling at ranks 0–5 and both menu data sources. Compilation,
gameplay and controlled original/rebuilt comparison remain unverified.

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
| `713f1d1f551a5bca` Tranquility credited healing | Talent `0x1473e5948` points to tag 33 at `0x1473e5060`; Tree of Life at `0x1473e5c08` points to tag 32 and a periodic Rejuvenation effect. The live direct and batch paths now add health restored and the actual Tree of Life absorb increase to the pool. [Recovered branches](#tranquility-and-seed-of-life). |
| `6362d8f7e7f22739` Seed of Life critical rolls | The name at `0x1473eba21` and nearby set descriptions seed the effect producer. The live pulse now queues the Feralheart Seed and independently rolls each Nature damage emission, including both empowered hits on a boss, elite or Guardian. [Recovered branches](#tranquility-and-seed-of-life). |
| `96435f933d14094a` Critical-hit proc reach | Blood Frenzy's current effect is at `0x1473e3c68`; Eye of Hakkar is named at `0x1473c6209`. Both Druid producers enter the periodic critical effect lane, including Blood Frenzy and The Eye of Hakkar. They retain ordinary damage logs and generic hit/kill suppression. [Recovered branches](#tranquility-and-seed-of-life). |
| `1d1ef8f6798a0519` Power Word: Shield cap | Recover target maximum-health arithmetic and the Talisman's rank-scaled cap lane through `gameplay/mechanics/shared_healing.rs` and `player_abilities/behavior/buffs.rs`. Distinguish the unmodified capacity, necklace bonus and hard maximum. |
| `74230b7c5f2a2355` Divine Shield lifetime and gap | The current duration and recast helpers use the keyed Talisman lane and previous expiry, with a four-second minimum wait. [Native branches and connected source](#divine-shield-and-immunity-admission). |
| `19c82c058ebc3fb0` Talisman and Ice Barrier | The retained party recipient adds to a separate counted balance with a 100%-maximum-health cap. Recover base initial absorb, earned additions from damage/talents and the item-specific 200% maximum, plus stat refresh and expiry. |
| `5cab7afd57fd7f22` Shields and precedence | The 0.139.2 model uses an ordinary reservation plus a separate shared Ice Barrier balance and permits bounded additive party contributions. Recover replacement when one source absorbs on behalf of another, the stronger-only same-spell rule across two casters, and refresh/expiry when the weaker shield loses. |

### Tranquility and Seed of Life

The direct heal `0x145f9d163..0x145f9d258` and frame HoT batch
`0x145f8d1b5..0x145f8d2a8` search the first raw32 Tree of Life effect,
cap total absorb at the effect fraction of maximum health and add only the
change in absorb to effective health restored. The first raw33 Tranquility
row enables that credit. The direct owner still requires a nonzero spell ID.
Game+0x2a3 suppresses pool credit during a Seed of Life impact without
suppressing healing or absorb conversion.

The Tranquility pulse `0x145fb8e60..0x145fb933a` resets its one-second
pool deadline before selecting targets and consumes one live spell-critical
draw per victim. The first equipped raw70 effect selects a priority victim
within the pulse radius and snapshots a Seed before the first damage event.
The priority query at `0x145fb90be` calls `0x145f872c0`. Its ordinary
partition takes the first ordinary target position at
`0x145f87442..0x145f87454`, then tests the six-yard distance from that
position at `0x14604f497..0x14604f4ac`. The Seed uses the existing
weapon target query for this ordering.
The class-11 branch `0x145e30baa..0x145e30c18` and constants at
`0x1473ea130` produce the two Feralheart eight-piece modes. At three stars
the Seed takes 60% of pulse power, selects five additional targets within
six yards and hits each victim once. At five stars it takes 100%, selects
seven additional targets within eight yards and hits qualifying bosses or
elites or Guardians twice. The predicate at `0x145fb97da..0x145fb97ff`
independently tests primary-boss metadata at actor `+0x30`, the elite
byte at `+0x220` and Guardian metadata at `+0x78`. Canonical hit
`0x145f448d7..0x145f448ef` copies that Guardian field and its lair
index. The death branch at `0x145f45c58..0x145f45cb7` clears the
lair from the same Game `+0x860/+0x868` vector initialized at
`0x145fb0060..0x145fb0098`.

The Seed resolves after 1.5 seconds at the original target's current
position, falling back to its stored position after that target leaves
the actor list. The live saved-loadout selector recognizes the verified
Tier 0.5 armor IDs, active tier 7 and its ordinary/empowered distinction.
The rest of the Tier 0.5 catalog, four-piece effects, acquisition and
equipment presentation remain with [#314](../CURRENT-STATE.md#gap-314).

Blood Frenzy at `0x1473e3c68` and The Eye of Hakkar at `0x1473c6270`
carry raw tag 21 and condition 2, selecting spells 1079 and 12654. The source
represents both as internal tag 9 with the same condition.

The Seed impact `0x145fb9361..0x145fb9a60` emits spell 21070, takes the
primary victim first and draws again immediately before each additional
hit. The ordinary spell 740 and the Seed preserve Nature school and their
own effect-index attribution. Their Game+0x2a4 flag lets critical source-kind
3 hits enter the raw21, condition-2 periodic branch at
`0x145f47a52..0x145f47b80`. This admits the existing Blood Frenzy and
The Eye of Hakkar rows while leaving first-hit tokens, first-critical
tokens, ordinary hit/kill effects and unflagged source-kind 3 hits on
their retained paths.

The journaled Ghidra subjects for `0x145fb8960` and `0x145fbc7c0` are
`ev_95c58da47d4fd6f32b613fd6886b348604482639dc2068afb161b6e744e010d5` and
`ev_f17322f009610bca5c6acc20b402692abb708af3892bd318e66356e0507faae4`.
The existing `scripts/check-tranquility.py` checks 520 critical and 384
healing-credit cases on the selected original instructions, with canonical
hit calls replaced by explicit test seams. It checks f32 thresholds, draw
and hit order, changes to stats or RNG between hits, absorb-cap clipping,
absent effects and the Seed credit flag. The source is parsed and inspected.
Compilation, authored Rust regressions, actual log/meter presentation,
gameplay and original/rebuilt parity remain open.

### Divine Shield and immunity admission

The self-buff dispatch at `0x145f7ea1f..0x145f7ea7f` retains the ordered
35%-health rejection for raw status 12. It then scans live aura rows and
rejects when any raw status 12 row expires strictly after the run clock.
That covers Divine Shield, Will of the Forsaken, Shadowmeld and other
active immunity auras through the shared dispatch. Exact expiry and unordered
deadlines do not block the attempt. A failed attempt does not replace the aura
or advance Divine Shield's timestamp.

The keyed Divine Shield duration at `0x145f7c0af..0x145f7c0fa` is the ordinary
product capped at six seconds when the keyed duration lane is at most one.
When the keyed lane is greater than one, the cast instead uses six seconds
times that lane. The Eternal Talisman's existing duration lane of two gives
12 seconds at its base rank. The minimum recast wait from
`0x145dd4290..0x145dd4333` is `max(10 - duration, 4)`. Admission at
`0x145f80596..0x145f805bb` compares that wait to the run clock minus the
previous shield expiry and stores the new expiry after admission. The
ordinary scheduler independently uses the same keyed duration and wait at
`0x145f8e439..0x145f8e47a` and `0x145f8e4be..0x145f8e625`.
The existing aura, cooldown, cooperative spell text and overlay consumers
share those helpers. The shared Ghidra runner recovered the self-buff dispatcher
as `ev_2c5ebbc39276d1f96d09c345e3d5c804d4edd9338f49e817b75b8d044de1808a` and
the recast helper as `ev_78dda0c8c287baf62c5353172c96c5792bb0cb32fd8792bacfc2a1b7dd4710b4`.
The current contract supersedes the prior
[0.127.0 duration and cast timestamp](divine-shield-0.127.0.md).
The defensive admission check in `scripts/recover-player-ability-behavior.py`
passed 60 immunity cases and 180 recast cases over 6,708 original
instructions. It covered equality, unordered inputs, and admission writes.
Compilation, gameplay and original/rebuilt parity remain open.

## Attack range, pickups, attribution and input

The new `crates/wenilla-rogue/src/game/attacks.rs` diagnostic has 29 verified
references across six candidate extents. `0x145ee2eb2` in `0x145ee2a90`
references line 158, `0x145ee4db8` in `0x145ee4340` references line 137,
and `0x145f78972` in `0x145f743e0` references line 1392. [#318](../verification-needed.md#gap-318)
owns the connected Rogue reach change. The packed grid and hazard work remains
with [#313](../CURRENT-STATE.md#gap-313) and [#41](../CURRENT-STATE.md#gap-41). The
existing attack tick and ordinary spell dispatcher remain the source starting
points for classification.

| Claim | Current observation and source frontier |
| --- | --- |
| `78aee98f2e312f8a` Rogue reach | The [current cast and automatic attack proof](rogue-reach-0.140.0.md) connects the eight-yard Rogue records through their inclusive XY selectors and picker descriptions. |
| `a8f504d63cf96bd3` Rune-hound | [#14](../verification-needed.md#gap-14) connects the current [rune selection and ownership contract](#rune-hound-selection-and-ownership). |
| `ac3ebee1359ef8ca` Amulet confirmation and chat | [#18](../verification-needed.md#gap-18)'s old modal proof identifies native Enter, numpad Enter and shared Escape. `gameplay/mod.rs::confirmation_controls` and `native_overlays/confirmation.rs::decision` still consume the shared just-pressed view. Use the [#310 InputGate filter](input-gate-native-0.139.2.md) to map the current native choice/modal edge into the FrameXML chat input path and recover where it is consumed. The earlier menu picker repair covers a different UI edge. |
| `952bce7492eb0be8` Meter labels and addon attribution | `game/meterlog.rs` at `0x1473c3b20`, `game/meterfeed.rs` at `0x1473c3e30` and Windfury title `0x1473d9684` seed the join. Follow Windfury and each set damage producer to the stable identity, log aggregation and addon rows through [#75](../CURRENT-STATE.md#gap-75) and [#307](../CURRENT-STATE.md#gap-307); compare against source-kind and proc-source adapters in `gameplay/mechanics/callbacks.rs`. |
| `97b441022c8ea419` Run start intent | The [current movement start contract](movement-start-0.140.0.md) connects local directional report bits, prior report state, unchanged admitted XYZ and the host's initial sync restriction to the ready transition. The stock controller, [packet clock](coop-correction-0.123.0.md) and [guest context](coop-start-0.123.0.md) retain their respective owners. |
| `e6cc6393427136d3` Stationary slope height | [#1](../CURRENT-STATE.md#gap-1)'s earlier indoor surface proof covers the current source query boundary. `game/enemy.rs` has current candidate extents at `0x145ee1150` and `0x145ee1720` with Location lines 346 and 377–380. Begin at the accepted stop and stationary facing event in `gameplay/mechanics/actor_frame.rs` and `gameplay/mechanics.rs`; map the actual current native transition and inspect which terrain sample supplies its Z coordinate. |
| `094d1782a8db36a3` The Insane | The exact key occurs at `0x1473e8121` and `0x1473f7ab3`. The retained [#285 source](../verification-needed.md#gap-285) evaluates one recipient's life marker plus current party size. Recover the party-wide death history and its reset, departure, rejoin and recipient delivery. Compare with the existing no-death party-clear branch in `account_progression.rs::eligible_cooperative_keys`. |

### Rune-hound selection and ownership

The 0.140.0 selector at `0x145fd3790` is called from both idle and continuing
fetch paths at `0x145fd2c38` and `0x145fd3455`. Its two admission blocks
(`0x145fd3932..0x145fd399d`, `0x145fd3b9d..0x145fd3bea`) reject in-flight and
reserved rows before applying the planar distance bounds. XP and gold require
distance greater than the hero's pickup stat. Rune kinds 3–5 require instinct 3
and distance strictly greater than the fixed 3.0 at `0x14655815c`. All admitted
kinds retain the inclusive outer bound `leash * 10 + 25 + pickup_radius` and
the instinct/companion-distance ordering.

Ordinary collection at `0x145f56540` uses the same constant inclusively at
`0x145f56a76..0x145f56aae`. It precedes the companion tick in all three
verified call pairs (`0x145e70efd/0x145e70f05`, `0x145f2f8bd/0x145f2f8c5`,
`0x145fad679/0x145fad681`). The ordinary owner at `0x145f56c76` and the
companion sweep and arrival at `0x145fd284a` and `0x145fd33cd` all remove
from the same live list through `0x145f57850`. Each owner grants a rune through
`0x145f60e20` after removal. The companion carries its reward until return.
A hero who walks within three yards of a reserved rune can collect it first.

The [selector](../../crates/azeroth-survivors-re/src/run_effects/loot_companions.rs)
and the [ordinary collector](../../crates/azeroth-survivors-re/src/gameplay/mechanics/pickups.rs)
now share the fixed threshold. The [companion port](../../crates/azeroth-survivors-re/src/gameplay/mechanics/loot_companions.rs)
reuses the ordinary owner's removal path, then carries the reward to the
existing shared rune delivery path. A source regression covers both a five-yard
fetch and the hero collecting at three yards during that fetch, with one
removal and one rune grant in either case.

Ghidra queries used unmodified slices with their original virtual addresses and
verified journal digests. The selector's PE unwind extent is
`0x145fd3790..0x145fd3d9d`, file offset `0x5fd2b90`, SHA-256
`16bd584c7cbb9c610fd7be0594ee3a18e61c71319b4304e3ba4ef5fb57277d46`.
Its shared catalog decompilation result has SHA-256
`02fd046b42ba9a899444fab649bd53029174c62b498f5d49c01ccdbb0134d13d`.
Original x64 instructions confirm the Windows ABI, shared callers and constants.
Isolated replay passed 1,125 selector cases across all four instincts, seven
kind codes, both sides of the radius and reach edges, reservation and flight
exclusions, priority, distance and equal-distance ties. Synthetic pickup/actor
rows, the reservation vector producer and its deallocator are replay seams.
The four changed Rust files syntax-parsed with the pinned formatter.

These observations supply data, verified diagnostic references and source
comparisons. The remaining open consumers above require selected static recovery.
Compilation, authored Rust tests, application and service execution, and
controlled original/rebuilt comparison remain unrun.

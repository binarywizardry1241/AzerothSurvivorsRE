# Class and combat changes

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

[Finding #316](../verification-needed.md#gap-316) owns the Kill Command lifecycle,
with the retained [ordinary pets #6](../verification-needed.md#gap-6),
[jewelry #143](../verification-needed.md#gap-143), and
[set mechanics #242](../CURRENT-STATE.md#gap-242) as dependencies.
The new `crates/wenilla-rogue/src/game/kill_command.rs` diagnostic has 33
verified references in 12 candidate extents. In particular, `0x145f807a9`
within `0x145f7bb40` references line 161, and `0x145fc64fd` within
`0x145fc2760` references line 197. Use the complete diagnostic row to separate
the cast path, effect handling and shared failure paths.

| Claim | Current observation and source frontier |
| --- | --- |
| `d02bb19fb7a35f89` Kill Command, pet admission and Counterattack | Hunter class row `0x1473b8028` points to eleven pool entries at `0x1473b7400`. Slot 5 selects `kill_command`, whose 120-byte row at `0x1473ba208` binds spell 883, power 67, range 35, a 12-second composed cooldown and cast kind 12. The offer owner `0x145fe59e0` checks composed pet effects rather than waiting for a visual spawn. Its collector `0x14602c5f0` reads tag 42 and leaves the original Wolf, Raptor and Matriarch descriptors eligible even when stat 32 filters special pets. Source offers use the same effect-derived grants. The adjacent Explosive Trap row `0x1473ba190` and Counterattack's keyed effect `0x1473d1328` still route spell 13812 independently. |
| `406566b77dfca87b` Heart of the Packlord | Constructor `0x145deb11c..0x145deb286` uses the new title and copies tags 61–63 from `0x1473c4640`, `0x1473c4680` and `0x1473c46c0`. It keeps the adjacent Earthshaker constructor. Save reader `0x145e0b81d..0x145e0b89b` maps the old 24-byte legendary key onto `legendary:kill_command`. The current source catalog, save reads and Seen writes, cooperative Seen admission, descriptions and pet callbacks carry the replacement. |
| `294bc25772dd45de` Giantstalker eight-piece | `0x145e32b56..0x145e32bfe` writes two keyed native tag 73 effects. Modifier 1 receives `0.2 × set_multiplier` and modifier 0 `0.3 × set_multiplier`. The current set override feeds these through the existing cooldown and power lanes, including the five-star multiplier. |
| `4ce9c90071dde8fd` Beastmaster Matriarch | Mode 1 at `0x145e30c4e` and mode 2 at `0x145e30edf` both grant native tag 42 with descriptor `0x1473e6d38` and add tag 64 with the mark-only bonus 0.5 or 1.0. The descriptor carries entry 9532, model 5238, scale 0.3, period 1.2 and bite base 100.5, 150% of Wolf 67. The attack owner reads mark GUID `Game+0xc28` and the tag 64 row for the normal bite and command hit separately. The source uses the current eight-piece descriptor and publishes the Matriarch through the existing pet and creature-query path. The broader Tier 0.5 reward and four-piece work remains with [#314](../CURRENT-STATE.md#gap-314). |

<a id="kill-command-recovery"></a>

The cast table at `0x147afad20` sends kind 12 to `0x145f7c182`. The
`0x1460369a0` collector accepts the three original combat descriptors in
stored order and skips an active command. `0x145f27eb0` uses the player's
position and the spell range, sorts assigned targets behind unassigned ones,
and prioritizes bosses, elites and marked targets. The caster publishes the
spell, assigns targets round-robin and starts a two-second command window.
The queue stores the composed ability power multipliers, not an ordinary pet
bite snapshot. The [White Devilsaur constituent](../verification-needed.md#gap-119)
changes appearance while preserving those combat identities.

The pet tick at `0x145fc2760` continues a live target, reacquires from the
pet within 12 yards when needed, and uses the existing collision and pet
motion ports for the 30-unit/second charge. The strike gate uses a 3.5-yard
reach and runs one strike, or three for Raptor with 0.2 seconds between
strikes. `0x145fc338c..0x145fc3729` composes descriptor damage × 1.4,
live damage and pet stat 17, stored upgrade and set power, and a per-pet
strike coefficient of 2.8 (Wolf), 0.945 (Raptor) or 2.1 (Matriarch).
Matriarch's mark factor applies before the per-strike critical draw. Source
retains the pet's melee event and Kill Command combat attribution.

`0x145f271e0` clears the command and resumes the ordinary bite deadline
before checking the accumulated pre-crit damage. A positive result enables
Packlord's equipped row. Wolf spell 24604 marks up to six enemies around
the saved impact position in radius 10 for five seconds and adds its
rank-scaled damage-taken amount, capped at 20%. Raptor spell 11977 installs
five bleed ticks for its scaled share of accumulated strike damage, around
the impact in radius 6. Matriarch spell 20549 applies its scaled shockwave
in radius 6 while excluding the direct target. These use the existing
actor hit, aura and periodic queues. Native `0x145f27930` and
`0x145f27a05` carry the equipped effect index through the Raptor bleed row.
The Matriarch shockwave puts the same kind-1 provenance and effect index at
`Game+0x20/+0x28` before calling the common damage owner. The source feeds
both into the existing meter provenance resolver, while the direct strikes
use the native `Wolf Bite`, `Raptor Strikes` and `Crushing Bite` breakdown keys.

Fourteen selected name, description and breakdown keys were verified through
all fourteen embedded locale descriptors and appended to their corresponding
source catalogs. The class picker and reward card resolve
`ability.kill_command.name`, and use the literal description beginning
`Commands each of your pets` where the current target has no `.desc` entry.
The Packlord constructor uses the literal name and its three parameterized
effect keys. Beastmaster uses `set.hunter.7` and the two separately recovered
Matriarch bite descriptions. The existing local and party meter presentation
uses the literal attack and pet keys. The broader Tier 0.5 catalog and meter
protocol work remain separate.

The current PE supplied the descriptor/constructor bytes and direct x64
instructions. Journaled Ghidra queries independently covered the three
owners below. Each maps raw offset zero to the original VA. Detached
queries lack the external jump table and globals, so the full PE instruction
and data reads resolved those references.

| Bounded owner | Exact slice SHA-256 | Saved Ghidra result SHA-256 |
| --- | --- | --- |
| `0x145f7bb40..0x145f80854` cast dispatcher | `fcd3fbcb42fa4963c81fde9208b8eff15f63b7cf9e8f3ecd238bf7040c2cf09d` | `fc7a4461b0825d0cf62b2bfb28c4361822ed0e63bf90f5e2e6a3648121150db6` |
| `0x145fc2760..0x145fc663c` pet tick | `433f7dec65b11be75a363ee1ee48d07ff84749627e106bd07e0c7f6153db602f` | `babdb7859e26c63317974a1fc7c9428327a884c45f3dc6b10e6d2d88cd20130e` |
| `0x145f271e0..0x145f27ab8` command completion | `e154395f955c7b0757157a1502b675eecb07a2367c5943ae244bf7a19c9e6f0e` | `403b272896973aec141de96b84e6a304722d6150f3ceb08c5bc9b46437ccde3a` |

### Pet priority, Packlord ownership and Matriarch presentation

The initial command and 12-yard reacquisition both use `0x145f27eb0`.
The comparator `0x145edfa30` sorts unassigned targets before assigned
targets, then uses target tier and Hunter's Mark within the tier. A protected
boss drops to the elite tier unless exposed. Active Guardians and live wards
with a parent share the elite tier. The existing ward and raid defense state
supplies those conditions. Reacquisition resets the movement deadline while
retaining the strike deadline.

Packlord's Wolf completion removes an existing contribution from the same
owner before appending its new howl (`0x145f271e0..0x145f275e0`).
The hit consumer `0x145f4333b..0x145f434c9` uses the active hero's own
entry and excludes pet hits and the Packlord bleed. Each Raptor completion
appends its own five ticks at `0x145f27930..0x145f27983`. Their shared
victim may therefore retain overlapping bleed applications.

At `0x145fb7c96`, the Matriarch's display scale uses the descriptor's
0.3 multiplied by 1.25, while collision retains the original descriptor.
The addon pet serializer `0x146068840..0x146068d8c` reads the combat
descriptor for entry 9532, key `devilsaur_matriarch`, name Devilsaur
Matriarch, kind `pet`, and the explicit Beast Taming icon. The live
addon adapter recognizes this entry, including when it appears beside
White visual variants.

Six saved Ghidra results were checked against exact source slices and the
installed PE digest. Rust syntax and the modified source paths were checked.
Compilation, gameplay, co-op, addon runtime and original/rebuilt parity
remain open.

The timed Hunter casts share the [proc dispatcher #90](../verification-needed.md#gap-90).
The White Devilsaur variant remains a separate appearance constituent under
[#119](../verification-needed.md#gap-119), with the appearance registry in
[#83](../CURRENT-STATE.md#gap-83).

| Claim | Current observation and source frontier |
| --- | --- |
| `bd0b3730a63334f2` Wyvern Sting | Talent record `0x1473d1d20` points to the startup Frost Trap row (native tag 40) and the Immolation Trap timer at `0x1473d1420` (native tag 39, interval 5.0). The source projects those rows into its existing startup grant and timed freecast payloads. |
| `b6e494b0be86ca3b` Rapid Fire | Talent record `0x1473d09a0` points to native tag 7 at `0x1473d0008`. The four admitted cast keys are Auto Shot, Arcane Shot, Multi-Shot and Concussive Shot. The row selects Aimed Shot with a threshold of six, a rate cap of two and a set count-preservation flag. The source projects it into its existing capped milestone payload. |
| `350e45ff46b443ac` White Devilsaur | The spawn constructor `0x145fb7990` applies the visual substitution separately to Wolf and Raptor while preserving their combat descriptors. Source now takes the switch through spawn, publishes White Devilsaur creature identity and display, and leaves the actor count and bite paths independent. |

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

### White Devilsaur appearance

The independent switch at run offset `+0x2d8` is read at `0x145fb7ac3`.
The native spawn constructor keeps the input descriptor in `rdi` and chooses
a visual descriptor in `r13` at `0x145fb7acf..0x145fb7af9`.

| Combat descriptor and entry | White visual descriptor and entry | Display / scale | Ordinary bite base / period |
| --- | --- | --- | --- |
| `0x1473e6cb8` / 9510 | `0x1473e6c78` / 9530 | 5239 / 0.3 | 67 / 1.2 s |
| `0x1473e6cf8` / 9511 | `0x1473e6428` / 9531 | 5239 / 0.3 | 53 / 1.2 s |

The visual entry enters the creature GUID at `0x145fb7af9..0x145fb7b2a`
and the display comes from the visual descriptor at `0x145fb833a`.
The 126 attack-time update reads the original period at `0x145fb810d`.
The 129 and 130 collision fields read original scale at `0x145fb81d3`.
The active actor row stores the **original** combat pointer at `0x145fb866b`,
so the ordinary attack and Kill Command selectors still see the Wolf or
Raptor, even while creature queries select the two White variants at
`0x145ea6b58` and `0x145ea6b70`.

The source carries the existing point-free allocation flag to follower spawn.
The original effect rows, provenance, grant order and combat descriptor stay
intact. Each grant independently selects its White GUID, entry, scale and
display. The localized switch text describes the two appearances and retains
the existing talent requirements.

Ghidra evidence `ev_2c6bdb5360148a365f3142d8e6b974745fa06316cd2bce68038f11112d95a41c`
maps the exact slice `0x145fb7990..0x145fb8765` at its original unwind start
with SHA-256 `2b7dd011c86890a4bc7ca6b2b4d3d0c29f373218c170c5143764845c85389ee0`.
This supersedes the old actor replacement under [0.117.0](white-devilsaur.md).
Compilation, authored regression execution, rendered appearance, actual combat
and original/rebuilt parity remain open.

## Enhancement, Consecration and Mind Blast

[#305](../verification-needed.md#gap-305) retains the [0.139.2 Enhancement
proof](enhancement.md). Current `game/enhancement.rs:124` is referenced
by `0x145f8f2bb` within `0x145f8c810`. The historical proc driver, repeat rules
and necklace scaling supply correspondence candidates. Continue through that
dispatcher and the ability/setup consumers instead of assigning current
semantics from the old addresses.

| Claim | Current observation and source frontier |
| --- | --- |
| `54b0f4d4dce2fdd3` Sweeping Storm | Record `0x1473da5a8` points to effect `0x1473d9c08`, which carries keyed `stormstrike` target modification. Recover the distinct rank-3 damage branch for the base cast and Windfury; this descriptor alone covers the target lane. `run_effects.rs` still needs the active Enhancement effect integration tracked by #305. |
 | The rank-three 1.2 multiplier reaches ordinary Stormstrike and Windfury strikes. The keyed target lane retains the current two-target cap. [Current native and source paths](enhancement.md#enhancement-mechanics-in-01400). |
| `a5da6b75f752b792` Eye of the Tempest first line | Item title `0x1473c4333` and `stormstrike` at `0x1473c4248` seed the current jewelry constructor. The exact concatenated changelog phrase was absent from the PE literal search. Recover the tooltip formatter/key and target qualifiers independently from the actual damage selector. |
 | The first line uses the native boss/elite text and the Stormstrike label. The underlying stat 19 consumer uses its independent target predicate. [Current native and source paths](enhancement.md#enhancement-mechanics-in-01400). |
| `73fd9cecd0fb1234` Rockbiter base power | The 120-byte descriptor at `0x1473bb450` stores spell 8017, raw power 66 and range 10. Follow the current startup replacement and the cast/tooltip composition to recover the effect of that raw value. The checkout does not have the ordinary Rockbiter startup/picker descriptor. |
 | The current 66-power descriptor feeds the Rockbiter Initiation startup replacement and the localized 92-damage picker. [Current native and source paths](enhancement.md#enhancement-mechanics-in-01400). |
| `c4b20ed37f977743` Windfury branching | The `enh_windfury_weapon` descriptor `0x1473da188` points to tag 54 subtype 4 at `0x1473d96a8`. Its description mentions two strikes. Recover the separate three-strike branch, random draw order, rank thresholds and repeat handling at `0x145f8c810` and its callees before registering the 25%/12.5% split. |
 | Rank three uses one draw with ordered thresholds 0.25 and 0.375 for two or three full extra strikes. [Current native and source paths](enhancement.md#enhancement-mechanics-in-01400). |
| `ee384828482e8aa6` Flametongue Fire Nova | Descriptor `0x1473da238` points to two tag 54 rows at `0x1473d9778`; neither stores the live scalar as a plain damage value. Resolve their rank consumers and proc attribution through #305 and compare the shared Fire Nova path. |
 | The free Fire Nova uses the current rank power table, including the rank-three 50% bonus. [Current native and source paths](enhancement.md#enhancement-mechanics-in-01400). |
| `13db93523900cc83` Eye of the Tempest damage | The later supplied line adds Guardians to the target conditions. Use `jewelry.rs` candidates `0x145df4440`, `0x145e131e0`, `0x146064c90` and the actual Stormstrike hit consumer to distinguish boss/elite/Guardian flags and test where the modifier enters scaling. |
 | The shared stat 19 consumer admits bosses, elites and Guardians without a spell-specific test. [Current native and source paths](enhancement.md#enhancement-mechanics-in-01400). |
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
The exact description key and value were checked against each of the
fourteen native locale payloads. The Priest and two current Hunter talent
rows are loaded from the 0.140.0 replacements asset so the historical
talent catalog remains available with its original audit hash.

A read-only PE and source comparison verified the two rows, neutral ability
values, rank scaling at ranks 0–5 and both menu data sources. Compilation,
gameplay and controlled original/rebuilt comparison remain unverified.

## Healing and defensive capacity

Use [#176's Tranquility recovery](../verification-needed.md#gap-176) and
[#288's defensive findings](../verification-needed.md#gap-288), preserving the
historical [Ice Barrier](ice-barrier.md) and [Divine Shield
lifetime](divine-shield.md) contracts. The current spell rows for Power
Word: Shield, Ice Barrier and Divine Shield are at `0x1473babe0`,
`0x1473bb9f0` and `0x1473b9dd0`. The Eternal Talisman title is at
`0x1473c428f`. Use the current `abilities.rs`, `auras.rs` and `jewelry.rs`
Location rows to recover the new cap, admission and replacement branches.

| Claim | Current observation and source frontier |
| --- | --- |
| `713f1d1f551a5bca` Tranquility credited healing | Talent `0x1473e5948` points to tag 33 at `0x1473e5060`; Tree of Life at `0x1473e5c08` points to tag 32 and a periodic Rejuvenation effect. The live direct and batch paths now add health restored and the actual Tree of Life absorb increase to the pool. [Recovered branches](#tranquility-and-seed-of-life). |
| `6362d8f7e7f22739` Seed of Life critical rolls | The name at `0x1473eba21` and nearby set descriptions seed the effect producer. The live pulse now queues the Feralheart Seed and independently rolls each Nature damage emission, including both empowered hits on a boss, elite or Guardian. [Recovered branches](#tranquility-and-seed-of-life). |
| `96435f933d14094a` Critical-hit proc reach | Blood Frenzy's current effect is at `0x1473e3c68`; Eye of Hakkar is named at `0x1473c6209`. Both Druid producers enter the periodic critical effect lane, including Blood Frenzy and The Eye of Hakkar. They retain ordinary damage logs and generic hit/kill suppression. [Recovered branches](#tranquility-and-seed-of-life). |
| `1d1ef8f6798a0519` Power Word: Shield cap | [Current recipient and self capacity](shield-capacity.md) connect the Talisman rank modifier and the 200% maximum. |
| `74230b7c5f2a2355` Divine Shield lifetime and gap | The current duration and recast helpers use the keyed Talisman lane and previous expiry, with a four-second minimum wait. [Native branches and connected source](#divine-shield-and-immunity-admission). |
| `19c82c058ebc3fb0` Talisman and Ice Barrier | [Current counted balance](shield-capacity.md) retains the composed cast and capped party additions, with the necklace capacity lane connected through damage, expiry and refresh. |
| `5cab7afd57fd7f22` Shields and precedence | [Current same-spell reservation rules](shield-capacity.md) connect stronger-only ordinary party absorption, the shared aura refresh and recast accounting. |

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
[0.127.0 duration and cast timestamp](divine-shield.md).
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
| `78aee98f2e312f8a` Rogue reach | The [current cast and automatic attack proof](rogue-reach.md) connects the eight-yard Rogue records through their inclusive XY selectors and picker descriptions. |
| `a8f504d63cf96bd3` Rune-hound | [#14](../verification-needed.md#gap-14) connects the current [rune selection and ownership contract](#rune-hound-selection-and-ownership). |
| `ac3ebee1359ef8ca` Amulet confirmation and chat | [#18](../verification-needed.md#gap-18)'s old modal proof identifies native Enter, numpad Enter and shared Escape. `gameplay/mod.rs::confirmation_controls` and `native_overlays/confirmation.rs::decision` still consume the shared just-pressed view. Use the [#310 InputGate filter](input-gate-native.md) to map the current native choice/modal edge into the FrameXML chat input path and recover where it is consumed. The earlier menu picker repair covers a different UI edge. |
| `952bce7492eb0be8` Meter labels and addon attribution | `game/meterlog.rs` at `0x1473c3b20`, `game/meterfeed.rs` at `0x1473c3e30` and Windfury title `0x1473d9684` seed the join. Follow Windfury and each set damage producer to the stable identity, log aggregation and addon rows through [#75](../CURRENT-STATE.md#gap-75) and [#307](../CURRENT-STATE.md#gap-307); compare against source-kind and proc-source adapters in `gameplay/mechanics/callbacks.rs`. |
| `97b441022c8ea419` Run start intent | The [current movement start contract](movement-start.md) connects local directional report bits, prior report state, unchanged admitted XYZ and the host's initial sync restriction to the ready transition. The stock controller, [packet clock](coop-correction.md) and [guest context](coop-start.md) retain their respective owners. |
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

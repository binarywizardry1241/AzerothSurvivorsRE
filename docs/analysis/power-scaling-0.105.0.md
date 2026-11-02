# Weapon and ordinary combat-pet power — 0.105.0

Current ordinary source/contracts: [0.110.0 recovery](ordinary-weapons-pets-0.110.0.md). This report and its 785-case record retain their actual 0.105.0 provenance; current implementation limits are in [verification-needed](../verification-needed.md).

Selected target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the stat16 weapon and stat17 ordinary pet consumers. Current
overall implementation status remains in [verification-needed](../verification-needed.md).

## Recovered contracts

The current native numeric payload is variant35. The retained older talent
catalog uses its historical variant30 representation; the selected coefficients
and consumers below have been independently checked against this target. This
does not revalidate the entire historical catalog or its raw pointers.

The current stat-refresh owner clones the equipped stat vector into scratch
storage before adding temporary contributions. Weapon16 and pet17 read the
equipped vector directly, accumulating matching rows from negative zero before
adding one. Temporary effects still reach the general outgoing-damage and
recovery fields through their existing consumers; they do not become extra
weapon16/pet17 rows.

### Weapon swings

Current inline owner `145902c51..145902f6b`, miss tail `145904029..14590404f`
and ordered query `145925e50` are bound by the
[weapon manifest](evidence/0.105.0/power-scaling/weapon/manifest.json).

| Class | Base damage | Base interval | Range |
| --- | ---: | ---: | ---: |
| Warrior | 27.5 | 1.6 | 6 |
| Paladin | 27 | 1.8 | 6 |
| Rogue | 14 | 1.2 | 6 |

Other supported classes have no weapon stage. The actual class table, rather
than equipped weapon appearance or a learned spell, supplies these profiles.
Game+538 begins at positive zero, proven by the constructor's aggregate store
and final copy. A due frame produces at most one swing. No target sets the
retry timer to .15 without a critical draw.

Each successful swing computes `(1 + sum16) * (base_damage * 1.5)`, draws one
shared-RNG critical sample, multiplies by current outgoing damage, then applies
the critical multiplier when chance is strictly greater than the sample. The
melee packet precedes the synchronous canonical hit with spell0, school0 and
source0. Its spell-damage log is suppressed. Only after the hit and its callbacks
does the timer read current recovery: `sqrt(cooldown) * (base_interval * 1.2)`.
Separate f32 operations are preserved. Its recovery input folds active aura9
contributions into raw recovery, adds one and takes one reciprocal, avoiding a
round trip through the already converted cooldown multiplier.

The query orders live actors by distance and native priority. Its ordinary
six-unit health-sorting partition is centered on the **first ordinary target**,
including when the query center is elsewhere. Avoided actors retain their own
partition. Current instruction vectors include large sets and equal-key ties.
Current Improved Heroic Strike and Unbridled Wrath records independently bind
stat16 coefficients .05 and .04 per rank. The current
[rank owner](evidence/0.105.0/power-scaling/ranks/manifest.json) confirms the
raw35 magnitude multiplication by the selected rank; source fixtures exercise
the retained catalog's internal30 representation of these same coefficients.

### Ordinary combat pets

The [creation manifest](evidence/0.105.0/pet-creation/manifest.json) binds the
current constructor, raw29 collector and selected producers. The catalog retains
all thirteen current descriptors; only verified special0 grants are connected:

| Talent | Permanent pets |
| --- | --- |
| Tame Beast | Wolf |
| Bestial Wrath | Raptor |
| Stormstrike | Two Spirit Wolves |
| Water Elemental | Water Elemental |
| Force of Nature | Two Treants |

Grants preserve catalog and payload order. Creation uses the shared object
serial, native creature GUID layout, terrain height, current model/scale, unit
fields and startup ring angles. The first update is at creation+1 second;
subsequent updates use current time+.25. The live adapter publishes actual unit
creation and movement into the existing client.

The [tick fixtures](evidence/0.105.0/power-scaling/pet-tick/native-tick.json),
[Ghidra helper identities](evidence/0.105.0/power-scaling/pet-tick/helpers-manifest.json)
and [bounded loop](evidence/0.105.0/power-scaling/pet-loop-rea.json) bind ordinary
target retention, player leashes, movement, attack deadlines and projectile
payloads. Melee queries use radius26 and new-target player distance<28; retained
targets use player distance<32. Ranged queries use radius28. Movement speeds
include active movement auras. Terrain and the shared movement serial come from
the existing live world and run.

Both melee and ranged attacks compute, in separate f32 operations:

`base_damage * ((level - 1) * .12 + 1) * current_damage * (sum17 + 1)`.

The ordinary pet interval is its descriptor interval, without the ordinary
spell cooldown multiplier. Each admitted attack draws one critical sample.
Current Hunter Unleashed Fury and Bestial Discipline records share a .20-per-rank
stat17 row; its bytes are retained once in the creation fixture.

Melee emits its own packet before a source2 canonical hit. Water Elemental
Frostbolt snapshots power, critical result, school and source2 into the actual
pending queue. Its travel time is horizontal distance/28. It emits a spell-damage
log and applies a .3 slow for two seconds. Nonpositive or unordered projectile
power skips damage while preserving the status callback; melee still uses the
canonical minimum-damage rule.

## Source ownership and validation

`run_effects/weapon.rs`, `pets.rs`, `pet_tick.rs` and `pet_power.rs` own the pure
contracts. `gameplay/mechanics/attacks.rs` and `pets.rs` connect actual equipped
stats, actors, RNG, terrain, run serial, execution queues and canonical hit/death
callbacks. The weapon stage precedes ordinary casts; the pet stage follows the
healing pool and precedes class-special ticks and pending impacts. Deferred
source attribution is captured separately from freecast provenance. Spell0
bypasses ability lookup, matching the current
[selector gates](evidence/0.105.0/power-scaling/zero-spell/manifest.json).

Native validation passed **785 bounded cases**: 28 weapon, 15 weapon queries,
3 timer initialization, 576 pet arithmetic, 60 pet tick, 12 projectile payload,
8 pending damage gates, 24 creation/angle/GUID, 15 selected rank, 38 spell0
selector and 6 recovery cases. The
[pet power fixture](evidence/0.105.0/power-scaling/pet-power/native-power.json)
records raw float bits. The scripts stage reproducible output under ignored
`runtime/` before curation. Native calls use declared allocation, terrain,
target-query, packet, clock or supplied-sample seams as appropriate; instruction
execution does not constitute an original game session.

Rustfmt parsed the changed source and whitespace checks passed. The source
fixture tests and five application regressions are authored but unrun.
Compilation did not reach the reconstruction crate before cancellation; its
disposable build output was removed. Current work is source-only, with no
further compiling checks. No original/rebuilt application, audio or real-MPQ
gameplay comparison has run for these changes. The compact
[validation record](evidence/0.105.0/power-scaling/source-validation.json)
identifies the source and the limits of these checks.

## Remaining boundaries

The new Demonology special1..8 companions, their new talent catalog, temporary
summon producers and special attack consumers are not substituted with the
ordinary pet planner. The old Demonic Pact producer is not current-target proof.
Those lifecycle and class-specific behaviors remain open. The generic stat17
arithmetic is recovered, but this change does not establish those special pets'
live fidelity. Existing talent rank execution and unrelated catalogs retain their
own version-bound evidence.

Interactive pet rendering, terrain motion, target selection and combat still
need controlled original/rebuilt comparisons. Current source checks alone do
not establish full gameplay, visual, audio or Windows parity.

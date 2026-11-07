# Heroic gameplay consumers

This report owns the gameplay consumers of finding #219. The installed target is
0.121.0, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [native manifest](evidence/0.121.0/heroic-twists/manifest.json) binds 33 exact
instruction ranges, 13 data ranges and eight completed durable Ghidra operations.
The [source receipts](evidence/0.121.0/heroic-twists/source-static.json) identify
the reviewed source fragments separately. [verification-needed](../verification-needed.md)
owns current implementation status. Compilation, execution and original/rebuilt
parity remain unverified.

The [Heroic core](heroic-source.md) owns the five 48-byte descriptors and
shared scalar selectors. Authored descriptions identify the twists; the actual
conditions and values below come from their executable consumers. The run
constructor copies the selected rank into `Game+0x36f`; the current live source
passes `RunRules.heroic_rank` through the following owners. Historical public
helpers retain Normal-rank wrappers for their existing callers.

| Authored twist | Current native behavior | Connected source |
| --- | --- | --- |
| Less warning | Every nonzero rank multiplies the requested danger duration by 0.85 before adding the current clock. | `bosses/raid_areas.rs`, all `Area::danger` callers and the inline circle/wave constructors in `raid_shapes.rs`; live `BossCombat::heroic_rank`. |
| Elite packs | After a successful first elite creation, a nonzero rank searches its returned GUID, interpolates its position at the current clock and requests the same enemy at offset `(2.5,1,0)`. A missing actor prevents the second request. | `enemies/waves.rs::tick_elite_for_rank`, live `SpawnAdapter::enemy_position`. |
| Relentless | Rank II or greater uses ordinary/enraged repeat factors 0.8/0.6; lower ranks use 1/0.7. The existing below-30% enrage latch remains distinct. | `bosses/ai.rs`, `raid_area_catalog.rs`, live primary-boss tick. |
| Wardens | Rank II or greater changes per-kill HP/damage additions from 0.25/0.05 to 0.35/0.07 and lair refill from 180 to 150 seconds. Current rank descriptor multipliers are applied after the existing stat arithmetic. | `guardians/scaling.rs`, `guardians/mod.rs`, live guardian scaling, death and lair scheduling. |
| Lean purse | Rank III or greater starts with one free reroll plus the purchased account perk and cache price 25; lower ranks start with three plus perk and price 20. Next cache price is saturating `u32(f32(paid)*1.3 + increment)`, with increment 6.25/5. | `treasure_chests/mod.rs`, live constructor/chest state and `set_account_grants`. |
| Affix | Rank III/IV selects one horde affix; rank V selects two distinct affixes. | Shared Heroic selection/calendar and the independently owned affix gameplay consumers; this report does not duplicate their evidence. |
| Old mechanics | Ranks below IV suppress native tags 12 and 26. Phase latches, blocking state and collected requests remain; announcements are gated after collection, while queued execution is gated before actor lookup. | `bosses/abilities.rs`, primary phase publication, `guardians/signatures.rs`, live deferred raid queue. |
| Unforgiving | Positive aggregate failed-mechanic damage uses factor 3 at rank IV or greater, otherwise 1 in Endless or 2 outside Endless. Marker and clock publication occurs first. | Live `BossCombat::raid_damage_multiplier`, retaining the existing aggregate hazard resolver order. |
| Withering | Rank V or greater halves healing before clamping/overheal conversion; regeneration and accumulated HoTs are scaled before their shared clamp. Revives require 9 rather than 6 seconds and restore 0.3 rather than 0.5 of maximum HP. | General/manual healing, batch healing, Restoration, totem prepulse, Voidwalker, party immediate-heal receiver, `coop/game_party.rs` and live revive HUD. |
| Council | After a scheduled final-bit boss creation at rank V or greater, the shared RNG selects one of entries 0–3 and creates it with 0.6 HP. The constructor parameter scales HP after party scaling and leaves damage unchanged. The ordinary Endless spawn branch is unaffected. | `bosses/spawning.rs::tick_for_rank`, live scaled `BossSpawner` creation. |

## Exact consumer boundaries

The general healing owner is `145bd10e0..145bd138f`. Its rank table
`14768f420` contains 1/0.5. Inline paths independently retain the same ordering:
leech at `145bfee64`, totem prepulse at `145bffd11`, secondary direct healing at
`145c000fb`, Restoration at `145c2f36d`, party immediate healing at `145c2142b`
and Voidwalker at `145c3a0ef`. Voidwalker selects 2.5/1.25 directly. Already
applied prepulse and Voidwalker results only publish their fields/meters; they
do not pass through the general heal owner again.

The source correlation check also scans executable sections for every exact
RIP-relative LEA reference to that healing table. Its 12 sites include the
level-up owner at `145be411b`, actor-hit leech/secondary lanes at
`145c0dfad`/`145c0ea2a`, and actor-death leech/healing-on-kill lanes at
`145c16bb5`/`145c17b88`. The existing live level-up, hit and death paths already
route these amounts through `PendingHealing`, so its rank gate covers them
without another application. This bounded reference scan does not claim to
enumerate arbitrary indirect references to the table.

The same current death lane exposes a meter attribution defect: heal-on-kill
used the source's generic Leech override. It now uses its own `on_kill` factory
and the exact native `Healing on Kill` / `Spell_Shadow_DeathPact` metadata,
with the non-talent flag. The amount, rank scaling, clamp and anonymous
spell-zero behavior retain their existing shared path.

The batch owner `145bcb438..145bcb794` combines regeneration and HoTs before
one clamp. It keeps original individual HoT row amounts in
`row_amount * effective / scaled_total`; the source deliberately preserves
that arithmetic. Effect20 converts only excess HoT healing to absorb; effect21
receives the scaled HoT total. Immediate general heals retain their separate
effect20/21 behavior.

That batch owner also supplies the current gear/set tag13 regeneration
consumer. `Game+0x518 * maximum_HP` is admitted only after at least three seconds
since `Game+0x5a8`, then added to flat `Game+0x4ec`, multiplied by elapsed time
and finally Withering. NaN elapsed-since-hit suppresses the conditional term.
The incoming damage owner loads the current `Game+0xc74` clock at `145bcdde8`
and writes it to `Game+0x5a8` at `145bce5ec` after subtracting actual damage.
The live source uses `Numeric.calm_regen` and the existing
`IncomingState.last_hit_at`. The historical `regeneration_fraction` component
remains separate from this conditional lane.

The independently owned [set-consumer proof](evidence/0.121.0/set-consumers/manifest.json)
binds the numeric producer: dispatch table `147692ddc` entry13 reaches
`145bd2d21`, which adds the row's `f32` to XMM10. `145bd2af5` retains that lane
at frame `-0xc`; `145bd3099` reloads it and `145bd309e` stores `Game+0x518`.
`Numeric::apply_gear` feeds tag13 into `calm_regen`, linking its ordinary gear
and four-piece set producers to this one runtime gate.

Revive selectors are present independently in cooperative update
`145bbc30d..145bbc345`, progress `145bb880a..145bb8835` and actual restored
health `145bc4f2d..145bc4f59`. `Party.heroic_rank` is captured from the run;
both authority payloads and the local HUD use the same duration selector.

Guardian HP/damage owners `145c4e9e0`/`145c4eed0` load the rank descriptor only
for valid I–V ranks and otherwise use multiplier 1. The lair-death owner
`145c17cce..145c17d3c` increments the shared kill counter even for an invalid
lair index; only a valid lair is cleared/rescheduled. Its wrapping kill count,
curve/polynomial selection, difficulty, Endless and party arithmetic remain in
their existing owners.

The current phase gate is `145c1f38f..145c1f3cc`; queued admission is
`145c21a12..145c21a34`. These are separate from guardian repeat timing, which
retains its existing nonlatched health gate. Relentless's factor is applied to
primary boss timers in `145c20017..145c2003f`, using the cached rank selection
at `145c1d012`/`145c1d57a`.

The full danger constructor `145bf1f80..145bf21ac` increments the shared serial,
resolves terrain through primary/secondary/fallback paths and appends one
128-byte hazard record. Rank timing changes only `end = now + duration*factor`.
Raw actor cast/hold durations, follow-lock deadlines, periodic expiry, impact
damage and explicit warning-lead overrides retain their original durations.
Inline wave constructors multiply the complete `index*step + windup` once.
Shorter warnings therefore also move the existing expiry/impact boundary; the
effect is not limited to marker presentation. The separately recovered movement
predictor can use the same factor for projection without scaling this deadline
again.

The retained dispatcher Ghidra result explicitly stops at its external switch
table. Source correspondence therefore also uses its original instruction bytes
and the current 32-entry table at `147692f84`; an incomplete decompiler rendering
is not treated as a complete dispatcher body. The common constructor's own
Ghidra result and all of its instructions are complete within the stated seams.
The source receipt follows the dispatcher conditional control flow, including
its explicit nested table, and binds the 13 distinct common-constructor call
sites plus the inline factor-table references. Calls into other functions are
not recursively expanded by that correlation check.

Constructor cache/reroll selectors occur at `145bdcbd9`, `145bdcc95` and
`145bdcf30`, with final stores at `145bdd6d6`/`145bdd348`. The final aggregate
copy maps them to `Game+0xcd0` and `Game+0x598`. `AccountGrants` still carries
the retained three-plus-perk total; its live admission translates only the base
to the current rank's one/three before granting choices. Cache purchase
`145c2f060..145c2f0ad` supplies the quarter-increment arithmetic, including
saturation at the integer boundary.

The elite branch is `145c2a016..145c2a112`. Council's rank/final-bit gate and
full RNG transitions are `145c2bad7..145c2bb77`. Its rejection step discards
draws whose bit61 is set and selects the accepted high two bits. Existing
`uniform_index(4)` uses that same draw contract. The boss constructor moves its
HP factor from XMM2 to XMM6 at `145c27635`, then multiplies the completed HP
value at `145c27a27`.
The source check independently matches the existing ordered boss IDs and final
flags for all 60 rows in the current twelve five-entry zone tables, which are
the catalog inputs used by the Council gate and earlier-boss selection.

## Static validation and limits

```sh
python3 -B scripts/check-heroic-twists.py
```

The check verifies selected installed bytes and durable query provenance, then
executes original x64 instructions in synthetic memory. Cases cover 400 general
heals, 168 guardian HP/damage pairs, 24 lair deaths, 48 failed-mechanic totals,
264 phase and 264 queued gates, 8 revive HP and 40 revive time/progress inputs,
32 warning scalars, 8 cooldown selections, 192 full danger constructions,
88 purse inputs, 48 elite branches, 96 Council gates/RNG transitions plus three
HP-factor flows, and 224 batch/calm regeneration inputs plus its hit-clock
producer. Declared seams cover terrain, allocation/growth, zone lookup,
health-knot collection, powf results and publication/disposal. The rebuilt
gameplay code is not executed by these fixtures.

Thirty-six source files pass the installed Rust formatter's syntax parser
with child traversal disabled and formatted output discarded. The source check
enforces the owned fragments and caller markers. Whole-file hashes are retained
as observations because those files also contain independently owned changes.
`--write-source` refreshes those receipts without changing the shared native
manifest. `--write` regenerates native evidence and is reserved for an intentional
evidence update.

No compiler, Rust test binary, game/client, network session, lobby/relay/server,
installed save/configuration mutation or original/rebuilt comparison is run.
Static source correspondence does not establish playable or visual parity.

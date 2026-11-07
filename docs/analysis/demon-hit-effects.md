# Special-demon effects and summons

The [0.127.0 population repair](warlock-population.md) replaces this
historical quarter-health Soul Link cap with the recovered ten-percent cap.
The remaining observations below retain their original target provenance.

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns implementation status for gaps #8/#24.
This report owns the bounded producers and consumers below; it does not establish
whole-army gameplay or original/rebuilt parity.

## Native contracts

The [manifest](evidence/demon-effects/manifest.json) binds the current
complete demon-hit and shard-prune owners to unchanged PE extents, hashes and
REA/Ghidra evidence. Existing canonical tick evidence supplies shard generation;
existing actor-update evidence supplies the periodic critical owner. Win64
assembly controls argument interpretation; raw-import pseudocode omits external
callees/data and uses inferred types.

- `14594c4e0..14594cce9` temporarily installs source kind 2, the actual pet
  descriptor and captured attack contribution around each synchronous canonical
  hit, restoring each afterward. This is the source identity used by #8.
- A Voidwalker hit sums current raw effect 31's float at +4. Its shield gain is
  `min(hit_power * fraction, max(maximum_health * 0.25 - soul_link_pool, 0))`.
  Positive gain increments both the shared Soul Link subset (`Game+190`) and
  total absorb (`Game+4e4`). It uses full critical-adjusted hit power, including
  overkill, independently of admitted damage-meter credit. Soul Link absorption
  accounting belongs to the [meter report](run-meters.md).
- After a Voidwalker killing blow, HP gains 2.5 and clamps to its maximum.
  Positive effective healing is credited under the captured Voidwalker name/icon,
  proc flag false. This direct branch bypasses general-heal overheal conversion
  and the healing-damage pool, then publishes vital fields.
- A Felhunter hit checks the first current raw effect 30's rank byte at +1.
  Rank at least 3 and a surviving target strictly below 25% maximum health set
  that target's `Actor+158` mark to `now + 5`.
- `14593dd8c..14593de83` lets spell 980 (Curse of Agony) crit only while the
  matching target's mark is strictly later than now. Each eligible tick consumes
  one shared 24-bit RNG draw; player crit chance, excluding the separate demon
  bonus, must exceed the draw. A critical multiplies tick power by player crit
  damage before both the presentation event and canonical hit. Other spells,
  unmarked targets and expired marks consume no such draw.
- `14590682a..145906fe5` credits an actual Felguard swing once while Soul Fire
  is learned, before its targets resolve. The stable `145995f70` compactor keeps
  only timestamp/amount rows with age strictly below one second. Each swing
  admits `min(2 - recent_credit, 0.2)` only above 0.0001 and while integer points
  are below five. It accumulates the distinct `Game+8a8` fraction, converts a
  whole point at the native 0.9999 tolerance, and clears excess fraction at five.
  An admitted credit synchronously attempts the existing Soul Fire publisher.
  Neither target count nor an echo adds another swing credit. Addon `pv`
  publishes integer points plus the same fraction; `Game+8a4` is the unrelated
  qualified-death credit deadline.

## Army lifecycle and landing

The same manifest retains current initial greater-summon, gate, cast-admission,
proc-state, placement, chooser and departure ranges. The two independent
successful-cast variants are decoded from the actual current jump table (33 and
34); older generic effect numbers are not reused as their source meaning.

Initial raw29 companions use the native deterministic follower ring. Supremacy
suppresses lesser companions and Legion Gate, replacing learned Infernal and
Doomguard talents with one permanent summon each. Their request power is
`(1 + 0.2 * (rank - 1)) * (1 + supremacy_bonus)`. A normal greater-summon proc
uses the same rank factor without Supremacy, a 5% roll, and 15-second lifetime;
it does not roll while that descriptor is already present.

Legion Gate requires a live actor within 35 yards. Its first eligible attempt is
immediate; subsequent gates use `max(12 * current_cooldown_multiplier, 4)`.
The gate advances that deadline even at the army cap. It makes up to three
choices, stopping at ten lesser demons, including permanent companions. Its
choice list is Imp/Succubus and, when the two temporary companion slots are not
full, the current Felhunter/Voidwalker kind. Native choice uses the high32-bit
multiply/reject path. Each choice finishes summon creation before the next draw.

Current cast events require event kind3, a nonzero spell, positive catalog or
learned base power, and a kind other than passive11. Capstones reject an active
summon or a future deadline. The admitted attempt increments its counter and
rolls 10%, with success guaranteed on attempt ten without consuming that roll.
Success resets the counter and stores `now + 40 * current_cooldown_multiplier`.
Pit Lord lasts 12 seconds; Felguard lasts 20. Actual departure raises the next
summon deadline to at least `now + 7.5`. The ordered semantic proc markers allow
these producers to run at their own position among other talent/amulet effects.

The Infernal wrapper selects the last maximum-density center among at most 24
nearest candidates within 30 yards, counting all live neighbors in the landing
area, including neighbors outside player range. Its radius is `area * 8` with
the common 70/10 logarithmic softcap. No admitted center retains the ordinary
spawn ring. Placement consumes no RNG; the wrapper still consumes its normal
23-bit random angle. It emits ground-targeted spell1122, applies immediate
landing hits at three times its common base through the same demon critical
owner, and attributes them to the Infernal's `Landing` attack. Surviving targets
receive stun value2 for bosses, 0.5 for elites or 1.5 otherwise. Other wrapper
summons emit7741; initial raw29 followers use the direct constructor.

The live [lifecycle adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demon_lifecycle.rs)
uses immediate creation callbacks so angle/landing/recursive-hit draws finish
before the next proc or gate choice. The actor stage executes Infernal pulses,
clamps any Soul Link capacity lost to a lower maximum HP, expires temporary
actors, then runs movement/attacks. The Soul Link clamp subtracts only its excess
from total absorb.

## Source and checks

[The effect helpers](../../crates/azeroth-survivors-re/src/run_effects/demon_effects.rs)
retain the direct HP/absorb and conditional RNG contracts.
[Passive state](../../crates/azeroth-survivors-re/src/player_abilities/behavior/passive_tick.rs)
owns the Soul Fire fraction and ordered recent-credit ledger; the scalar addon
publisher reads that same state.

```sh
python3 scripts/recover-demon-effects.py check
```

The check verifies target/extract/text hashes and **68 unchanged-instruction
vectors** for shield cap/refill, direct killing-blow healing, fractional credit,
one-second ledger expiry, Felhunter rank/health mark gates, conditional
Curse of Agony RNG/crit, shrinking shield capacity, exact gate choice/RNG,
capstone pity/deadlines/departure, greater rank power and landing density/ties. It maps PE bytes unchanged in the existing project-local
Unicorn interpreter. Soul Fire's publication call and proc summon creation are explicit recorded seams;
their target/packet/actor creation code is outside those producer vectors. Landing
vectors supply the ordered radius query and live position list, then execute
the unchanged native density selection. The Agony vectors enter
after spell/actor admission, then execute the actual deadline and critical arm.
`prepare` stages reproducible Ghidra raw-slice plans under ignored runtime;
`collect` retains selected current text and vector outputs.

Rust fixture regressions were authored against these native results and were not
run. No compilation, `cargo check`, compiling tests, game launch, rendered/input
comparison or original/rebuilt gameplay comparison was performed.

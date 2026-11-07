# Integrated special Demonology gameplay

The supplied EXE SHA-256 is
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns current gap #24/#8 status. This report
owns the live integration and Infernal/Doomguard/Pit Lord spell consumers.
[Actors](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/demon-actors-0.105.0.md), [effects and lifecycle](demon-hit-effects.md)
and [talents/offers](demon-offers.md) own their detailed native contracts.
The [0.110.0 EXE sweep](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/execheck-0.110.0.md) identifies a current special-demon
cadence mismatch; this report's historical formulas do not certify that target.

## Live integration

The run builds current army configuration from the actual talent allocation.
Initial companions are created on the pre-advance run clock, sharing the real
object serial, creature fields, terrain queries and movement publication with
ordinary pets. Successful damaging casts execute current summon proc markers at
their original position in the ordered effect list. Each summon finishes its
creation, landing hits and recursive RNG before the next effect proceeds.
Legion Gate, Infernal pulses, Soul Link capacity and expiry execute before the
ordinary/special pet AI stage. Temporary departure publishes object removal;
queued missiles retain their captured source and descriptor after departure.
Departure cooldowns now require the retained origin index to name a current
raw34 effect and an existing deadline slot. The unowned showcase sentinel cannot
advance a real Pit Lord/Felguard talent cooldown. The
[follower lifecycle report](follower-lifecycle.md) records the connected
40-second showcase army, 25 bounded native selector/expiry/origin cases and the
absence of raw2 producers in the current talent/amulet catalogs; arbitrary
dynamically generated effects remain outside that negative inventory.

All melee, landing, pulse, missile and bounce hits reach the canonical actor/boss
hit owner. Effective damage is measured at the victim HP mutation. Captured
source kind2 and demon entry identify the meter row; the attack caption and any
secondary contribution partition that same effective damage. They do not add
extra damage. Direct Voidwalker healing and consumed Soul Link absorption reach
the healing ledger through their distinct native producers. Felhunter marks
reach the actual Curse of Agony periodic consumer. Felguard swings credit the
shared fractional Soul Fire bank and its live addon reader.

Demonic Empowerment is offered only with an eligible army producer and requires
a present special demon at cast time. Its real player aura has separate damage
and haste magnitudes; its expiry time is independent. The actor consumers read
those magnitudes alongside the equipped-stat lanes. Legionlord modifiers and
upgrade caps reach that same learned instance, aura and current card prose.

## Captured demon spells

`run_effects/demon_spells.rs` builds a fresh current spell proxy. A matching
learned spell supplies power/cooldown/area/target upgrades; otherwise the ordered
mean of learned power multipliers is floored at one. The proxy never learns a
spell or installs a player cooldown. Infernal and Doomguard apply current
matching modifiers. Pit Lord's owner deliberately uses learned power/targets
without generic spell modifiers.

- Infernal uses Hellfire1949, its current area/70-yard softcap and pulse interval
  normalized by Hellfire's original interval, with a .25-second floor. Empty
  queries still advance the deadline. The captured first matching non-sentinel
  effect8 with condition0 and Hellfire key supplies one per-victim status roll
  after each canonical hit, including echoes. Generic source2 keyed callbacks
  reject that selector, so Scorched Earth is applied once through this owner.
- Doomguard uses Shadow Bolt686 at descriptor power1.2, its learned/current
  cooldown and army haste, with a .5-second floor. It emits the descriptor and
 27383 visual batch, then captures missiles at20 units/second. Only an eligible
  primary elite/boss accrues Doom Bringer: the cast uses the previous count,
  capped at ten times .2; echoes read without advancing it. Additional targets
  do not receive the focus bonus. A launch-time gear marker admits the current
  post-impact Shadow Cleave lookup described in the actor report.
- Pit Lord uses Searing Pain5676 at descriptor power1.6 and the selected base
  power50. It shuffles the native ordered query, cycles through the admitted
  target count plus two, and delays successive bolts by .12 seconds. The native
  missile-speed switch has no5676 travel arm. Its captured caption is Felseeker.

The [spell manifest](evidence/demon-spells/manifest.json) binds exact PE
ranges and the Ghidra Infernal owner to the selected target. Canonical Imp and
Doomguard packet extraction remains in the actor manifest. Original Win64
instructions control ABI/field bindings; Ghidra raw imports infer types and omit
external data/callees.

## Checks and limits

```sh
python3 scripts/recover-demon-actors.py --check
python3 scripts/recover-demon-effects.py check
python3 scripts/recover-demon-offers.py --check
python3 scripts/recover-demon-spells.py check
python3 scripts/recover-run-meters.py check
```

These execute bounded unchanged original instructions in the existing local
Unicorn interpreter: 282 actor cases,68 effect/lifecycle cases,45 spell cases,
89 meter cases and the offer/constructor/rank/cap cases listed in the offers
report. Spell vectors cover exact power/cadence float bits, fallback mean,
focus/echo state, wrapping target arithmetic and first matching captured status.
The harness supplies explicit query/allocator/packet/hit boundaries; it does not
execute a game, renderer, terrain engine or OS operations. `collect` writes
fresh spell evidence to ignored `runtime/` before reviewed text promotion.

Changed Rust source parses. Authored Rust regressions cover the recovered
fixtures, lifecycle, offers, deferred descriptor/attack attribution, fractional
credit and reserved-shield/Soul Link accounting; they were **not compiled or
run**. Compilation, live gameplay, terrain, animation/input/rendering, audio and
controlled original/rebuilt parity remain unverified. These source repairs do
not close the parent gaps' deferred parity requirements. Current talent refunds/key
preservation are covered by the [migration report](talent-migration.md);
its remaining validation is #12. Shadow Dance/Weaving source corrections are
covered by [class rules](class-rules.md), with validation still open under #16.

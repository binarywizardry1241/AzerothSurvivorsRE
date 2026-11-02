# Magnet, rune and leech connections — 0.105.0

Authority: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns current status for #31 and the related
addon input in #11. This is source integration and bounded static recovery;
compilation, actual interaction and original/rebuilt presentation are unverified.

## Native contracts and live consumers

The [manifest](evidence/0.105.0/pickup-effects/manifest.json) binds selected
original instructions, strings and three REA/Ghidra owners. Raw-import
pseudocode has inferred types and absent external data/callees; original Win64
instructions control argument interpretation. The shared GameObject creator
is the canonical [boundary-pillar extract](evidence/0.105.0/boundary-pillars/manifest.json),
not a second copied constructor.

- Begin `145919949..145919b24` chooses two or three magnets using the original
  u64 widening/rejection sampler. Each segment stores both an enemy-drop
  eligibility time and a forced-spawn deadline in its final 40%. Bosses consume
  an eligible head; guardians consume one on their native 50% check. An overdue
  forced head spawns near the player. All sites share the same schedule, object
  serial and run RNG. The older single-float fixture API remains supported;
  the live run uses the selected target's two-float records.
- The kind-six creator `14593a69c` creates primary entry/display/scale
  `9009/342/1.3`, then auxiliaries `9010/3271/1` and `9011/2232/1.6`.
  The auxiliaries have native flag 16; the primary has zero. Source uses the
  existing normal-client GameObject constructor, renderer and real MPQ models.
  Walking within three planar units removes primary and auxiliaries, then
  increments the wrapping collected-magnet counter. Spawn requests do not count.
  Magnets have no invented expiry.
- Collection `14590c85e` attracts only idle XP and idle coins. Existing flights
  are retained. XP gets a real client movement packet and the shared movement
  serial; duration is planar distance/40, with a 0.15-second floor. Coins get the
  same collection deadline, with **no native movement packet**. Their world
  object therefore stays at its native position until collection. Distant coins
  are credited at the deadline; the ordinary nine-unit admission still applies.
  The existing XP renderer continues to consume the actual flight. Companion
  reservations and sweeping remain #14.
- Rune timer `14590fa5f` advances by 45 seconds before checking population. It
  attempts a uniformly selected Speed/Berserking/Restoration rune when at most
  one rune is present. The current sampler tries twelve masked/floor-valid
  positions at 15–40 units, then its fallback; special creation clamps to
  `max(zone_radius-2,1)` and resolves the floor. Forced magnets use 25–50 units.
  Both timers start at zero in the selected constructor.
- Rune entries/displays are `9006/5931`, `9007/5995`, `9008/5991`, all scale one.
  `1459451c0` replaces every existing aura with the same rune spell, then appends
  Speed `23451` for ten seconds or Berserking `23505` for fifteen. Their real
  stat refresh, speed consumer, player aura fields and addon buff list share the
  existing live owners. SpellGo precedes the stat/aura refresh. Restoration
  directly restores half maximum HP, credits only effective healing under
  `Restoration` / `Spell_Holy_Heal`, publishes vital fields and casts **23493**;
  its world entry 9008 is not the visual spell. It adds no timed aura or direct
  spell-heal log. The native toast uses the localized rune name plus ` rune!`.
- Per-hit leech `145934b1b..145934de7` admits positive leech, multiplies the full
  hit amount (including overkill), clamps HP and credits positive effective
  healing under Leech. The live ordinary and boss hit adapters explicitly select
  this manual health owner through the existing ordered vitals flush. It emits
  vital fields and no fabricated spell-heal log. General spell healing retains
  its own pool/overheal behavior. Immediate native callback timing is not proved
  by the numeric harness or by source parsing.

The application collects only after an admitted run-clock advance and visits
the candidate IDs in reverse order. Rune/magnet objects bypass the older manual
pickup mesh path and use the client renderer. The same collected counter is
exposed to `AZSEND.magnets`; the [bridge report](addon-bridge-0.105.0.md) owns
serialization and the exact Lua parser consumer.

## Checks and limits

`python3 scripts/recover-pickup-effects.py --check` passes **93 bounded
original-instruction cases**: 24 rune mutations/casts, 48 leech clamps/admission
cases, three XP-flight scenarios, twelve schedule/RNG cases, two coin/counter
cases (including u32 wrap), and four descriptor selections. The retained
[vectors](evidence/0.105.0/pickup-effects/native-vectors.json) record exact float
bits and RNG state. Allocation, translation, terrain answers, field-map insertion,
packet composition and meter insertion are explicit harness seams. These checks
do not execute the EXE or validate real MPQ presentation.

Changed Rust parses with the installed rustfmt; Python source parses and
`git diff --check` passes. Rust regressions cover native schedule/clamp vectors,
three-object creation/cleanup, single-count collection, flight/deadline behavior,
real aura publication and Restoration attribution. They were authored but
**not compiled or run**. No application build, compiling test, game launch,
screenshot, audible check or original/rebuilt comparison was performed.

The shared controller, renderer, player aura projection, complete run startup
RNG order and long-run timing retain their owning implementation/provenance and
comparison limits. This repair does not certify appearance, all buffs, companion
collection (#14), effect filtering (#33), or full game parity; #31 stays open for
those applicable validation/comparison requirements.

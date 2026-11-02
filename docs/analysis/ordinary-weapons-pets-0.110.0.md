# Ordinary weapons and combat pets — 0.110.0

Target: installed 0.110.0, SHA-256
`e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048`.
[verification-needed](../verification-needed.md) owns implementation and remaining gaps.
This is #6's source/static recovery; special Demonology changes remain #24.
The [0.105.0 report](power-scaling-0.105.0.md) retains historical provenance.

## Current contracts and source repairs

The weapon stage is `0x1458f7312..0x1458f761b` in the current run tick.
The class indirection still enables Warrior 27.5/1.6, Paladin 27/1.8 and Rogue
14/1.2, all with range six; other supported classes have no ordinary swing.
`run_effects/weapon.rs` and `gameplay/mechanics/attacks.rs` retain the current
ordered stat16 fold, elapsed/nonpositive timer admission, radius-six ordered
query, no-target 0.15 retry without an RNG draw, one admitted critical draw,
base*1.5 power, actual melee publication before canonical hit, spell0/source0
and suppressed duplicate damage log. The timer reads the current cooldown after
the synchronous hit/proc tail: `sqrt(cooldown) * (interval * 1.2)`. Native cases
include callbacks that change cooldown, critical equality/NaN, invalid timers,
ordered cancellation, negative/NaN/saturated power and every class dispatch.

The pet update now has a separate current owner, `0x145929f40`, called by the
run tick at `0x1458f82ea`. The ordinary branch retains quarter-second updates,
player ring/leashes, target retention, ordered radius26 melee/radius28 ranged
queries, movement-before-ranged/after-melee ordering and descriptor intervals.
The current cooldown helper `0x145954780` returns descriptor+30 immediately for
special0. Its other branches apply the new demon cooldown clock; they are not
substituted for ordinary pets. Eight native interval cases prove that ordinary
periods remain unchanged across supplied player cooldown values.

Two source discrepancies are corrected:

- Ranged attack admission now uses an ordered `now >= next_attack` comparison.
  A NaN on either side defers the attack, matching current UCOMISS/JAE. The
  outer update uses JA and deliberately retains its different NaN behavior.
- The live adapter preserves `(has_metadata * 2) | raw_flag_byte` when building
  retained/new-target priorities. Previously a metadata-bearing actor discarded
  its raw flag byte. Twelve current native projections cover both metadata
  states and six flags, including overlapping/high bits.

The five ordinary descriptors still match every source field exactly: Wolf,
Raptor, Treant, Spirit Wolf and Water Elemental. Current talent records retain
raw29 grants of one Wolf, one Raptor, two Treants, two Spirit Wolves and one
Water Elemental for Tame Beast, Bestial Wrath, Force of Nature, Stormstrike and
Water Elemental respectively. Native pointers, effect-array hashes and exact
fields are retained in the fixture. The catalog's old native_address values
remain explicitly historical source-table identities, not current EXE addresses.

Current creation (`0x145929010` and Begin's initial-follower walk) retains the
shared creature serial/GUID, catalog model/scale, real terrain height, ring
angles, unit fields and initial attack/update state. The existing live
`begin_pets`/client adapters consume those grants once and publish actual unit
creation and movement. `attack_candidates` uses native actor creation order;
its metadata and raw flags are the same live inputs used by the corrected
adapter. No provisional actor collection replaces that route.

Both attack paths still read the ordered current stat17 vector, level growth,
current damage and critical fields. Source `pet_power::attack_power` retains
separate f32 operations for `base * ((level - 1) * .12 + 1) * damage * (sum17 + 1)`.
The 576 current melee/ranged arithmetic cases match retained expected bits.
Melee publishes its packet before source2 canonical damage. Water Elemental's
Frostbolt snapshots power, school, critical and pet attribution, travels at
horizontal distance/28, and queues a .3 slow for two seconds. Current native
pending-row stores and hit/status gates reproduce twelve payload cases and
eight power boundaries: nonpositive/unordered power omits damage while retaining
the status callback. Live source captures attribution before expiry and uses
its existing deferred damage/status consumers.

## Evidence and limits

[Manifest](evidence/0.110.0/ordinary-pets/manifest.json),
[native vectors/data](evidence/0.110.0/ordinary-pets/native-tick.json) and
[Ghidra owners](evidence/0.110.0/ordinary-pets/ghidra-owners.json) bind the current
bytes, helper identities and observations. Each native range has one canonical
assembly extract; the shared movement/facing serializers belong to the
[#1 report](ground-navigation-0.110.0.md).

`python3 -B scripts/check-ordinary-pets.py` passes **736 current native
cases**: 28 weapons, 60 pet controls, 32 deadline predicates, eight ordinary
cooldowns, 576 power projections, twelve priorities, twelve impacts and eight
pending gates. It also verifies all five descriptors and five grant arrays.
Historical fixtures supply inputs/expected values; executed bytes are current.
Weapon cases execute actual RNG/state/event order with supplied query, packet
and canonical-hit seams. Pet control cases use supplied ordered query/movement
and period seams; separate arithmetic cases supply the critical sample. Impact
cases execute current travel and pending stores; pending cases begin after the
captured context is prepared and intercept final hit/status calls. These do not
execute Rust, the client, arbitrary proc/lifecycle callbacks or the whole game.

Source tracing covers the actual equipped-stat/grant producers, creation,
movement, attack/deferred consumers, packet and meter attribution routes.
Compilation, authored Rust regression execution, MPQ/client scheduling, model
appearance/animation, gameplay/platform behavior and original/rebuilt parity
remain unverified. No game, build or compiling test ran. Broader target-specific
native ownership remains #41; the other 0.110.0 release claims retain their owners.

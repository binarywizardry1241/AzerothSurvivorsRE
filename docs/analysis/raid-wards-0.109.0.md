# Targetable encounter wards

This recovery and source connection use installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
Native22's producer, special-actor lifecycle, shared hit/death boundary and
presentation are recovered. Compilation, gameplay and rendering comparison are
unverified; this source work does not close the parent #42/#43 parity gaps.

The [manifest](evidence/0.109.0/raid-wards/manifest.json) binds all twelve ward
unit templates, all fourteen current ability records, exact instruction ranges
and isolated native fixture results. The [index](evidence/0.109.0/raid-wards/index.json)
maps native48-byte payload addresses to semantic15 descriptors. Thirteen records
belong to current boss/guardian schedules and health phases; the fourteenth,
`146bd4278`, is a native18 child. The complete recursive action graph owns its
reachability. Ghidra provenance for healing, real UNIT presentation, ordinary
hatch creation and removal is retained in the manifest and
[provenance](evidence/0.109.0/raid-wards/rea-provenance.json).

## Admission and creation

The current dispatcher selects `14595ace9` for native22. Payload words0..3
are the special kind/configuration, words4..5 the template index, word6 the
count, word7 the placement spread, word8 the caster-max-health fraction and
word9 the lifetime. Count is at least one. Each placement consumes the native
accepted f32 range draw `[0.6,1)` and multiplies it by spread. The fan faces
from the caster's interpolated position toward the current player, with
`((i+0.5)-count*0.5)*(PI/count)+aim`. The collision ray applies the native
half-yard margin, followed by the zone-radius-minus-four boundary and primary
height sampling with caster-Z fallback. This branch does not replace the
coordinates with a random ring or the player's position.

Constructor `14594e2e0` clamps the template index to11, assigns health
`max(casterMaxHealth*fraction,1)`, and has no ordinary population-cap gate.
It uses the same wrapping Game+`0xa60` creature counter as ordinary creation
(`14597087d..88e`) and GUID
`0xf130000000000000 | ((entry & 0xffffff)<<24) | (counter & 0xffffff)`.
The templates are Egg Sac, Fel Totem, Hex Totem, Healing Ward, Warding Totem,
Arcane Crystal, Soul Crystal, Web Cocoon, Spore, Restless Spirit, Frost Totem
and Wind Totem, with exact entries9600..9611, display IDs and scales in the
manifest. No ordinary `EnemyDefinition` is fabricated.

The real unit helper `14596ed40` publishes the GUID, entry, scale, ceiling
health/max-health, level `min(runLevel,63)`, faction14, flags`0x100`, attack
interval fields2000, scale-derived bounding radius/combat reach, actual display
IDs, base damage fields5/10 and multiplier1. Creation faces the unit toward the
player. The record has no ordinary/boss/guardian definition header, a16-byte
special config at`+d0`, parent GUID at`+e0`, expiry at`+e8`, and first action at
`now+1`. Its position is stationary. The harmless shared attack interval/reach
fields come from the selected zone's first ordinary definition; the special
branch bypasses ordinary AI attacks/movement.

## Actor lifecycle and damage

Main actor owner `145977e10` performs ordinary periodic/status processing
before recognizing the special-kind header. It advances a due ward's next
action to `now+1` once, queues the GUID/config/current position/expiry flag,
and bypasses normal AI. Expiry is inclusive; periodic healing has no catch-up
loop. The deferred consumer `14597c56c..c7fc` rechecks that the ward is alive
and that its parent still exists and is alive after deferred combat work:

- Kind0 waits until expiry, then requests the configured ordinary enemy count
  and type on a1.5-yard ring, retaining the ward Z, and removes the ward.
- Kind1 heals its parent before expiry through `14594dd30` with spell2054.
  Requested healing is the configured fraction of parent max-health, capped to
  missing health and clamped to zero. Positive healing updates ceiling health
  field22 before a parent-to-parent spell heal log. It removes the ward at expiry.
- Other kinds wait until expiry and then remove the ward.
- Missing/dead parents remove due wards without healing or hatching. A ward
  killed between collection and consumption applies no queued action.

Hatch requests use ordinary creation `145970560`, including its current
population cap, enemy-index clamp, scaling, RNG and ordinary creature counter.
The still-alive egg participates in that cap until all hatch requests complete.
Removal `1459b5300` retains surviving actor order, then publishes
`SMSG_DESTROY_OBJECT`(`0xaa`) for the ward GUID.

Player and periodic damage use shared actor-hit owner `145971490`.
Wards retain targetable real UNIT descriptors, health, periodic effects and
control state. Shared minimum damage, meters, spell/status publication, leech,
kill count, heal-on-kill and the normal hit callback result apply. Lethal damage
marks the ward dead and freezes its position. Future periodic work is
suppressed; the adapter retains the native predeath periodic snapshot for the
shared after-damage callbacks until corpse removal. Its null
ordinary definition skips ordinary XP/gold/loot generation, and it does not
increment elite kills. Common corpse expiry is strict `now-diedAt>1.2`.

Native damage `145971afd..1b49` also queries **any alive kind2 ward whose parent
GUID matches the primary boss/guardian victim**, with no distance or expiry
check. It supplies the same0.25 reduction as the timed shield when exposure is
inactive; active exposure takes priority. Death/removal ends ward protection.
Ward deaths do not create a substitute native38 exposure action.

Warnings remain owned by [raid warnings](raid-warnings-0.109.0.md): kind0
selects eggs, kind1 healing wards and every other kind shielding wards. The
producer emits the warning after all creations. Current addon target owner
`145919fe0` classifies the unheaded, nonelite actor as `normal`, publishes its
actual health/dead state and uses localized `Enemy` through `14590d9a0` rather
than substituting the creature-template name. Alive run counts include wards;
boss/guardian/elite-only addon lists retain their native header filters.

## Source and static verification

`bosses/raid_wards.rs` owns the current descriptors, templates, placements,
special state, due actions, parent resolution, shield ownership, exact UNIT
fields and hatch/heal math. `gameplay/mechanics/actor_frame.rs` collects
periodic effects and aura updates in the shared walk; `mechanics/wards.rs`
connects shared hits/death, healing, ordinary hatching and object removal.
The encounter dispatcher, actor target list, shared defense multiplier and real
client model/selection path consume these live actors.

[check-raid-wards.py historical recipe](../SCRIPTS.md#historical-execution-sources) verifies current image bytes,
all recursive native22 records, the generated Rust descriptors and all fields
of the selected zone indices0/1 enemy templates(24 records) used by ward/hatch
and minion creation. Connected source checks cover target admission, damage,
periodic/callback/follower/bounce consumers, native UNIT fields and client delivery. Its494
isolated native cases cover constructor clamp/counter/HP behavior(252),
healing cap/no-op/NaN behavior(24), shield ownership(20), deadline admission
including unordered clocks(16), and deferred heal/hatch/removal/dead-parent
behavior(32), shared ordinary/ward/ordinary counter sequencing across
24-bit GUID and32-bit counter wrap(5), all22 UNIT fields across template/level/HP/
player-GUID cases(144), and current addon normal classification(1). Imported trig helpers in hatch fixtures are explicit host-math
seams; they do not certify Windows CRT equivalence. Ghidra raw imports do not
supply full-PE callers/references or trustworthy recovered Windows types; exact
instructions and known call ABI own those conclusions. The full common-hit
owner's bounded decompilation timed out; selected instruction contracts remain
available and byte-bound. No compiler, compiling tests, EXE process or rebuilt
game was run. Source connectivity and instruction fixtures remain separate
from gameplay, visual and platform parity.

The [shared actor frame](actor-frame-order-0.109.0.md) now collects ward auras
in common insertion order and retires ward corpses before movement. Lifetime
and parent actions retain their later post-raid stage. Rebound raid actions
can target wards through generic source ports, while metadata-gated defenses,
replacement schedules and form fields retain their native type restrictions.

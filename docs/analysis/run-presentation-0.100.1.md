# Current run to client presentation bridge

Recovered2026-10-19 from the selected0.100.1 EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The existing REA/Ghidra actor-hit/dispatcher recovery provides the owning call
paths; [current retained packet assembly](evidence/0.100.1/run-presentation/aura-native.json)
binds each additional serializer/caller range to its exact original bytes.
This is an implemented embedding connection, not an original/rebuilt visual
comparison. The desktop comparison remains unverified.

The reconstructed mechanics previously produced `RunEvent` records with no
presentation consumer. The new `gameplay/client/events.rs` collector drains
each completed tick once, including a tick that immediately pauses for a choice.
`benilla-app/local_client/events.rs` dispatches its decoded events through the
production ordered inbound handler table after local GUID registration and
before the ordinary Net/Input/Stream/Present stages. It starts no socket and
does not simulate another cast or damage calculation. The normal spell-go
handler resolves DBC visual kits, real MPQ models, missiles, sounds, animation
and combat log/text; no replacement particles are generated.

## Packet identity and ordering

* `145466ab0` emits opcode`132` (spell-go): source GUID twice, spell ID,
  ordinary flags`100`, hit GUIDs in supplied order capped255, no misses, then
  the actual unit/ground/empty target. Source `SpellCast` currently carries
  ordinary cast data; a future ranged-ammo binding must preserve its additional
  native flag/tail rather than assign invented ammo.
* Actor-hit `1454d57cf..585a` emits its damage log only when spell ID is nonzero
  and the explicit seventh-argument suppression flag is false. It names the
  player GUID from Game+3e8 as attacker independently of a totem/impact causal
  source. The serializer`14545f6d0` emits opcode`250`: saturated truncation of
  modified damage, school, zero absorb/resist/blocked, periodic=false, and
  hit-info=2 for a critical. Logged spell identities16038/14186/5308 become
  8349/2098/20647. The run retains raw power and causal source separately.
* Actor-periodic `1454de82d..e8f5` first emits opcode`24e` through`145464140`:
  target, player caster, periodic spell ID, one damage tick with saturated
  truncation of the **raw** per-tick power, school and zero absorb/resist.
  It then invokes actor-hit with critical=false and log-suppression=true.
  Consequently there is one periodic log and no duplicate direct log, even
  when vulnerability changes the health mutation.
* Recovered ground/totem/Lightwell field rows enter normal DynamicObject, Unit
  and GameObject creation respectively. DynamicObject spell/radius/caster
  descriptors retain their exact original fields, including absent key5.
  Object destruction uses the normal GUID-indexed destroy handler.
* `PassiveStarted` publishes its duration-bearing cooldown packet before the
  separate opcode`135` cooldown-event edge. Authoritative action snapshots
  remain the source of gameplay cooldown readiness.
* Explicit melee intents use`14545c690`, opcode`14a`: caller-supplied attacker,
  victim and already converted u32 damage; hit-info`2|(critical<<7)`, school0,
  victim-state1 and zero absorb/resist/blocked/melee-spell. Generic6/7 produce
  this before the corresponding spell-ID0 hit, independently of ordinary
  nonzero-spell damage logging. Actor melee requests publish the same packet
  before canonical player damage, logging saturated truncation of
  `max((1−armor)*raw,1)` even if the damage owner then refuses the health change.
* Incoming player damage owner`1454a0910` itself has no damage-log serializer.
  Its four direct callers are missile`1454b57b9`, area`1454b5c8f`, physical
  melee`1454de37f` and instant actor spell`1454df35b`. The area/instant callers
  emit their actual SpellGo; they do not emit a fabricated direct spell-damage
  log. Player damage publishes actual native ceil health22/max28 fields.
* Appearance owner`1454e75f0` publishes only field131 model and field4 raw scale
  bits. Installation passes856/1; restoration uses actual actor metadata.
  Movement-stop owner`14545ff20` writes opcode`dd`, packed GUID, XYZ, supplied
  spline serial and move-type1, with no path/duration/facing tail.

Canonical heal ownership is separate from the presence of a health increase.
Current`1454a54c0` emits `14545d980` (opcode`150`, direct heal) only for a nonzero
spell ID and actual heal>=1. Regeneration, generic leech, heal-on-kill and other
manual status healing must not manufacture such a packet. The event metadata
retains optional source identity and the explicit native log admission; the
bridge follows that admission. Health descriptors and the existing Lua feed
continue to reflect the actual health state.

## Actual target aura fields

Current`1454e3550` owns16 target debuff slots (client slots32..47). Addition
rejects duplicates, selects the first zero slot and rejects a full array.
Removal selects the first matching slot. The owning actor's event-time state
produces three descriptor words:

| Word | Native value |
| --- | --- |
|79+slot|added spell ID, or0 for removal|
|99+slot/8|nibble2 for each occupied slot in that group|
|121+slot/4|four packed application bytes|

Application helper`1454506a0` counts matching active periodic rows owned by the
player first; only if that count is0 does it count other owners. It saturates
count255 and stores count−1, with0 when empty. Expired rows with remaining0 do
not count. Per-GUID `AuraSlots` state lives with the actual run actor lifetime;
the event carries complete fields from that point, rather than the bridge
reconstructing them from the final state of a later tick. The normal field
handler then drives FrameXML target auras and the production persistent state
kit/sound watcher.

The [bounded generator](../../scripts/recover-run-presentation.py)
executes60 unchanged native slot mutations,30 applications-only group selections
and32 complete application-word
cases, including full/duplicate/unmatched arrays, exact owner priority,
exhausted rows and257-row saturation. It admits no external calls, launches no
game process, and rejects unreviewed instruction branches. Rust helper tests
consume these native outputs without modifying their expectations.

## Remaining presentation boundaries

Current player owner`14549e650` is recovered through
[REA/Ghidra evidence](evidence/0.100.1/run-presentation/player-aura-rea.json).
The new pure`run_effects/player_auras.rs` projector preserves the complete
producer order: active self auras, first generic18/20 shield when absorb is
positive and no active kind7 shield, all active temporary15 states, and all
permanent25 rows. Its separate harmful partition contains the first generic19
rescue deadline and learned/racial effect11 cooldown markers. Active expiry is
strictly greater than now; cooldown0 and sentinel1000 are omitted. Helpful and
harmful partitions cap32 and16 independently, without deduplicating IDs.

Native provenance mapper`145487350` uses the original talent/amulet name and
kind0/1/2, with explicit named aliases and fallback27779/26635/25771. These are
not translated labels. Player flag helper`145497900` uses nibble9 for helpful
and8 for harmful slots, unlike the target aura mutation's nibble2. The
projector compares the previous48-slot snapshot and publishes changed spell
fields47..94, flag words95..100 and application words113..124; first
publication includes all66 words. Expiry-only changes emit no field delta.
The owner emits no separate aura-duration packet.

The [current player fixtures](evidence/0.100.1/run-presentation/player-aura-native.json)
execute1536 complete native flag words,180 application-word branches and36
complete alias calls, with no external call stubs. Rust tests additionally
cover source partition order, exact expiry, sentinel exclusion and incremental
field publication. Live binding consumes actual composed-row provenance,
temporary source indices, active auras and incoming rescue deadlines; its
integration validation is recorded centrally after the combined build.

## Identity and actual model ownership

Run enemy/boss roots now register their native unit identity before model or
lighting assets are resident. They opt into the normal engine's DBC display
resolution, M2 dressing, rig, animation, emitters, persistent aura FX and
live-display/scale owner. Pickups retain their recovered render path. The
embedding supplies actual actor identity and [ground paths](mob-movement-0.100.1.md)
before Net; the ordinary client owns spline sampling, terrain following and gait.
It no longer overwrites terrain-resolved poses after Net, restarts creature
animation clips or overwrites the engine's live scale ease. This path change has
native instruction evidence and authored-but-unrun Rust regressions; it has not
been compiled or compared in-game. An unavailable model
remains invisible for this opt-in path rather than drawing a diagnostic cube.

The local registration bridge compares each host descriptor with its previous
**host** snapshot and merges only changed lanes. A health update therefore
cannot restore a definition's original model over a current polymorph or clear
packet-driven aura words. Model bounds come from the normal attach owner.
The source regression verifies identity registration without asset resources,
actual movement input and preservation of display/scale/aura values during a
host health update. Actor health/max-health snapshots now use current native
ceil conversion, with fractional unit-field regression cases.

Actual cache M2 roots now register matching GameObject descriptors and their
existing children enter the normal `GoPickPart` population. The ordinary
client's resolved `GameObjUse` channel carries the selected GUID into the
authoritative cache handler. Normal action/macro/CastLadder resolution also
runs offline, with native manual-cast rejection rather than a second game
cast. The [current request report](local-requests-0.100.1.md) owns the current
action-table and GameObject constructor evidence and input limits.

## Current cancellation boundary

`14558a7c0` writes CMSG_CANCEL_AURA`136` with one u32 spell ID. Current received
packet owner`1454440d0` uses jump table`14673eabc`; entry44 for`136` is its default
`145444697`, which returns at`145447a82` without reading aura state or mutating
the game. Its sole direct caller`14543fd49` passes each decoded received packet
from`1455130a0`. The same consumer handles normal spell-cast`12e` and login.
The [six bounded native dispatch cases](evidence/0.100.1/run-presentation/cancel-aura-native.json)
vary payload lengths0/1/3/4/8/65535, admit no external calls and verify unchanged
game memory. This proves the received-channel no-op; it does not prove absence
of a separate indirect client-request interceptor. Helpful flag9 alone is not
evidence that the game accepts cancellation, and no aura-clear mutation is
invented from it.

Current earned levels publish field34 and remaining/required XP fields716/717,
plus localized system chat through the recovered owner; no invented
SMSG_LEVELUP_INFO is emitted. Inline per-level healing is recorded by its actual
health descriptor and meter owner. Other absent native announcements retain
their explicit translation gap. Unsupported presentation bindings are visible
once in the log. Named`bossdown`/`guardian` account events are localized custom
toast notifications, not named save counters. They now enter the recovered
notification queue/renderer through the sole collector, including the actual
loading-cover expiry deferral. The [notification report](notifications-0.100.1.md)
owns its typography, placement, clock and retained native vectors.
Source registration,
central compilation/regression results and original/rebuilt visual comparison
must be recorded by the integrating root task; these are not implied by a
catalogue, packet shape or finite instruction fixture.

The final r20 integration pass passed544tests across29suites, including
54library,172application and58mechanics tests. The build and isolated menu/Elwynn
ready captures passed. The original/rebuilt interactive comparison remains unverified. Cold Elwynn loading logged an engine settle
timeout before world readiness; the later [0.105.0 loading-pause correction](cold-loading-0.105.0.md)
remains unverified at runtime, as do walking/collision. The former Core+16/manual-republication gap is closed by current proof: that
word is the optional Game discriminant, and the desktop callback disables the
alternative Gossip path. Current unconditional rejection needs no extra overlay.
The [request policy proof](local-requests-0.100.1.md#post-rejection-dispatch-and-desktop-capability)
retains the exact desktop callback and45dispatch/32guard/4lifecycle vectors.

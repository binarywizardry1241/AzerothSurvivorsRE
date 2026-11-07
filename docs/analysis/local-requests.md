# Offline client requests

Historical request recovery. The [0.113.2 cache repair](cache-lifecycle.md)
replaces the cache's manually registered visual with ordinary client ObjectCreate
and GO-state attachment, preserving the exact-GUID GameObjUse request consumer.
This report's original evidence and checks retain their actual target.

Reviewed 2026-10-19 against supplied SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The [retained current owners and native vectors](evidence/local-requests/native.json)
bind the following claims to the current binary. The complete action and
GameObject constructors were independently decompiled with REA/Ghidra.

## Action identity and actual resolved requests

Current `1454f5f00` reads learned instances at Game+`2b0/2b8`, stride88,
and each definition's spell ID at+64. It publishes wire slots0 onward,
then appends the racial spell at wire slot11. Serializer `14545c420`
zeroes all120u32 words, applies ordered `(u64 slot,u32 spell)` pairs,
rejects slots above119 and emits opcode`129`. Repeated slots use the last
pair. The earlier `1454e3d30`/`145441c20` addresses belong to0.97.2 and
are not current addresses.

The local engine now seeds its existing `PlayerActions` when the supplied
player/action identities change. Normal `UseAction`, macro expansion,
ordered targeting and `CastLadder` own all client-side resolution. Native
cooldown snapshots override the resolved spell's cooldown, while the normal
action identity/state feeds retain icons, macros, usability, range and error
presentation. A cooldown frame or Lua VM reload does not reset client-edited
bindings. The old independent local feed no longer overwrites120 slots each
frame, and no convenience `action_uses` copy is dispatched a second time.

`local_client::LocalClientRequests` receives only actual outbound cast
requests and `GameObjUse` requests through a local channel installed after
the disconnected network plugin. It starts no socket. Its ordered variants
are `CastSpell { spell_id }`, `GameObjectUse { guid }` and
`GameObjectQuery { entry }`. Inactive sessions
discard old requests. The embedding's authoritative request consumer owns
the responses and mutations; this channel does not manually cast a game
spell or choose a cache by proximity.

Current incoming handler `1454440d0`, opcode`12e`, reads the requested
spell ID and calls `14545a870` with reason`17`, emitting `SMSG_CAST_RESULT`
opcode`130`, status2. It does not execute that spell. Post-response native
phase gates select alternate-host choice/results publishers, but both return
immediately with the selected desktop host's false capability. The earlier
"Core+16" label denotes the optional Game discriminant at wrapper+`10`, not
an additional manual-cast permission. See the
[manual-cast instruction cases](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.100.1/run-presentation/manual-cast-native.json).
Opcode`136` reaches the same handler's no-op default; the local bridge does
not invent aura removal for the interface's cancel affordance.

## Cache identity and picking

Shared pickup creator `1454da2c0`, kind2 branch `1454da40c`, supplies
entry9005, model259, scale1 and GameObject type3 to `1454e4a00`.
The latter increments Game+`954` and creates
`F110000000000000 | ((entry & FFFFFF) << 24) | (counter & FFFFFF)`.
Its exact fields include type mask33, ready state14=1, faction20=35,
type21=3, flags9=0, actual position/yaw and yaw quaternion12/13.
The adapter previously returned only a low counter: it now packs the full
cache GUID. Unification of all producers using Game+`954` is owned by the
live mechanics counter integration; separate counters are not parity.

The existing manually rendered cache M2 root now supplies this GameObject
descriptor to the same local object registration owner used by units.
Registration accepts only matching GUID/descriptor families. Its actual
mesh children receive `GoPickPart`; the ordinary hovered-object, range,
right-click and `GameObjUse` path then resolves the selected GUID. No new
cache mesh, proxy radius, nearest-cache shortcut or assumed template is
introduced. Normal engine GameObject lock handling treats an uncached
template as lockless, matching its existing client path.

The native serial is shared across ordinary actors, guardians, summoned
objects and pickups. Kind0 XP uses unit family/entry9001
`F130002329000000`; kind1 gold supplies entry9004, model2614, scale.6,
type5 to the same GameObject creator. Correct shared sequencing is required
independently of the cache family/entry correction.

## Validation and limits

Bounded unchanged native instructions produced13 learned/racial publication
vectors,18 complete120-slot table vectors, one cache-argument vector and15
GUID packing vectors. No external call stub or EXE process ran. The
recovery script is [recover-local-requests.py](../../scripts/recover-local-requests.py).
All13 engine request/picking integration tests passed in
`client-resolved-requests-r2.log`; the ordinary ordered macro regression also
passed. The query-enabled13-case engine pass subsequently passed in
`client-object-query-regressions.log`. The application cache transaction passed
in r14b; the application query fixture passed in the final r20 all-target check. Runtime mouse/action-bar
comparison remains unverified.

The authoritative application consumer now handles each resolved cast once
with failure reason`17`, and sends each resolved GameObject GUID to
`Mechanics::click_cache` using the actual player pose and prepared MPQ floor.
The optional Game and desktop host capability are now traced through their
actual producers. Manual rejection already matches this desktop path; no
extra upgrade/results reopen action is required after a rejected cast. This
closes the previously recorded manual-input gap by recovery, with no source
behavior change or claim of original/rebuilt runtime parity.

## Post-rejection dispatch and desktop capability

The [current policy evidence](evidence/manual-cast-policy/native.json)
retains19 code spans, two complete REA/Ghidra payload owners,45 native phase
dispatch cases,32 payload-guard cases and four lifecycle stores. Reproduce it
with [recover-manual-cast-policy.py](../../scripts/recover-manual-cast-policy.py).
All replay executes unchanged instructions and the actual desktop vtable leaf;
no external calls are replaced, and no EXE process or GUI comparison runs.

The rejection is delivered at`1454451dd` **before** the optional Game check
at`1454451e2`. A discriminant of2 exits. Otherwise wrapper+`9c9` phase2 calls
`1454ee470`, phases4/5 call`1454f0640`, and every other phase exits. Startup
`14543f15e` sets the empty discriminant2. Factory`14544f7c2` also returns2
without a selected run configuration; a constructed Game begins with0 at
`1454add5c` and is copied into the optional storage at`14544ff3f..ff51`.
Reload`14544d6e6..6f2` and disconnect`14543fe70..fe9d` dispose of the prior
Game and restore2. This is Game presence, rather than a second cast policy.

The desktop startup`14000d230` passes vtable`145907f38` through
`1454241d0` and`145452f80` into wrapper+`f70/f78`. Its slot`40` points to
`140030500`, exactly `xor eax,eax; ret`. Factory`14544fc79..fc92` calls that
actual slot and stores its false result at Game+`9a8`. The bounded native
fixture executes this indirect call and store. Choice publisher`1454ee470`
returns if that byte is0 or choice kind Game+`9b7` is`ff`; results publisher
`1454f0640` returns unless the capability byte is1. Consequently neither
publisher emits anything after a manual cast in this desktop configuration.

The enabled alternative is native Gossip, rather than the desktop custom
overlay. Both payload owners call`1454f9790`, which queues
`SMSG_NPC_TEXT_UPDATE` (`180`, serializer`14545e340`) followed by
`SMSG_GOSSIP_MESSAGE` (`17d`, serializer`14545cf50`). The result owner uses
localized `Victory! The zone is saved.`, `You left the run.` or
`You have fallen.`, followed by
`Survived {time}, level {level}, {kills} kills, {bosses} bosses slain.`.
Its rows are20 `Try again` (icon0), phase5-only21
`Keep fighting (endless)` (icon9), and22 `Return to character select`
(icon0). The phase2 owner instead formats the current spell/guardian/cache
choice menu. These alternate-host payload bodies are statically recovered;
they are not missing desktop presentation or evidence for adding a Gossip
replacement. Their text, allocation and packet bodies were not replayed in
the policy fixtures.

## Native object template response

Current opcode`5e` selects incoming arm`14544438b`, reads the first four bytes
as entry, and ignores the trailing GUID for its response. Selection
`145444b41..145444b72` assigns entry9005 type3/display259. Entries9006–9013
use type5 and the retained display table; other entries use type5/display2614.
Name owner`145420890` constructs `object.{suffix}`, applies current localization
and retains an explicit English fallback. Cache is `object.cache` /
`Battleground Cache`; Gold, XP, rune, Magnet, Lightwell, boundary and unknown
object names have their own current branches.

Serializer`145465300` emits opcode`5f`: entry/type/display, name plus NUL, four
empty NUL strings, then24 zero u32 data words. The local response enters the
existing `SessionEvent::GameObjectInfo` handler/template cache, so the normal
hover name and lock routing see the current native data. The engine bridge
previously dropped this actual outbound query; it now retains the entry. No
nearest-cache tooltip or inferred lock information is supplied.

[Current response evidence](evidence/object-queries/native.json) retains
two REA/Ghidra owners, PE byte hashes and17 unchanged-instruction selector/name/
empty-name packet cases. Native name construction stops before formatting and
localization; the exact suffix pointer and format prefix are retained. Packet
replay uses an empty name and enough buffer capacity, avoiding every external
allocation/copy call. This verifies all24 zero fields and the113-byte empty-name
layout; allocator behavior and localized nonempty string serialization are not
claimed as instruction replay. Reproduce with
`scripts/recover-object-queries.py`.

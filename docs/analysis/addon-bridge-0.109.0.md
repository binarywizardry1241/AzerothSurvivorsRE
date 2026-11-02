# Addon producers and client lifetime — 0.109.0

Gap **#11** has its selected source/static recovery and implementation complete
for installed EXE SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
All sixteen snapshot streams, their live inputs and admission rules, the immediate
banner extension, core API registration, ReloadUI, successful new-run cache
invalidation and terminal packet/VM ordering are connected. Compilation,
real-addon interaction and original/rebuilt gameplay/platform parity remain
unverified. This does not certify the underlying mechanics owned by other gaps.
Current project-wide status belongs to [verification-needed](../verification-needed.md).
This historical completion does not cover the 0.110.0 summon API and native
snapshot leads recorded by the [current EXE sweep](execheck-0.110.0.md).

The repairs replace an API prelude with the native core-file append, remove
invented per-run Lua resets and ReloadUI payload-cache invalidation, preserve
idle cache/clock ownership, remove forced off-cadence terminal snapshots, order
admitted Game events before snapshot polling, distinguish forced and ordinary
logout requests, preserve the native Lightwell NaN/signed-zero clamp, and publish
the native overdue next-boss sentinel.

## Producer fields and source connections

The [field ledger](evidence/0.109.0/addon-bridge/producer-fields.json) covers all
**129 scalar fields** in the six scalar format branches, plus ten list/event
schemas (the three meters share one schema). Every entry identifies its actual
live source input. The [initial owner manifest](evidence/0.109.0/addon-bridge/rea.json)
contains the sixteen main current producer/packet bodies; the
[helper and lifecycle records](evidence/0.109.0/addon-bridge/producer-rea.json)
add 46 current Ghidra-reviewed bodies. Raw import's GCC ABI inference does not
define the Win64 layouts: original instructions and selected data determine them.

| Stream | Current native owner | Connected projection |
| --- | --- | --- |
| `AZS` | `14591d8a0` | All 42 numeric fields: refreshed stats, raw worn-gear effect contributions, actual conditional/leech/lives/buff/DoT inputs. |
| `AZSZONE` | `145918690` | Active hero identity, localized class/race/zone fields, native zone/map and actual run modifiers. |
| `AZSRUN` | `145917730` | All 44 fields: phase/time/level/XP/vitals, actual living actor/lair counts, boss state/deadline, lives/rerolls/cache price, live damage/taken/counters, pending/stored levels, proc state and actual world pose. |
| `AZSBOSSES` | `14591b210`, `1459cf460` | Original schedule order; actual spawned/living boss state; consumed final flag. |
| `AZSUNITS` | `145919b40`, `1459bcd00`, `1459cdee0` | Living boss/final/guardian/elite actors; native kind then low-32-bit GUID order; first forty rows. |
| `AZSDEBUFFS` | `14591a430`, `1459bcec0` | Living boss/final/guardian auras without the unit-list cap; actual application count and timing/reduction/control fallbacks. Ordinary elites are excluded. |
| `AZSTGT` | `145919fe0` | Actual selected GUID and descriptor, live vitals/state/flags, dead-actor branch, or native no-target result. |
| `AZSSPELLS` | `145919eb0`, `1459a0240` | Learned abilities in order and racial last; live rank, remaining cooldown and native active/passive interval rules. |
| `AZSBUFFS` | `145919580`, `1459b9fe0` | Actual unexpired self auras in original admission order. |
| `AZSMETER`, `AZSHEAL`, `AZSBOSSDMG` | `1459a79a0`, `1459d6ce0` | Actual damage/healing/last-boss-fight ledgers; localized identity/proc merge, stable descending totals, native rounded amount/rate/share and boss timing. |
| `AZSCHESTS` | `145919d70`, `1459ba310` | Waiting caches in creation order; real position and native map-axis projection. |
| `AZSLAIRS` | `1459196a0`, `1459cfaf0` | Actual fixed holders, living awake guardians, respawn deadlines/name/home/flag and map projection. |
| `AZSTAKEN` | `145919820`, `1459d7850` | Applied post-armor/post-absorb category totals, native stable descending order and delimiters. |
| `AZSEND` | `145916c10` | All 20 fields: terminal result and actual run totals/identity. Its effective-damage total is distinct from the rounded display-meter sum; collected magnets are actual successful collections. |

Active identity is retained with the run even when the editable menu changes.
Zone `1459186b6` and End `145916c36` bind their Game pointer from RDX. Both select
race from Game+305; Zone selects class from +304, then passes Game+306 to the
unsigned-byte formatter `145bdb210` for gender. End's two class branches both use
that same race lane. Source run entry copies `pick.hero.race` into
`RunPlayerStats::native_race` and retains `[race,class,sex,0]` in
`packed_player_field`; stat refresh preserves those identity fields. The scalar
adapter now reads those active-run fields. Editing or importing a different menu
hero therefore cannot change `AZSZONE` or terminal `AZSEND` race, or zone gender.
The new Rust regression supplies disagreeing menu/run identity before and after
run abandonment; it is authored but unrun. The current selector checks cover all
256 race-byte inputs, both End class branches and the actual u8 decimal
construction for all 256 gender-byte values. The narrow
[byte formatter extract](evidence/0.109.0/addon-bridge/identity-byte-format.asm)
references the existing current Save-schema range; the full Zone/End extracts are
not duplicated.

The current seven format templates, **113 spell API metadata rows**, twelve zone
records and sixty consumed boss identity/timing/final records match the retained
API-specific source assets. The checks use selected-image bytes and current
strides, not historical RVAs. Asset filenames retain their real recovery target.
The native map helper `14591b3f0` selects an exact map/area first, otherwise the
smallest same-map rectangle containing the zone center, preserving first-row ties;
missing map coordinates keep the `-1` sentinel.

The run deadline prefix `145917730..14591781d` uses the next scheduled boss's
native f32 minutes times sixty minus the actual run clock. After the five
scheduled bosses only endless mode admits its separate deadline. A positive
result survives; zero, negative and unordered results become `-1.0`, retaining
the next scheduled name. Proc owner `1459839a0` preserves the actual priority
bloodrage, seal-fate, SoulFire integer plus its distinct fractional credit, then
Lightwell. Lightwell's `MAXSS(0,fraction)` / `MINSS(1,result)` retains NaN and
signed zero; the source now preserves that operand behavior.

`client::sync_to_client` reads the actual Mechanics, selected target, world pose
and locale, creates the sixteen ordered messages only on an admitted poll, and
passes changed bytes through `LocalPresentationEvents`. Packet owner `1458c35d0`
uses type 6, language `ffffffff`, the supplied player GUID and
`prefix + TAB + payload`. The embedding's actual player GUID is 1. The ordinary
chat handler resolves the sender and fires `CHAT_MSG_ADDON` for the API and user
addons. No alternate consumer or neutral replacement runtime data is introduced.

## API registration, ReloadUI and caches

Startup `145891530` calls the core patcher `1459a7290` at `1458915c0`, before
server creation at `145891610`. The patcher appends the result of API builder
`145913300` to **Interface\\FrameXML\\WorldStateFrame.lua**. The exact 12,028-byte
API remains identical to its canonical [0.108.0 extract](evidence/0.108.0/addon-api.lua).
The numeric stats parser also remains byte-identical in the current EXE. The
source uses the ordinary core-file append provider, with HUD patch then API,
so API registration occurs in the real FrameXML chunk before external addons.
The character-pane stats parser remains available before that handler registers.

Native Lua registry `1451b58c0`, closure factory `14531c250`, thunk `145790c20`
and callback `1455f9f80` establish the session requests. ReloadUI is tag 5; its
callback queues that tag for the current client. Queue reader `145040a20` feeds
`14078a8d0`; its selected branch `14078ae5b..14078ae6e` only sets the pending
reload resource. Pending owner `140706880` consumes that flag and runs the
ordinary close/boot/install/load UI path (`140748010`, `140742c00`, optional
`1406d1d00`, `140747ed0`). It does not replace Game or notify the server caches.
The [dispatch assembly](evidence/0.109.0/addon-bridge/session-dispatch.asm) retains
the actual jump-table branches that raw-import pseudocode cannot reconstruct.

The API initializes its Lua tables on each fresh core-file evaluation. There is
**no extra per-run table reset** in the same VM; banner history and registered
callbacks consequently survive Again. A ReloadUI creates fresh Lua tables but
leaves the server's cached strings intact: an unchanged stream is not immediately
resent merely to hydrate that fresh VM. Changed runtime fields arrive on the
ordinary admitted polls. The source no longer invents a VM-identity cache key.

[Constructor/reset records](evidence/0.109.0/addon-bridge/lifecycle-rea.json)
follow startup through factory `1458d05c0` and constructor `1458acff0`. All sixteen
payloads start empty, selected target `+10e8` starts zero, and poll timestamp
`+10e0` starts zero. Successful frontend Again tag 6 and player login opcode
`0x3d` create Game through `1458bdf90` and clear those payloads/target; neither
resets the clock. The legacy `AZS` cache retains its allocation while fifteen
others release theirs; Rust allocation reuse is not a wire contract.

Menu/Logout drops Game while retaining those sixteen server caches. Idle server
updates still advance the same clock before checking Game absence. The source's
idle path now advances only that clock, including the Again loading interval;
successful new-run identity owns cache invalidation before its normal poll gate.
The gate `1458af477` admits ordered intervals of at least 0.2 seconds; unordered
or shorter intervals leave the timestamp unchanged. Equal complete strings,
including equal empty strings, suppress publication.

## Banners and terminal ordering

The [current banner manifest](evidence/0.109.0/addon-bridge/banners/manifest.json)
and [REA records](evidence/0.109.0/addon-bridge/banners/rea.json) revalidate the
0.108 extension against current owners/data. Sender `14594b0d0`, wire constructor
`1458ea070`, native cleaning `1458e6350` and six specialized constructors retain
the nine typed event kinds and ten actual sender call sites. All actual pickup,
cache, boss/guardian, unlock and achievement events reach this immediate stream.
IDs use the process-wide current atomic `14808a5c8`, initially one; equal banners
are still sent, including when the native HUD is hidden. Name/text delimiter
handling, localized constructors and consumed boss final flags are preserved.

Current server update drains Game packet queue `1458af17b..1458af298`, then the
frontend callback queue `1458af2d4..1458af3f3`, before snapshot gate `1458af477`.
`events::collect` therefore runs before snapshot synchronization in the source.
The Game-relative queues are `+618/+620/+628` and `+630/+638/+640` respectively.
Game drop `1458ab8e0` frees pending payloads and vectors; it does not send them.
Already admitted inbound messages are flushed while their VM/sender still exists.
No terminal action forces an additional `AZSRUN` or `AZSEND` outside the poll.

Frontend Again tag 6 persists, takes/drops the old Game, recreates it and clears
the payload caches. It retains the client/VM and has no logout-complete packet.
Frontend Menu tag 9 reaches `1458b8300`: only an active connection admits it;
then persistence, Game drop, connection deactivation, `SMSG_LOGOUT_COMPLETE`
(`0x4d`) and the frontend callback occur in that order. The current native cases
also verify that all sixteen cached payload slots survive that Menu owner.

Ordinary Lua Logout/Quit tags 0/1 share a pending latch; Quit records its quit
intent and exits when the session completes, or immediately without a player.
Their ClientCommand `0xa1` is encoded through `140649740` and `145a3e190` as empty
`CMSG_LOGOUT_REQUEST` (`0x4b`). Current server `1458b2580` sends successful instant
`SMSG_LOGOUT_RESPONSE` (`0x4c`, reason 0, instant 1), then tail-calls the Menu
return owner and sends `0x4d`. The local adapter now delivers these logical
responses in that order before ending its VM/session.

ForceLogout tag 4 takes `14078ad72`, checks the actual player, sends command
`0x46` through `14063af70`, and drops its send result without local teardown or
logout-state stores. Serializer `140649740` routes it to `145a3e160`, which emits
empty `CMSG_PLAYER_LOGOUT` (`0x4a`); the selected server opcode table directs
`0x4a` to its default return. It therefore leaves the local session intact.
Current completion owner `14078b060` observes actual LoggedOut messages, clears
pending, and queues AppExit only if Quit was armed. The source now queues its
ordinary Quit exit after the deferred response/completion/session-logout command.
ForceQuit tag 3 instead queues AppExit directly through `14078aefc`; it does not
request a logout response or synthesize an abandoned run/save first. The old
source did both, and that extra pre-exit behavior is removed. Server connection
cleanup is separate: `1458ae094..1458ae0dc` admits persistence/Game drop only for a
removed active connection. Shared server destructor `1458aae40` drops Game and
owned allocations without calling the run-save owner. These owners do not justify
turning every ForceQuit into an explicit Menu/persist transaction. The existing
source shutdown flush only writes already queued account commands. These are full selected client/wire/server
paths, not an inference from the server default alone.

## Validation and remaining limits

```sh
python3 -B scripts/check-addon-snapshot.py
python3 -B scripts/check-addon-lifecycle.py
python3 -B scripts/check-addon-contracts.py
python3 -B scripts/check-addon-banners.py
# Run the shared contract suite against the recorded API input.
lua scripts/check-addon-bootstrap.lua docs/analysis/evidence/0.108.0/addon-api.lua
```

The four current static checks pass **430 unchanged native instruction cases**:
22 countdown/poll, seven constructor/new-run/idle, 307 producer/identity/admission/
clamp/ReloadUI/queue/terminal, and 94 banner cases. The producer total includes
256 active-identity vectors, each exercising the Zone selector, both End race
branches and the original unsigned-byte decimal builder. They also verify selected byte
hashes, exact API/parser/metadata, every scalar ledger key, source connections,
registration placement and absence of invented resets/terminal snapshots. The
interpreted Lua harness passes all seventeen API branches against stub host
calls. Rust syntax parsing and Python AST parsing pass; authored Rust regressions
were **not compiled or run**.

These are isolated static instruction executions, not the original game or
rebuilt Rust. Allocation/free, formatting/JSON, packet delivery, persistence,
callback dispatch and selected external helpers have explicit recorded seams in
the relevant cases. The checks do not claim all native control-flow combinations
or every runtime producer value was executed. The ledger's full field/source
review and the bounded native execution evidence are distinct.

Each Python checker supports `--prepare-rea`, staging byte-verified raw carriers,
seeds and `rea-batch.py` plans beneath ignored `runtime/addon-bridge-0.109.0/`.
The producer checker prints its separate group plans; run each through
`python3 -B scripts/rea-batch.py <printed-plan>`. These plans do not launch the game.
Canonical prior extracts retain their actual target/hash rather than being
copied or relabeled.

No selected #11 producer-field, API-registration, ReloadUI-cache, banner or
terminal-delivery source dependency is deliberately deferred. Remaining work for
this gap is compilation and real gameplay/addon validation, including
fresh/ReloadUI VM observations, terminal actions, event order, platform behavior
and controlled original/rebuilt comparison. Upstream combat/stat/world and broad
protocol behavior remain separately owned reconstruction boundaries. No game,
installed save or configuration was launched or changed.

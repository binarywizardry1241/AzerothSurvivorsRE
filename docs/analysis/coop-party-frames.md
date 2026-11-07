# Cooperative party-frame status

Finding **#205**. Installed EXE: **0.123.0**, 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [current proof](evidence/0.123.0/coop-party-frames/manifest.json) binds the
sampled connection flags, ordinary party-list publication and existing stock
FrameXML consumer. The [historical notice repair](service-peer-flags.md)
keeps its original target and separate chat-delivery proof.

## Native producer and packet contract

The current frame owner `145c0c010` is reused from the
[selection proof](evidence/0.123.0/coop-selection/manifest.json). The host reads
the live connection getter `+38`, compares its result with cached client byte
`+4c2`, and updates that cache before the existing notice/recipient gates.
Controls set and cleared in one service pump therefore have no intermediate
sampled state. The separate local retry aggregate retains its own notices.
After sampled changes, call `145c0f3fd` invokes the ordinary party-list fanout
`145c2bd40`; that helper requires an existing world and the cooperative-world
flag, then visits actor slots zero through the retained remote count.

| Native owner | Recovered behavior |
| --- | --- |
| `145ca8a30` | Slot zero is online. A remote slot needs an assigned matching host connection; its online byte is cached reconnecting XOR 1. Missing assignments are offline. Dead/choosing state is not an additional gate. |
| `145c2d740`, `145c97350` | Build a list separately for each actual recipient; omit that recipient and preserve world-slot order. |
| `145adfc50`, `145bb5970` | Read the actual hero context, plain stored name and full world GUID. Omit abandoned contexts; death and a pending choice do not remove the row. Remote reads use the existing private-context swap. |
| `145c65c60` | Write opcode `0x7d`, the existing `SMSG_GROUP_LIST`. The two leading bytes are zero, followed by the u32 row count. Each row is UTF-8 name/NUL, u64 GUID, online byte and zero flags. A nonempty list ends with the host GUID and loot method zero/master zero/threshold two/difficulty zero. An empty list is fourteen zero bytes. |

These are the AS inputs to the existing engine group implementation; there is no
additional cooperative wire message or replacement unit-frame widget.

## Publication owners and source connection

`coop/party_frames.rs` supplies the exact ordinary packet. The installed
`gameplay/coop_party_frames.rs` publisher joins actual world slots, plain
names/GUIDs and abandoned state to the Session's sampled connection cache.
`145afbdd0` enables the cooperative flag at Game `+d52` only after remote
insertion; Driver's `+d62` addresses that same Game field through its `+10`
world option. `Mechanics::has_party()` follows that lifetime. Hosting alone does
not replace the cooperative-world gate.

The initial Begin is separate: `145c1efc7` adds remote contexts before
`145c1f234` builds actor zero's list, then `145c1f306` assigns connection rows.
The host source uses the same two passes after actual world readiness: construct
all admitted contexts, publish actor zero's initial list once per run identity,
then assign connection rows and send ZoneKey. Online bytes read the actual
still-unassigned row view and its native zero defaults. Only joined/nonclosing
rows enter this exclusive admission block; failed context admissions are omitted,
and phase two resolves stable GUIDs again before using actor slots. A separate
offline solo fallback uses the same once/run latch because it has no network
profile/bootstrap owner. The ordinary local wire queue retains either initial
packet until the local port is active, including the fourteen-zero-byte
solo/alone-host list.

Subsequent fanout occurs once at each recovered owner, without payload dedup or
revision coalescing: completed synchronization (`145c2b890`), actual connection
row removal (`145c2f5fa`), and the nonempty sampled connection/retry change batch
(`145c0f3fd`). The delivery helper `145c2e150` selects the first active local port
for actor zero; a remote requires hosting mode three, its actual assigned world
actor and synchronized byte exactly one. Source delivery uses the ordinary
engine parser/presentation queue locally and the existing Session queue for each
synchronized remote. Guests already admit opcode `0x7d` through their ordinary
engine feed. No new whitelist entry or transport message is introduced.

### Ordered AS input boundary (#63)

The native host loop receives and dispatches synchronously for one connection,
then retires that connection or advances to the next vector entry. A successful
Sync from an earlier peer therefore precedes a later peer's abandonment/list;
the reverse vector order produces the reverse snapshots. The old source
collected all messages and retirements first, applied every Left before messages,
and deferred all Sync work to Update. That lost both occurrence order and the
actual server row needed by an earlier buffered Sync.

`Session::begin_host_tick` / `next_host_event` now pause at each AS application
edge. Gameplay consumes it before asking for the next message or removal, so
initial-world publication and its group fanout finish while the actual assigned
row still exists. Every actual retirement emits its own Left followed by an
internal Removed with that occurrence's surviving assignment/synchronization/
cached-status view. Gameplay abandons that actor before publishing the list.
Multiple departures preserve each intermediate world and connection view.
Unknown removals and bulk close do not invent an additional group trigger.

The decoded Sync caller independently requires joined, assigned and not yet
synchronized (`145c2e503`, `145c2ea9d`, `145c2eaa7`). Completion sets `+4c1=1`
before another request is consumed. The resumable source checks those actual
fields at that same application boundary and drops repeats. A received Hero
only stores its sanitized profile; the separate Begin/bootstrap owner assigns
its actor. An unassigned Hero/Sync batch therefore does not fabricate or defer
a successful Sync. The source still requires its actual world/MPQ inputs to
construct the existing snapshot; unavailable inputs remain an explicit failed
source precondition, not synthetic world data.

The per-peer 200-frame budget, receive(None) retirement requirement, closing
10-second deadline and ordered vector removal remain intact. Reconnect-cache
sampling is a separate loop after all input, preserving the old cached value in
an earlier Sync and the final changed-batch fanout afterward. Live host flushing
uses the existing Last owner and native 1/60-second gate after these callbacks;
the standalone Session tick wrapper retains queued edges for isolated consumers.
Native synchronization appends to the client-owned outgoing vector before its
flag/fanout; a later retirement destructs that vector before transport flush.
The source likewise drops that peer's queued stream on later retirement without
an extra immediate Sync flush.
These checks establish the selected AS Sync/departure/publication interface,
not every engine-command handler or the complete driver/server lifecycle.
EngineCommand and Control still queue to their existing commands owner; their
full application-effect ordering is not certified by this selected repair.

The source previously emitted no ordinary group list from this live AS path.
Connecting it supplies retained party rows and offline/online changes to the
existing benilla group cache, unit-token feed and FrameXML events. Lobby identity
and in-run actor identity retain separate producers.

## Stock presentation and held objects

The configured archive chain resolves `Interface\FrameXML\PartyMemberFrame.lua`
to `patch.MPQ`, SHA-256
`3400432b33c0c8a1122b93af95343d8ce5eff60120ab0deea9a15d517cd99eaa`.
Lines 340–345 use `UnitIsConnected` to select full grey `0.5/0.5/0.5` health,
portrait desaturation, the disconnect indicator and a hidden pet frame. The
matching `UnitFrame.lua` uses the same grey value for disconnected mana.
The proof rereads those exact members and archive tables without exporting assets.

Current binding registration/factory dispatch reaches callback `145404ed0`,
whose selected predicate reads the fed unit connection boolean at `+3df`.
The current stock party feed `140788bc0` and member helper `14078e960` preserve
the engine's held/unheld distinction: a held object uses its normal live
snapshot; an unheld member uses its optional stats record's online bit.
`14078cf60` retains that record's bit for the ordinary party/raid lookup.
The retained source has the same split. **No held-object override is introduced**
and this source repair does not claim that every retained visible actor greys
immediately. The packet/status path and the actual rendered result are separate
evidence levels.

## Static checks and remaining limits

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-coop-party-frames.py
```

The check binds **seventeen current journaled Ghidra query receipts** and
**2,181 selected owner instructions**, verifies configured stock Lua and live
source connections, and passes **433 isolated original-instruction cases /
47,331 steps**. These cover online projection, exact packets, self/abandoned
exclusion, the connection predicate, world/role/sync/delivery gates, Begin
assignment, sampled flags and six receive/removal order permutations. Allocator,
byte-copy and vector-capacity helpers are explicit synthetic seams. Existing
full-frame and decoded-handler queries are reused; broader semantics are not
recovered again. Raw-slice decompiler ABI/stack assumptions and outside callees
remain limitations; checked original instructions govern the selected fields.

Eight source paths parse with the pinned formatter. Two Rust packet regressions
and three ordered-pump regressions are authored but uncompiled and unrun; the
existing retry/capped-departure regression also asserts ordered Left/Removed.
Compilation, actual network delivery, client/FrameXML execution, runtime
scheduling, grey-frame rendering and original/rebuilt parity remain unverified.
No game, network service or server is run.

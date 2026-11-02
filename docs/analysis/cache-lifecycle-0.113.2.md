# Ground-cache animation and removal — 0.113.2

Target SHA-256:
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This owns the source repair for **#49**; [verification-needed](../verification-needed.md)
retains its runtime/presentation comparison requirements. The game process was
not executed.

## Current native contract

The kind-2 pickup branch selects entry9005, display259, scale1, GO type3 and
flags0, then calls `145954610..145954940`. That constructor allocates one shared
serial, draws one yaw from the shared run RNG, publishes the full GameObject
descriptor and queues creation before the logical pickup append. Field14 is
**READY=1**. The actual selector, constructor inputs and call site are bound
separately from the synthetic constructor cases in the
[manifest](evidence/0.113.2/cache-lifecycle/manifest.json).

The current GO driver `1409d9dc0..1409dada3` selects **AnimationData147 (Closed)**
on first sight of READY. If Closed is absent, its model-dependent remap retains
147 when Close exists, otherwise freezes Open148 at frame0 when available, or
falls back to Stand0. The reused benilla state machine implements that mapping,
held-pose and one-window ownership; it owns model/rig, picking, events and removal.

Exact-GUID interaction `14593dc90..14593de07` requires running state1, the matching
kind2 record and planar distance at most10, then calls charge owner
`145954a70..145954c6e`. Its comparison also admits an unordered distance; source
retains that exact comparison. Walking uses the separate at-most3 comparison,
which rejects unordered distance. Unaffordable purchases retain the pickup.

After successful charging, removal `14594fd70..14594ff8d` erases the pickup and
queues **DestroyObject0xaa** for its GUID followed by its ordered auxiliary GUIDs.
The caller then queues sound1204 and the eligible choice request. This complete
route emits no separate OpenLock, state-change, custom-animation or
despawn-animation command and has no animation-duration delay. The reported
opening expectation does not establish another native command or justify
delaying removal.

The current client receiver `14118d7f0..14118de6a` reaches teardown through
`14094ac80` and `14116d5f0`. Teardown checks `DespawnAnimAnnounced`: an existing
announcement takes a separate `PendingDestroy` branch; the ordinary branch
calls `1410d88d0`, removes `Guid` and inserts `DespawnFade`. The marker originates
in the explicit GameObject-despawn-animation event, not DestroyObject. Its
announcement system requests AnimationData157 (Despawn), not Open148. Since the
cache publisher emits no such event, its ordinary removal does not enter that
announced-animation branch. The existing source's direct GUID-removal/fade path
matches this bounded consumer contract. Displayed behavior, fade timing and
generic announced-animation completion remain unverified. The
[receiver manifest](evidence/0.113.2/cache-lifecycle/destroy-consumer.json) binds
its system name, registration, vtable, handler, typed component identities and
selected branches to the current PE.

Five bounded REA/Ghidra12.1.4 dossiers recover the constructor, charge,
interaction, removal and GO driver; four more recover the client receiver,
marker branch, ordinary teardown and announcement consumer. Input/body hashes,
Evidence IDs and profile digests are in the manifests. The
[canonical assembly](evidence/0.113.2/cache-lifecycle/selected-native.asm) retains
the four relevant AS owners and GO selector/fallback window; the
[receiver extract](evidence/0.113.2/cache-lifecycle/destroy-consumer.asm) retains
its necessary boundary windows. Raw inputs, complete
dossiers and tool logs stay in ignored `runtime/`. Headerless imports omit
external data/types/caller coverage; exact installed PE bytes and instruction
replays retain those limits.

## Connected source

`gameplay/mechanics/chests.rs::ChestPort::spawn_chest_with_rng` now calls the
existing shared GameObject constructor (`passive_tick::lightwell_object`) with
the recovered cache inputs. It emits `RunEvent::PickupObject` before adopting
the pickup, preserving serial, yaw, fields, position and shared RNG. Timer-created
pickup metadata also retains the actual yaw, matching death-cache adoption.
Initial/timer and death caches share one publication path; later adoption does
not allocate or publish again.

`gameplay/client/events.rs` already maps that event to ObjectCreate with the
actual GameObject fields. Its First-stage collector precedes local session
synchronization; the normal inbound dispatcher completes each create before
model attachment and GO-state presentation. The actual model picker still sends
GameObjUse to the existing exact-GUID `click_cache` consumer.

The cache actor chain and cache-only descriptor builder were removed from
`gameplay/visuals.rs`. Their host-drawn M2 bypassed normal GO attachment via
VisualAttached and repeated creature-style sequence0. Removing that second owner
also prevents its logical-pickup pruning from directly despawning an entity the
client is tearing down. Purchases, population eviction and auxiliary cleanup
retain RemoveObject→ObjectDestroyed and the existing client lifetime. Rejected
or repeated clicks cannot manufacture another create, removal or reward.

## Static checks and limits

```sh
python3 -B scripts/check-cache-lifecycle.py
```

The checker verifies the complete current EXE hash, exact PE owners, input
selector/call site and retained assembly. **399 original-instruction cases**
pass:12 complete descriptors/shared-RNG outputs including serial wrap,
288 interaction profiles with repeat-click checks,3 primary/auxiliary removals,
25 state selections,40 missing-Closed fallbacks,7 walk boundaries and12 click-only
walk/hint policy cases, plus12 receiver marker/alive/generation branches.
Field-map storage, allocation/memmove/free, packet composition and choice
construction are explicit existing-engine seams. Removal/sound queue stores
execute; packet serializer or Bevy execution is not claimed. Receiver branch
fixtures supply the component-lookup result and stop before generic component
insertion/teardown, without executing ECS migration or hooks. Sine/cosine use
host sinf/cosf; Windows CRT bit parity remains unverified.

Live-source checks trace creation, client delivery, GO attachment/state,
host-cache removal and transaction order. Both changed Rust modules parse with
the existing rustfmt without source modification. Three authored Rust regressions
cover descriptor vectors, rejected/successful/repeated purchases and death-cache
population eviction; they are **unrun** because they compile code.

No further concrete source dependency is identified in this cache's
DestroyObject-only lifecycle. The distinct explicit-announcement/PendingDestroy
engine branch is outside that route and is not certified by this repair.
Compilation, Rust/ECS execution, actual MPQ loading/picking, purchase/rejection
interaction, audio, animation/fade timing, world-change cleanup and
original/rebuilt visual/gameplay parity remain unverified. #49 stays open for
those checks; broader treasure generation/transactions remain #18. Generic engine
reconstruction is outside this repair.

# Guardian target-frame health publication

[Gap #57 in verification-needed](../verification-needed.md) owns the reported
delayed/stale guardian target-frame health. Current static proof targets
**0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
Compilation, actual latency and original/rebuilt presentation parity remain open.

## Reported discrepancy and source cause

During an attack on a selected guardian, the right-side encounter tracker changed
health while the target unit frame updated very late, if at all. The report did
not measure a numeric delay, establish a complete freeze or identify the exact
guardian/GUID. A reported case describes normal behavior with the same addon in the
original game. The addon remains unchanged.

The two displays have distinct inputs:

| Consumer | Connected source |
| --- | --- |
| Encounter tracker | `game.actors` health/max → [addon_lists](../../crates/azeroth-survivors-re/src/gameplay/client/addon_lists.rs) → AZS_UNITS/AZS_GetGuardians. The tracker reads accepted encounter snapshots independently of unit-frame events. |
| Target getters | Guardian actor → [sync_visuals/unit_snapshot/unit_visual](../../crates/azeroth-survivors-re/src/gameplay/visuals.rs) → [register_units/ObjectStore](../../crates/benilla-app/src/local_client/actors.rs) → [feed_units](../../crates/benilla-app/src/ui_unit.rs) → selected target snapshot. |
| Target redraw | FieldNotice → [fire_field_notices/signal_unit](../../crates/benilla-app/src/ui_unit/field_events.rs) → UNIT_HEALTH/UNIT_MAXHEALTH for each token whose GUID matches and whose field watchers are registered. Stock FrameXML owns its bar; the addon hooks the bar and reads the same UnitHealth getters. |

`register_units` previously merged health/max into ObjectStore and emitted only
FieldChanged. The Lua unit-event dispatcher consumes the separate FieldNotice
queue. Ordinary `RunEvent::Damage` publication forwards combat logs, while the
changed visual snapshot supplies the actor's current HP. It therefore did not
produce the health notice needed to redraw an already selected target. Guardian
engagement additionally queues an ActorFields/ObjectValues block; registration
runs first, so it can consume the same edge before packet notification observes
it. An unrelated redraw or a target switch can reveal newer getters without
regular health events. This establishes a source defect; it does not measure the
reported game's exact delay or exclude additional runtime causes.

The local merge now emits the existing FieldNotice::Unit health/max IDs for
actual changes to descriptor fields22/28 on UNIT objects. Initial creation and
unchanged values remain silent. The ordinary feed still marks ObjectStore changed
only when its values moved. `LocalActorSet::Register` precedes Net and UiFeed;
`feed_units` pushes current selected snapshots, and `fire_field_notices` runs
after the snapshot pushes and token seats. Thus the event handler reads the new
HP/max. The existing watcher gate and GUID/token fan-out remain authoritative:
an unbound guardian raises no target event, and retargeting reads its whole
snapshot without manufacturing health events. Host HP updates continue to
preserve packet-owned display/morph/aura lanes.

The same path covers healing, guardian reset/revival, maximum-health rescaling
and death while the local unit is registered. Despawn/session teardown clears
registration and selection. While the in-game VM is absent, the existing shared
notice cursor drops events; a replacement VM receives current snapshots rather
than replaying earlier health notices. No timer, addon polling or tracker-to-bar
substitute was introduced.

## Current native vital contract

The [canonical proof](evidence/0.113.2/guardian-target-health/manifest.json) binds
one current assembly extract and a bounded Ghidra 12.1.4 observation. The
engagement block `14594ad5c..14594adde` reads actor health/max from `+160/+164`,
calls the current imported `ceilf`, and inserts fields28/22. The continuation
through `14594af3f` retains descriptor-map/packet-queue publication before the
current `Who dares enter my lair?` text. The fixture captures map insertions;
it does not execute the surrounding guardian AI, allocator, packet encoder or
Lua engine.

The native conversion uses signed 64-bit conversion followed by its low dword,
with a strict upper comparison against the current constant at `145ed69d4`, bits
`4f7fffff` (4294967040, the largest f32 below2^32). The conversion therefore
agrees with existing Rust `ceil() as u32` saturation, including exactly2^32.
Negative and NaN values publish0; fractional positive values ceil. Source
health/max conversion already follows this contract and needed no numeric
change. The encounter tracker retains its native float source; its custom
formatting remains independent of the integer UNIT contract.

## Current field-event consumer interface

The [current interface proof](evidence/0.113.2/guardian-target-health/interface-manifest.json)
revalidates the necessary shared consumer against this exact EXE. The queued
UNIT-notice arm `1406411c7..1406411f6` calls the current watcher wrapper
`144fae0e0` and signals only when it returns true. The wrapper reads the UI
model's actual UnitGuids and calls predicate `1450a9e10`. The signal owner
`1405e3020..1405e3456` maps ids16/22 through the current jump table to exact
`UNIT_HEALTH`/`UNIT_MAXHEALTH` strings, calls token wrapper `144fadb70`, then
passes each generated token as the event's single string argument. That wrapper
uses actual token builder `1450aa210`.

Three bounded Ghidra observations bind the current predicate, token builder and
signal owner. The signal raw import omits its external jump table, limiting its
decompilation; original-instruction fixtures separately map and execute both
actual health-event table entries. **Ten native cases** confirm selected target
delivery, no unbound/missing-player/mouseover-only delivery, and ordered target
then mouseover fan-out when both tokens name the selected guardian. Allocation,
model borrowing, vector growth and final Lua dispatch are explicit seams. The
fixture supplies the already queued notice's id/GUID and current token state;
it does not claim to execute the whole object-packet producer or VM queue.

The ordinary packet path's earlier `bridged` filter excludes GUIDs just brought
back from its Released table. It is not a snapshot of selection at field-write
time: normal live units reach the same later watcher check. Local registered
guardians do not enter that packet release/reactivation list. A separate
selection-time notice filter in the local merge would therefore change the
existing contract. Retargeting remains governed by current tokens when notices
fire. The older Vanilla addresses in shared-source comments retain historical
provenance; these current selected consumers now have their own target-bound
proof. No surrounding engine subsystem was reconstructed.

## Static validation and limits

```sh
python3 -B scripts/check-guardian-target-health.py
python3 -B scripts/check-guardian-field-events.py
```

The checker verifies the installed target, current ceilf import, complete
instruction boundaries, canonical evidence, the live merge/event consumer source
guards and **48 original-instruction fixture
cases**, including negative/zero/fractional/NaN/infinite inputs and the exact
2^32 boundary. CRT math and descriptor-map insertion are explicit synthetic
callbacks. Ghidra's raw import begins inside an owner and stops before its
continuation; its bad-data halt reflects that declared boundary. The assembly
and isolated original instructions own exact field/value semantics.
The second checker additionally verifies the ten current health-event
consumer/token cases and their uniquely retained executed instruction ranges.

An authored Rust VM regression traces local registration through the actual
unit feed and health-event dispatcher: consecutive damage/healing, max-health
and simultaneous health/max changes, death/reset, unchanged writes, an unbound
guardian and retarget. This test was not compiled or executed. The changed Rust
file was syntax-parsed with project rustfmt using stdout only; this is not Rust
type checking.

Builds, compiling tests, game/addon launches, sustained-damage timestamps,
interactive ReloadUI, stock/addon bar-and-text rendering, and controlled
original/rebuilt cadence/parity comparisons were intentionally not run. The
source notification repair and bounded native conversion recovery do not close
those remaining #57 runtime/presentation obligations or certify generic engine
ownership under #41.

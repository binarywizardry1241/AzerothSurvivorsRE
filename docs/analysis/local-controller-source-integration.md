# Local client controller integration — 2026-10-18

The playable adapter now activates the vendored client player rather than integrating screen-relative movement or writing a fixed camera transform. The selected reconstruction target remains the supplied 0.97.2 executable recorded in `target-refresh-0.97.2.json`. This source integration does not establish runtime or native behavioral parity.

## Source and implementation

The public source foundation is `samwhosung/benilla@7b608671a65274e0fe330da4a63f12da58162b61`, whose original archive and per-file hashes are recorded in [benilla-vendor.json](benilla-vendor.json). Its existing `player/controller.rs`, `player/input.rs`, `player/mover.rs`, `player/camera.rs`, and `player/camera_zoom.rs` remain the owners of movement, input, collision and camera behavior.

`benilla-app/src/local_client/player.rs` creates and updates an actual local self entity, descriptor, movement-speed block and GUID index entry. The ordinary self-create, embodiment and take-control chain activates it. Its public request supplies the recovered map/spawn/facing and run speed; an optional camera pitch is explicit rather than silently replacing the existing login policy. Pause disables the controller after its first adoption, releases mouse capture and held bindings, and shifts elapsed-time anchors when resuming. Session end removes the local body. Readback includes its run identity so a retry cannot accept an earlier body's pose.

The Azeroth `gameplay/world.rs` adapter reads that resolved pose. It no longer integrates position, snaps the player onto a separately elected floor, places the camera, or competes with the client for `Viewer` and `ViewFocus`. Its readiness waits for the matching actual body, the client's settle hold, and the streamed scene's presentability. Existing real-geometry terrain queries remain the mechanics' spawn/collision port; no missing navigation grid is fabricated.

The local outfit seam consumes already-resolved native display/inventory/slot records. The existing equipment resolver continues to own armor composites, head/shoulder attachment, held-model placement, grip and animation metadata. It avoids server item-template requests for the local display records and preserves missing/zero rows as empty slots. Recovered class/subclass/sheath metadata is supplied separately; no incomplete `ItemInfo` templates are manufactured.

`benilla-app/src/local_client/actors.rs` also exposes an external-visual identity seam. `LocalUnitVisual` decorates a real host-owned model root with caller-supplied GUID, display/scale, public-protocol UNIT descriptor and optional authored model bounds/ring radius. It registers that existing entity in the ordinary object index and marks its visual as already attached, preserving the host's meshes, rig, transform and animation owner. The normal exact posed-mesh picker can read its existing `Mesh3d`/`RigPart` children and rig palette; static parts receive the existing creature-pick marker. The host must provide a distinct unit GUID namespace rather than collide with the player. Duplicate or foreign ownership is refused. Teardown removes only registration metadata and preserves the host model. Optional local names are not persisted or expanded into invented creature-template records. `LocalTargetSelection` reads back the actual native mouse/script/TAB selection after its normal chain.

## Exact upstream test fixture

Compiling the app's lib tests exposed the known omitted `reference/lua_globals.tsv` include. The exact file was extracted from the existing project-local pinned archive, whose SHA-256 was checked first:

- Archive SHA-256: `4c9495f7941c48d6ef53b4f31340822fa0e400b3d4c4c87d5b2858a2687f04c7`.
- Archive member: `benilla-7b608671a65274e0fe330da4a63f12da58162b61/reference/lua_globals.tsv`.
- File size: 847,501 bytes.
- File SHA-256: `3341f03044fcf2cbc04d167a0c14c3bec312601357394927da5d8045b3ca7fbe`.
- Source licenses: repository [LICENSE-MIT](../../LICENSE-MIT) and [LICENSE-APACHE](../../LICENSE-APACHE).

The fixture is intended tracked source data. It is not regenerated, shortened or substituted for validation. Detailed acquisition metadata is also retained in `runtime/local-controller-fixture.json`.

## Validation and limits

The first successful focused validation used `./scripts/cargo test --profile menu -p benilla-app --no-default-features --lib local_ -- --nocapture`: 44 tests passed, including the new local descriptor/equipment and native UI feed/action fixtures. One existing data-dependent UI test returned its standard no-install skip because that command did not set `WOW_DATA`; the new local fixtures are independent of MPQ data. The separate pause-mid-jump fixture passed. The initial compile attempt failed only on the omitted fixture before its exact restoration. A default-feature attempt was interrupted to match the embedded runtime's disabled developer features.

After adding the body-identity guard, `./scripts/cargo test --profile menu -p benilla-app --no-default-features --lib player::local::tests -- --nocapture` passed all three local player regressions: appearance descriptor, pause-mid-jump age, and actual-body identity/readback cleared at session end. Logs are `runtime/local-controller-tests.log` and `runtime/local-controller-tests-summary.json`. No application launch was performed by this integration worker.

The external-visual registry's ownership/teardown, duplicate-GUID and withdrawn-snapshot-flag fixtures were authored after that validation checkpoint and have not been run by this worker. Its addition awaits the parent task's whole-application build and runtime validation; it is not covered by the earlier passing test counts.

Current-target evidence binds the initial constructor camera values and the supplied spawn/movement data; it does not yet bind every public Vanilla controller policy. Public source itself has documented deviations. The constructor pitch/yaw are not proof of final entry orientation: the ordinary take-control path can adopt body facing and a saved/login pitch. The native run's initial sheath state remains unrecovered. These are explicit fidelity limits, not reasons to restore the removed fixed-camera controller.

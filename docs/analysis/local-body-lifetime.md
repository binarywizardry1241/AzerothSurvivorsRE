# Local player removal ownership

Gap **#46** records a reconstructed-launch warning about a command targeting a
despawned entity. Source tracing identifies a concrete duplicate-removal path in
the local player bridge. The selected reference remains **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This repair concerns the reconstruction's ECS ownership; it introduces no new
original-game mechanic or native parity claim.

## Producer and lifetime

1. The current native terminal Menu contract sends logout complete before its
   frontend callback; Again retains the session. The hash-bound owners and
   admission/order checks are in [terminal flow](terminal-flow.md).
2. Reconstruction
   [`finish_client_delivery`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs)
   flushes `SessionEvent::LoggedOut` before calling `LocalClientSession::logout`.
   [`flush_events`](../../crates/benilla-app/src/local_client/events.rs) uses the
   ordinary inbound dispatcher, whose one-shot handlers apply their commands
   before returning.
3. [`net::session::logged_out`](../../crates/benilla-app/src/net/session.rs)
   takes `SelfGuid`, removes that GUID's entity from `GuidIndex`, and queues its
   recursive despawn. The disconnect/worldport paths also remove index entries
   when they claim entity removal, subject to their existing retention rules.
4. On the next frame, `LocalClientSet::Lifecycle` selects the inactive client
   state. [`sync_body`](../../crates/benilla-app/src/local_client/player.rs)
   calls `remove_body` before the Net stage. Previously, its retained
   `LocalBody.entity` queued another despawn unconditionally, although the
   inbound handler had already destroyed that entity. Its unconditional index
   removal could also unregister a replacement under the same GUID.

The cached local handle is therefore insufficient removal authority. Cleanup now
takes it and the run identity, but queues removal only while `GuidIndex` still
maps the old GUID to that exact entity. Missing/replaced entries mean the earlier
owner already claimed teardown. This works even before its deferred despawn
applies. For an owned entry, `Commands::get_entity` additionally rejects a stale
generation while admitting a still-reserved local spawn. `SelfGuid` clears only
when that GUID no longer has a registered body.

Local-only departure and run replacement still despawn their owned body and its
children. Cache/snapshot/pause cleanup and the caller's controller reset remain
in place. Final message delivery, logout-complete ordering, Again's retained
session and ordinary disconnect retention are unchanged. No global error
handler, log filter, blanket `try_despawn` or new lifecycle timing is introduced.

## Static validation and limits

- Installed-target inspection matches the registered identity above.
- `scripts/check-terminal-flow.py` passes **305 bounded native command
  executions and 1,936 independent FIFO model cases**, retaining its existing
  mocked seams. These checks validate the terminal contract; they do not execute
  the repaired Rust ECS cleanup.
- Rustfmt parses the changed source and the new regression module. Diff
  whitespace checks pass. No source compiler executes.
- Six [authored Rust regressions](../../crates/benilla-app/src/local_client/player/lifetime_tests.rs)
  exercise the production cleanup, including the actual inbound logout handler,
  pending inbound deletion, local recursive/idempotent removal, stale-generation
  reuse, a same-GUID replacement, and retirement of a reserved spawn. The tests
  assert whether a second command was queued, independently of warning handlers.
  They are **not compiled or run**.

The [retained launch evidence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/execheck-0.109.0.md#retained-reconstructed-launch-findings)
omits its failing command name and entity owner. The duplicate-removal source
chain also exists in the recorded pre-build revision `6f55b64`, but the exact
complete compiled tree was not independently established. This is a source-proven
producer consistent with that warning, not a fresh attribution of historical
entity `857v4`. Compilation, executing the regressions, current launch behavior,
and original/rebuilt comparison remain unverified under #46. No further source
change is justified by that unnamed historical warning alone.

# ChatFrame ownership at session end — 0.109.0

Gap **#45**, selected EXE SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns current status. This report diagnoses
the retained nil-ChatFrame warnings through source and installed FrameXML;
it does not claim a new game reproduction.

## Producer and lifetime

The two [retained log warnings](execheck-0.109.0.md#retained-reconstructed-launch-findings)
name one-line `(chunk)` bodies indexing nil `ChatFrame1` and `ChatFrame2`.
The sole production caller of `ui_script::run_or_warn` was
`ui_chat::end_chat_session`, generating exactly `ChatFrame1:Clear()` and
`ChatFrame2:Clear()`. It was registered in `OnExit(InWorld)` independently of
`ui_script::end_ui_session`, without an ordering dependency.

The latter closes the in-game VM, then installs a new glue/boot VM. In the
custom frontend the replacement contains only global strings and emote tokens,
with no frames. If that exit callback ran first, the later chat callback issued
its clear chunks against this replacement VM. An aborted entry can also exit
before in-game frames are loaded. This is a concrete source race matching the
two reported globals and chunk shape. The historical log lacks a stack and an
independently established exact compiled source snapshot, so its exact system
ordering remains unproved.

The hash-verified installed `FrameXML.toc` loads `ChatFrame.xml` before
`FloatingChatFrame.xml`. The former declares virtual chat templates; the latter
creates the actual `ChatFrame1` and `ChatFrame2` scrolling-message frames. Those
objects belong to the in-game VM, not to a global process-wide Lua namespace.
Current [addon/session recovery](addon-bridge-0.109.0.md) independently binds
Menu/ordinary Logout response/completion ordering to the selected EXE. Again
retains its VM; actual Menu/logout completion ends the session. This repair
preserves that boundary and makes no new whole-engine native-equivalence claim.

## Connected source repair

`end_ui_session` now owns chat queue cleanup directly. It finishes
`close_ui_session` (including the dying VM's `PLAYER_LOGOUT`, saved state and
host folds), resets the persistent `ChatLog`, then installs the replacement VM.
No separate chat-frame-clear callback or generic one-line chunk runner remains.
The old frame tree, scrollback and edit-box state disappear with their owning VM;
shutdown handlers can still inspect them until then.

Resetting after the final handlers also prevents a late queued line from leaking
into the next session. Cleanup reads no VM and tolerates a missing chat resource,
so an aborted entry or failed VM initialization requires no fabricated frames.
The existing pending-entry gate still prevents empty-VM shutdown saves.
`ReloadUI` uses `close_ui_session` directly, retains the chat queue as before and
replaces its own frame tree. The process-exit path needs no next-session queue;
same-character reconnect behavior is unchanged. Channel-session cleanup changes
only its engine-side joined-channel mirror and does not issue frame Lua.

## Checks and limits

`python3 -B scripts/check-chat-session-lifecycle.py` verifies the selected
target, eight registered MPQ hashes and the three current FrameXML members. Its
source checks establish the sole reset caller, reset-after-shutdown/before-VM
replacement order, frame-free cleanup, reload separation and aborted-entry gate.
Four isolated Lua cases reproduce the two old absent-global failures and verify
two frame-present controls. Their frame methods are explicit stubs; they do not
execute reconstructed Rust or a game VM. The compact
[evidence record](evidence/0.109.0/chat-session-lifecycle.json) retains exact
resource hashes and these boundaries.

The existing `check-addon-contracts.py` also passes its **307 bounded
native cases**, 113 metadata records, 129 scalar fields and seven wire formats.
That broader fixture includes the current Menu/logout dependency; its other
cases are not new #45 recovery. Its owning report retains allocator, packet,
callback and other explicit seams.

All five changed Rust modules syntax-parse. The updated Rust regression retains
the dying VM's frames and verifies that a separately built chat VM starts empty;
it is authored, **not compiled or run**. Compilation, actual ECS/worker/packet
scheduling, startup/logout/reload, persistence/input/rendering and original/rebuilt
parity remain unverified. No Lua error handler was silenced and no original
release claim is upgraded by this reconstruction defect repair.

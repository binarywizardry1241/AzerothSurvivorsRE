# Guest run settlement

Bound to the installed 145,357,824-byte EXE, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This report owns the recovered boundary and connected source for **#166** and the forced guest
Menu/Again account-transaction dependency **#174**. The
[manifest](evidence/0.119.0/guest-settlement/manifest.json) binds current PE
function extents, exact instruction/data spans, six unique historical-seed
relocations and ten completed durable REA/Ghidra queries. Historical addresses
were leads; current bytes, decoded operands and tables establish the contracts.
[verification-needed](../verification-needed.md) owns implementation and remaining gaps.

## Recipient and lifetime

Snapshot owner `145b14d80..145b1522d` chooses cached guest state when application
`+10 == 2`, the connection discriminator at `+ca0` is at most one, and the cache
at `+ed0` is present. It does not require a logged-in local client. Summary
`145b0f7d0..145b10b5d` admits snapshot phases **1–5**; absent state and phase zero
produce no summary. Account delivery has its own recipient gate and must not be
silently narrowed to the summary phase gate.

The guest close wrappers' additional `+fa8 != 0` test means a cached zone
string descriptor is present. It is not a player GUID or proof that the local
client finished bootstrap. ZoneKey receive arm `145b1c61f..145b1c713` resolves the
zone, loads the catalog's string pair and stores it at `+fa8/+fb0`. A subsequent
State can therefore be eligible for settlement before the reconstructed local
MPQ/client/Mechanics creation completes. The immutable cached state must remain
available until settlement; an End gate requiring local synchronization would
lose this admitted case.

The same ZoneKey arm snapshots the selected roster GUID from `+1870` to
`+17b0`, and calls `145b44960` with Save and the selected class at `+1240` to
capture Veteran bonus at `+1878`. That helper reads the `veteran` rank and the
maximum XP of classes 1, 2, 3, 4, 5, 7, 8, 9 and 11. It returns
`f32(rank) * 0.2` only when the rank is nonzero and selected XP is below that
maximum; otherwise zero. Summary computes its seventh XP component from this
entry bonus. Looking up the now-mutated account at disconnect would change the
contract.

## Close causes and ordering

Each proved close path calls summary `145b0f7d0`, then account delivery
`145b15590`, before discarding the guest cache or replacing the connection.
Both calls use the current cached recipient, without waiting for party victory
or defeat. Their guards require connection discriminator at most one, a present
zone descriptor and a present cache.

| Cause | Current native route |
| --- | --- |
| End packet | Receive branch `145b1c31f..145b1c41b`, internal selector **17** in table `1472ddc0c`; the source wire End byte remains a separate representation. |
| Host transport dies | Poll `145affb40..145affb73` tests the connection's virtual `+28` alive result, then calls close wrapper `145b18a30` with exact reason `the host left`. |
| Guest Menu/Again run requests | Request helper `145b19870` maps commands **6/9** through `1472dda88` to `145b198df`, then calls `145b18a30` with `you left the run` at `145b199b1`. |
| Leave party form | Frontend command **23**, through table `1472dd9d0`, reaches `145b001fa`; it calls close wrapper `145b18b70` at `145b0020f` before service state is removed. |
| Received completed/dead phase change | Receive `145b1d48a..145b1d4f3` records a changed terminal phase at `+18be`, then calls summary/account while retaining the connection. |

The State edge uses the received `flag_8c` effective-terminal flag; it does not
directly require local phase 4 or 5. It clamps received phase bytes at least six
to zero and compares the result to the saved edge byte `+18be`. A different
terminal phase updates that byte before settlement; a nonterminal State leaves
it untouched. ZoneKey initializes it to `0xff`. Each State must be handled in
receive order: a later running state in the same batch must not erase a prior
terminal edge before persistence.

Account/cache settlement and world presentation have different gates. Both
close wrappers inspect the copied `+fd1` in-world flag before calling guest
world teardown `145b1a630`; the End branch tests the same flag directly. A
lobby-only close can therefore settle an admitted cached recipient and close
the connection without forcing a world/menu transition. The saved raw Ghidra
results retain this conditional separately from the unconditional preceding
summary/account calls.

The direct-call inventory in the manifest is bounded to exact E8 instructions
verified at decoded boundaries in current declared extents. It also preserves
the ordinary poll and request summary calls; it is not an exhaustive indirect
caller proof. Existing solo/host semantics are separate from these guest close
contracts.

ZoneKey replacement clears the previous cache and resets the run's summary,
XP and counter checkpoints. There is **no settlement call in that reset arm**.
Adding a new late grant at zone replacement would invent a boundary. The close
transaction must run at the proved causes while the old snapshot still exists.

## Idempotence and account delivery

Summary replaces seven signed XP component checkpoints at `+17b8..+17e8`,
computes the positive wrapping sum of component deltas, excludes roster GUID
`0xffffff`, mutates class XP through `145ac3bb0` and calls Save `145aca5f0`.
The separate first-result flag `+18ba` guards roster/lifetime run and win
increments. Revisiting the result or closing after an already-saved terminal
phase must preserve these checkpoints and must not add the whole run twice.

Current account delivery `145b15590..145b15ac7` and recipient snapshot
`145b16920..145b16b9c` use the shared current
[friend-achievement evidence](evidence/0.119.0/friend-achievements/manifest.json).
The delivery excludes roster GUID `0xffffff`; showcase excludes local runs but
**does not exclude an admitted guest**. Five cumulative counters subtract saved
checkpoints at `+187c..+188c`, floor a negative difference at zero, and saturate
lifetime addition. The new cumulative values then replace the checkpoints.
Won-zone history and run/account grants follow, then Save, then notifications.
The cooperative won-history writer's population requirement remains the separate
**#173** contract. Existing earned dates/history and ordered immutable Save
consumers must be retained.

Notification owner `145b13d30..145b13fd8` runs before the close wrapper changes
connection state. Every new grant produces its frontend achievement event
through `145b41010` and the frontend sender. An active world also takes the
existing in-world notification/packet publication path; an absent world takes
the frontend notice path. Saving counters alone while dropping the queued
achievement output would omit a native consumer. This evidence does not recover
new packet schemas or authorize substituting a remote grant.

## Connected source

`gameplay/guest_settlement.rs` now supplies the common immutable `Snapshot`,
original `Entry` and independent `Checkpoints`. Both cached and live replica
inputs use existing Save/progression consumers for ordered summary, XP, run
counts, ordinary/cooperative feats and history. The cached projection keeps the
received lethal-history and membership records, original Veteran bonus, and
cumulative XP/count checkpoints. It does not fabricate equipment or Seen grants.
The existing dated achievement insertion preserves earned dates and duplicate
suppression. The cooperative won-history admission retains #173's count-two
guard from the shared current proof.

`gameplay/coop.rs` captures the roster/Veteran entry at every ZoneKey and resets
that lifetime even when the zone is unchanged. It settles each accepted State
terminal edge immediately, including before local-world construction. The
pre-world checkpoints and pending events transfer to the eventual `Mechanics`;
creating a world does not regrant an already-settled result. Pre-save XP and
zone-unlock receipts remain available to `terminal.rs` even after the account
transaction changes saved progress. While the run remains connected, ordinary
event collection retains the talent-context request and achievement consumers.

End, host loss, the guest Menu/Again action, raw Logout and form Leave now settle
before removing the cache, Mechanics or driver. Guest Menu/Again follows its
admitted-cache boundary even without an active local client; raw engine Logout
retains its separate active-client admission. `gameplay/mod.rs` returns before
all ordinary local tick work for replicas: current poll `145b00aa6..145b00ab0`
excludes application discriminator two from that local path. Guest account and
feat timing therefore belongs to the recovered receive/close boundaries.
Independent received equipment/Seen grants retain their existing owners.
Guest close presentation follows the active local-world gate; a lobby-only
Leave preserves its open form/page while still clearing connection/cache state
and delivering any admitted account transaction.

The shared `client/events.rs` talent/achievement formatter supplies close notices
before Logout/Disconnected. `coop.rs::queue_delivery` flushes the corresponding
received wire/presentation batch, then settlement output, then the final session
end, before restoring later queued frames. Account frontend notices in
`notifications.rs` survive removal of the run. This connects existing source
presentation consumers; it does not establish rendered, audible or native UI
parity.

The manifest binds **17 source connections and nine final source-file hashes**.
The checker inspects actual function and match-arm boundaries, admission gates,
checkpoint transfer and producer/consumer ordering, including direct guest
Menu/Again and the complete local-tick exclusion. Nine authored Rust regressions
cover cached/live repeated delivery, cached-to-world handoff, phase admission,
recipient restrictions, preserved dates/history, captured Veteran bonus and the
local-tick bypass. They remain **uncompiled and unrun**; their presence is not
runtime evidence.

## Static verification and limits

`python3 -B scripts/check-guest-settlement.py` verifies the selected
image, eleven full native function receipts, six unique relocation signatures,
24 canonical spans (**2,588 bytes / 554 independently decoded instructions**),
three dispatch tables, two reason strings and the exact Veteran constant.
**385 bounded original-instruction cases** pass: all 256 summary phase bytes,
60 guest End/close guard/order combinations, 50 Veteran rank/XP boundaries and
six seven-component signed/wrapping XP-delta vectors and five local-tick
mode-exclusion cases and eight copied-in-world presentation-gate cases.
Summary and account calls are explicit recording seams in close cases; Veteran's
maximum XP producer is a declared input seam for the selected arithmetic cases.
The checker also verifies the 17 structural source connections and nine source
hashes, then parses all nine changed Rust files through `rustfmt` on stdin with
child-module traversal disabled. These checks do not execute reconstructed Rust,
run its authored regressions, type-check dependencies or touch save files.

The ten retained query journals/results and matching persistent raw-slice
Programs remain reusable under ignored project runtime storage. Raw imports do
not supply external PE callees/data/types; table targets and exact instruction
bytes are independently checked. All addresses are static preferred PE VAs.
No compilation, compiling tests, game/client/network/server process, actual
save/configuration mutation or original/rebuilt comparison was performed.
Compilation, real filesystem delivery, presentation, live disconnect timing and
original/rebuilt parity remain unverified.

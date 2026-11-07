# Co-op bounded correspondence

Selected installed EXE SHA-256:
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This review extends the [0.119.1 recovery](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.119.1.md), preserving
its source knowledge and findings. The [current proof](evidence/0.120.0/coop-correspondence/manifest.json)
binds seven completed durable full-PE Ghidra queries, twelve original-byte
ranges, the complete guarded nine-cell chat table, eight source slices and
36 current liveness instruction fixtures. It establishes bounded current
contracts for `custom-game-server`, `custom-game-server-party` and
`custom-game-coop-trust`; it does not
certify whole modules, compilation, execution or parity.

## Lobby and selected-party lifetime — #183/#184

The source-first owners remain `coop_directory.rs`, `coop/session.rs`,
`coop_runtime.rs` and `gameplay/coop.rs`. Current service pump
`145aeaa40..145aeba11` retains the separately owned primary and optional secondary
transport fields, service-event production and dispatch. Current wrapper
`145af3480..145af353c` returns the primary state callback through mutex-object
slots `+a8/+b0`. The two selected-secondary helpers
`145af28a0..145af297a` and `145af29b0..145af2a8a` instead read optional
`+a0` and callback slots `+88/+90`; absent returns false, otherwise they test
state `==2` and `!=2`. These are distinct fields on the same current wrapper,
not assumed names from a historical address.

Current frame `145b072e0..145b0dba1` obtains the primary state and service events
from that wrapper, then uses the selected-secondary predicates at `145b08a07`
and `145b08ac2`. Its `145b08972..145b08b5d` gates retain the active party when
only the primary service fails and the selected secondary remains alive. Actual
secondary closure, absence and the other failure/cleanup branches remain
separate. The service pump and predicates retain identical normalized
instruction shapes in this bounded comparison, with current field/callback,
caller/dispatch and consumer checks supplying the semantic correspondence;
shape equality alone is not the proof.

The frozen proof's source slices record the pre-repair discrepancy. The
[current #184 source/static repair](coop-lobby-loss.md) now retains the
active selected-party transport, Session, queued traffic, run and presentation
on primary-only lobby loss, with independent relay heartbeats. Actual selected
relay loss, missing relay, Off/refusal and explicit Leave retain their native
failure/departure boundaries. The repair checks128 original-instruction cases /
2,684 instructions, live source guards and two Rust syntax parses; five authored
queue-only regressions remain uncompiled/unrun. Compilation, actual network/UI/
run behavior and original/rebuilt parity remain unverified. The original
36-case predicate fixture and its lock/transport-state seams remain canonical;
its pre-repair source receipts are historical observations.

## Actual peer departure — #185

Both dead-transport and explicit-close frame branches reach current removal
`145b26060..145b261ac`. Host mode 3 is required. The owner removes only the
selected `0x480` connection row, decrements count and, for its admitted hero,
calls abandonment `145b71d90`, roster publication `145b228c0` and the existing
left-status consumer in that order. The explicit-close caller closes its
selected transport first. Existing `Session::tick`, `PartyServer::disconnect`
and membership/game-party consumers remain the source counterparts. No new
missing source operation was identified in this rebound interface. Deeper
hero/health projection, delivery/timing and full equivalence remain pending.

## Guest Engine trust — #186

Current trust owner `145aa8d20..145aa95e1` is independently bound by diagnostic
`coop/trust.rs` Location 226:28 and instruction `145aa94c4→146f8e5d8`.
Guest receiver `145b261f0..145b275bd` checks mode/synchronization, calls its
opcode/body-length admission interface and selects the first active receiving
port before the transform at `145b274b0`. Delivery follows at `145b274f4`.
The exact gate/port and transform/delivery ranges are separate curated evidence.
The complete allowed-opcode domain's applicability remains independently #180;
this review does not replace it.

The bounded current transform preserves the earlier recovered cases: `0x51`
removes pipe bytes from the NUL-terminated name after the eight-byte GUID,
preserving GUID, NUL and suffix; insufficient or unterminated input passes
through. The guarded `0x96` table at `146f905e4..146f90608` has nine checked
cells. Types 0/1/5 use length/text offsets 21/25; type 6 additionally refuses
language `0xffffffff`; type 8 uses offsets 13/17; other types pass through.
Bounds/conversion guards precede pipe normalization, the NUL-inclusive length
rewrite and suffix preservation. Lone `|` becomes `||`, while a paired `||`
remains paired. Existing conversion/allocation interfaces retain their bounded
seams; generic engine/standard-library internals are not claimed recovered.

The manifest's pre-repair source slice admits and delivers unchanged payloads.
The [#186 source repair](coop-trust.md) now invokes the recovered
transform inside `CoopGame::guest_engine_packet`, after admission and before
both observation and client delivery. Its separate proof resolves the strict
UTF-8 seam and preserves zero-length/missing-terminal/suffix behavior; 655
original-instruction cases and three Rust syntax parses pass. The
resource-description `sanitize_text` path is a different consumer. Existing
benilla packet interfaces are reused. Compilation, actual packet/UI delivery
and rendered parity remain open.

## Exact admission — #163

Current host admission `145b24fc0..145b25bad`, specifically
`145b2526e..145b252a8`, requires protocol **5**, version length **7** and exact
**`0.120.0`** bytes before password/capacity/run-state checks. The rejection
branch is `145b25506`. Current original instructions compare `0x32312e30` and
`0x302e3032` at overlapping offsets 0 and 3, and the Ghidra handler independently
corroborates those values and ordering. Source `coop/server_party.rs::GAME_VERSION`
now supplies **0.120.0** to outgoing Join, incoming admission and the directory
Handshake; the fixed Join fixture is corrected as well. The
[#163 repair](coop-handshake.md) verifies all source routes and **3,081**
bounded native comparison cases. The manifest's source slices preserve the
pre-repair audit observations; use the dedicated current handshake checker for
the repaired source. Package metadata does not substitute for native proof.

The separate `server/party.rs` Location anchors at current admission lines
382/413/398 and removal line 479 agree with these two queried owners and their
actual `PartyServer::admit`/`disconnect` source counterparts. These specific
interfaces qualify `custom-game-server-party` for a bounded current contract;
the mixed server frame's nearby diagnostics are not used to assign this module.

The [#188 race repair](race-rewards.md) now binds current remote Hero
normalizer145aa97a0 and its class/race1–8 gate, independently of the host's
purchases. The co-op source sanitizer accepts that domain;3,584 bounded native
admission cases pass. Downstream Pick normalization retains its separate current
account proof. Actual peer/run/client delivery and parity remain unverified.

Reproduce the retained bounded native liveness fixture with:

```sh
PYTHONPATH=runtime/tool-state/python/armory/python-libs python3 -B docs/analysis/evidence/0.120.0/coop-correspondence/check-liveness.py
```

The original manifest verifier also compares its pre-repair source snapshots;
use the dedicated #163/#184/#186 reports/checkers for current source validation.
The original audit performed no gameplay repair; those linked source repairs
reuse its saved native evidence. No compilation, compiling test, game/client/
network/server execution, save/settings mutation or controlled original/rebuilt
comparison occurred. Current bounded correspondence does not transfer prior
runtime/parity evidence or close deeper dependency questions.

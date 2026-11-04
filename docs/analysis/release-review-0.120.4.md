# Supplied release review against 0.120.4

Selected installed EXE: **0.120.4**, 145,489,408 bytes, SHA-256
`7e3e3f9558de1d87e615592c7b5d83f00de393ac8efa4e67d8f9b634ed07d6bf`.
The [supplied notes](../CHANGELOG.md#01201) contain fifteen independent items:
three for 0.120.1, five for 0.120.2, two for 0.120.3 and five for 0.120.4.
Their permanent findings remain separate from #41 and from module registration.

The [current proof](evidence/0.120.4/release-contracts/manifest.json) binds twelve
original instruction ranges, four data ranges and nine durable Ghidra queries.
The bounded raw Programs use current original virtual addresses, with current
PE constants and guarded tables checked separately. They omit external bodies,
incoming references and data/type context. In particular, the receiver reports
allocator/free-tail warnings and the pump cannot follow omitted switch tables;
neither pseudocode output is a complete function proof.

Source was inspected first through `coop/relay.rs`, `relay_lifetime.rs`,
`session.rs`, `coop_directory.rs` and `server_party.rs`. The existing
[benilla provenance](benilla-vendor.json) and engine chat, clock, collection and
socket interfaces remain supporting boundaries. This audit does not reconstruct
their internals. Previous [0.120.2 relay](relay-sequencing-0.120.2.md),
[reconnection presentation](service-peer-flags-0.120.2.md) and
[boss-credit](release-contracts-0.120.2.md) recovery/source remain retained.
The old target-specific checkers reject this new hash; they were not relabelled
or treated as current replays. Pending correspondence is separate from missing
implementation.

The [0.139.2 explicit-close recovery](coop-close-0.139.2.md) resolves the
outer writer and terminal service teardown subcases of #206 on the later
target. The observations below retain their original 0.120.4 provenance.

## Individual supplied items

Each pending item names an exact current connection-ledger selector and a
bounded next investigation. `exe-connections.json` below means the current
[connection ledger](coverage/exe-connections.json), keyed by stable system ID.
Candidate achievement addresses are byte-window leads, not proved semantic
equivalence. The native contracts explicitly established below remain narrower
than the complete supplied claims.

| Finding / supplied item | Native/source investigation and next static step |
| --- | --- |
| #194 — 0.120.1 whole-party killing-blow summary | Retain the source/static repair under #195/#196 and its 0.120.2 provenance. Current candidate producer `145bbbb05`, local distributor `145b65434` and remote callback `145b478b0` require their dispatch/state/dependency correspondence check. Selector: `exe-connections.json:systems[id=custom-game-game-mod]`; inspect those owners and existing shared queue before re-registering this summary. |
| #195 — 0.120.1 every player still in the run earns boss feats | Existing `gameplay/mechanics/bosses.rs` and `coop.rs` supply ordinary shared histories to recipient-private account consumers. Current candidate history/distributor ranges above need the killer/abandoned gates and ordinary/enriched history fields revalidated through current State/save delivery. Selector: `systems[id=custom-game-achievements]`. This is current applicability work, not a new claim that the implementation is absent. |
| #196 — 0.120.1 Boss Hunter counts every party boss | Retain the repaired recipient-private wrapping counter and account delta/save connections. Current candidate local `145b65434` / remote `145b478b0` and state-builder `145af17f0` require counter-field, optional-loot ordering and account-consumer correspondence. Selector: `systems[id=custom-game-game-mod]`; recover those bounded dependencies. |
| #202 — 0.120.2 reconnect/run-survival summary | Current receiver/sender/pump owners establish selected sequencing and reset interfaces, while the complete reconnection lifecycle remains pending. Retain `SecondaryLifetime` and service-owned source from #198. Selector: `systems[id=custom-game-coop-relay]`; revalidate current retry admission, socket replacement and party retention before certifying this summary. |
| #203 — 0.120.2 automatic reconnect without losing intervening events | Current `145c61910` / `145c62120` establish the changed forward-gap and replay-budget boundaries under #210/#211. The complete saved-payload/control exchange, host/guest bootstrap and producer/consumer ordering remain pending. Selector: `systems[id=custom-game-coop-relay]`; follow `145c5d590` replacement/admission through replay and `coop_directory.rs` / `Session` / replication consumers. |
| #204 — 0.120.2 temporary pause and permanent departure after about a minute | `relay_lifetime.rs` retains its recovered 0.120.2 45-second retry deadline plus connection/silence/retry timers; the supplied approximate minute is not substituted as a new exact constant. Current party pause, remote expiry and ordinary departure must be traced from `145c5d590` transport state into `Session::tick`, `gameplay/coop.rs` and party lifecycle. Selectors: `systems[id=custom-game-coop-relay]` and `systems[id=custom-game-server-party]`. No complete current pause/timeout contract is claimed. |
| #205 — 0.120.2 chat notices, own notice and grey party frames | Historical chat evidence retains its target. The [current 0.123.0 proof](coop-party-frames-0.123.0.md) connects sampled reconnect caches to exact ordinary GroupList rows and native Begin/sync/removal/changed-batch triggers, with ordered AS application edges. Existing stock held/unheld state and grey-colour consumers are preserved; actual client/FrameXML rendering and original/rebuilt parity remain unverified. |
| #206 — 0.120.2 intentional close/leave ends immediately | Current guest-close owner `145c6c6b0..145c6c818` disables its handle and invokes primary/secondary send/close interfaces. Existing `send_relay` and `Session::end` preserve explicit Leave separately from retries. Selector: `systems[id=custom-game-coop-relay]`; recover the current outer writer arguments, terminal teardown and process-exit route before certifying immediate effects. |
| #207 — 0.120.3 joining the next party summary | Current Hosted/Joined reset is established under #208; no additional operation is invented for this summary. Selector: `systems[id=custom-game-coop-relay]`; finish #208's dequeue/reset interface and failure/end transitions, then compare actual next-party admission. Source has the prior service-retention behavior. |
| #208 — 0.120.3 fresh state after host exit, kick or closed lobby | Guarded native service cases 1/2 at `145c5dbb2` / `145c5dc63` reset the inner peer table through `145c65470`, call `145c73070` on service+`40` with peer0, zero service+`50` and flags+`1e1/+1e2`; Joined also sets active+`1e0`. `145c65470` drops retained pending payloads and empties the service inner table. Current `coop_directory.rs` Hosted21/Joined22 attaches new handles without this reset; the old retained state was intentional for 0.120.2. Trace the outside-slice `145c73070` deque interface and current Closed27/admission paths before implementing the exact reset. Selector: `systems[id=custom-game-coop-relay]`. |
| #209 — 0.120.4 smooth 3–5-player party summary | The three independently supplied mechanisms below have current native contracts and source discrepancies. This summary does not create a fourth invented mechanism or prove smoothness. Selectors: `systems[id=custom-game-coop-relay]` and `systems[id=custom-game-server-party]`; recover the remaining scheduling/replication dependencies, then separately validate busy 3–5-player runs. |
| #210 — 0.120.4 host updates go out immediately when busy | Sender `145c62120` gates/charges credit only while its sent cursor is below a separate replay boundary: `145c622e2..145c622f1` and `145c62314..145c6232e`. Fresh suffix traffic bypasses that budget; the rate/cap remains 1,572,864 bytes/second. Source `Relay::send_pending` gates and charges every queued payload. Recover the replay-boundary producers/control reset and scheduler ordering, then connect the fresh/replay distinction without changing unrelated transport behavior. Selector: `systems[id=custom-game-coop-relay]`. |
| #211 — 0.120.4 a lost update does not hold up later updates | Receiver `145c61910` accepts the exact next sequence; a larger sequence is also accepted when control-pending is clear (`145c61e7c..145c61e91`), advancing the receive value before delivery. Source `Relay::receive` retains the strict next-only rule and requests control for forward gaps. Recover all control/reset, ACK clamp and payload-delivery dependencies before implementing this current gap rule. Selector: `systems[id=custom-game-coop-relay]`. Duplicate/old/wrapping cases remain bounded by the actual unsigned comparisons. |
| #212 — 0.120.4 less service bookkeeping | The current pump ACK gate at `145c5fe35` consumes f32 **2.0 seconds** from `146199f20`, then only emits new receive progress. Source `Relay::poll` still uses 0.5 seconds. Recover the complete shared clock/control-priority route and outer send ownership, then update the bounded ACK cadence. Selector: `systems[id=custom-game-coop-relay]`. Reduced real server load is unmeasured. |
| #213 — 0.120.4 reconnect still works | Current control variants and selected retry/reset branches remain visible, with existing `SecondaryLifetime`, `Relay::reset_transport` and service-owned replay source retained. The changed boundary/index, new-party reset and forward-gap dependencies prevent certifying the entire old behavior unchanged. Selector: `systems[id=custom-game-coop-relay]`; complete current transport/control/replay correspondence and failure handling. Actual reconnection remains untested. |

## Other changed existing findings

**#163 — exact cooperative admission.** Current server-party Location lines
497/528 bind owner `145b25ad0..145b266bd`; `145b25d7e..145b25db8`
requires protocol5, length7 and exact **`0.120.4`**. The two overlapping DWORDs
are `0x32312e30` and `0x342e3032`. Source `server_party::GAME_VERSION` and
the fixed Join fixture still say **`0.120.2`**, shared by incoming admission,
TCP/relay Join and directory Handshake. This is a confirmed renewed source
discrepancy, not a package-version inference. Reuse the existing shared constant
and fixture when #163 is selected; password/capacity/session checks remain
outside this bounded proof.

**#198 — pending payload limit.** Producer `145c628f0` appends and then compares
the current pending-byte count against **16 MiB** at `145c62b04`; equality is
accepted. Source `MAX_PENDING_BYTES` remains **4 MiB** from the prior repair.
The existing #198 owns this changed limit and its overflow/liveness dependency;
the current source repair is retained, with this dimension reopened. Trace the
current overflow consumers before altering them. The new sender replay-boundary
and receiver behavior retain the individual supplied #210/#211 findings.

## Validation and limits

```sh
python3 -B scripts/check-release-contracts.py
```

The [static result](evidence/0.120.4/release-contracts/static-check.json) verifies
nine saved Ghidra query receipts and original bytes/boundaries for twelve ranges
(81 instructions). **616 original-instruction relay cases** check the sender
gate/charge and receiver sequence/gap branches in synthetic registers/row memory,
stopping before allocation, lookup, transport or payload delivery. **3,042
original-instruction admission cases** check the exact protocol/version gate.
These are bounded native checks and read-only source observations. They do not
execute the reconstructed Rust, exercise packet delivery or complete a claim.

All fifteen supplied items have an individual current assessment. Only the
explicit contracts above supply current bounded module registration for
`custom-game-coop-relay` and `custom-game-server-party`. Current-target
applicability of older achievement, retry, notice, timeout, frame and teardown
dependencies remains explicitly pending; prior implementation is not erased.
No gameplay repair, application compilation, compiling test, game/client/server/
network execution, installed-input change or controlled original/rebuilt
comparison occurred. Source execution, complete functional delivery and parity
remain separate and unverified.

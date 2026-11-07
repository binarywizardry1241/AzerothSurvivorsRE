# Cooperative reconnect and permanent departure

Finding **#204** uses the installed 146,228,736-byte EXE, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [bounded proof](evidence/0.123.0/coop-reconnect/manifest.json) reuses the
current relay pump, guarded wire parser and party-frame queries, adding the previously missing
330-byte ordinary-removal, assigned-hero consumer and 560-byte host-writer queries. The latter extends
the existing shared identity Program; it creates no second copy of that subject. The historical
[relay lifecycle](relay-sequencing.md) retains its original provenance;
[verification-needed](../verification-needed.md#gap-204) owns current completion and parity.

## Temporary interruption

Current pump `145bd7b80` retains the selected-secondary retry state rather than
immediately departing. Healthy connecting/connected paths bypass the retry
expiry branch. When an admitted secondary becomes unhealthy, the retry marker
starts once; subsequent attempts are spaced by at least **two seconds**.
The unhealthy branch fails only when its separately converted f32 elapsed time
is **strictly greater than 45 seconds** (`145bd9c92..145bd9cda`, constant
`1464ae134`). Valid non-refusal secondary input clears the marker. The existing
`SecondaryLifetime`, `poll_secondary`, relay reset and send-admission consumers
already implement those state transitions; they are retained.

This is transport suspension and later replay. It does not introduce a global
simulation-pause command. The supplied wording says other players may see a
pause for the reconnecting player. Service controls31/32 change a separate
reconnecting flag and leave the endpoint alive; source therefore retains the
same party member, actor, admitted profile and pending relay payloads during the
interruption. The separate [notice/frame finding #205](../verification-needed.md#gap-205)
owns that flag's presentation. Local silence detection and retry time are
distinct; no exact sixty-second replacement timer is inferred from the supplied
approximate minute.

## Permanent departure and source repair

The current guarded service dispatch table `1476a1e9c` binds decoded variant5
(Wire25) to `145bd88d8`. Its existing-endpoint branch writes only the outer
alive byte at `145bd8be0`, preserving the received inbox and separate reconnect
flag. Whether or not that outer endpoint exists, control proceeds to the inner
relay-table lookup at `145bd8beb`. A match removes the **112-byte** sequence/replay
row (`145bd8c8f..145bd8d17`), then releases its retained pending payloads.

The live source previously changed the outer alive flag alone. The Wire25
handler now calls `session::service_peer_departed`, which preserves that ordinary
queue-drain behavior while removing the matching inner relay state. Temporary
controls, local selected-secondary failure, explicit close and fresh-party reset
keep their separate owners. An absent outer endpoint does not prevent removal of
an existing inner row, and another peer's state is retained.

The current host transport's send slot at vtable `1476a1bd0+0x18` selects
`145be3e90`. Its existing-endpoint lookup admits queueing only when the outer
alive byte equals one (`145be3f9f..145be3fa8`), before calling the ordinary
inner producer `145bdd7f0`. Source previously let every host relay handle queue
output. The connected host writer now applies the native alive admission, so
processing a last buffered game request after permanent departure cannot
recreate the discarded sequence/replay row. Temporary reconnect flags leave
alive unchanged and do not prevent retaining ordinary pending output.

Earlier service events can already have emitted a native reply. In particular,
receiver `145bdc810` directly calls outer send `145bd7aa0` for a false control
before the pump processes a later Wire25. Source stores that callback output in
an adapter queue; the Wire25 boundary now drains it on the retained selected
transport before removing the peer. This preserves those earlier side effects
instead of cancelling output by peer ID. The normal Last drain follows the
runtime flush, while service-input processing precedes the next ordinary relay
poll/sender. Retained unsent pending messages disappear with their inner row;
explicit close's separate secondary flush order remains intact.

Current party owner `145c0c010` receives up to **200 outer transport frames per client per tick**.
It checks liveness only after receive reports no next message. A rejection's
separate close timestamp allows a live transport through **ten seconds**; a dead
transport leaves immediately after its buffered input drains. Removal
`145c2f510` preserves remaining connection order, abandons an assigned world hero,
updates the ordinary group/roster consumers and drops the removed record.
Record destructor `145c045f0` invokes transport Drop; the current host vtable
`1476a1bd0` binds that Drop to `145bd4870`, which releases its shared reference.
It does not invoke the explicit close slot. Current assigned-hero consumer
`145afc880` selects the actual nonzero actor, swaps its context, runs the existing
abandon/finalization helpers and reinserts the same world row. The internals of
those shared helpers retain their owning evidence; this is the departure
consumer connection, not a new whole-mechanics recovery. Retaining the service-owned outer
row after removing the local Peer therefore follows the native ownership.

The Session host pump (`begin_host_tick` / `next_host_event`) emits
`MembershipEvent::Left` only at that permanent
removal. `gameplay/coop.rs` consumes it through `leave_party_hero`, removing the
client association while retaining the world's abandoned actor and ordinary
account/health-scaling lifecycle. The guest's eventual selected-secondary failure
continues through its existing dead-host settlement. No additional pause,
independent remote deadline or replacement departure mechanism is introduced.

## Static verification and limits

`check-coop-reconnect.py` verifies all eight query receipts, the exact
current EXE/raw-subject mappings, guarded dispatch/vtable bytes, clock constants
and selected original instruction ranges. **101 isolated original-instruction
cases** cover f32 retry boundaries, the receive cap, ordinary/rejection liveness,
endpoint state preservation, inner-row deletion, shared-reference Drop and host
send admission.
Synthetic memory and stop seams exclude allocation, sockets, full hash lookup
and complete frame execution. The actual native removal and source call order
are checked separately from those cases.

Authored Rust regressions cover temporary interruption retaining the admitted
member and buffered input, permanent departure dropping pending sequence state,
unknown outer endpoints, late buffered response rejection, ordinary final
membership delivery and prior-control-reply delivery on the selected transport. They remain
**uncompiled and unrun**. Two changed Rust paths syntax-parse; that does not execute
them. No compilation, compiling test, application/client/game/server operation,
network connection or installed-input modification occurred. Actual interruption,
replay timing, service-side remote-departure scheduling and original/rebuilt
parity remain unverified. The client consumes the external service's Wire25;
its deployed timeout/scheduler is not supplied by this client artifact.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-coop-reconnect.py
```

# Party lifetime after lobby loss — #184

The installed **0.120.0** EXE is bound to SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
The source repair reuses the [current native correspondence](coop-correspondence.md)
and its canonical extracts/queries. The [repair receipt](evidence/0.120.0/coop-lobby-loss/manifest.json)
records the checked source, tools and bounded instruction results; no duplicate
native extract or fresh Ghidra import was needed.

## Connected behavior

`coop_directory.rs::transport_closed` now retains the service wrapper, selected
secondary, Session, party/run state and presentation on primary-only lobby loss
when an active service-backed host or guest has a selected secondary whose state
is not closed. The native secondary predicate is **state != 2**, so an existing
connecting secondary also passes. Keeping the closed primary worker in the
wrapper preserves native ownership and prevents an unsupported automatic
reconnect/replacement. A missing secondary still takes the failure path.

The source's active-role gate uses hosting or `CoopRuntime::is_guest`, alongside
`Session::is_service`. No active driver and a denied guest awaiting the final
drain are Off for this purpose. Native mode 2 forces cleanup in the current
frame even with an alive secondary; it is not admitted by the source retention
gate. The raw native gate fixture also checks modes 0/1/3/4/255 without assigning
those other raw values invented roles.

`Session::relay_alive` explicitly belongs to the party transport. Its host
listener/peer admission, upstream `connected`, queued messages and outgoing
relay commands remain live after primary-only loss. Directory events continue
to poll both workers and `send_relay` continues to select the secondary when
present. This keeps the existing network, gameplay, replication and client
consumers connected without replacing their engine interfaces.

Heartbeat dispatch now checks each worker independently on the existing shared
30-second deadline. The current pump's primary failure branch at `145aeb94d`
continues at the optional-secondary check `145aeb990`; an alive secondary must
still receive its heartbeat while the primary is closed. Both sends require
state 1; this differs deliberately from the broader lifetime predicate.

## Preserved failure and departure boundaries

An actually closed selected secondary still fails the party. Host relay failure
wins over simultaneous primary failure, as in `145b08a00..145b08aa2`; it marks
transport loss and releases both workers. A guest's secondary failure still
marks its upstream dead and drains already received packets before the existing
network/gameplay settlement path. Primary failure without a surviving secondary
still invalidates relay liveness. Explicit Leave still closes the Session,
drains native Leave commands, releases the selected relay and clears run/UI
ownership. The existing membership/removal/abandonment/roster route remains
owned by #185 and was not replaced.

## Static evidence and limits

Run from the checkout root with the existing Python dependency installation:

```sh
PYTHONPATH=runtime/tool-state/python/armory/python-libs python3 -B scripts/check-coop-lobby-loss.py
```

The check passes **128 original-instruction cases / 2,684 instructions**:
36 selected-secondary predicate cases, 72 frame retention/failure cases and
20 independent-heartbeat dispatch cases. Target bytes, canonical extracts and
three retained Ghidra results are verified before reuse. Frame cases vary the
primary failure flag, six raw modes, secondary presence and states 0/1/2.
Heartbeat cases vary primary state and optional secondary state, including 255.
Ordinary unpoisoned/uncontended mutex, transport-state, message-construction and
send callbacks are explicit seams; the frame replay stops before cleanup calls.

Live source guards trace the retention gate, independent heartbeat scheduling,
relay polling/routing, Session liveness/admission and existing Leave/transport-loss
consumers. Both changed Rust files pass syntax parsing with the existing
`rustfmt` parser. Five queue-only Rust regressions cover host/guest retention,
connecting/open relays, both failure orders, missing relay/Off, refusal and
explicit Leave; they are authored, **uncompiled and unrun**.

No further selected source omission was identified. Compilation, actual thread/
socket/service delivery, UI/run behavior and original/rebuilt parity remain
unverified. No game, client, network or server was run. Static replay and syntax
parsing do not establish execution of the reconstructed source or whole-system
completeness. #184 retains those deferred validation requirements; the separate
release summary remains #183.

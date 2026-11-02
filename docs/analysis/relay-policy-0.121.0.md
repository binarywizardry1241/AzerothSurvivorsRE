# Selected relay initial fallback — 0.121.0

Installed target SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`
(146,088,960 bytes). This report owns the source/static repair for **#215** and its contribution
to the **#214** network-support summary. Failure provenance remains the
independent #216 obligation; localized reason display is [#217](relay-locales-0.121.0.md).

The [current proof](evidence/0.121.0/relay-policy/manifest.json) reuses the retained
[0.120.5 policy](release-review-0.120.5.md) as historical knowledge, then binds the
required producer/state/factory/consumer connections to current code and data.
Current correspondence covers the selected policy, not the entire co-op system.
The broader replay/new-party contracts retain their separately numbered owners
and actual evidence limits.

## Endpoint and transport transaction

Current service pump `0x145c56f30` derives an optional alternate endpoint when a
selected relay is installed. It finds `://`, keeps the scheme, takes the authority
before its final colon and preserves the path, adding `/` when the path is empty.
For example, `wss://relay:8443/path` becomes `wss://relay/path`. A missing delimiter
or authority colon yields no alternate. This is the native string transformation;
the existing URL/WebSocket interface supplies the absent scheme-default port.
No additional scheme normalization, port constant or replacement URL parser is
introduced.

The initial transport is healthy while connecting through eight seconds, or
connected through fifteen seconds without binary input. An unhealthy transport
that has never been admitted consumes the optional alternate **once**. It closes
and drops the old transport, invokes the existing factory with that alternate,
authenticates the replacement, sends its heartbeat, retains the alternate as the
selected URL and samples fresh start/receive/heartbeat clocks. An unavailable
alternate produces the terminal failed state. Refusal still closes the selected
transport without trying another endpoint.

The factory installation at `0x145c5e344..0x145c5e3ac` binds callback
`0x145adf230` to shared owner `+0x1a8`, or pump payload `+0x190`. Its wrapper
delegates to worker constructor `0x145c562f0` and returns the existing transport
vtable. The initial selected connection and fallback call the same callback.
Current fallback `0x145c59135..0x145c59859` proves the close/factory/drop,
retained authentication values, authentication-before-heartbeat ordering,
selected URL commit and fresh clocks. Recovery stops at the existing
benilla/Tungstenite worker and binary service-codec interfaces.

`coop_directory.rs::SecondaryConfig` now owns the selected URL, optional alternate
and retained authentication. `SecondaryLifetime` publishes `Fallback` only before
admission and only once. Later admitted `Reopen` actions always use the retained
selected URL. The replacement worker receives the same `Authenticate` envelope
and heartbeat, then the lifetime samples fresh clocks. The old worker is stopped
before replacement. A source OS thread-spawn error keeps that stopped worker and
its bounded lifetime available to the next unhealthy observation; it does not
leave an absent-worker state waiting indefinitely. The native factory's OS
thread/allocation boundary itself is not executed by these checks.

The initial fallback and admitted reconnect have different inner-relay ownership.
Fallback `0x145c59859..0x145c598dc` only rewinds each pending peer's **sent cursor**
to zero. Sender `0x145c5c730` establishes that cursor's queue consumer. It neither
starts the admitted control exchange nor clears remote reconnect flags. Source
`Relay::initial_fallback` and `session::service_relay_fallback` preserve this
distinction. The separately retained admitted-reconnect branch performs its
control/reset transaction. Existing wider bandwidth/ACK/gap questions are not
declared repaired by this bounded connection.

## Static validation and limits

`scripts/check-relay-policy.py` verifies current installed identity,
13 exact instruction ranges, four durable Ghidra query receipts, constants and
actual source connections. **261 original-instruction cases** pass: 240 selected/
failure/admission/alternate/transport/timeout combinations, nine repeated
fallback attempts and twelve authority/path cases. The retained endpoint,
factory/authentication/clock/reset order and distinct fallback/reconnect source
connections are also checked through their live owners.

The fixtures use synthetic memory and explicit transport, monotonic-clock,
Rust split/reverse-search and formatting seams. The URL suffix fixture starts after the exact delimiter search;
its declared ASCII/bracketed-address cases are not a general malformed/credential/
Unicode/IPv6 URL proof. Raw Ghidra Programs omit external switch tables and
library/OS bodies; original instructions and independently read tables govern
the selected boundaries.

The changed Rust files parse through the pinned formatter without compilation.
Four additional Rust regressions are authored and remain uncompiled/unrun.
Compilation, actual socket/TLS/worker scheduling, restricted-network hosting or
joining, UI rendering and original/rebuilt parity remain unverified. No client,
game, server, lobby or relay service is started. #214 remains an unverified
real-network summary; source completion does not establish its advertised
reachability result.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-relay-policy.py
```

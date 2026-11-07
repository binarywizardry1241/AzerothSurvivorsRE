# Co-op event routing and TCP transport

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [manifest](evidence/0.115.0/coop-transport/manifest.json) binds thirteen
native owners, their canonical instruction transcripts, eighteen literal ranges,
five dispatch tables and eight completed durable REA/Ghidra queries. Current
integration and remaining multiplayer limits belong to #63 in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Reconstructed source

[`coop/route.rs`](../../crates/azeroth-survivors-re/src/coop/route.rs) corresponds
to original `crates/wenilla-rogue/src/coop/route.rs`.
`forward_to_peers` projects an existing local event to the event allowed for
other heroes. The caller retains the original for local delivery. Native owner
`14584a210..14584a68d`, called at `14587cb61`, performs byte-layout tests rather
than parsing arbitrary JSON:

- Require the exact leading bytes `{"type":"`; take the substring through the
  next quote as the type. Preserve the native permissiveness for missing closing
  JSON syntax; this function does not validate an entire JSON document.
- `hz` and `hzend` pass through unchanged.
- `hzt` requires the substring `"m":`. Cut at the first `,"in":`, or one byte
  before the original end if that substring is absent; append `,"keep":true}`.
  This preserves the target's native string-boundary panic for malformed input
  whose final byte is inside a UTF-8 codepoint.
- `banner` passes only if the text contains `"kind":"boss"`,
  `"kind":"finalboss"`, `"kind":"bossdown"` or `"kind":"guardian"`.
- Other events return no peer projection. This does not suppress local delivery.

[`coop/tcp.rs`](../../crates/azeroth-survivors-re/src/coop/tcp.rs) corresponds to
original `crates/wenilla-rogue/src/coop/tcp.rs`. `TcpConnection` owns the ordinary
standard-library socket, independent receive/send buffers and live flag;
`TcpHost` owns its nonblocking listener. Public `send`, `receive`, `pump`,
`close` and `is_alive` are the session integration surface. Payloads remain
opaque bytes: party lifecycle messages have their own binary codec, while the
route helper handles an inner client-event string. The transport does not add a
JSON handshake or select packet types.

| Contract | Current native owner | Source behavior |
| --- | --- | --- |
| Connect | `1458ad460..1458ad5d8` | Resolve the first socket address; connect with a five-second timeout. Set TCP_NODELAY, then nonblocking mode. Return connection/setup errors and release failed sockets. An empty resolved list reports `no such host`. |
| Host | `1458ad650..1458ad6e2` | Bind `0.0.0.0` with the supplied `u16` port, then set nonblocking mode. No hardcoded port is introduced. |
| Accept | `1458ada10..1458adb55` | Attempt one accept, configure TCP_NODELAY/nonblocking before exposing the peer, and return no peer on accept/setup failure. |
| Pump | `1458ace80..1458ad3be` | If live, read successive 16-KiB chunks into the receive buffer before flushing pending writes. WouldBlock ends that stage; Interrupted retries. EOF/zero write/other errors clear the live flag. A read-stage failure still reaches the write stage in that same pump. Later dead pumps perform no I/O. Successful partial writes remove only their consumed prefix. |
| Send | `1458adf20..1458adff9` | Append payload byte count as little-endian `u32`, then payload, and pump immediately. The receive bound is not applied to send; the native length conversion is a `u32` cast. |
| Receive | `1458addc0..1458aded2` | Pump, then read one four-byte little-endian length. Incomplete headers/bodies consume nothing. Lengths above `0x100000` clear live state and consume nothing. Exactly one complete frame is removed; zero-length and exactly-one-MiB frames are admitted. Already-buffered complete frames remain readable after closure. |
| Close | `1458ae000..1458ae050` | Pump once, shutdown both directions, ignore shutdown failure and clear the live flag. |
| Socket options | `145cbe5a0`, `145cbe6f0` | Current imports independently identify `setsockopt(IPPROTO_TCP,TCP_NODELAY)` and `ioctlsocket(FIONBIO)`. |

## Native startup inputs

The current `140014810..140015359` owner reads:

| Variable | Recovered selection |
| --- | --- |
| `WOW_ROGUE_COOP_URL` | Use its exact Unicode value. If absent/non-Unicode, change the native `https://wow.aethus.pl/` base to `wss://` and append `coop/lobby/`, yielding `wss://wow.aethus.pl/coop/lobby/`. An explicitly empty value remains empty. |
| `WOW_ROGUE_COOP_PASSWORD` | Use its exact Unicode value; missing/non-Unicode becomes empty. |
| `WOW_ROGUE_COOP_HOST` | Parse an untrimmed unsigned 16-bit decimal port, allowing the ordinary leading `+`; zero is valid. A valid port selects hosting even if binding subsequently fails. |
| `WOW_ROGUE_COOP_JOIN` | If the host value is absent/invalid, attempt this exact Unicode address through the recovered TCP constructor. Missing/non-Unicode means no direct connection. |

`StartupConfig::{from_env,from_values}` reconstructs this selection and exposes
`DirectTcp::{Host{port},Join{address}}` to the owning runtime. Reading this
configuration alone does not contact the native default service. The default
URL is recovered data; the TCP module does not implement its separate WebSocket
lobby service.

## Validation and limits

`python3 -B scripts/check-coop-transport.py` passed: thirteen current
native owner hashes and canonical extract hashes, eighteen exact literal
ranges, five dispatch tables, eight retained Ghidra identities and source
contract anchors. The durable query runner's completed result digests were
verified before the compact query certificates were promoted. Raw responses,
query journals, programs and function byte slices remain under ignored
`runtime/analysis/history/co-op/coop-transport/4fd00ac85af1` and `runtime/ghidra-queries`.

Both owned Rust files passed `rustfmt` syntax parsing using the existing local
toolchain. Seven Rust regression tests are authored for strict route admission,
visual/input projection, shared banner choices, fragmented/coalesced framing,
empty/exact-bound/oversized frames, delivery after EOF and startup selection.
These Rust tests have not been compiled or run.

Raw-slice Ghidra uses a generic GCC compiler specification and omits referenced
external code/data. Its route/pump pseudocode stops at omitted switch tables;
the full original instruction transcript and separately bound tables supply
those branches. Guessed decompiler signatures are not native ABI proof.

No compilation, real socket session, target execution/emulation, game launch or
original/rebuilt comparison was performed. The recovered source establishes
partial correspondence for these two AS modules. It does not establish
complete multiplayer implementation, public-lobby-service availability,
network interoperability, simulation authority, game-session fidelity or native
parity. The owning runtime must connect the packet codec, party state and actual
client-event consumers independently.

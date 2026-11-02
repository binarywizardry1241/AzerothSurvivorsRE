# Supplied release review against 0.120.5

Selected installed EXE: **0.120.5**, 145,498,624 bytes, SHA-256
`522e1c831b3b4627875a28a1030368ef9d2e7f98c5606c34cb30448d3b7d776e`.
The [supplied notes](../CHANGELOG.md#01205) contain three independent items,
retained as **#214–#216**. The independently discovered localized-presentation
source gap is **#217**, linked to the third item. Release text guides recovery;
it does not prove behavior, implementation or actual network results.

The [bounded current proof](evidence/0.120.5/release-policy/manifest.json)
binds **thirteen original instruction ranges, four durable Ghidra queries and
fourteen exact locale payloads**. Original-instruction replay checks eight guest
failure-flag combinations and twelve alternate-URL authority/path cases. The
receipts bind every raw slice to exact original PE bytes and virtual addresses;
external functions/data and indirect tables omitted by those raw Programs
remain explicit limits.

## Source boundary and retained recovery

Source was inspected first: `coop_directory.rs::Worker::open`,
`coop/websocket.rs::DirectorySocket`, `coop/relay_lifetime.rs::SecondaryLifetime`,
`coop/session.rs::Session`, `coop_runtime.rs::poll`,
`coop_ui.rs::status_message` and `coop_forms.rs::localized_reason` are the actual
connection/state/presentation owners. Paths below are relative to
`crates/azeroth-survivors-re/src/`.

The [benilla provenance](benilla-vendor.json), Rust byte-search/formatting
interfaces and existing Tungstenite transport are supporting engine/library
boundaries. Recovery stops at these interfaces. The connection worker's
ordinary HTTP redirects are distinct from the AS-owned alternate endpoint
recovered in the service pump; redirect-loop inventory alone did not establish
the supplied fallback.

The [0.115.0 transport](coop-directory-0.115.0.md),
[0.120.0 lobby-loss repair](coop-lobby-loss-0.120.0.md),
[0.120.2 relay/retry](relay-sequencing-0.120.2.md),
[reconnection presentation](service-peer-flags-0.120.2.md) and
[0.120.4 bounded release contracts](release-review-0.120.4.md) keep their actual
targets, recovered semantics and source repairs. Current connection-policy and
failure consumers are assessed below. Pending correspondence does not erase
those prior implementations or automatically revalidate their wider behavior.

## Individual supplied items

| Finding / supplied item | Current investigation, source difference and next static step |
| --- | --- |
| **#214 — Co-op works on more networks** | The two mechanisms below have bounded current native/source evidence. This host/join summary creates no additional invented mechanism and does not prove real restricted-network reachability. Selectors: `exe-connections.json:systems[id=custom-game-coop-relay]` and `[id=custom-app-screens-coop]`. Complete the selected-secondary factory/auth/teardown connections under #215/#216, then separately compare hosting and joining under controlled network failures. |
| **#215 — Automatic retry on the usual web port** | Current service pump `0x145b64cd0` derives an optional alternate URL by retaining the scheme, taking the authority before its last colon and retaining the path; the resulting URL has no explicit port. `0x145b66e8c..0x145b66f28` consumes that alternate once when the initial selected transport becomes unhealthy before admission, closes/replaces the old transport and supplies the alternate to the existing connection callback. `coop/websocket.rs:27–28` / `coop_directory.rs:40–52` still connect once, while `coop_directory.rs:760–766` reopens the same stored URL and `coop/relay_lifetime.rs:86–89` immediately fails an unadmitted unhealthy connection. Next recover the complete current callback/auth-envelope and initial timeout/cleanup interfaces before implementing this policy. Wider malformed/credential/Unicode URL behavior and actual scheme-default socket/TLS execution remain unverified. |
| **#216 — Accurate server-unreachable error instead of host-left** | The current frame checks disconnected guest trait slot `+0x48` at `0x145b18512`. The proved guest getter `0x145b74870` returns true only with a selected secondary, terminal failure and no prior admission. True selects the exact 33-byte relay-unreachable reason; false selects the ordinary 13-byte host-left reason. Source `coop_directory.rs:778–843` can publish relay-unreachable, but `coop_runtime.rs:264–271` subsequently labels every non-denied disconnected guest host-left without preserving this provenance. Next connect the recovered getter/state to terminal guest presentation and review teardown/status priority, retaining ordinary host departure and direct-TCP failure separately. Localization is the distinct #217 gap below. |

## Recovered alternate-endpoint and failure boundaries

The pump's exact `://` delimiter at `0x1475fec38` and packed formatter at
`0x1475fec3b` govern the alternate URL. The authority/path suffix at
`0x145b66b94..0x145b66cf2` finds the first authority-ending slash and the last
colon within that authority. It formats `{scheme}://{authority-prefix}/{path}`.
For example, `wss://host:8443/path` becomes `wss://host/path`, and a URL without
a path gains `/`. The twelve original-instruction cases include both schemes,
case preservation, no explicit port, empty path, nested paths, query/fragment,
path colons and a bracketed IPv6 authority with an explicit port. This is a
string transformation, not proof of a general URL parser or unrestricted IPv6,
credential, malformed or Unicode behavior. No explicit replacement-port constant
was recovered: the transformed URL delegates the absent port to the existing
scheme/transport boundary.

The optional alternate occupies service payload `+0xd8/+0xe0/+0xe8`. Initial
failure takes it by replacing its option tag with `-1`, passes its pointer/length
to the retained connection callback and replaces transport `+0x130/+0x138`.
`0x145b675b8..0x145b675d2` commits the alternate as the retained selected URL,
so later admitted retries use that endpoint. After admission, the separate retry
path uses the retained selected URL at `+0x60/+0x68/+0x70`. This differs from
retrying an already admitted connection;
the prior service replay/lifetime recovery remains relevant within its target.

The guest vtable at `0x146fbca38` binds slot `+0x48` to `0x145b74870`.
Current frame construction at `0x145b16f75` supplies that exact table. The guest
receive owner at `0x145b74b0b` adds `0x18` to its shared owner before calling the
pump, establishing the shared-owner/payload relationship. The getter checks
shared owner `+0x78` selected-URL presence, `+0x159` failure and the inverse of
`+0x158` admission. These are pump payload `+0x60`, `+0x141` and `+0x140`;
current event and unhealthy-transport branches bind their producers. Eight
original-instruction cases verify the getter for valid booleans with an ordinary
unpoisoned, uncontended mutex. This is initial admission failure provenance,
not a general classification of every party departure.

## Independent localized presentation gap — #217

All fourteen current, descriptor-bounded JSON catalogs contain 2,991 keys and a
translation for `the co-op relay cannot be reached`. The consecutive 56-byte
locale descriptors begin at `0x1472c73b8`; the proof retains each exact payload
address, length, SHA-256 and translated value without copying entire catalogs.
Every corresponding source `assets/locales/{language}.json` lacks this key.

The actual UI consumer is also proved: the length-dispatch table at
`0x1461969cc` maps length 33 to `0x14008ae34`. That branch compares the entire
exact key, then reaches the ordinary localization lookup at `0x14008b8ed`
(`0x145b5e990`). Source `coop_ui.rs:319–340` calls localization only for reasons
recognized by `coop_forms.rs:173–194`, which also omits this key. Thus recovered
native data and a live native consumer establish a separate missing source
presentation connection. Next add the exact recovered translations and recognized
reason through these existing consumers; rendered sentence/font/input and
original/rebuilt comparisons remain unverified. This is not another supplied
changelog item and does not replace #216's failure-provenance obligation.

## Existing exact-version finding — #163

The separate [current admission proof](evidence/0.120.5/admission/manifest.json)
binds owner `0x145b34a30` and the 58-byte protocol/version gate
`0x145b34cde..0x145b34d18`: protocol **5**, exact version **0.120.5**.
Its 3,042 original-instruction admission cases pass. Source's shared
`coop/server_party.rs::GAME_VERSION` remains `0.120.2`; existing #163 owns this
source discrepancy. Package metadata or a prior version gate was not used as
native proof. Wider admission, client/server execution and parity remain open.

## Validation and limits

From the checkout root, with the existing project dependency directories:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-release-policy.py
```

The check verifies target, exact instruction/data bytes, independent Capstone
boundaries, four durable query receipts, the guest table and UI length-dispatch
entries, all fourteen locale descriptors/payloads, current source bindings and
omissions, eight getter cases and twelve alternate-URL suffix cases. The URL
fixture begins after the exact `://` match; forward/reverse byte-search and
formatting helpers are explicit Rust-library seams. It does not execute native
OS/socket/TLS code, reconstructed source or a server.

The raw pump/UI decompilations omit external switch tables; their incomplete
pseudocode is supporting navigation, while the retained original ranges and
independently read table/data bytes govern the bounded contracts. A separate
out-of-slice connected-getter query was truncated and supplies no liveness
proof.

No gameplay repair, application compilation, compiling test, game/client/network/
server operation or controlled original/rebuilt comparison occurred. Real
restricted-network hosting/joining, complete callback/auth/error ordering,
localization rendering and original/rebuilt parity remain unverified.

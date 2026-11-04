# Selected relay replacement in 0.141.0

Finding [#63](../CURRENT-STATE.md#gap-63). The installed
`installed-game/AzerothSurvivors.exe` is 0.141.0, 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [initial fallback](relay-policy-0.121.0.md) and
[replay policy](relay-load-0.127.0.md) retain their historical targets.

Service wire tag 30 selects the structured relay endpoint and authentication
reader at `0x14620526b`. The outer event pump at `0x145e83b10` decodes it
through `0x146204fa0`. The selected-secondary event branch begins at
`0x145e84594`. It takes the old secondary, serializes the Leave record at
`0x147ae2998`, submits it through slot +0x18 and calls close through +0x30.
If the old secondary is absent, the branch still continues to the reset.

The branch clears the map at service +0x1f8 and zeros its live count at
+0x210. Wire 25 looks up a departing peer in that same map at
`0x145e84a38..0x145e84a59` after marking its separate outer endpoint dead.
The branch truncates the guest payload deque at +0x40 through
`0x146051ac0`, zeros the deque length at +0x50, and clears the two guest
flags at +0x229 and +0x22a. The Hosted and Joined arms perform the same
reset at `0x145e8524f` and `0x145e851c0`. Joined alone sets the active
guest byte at +0x228. The secondary selection retains that byte and the
outer peer endpoints. It calls the transport factory at `0x145e85583`
after the reset.

The rebuilt [service pump](../../crates/azeroth-survivors-re/src/coop_directory.rs)
now calls the existing
[`service_party_reset`](../../crates/azeroth-survivors-re/src/coop/session.rs)
after retiring the old worker and before opening the selected relay. This
clears prior sequence and replay state, staged output, unread guest input,
and guest failure and reconnect flags. The Joined argument remains false,
so the active guest flag is retained. The existing worker still sends
Authenticate and Heartbeat in order. The admitted retry path continues to
preserve pending traffic under its separate control exchange.

| Selected PE range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Outer wire table `0x147b6d3bc..0x147b6d3f4` | `0x7b6b9bc` | 56 | `e7fbfc78593137fa78f40e58d9da923a46f47109b322f364ae4e611ad61a0701` |
| Typed event table `0x147aea194..0x147aea1c8` | `0x7ae8794` | 52 | `22e7a138e5143087d43d33ebd93d59d361a69ca173034552a68f1723b2bbcd38` |
| Old secondary retirement and map clear `0x145e84594..0x145e846e0` | `0x5e83994` | 332 | `9f9549d96180800d8143e148703d7275865bf8684bfe8b37931e48bd40edcc21` |
| Guest reset and factory call `0x145e8552d..0x145e85588` | `0x5e8492d` | 91 | `fbb7cd0fa9b70e2ea389d307a0e74870c2e131525200e918809caa857859f700` |
| Guest deque truncate `0x146051ac0..0x146051bb3` | `0x6050ec0` | 243 | `e6628f23da663ebf11f638293b2bcc38142db0bf19a34804e301a9e3a16aeca9` |

The Ghidra result
`ev_d3fe9997fd2b9937348afed77bcb1394b93d9edf48cd0ad0e3347967d590b23e`
uses the exact 14,669-byte event pump slice at file offset `0x5e82f10`,
SHA-256 `677969556c84644f08689ffccb9fbd38bba415de2a1a7f6cf58001877dadf5df`.
The direct response exceeded the response budget. The exported result
matched the journal's slice digest and yielded pseudocode SHA-256
`3aeee1df02a975dedd09e4e4eafea0cddea4b86ea9ffafee446bacb2508ba045`.
The exact PE table cells, Leave variant, instruction operands and live
source order were checked. Both changed Rust paths syntax-parsed with the
pinned formatter. The existing reset regression remains uncompiled and
unrun. Actual worker, socket and original/rebuilt comparison remain open.

## Local poller commands

The native game poller at `0x145ea3420` subtracts 22 from the local
request tag and guards at seven before the jump at `0x145ea7797`. Its
32-byte table at `0x147aeda3c` (file offset `0x7aec03c`) has SHA-256
`0042310fe14b49c9be3552fdc38788cb5c303f8bf07bc8d50be208fee1ded069`.
These are local request tags. Directory and game messages use their own
serializers.

| Request | Destination | Input and side effect |
| --- | --- | --- |
| 22 | `0x145ea7799` | The [terminal lobby status producer](switch-context-source-review-0.141.0.md#lobby-event-dispatch) triggers the existing directory refresh. |
| 23 | `0x145ea7cfc` | The Host form writes the tag at `0x1400ebc18`. The poller requires Off and no active game, ensures the service and passes the form/profile to the Host serializer. |
| 24 | `0x145ea7a72` | The Join form writes the tag at `0x1401055cb`. The same Off/game and service admission gates lead to submission of the code/password record at `0x145ea7bd6`. |
| 25 | `0x145ea7be1` | [Explicit form departure](coop-desktop-exit-0.141.0.md#appexit-type-and-local-departure-boundaries) reaches the terminal service writer. |
| 26 | `0x145ea7857` | The selected lobby row supplies the Hero identity at `0x140104d8d` before the tag write. The hosting poller finds that identity in an admitted peer profile, flushes the peer, submits wire 3 with `the host sent you away`, closes the peer and removes its row. |
| 27 | `0x145ea7df2` | The chat producers at `0x140104a03` and `0x140109a06` supply text. The poller normalizes it and routes host publication or accepted guest chat through their own gates. |
| 28 | `0x145ea8017` | The [host Ready Check starter](native-interface-correspondence-0.141.0.md#game-side-ready-check-routing) requires lobby state and at least two identities. |
| 29 | `0x145ea7c73` | The [Ready Check answer](native-interface-correspondence-0.141.0.md#game-side-ready-check-routing) cancels the host's current check or submits the gated guest response. |

The rebuilt [form queue](../../crates/azeroth-survivors-re/src/coop_forms.rs)
and [service pump](../../crates/azeroth-survivors-re/src/coop_directory.rs)
already route those actions. Kick and Chat use the admitted identities in
the [gameplay consumer](../../crates/azeroth-survivors-re/src/gameplay/coop.rs)
and the [session sender](../../crates/azeroth-survivors-re/src/coop/session.rs).
The table classification establishes these action identities and the
bounded consumer edges. The full payload, frame scheduling and delivery
contracts retain their own evidence.

## Host terminal transport failure

The active host branch at `0x145ea4b50..0x145ea4c26` reads the selected
secondary's presence and terminal failure flag. Failure calls role shutdown at
`0x145ea4c36`, takes the service, calls terminal close at `0x145ea4c7a` if the
service exists, and publishes `the co-op relay cannot be reached`. The primary
loss branch at `0x145ea54d1` keeps the host when a selected relay survives.
Otherwise it calls the same role and terminal close owners at `0x145ea54e0`
and `0x145ea5524` before publishing `the co-op service cannot be reached`.

The role owner at `0x145ec8730` sets Off and iterates the host peer rows.
It flushes each peer at `0x145ec8840`, submits a separate game Disconnect
at `0x145ec888a`, and invokes the peer close slot at `0x145ec8818` before
advancing. Terminal service close at `0x145e8dc70` submits Leave and signals
stop for the primary and then the optional secondary. The rebuilt
directory now takes the service host driver and uses these existing role
and terminal close paths while the worker handles are available. The
guest's selected-relay failure keeps its separate handling.

| Selected PE range | File offset | SHA-256 |
| --- | --- | --- |
| Host secondary failure input `0x145ea4b50..0x145ea4c26` | `0x5ea3f50` | `bcae483b2969fc580636a856f43bccaa1739a38a893e580d25094b89b0776a45` |
| Host secondary failure branch `0x145ea4c26..0x145ea4cbc` | `0x5ea4026` | `ab60dbcb28c39d58a64adf1b99cf0c1652c2e494c57a999aed66faed65ff0715` |
| Primary failure gate `0x145ea54d1..0x145ea5561` | `0x5ea48d1` | `1c95ede042c88eb89b365245052bff3d057282819369b94fbcc6fb25d7a059d7` |
| Role shutdown `0x145ec8730..0x145ec89d0` | `0x5ec7b30` | `21679304c84e9a127e8c9b8bfa4115067da44075de7c1b1ae751d78488775eaa` |
| Terminal Leave ordering `0x145e8dc70..0x145e8dd83` | `0x5e8d070` | `fd6ebef2289694de7ab3b06f98f3f77700e96fdf297c619a0c7212e5fd60e0c0` |

The Ghidra role slice is retained as
`ev_3e178d2ec15ae9799073b00f4a5bb23b06c71d28c573902d4a343efd4b9970f6`
in the shared result object
`97edc2d501c856a6e9a307487e04495d8be06372eb4dd8a23fd30c52d27fdddf`.
`scripts/check-coop-directory-transport.py --host-terminal-failure`
checked these five ranges and replayed eight terminal/preserve cases with
present and absent service state. It observes role shutdown, optional
service retirement, and reason publication at bounded call seams. The
queue-only Rust regression remains uncompiled and unrun. Socket delivery
and the separate [desktop exit handoff](coop-desktop-exit-0.141.0.md) remain
unverified.

## Selected relay heartbeat

The pump timestamps secondary Binary arrivals at `0x145e83ce1` while
collecting both worker queues, before decoding or processing the event batch.
Malformed Binary data refreshes the silence clock. A queued event from a
retired worker cannot refresh the replacement's receive clock.

The connected transport remains healthy through 15 seconds of silence.
The secondary heartbeat branch at `0x145e86082` checks transport state 1,
at least five seconds of receive silence, and at least five seconds since
the preceding heartbeat. It refreshes the heartbeat clock at `0x145e862cf`
and submits the Heartbeat at `0x145e86321`. The separate 30-second primary
heartbeat retains its own clock and state check.

The rebuilt directory poller samples receive time while collecting the
secondary batch. The secondary lifetime checks both five-second thresholds.
The original-instruction replay passed 256 connected-state and timer
combinations, including values immediately below, at and above each
threshold. The replay supplies monotonic elapsed time and stops before
heartbeat serialization. The Rust regression remains uncompiled and unrun.

| Selected PE range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Secondary Binary collection `0x145e83c43..0x145e83d1e` | `0x5e83043` | 219 | `332db01ee901825649cf76e27010a1d52ed85465b115e9a06701169ee4188e6f` |
| Secondary health dispatch `0x145e85e17..0x145e85edd` | `0x5e85217` | 198 | `c8e4911eed5558767ac5636db0ccdb3542f1a4b1fd61d93968e653e72b864c26` |
| Secondary silence gate `0x145e86082..0x145e86131` | `0x5e85482` | 175 | `2f6ebb2276311c41ce4842675149c963ba6b752a8350c6cd7ea41b40aa3f0171` |
| Secondary heartbeat gate and send `0x145e86290..0x145e86324` | `0x5e85690` | 148 | `0b29893dafbbf9e7c44bbda36d344838c25060c2d4f574cee04aca6b0e332b8b` |

## Party closure on wire 27

The wire-27 decoder arm `0x1462051a9` emits typed variant 7. That branch
at `0x145e84481` clears active guest admission, takes the optional
secondary and writes the same Leave record at `0x147ae2998` used by
wire 30. The writer at slot +0x18 runs before the close at slot +0x30.
The branch then clears the inner peer map. The primary and unread guest
payloads retain their separate lifetimes.

The rebuilt Closed handler submits Leave on the selected worker before
dropping it and clearing relay sequencing. The [terminal worker
drain](coop-desktop-exit-0.141.0.md#terminal-websocket-queue-drain) carries the
queued Leave through the socket's close path.

| Selected PE range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Wire-27 decoder `0x1462051a9..0x1462051d8` | `0x62045a9` | 47 | `69d19ee6f8d7837cbc06b790f7abbdd42ca7c3e25d9b83779300af9a740b14ac` |
| Variant 7 closure `0x145e84481..0x145e84548` | `0x5e83881` | 199 | `ca5d478870896c69227af0192b21b98aa7ec0cb8381506286e1db86747b9eca9` |
| Leave discriminant `0x147ae2998..0x147ae29a0` | `0x7ae0f98` | 8 | `cd1fe2a7b9cf8a4a0c6b7e34617cf4adc39d279dc230af36f4ee8e6d3cedffba` |

## Send admission after transport replacement

The native pending sender at `0x145e8ada0` chooses the secondary by presence.
It exits when the secondary is failed or retrying. Otherwise it samples the
selected worker and requires state 1 before advancing the send cursor. It uses
the primary only when no secondary exists. Queue submission calls this gate at
`0x145e8b696`. Host peer close also calls it at `0x145e920d8`, between the
primary Kick and selected-secondary Kick.

The rebuilt directory takes that readiness sample before the Join constructor
queues its first frame and before draining a closing peer. In particular, a
wire-30 replacement earlier in the collected event batch cannot leave the
Join on a readiness snapshot taken from the retired worker. The retained
pending queue and ordinary relay poll release the frame once the selected
transport is ready.

The original-instruction gate passed 128 combinations of selected worker,
failure, retry and transport state. The replay substitutes the transport's
state method and stops at sender admission.

| Selected PE range | File offset | SHA-256 |
| --- | --- | --- |
| Pending sender gate `0x145e8ada0..0x145e8ae1b` | `0x5e8a1a0` | `290d1a29c80b919f32e351c44d80de3acf954ab5b97c7742fd7a33579ce00896` |
| Queue submit call `0x145e8b68f..0x145e8b6a1` | `0x5e8aa8f` | `697afeaffe1d9a755417a3c8ef4359287ff3361649cd57195b918c2a36d7dcd7` |
| Host peer close drain `0x145e920cd..0x145e92117` | `0x5e914cd` | `ae80ba1454a9ca339ed452a2fc8b0c2d57ccbccaeb81bdc9ee50f1b7ef874c94` |

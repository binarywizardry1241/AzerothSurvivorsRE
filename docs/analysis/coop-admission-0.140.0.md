# Cooperative version admission in 0.140.0

The installed EXE is 0.140.0, 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
Its cooperative Join requires protocol **12** and the exact seven bytes
`0.140.0`. The directory handshake sends the same version and retains
directory protocol **3**. The reconstructed Join and directory routes still
use the version from the [0.139.2 repair](coop-admission-0.139.2.md), which
also supplies Join protocol **9**. [Findings #63](../CURRENT-STATE.md#gap-63)
and [#163](../CURRENT-STATE.md#gap-163) own the resulting source difference.

## Host gate and outgoing messages

The host dispatcher at `0x145ed0d50` reaches its Join compare block at
`0x145ed0ef1`. The block compares message `+0x38` with 12, the version
length at `+0x18` with 7, and the string with the overlapping four-byte
constants `0x34312e30` and `0x302e3034`. All mismatches reach
`0x145ed1184`. The admitted pair continues at `0x145ed0f2b`, before the
password branch. The diagnostic selector
`systems[id=custom-game-server-party]` is the module owner of the proved
host gate. Its declared body ends at `0x145ed19f9` and contains verified
`server/party.rs` Location references at `0x145ed16e1` to
`0x147aefc00` (595:63) and `0x145ed19ea` to `0x147af1278` (611:40).

The main driver body at `0x145ea8c00` calls the guest Join constructor
`0x145ecd080` at `0x145ea9fa0` and the host dispatcher at
`0x145eab333`. It carries Location references from both `server.rs` and
`server/party.rs`. The guest constructor stores the two version pieces at
`0x145ecd0ee` and `0x145ecd0f5`, writes 12 at `0x145ecd199`, and
passes the Join variant to the serializer at `0x145ecd1d9`. Serializer
`0x146055a20` selects case zero through table `0x147afe414`. Its arm
at `0x146055a91` writes tag 1, then the protocol word and the
length-prefixed version and password. The constructor submits the serialized
bytes through the connection writer slot at `0x145ecd212`.

The directory caller at `0x145ecbb77` enters the constructor at
`0x145e92dc0`. That constructor writes the same version and length and sets
the independent protocol word to 3 at `0x145e92e88`. It calls the service
serializer at `0x145e92eee`. Serializer `0x14620ad90` selects case zero
from table `0x147b73390`, writes tag 1 at `0x14620ae01`, and writes the
protocol word at `0x14620ae2a` before the version and staff key. The directory
caller and constructor have no Location-derived module ownership in the
diagnostic inventory. The direct call and exact operands establish this
handshake path within the selected scope.

## Source connection and remaining scope

`JoinRequest::current` and `PartyServer::admit` share `GAME_VERSION` and
`PROTOCOL_VERSION`. The native wire fixture checks their old values
independently through the reconstructed encoder and decoder. The direct TCP
and relay Join routes both call the same constructor. The directory worker
reads that shared game version. Its own encoder already writes protocol 3.
These connections localize the confirmed incompatibility to shared game
version and Join protocol admission, with the fixed wire fixture as a
dependent check. [Party server](../../crates/azeroth-survivors-re/src/coop/server_party.rs),
[session](../../crates/azeroth-survivors-re/src/coop/session.rs),
[directory](../../crates/azeroth-survivors-re/src/coop_directory.rs),
[service codec](../../crates/azeroth-survivors-re/src/coop/service.rs).

Compare the current serializer and receiver switch arms and their complete
payload fields before making claims about Hero, State, Control, Ready Check,
replication or server bootstrap compatibility. Directory discovery and
relay framing, retries, reply ordering and terminal close retain their own
proof scopes. A higher Join protocol establishes a changed admission gate.
The payloads and service contracts require their own current evidence.

## Exact evidence

All addresses are preferred PE virtual addresses. The host range and its
selector join bound the current `custom-game-server-party` evidence. The
outgoing and directory rows are supporting call and writer evidence.

| Range | File offset | VA | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Host dispatcher extent | `0x5ed0150` | `0x145ed0d50` | 3,241 | `ea2b1e699510c034e582240a5411012e997959ed28ce934b070f37c3bf8d0009` |
| Host Join comparison | `0x5ed02f1` | `0x145ed0ef1` | 58 | `62b15e8e9b4e83e43acd4849b5f49b7f3cad600a2dd8dfb0e3da2082b870a9d6` |
| Driver call to guest constructor | `0x5ea93a0` | `0x145ea9fa0` | 5 | `2181de58f66cbc16588fdc20079fdc4692451a9e78157e5500bb36f30b8378d5` |
| Driver call to host dispatcher | `0x5eaa733` | `0x145eab333` | 5 | `03905bfb446d2ba7de9099e765ac4332d562663eff4aca81809190efef059b98` |
| Guest Join constructor fields and submit | `0x5ecc4cc` | `0x145ecd0cc` | 343 | `27b77f597991821f868e8742b4e64119db6130cefc461b7fdbd55f7ea8be3806` |
| Join serializer case zero | `0x7afd414` | `0x147afe414` | 4 | `26a6e3246e83532ca78b7070770978e5623cb1ca25e53abda1ba0d668295973d` |
| Join serializer case zero body | `0x6054e91` | `0x146055a91` | 63 | `134edee6dab6f552b8efaa9b4d6359f177cca47474b0ebd39ae9b02d9ada2f73` |
| Directory call to handshake constructor | `0x5ecaf77` | `0x145ecbb77` | 5 | `2a3bdd4ca17166381a93b84d40f6c71490792ac8ce1b37a54f0ce8b6a27c2972` |
| Directory handshake fields and submit | `0x5e92209` | `0x145e92e09` | 267 | `86c5bc36e3b32272920e2035e709f81c181460a560fa0c5126e4d2b265e7ad6c` |
| Directory serializer case zero | `0x7b72390` | `0x147b73390` | 4 | `fa65a0058ab762223084cf529f73a1e29136334a1fbd1a7079487ee68dd1a296` |
| Directory tag, protocol and string writes | `0x620a1f3` | `0x14620adf3` | 241 | `1123111d815e2778c3f014fbef989874da8ed79f0d589f7e98e528139848dbf9` |

Capstone decoded the installed instructions from their declared function
starts. The existing `coop_handshake_check.replay` replayed **3,198 cases
and 13,362 original instruction steps**, admitting only protocol 12 with the
exact version. It substitutes packet and string memory and stops before the
success or rejection continuation. The existing source guard verifies both
routes and the fixed fixture against the retained 0.139.2 values, and
reports a protocol mismatch against the 0.140.0 gate.

Compilation, client or server execution, network interoperability and
original/rebuilt comparison remain unverified.

## Current co-op correspondence frontier

| Finding | Current selector and next action |
| --- | --- |
| [#150](../CURRENT-STATE.md#gap-150) | The same eight diagnostic source-location tuples occur in four relocated lobby bodies `0x14015b160`, `0x140178fa0`, `0x14017f7e0` and `0x140180860`. Map the retained chat cap and revision, list metadata and authenticated route through `coop_ui.rs`, `coop_forms.rs` and `coop_directory.rs`. |
| [#186](../CURRENT-STATE.md#gap-186) | Trust owner `0x145e37da0`, Location site `0x145e38544`, and guest call `0x145ed3321` select current receive admission. The decoded gate checks `0x51`/`0x96` and chat type at most 8. Map the remaining length, UTF-8 and delimiter cases through `CoopGame::guest_engine_packet`, `coop/trust.rs` and local wire events. |
| [#206](../CURRENT-STATE.md#gap-206) | Preserve the 0.139.2 ordered close proof. Trace current desktop Quit/window-close through process exit to game Disconnect 16 and service Leave 8, then check the primary/secondary writer order against the existing pause, menu, session and directory shutdown paths. |
| [#306](../verification-needed.md#gap-306) | Location site `0x145ecc394` in Ready Check owner `0x145ecc300` and host call `0x145ed142c` select the current receive path. Map sender admission, deadline update, tags 26/27 and UI delivery through `coop/readycheck.rs`, `coop/server_party.rs`, `coop/session.rs` and the existing lobby modal. |

The current relay diagnostic candidate at `0x145e891bc` refers to the six-byte
`resume` JSON key immediately before the packed path. The two verified relay
Locations and one TCP Location retain their original diagnostic scope.

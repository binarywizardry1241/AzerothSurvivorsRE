# Clock, recap and Ready Check interfaces in 0.141.0

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [0.140.0 interface correspondence](native-interface-correspondence-0.140.0.md)
and [Ready Check mutation](coop-admission-0.140.0.md#ready-check-first-answer-correspondence)
retain their own target provenance. For this review, the installed file hash
was checked directly and Capstone 5.0.7 decoded the selected current PE
extents. The [diagnostic inventory](coverage/diagnostic-ownership.json) binds
the Location-derived module assignments. Addresses below are preferred PE
virtual addresses and ranges are half-open.

## Local device clock callback

The line-22 diagnostic belongs to `custom-app-screens-localclock`. Five
instructions at `0x1401ab5a0..0x1401ab5be` store the exact name pointer
`0x146599d70`, length 19 and callback pointer `0x1401abad0` in the same
stack slots as the 0.140.0 descriptor. The name is `AZS_NativeLocalTime`.
The following call at `0x1401ab5be` precedes the `AL >= 2` branch. The
fallthrough begins preparing the descriptor and context for registration.

The callback calls the slot at `0x14654f8e8` from `0x1401abaea`. The PE
import table resolves that slot to `kernel32.dll!GetLocalTime`. The two
word loads at `0x1401abaf0` and `0x1401abaf8` read `SYSTEMTIME` hour and
minute. The language path checks length 2, the exact bytes `en`, and hour
12 to select the English AM/PM format. The reconstructed
[`local_clock::install_lua`](../../crates/azeroth-survivors-re/src/gameplay/run_hud/local_clock.rs)
sets `AZS_NativeLocalTime` and supplies formatted text, hour, minute and
the 24-hour flag. The
[addon bootstrap](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs)
installs that initializer. Native registration lifetime, formatter internals
and widget scheduling remain outside this bounded descriptor and callback
proof. [Verification #302](../verification-needed.md#gap-302) owns VM and
display checks.

## Death Recap payload consumption

The terminal owner at `0x14010c5d0` has `screens/recap.rs` Location context
and decodes to 364 instructions, including 37 direct branches within its
extent. Zeroing the encoded RIP-relative displacements and external direct
call immediates reproduces the predecessor's masked SHA-256
`eb13e6163999eb864957096ecbecce38a43812e13fb67a7ee5ded8fec7783111`.
The current generation read at `0x14010c6c0` is at `+0xe4`. The tests at
`0x14010c6ca` and `0x14010ca95` read the open-state byte at `+0xa0`. The
`recap` references at `0x14010c6dc` and `0x14010caa9` reach `0x146569e24`.
The `killer` references at `0x14010c6fb` and `0x14010cace` reach `0x146569e29`.
The four corresponding lookups call the same current helper at `0x1438a3970`.

The renderer at `0x1400f49e0` still resolves `secs`, `absorbed`, `hits` and
`avoidable`, as well as the Death Recap, Final Blows and Damage by Source
labels. Its masked SHA-256 is
`013b3920ff24db7c39f81c1fde0a033a20006a4f6828367d303607d0ba0d61c6`,
which differs from the 0.140.0 renderer. The exact references support the
named-field observation. The renderer's changed masked bytes require their
own correspondence work before extending the claim to the full extent.

The rebuilt [terminal view](../../crates/azeroth-survivors-re/src/gameplay/terminal_view.rs)
schedules [`recap::render`](../../crates/azeroth-survivors-re/src/gameplay/terminal_view/recap.rs).
The modal takes its recap from `TerminalState`, keys its lifetime to the
terminal identity, and renders the typed `DeathRecap` fields. This registers
the bounded payload-consumer scope for `custom-app-screens-recap`.
The [0.139.2 capture and delivery work](death-recap-0.139.2.md) and
[#300](../verification-needed.md#gap-300) retain the wider producer,
aggregation and execution questions.

## Ready Check first-answer mutation

The current `server/party/readycheck.rs` Location reference at `0x145ec5874`
binds `custom-game-server-party-readycheck` to the 168-byte function at
`0x145ec57e0`. It decodes into 39 instructions. Phase `+0x1100` must be 3.
The peer data and count are at `+0x1138/+0x1140`, with an `0x8a0` stride.
The peer profile sentinel and identity are at `+0x3a8/+0x590`. The active
check sentinel is at `+0x1180`, with response data and count at
`+0x1188/+0x1190`. The peer index guard reaches the Location-bearing
failure path and `ud2` if it fails.

The loop searches 16-byte responses for the selected peer identity. A
nonzero answer at row `+8` is skipped. The first matching pending row
receives `2 - r8b` at `0x145ec586b`, encoded `88 44 11 08`. The live
[host event consumer](../../crates/azeroth-survivors-re/src/gameplay/coop.rs)
calls [`Session::answer_ready_check`](../../crates/azeroth-survivors-re/src/coop/session.rs)
with the admitted hero identity. [`Check::answer`](../../crates/azeroth-survivors-re/src/coop/readycheck.rs)
updates the first matching pending row and leaves an earlier answer in
place. This establishes current correspondence for the local mutation.
The current caller's boolean normalization and the wider wire, deadline,
roster and publication paths retain separate proof scopes under
[#306](../verification-needed.md#gap-306).

## Ready Check modal construction

The current `screens/readycheck.rs` Location extent at `0x140142370`
contains the app-side backdrop and canvas path. The load at `0x140142f56`
copies two tagged 100-percent values from `0x146568060` into the Node
record. At `0x140143074` the immediate `48 b8 cd cc 0c 3f a8 16 00 00`
reproduces the 0.139.2 backdrop's packed 0.55 alpha and layer 5800.
The constructor stores that pair at `0x14014307e` and queues the backdrop
through `0x140326820`. Its next direct call at `0x1401430d8` enters the
canvas constructor at `0x140338b20`. The callee reads the tagged width
and height at `0x140338c88` and the plain canvas dimensions at
`0x140338d85` from the 24-byte block at `0x1465c4520`. Both pairs are
460 × 400. The scale cap store at `0x140338d96` writes `0x3fb33333`,
the `f32` representation of 1.4. The packed layout records reproduce
the corresponding bytes retained in the [0.139.2 modal evidence](evidence/0.139.2/coop-ready-check.json).

The [co-op UI plugin](../../crates/azeroth-survivors-re/src/coop_ui.rs)
schedules [`ready::rebuild`](../../crates/azeroth-survivors-re/src/coop_ready_ui.rs),
which creates the full-viewport blocking backdrop, alpha 0.55 and the
460 × 400 canvas capped at 1.4. The source Ready Check layer is 6100.
The rebuilt co-op lobby uses 6000 and [hero inspection](../../crates/azeroth-survivors-re/src/coop_inspect.rs)
uses 6080, so the existing source value places Ready Check above both
when their roots coexist. An isolated change to 5800 would place it
below them. Recover the surrounding native layer order and verify the
relative focus and occlusion before changing that integration. This
registers only the construction scope of `custom-app-screens-readycheck`.
Current response routing, timer and canvas lifetime, and native layer
correspondence remain open under [#306](../verification-needed.md#gap-306).

## Exact current ranges

| Scope | VA range | File offset | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Clock descriptor owner | `0x1401ab580..0x1401ab96c` | `0x1aa980` | 1,004 | `11450e367a7b737ee4a6db6a708ea6c4ac6f03aa0145f085d11855a77a2e6a4d` |
| Clock descriptor writes | `0x1401ab5a0..0x1401ab5be` | `0x1aa9a0` | 30 | `2da5a80bd1c54223d0c778af3e664391f9b8e45411b79772eb5ff68910c21278` |
| Clock callback | `0x1401abad0..0x1401abc31` | `0x1aaed0` | 353 | `964178472a38cfe8a656f82472cbb4f7d60d4a43ce72dd2230dd6e6b44191c74` |
| Recap renderer | `0x1400f49e0..0x1400f6722` | `0xf3de0` | 7,490 | `4f3f8be04f7d89721aa4b7baf9cb76ee4e5f21108483c99213b0cbec29ba0a84` |
| Recap terminal owner | `0x14010c5d0..0x14010cdaa` | `0x10b9d0` | 2,010 | `1250aa91d6f2dd6ddf173a532e70c4dfd2fa65ed9be47d87b8d6ec5cc7e8bb12` |
| Ready Check answer owner | `0x145ec57e0..0x145ec5888` | `0x5ec4be0` | 168 | `58ec8a09c567756b8726b9f9d103cc327ab8f05bbb4044b7e41d0bcae66eee94` |
| Ready Check modal owner | `0x140142370..0x140143259` | `0x141770` | 3,817 | `ae0d5ddfe1dbaf2bced4284a22cf511c7b6e48032b5d3d9d55d7903d4dd6c0bb` |
| Backdrop and canvas call sites | `0x140143074..0x1401430dd` | `0x142474` | 105 | `d7ea6967e7827418df5118e3873b4fb6e66735191a516c977e34f2ba40fffedc` |
| Canvas constructor | `0x140338b20..0x140338e3e` | `0x337f20` | 798 | `54609fe08dc8ef278a4247f4cdaa58ce47816386595bda34146268ac09258a74` |
| Backdrop dimensions | `0x146568060..0x146568070` | `0x6566660` | 16 | `5f505ae0f714cf77c9a198337585c124d69ece35995e4d1e68f4e991e039ac5c` |
| Node and canvas dimensions | `0x1465c4520..0x1465c4538` | `0x65c2b20` | 24 | `002e115a6c6bf804ce112816ae3aeee312221252b6a4b8ed04a0c0cdc3d1b0a3` |

Static instruction decoding, import resolution, referenced-byte checks and
source inspection cover the scopes above. The earlier synthetic replay
results keep their original target bindings. Compilation, client or server
execution, network behavior and original/rebuilt comparison remain open.

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

The renderer at `0x1400f49e0..0x1400f6722` has raw SHA-256
`4f3f8be04f7d89721aa4b7baf9cb76ee4e5f21108483c99213b0cbec29ba0a84`.
The earlier 0.141.0 comparison used Capstone's reported displacement width,
which is two for some SSE instructions with a mandatory `66` prefix even
though their RIP-relative encoding has a four-byte displacement. That left
address bytes in the comparison.

The retained 0.140.0 linear decode has 302 encoded reference records for
`0x14016c4b0..0x14016e1f2`. Overlaying their instruction bytes at the same
relative offsets in the current extent restores the exact predecessor
SHA-256 `76715cb61a4f47348669179eefb11d3d6e182433f9f3ca07948748fbcc4b15dd`.
The independent replay then checks all 1,279 instruction boundaries and
masks four bytes at each of the 166 RIP-relative displacements and 56
external call immediates. Both masked extents have SHA-256
`ba3aa8d4872b38d393f105bedbaa8f2d4fc03cdb28a76196b2afefb596532c01`.
The 645 differing raw bytes are entirely in those address fields. The
same relative branch targets, instruction encodings outside the mask, and
extent length are preserved.

The journaled Ghidra result for the 7,490-byte current PE slice agrees on
the instruction count. Its verified result SHA-256 is
`b48ac47846a875a2b2c7f58393cec51498e60b169cd1a580dfe52778e516cabd`.
The current renderer reads `total`, `secs`,
`absorbed`, `hits`, `by` and `avoidable` through the lookup at `0x1438a3970`.
The `by` list requires the array tag and a nonzero count before emitting
Damage by Source. The avoidable calculation checks both values against 1,
then divides, scales by 100, rounds and clamps to `[1, 100]`. These gates
have live counterparts in `recap::content`. The Death Recap, Final Blows
and Close labels also resolve in the current image. This comparison
does not establish the implementation of every referenced helper or the
effect of a changed call target or data value outside the extent.

The rebuilt [terminal view](../../crates/azeroth-survivors-re/src/gameplay/terminal_view.rs)
schedules [`recap::render`](../../crates/azeroth-survivors-re/src/gameplay/terminal_view/recap.rs).
The modal takes its recap from `TerminalState`, keys its lifetime to the
terminal identity, and renders the typed `DeathRecap` fields. This registers
the bounded payload-consumer scope for `custom-app-screens-recap`.
The [0.139.2 capture and delivery work](death-recap-0.139.2.md) and
[#300](../verification-needed.md#gap-300) retain the producer and
aggregation provenance and the remaining execution checks.

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

The lobby's outer constructor at `0x140103540` sends the same kind of
full-viewport Node and packed backdrop at `0x140103b1d..0x140103b5d`.
It writes alpha 0.75 and layer 5500. The ordinary lobby canvas at
`0x140357600` reads 820 × 680 at `0x140357763` and stores the 1.4 scale cap
at `0x140357871`. The active-party path at `0x14010a5ef..0x14010a77c`
selects 1120 × 680 instead and updates both canvas dimensions and Node
width. The inspector's outer constructor at `0x1401c6bf0` packs alpha
0.8 and layer 5600 at `0x1401c72d9`. The inspector's design dimensions
and scale cap remain independently traced in the
[inspection report](coop-inspection-0.141.0.md#read-only-screen).

The [co-op UI plugin](../../crates/azeroth-survivors-re/src/coop_ui.rs)
now spawns the fullscreen lobby backdrop and its fitted canvas. The
[inspector](../../crates/azeroth-survivors-re/src/coop_inspect.rs) and
[Ready Check](../../crates/azeroth-survivors-re/src/coop_ready_ui.rs) use
their corresponding native layer and opacity. This preserves the lobby,
inspection and Ready Check order when the three roots coexist. The
Ready Check root remains blocking while its own canvas refreshes.

## Ready Check visibility and answer routing

The modal owner calls `0x1400e49c0` with the current clock and the f32
2.5 read from `0x14656dd30` at `0x1401424a8`. The helper checks snapshot
presence, nonempty role and the exact party phases `hosting`, `joining`,
`joined` and `left`. Running snapshots bypass expiry. The terminal path
at `0x1400e4aca` returns a visible snapshot when current time minus the
stored receipt time is at most 2.5. The countdown updater at
`0x1401434c0` independently calls the same helper and computes
`min(left / 30 × 100, 100)` at `0x140143539..0x140143559`. The rebuilt
`ready_modal_visible`, localized countdown and fill width consume the
same inputs. Native drawing and frame-by-frame UI focus remain
unverified.

The changed-interaction collector at `0x140143b00` filters on interaction
change and pressed state. Its two storage branches read the Answer byte,
store it at request +4 and write tag 29 at `0x140143cf4..0x140143d0d`
and `0x140143ed4..0x140143eed`. Both submit to `0x140040100`.
No keyboard action enters this collector. The live UI consumes a changed
press on Ready, Not Ready or Cancel, and the existing runtime passes the
guest bool to `Session::send_ready_answer` or the host cancel flag to
`Session::advance_ready_check`. The lobby's `readycheck` event branch
at `0x140106444` and its typed state/answer consumer are separate from
the interaction collector. The [lobby dispatch
mapping](switch-context-source-review-0.141.0.md#lobby-event-dispatch)
binds that entry to its type selector. Current wire and authoritative
party admission retain separate producer and consumer scopes.

## Game-side Ready Check routing

The local-command table at `0x147aeda3c` selects commands 22 through 29
in the service poller. Command 28 enters `0x145ea8017`. It requires host
role 3, absent Game tag 2, no active check and at least two roster
identities. The iterator at `0x1460348b0` yields the host and qualifying
peer profiles in connection order. The new check writes its elapsed clock
and clears cancellation at `0x145ea81cb..0x145ea81d3`.

Command 29 enters `0x145ea7c73`. The host admits only a false answer
in the lobby and sets cancellation for an active check. The guest branch
at `0x145ea82a5` requires accepted state, no ZoneKey and no synchronization
request. It writes the bool at message +8 and emits native variant 26 via
`0x14604fa80`. The rebuilt guest now explicitly checks both world gates
before calling the existing accepted-session sender.

The updater `0x145ec5890` builds the ordered roster again. It checks
cancellation and exact roster equality before considering decline, all-ready
and expiration. It uses the f64 30-second deadline at `0x1469dcac8` and the
rounded-up remaining time at `0x145ec5bad`. Changed snapshots emit native
variant 25 through each qualifying peer connection at `0x145ec5f6e`
and reach the local UI through `0x145ef0420`. Terminal states consume
the active response list. The source connects these gates through
`CoopGame`, `Session` and `Check`, including first-answer ownership
and admission to the existing menu run-entry path.

The updater's 2,121-byte slice at file offset `0x5ec4c90` has SHA-256
`beaca0788e267a2e37ac89ac3c5bbdb89aea9abccf24f6f48e9558165926b5e6`.
Its journaled shared Ghidra result digest is
`8aa07a4f2ae51bebe5b4090bd25e9f8ce94431a2e792e8a162f539965d8c2696`.
Exact PE instructions bind the dispatch, payload and timer. The source
was syntax-parsed. Actual network and UI behavior remains in
[#306 verification](../verification-needed.md#gap-306).

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
| Lobby backdrop owner | `0x140103540..0x140103b81` | `0x102940` | 1,601 | `86c71c4f1858462a2167dd9176a14d0f10c236d710eaf685ad99f39c0d4b06b8` |
| Lobby canvas constructor | `0x140357600..0x1403578c5` | `0x356a00` | 709 | `7f7219897e237ec6c31e1554320e28b42a314e5c088868b1244b6574415ac2e1` |
| Lobby canvas resize | `0x140109fa0..0x14010afa9` | `0x1093a0` | 4,105 | `65818558a159bbdffe4d8eda5059cfcc0052083670511faea8d05d551e566090` |
| Inspector backdrop owner | `0x1401c6bf0..0x1401c7364` | `0x1c5ff0` | 1,908 | `1460373ddc06f32e62bd6160e461ff8349ecbfc8b69bd539d7d6c126a366309b` |
| Ready Check visibility | `0x1400e49c0..0x1400e4c85` | `0xe3dc0` | 709 | `6efd9ccf52b83408523d2cfb973a9f91d6c517d27b6a6e82bfb12916c1cef6d8` |
| Ready Check countdown updater | `0x1401434c0..0x140143aa9` | `0x1428c0` | 1,513 | `214bda7e8ecc417bd2b3bdb280442dad7bfe6edbe15af48bbfabf8415aa2a775` |
| Ready Check interaction collector | `0x140143b00..0x140143f18` | `0x142f00` | 1,048 | `bc8535dcc950124b6be70da08f67990a8fff9ac0b276f15065b960a548ce85f4` |
| Canvas constructor | `0x140338b20..0x140338e3e` | `0x337f20` | 798 | `54609fe08dc8ef278a4247f4cdaa58ce47816386595bda34146268ac09258a74` |
| Backdrop dimensions | `0x146568060..0x146568070` | `0x6566660` | 16 | `5f505ae0f714cf77c9a198337585c124d69ece35995e4d1e68f4e991e039ac5c` |
| Node and canvas dimensions | `0x1465c4520..0x1465c4538` | `0x65c2b20` | 24 | `002e115a6c6bf804ce112816ae3aeee312221252b6a4b8ed04a0c0cdc3d1b0a3` |

Journaled raw-slice Ghidra results were verified against their PE range
digests. The shared result digests for modal construction, visibility and
answer collection are respectively
`a3c97d779b4f3f6736660202e3a2f287648667148e113f86a6e7a21344098a3c`,
`5757343673fba7444e22294c2c8f3c6aa3cd3fd9100fc45dcdca6e57a2c2e62a` and
`032c3d6bf5cc6412353ed3419b9b9cac9a49afd9bc0f241f84dc61806778a7c1`.
Independent instruction and data reads establish external table and literal
references beyond the raw slices.

Static instruction decoding, import resolution, referenced-byte checks and
source inspection cover the scopes above. The earlier synthetic replay
results keep their original target bindings. Compilation, client or server
execution, network behavior and original/rebuilt comparison remain open.

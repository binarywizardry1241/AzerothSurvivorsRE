# Clock, recap and Ready Check interfaces

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [0.140.0 interface correspondence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-interface-correspondence-0.140.0.md)
and [Ready Check mutation](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-admission-0.140.0.md#ready-check-first-answer-correspondence)
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
The [0.139.2 capture and delivery work](death-recap.md) and
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
[inspection report](coop-inspection.md#read-only-screen).

The [co-op UI plugin](../../crates/azeroth-survivors-re/src/coop_ui.rs)
now spawns the fullscreen lobby backdrop and its fitted canvas. The
[inspector](../../crates/azeroth-survivors-re/src/coop_inspect.rs) and
[Ready Check](../../crates/azeroth-survivors-re/src/coop_ready_ui.rs) use
their corresponding native layer and opacity. This preserves the lobby,
inspection and Ready Check order when the three roots coexist. The
Ready Check root remains blocking while its own canvas refreshes.

## Picker Co-op button and pre-party lobby presentation

[Finding #150](../verification-needed.md#gap-150) connects the picker entry and
the three pre-party tabs to their 0.141.0 presentation. The source below uses
the constructors and field mappings from the installed PE. The original
screenshots corroborate the grouping and appearance of the controls.

| Surface | 0.141.0 constructor evidence and source connection |
| --- | --- |
| Picker footer | The row in `0x1403a7350` centers items with an 18px gap. Difficulty is submitted at `0x1403a75fd`. The Enter path finishes at `0x1403a8613`, before the Co-op wrapper call at `0x1403a861f`. [The picker footer](../../crates/azeroth-survivors-re/src/picker.rs) now uses this order. The wrapper at `0x1401386f0` supplies 20×8px padding, a 1px border, 6px radius, shared red gradient, 2px hover lift and black shadow. The child builder stores ordinary-font 17px gold and 12px muted text at `0x1403a2bde` and `0x1403a2d6e`. `0x140103b90` updates the subtitle from party, code and unread state independently of the title. |
| Modal frame | The frame at `0x14035dd7d..0x14035df58` uses 36×24px padding and 12px row spacing. `0x1401e8240` supplies the 1px border and 10px radius. The title at `0x14035e1a6..0x14035e376` centers a 34px heading-font label in light gold. The 12px-gap centered tab row calls `0x140358a80`, which uses 17px text, 18×6px padding and a 2px selected outline. `0x1401e7c60` draws the 1px transparent-to-edge-to-transparent divider. The shared footer uses a grow-1 spacer, centered status, and a centered 16px Close row with a 16px button gap. |
| Directory viewport | Lobbies at `0x1400ebda0` calls the centered, space-between header at `0x14035aa60` for the 14px description and Refresh control. The filter strip wraps with 8px horizontal and 6px vertical spacing. An absent snapshot, an empty response and zero filtered matches each use their own caption outside the viewport. When rows match, `0x1400ec8a6..0x1400ecb1a` gives the list wrapper grow 100, min-height 0 and a 6px scrollbar gap. `0x14035ac90` supplies the retained `coop-lobbies` viewport and 8px row gap. The source keeps original indices when filtering and reuses the existing retained scrollbar. |
| Public row | `0x1400e5e94..0x1400e5f80` builds the row with 12×9px padding, 6px radius and 14px gap. The content owner `0x1403546e0` gets its 40px leading icon from the first received class, with Warrior as the empty-list fallback. It separates the title, optional password and country badges, description and host/class subtitle from the right-aligned zone and difficulty. The 12px difficulty pill takes the received label for a nonnegative rank, with its low byte selecting the palette. `0x140355b9e..0x140356813` lays out the 18px class icons, raw count and 8px seat markers. The marker count clamps capacity to 1–5 and each marker compares its index with the raw joined count. The [row source](../../crates/azeroth-survivors-re/src/coop_directory_row.rs) consumes the existing directory fields directly. |
| Host and Code | Both forms call `0x1400e9220` for a 200px caption column and 14px field gap. The field at `0x140359280` has 10×6px padding, 3px radius, black at .45 alpha and a 1px idle or 2px focused border. The Host visibility and capacity rows use an 8px gap. The visibility helper at `0x140361930` constructs both options with complementary selection flags, sending action words `0x010f` for Public and `0x000f` for Private. RE assigns the chosen value so repeated clicks keep the same choice. `0x1403609da` shares the difficulty pill with the directory at 13px for the run card. Host and Join by code use centered 18px submit controls at `0x1400ef435` and `0x1400efc9d`. |

The [live lobby UI](../../crates/azeroth-survivors-re/src/coop_ui.rs) routes
these controls through the existing modal, focused fields and Host/Join
requests. The previously recovered filtered-row index, password handoff,
difficulty return and service state retain their own contracts. The active
party body uses the same grow-100 weighting beside the shared grow-1 spacer
at `0x1400e9a81..0x1400e9a89`.

Static verification used the installed SHA-256, selected retained Ghidra
instruction boundaries, LLVM disassembly of the constructor ranges, and Rust
syntax parsing and source tracing. Compilation and original/rebuilt rendering,
input, scrollbar behavior and network operation remain unverified.

## Zone cards and Enter highlight

[Finding #323](../verification-needed.md#gap-323) binds the picker presentation
to the installed 0.141.0 EXE, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [picker](../../crates/azeroth-survivors-re/src/picker.rs) already built the
localized zone description, boss chips and loading art, but allowed each card
to shrink inside the scroll viewport. The collapsed cards' 38px minimum leaves
the expanded card, which has a 0px minimum, absorbing the shortage. Its hidden
overflow can then cut off the description and schedule. Native
`0x1403aa74a..0x1403aa8ad` writes the card Node at stack base `rbp+0x3b0`.
The overflow store at `0x1403aa74a` is Hidden on both axes, while the store at
`0x1403aa82d` sets `Node+352` (flex shrink) to zero for both branches. RE now
keeps each card at its laid-out height and lets the outer viewport scroll.

The selected-card constructor `0x1403b32e0` passes the ordered 80-byte enemy
records to `0x140026ac0`, whose branches at `0x140026b00` and
`0x140026b80` skip records with byte `+0x4c` equal to 1. RE now selects from the
shared enemy definitions and looks up the same localized names by ID. The
boss loop advances by 104 bytes, reads the time at `+0x50` and selects final
colors from the flag at `+0x64`. All 13 current zone rows at `0x1473a06b8`
agree with the source descriptions, art basenames, 158 enemy IDs and flags,
and 65 boss names and times. Each final flag belongs to the last row, so RE
uses position for the final chip independently of the translated name. The
solo footer uses the localized subtitle and final boss with `picker.awaits`
at `0x1403a84dd..0x1403a84f5`. This produces Edwin VanCleef at 16:00 for
Elwynn Forest and Hakkar the Soulflayer at 18:00 for Gurubashi Arena.

The native card image crop constants are at `0x1465c4f14..0x1465c4f24`.
All 13 loading-screen members resolve to 512×512 BLP2 images in the verified
[patch chain](mpq-mount.md). For Enter, the three vertical red stops at
`0x1465c4eb0..0x1465c4ee0` match RE's existing gradient. The extra layer is a
120px-wide absolute child with top and bottom zero, starting at left −200px.
Its horizontal gradient has transparent edges and the middle stop
`(1, .9, .63, .3)`. The native constructor clips it inside the button and
spawns it before the text at `0x1403a7f37`. The updater at `0x140148070`
uses the fractional part of elapsed seconds divided by 3.2. Before phase
0.55 it places the strip at −200px, then uses
`((phase - .55) / .45) * 900 - 200`. The rebuilt picker schedules the same
update on its own gradient child.

The five journaled Ghidra results below were checked against the original PE
instructions and constants. Raw slices provide bounded bodies and omit
external code and data. SHA-256 values identify the unmodified slices and
their sealed results in the shared analysis store.

| Owner (preferred VA) | File offset | Slice SHA-256 | Result SHA-256 |
| --- | --- | --- | --- |
| Footer `0x1403a7350` | `0x3a6750` | `e25919328f6719330c1f926086d51cae652bfaeade574c1da345643db031d564` | `3e627794b521ce700b75131a0b0ca8cc520445618de5e9b4d2651cf186b1ba5e` |
| Zone list `0x1403a9df0` | `0x3a91f0` | `5fa24c621bc44dd75bc0e4093b9e4c46e94f75553a737f7dee176e43436cd404` | `88f7ebc35254b7b9eea8a75c2c9508ed0a692707849e094720f5bd90cccf0f25` |
| Selected card `0x1403b32e0` | `0x3b26e0` | `3ed2371b49d4748118fea81e7444484ceb9b1ca5e0bd162ef5413a9f253b60ea` | `9f5d56a1c95fba325cfb89c3667be565c510ff83c6c7eb08c0fb5fdb6e489c8d` |
| Enemy filter `0x140026ac0` | `0x25ec0` | `61938c119e46b1b865a738c385f82c81a8226e900f294932797a4786e20b403a` | `517c3da75d3a40d22d707b5fd6646d471d181ef1afdb8c4680ebb3519dfac8c4` |
| Highlight updater `0x140148070` | `0x147470` | `5e1a781c1bb30df69e691a0d4d0de2cae4fbd00ff5378d1d7bdc36c5102522ff` | `6915ce9e4fde1271c0c00352a16cfc227ab61f23deea4e454502078130adea3c` |

Static checks covered the registered Data chain and Rust 2021 syntax. Verify
expanded and collapsed cards through the scroll viewport, wrapping of localized
descriptions and boss chips, loaded art, and the footer subtitle and animated
highlight at the same window size. Compilation and rendered comparison are open.

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
mapping](switch-context-source-review.md#lobby-event-dispatch)
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

## Retained reports

[0.140.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-interface-correspondence-0.140.0.md) · [0.139.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-interface-correspondence-0.139.1.md)

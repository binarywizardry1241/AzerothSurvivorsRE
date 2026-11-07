# Explicit cooperative departure and service close

The historical 0.139.2 EXE has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [bounded proof](evidence/0.139.2/coop-close.json) covers the cooperative
close paths under [#206](../CURRENT-STATE.md#gap-206). The earlier
[0.120.2 relay lifecycle](relay-sequencing.md) and
[0.120.4 close assessment](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.4.md) retain their own targets.

The application dispatcher `145e50b10` maps local form command 25 through
table `1476c803c` index 3 to `145e55033`. It moves the role to Off through
`145e753f0`, then takes the service and calls terminal close `145f94b20`.
The same terminal close runs after the ordered 60-second Off/idle condition at
`145e51557..145e5159b`. The idle caller preserves the directory presentation.

The role owner flushes a host peer at `145e75500`, separately submits the
payload-free game Disconnect at `145e7554a`, and closes that peer at
`145e754d8` before visiting the next. The guest role does the same for its
upstream at `145e755b7`, `145e75607`, and `145e7562d`. The Disconnect
constant `1476c5b00` reaches case 16 of the game writer `145dc91e0`,
which writes wire byte 16 and no body. Guest handle close `145f9c150`
guards and disables the handle, submits Leave on the primary, takes the
selected secondary, then submits Leave and closes that secondary. The
separate terminal service close submits Leave and closes the primary first,
then takes the selected secondary and submits Leave before closing it.

Both close helpers use enum constant `147a46550` and writer `1461aa410`.
Writer case 7 at `1461aa845` produces exactly outer wire byte 8. The socket
vtable binds the submit adapter `145e437b0` and atomic close signal
`145e41040`. The worker checks the signal before another dequeue at
`145e3cb60..145e3cb8b`. These boundaries establish ordered submission and
closure. Actual wire delivery can race the close signal.

The explicit form Leave now calls `Session::leave` to force pending game
output, submit a separate Disconnect, and close each transport in order.
`Service::close` submits wire8 before dropping each worker and discards the
selected connection's retry metadata. The guest End Run transport primitive
uses the same separate Disconnect and leaves both service sockets to the
terminal close consumer. Ordinary peer loss continues through the existing
transport-loss paths and temporary retry continues through the selected
secondary's lifetime owner.

Reconstructed `AppExit` consumes the ordered role and service close in the
same Last system that drains relay output, after the cooperative flush. The
former separate shutdown system could queue close commands after the final
drain. The native desktop-window-to-process trigger has separate, incomplete
correspondence. This source adapter connects the established terminal contract
to the reconstructed application's existing exit edge.

`python3 -B scripts/check-coop-directory-transport.py --current-close` checks
ten native ranges, ten instruction/data anchors and the connected source order.
Five bounded Ghidra result receipts were checked against their exact raw
subjects. The complete dispatcher analysis exceeded the result transport
budget, so only its original-byte guard/table/consumer spans are claimed here.
The affected Rust files passed syntax parsing. Two regressions were authored
for ordered game frames and ordered worker commands. They remain uncompiled
and unrun. Compilation, socket/TLS behavior, app exit execution and
original/rebuilt parity remain unverified.

## Desktop exit trace in 0.140.0

The selected `installed-game/AzerothSurvivors.exe` is 151,521,280 bytes
with SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The current HUD action owner at `0x1401242d0` retains the 0.35 and 3 second
confirmation constants for End Run. The switch at `0x140124975` selects its
Quit branch through cell 3 at `0x1465973f4`. That branch adds a 16-byte record
to the message writer at `0x1401249e4..0x140124a77`, storing the message ID,
payload byte zero at `0x140124a5b`, and incrementing both the buffer count
and next ID. The adjacent HUD builder at `0x140124c40` binds `menu.quit` at
`0x140125256`. This establishes the current Quit producer independently of
the Win32 close button.

The Win32 message switch at `0x143206db1` maps `WM_CLOSE` (`0x10`) through
cell 14 at `0x146a60184` to `0x143207abf`. That branch stages the window
handle and native window-event tag 7. Its common path calls the event
dispatcher `0x14320d590` at `0x143208f57`. The dispatch reaches the boxed
event-loop callback at `0x1432065f7`. Separately, a checked `shutdown.rs:43`
Location reference at `0x1411f0346` identifies the native `Last` exit-set
configuration in `0x1411efe60`, corresponding to the retained benilla
shutdown helper. Its four recorded direct callers include the UI chat and
UI script initialization paths. The application message writer behind the
boxed callback and the AS handoff from the exit frame to co-op still require
a separate join.

The relocated terminal close at `0x145e93710` uses the same Leave variant
constant at `0x147ae79b8` for the primary and selected secondary. Its two
socket sequences submit through vtable slot `+0x18` and signal close through
slot `+0x30`. Current direct calls in the retained census reach it from the
60-second idle branch (`0x145eaa2f0`), relay and service failure branches
(`0x145eaa45a`, `0x145eaad04`), form Leave (`0x145ead428`) and guest End Run
(`0x145ecf9e0`). Form Leave first runs the role shutdown at `0x145ece570`.
The guest End Run caller is separate from the pause Quit message writer.
The desktop exit consumer's handoff to a form request, indirect close or
different teardown path remains unresolved.

The current singleton branch at `0x145f3b799` admits a count at or below
one after subtracting departures from the local hero and retained remotes.
Slot zero checks active phase 1–3 and clear abandonment at `0x145f3b853`.
The branch stores the abandonment byte at `0x145f3b816` and calls the
phase-4 helper, matching the source's `leave_party_hero` call to `abandon`.
Thirty isolated count cases and twelve phase/abandonment cases pass against
the original instructions.

| Installed EXE range | File offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| Pause action `0x1401242d0..0x140124beb` | `0x1236d0` | 2,331 | `4a361637e156633336ab7bf5e3e07bae59b1a22f6355aed9ef83572da63d2190` |
| Pause switch `0x1465973e8..0x1465973f8` | `0x65963e8` | 16 | `5b150632358655b2949be0acb392075b0b5307605132404ef0c5d0c3ce022422` |
| Win32 close cell `0x146a60184..0x146a60188` | `0x6a5f184` | 4 | `7b3b14b746523704b73174885f61bf3abcd34cb98452c26d65304a8e7ccea562` |
| Win32 close branch `0x143207abf..0x143207ae3` | `0x3206ebf` | 36 | `ef6faa8aa9d7dff910c4cd7bb6cad06865e0b4d168cec375fd25a87c9ba6e059` |
| Window event dispatch `0x143208f4c..0x143208f5c` | `0x320834c` | 16 | `3ca6672755693d2847472110072175958c979ccf81fe8486954d6f0371b9208a` |
| Engine exit-set configuration `0x1411efe60..0x1411f0430` | `0x11ef260` | 1,488 | `23054f7ffaa4465568af0bdec55b0b7a845689b0fcfabc687006987131a4407f` |
| Terminal close `0x145e93710..0x145e93889` | `0x5e92b10` | 377 | `a43f5ad573d9ca30e9693dd211489ce4826ddf579ef245bf4dc94a39f74363ac` |
| Singleton count `0x145f3b799..0x145f3b7bb` | `0x5f3ab99` | 34 | `cb04b7f550d287961d0b987844fad94916d56ed05a01b997cb9d5c9f76fe9a56` |
| Local phase guard `0x145f3b853..0x145f3b8a9` | `0x5f3ac53` | 86 | `a072674399b60d954e3ca63c2ff60b6fd31235801f644abef0e057c2a4587417` |
| Abandon and defeat `0x145f3b80e..0x145f3b826` | `0x5f3ac0e` | 24 | `d1d1e37cf2bdde8708e2fe29a020d7bdc8bc446502a80a6d93ccf212b5ccb5ca` |

The pause, terminal and guest End Run Ghidra results are verified against
their mapped raw-slice subjects. Their shared result digests are
`fea9f3b66ac2e5c734bc262cc930e982a8d9c6ddaaa0192a08607fe9aadb1940`,
`7056ed895a648921e381d9a74d1731b4a7ff2686f9befe5ed8eccca2da99b7ed`
and `9eaf9d7dde86caef7bf766d25bcaac6f7caf1751738bde2b5ea290979a5b67f6`.
The source still joins both reconstructed exit edges to the cooperative
`Last` flush and close described above. The retained socket source guards
passed. The exact native desktop-to-service handoff remains under
[#206](../CURRENT-STATE.md#gap-206), with exit execution and comparison in
[verification](../verification-needed.md#gap-206).

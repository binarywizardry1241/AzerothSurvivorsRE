# Explicit cooperative departure and service close

The installed 0.139.2 EXE has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [bounded proof](evidence/0.139.2/coop-close.json) covers the cooperative
close paths under [#206](../CURRENT-STATE.md#gap-206). The earlier
[0.120.2 relay lifecycle](relay-sequencing-0.120.2.md) and
[0.120.4 close assessment](release-review-0.120.4.md) retain their own targets.

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

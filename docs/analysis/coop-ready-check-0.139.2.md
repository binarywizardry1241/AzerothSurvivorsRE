# Cooperative Ready Check in 0.139.2

Finding [#306](../verification-needed.md#gap-306). The installed target was
`installed-game/AzerothSurvivors.exe` 0.139.2, 150,793,728 bytes, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [evidence manifest](evidence/0.139.2/coop-ready-check.json) identifies the
current ranges, dispatch cells, locale payloads and saved Ghidra results.

## Host admission and authenticated responses

The host's local request 28 enters `0x145e5546b` from dispatch table
`0x1476c803c`. It requires the hosting lobby, no outstanding check, and at least
two roster identities. `0x145fce2e0` yields the host first, then joined,
nonclosing guests with profiles. `0x145fd69e0` builds ordered 16-byte records
with the host marked 1 and all guest rows marked 0. The driver stores its
elapsed clock, clears cancellation and invokes the Ready Check updater.

Request 29 branches by role. The host's false payload sets the active check's
cancel bit. An admitted guest with no world/sync state sends the bool to the
host as message variant 26. `0x145e77bd0` derives the caller's index from the
admitted connection, gates on joined membership, and passes the bool at
message +8 to `0x145e73190`. That owner bounds the index, requires a valid
profile and active check, matches the member identity and changes the first
pending byte to `2 - bool`. Subsequent replies leave the recorded answer intact.

`0x145e73240` compares the complete ordered identity vector before considering
answers. Host cancellation or a roster difference yields Cancelled. Otherwise
any byte 2 yields Declined. All bytes 1 yield Ready. A pending row at or after
30 seconds yields Expired. While running, the remaining byte is
`ceil(start + 30 - now)` clamped to 0–30. The native float is f64 30 at
`0x146981578`; `0x14634b211` jumps to the CRT `ceil` import. The complete
snapshot is compared with its prior state, remaining time and answer rows
before publication. A terminal transition consumes the active response list.

## Messages and consumers

The native serializer at `0x145dc91e0` maps variant 25 to wire tag 26, followed
by `status:u8`, `left:u8`, `count:u32 LE`, then ordered `(id:u64 LE, answer:u8)`
rows. Status bytes 0 through 4 are Running, Ready, Declined, Expired and
Cancelled. Variant 26 maps to wire tag 27 and one boolean byte. The receiver
at `0x145dc3b10` validates the row count against nine bytes per row, maps
unknown status bytes to Running, retains the raw row byte and treats a
nonzero reply byte as true. It propagates truncated-reader failure.

The host creates the `readycheck` object at `0x145eab780` for local UI, with
`state`, `left` and `answers`. The guest dispatcher also reaches this builder.
The UI handler `0x1402e6a80` resolves reply identities through the lobby rows
and sends the result through the existing system chat lane. Its Ready branch
at `0x1402e733a..0x1402e73c2` checks host role and the local entry gate before
arming entry. Guests receive their world from the established ZoneKey and
bootstrap paths.

The modal consumes the active party snapshot, retains terminal results for
2.5 seconds, and reads the title, prompt, result, member/leader, countdown
and answer labels from the locale catalog. The current renderer supplies a
30px title, 15px description, 16px member name and 15px answer text. The
countdown bar consumes `min(left × 100 / 30, 100)` and the timer uses the
localized `{n} sec` label. The selected strings were restored from 14 exact
embedded catalogs.

## Modal layout and controls

`0x1400e9bd0` spawns the blocking backdrop with alpha 0.55 and native layer
5800. `0x14032b1e0` attaches a 460×400 `ReadyCanvas` with a 1.4 scale cap.
The outer canvas persists when `0x1400ea36e` refreshes its descendants.
`0x1400ead30` updates the seconds label and fill width separately. The
reconstruction uses its existing window fitter and layer 6100 so the backdrop
and controls sit above the reconstructed co-op dialog at layer 6000.

`0x1400dca00` fills the canvas with a vertical common panel, with 30px
horizontal and 20px vertical padding and a 10px row gap. The common frame
constructor `0x14015f210` applies its 1px border, 10px radius, gradient and
shadow. The renderer `0x14032b500` places a full-width 1px separator above the
ordered member rows. Each row uses 8px horizontal and 3px vertical padding,
10px between children and a 24×24 class icon when available. A flexible spacer
precedes the running countdown and actions. The countdown is a horizontal row
with an 8px rail, a 1px border, a 4px rail radius, a 3px fill radius and a 14px
label spaced 10px from the rail.

The native answer row has a 16px gap. `0x1400dc440` serves Ready, Not Ready
and Cancel with one style, including a 110px minimum width, 16px horizontal
and 7px vertical padding, a 1px border, 4px radius and a 17px gold label.
The constructor calls `0x14015e730` for the shared gradient and supplies the
resting and active border colors with zero lift. The renderer exposes Cancel
to the host and the two answer buttons to a guest awaiting a reply. The
collector `0x1400eb370` reads changed pressed interactions and forwards the
Answer byte as local request 29. It has no keyboard branch.

## Connected source and limits

The picker click and keyboard Enter paths now commit the selected Pick and
request an authoritative host check. The Session owns the check, dispatches
the recovered frames and accepts replies only from joined transport rows with
an admitted profile. `gameplay/coop.rs` updates it against the live roster
before admitting the host into the existing run-entry path. `coop_ui.rs` and
`coop_ready_ui.rs` render the countdown and reply states, route the controls
and append localized terminal results to the existing chat history.

This report covers the custom picker/lobby path. The explicit developer zone
launch and stock frontend use their existing entry paths. The historical co-op
handshake version and broader protocol compatibility retain their separate
evidence.

Static verification covered exact installed-byte ranges, dispatch cells,
native literals, six additional Ghidra result bindings for modal owners, locale
payloads and non-compiling Rust syntax parsing. The
authored Rust regressions cover wire bytes, malformed status normalization,
first-answer ownership, roster and host cancellation, and the deadline
boundary. Compilation, regression execution, game/client/server execution and
original/rebuilt comparison remain open.

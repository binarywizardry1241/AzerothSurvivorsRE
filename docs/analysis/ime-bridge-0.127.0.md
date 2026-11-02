# IME commit and focus bridge — 0.127.0

Finding **#293** uses installed EXE SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/ime-bridge/manifest.json) binds the selected
instructions, data, three saved Ghidra results and explicit replay seams.
[Hero names](hero-names-0.127.0.md), cooperative chat and
[mixed-script fonts](mixed-script-fonts-0.127.0.md) own their separate consumers.
The two finding registers own overall source and verification status.

## Committed text and keyboard order

The current `1402dde10` consumer iterates both buffers of 64-byte IME message
records. It concatenates **Commit** strings, removes Unicode C0/C1 controls
(`U+0000..001f`, `U+007f..009f`), and preserves other characters and whitespace.
Enabled, Disabled and Preedit records do not contribute text in this owner.
An empty sanitized result produces no keyboard messages.

With a nonempty result and a matching `PrimaryWindow`, it publishes one
`KeyboardInput` press followed by one release. Both carry the complete committed
string as logical `Key::Character`, unidentified physical/native key codes,
`repeat=false`, and the first matching primary window entity. Only the press has
`text=Some(committed_string)`. Missing primary windows consume the IME records
without publishing keyboard input. The query's `PrimaryWindow` component identity
is tied to its reflected type path and registration identifier; its selection
helper returns the first match, rather than requiring uniqueness.

Registration `1402b79c0` places the Process filter before this forwarder in a
chained group. Its tail interns the `InputSystems` set, appends ordering kind0
(the existing Bevy `Before` variant) recursively to that group, then registers it
through `1401155c0` / `140029900` under `PreUpdate`. The two exact native label
vtables lead to Debug readers of the `InputSystems` and `PreUpdate` literals. The filter `1402dd560` examines only keyboard records newer than a
shared end-of-frame boundary. If logical Process (`0x4f`) occurs, it drains the
keyboard buffers and republishes the other new records. It does not advance that
shared boundary. PostUpdate registration `1402e7550` chains focus publication
before the boundary snapshot. The snapshot records the complete keyboard message
count, including the current frame's synthesized commit records. Consequently a
later Process key cannot republish an earlier commit.

The source in `ime.rs` connects the filter/forwarder before Bevy's `InputSystems`
and snapshots after focus publication. Existing name, chat and FrameXML text
consumers receive the synthesized keyboard messages through their ordinary paths.
This repair does not introduce a composing-state rewrite of Enter.

## Focus and candidate anchor

The `1402dd780` publisher combines a renewed AS typing request with the existing
FrameXML typing flag (`140666540`). It clears the one-frame request after reading
it. Without an explicit AS position, the anchor is `(logical_width * 0.02,
logical_height * 0.8)`. The publisher requires exactly one `Window` carrying
`PrimaryWindow`, unlike the commit forwarder's first-match query. It caches the
enabled state and position, skips unchanged publication, and writes position only
while enabled. Disabling clears the cached position.

The focused picker-name consumer `1401f63a0` requests typing before reading its
keyboard messages. When its queried name field exists, its anchor is
`(translation + (-size.x / 2, size.y / 2)) * inverse_scale_factor`: the field's
lower-left corner in logical coordinates. Missing geometry preserves the previous
optional position while still renewing the typing request. Input-blocked branches
clear their keyboard reader instead. These are current native predicates; names
for every separate blocking resource are not inferred from their byte offsets.

The source connects this request to the existing focused name field and to
cooperative text fields. `UiKeyboardCapture::is_typing()` exposes the existing
FrameXML flag to the publisher. Focus, logical-pixel scaling and candidate-window
placement have not been exercised in a running application.

## Preedit and platform boundary

The supplied 0.126.0 release claim includes visible composition and composing
Enter behavior. The recovered AS bridge proves committed-text delivery and its
Process-key filter; it does **not** prove visible preedit. The separate
[Windows boundary](evidence/0.127.0/hero-names/windows-ime-boundary.json) shows that
the target masks `ISC_SHOWUICOMPOSITIONWINDOW` before `DefWindowProcW` and handles
IMM composition/result messages. That boundary matches the inspected existing
Winit behavior. Native virtual-key conversion maps `VK_PROCESSKEY` to Process and
`VK_RETURN` to Enter. Which events an installed IME emits remains unverified.

The [reader census](evidence/0.127.0/ime-bridge/reader-census.json) exhausts its
explicit selectors over the retained current declared-extent and seeded-complement
reference inventories. It finds all three exact copies of the `Messages<Ime>`
resource identity, nine references to those copies, and seven further references
to selected initialization/bridge helpers. The seeded complement has no matches.
The resulting owners are the known AS reader initialization, generic message
resource registration and the window-event adapter. The reader accessor
`140219f50` has one direct caller, the known bridge's parameter initializer
`1402eeb50`. Registration `1446d8370` adds the ordinary message updater
`1446dc150`, which swaps buffers and drops old records; it has no display output.
The window adapter `1425d8ad0` copies converted IME records into that same queue.
No additional statically registered AS Preedit display reader is identified.

This is a completed bounded reader-reference census, not proof of complete global
aliasing or the absence of every possible consumer. Computed addressing,
alternative type-identity construction and unseeded executable complement remain
outside its proof. An inline composition display producer and actual candidate
display are still unestablished; no display algorithm is substituted. The next
required producer must come from a concrete alternate backend/consumer reference
or the matching browser input artifact, rather than another import of the known
Commit owner. The browser's artifact/input bridge remains a separate resource
boundary; Windows instructions do not establish browser behavior. These limits
remain distinct from the connected native commit/focus source and runtime/parity
validation.

## Static validation

`python3 -B scripts/check-picker-name.py --contract ime` verifies original
instruction/data hashes and all three saved query inputs, plans, journals and
results, and reproduces the 16-reference reader census from both saved native
inventories. Captured global-summary hashes record provenance; subsequent #41
summary refreshes do not replace those exact inventory commitments. It executes **1,688 bounded cases / 124,450 unchanged original
instructions** in scratch memory: 40 commit cases, 1,536 Process/boundary cases,
72 focus-publication cases, 12 uniqueness cases, four boundary snapshots and
24 picker-anchor cases. Commit cases include split buffers, controls, Unicode,
inline/heap strings, ignored Preedit records and absent primary windows.

Allocator, copy, drop and selected-window query seams are explicit in the checker;
Bevy ECS, scheduling, OS input and application consumers do not execute. Authored
Rust regressions remain uncompiled and unrun. No compiler, original/reconstructed
game, server, browser or original/rebuilt comparison was run.

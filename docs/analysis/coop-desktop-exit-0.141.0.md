# Cooperative desktop exit in 0.141.0

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes
with SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This trace narrows [#206](../CURRENT-STATE.md#gap-206) and preserves the
[earlier close evidence](coop-close-0.139.2.md).

Win32 message `0x10` selects cell 14 at `0x146a5a444` and enters
`0x143207caf`. This stores the window handle and event tag 7, then
dispatches through `0x143209147` to `0x14320d780`. The event-loop setup at
`0x1431448d5..0x1431448e4` installs the boxed callback and its vtable
`0x146a3df08`. The callback slot `+0x20` invoked at `0x1432067e7` now
resolves to `0x1431490c0`. Its window-event branch preserves tag 7 and calls
`0x1431a3340` at `0x1431493b0`.

For tag 7, the Bevy handler subtracts 5 to select cell 2 at
`0x146a4b330` and calls `0x14316ece0` with the resolved window
entity. That helper queues an 80-byte window event with discriminant
`0xcb`. The event forwarder at `0x143158922` selects that discriminant
through `0x146a418d8`. Its writer at `0x1431598ab` looks up the same
`WindowCloseRequested` type key consumed by the reader setup at
`0x1452ed5b4`.

The all-closed and primary-closed window systems at `0x1452e5c10` and
`0x1452e6150` each write an exit record with a message ID, zero payload
byte and 16-byte stride. Pause Quit selects cell 3 at `0x146598764` and
writes the same record layout at `0x14017e114..0x14017e1a7`. These writers
also share the queue grow helper at `0x1463a77a0`. The native `Last` exit
set registration retains its `shutdown.rs:43` location at `0x1411f0006`.
After the update, the Winit runner calls the typed exit reader
`0x145b8dfa0` at `0x143158311`. It reads the two message buffers using
the type key at `0x1465bf4e0`. The runner stores the selected exit status
and calls its event-loop exit path at `0x14315832f`.

Terminal service close at `0x145e8dc70` submits the same Leave variant
`0x147ae2998` through slot `+0x18`, then signals close through slot
`+0x30`, first for the primary and then for the optional secondary.
Five verified relative calls reach it from the co-op service and form
dispatcher and Guest End Run. The dispatcher at `0x145ea3420` runs on the
separate worker loop at `0x145e7df20..0x145e7e085`. The loop calls it with
elapsed time at `0x145e7e013` and sleeps for 25 ms at `0x145e7df93`.
Its normal path repeats without an exit-message read. Startup increments
the shared state's strong reference at `0x145e80f77` before passing it to
the `rogue-server` thread constructor `0x145eee440`. That constructor
installs the thread entry from table `0x1476f4050` and detaches through
`CloseHandle` at `0x145eee52c`. The entry at `0x145de1500` passes the
retained state to the worker loop. On return from the app at
`0x14003e4f8`, the main owner releases its own reference at
`0x14003e507` and enters the shared-state destructor only on a zero count.
The observed main return path neither joins the worker nor directly calls
terminal close. The remaining native question is whether desktop exit
queues a departure command or closes via another consumer before process
teardown.

The pause and terminal-close Ghidra query results were verified against
their exact PE slices and journals. Their shared result digests are
`3e5a094a1889bb5f68727b4744fa43971035c92a37672edb5ede61fa53d91522`
and `86f28251737e790dd0ffc56e2bab4843f6bd6c1ea7910128c78a5878284f07f5`.
The retained socket source guards pass. The rebuilt `AppExit` already
joins pause Quit and desktop close to ordered co-op output, role leave
and terminal service close in `Last`. The native exit-to-service handoff
and actual socket delivery remain unverified.

## AppExit type and local departure boundaries

The 16-byte AppExit key at `0x1465bf4e0` is
`e162ca515eee33576c9b32a0374892d6`. The same bytes occur at
`0x1465bff80`, `0x14668d1d8`, `0x146a45d90`, `0x1471205b8`,
`0x1473479c8` and `0x147347c20` in .rdata. The retained exact operand
inventory supplies the typed lookup and registration sites for all seven.
For example, `0x1402e1bf0` looks up and registers that key, with no call
to the form sender or terminal socket writer in its body. Its 807-byte
slice at file offset `0x2e0ff0` has SHA-256
`042e7b99b2d1cfe6a8886e478dc5e022e2cb0d9096107aaa0be7ec4fc4ca3bb6`;
the verified Ghidra result digest is
`844cb8fb9d897d8c22951564f03ca9af43c6fa6e9b6752feddf1d0d302f4c9bc`.

The retained current census lists four direct callers of the Last
exit-set registration `0x1411efb20` and 39 direct callers of the app
request sender `0x140040100`. The nearby pause-related sender at
`0x14017f066` submits local command 32. The admitted guest's first
command consumer at `0x145ec9a90` maps that request to control subtype 6
through `0x145ec9c21`. This is the existing spend-stored-levels route.
The Quit message writer and window-event path do not use that call site.

The guest terminal aliases at local commands 6, 9 and 10 reach
`0x145ec9afe` through table `0x147aedb14` when its role and sync gates
pass. They submit game Disconnect variant 16, take the service before
terminal Leave at `0x145ec9bb0`, then publish `you left the run`. Form
Leave command 25 enters the poller's separate local table at
`0x145ea7be1` and reaches the same terminal writer at `0x145ea7c46`.
The first-consumer slice and its verified result digests are
`f34e55bd9acbb7c89cd41e199b5ab5e16447aa15e7bfdaf92874a9c06cfc86a7`
and `0541314bd839341069c36b9823d64680d9a946fe2c6db989825ef1150b038118`.
The original table bytes supply the aliases beyond the raw-slice analysis.

## Last callbacks and process exit

The four callers of the Last helper each construct a boxed Bevy system
through `0x145bc5930`. The constructor retains the supplied vtable at
system `+0x68`. The vtable's `+0x48` slot leads to these callbacks.

| Registration call | Vtable | Callback | Observed consumer |
| --- | --- | --- | --- |
| `0x1408ba410` | `0x146638130` | `0x140901f40` | Camera pose save through `0x1408b9af0`, which owns the camera pose write diagnostics |
| `0x1408e78db` | `0x1466385c8` | `0x1408ff900` | Chat settings save, anchored by the `ui_chat/settings.rs:664` Location at `0x1408ffb4c` |
| `0x141263546` | `0x146738ee0` | `0x141287200` | Config save through `0x1411e6400` and its `config.toml` path |
| `0x14137b55a` | `0x146627968` | `0x1407c3bf0` | Addon UI lifecycle teardown through `0x1407d3d80`, which has the `ui_script/lifecycle.rs:1454` Location |

An independent scan of original executable-section rel32 candidates recovered
the pause sender at `0x14017e2d7` and the form Leave sender at `0x140104a46`
outside the saved Ghidra reference set. The four Last registrations and five
relative callers of the terminal service writer agree with the saved census.
None of the four callbacks joins the observed AppExit route to a native
departure command. The detached worker remains live when the app owner
releases its reference. The selected desktop trace does not establish which
transport signal the original relay receives on process exit, or how the
service distinguishes that signal from a recoverable connection loss. The
rebuilt AppExit adapter still orders and submits explicit close traffic. Its
socket behavior and correspondence at that service boundary remain open.

## Synchronized guest departures

The pause button builder uses the same action byte 2 for `menu.end_run`
at `0x14017e689` and `menu.character_select` at `0x14017e920`. Both join at
the store `0x14017e967`. The dispatch table at `0x146598758` sends action 2
to `0x14017e0ef`, which dismisses pause and stores command 10 before the
common sender at `0x14017e2d7`. Action 3 branches separately to the AppExit
writer and loops back at `0x14017e1a2`. The additional UI action table at
`0x1465982f8` supplies commands 6, 8, 9 and 25. Form Leave also has a direct
command-25 producer at `0x140104a34`.

Engine Logout opcode `0x4b` enters the local response route in
`0x145e9e690`. The branch at `0x145e9e780` writes reason zero and instant
one, then sends `0x4c` at `0x145e9e7c0`. With role `+0x1100 <= 1` and
the `+0x15a5` sync latch set, it passes constant command 9 from
`0x147aea888` to the same guest dispatcher. The unsynchronized engine
fallback reaches the local world-end helper `0x145ebb4d0`. The app-command
fallback at `0x145ea7819` excludes commands 6, 8, 9 and 10 when the guest
handler declines them. Admitted commands 6, 9 and 10 all flush pending game
output, submit a separate Disconnect, take and close the service, then
publish `you left the run`.

The source now shares the terminal service close between Pause End Run and
Character Select, terminal Again and Menu, and ordinary synchronized guest
Logout. The previous terminal and engine branches took the driver down
without submitting its queued GuestLeave. The connected path drains the
guest's pending data and separate Disconnect, then submits Leave and closes
the primary and selected secondary in order. Engine Logout flushes the
instant response before terminal network close and publishes local LoggedOut
afterward. The unsynchronized engine fallback retires the local world and
retains the guest's service role. The pause and terminal app commands wait
for the existing guest synchronization latch.

Twenty-eight exact PE boundary checks, six source wiring and order guards,
the retained socket source checks and syntax parsing of five Rust modules
passed. The five Ghidra results below were verified against the original
PE, raw slice, query plan and completed journal. The plan and journal
receipts under `runtime/analysis/tasks/fixgap-206-last-callbacks-0.141.0`
reference the shared results. The armory result at `0x1402eace0` separates
that forwarded request sender from desktop departure. Compilation, game
execution and live service delivery remain unverified.

| Procedure | Raw slice SHA-256 | Saved result SHA-256 |
| --- | --- | --- |
| `0x140901f40` | `d901cd08f576a3216e1bdc5377c96487d9a5ed545f972318591058d2e02c38e6` | `59cbe8bd4f94fcaa69b09e2224bb1e6a17c519884a0d947c87dee6f0c484b06c` |
| `0x1408ff900` | `1a7af6887649be434ed72a41a8249dbb207f56e2f95ee85c4a4c9fd141c454a2` | `9989716a8ca0e73d8f601ab09de26a683f945042b02e28747cb26d7bd9c1201d` |
| `0x141287200` | `8a4af7160237f0ba9b0748c777a51547e66b0c3938db1c644bea565b5b06ca37` | `1708e4cd2792d41c8ab9a271723ee191f372a2ccf8e46053cd3a8c987fa0f2f8` |
| `0x1407c3bf0` | `33206031aa2cacf931a459fd090c132109fbd957b29af68606d3298242504bb0` | `412e99c94999d5665d821fa8f5fc229172397f01387d3f4b6594ebeddec2487d` |
| `0x1402eace0` | `8647fe075ef8d7a534eda31cad2377b108eb58336ccf40c67d6d8475ebbc9a19` | `846fd6a5e0509ea72281eb444719e77e4f878ea6b33036e545fd7d68803b64b7` |

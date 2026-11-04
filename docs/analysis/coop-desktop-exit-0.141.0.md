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

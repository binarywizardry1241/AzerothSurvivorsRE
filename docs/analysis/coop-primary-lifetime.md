# Primary lobby failure

Finding [#63](../CURRENT-STATE.md#gap-63). The inspected `installed-game/AzerothSurvivors.exe`
is 151,534,080 bytes with SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
This bounded recovery extends the historical [relay selection and host failure
proof](coop-relay-selection.md). The installed hash is outside that audit's scope.

## Failure timing and ordering

The service constructor writes its start time to `+0x1f78` and its separate
command time to `+0x1f80` at `0x145ed4b43..0x145ed4b53`. The poller
`0x145eb3190` reads the primary state at `0x145eb3c34`, retains the start time,
and pumps service events at `0x145eb3c5d`. After dispatch, state 2 enters the
failure branch. State 0 enters that branch only when the elapsed time is
strictly greater than the f64 value 8.0 at `0x1469e4c50`. State 1 is healthy.

At `0x145eb4a38`, Off skips the secondary preservation guard. An active
role first checks for a selected relay whose terminal failure latch is clear.
The host's separate relay failure gate runs first. At `0x145eb5250` the
terminal primary path shuts down the role, then takes the service and
submits Leave. The move sets the absent sentinel in the optional service's
first word at `0x145eb5260`. That word also carries the pending form
password's capacity while the service exists. The service drop destroys the
moved password with the wrapper. The primary and optional secondary both
submit the Leave variant through their writer slot `+0x18` before signaling
stop through `+0x30`. The primary writer is called even after primary
state 2. Ordered submission alone cannot establish delivery from a closed socket.

The guest role owner at `0x145ed8180` settles the admitted cached run before
setting the role to Off. The guest path flushes at `0x145ed8347`, submits a
separate game Disconnect at `0x145ed8397`, and closes the guest handle at
`0x145ed83bd`. The synchronization flag gates local logout at
`0x145ed83c1..0x145ed83d2`. The terminal service close follows that role
operation in the poller.

The rebuilt directory samples primary state before processing each batch and
evaluates failure against the resulting relay selection before accepting form
requests. A closed primary stays visible to the failure gate on later polls
if its relay survived initially. For example, wire 27 can then retire the
relay and release the closed primary. The prior one-shot Closed notification
could be consumed while the secondary was present and never reconsidered.
Terminal primary failure now uses the shared close to clear the pending form
credentials and close the available workers. An affected guest settles the
existing cache and submits role departure before terminal close. Ordinary
selected relay loss keeps the existing buffered guest receive path.

## Static evidence

The journaled Ghidra poller result
`ev_37d59f6e1c7bd56d48ccfbfa3204ff225201a599af938fd060807faab367aafb`
has result SHA-256 `7ff06da7aa438371c921541296149ba96c181d74d627178d2c41927da62053ca`.
The 40,036-byte raw subject `0x145eb3190..0x145ebcdf4` maps to original PE file
offset `0x5eb2590` and SHA-256
`7b49b5d96d392caee9c64080baf319db290d108869fd6a1b02f97f1ad6a8eb55`.
The original instructions and replay resolve the Off jump, which the raw
pseudocode omits. The existing checker records nine original PE span digests,
the timeout constant and Leave discriminant. Its 108 isolated cases cover
the sampled state and clock, Off and active branch selection, and terminal
role/close/reason order. Source guards check the poll and departure wiring.

```sh
PYTHONPATH=runtime/tool-state/python/armory/python-libs python3 -B scripts/check-coop-directory-transport.py --primary-failure
```

The retained socket source guards and pinned Rust syntax parser also passed.
The queue regression remains uncompiled. Live socket delivery, guest
settlement execution and original/rebuilt parity remain open. The deployed
relay classification of desktop process exit and the deployed scheduler
remain separate evidence requirements under [#206](../CURRENT-STATE.md#gap-206)
and [#257](../CURRENT-STATE.md#gap-257).

# Cooperative host command order in 0.139.2

Finding [#63](../CURRENT-STATE.md#gap-63). The installed 0.139.2 EXE is
bound by the [range manifest](evidence/0.139.2/coop-ordered-input.json).
The [0.123.0 party-frame proof](coop-party-frames-0.123.0.md) owns the prior
synchronization and retirement ordering and retains its original target.

The host frame at `0x145e53160` receives one outer frame, passes each admitted
message to `0x145e77bd0` at `0x145e53233`, then advances the receive loop. It
visits connection liveness after an empty receive. Dispatch table `0x1476c81ec`
selects Engine variant 6 and Control variant 7. Engine enters `0x145eb4880`
from `0x145e7851c` after the synchronized-row gate. Control enters
`0x145e766f0` from `0x145e7833a`. That helper checks hosting, the peer index,
assigned world actor and populated Game slot, then calls `0x145ec30a0` before
returning to the frame. The host can therefore apply Engine and Control in
message order before the next retirement or packet.

The reconstructed ready-world handlers now use one FIFO for Engine and Control.
After each authenticated message, the host Apply loop drains that FIFO through
the existing per-hero mechanics before advancing the Session pump. This keeps
earlier commands from losing their actor or being overtaken by another command
type. The existing world and terrain gates remain at the shared drain. Update
still drains any waiting input after bootstrap and before simulation, using the
same handler. Earlier source owners retain the actual command payload and
choice-response contracts. Sender-only item-name and raid-target replies keep
their direct receive routes.

`scripts/check-coop-party-frames.py --ordered-input` checks the exact current
native call/jump instructions, dispatch cells and connected FIFO, receive and
bootstrap source paths. Both changed Rust modules syntax-parse. This check
covers the ready-world application edge. Actual bootstrap timing, sockets,
client/server execution, compilation and original/rebuilt parity remain open.

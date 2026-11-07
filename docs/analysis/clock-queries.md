# Local wall-clock query delivery

EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
Current #41 lead `Q41-M03-clock-query-1458646d0` identifies a missing local
request/response route, now permanent **#69**. [verification-needed](../verification-needed.md)
owns current status.

## Recovered contract and source connection

The current incoming owner `1458646d0` handles opcode0x1ce independently of its
optional Game and retained character. It samples host time through `145ca7360`,
whose import is `KERNEL32.dll!GetSystemTimePreciseAsFileTime`, IAT slot
`145e9d060`. The return carries low/high FILETIME DWORDs in EAX/EDX. Ghidra's
pseudocode retains only the low return; the native leaf and actual caller's
stores control the ABI interpretation. The OS API is an external boundary,
not an engine or Windows implementation to reconstruct.

The actual caller passes that sample and epoch `0x019db1ded53e8000`
(116,444,736,000,000,000 FILETIME ticks) into `145ca7310..145ca7360`.
This leaf has no separate unwind entry; its direct call, exact instructions,
terminal RET and fresh Ghidra body establish the selected interface. It
computes a signed FILETIME difference, integral seconds and fractional
nanoseconds. A pre-epoch/error result supplies zero. Otherwise the caller
emits the low32 bits of whole seconds as the four-byte opcode0x1cf body.
The request's payload is unused. Actual clock acquisition and allocation
failures are not executed by the bounded checks.

The local sender previously discarded `ClientCommand::QueryTime`. The existing
UI local-clock fallback supplied a value without delivering the native query
response or clock synchronization edge. The adapter now queues QueryTime, and
the AS drain samples `SystemTime::now()` for each accepted request before the
optional-Game gate. `duration_since(UNIX_EPOCH)` supplies zero on error and
whole seconds cast to u32 on success. The response passes through the ordinary
packet parser/event decoder, existing `ServerUnixTime` handler and
`ServerWallClock::sample`, reaching the existing Lua clock-sync consumer.

The normal active-session admission/drain remains in force, with no character
or world-readiness requirement. Each request replies once; repeated requests
retain separate replies. No run timer, alternate clock owner, multiplayer,
socket or platform-time implementation is introduced.

## Evidence and limits

The [proof](evidence/0.113.2/clock-queries.json) binds the current native ranges,
six fresh REA/Ghidra observations, import identity and reviewed source.
`python3 -B scripts/check-clock-queries.py` reproduces **131,117 original-
instruction cases**: all 65,536 u16 whole-second values with fractional ticks
in both optional-Game states, 28 epoch/u32/sign boundaries and 17 ignored payload
sizes. Fourteen complete wire fixtures include scalar
boundaries, pre-epoch, fractional rounding and u32 wrap. The Windows getter's
two-register return, allocator and sender are intercepted services.

Bit63-set FILETIME values are negative/error in the selected signed native
representation and emit zero. Rust fixtures do not construct those invalid
Windows SystemTime instances. OS clock accuracy, platform representability,
arbitrary time states and real scheduling remain unverified.

Four authored Rust regressions cover request projection, exact native bytes,
the actual decoder and once-only/no-character/no-Game/inactive delivery. They
are uncompiled/unrun. Five changed modules syntax-parse. No reconstructed
source/ECS/VM, Windows API, application, network or game executes; original/
rebuilt timing and UI parity remain open. Existing name/template/inventory
contracts retain their separate checks and #41's original populations remain
unchanged. No unrelated individual changelog claim is promoted.

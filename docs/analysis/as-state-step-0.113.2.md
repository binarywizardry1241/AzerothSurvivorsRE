# AS simulation step — 0.113.2

This **#41** source repair is bound to installed 0.113.2, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
It concerns the ordinary local run's timing input, without changing the existing
benilla client clock, movement reports or cooperative behavior.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall status.

## Current input and live consumers

The current update owner `145868160` accepts an absolute f64 timestamp. Its
`1458681b5..1458681f1` prefix supplies zero on the first update. On an initialized
update it subtracts the previous timestamp, applies SSE `MAXSD(0, elapsed)` and
`MINSD(0.1, result)`, then converts to f32 in XMM7. It always updates the retained
timestamp, even when no Game is present. The immutable f64 limit is at
`145fa3620`. This is a 100ms simulation-step cap.

The actual call at `14586c2f1..14586c2f9` forwards that XMM7 into `14590a1e0`.
Its ordinary local branch (`Game+c0d == 0`) reads phase `Game+c12`, consumes a
pending startup request in phase zero, and advances the clock at `Game+b6c` only
in active phase one. The same supplied delta reaches learned abilities, procs,
demons, hazards and enemy updates; the selected direct calls are retained in
[step.asm](evidence/0.113.2/as-state-contracts/step.asm).

The live adapter previously passed Bevy's elapsed f32 directly to
`Mechanics::tick`, allowing steps above 100ms to advance the run clock and its
timers too far. The entry now caps every admitted simulation step at `0.1`.
An ordered comparison preserves native NaN propagation; Rust's NaN-filtering
`f32::min` would replace a NaN with the limit. Existing nonpositive admission is
retained, and all subsequent simulation consumers use the capped local delta.
The player-report velocity and shared engine time remain under their existing
owners.

## Static verification and limits

`python3 -B scripts/check-as-state-step.py` passes **64 native scalar
cases** and **70 native local clock cases**. Scalar cases include initialized and
uninitialized headers, zero, signed zero, negative, below/at/above-limit and large
elapsed values, both infinities and NaNs. Every case checks the output and the
retained timestamp/header stores. Local cases check seven phases, both startup
request states and five delta classes; the startup helper is an explicit
phase-store seam. The actual call bytes are checked independently. Source guards
check the cap's position before clock advancement and preserve the existing
nonpositive gate.

[Contracts](evidence/0.113.2/as-state-contracts/step.json) and
[fresh REA/Ghidra provenance](evidence/0.113.2/as-state-contracts/step-rea.json)
retain exact current ranges and hashes. Original-VA raw imports lack complete
external data and Win64 ABI information. The local function's excluded nonlocal
tail jump leaves the raw import and causes a decompiler warning; that branch is
not evidence for ordinary local behavior. Exact NaN payload identity is not
claimed. Full zero-step side effects, timestamp acquisition, Rust/ECS execution,
the complete Game tick and original/rebuilt gameplay parity are unverified.
No compilation, compiling tests or game application ran.

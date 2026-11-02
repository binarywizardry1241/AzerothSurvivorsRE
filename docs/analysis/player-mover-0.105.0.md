# Shared player movement control — 0.105.0

The terminal movement portion of gap **#9** now uses the run's shared player
sequence for speed, report-driven relocation, victory root and Endless unroot.
This source is uncompiled. [verification-needed](../verification-needed.md) owns the remaining
source and comparison gaps; this report does not establish runtime parity.

## Authority and native contract

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [mover manifest](evidence/0.105.0/terminal/player-mover-manifest.json),
[packet contracts](evidence/0.105.0/terminal/player-mover-contracts.json) and
[canonical counter evidence](evidence/0.105.0/terminal/continuation-effects-manifest.json)
bind original ranges, constants and Ghidra identities to this target.

Game+548 is a wrapping u32 initialized to **1**. It is independent of the actor
spline sequence at Game+908. Game+54c starts at **7.0**. The speed refresh compares
the final movement multiplier times 7 with the last sent speed, emitting only
when their f32 absolute difference is greater than f32(0.01). An unordered
difference suppresses the packet; suppressed changes do not move the baseline.

| Producer | Serializer | Ordinary inbound consumer |
| --- | --- | --- |
| Speed refresh | `1458ad310`, opcode `0xe2`; GUID, sequence, speed | `SessionEvent::ForceSpeedChange`, run speed |
| Report-driven correction | `1458b57d0`, opcode `0xc7`; GUID, sequence, movement info | `SessionEvent::Teleport` |
| Victory | `1458a9970`, opcode `0xe8`; GUID, sequence | `SessionEvent::MoveMode`, Root applied |
| Endless continuation | `1458aa3b0`, opcode `0xea`; GUID, sequence | `SessionEvent::MoveMode`, Root removed |

The report correction is a teleport, despite its earlier knockback label. Its
existing floor owner supplies the destination; this adapter adds no second Z
offset. Floor admission itself retains its historical 0.100.1 provenance.

## Connected source

`gameplay/mechanics/player_mover.rs` owns the player sequence and remembered
speed. Entry composes equipment, talents and racial movement before one initial
speed refresh, preventing intermediate setup packets from consuming sequence
values. Ordinary effect refresh and the run tick publish actual speed changes;
boss completion and accepted continuation publish root/unroot. Events retain
their position in the ordinary run presentation stream, including corrections
queued before the next tick. The actor movement counter remains separate.

`gameplay/client/events.rs` maps these events into the production inbound table.
The body request supplies initial speed; later speed changes use the existing
forced-speed handler instead of being overwritten by body synchronization.
Continuation drains its unroot before appending the Endless chat notice.

The local host pauses its controller while showing a terminal summary. A paused
movement-edge consumer now shares the ordinary teleport and movement-mode
helpers and acknowledges speed changes, so those messages cannot expire while
the controller is held. It does not advance player movement or the game clock.

## Optional sink-test writer

The second tick teleport writer is explicit sink-test instrumentation.
[Gate/default evidence](evidence/0.105.0/terminal/sink-test-contracts.json)
records Game+948's disabled default, the exact deadline gate,
`WOW_ROGUE_SINK_AT`, cycling XY selection, floor minus 0.6, and the pending
twelve-report guard. Its serializer/counter span references the canonical extract
rather than duplicating it. Ghidra's inferred ordered comparison omits the
original branch's unordered behavior; the instruction replay checks that case.

This work does not implement or run the optional sink-injection environment
path. It is not an additional ordinary gameplay relocation producer.

## Checks and limits

`scripts/check-player-mover.py` checks current target/range/constant
identity, source ownership and **27 unchanged-instruction cases** for constructor,
speed deadband/NaN and shared counter/wrap behavior. Serializer and queue calls
are explicit nonexecuted seams in those prefix checks. The ordinary
terminal instruction runner passes **1,712 bounded cases**, including fifteen
sink-gate cases, and separately checks the native disabled-default store.
The existing layout runner passes thirteen initializer cases.

Rust regressions cover shared/wrapping sequence, the sent-speed deadband and
paused root/unroot delivery. They were authored but **not compiled or run**.
Rust syntax parsing and Git whitespace checks are separate static checks.
No build, game launch, live packet/ack test or original/rebuilt input/rendering
comparison was performed. Alternate stock-frontend support and common button
hover remain separate source limits of [terminal flow](terminal-flow-0.105.0.md).

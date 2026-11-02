# Terminal command lifecycle — 0.109.0

This report uses installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/terminal-flow/manifest.json) binds current
owners, instruction intervals, current TypeIds and fresh REA/Ghidra results.
The source correction is in `gameplay/terminal.rs`: preserve every admitted
terminal command in query order, and deliver the two native gossip-completion
packets. Compilation and original/rebuilt gameplay remain unverified.

## Input and ordered commands

Current input `140287210..140287922` fetches changed Interaction rows through
`1403a8d80`. That query fetches Interaction (`1402a7cf0`), EndAction
(`1402b77c0`) and optional32-byte state (`1402b31d0`). An absent optional
state admits a pressed row immediately. The terminal constructor supplies no
such optional state. Each admitted row sends its command; the loop does not
stop at the first row. The native action table at `145df2800` maps Again,
Endless and Menu to commands6,8,9. The native server tick drains232-byte
commands sequentially into dispatcher `1458bb9f0`; each later command sees the
Game/client state left by earlier commands.

The source previously used `find_map`, silently losing later pressed rows.
`TerminalState` now owns a FIFO independent of summary visibility. Again
suspends its remainder while the existing source entry adapter resolves a
replacement Game option. `TerminalState::begin` preserves that queue during
replacement; ordinary entry clears stale input. Draining resumes after the
constructor resolves, including an absent Game. This establishes state order;
it does not assert a native worker, acknowledgement or inter-frame delay.

## Admission and lifecycle

- **Again**, dispatcher `1458bbc5e`: persist the previous summary, take Game
  and immediately mark it absent, then search for the first active client.
  An absent Game is a no-op. With no active client the taken Game is dropped
  without constructing a replacement. With an active client and nonzero old
  player GUID, queue empty opcode`17e` before removing old objects. Factory
  `1458bdf90` constructs from retained entry inputs. The source now sends
  `SessionEvent::GossipComplete` through the real FrameXML consumer at that point.
- **Endless**, helper `14591d6b0`: admit phase5 only, set endless, change phase
  to1 and store deadline`clock+300`. The shared unroot packet precedes the
  localized RAID_BOSS_EMOTE titled `Endless`, body `The onslaught never ends...`.
  Its dispatcher caller queues empty opcode`17e` for **any present Game**, even
  when the helper declined a non-victory phase. The source now preserves that
  caller behavior and packet order.
- **Menu**, helper `1458b8300`: search for an active client before persisting or
  taking Game; no active client is a no-op. The admitted path persists, takes
  Game, clears retained run configuration/active connection, sends logout
  complete, then invokes the frontend callback. A second Menu in the same
  batch sees the inactive connection. Stock/custom frontend routing uses the
  stable frontend resource rather than a summary already cleared by input.
- **End Run**, helper `14594b330`: admit active phases1..3, discard pending
  choices, store abandonment/terminal phase4 and relocation clock, call the
  shared movement freeze, then create the summary payload. The source's
  existing choice retirement/freeze path is retained. HUD confirmation/input
  ownership is documented separately in [HUD recovery](hud-ready-0.109.0.md).

Constructor seed, retained context and fail-fast boundaries are owned by
[run seed construction](run-seed-0.109.0.md). Startup, worker/auth/channel and
ordinary logout commands are owned by
[stock lifecycle](stock-lifecycle-0.109.0.md). Account/XP lifetimes are owned by
[run account delivery](run-account-0.109.0.md); current payload, loot, Canvas,
XP parser and animation are owned by
[terminal presentation](terminal-presentation-0.109.0.md).

## Components and visual ownership

The current EndAction TypeId is
`3b7868c71c6f4f64e25ea32f3b354e93`, not the historical value. Its typed getter's
sole decoded query caller is the input query above. The tuple registration
`140348220→1402a0060` inserts EndAction, Interaction, Node and the terminal's
border/gradient/shadow fields. It does not insert Button or the picker's Hover
marker. Source terminal buttons likewise use Interaction directly.

The decoded direct Interaction getter census finds68 calls in43 owners.
Intersection with typed border/shadow getters identifies specialized card,
singleton, picker and Badge queries, rather than a terminal hover painter.
The current terminal style constructors are independently executed by
[shared overlay style recovery](overlay-style-0.109.0.md). These are positive
typed query/registration facts. Arbitrary raw ComponentId use, computed/global
hooks or indirect component mutation are not excluded by this census and remain
under gap #41; no replacement hover behavior is invented.

## Static checks and limits

`python3 -B scripts/check-terminal-flow.py` passes **305 original
instruction executions** for action mapping, Game taking, all active-client
masks through6 rows, player-GUID gossip guards, victory/End Run admission and
state writes. **1,936 independent FIFO/state cases** cover command batches
through length4, absent/Ready/defeat/victory Games, active/inactive clients and
present/absent constructor results. The former first-command behavior differs
in958 of those cases. Source guards verify queue lifetime and both gossip
connections; they do not execute Rust. Two source regressions are authored but
unrun because compiling tests is outside this workflow.

The current [mover collection/order recovery](terminal-order-0.109.0.md)
separately executes219 native cases plus64 collection model cases. It retains
creation/order semantics through mutation, rather than reconstructing an
insertion order from truncated GUID sorting. This report does not extend that
claim to arbitrary ECS collections or scheduling.

No build, compiling test, game, graphics device or filesystem/network runtime
was executed. Packet consumption, actual simultaneous input, replacement
scheduling, final delivery and visual/gameplay parity require runtime comparison.

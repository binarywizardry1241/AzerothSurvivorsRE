# Warned charge lines and delayed movement

This report owns the current native move7 producer, its internal delayed35
movement consumer and their source connection under gaps **#42/#43**. The target
is the configured installed EXE, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
Current overall status remains in [verification-needed](../verification-needed.md).

The source now creates the one-second line warning, resolves its fixed geometry
through the shared hazard channel, and begins movement only when the separate
delayed record becomes due. It does not reuse the historical instantaneous
charge/endpoint-explosion implementation. Compilation, live interaction,
presentation and original/rebuilt parity remain unverified.

## Native producer and inputs

The dispatcher `1459578e0` selects native7 at `145958665`; its continuation is
`14595bf44..14595c0e9`. [The manifest](evidence/0.109.0/raid-lines/manifest.json)
binds the decoded instruction ranges, constants and **17 primary boss** plus
**20 guardian** recurring slots to this target. All selected payloads contain
spell100. The guardian alternate moveset is retained as a separate variant;
there is no guardian phase with native7 in this catalog.

Source semantic9 carries the spell and preserves the native scheduler repeat in
word6. The payload has no substitute charge timing or width parameters. The
producer computes the player-facing angle, extends the original XY distance by
six, and projects an endpoint from the captured source. Its first Z sample is
primary height at the player's XY, falling back to the captured player Z.

Current collision helper `1458d1c90..1458d1d70` consumes the native XY ray
fraction. For a fraction below one it subtracts
`0.5 / max(XY_distance, 0.5)`, clamps that result to zero, then interpolates all
three coordinates. A primary height sample at the resulting endpoint replaces
its Z only when available. No secondary/fallback height is used for that
movement endpoint. The warning's origin independently uses the shared hazard
constructor's primary/secondary/default height chain.

The line length is `max(clipped_XY_distance, 4)`. Its total width is
`min(max(actor_size * 1.2, 4), 7)`, preserving the native MAXSS/MINSS operand
semantics for unordered size data. Current size inputs are verified for all 37
selected slots: boss descriptor `+0x48` is copied unchanged into actor `+0x170`;
guardian enemy descriptor `+0x28` is multiplied by the current native 1.35
constant before the same actor field is written. Those selected current scalar
bytes equal the reused source catalog. The live port returns the boss definition
size or the guardian's stored spawn size. The warning faces the original player angle,
retains the fixed source position and deals `effective_damage + effective_damage`
at its inclusive deadline. Its rectangle includes both longitudinal endpoints
and both half-width edges; Z does not affect membership. It has no dynamic
ground object, following flag or optional impact spell. Creation queues state;
the normal later hazard stage publishes `hz` and eventually `hzend` only for an
already published warning.

The independent generic action block uses **1.6 seconds**, from the current
duration selector retained by [the wave owner](raid-waves.md), before
that gate's common 0.4-second release extension. Movement is held for
`line_length / 40 + 1`; SpellStart has a one-second duration. These clocks have
different owners and are not interchangeable.

## Facing and delayed35 lifecycle

The current hold helper is retained once in
[raid-waves/hold.asm](evidence/0.109.0/raid-waves/hold.asm). Its facing=true branch
calls packet constructor `1458c6f10`; it sends one stationary **moveType4**
packet rather than the moveType1 stop packet. After packed GUID/origin/serial it
writes angle, flags `0x100`, duration `1`, count `1` and the same origin as its
only point. The serial comes from the shared movement counter. That helper does
not separately store an actor facing field. The selected packet write lane is
retained in this report's evidence and checked with original instructions.

Queue helper `145957260..14595731f` stores source GUID, deadline `now + 1` and
an internal native35 record containing the captured endpoint. In the next
effects stage, before hazard processing, `14594e610` removes a due entry before
looking up a matching alive source. Its skip branch is `deadline > now`, so an
unordered clock does not skip admission. A missing/dead caster suppresses the
movement and its spell packet; it does not remove the separately fixed warning.

The native35 handler `14594ea7b..14594edb4` samples the source's current
interpolated position, replaces Z with primary height when available, and moves
toward the already captured endpoint. Duration is
`max(current_XY_distance / 40, 0.15)`; the movement packet's milliseconds use the
native saturating float-to-u32 conversion. Its movement refresh deadline is
`(now + duration) + 0.2`, while its remaining attack delay is extended to at least
`duration + 0.4`. After the movement packet it sends SpellGo **spell100** to the
captured ground endpoint with no hit list. Native35 creates no endpoint AoE.

Current movement packet constructor `1458c2b90` writes moveType0, flags `0x100`,
the requested duration with zero replaced by one, and exactly one path point:
the captured destination. Its start is the current primary-height-adjusted
source, and its serial is the newly incremented shared movement counter. The
live source emits that packet before SpellGo rather than relying on later local
path synchronization to reconstruct its ordering or serial.

## Source ownership and checks

`bosses/raid_lines.rs` owns endpoint construction and the separate delayed
movement queue. `bosses/raid_areas.rs` owns the shared wrapping hazard IDs,
fixed-line membership, marker publication/removal and combined hazard damage.
The live boss/guardian combat adapter supplies actor size, collision/height,
facing hold, current-source lookup and movement publication. The selected native
slots use the current boss schedule and guardian signature records.

`scripts/check-raid-lines.py` verifies installed target identity and
replays original extracted instructions in synthetic memory with Capstone and
Unicorn. Its **72 producer cases** include collision clipping, source-size
clamps, primary-height failure, the common hazard constructor and delayed queue
writes. **24 delayed movement cases** check current-position sampling, minimum
duration, packet order and actor deadlines/attack-delay extension. **Nine
deadline cases** cover equality and unordered inputs, **20 membership cases**
cover the inclusive rectangle edges, and **six facing packet cases** verify the
exact field bytes. All external trig, ray-fraction, height, hold/cast and packet
constructor dependencies are explicit seams. The native margin/queue/hazard
and delayed actor writes execute; the original game process does not.
There are also **37 current action-duration cases** for the independent
1.6-second gate and **eight movement packet cases** that check serial wrapping,
normal facing, flags, single destination point and the zero-duration floor.
**37 current constructor-size cases** execute the native load/multiply/store
lanes, compare selected source catalog values and trace the live size port.
The actor-record copies retain their canonical
[terminal-order evidence](evidence/0.109.0/terminal-order/manifest.json).

The Ghidra raw import and seeded native7 branch decompilation are retained as
[producer.pseudo.c](evidence/0.109.0/raid-lines/producer.pseudo.c), with provider
and input identity in the manifest. The fresh full delayed-owner import reached
a bridge identity failure; a narrowed import also failed. Those raw diagnostics
remain under ignored `runtime/`. The delayed consumer's evidence here is its
fresh independently decoded and bounded-executed native instructions, without a
claim of complete Ghidra body/reference recovery.

The Rust cases in `tests/raid_lines_01090.rs` cover warning/deferred movement
order, captured endpoint versus current source, late ticks, dead casters,
collision/height failure, line edges and every primary schedule slot. They were
authored and statically inspected, **not compiled or run**. These checks do not
establish CRT trig equivalence, world collision parity, packet interpretation,
gameplay, rendering or complete encounter behavior.

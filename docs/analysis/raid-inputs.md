# Boss arithmetic and guardian schedules

Current boss constructor arithmetic and guardian selection/reset/scheduling
agree with the connected source contracts. This is bounded target revalidation,
separate from whole encounter or gameplay parity. The target is installed
0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.

`scripts/check-raid-inputs.py` checks all sixty current boss headers
through the [canonical graph](raid-native.md), then executes 480 current
arithmetic cases (sixty bosses × eight profiles). These check health, damage,
movement, attack period, reach, scale and initial deadlines by exact f32 bits.
They cover health/damage/speed percentage extremes, inactive endless gates,
active endless states and clamped zero exponents. Native power calls occur
only for phase 1 with endless enabled, in damage-then-health order. Explicit
injected Windows `powf` results preserve that library seam.

Current arithmetic lives at `14593b2d9..14593b386` and
`14593b6e1..14593b848`, within constructor `14593b0f0..14593be1c`.
Register allocation changed; the check uses current operands instead of
assuming instruction-shape identity. Game fields move nonuniformly: current
clock/endless/counter/options groups differ from the player/actor groups.
Source semantics use named state and do not depend on those native offsets.

The guardian fixture executes 2,352 current instruction cases: 1,600 selector
IDs, forty selected-list resets, thirty-two shared RNG transitions, 128
high-six-bit variant selections, 120 strict phase/latch boundaries and 432
cast/earlier-queued-action admission cases. Every fragment rejects external
calls. Current selector `145898f10..145899272`, reset owner
`1459b7f00..1459b82a6`, constructor selection lane, phase lane and recurring
lane are independently byte-bound in the
[manifest](evidence/0.112.0/raid-inputs/manifest.json).

Guardian selection still consumes a rejected-bit-57 RNG draw, including kinds
without alternatives; the current temporary register is R14. Reset restores
the selected list, clears phase bits and initializes repeat × 0.5 timers.
Strict health phases precede recurring requests. Current-health repeat scaling
and the `a0180006` nonblocking mask retain their prior meanings. Boss enrage
remains a separate latched rule.

The boss scheduler adds **16,096** current instruction profiles: 140
primary/enrage/latch boundaries, 36 health-denominator cases, 396 strict phase
and latch cases across all thirty-three phase records, thirty-three exact
phase-action queue copies, sixty-six localized/fallback phase-yell cases,
15,420 recurring profiles across all 257 root records, and the five reachable
replacement lists. These check the current `0xa0180006` admission mask,
cast and earlier-request gates, overdue timers, slot order, payload bytes and
normal/enraged repeat scales. Replacement initialization executes the actual
`repeat * 0.5 + 1.0` helper. Phase-label cases verify the encoded native
`boss.{id}.phase{index+1}` template and actual argument values before
intercepting formatting/localization. Allocation provides controlled storage.
Unlisted calls fail. Named source guards bind those rules and phase-before-
recurring ordering to `ai`, `minion_phases`, `raid_area_catalog`, guardian
replacement state and encounter announcements.

[Ghidra provenance](evidence/0.112.0/raid-inputs/rea-provenance.json) records
completed 12.1.4 raw imports for the full current boss constructor and guardian
reset owner. External code/data and full-image callers are outside those
imports; assembly and bounded cases own exact arithmetic/state conclusions.

Run `python3 -B scripts/check-raid-inputs.py`. These checks execute
original instructions, not Rust. Compilation, complete constructor placement,
terrain, actor publication, rendering/audio and original/rebuilt encounter
parity remain unverified under #42 and the owning shared-engine gaps.

## Guardian signature scheduling cross-check

The current graph checker independently compares every source identity/order,
each of 40 variant boundaries, all 120 recurring tag/cooldown/payload tuples,
and all 15 phase tag/threshold/yell/payload tuples to the current native catalog.
Anubisath Sentinel 1110 has four lists; Horsemen 1412–1415 retain distinct roots
and half-health actions. All 15 thresholds are 0.5; the current selector/scheduler
proof separately checks strict admission, once-only latches and reset behavior.
This supports the bounded current guardian-signature release claim, with the
actual primitive/provider seams in their owning reports. It does not establish
historical introduction timing, Rust execution or encounter/presentation parity.

# Movement-driven run start

The [native evidence](evidence/0.140.0/movement-start.json) for finding #38 and
release claim `changelog:0.140.0:97b441022c8ea419` is bound to the installed
0.140.0 EXE SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.

## Movement admission

The 25 ordinary movement opcodes enter the movement parser through
`0x145ea482b`. The parsed flags, XYZ, facing and u32 packet time reach
`0x145e9b3c0`, then the host report branch at `0x145f1dc63` or the
addressed guest branch through `0x145e702a0`. The latter runs with its nonzero
world actor selector and restores zero after the callback. Both invoke the
floor consumer at `0x145f97a60`. The speed and knockback acknowledgement
opcodes lie outside this dispatcher gate.

The floor consumer reads the report's low four movement bits and samples the
prior local directional flag. In local context it immediately replaces the
prior flag, including when the pending-correction filter subsequently ignores
the position. A guest report cannot replace that flag. The ready transition
uses the current or previous flag. This covers directional stop reports that
carry the last accepted movement after releasing input. Forward, backward
and both strafe directions qualify. Turn, pitch, jump and fall bits alone
do not qualify.

The final XYZ and facing are committed before the phase check at
`0x145f98613`. The call at `0x145f98714` requires ready phase, either
directional flag, ordered squared XY displacement strictly above the native
f32 0.04, ordered equality between admitted and reported X/Y/Z, the local
actor selector, and a clear startup restriction. Its Begin callee stores
phase 1 at `0x145fae2d7`. Corrected XYZ can still publish and commit without
starting the run when the correction changes a component.

## Co-op startup restriction

The Game constructor initializes both the previous-direction latch and startup
restriction to zero. During host world creation, the successful initial
guest assignment list arms the restriction at `0x145ebf6ad`. The host
records the absolute driver time at `0x145ebf8de`. The host update at
`0x145eab5b1` clears the wait after all assigned rows are synchronized or
60 seconds have elapsed. Unassigned rows are skipped. Completed initial
publication sets the synchronized byte at `0x145ecde6e`. Clearing the
restriction admits later qualifying movement. The clear itself does not call
Begin.

## Source and static checks

[Local admission](../../crates/azeroth-survivors-re/src/gameplay/mod.rs)
uses the ordinary benilla movement report flags and the existing authoritative
position and floor-recovery owners. The stock mover retains its acknowledgement
capture and serialization. The AS floor loop consumes only ordinary movement
reports and uses their existing packet timestamps. The
[co-op bootstrap](../../crates/azeroth-survivors-re/src/gameplay/coop.rs)
arms the wait on the initial admitted host-world batch and updates it from
actual peer synchronization before the gameplay tick. It samples Bevy real
elapsed time so a long frame does not shorten the measured wait. New run
entry resets both fields.

`python3 -B scripts/check-coop-start.py` passes 1,756 bounded native cases
across opcode selection, directional sampling, admitted XYZ, the start gate
and synchronization expiry. The checker stops at the Begin call and uses
synthetic caller state. The retained Ghidra result was verified against its
original-VA raw slice and the installed PE. `python3 -B
scripts/check-coop-correction.py --source-only` passes source connections
and 15 Rust syntax parses. Two focused Rust regressions are authored and
remain uncompiled and unrun. Actual controller, game, network and
original/rebuilt comparison remain open.

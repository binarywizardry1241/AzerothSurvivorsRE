# Guest movement and ready-to-running admission

Incidental finding **#282**, discovered during selected #270 recovery, is
source/static repaired against the installed 146,228,736-byte EXE SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [proof](evidence/0.123.0/coop-start/manifest.json) reuses the
[correction report's](coop-correction.md) three current Ghidra subjects
without duplicating their canonical extracts or importing another Program.

## Native producer, gate and state transition

The actor dispatcher `145ae4870..145ae4c16` handles a remote actor only for a
nonzero selector within its retained remote-row count. It removes row
`selector-1`, swaps that hero's state into the shared Game and writes the selector
to `Game+c50` at `145ae4ae2`. The saved guest closure `145bb79f0` calls the shared
floor admission while that selector remains active. The dispatcher clears it at
`145ae4b41`, after the callback and post-processing, before restoring the host.
This field is an actual actor-context producer, not an inferred GUID exclusion.

At `145b0abf5..145b0ac31`, floor admission invokes `145b18c00` only when phase
`Game+d57` is zero, admitted XY displacement squared is strictly greater than the
current f32 0.04 constant, the actor selector `Game+c50` is zero, and restriction
byte `Game+d53` is zero. The callee's exact entry publication at `145b18c77` writes
phase1. The nonzero remote context consequently prevents a guest movement report
from taking this ready-to-running transition, even when that report moves far
enough and is otherwise accepted.

## Source correction

`gameplay/coop_commands.rs` previously accumulated guest displacement in `began`
and assigned `run.started=true`. That allowed a guest walking before the host to
start the host's simulation. Those three guest-start fragments are removed.
Guest admission, pose, combat movement inputs, correction and peer delivery
remain connected. The host's ordinary `commit_movement_report` still commits its
final pose and invokes the existing displacement gate to start the run.

## Verification and limits

```sh
python3 -B scripts/check-coop-start.py
```

**307 isolated original-instruction cases /1,256 steps** pass. They cover the
selector's lifetime through a synthetic callback and reset, phase/displacement/
selector/restriction combinations, unordered displacement, and the callee's
phase1 publication. Synthetic callbacks stand in for the omitted closure body
and post-processing; the retained Ghidra subjects independently establish that
closure's actual floor call. The checker verifies exact input/result receipts,
all selected original bytes, source absence of guest start assignment and
preservation of the host's existing start consumer.

The source syntax remains covered by the eight-file correction checker. No
compilation, authored Rust test execution, game/client/network/server operation
or original/rebuilt comparison occurred. Actual multiplayer ready/run behavior
and parity remain unverified. No wider meaning is assigned to the restriction
byte or other start-function branches beyond this proved gate.

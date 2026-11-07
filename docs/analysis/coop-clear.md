# Final-boss clear persistence

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [current proof](evidence/0.123.0/coop-clear/manifest.json) binds six journaled
Ghidra subjects and exact original producer, projection, admission and save
instructions for **#264**. The [earlier clear/save recovery](heroic-unlocks.md)
retains its original provenance; this report establishes the current timing and
its source connection, without claiming complete cooperative equivalence.

## Native transaction

The shared damage/death owner `145b52250..145b568f6` follows the lethal actor
path into its primary-boss lane. The final descriptor byte `+64 == 1` and
zero low byte of inner Game `+ba8` admit writing phase **1** and the captured
death clock at `+bac`, immediately after the boss rewards. This is independent
of remaining upgrade choices or later completion presentation.

The live snapshot producer `145ccc4e0..145cccd4e` copies the low byte of that
phase into snapshot `+c1`; snapshot `+c0` separately tests terminal state.
`145c27010` delegates live projections to that producer using wrapper `+10`,
or copies the retained accepted guest cache. Thus the wrapper's phase field is
`+bb8`. The current driver checks that field and its local run restriction before
calling clear consumer `145c27820` at `145c107e0`, outside terminal settlement.

The State15 dispatch cell and original branch at `145c2fb28` validate the
recipient state and replace its cache before calling the same clear consumer
at `145c30b84`. Raw-slice Ghidra cannot resolve the external switch table or
follow every out-of-slice tail call; exact table, branch and producer bytes are
checked separately. These bounded observations do not certify the whole dispatcher.

The clear consumer requires a valid snapshot with won byte **exactly 1** and
a selected GUID other than `0xffffff`. Local showcase admission is excluded;
the guest mode bypasses that local restriction. Valid final-death source state
uses phase 1; the instruction fixtures also check rejection of won byte 2.
The captured-rank/class-ceiling minimum is evaluated **before** Normal
beaten-pair insertion; monotone Heroic mutation at `145aca710` then uses that
saved minimum. An account lacking its class's Normal clear records only Normal
on that publication. The current account save boundary
`145ad4f10` runs only when a Normal or Heroic record changes. Notice readiness
is a later condition and does not prevent the durable clear.

## Connected source

The existing final-death `CompletionState` already supplies the shared phase
latch, and `Mechanics::victory_reached` publishes it through State15 independently
of terminal state. No new message or invented completion event is needed.
The separately identified [solo projection repair #283](solo-clear.md)
also connects that latch while a local solo run still has a pending choice.

`guest_settlement::persist_victory` now owns the clear-only transaction. It
retains captured class, zone, rank and roster identity, captures the effective
rank before any Normal mutation, reuses the existing Normal/Heroic Save APIs
and publishes the existing HeroicProgress notice only
when ready. A semantic duplicate guard prevents the source Normal-record
rewriter from queuing another save merely by reordering unchanged records.
It introduces no extra lifetime latch and still accepts a later higher clear.

The host calls this transaction before its terminal-summary gate. Guest receive
calls `Snapshot::victory` immediately after accepted State15 caching, routing
notices into the live game or retained pre-world event queue. The independent
account adapter uses the same transaction; the old duplicate terminal-only
victory mutation is removed. This does not acknowledge summary XP, result,
count or phase checkpoints. Existing private equipment/marks, achievements,
history, summary departure and cleanup retain their separate consumers.

## Validation and limits

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-coop-clear.py
```

The checker verifies six exact current query subjects, original code/assembly
and scoped source receipts. **88 isolated original-instruction cases** cover
won/Tester/mode/local restrictions and the independent driver phase gate;
synthetic wrapper/stack memory stops before account calls. Four changed Rust
paths parse without compiling. Five authored Rust regressions cover cached and
live phase-2 clear timing, repeated state, missing/Tester/zero GUIDs, showcase
and unstarted host exclusion, notice readiness, Normal clears, class/zone
ceilings including missing-Normal ordering, and retained summary/count/XP
checkpoints. They are uncompiled/unrun.

No application compilation, compiling test, client/game/network/server operation,
actual filesystem save, visible notice or original/rebuilt comparison occurred.
The selected source/static repair is complete; actual multiplayer delivery,
save durability, gameplay and parity remain unverified.

# Friend-required achievements

Selected EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This is the source repair and bounded static contract for **#167** and its
independent cooperative-history admission **#173**. [verification-needed](../verification-needed.md)
owns remaining validation; [guest settlement](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.118.0.md)
describes the separate #166/#174 lifecycle obligation. The historical 0.117.0
catalogs, fixtures and Save recovery retain their original provenance.

The [manifest](evidence/friend-achievements/manifest.json) binds nine
current unwind owners, selected original instruction ranges, the computed
composition table, seven English description keys and nine completed durable
REA/Ghidra queries. Full-PE pseudocode has unresolved computed-flow and
overlapping-instruction warnings; independently decoded PE instructions and
exact table entries establish the selected branches. Neither a seed nor a
decompiler result establishes whole-function or whole-module completeness.

## Admission and event timing

Composition helper `145b33760..145b33a72` dispatches through the four signed
relative entries at `1475e2560`. Its Any arm `145b3378f..145b33796` compares
unsigned member count against **2**. Other composition variants require exactly
five members and retain their class, talent-bit and highest-spell predicates.
The source `account_progression.rs::CooperativeParty::matches` now uses that
two-member guard.

Run evaluator `145b42bf0..145b436b6` passes each lethal event's vector/count to
the helper at `145b43039..145b43050` and `145b434ba..145b434d1`. Victory uses
the current context at `145b43621..145b43650`. Source retains the same division:
Against All Odds and Things That Go Bump in the Night test victory membership;
The Old Gods Have No Friends tests the membership copied into its boss event.
A qualifying prior boss event remains eligible after someone subsequently
leaves. Current membership alone must not discard that event.

Context `145b84f90..145b85125` requires cooperative mode plus a retained remote
row, then clones the cached member vector and prior events. Presence of the
context is therefore distinct from having two eligible members. Current party
update `145b7d080..145b81575` rebuilds the member vector before hero simulation:
local flag `+c77` excludes an abandoned local hero; remote mapper
`145c226e0..145c22adf` skips exactly abandoned flag `+983 == 1`. It retains down,
dead and victorious heroes independently of health. `145b7d4d0..145b7d586`
appends the remote projection and installs the cached vector. Abandon owner
`145ba61b0..145ba622a` sets `+c77` before its death call. These bounded contracts
support retaining the source's tick capture, host-first order, abandoned filter,
private hero swap and immutable event snapshots. An eager membership rebuild
inside a recipient swap would omit the temporarily held host and is not this
native contract.

Account owner `145b15590..145b15ac7` tests won at `145b15737`, then separately
requires a present context and **member count >=2** at `145b15825..145b15841`
before inserting cooperative won-zone history. `gameplay/mod.rs::persist_run_at`
now applies this guard without suppressing evaluation of previously captured
boss events. That history then feeds Better Together, For the Team,
Dragonslayers and Together, To the End through the existing account evaluator.

## Descriptions and saved progress

The current achievements constructor `145b39760..145b3fb31` references each of
the seven replacement English strings directly. Exact references and data
hashes are in the manifest. The target-bound
`coop-achievement-descriptions-0.119.0.json` overrides those descriptions by
stable achievement key in `progression.rs::Catalog::embedded`; the historical
catalog is unchanged. `Achievement::label` consequently uses the current locale
lookup keys. Importing the separate translated payload additions remains #169.

The repair changes admission for new run progress. It does not remove saved
history, achieved keys or first-earned dates. Existing `Save` readers retain
`coopbeat|` entries, history insertion starts from the existing set, and
achievement insertion retains previously earned keys and dates. The four
history-based achievements continue using that saved progress. No migration or
retroactive revocation is introduced. Real old-save round trips and filesystem
delivery remain unverified; source tracing does not establish native I/O parity.

## Static checks and limits

```sh
python3 -B scripts/check-friend-achievements.py --require-retained-queries
PYTHONPATH=runtime/tool-state/python/armory/python-libs python3 -B scripts/check-friend-achievements.py --require-retained-queries --replay-instructions
python3 -B scripts/check-reconstruction-coverage.py
```

The optional instruction fixture uses the existing local Unicorn installation
(or an installed compatible `unicorn` module). **73 original composition
fixtures** check counts 0–7 across all six variants and class/talent/spell
failures at each of five positions. Ability lookup is an explicit seam returning
the selected spell descriptor; it does not verify that engine subsystem.
The other checks verify exact PE/data/query hashes and the live predicate,
description, context, history and additive-save connections.

Rust regression source covers the independent 0–5 victory/event population
matrix and adapts the unchanged 0.117.0 oracle for the later Any restriction.
Those regressions were **not compiled or run**. Compilation, actual guest/host
delivery, departure and Save behavior, translated rendering and controlled
original/rebuilt parity remain unverified. No game, client, server, relay or
network service was run.

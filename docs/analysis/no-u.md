# `no u` killing-blow achievement

The selected EXE SHA-256 is
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
Its constructor `1458cd480` adds `feat:nou` after `feat:odds`: name `no u`,
description “Slay Sapphiron with a Frostbolt as the killing blow.”,
25 points, Feats category, kind9/feat6. The constant at `146bbf9a0` stores
`[25, 6, 1493, 116]`; the last two u32 lanes are the boss definition and
killing spell. Sapphiron's scheduled boss definition is1493, not its display ID.
The older 72 achievement records keep their provenance; this selected-target
addition produces 73 records/1,520 points.

## Native and live ownership

`145933ec0` records a pair only for a metadata-bearing victim whose post-hit
health is nonpositive (`145934606..145934699`). Its Game+6a8 vector has pointer
at+6b0 and length at+6b8. It normalizes spell16038→8349,14186→2098 and5308→20647;
Frostbolt116 stays116. The canonical instructions already reside in the
[meter hit extract](evidence/run-meters/accounting/hit.asm).

Snapshot `1458a77c0` copies that vector (its outer run owner addresses are16
bytes above Game). Feat evaluator `1458d4740` selects feat6 through the current
jump table and searches both lanes at `1458d49ad..1458d49e4`. This branch has no
additional class, source-kind, victory or end-of-run requirement.

The source records these pairs in `CombatAdapter::hit_boss` on the actual
lethal health mutation. Ordinary non-metadata actors do not supply this history.
Deferred Water Elemental projectiles already retain spell116 and source-kind2;
the same lethal path records their killing spell. Nonlethal hits and hits on a
dead boss add nothing. `persist_run_at` supplies the history to the existing
feat evaluator before/after terminal delivery, preserving its active-run,
showcase and roster eligibility checks. `Save::grant_achievements` retains
idempotence and earned dates; the existing Achievement event drives chat,
sound and banner publication. The new catalog row supplies the existing
Sapphiron reward gate and unlock description. It does not implement that actor.

## Checks and limits

`python3 scripts/recover-no-u.py --check` passes eight unchanged native
membership cases and24 kill-record boundary/alias cases, with full EXE hash and
selected catalog constants/strings checked. Synthetic memory supplies the
metadata, identity and post-hit health; no native allocator, external call or
game is executed. Only necessary constructor/evaluator extracts are retained in
[native vectors](evidence/no-u/native-vectors.json).

Seven changed Rust modules parse. Authored regressions consume native vectors
and exercise player/source-kind2 pending Frostbolt impacts through the real
boss hit path; they were not compiled or run. Compilation, actual account/game
delivery and original/rebuilt runtime/presentation parity remain unverified
under permanent gap **#26**.

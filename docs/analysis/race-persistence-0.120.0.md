# Permanent race ownership through save and perk reset — #189

Target **0.120.0**, 145,447,424 bytes, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
The [race purchase contract](release-contracts-0.120.0.md) owns the shared
account interfaces. The canonical [loader proof](evidence/0.120.0/race-account/manifest.json)
and [serializer/reset proof](evidence/0.120.0/race-unlocks/manifest.json)
retain their original native bytes and Ghidra query commitments.

## Recovered persistence contract

The loader's collector `145c42ab0`, token adapter `145c48790` and line adapter
`145c1e760` visit every trimmed line with prefix `races|`. Each complete suffix
is split on commas; tokens parse as decimal `u8` without token-level trimming.
A leading `+` and leading zeroes are accepted. Empty, sign-only, negative,
nondecimal and overflowing tokens are skipped. The predicate admits only IDs
1–8. Extra `|` characters invalidate their token rather than the whole row.
The loader combines repeated records, sorts ascending and deduplicates before
assigning the owned byte vector at account `+138/+140/+148`.

For example, `races|8,1,8` and `races|+2,0003,256,-1,x,0,9` produce
`races|1,2,3,8`. `races|1,2|x` retains 1; `races|1|x,2` retains 2.
Whitespace stripped from the complete line is distinct from whitespace inside
a comma token.

Serializer `145a95c14..145a95cb4` omits an empty race vector and emits a
nonempty one as decimal comma-separated `races|` data, after tabards and before
companions. Reset `145b4a010..145b4a08e` succeeds only with reset count below
two and a nonempty perk vector. It clears perk length, releases nonempty perk
strings and increments the count. Race ownership, tabards and other account
state remain untouched. The release's “kept” behavior does not refund the
100 achievement points spent on each permanent race.

## Connected source

The coordinated #187/#188 changes add `save/schema.rs::purchased_races`,
`Save::purchased_races`, the canonical `races` serialization family and race
vectors in `Progress`/`RewardPlan`. Accepted command 17 sorts/deduplicates its
race proposal, validates permanent ownership and total spending, and writes the
race record together with the existing perk/tabard records.

Backend command 18 continues to replace only `perk|` and `resets|`. The
optimistic Rewards reset clones the owned account, clears perks and increments
the reset counter; `Progress::write_rewards` now carries its race vector too.
Both paths retain permanent race spending and share the two-reset/nonempty-perk
gate. No new reset, refund or replacement-save behavior is introduced.

All ordinary persistence and export operations use `Save::plaintext`, so the
schema family also reaches the existing sealed envelope, active-file write,
export, import, load and backup consumers. The backup's typed-default gate is
already `!save.plaintext().is_empty()`: a races-only account now has progress
and reaches that existing backup path. Other account edits replace their own
families and leave ownership available to the serializer.

## Static checks and limits

```sh
python3 -B scripts/check-race-persistence.py
```

The [recorded result](evidence/0.120.0/race-persistence/check.json) verifies
11 canonical native ranges / 767 independently decoded instructions and four
completed durable loader queries. It replays 80 reset cases / 2,192 original
instructions in synthetic memory, comparing all 576 account bytes and the
race backing storage. Inputs include empty/nonempty ownership and perk vectors,
reset counts 0, 1, 2, 3 and `u32::MAX`, and zero/nonzero perk String allocations.
String deallocation is an observed seam; no allocator or game runs.

Source guards trace the current loader, serializer, accepted command, both
reset consumers, envelope/export/import/load and backup connections. Seven
authored Rust integration regressions cover malformed/repeated race records,
purchase admission and spending, accepted-purchase/reload/reset sequences,
rejected requests without mutation, optimistic/backend reset equivalence,
unrelated account edits, and sealed file/export/import/hourly-backup behavior.
The new Rust module passes a formatter/syntax check; its tests are unrun.

No further missing source connection was identified within #189. Compilation,
Rust test execution, actual file/backup/reload effects, UI interaction and
original/rebuilt parity remain unverified. Broader racial/passive/run-entry
and cooperative admission dependencies remain with #188 rather than being
certified by this persistence check.

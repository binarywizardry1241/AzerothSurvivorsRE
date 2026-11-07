# Current world tuning

Historical 0.100.1 evidence. Current primary-boss dimensions are revalidated in [the 0.105.0 catalog report](boss-catalog.md); three later Naxxramas scales supersede this snapshot.

Selected EXE SHA-256:
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

Current ordinary/elite constructor `1454d4130` applies the zone+e4 bonus
multiplied by the square of `clamp(clock/60/20, 0, 1)` before endless and
option multipliers. At ten minutes the factor includes one quarter of the
full bonus. The six later-zone bonuses are Arena .06, Scarlet Monastery .12,
Alterac Valley .18, Blackrock Mountain .25, Ahn'Qiraj .32 and Naxxramas .40.
The other six records have zero. `initial_stats_for_zone` supplies this factor;
the live spawn adapter consumes it. Other historical constructor operations
retain their 0.97.2 evidence until independently revalidated.

Five current 88-byte Naxxramas boss records refresh only their scale words.
Names, ability data and other boss fields retain their historical provenance.

[Evidence and native outputs](evidence/world-tuning.json) retain exact
record/constant ranges, hashes and 108 instruction results at run boundaries,
including unordered input handling. The optional
`scripts/recover-world-tuning.py` verifies the full target hash before
running two unchanged, reviewed no-call instruction ranges in Unicorn. It never
launches the original application and source builds do not require the EXE.
The two current source regressions passed: factor bits and all five scale
words. Three historical enemy-scaling regressions also passed. Central validation
results are recorded in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
This is bounded numeric/data recovery, not complete world or runtime parity.

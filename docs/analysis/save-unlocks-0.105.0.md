# Beaten-zone unlock restoration — 0.105.0

The save reader now restores each class's next-zone access from its `beat`
records, including Ahn'Qiraj to Naxxramas. Explicit `open` and migrated legacy
`unlock` progress remains a lower bound. This implements the source portion of
permanent gap **#15**; [verification-needed](../verification-needed.md) owns its status.
Compilation, Rust regression execution and original/rebuilt save/picker comparison
remain unverified.

## Selected-target contract

The authority is `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [target record](target-refresh-0.105.0.json) supplies its identity.

| Owner | Recovered behavior |
| --- | --- |
| Save loader `145886e60`, record branch `145889778..145889916` | After outer line trimming and pipe splitting, require exactly three fields and the exact `beat` prefix. Parse the class as a u8, including leading `+` and zeroes; reject empty, negative, overflowing or otherwise malformed values. There is no playable-class eligibility filter here. |
| Collector `145996570..145996879` and key selector `1458d6970..1458d6b1b` | Split the third field on commas and collect each recognized zone as `(class, zero-based zone index)`. Unknown, empty, differently cased or space-padded keys are skipped individually. The native key selector matches all twelve current `menu.json` keys and their order. |
| Loader normalization `1458893a4` onward | Sort and deduplicate class/zone pairs before restoration. |
| Merge loop `1458895c6..14588964f` | For each pair, calculate `min(zone index + 2, 12)`. Raise an existing same-class unlock only when this is higher; append a missing class. The final zone remains capped at twelve. |

The [native vectors and range hashes](evidence/0.105.0/save-unlocks/native-vectors.json)
bind the new record, collector, key-selector and merge-tail extracts to the PE.
The merge prelude/insertion instructions reuse the canonical
[audit extract](evidence/0.105.0/game-mode-audit/beaten-zone-unlock-repair.asm);
the new tail begins at `1458895ce`, after that extract's last displayed instruction.

Retained Ghidra save-loader Evidence
`ev_562816d41bbcf4c7865b78870afeeb61b0bfe750db85ff64389f802a2f43625e`
was reused after its complete 17,830-byte raw slice was checked against the selected
PE (slice SHA-256 `6fe3ec63589fe65255b187f39543c39364fe9c6ce0522e9c941af9a840d60f33`).
Fresh collector analysis through `./scripts/rea` and Ghidra 12.1.4 produced Evidence
`ev_48f49cac69aab60ff3141043f783f46b258d38b5cac1b99ea3dacac752b30e02`;
its 777-byte input hash is retained with the range metadata. The session was closed.
Raw-slice ABI/decompiler limitations remain; original instructions and bounded
replay establish the tested rules, rather than inferred pseudocode parameter names.

## Live source connection

[`save/progress.rs`](../../crates/azeroth-survivors-re/src/save/progress.rs)
previously read only `open` and legacy `unlock` records. It now collects recognized
`beat` pairs in sorted, deduplicated order, then merges their restored counts into
the same explicit-progress maximum. The old nine-zone ordinal migration is retained.

`Save::unlock_value` uses that shared reader, so `MenuState::open_zones` and its
selection clamp immediately see restored access after ordinary loading or sealed
import. `Save::plaintext` uses the same reader when emitting canonical `open`
records, so later saves/exports persist the repaired maximum. Reopening that output
is idempotent. Beaten and unknown/malformed rows retain the existing preservation
policy; this repair does not rewrite the broader save format or refund talents.

## Checks and limits

Run `python3 scripts/recover-save-unlocks.py --check` from the checkout.
Without `--check`, fresh reviewed candidates are generated beneath
`runtime/save-unlock-0.105.0/curated`, leaving retained evidence untouched.

**209 native instruction cases passed**: 22 exact zone-key cases, 17 class/record
cases and 170 unlock-merge cases. These include all nine playable classes and
twelve zones, absent/existing progress, higher explicit maxima, duplicate wins,
independent classes, legacy progress inputs, malformed records and unknown keys.
Original bytes, jump tables and constants are mapped from the hash-verified PE;
an unexpected instruction range or external call aborts the check.

Pipe splitting/outer trimming, comma-token iteration, pair sorting/deduplication,
existing typed unlocks and spare vector capacity are explicit harness inputs.
The collector is statically recovered; its full function is not emulated.
Allocation, complete loader/envelope/file IO and the compiled reconstruction are
outside the native replay. Existing legacy numeric migration is a supplied typed
input to these current merge cases, rather than newly certified parser behavior.

Four authored Rust regressions cover native fixture consumption/reparse, preservation
without spurious grants, sealed import/export and the actual picker access/clamp
consumer. Changed Rust syntax was parsed, Python syntax checked and diff whitespace
checked. Rust regressions, compilation, game applications and original/rebuilt
save/picker comparisons were **not run**. Static native success does not establish
that the reconstructed source builds or matches runtime behavior.

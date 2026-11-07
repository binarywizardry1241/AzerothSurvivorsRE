# Demonology allocation migration

This report owns gap #12's save/refund source portion. Authority is the supplied
0.105.0 EXE, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns integrated status. The current fourteen
talents, four-column layout and live effects are documented by
[Demonology offers](demon-offers.md) and
[gameplay](demon-gameplay.md).

## Native contract and source path

The selected live `talent` row parser at `145892850..145892cc3` reads class XP,
derives the point budget, decodes the allocation through `1458e2000`, and passes
it to `1458e2c50`. The save parser's spec pass at `145887e4f..145887f9d` uses the
same decoder/normalizer for each of three saved allocations, with the class XP
already loaded. These call-site observations come from REA/Ghidra Evidence
`ev_11d5e156e1653be2b843254efcf9324330260c09779fc8335c53e9d34a362e20`
and the existing whole-parser Evidence
`ev_562816d41bbcf4c7865b78870afeeb61b0bfe750db85ff64389f802a2f43625e`.
Their raw responses stay under ignored runtime; the whole parser also owns the
separate [beaten-zone finding](game-mode-gap-audit.md#totem-limit-and-saveaccount-additions).

The [retained manifest](evidence/0.105.0/talent-migration/manifest.json) binds
the exact decoder, lookup, normalizer and learning-gate ranges, compact Ghidra
extracts and their original byte hashes. The native contract is:

- Split comma-separated entries at the first colon. Trim Unicode White_Space
  around the key and rank, resolve the key in that class's current talent table,
  parse a nonzero `u8` rank and clamp it to the current maximum.
- Drop absent keys. There is no name-based replacement or transfer of
  `demonic_knowledge` ranks to `demonic_supremacy` in this current load path.
  Removed ranks cease consuming points while class XP remains unchanged.
- Sort by row, tree, then column; rebuild one point at a time subject to budget,
  row spending, full prerequisite rank, alternative prerequisites and exclusions.
  A retained key is not exempt from those current rules.
- `felfire_training` still identifies Demonic Echoes, and `aftermath` still
  identifies Scorched Earth. Keep those keys, subject to current normalization.
  The current EXE also retains shared keys such as `demonic_embrace`,
  `fel_stamina` and `unholy_power` when their current gates allow them. The
  historical release's refund wording does not justify a blanket tree wipe.

The live [save talent owner](../../crates/azeroth-survivors-re/src/save/talents.rs)
already shares the current catalog/normalizer between live and stored specs.
Its decoder now follows native first-colon/trim behavior; previously padded
preserved keys or ranks were dropped. `Save::parse` and sealed `Save::import`
both canonicalize through that owner. Selected live allocation remains
independent from its stored slot until an explicit switch, as before. Normal
menu spending/refunds, saved-spec switching and run-entry effects consume the
same current allocation, without introducing a second migration table.

## Checks and limits

`python3 scripts/recover-talent-migration.py --check` passes **32 native
decode/normalization cases**. It executes unchanged selected-target decoder,
Unicode trim, lookup, collector, insertion sort, exclusions, prerequisites and
normalizer instructions. Cases cover old removed/shared keys, preserved keys,
rank caps/invalid ranks, Unicode whitespace/non-whitespace, eight budgets,
Soul Devourer/Link exclusion, either Legion Gate prerequisite and class isolation.
For the old-tree case, thirteen allocated points survive and the rest are free
within the supplied 51-point budget; XP is outside this normalizer and unchanged.

Allocator/vector growth, inert frees, `memcmp` and `memchr` are explicit host
seams. Fixtures stay below 21 candidates and do not execute the large-sort path,
save envelope, filesystem, menu VM or game. Ghidra raw slices have generic ABI,
unmapped-callee and out-of-slice limits; original Windows instructions and the
bounded native replay establish the narrower contracts above.

[Rust regression source](../../crates/azeroth-survivors-re/tests/talent_migration.rs)
applies the native fixtures to load/import, all three specs, canonical reopening
and unspent-point accounting. Further cases cover independent live/stored slots,
unchanged other-class XP/allocation, no automatic Supremacy purchase, spending
refunded points, and prerequisite-safe manual refunds. Those compile-based
tests were **not run**. Rust syntax/format, Python syntax, retained JSON/hash
checks and diff whitespace checks pass. Compilation, actual persistence/input,
rendering and original/rebuilt runtime parity remain unverified; parent #12
remains open for that validation.

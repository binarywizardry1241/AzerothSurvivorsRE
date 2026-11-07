# Typed Save schema and menu appearance

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the current typed Save parser/serializer connection under #17.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall status. The separate
[equipment report](save-gear.md) owns item/equipment/cosmetic/Seen details;
[Talent persistence](talents-save.md) owns its current talent/spec contracts. Sealed envelopes, active-file IO and backups have
separate current Save-core evidence.

## Current schema and source corrections

The authoritative full parser `14589e380..1458a2926` and serializer
`1458a4340..1458a681d` are retained once in the shared
[Save-core manifest](evidence/save-core/manifest.json). Additional current
appearance owners, exact byte hashes, original-VA Ghidra/assembly extracts and
bounded native helper ranges are in the
[schema manifest](evidence/save-schema/manifest.json). Existing historical
reports and data keep their original targets.

The source previously retained arbitrary raw lines and serialized families in
mutation/insertion order. Current `save/schema.rs` constructs only recognized,
valid typed records and emits the native fixed family order:

`roster → pick → open → items → equip/look → talent → spec → seen → ach → achat → stat → beat → perk → tabard → pets → resets → hero`.

Unknown record families and malformed records disappear. Unknown values survive
only where the native family permits them, including achievement keys, dates and
Seen keys. Equipment/Look and Talent/spec parsing delegate to their owning
modules. RunMods CSV parsing delegates to the shared current parser rather than
maintaining another token decoder.

| Family | Current native rule |
| --- | --- |
| Roster | At least 10 pipe fields; extra fields ignored. GUID parses as u64. Race/class/sex parse as u64 then truncate to u8; four result counters parse as u64 then truncate to u32. Five valid u8 appearance tokens are required after filtering malformed tokens. Empty/arbitrary names, sex values above 1, duplicate GUIDs and file order survive. |
| Pick | First valid row; 6..8 fields. Normalizes class/race/sex, name, zone, appearance when the optional cache exists, and RunMods. Invalid CSV tokens are filtered before requiring five appearance bytes or four u16 modifier values. |
| Open/unlock | Exact three fields, any u8 class. Duplicate progress takes the maximum while retaining first class encounter order. Legacy numeric unlock uses the old nine-zone key table before conversion to the current 12-zone order. Zone values are not individually trimmed. |
| Beat | Exact three fields; recognized zone keys only. Deduplicates and sorts by class/current zone index, then restores the maximum next-zone open value. Explicit open classes precede newly restored classes. |
| Achievement | All nonempty keys, including unknown keys; lexical sort and deduplication. Inner whitespace remains part of the key. |
| Achievement date | Key may be empty or unknown; timestamp is u64. The first `=` separates the value; repeated delimiters invalidate the value. Duplicate keys retain the minimum timestamp, including 0. |
| Statistics | Only kills/gold/guardians/bosses/runs/wins/caches. Duplicate values retain their maximum. Any nonzero value emits all seven fields in that exact order, including zero fields; all-zero statistics emit nothing. |
| Perk | File loading accepts known keys and positive u8 ranks only. Clamp to the catalog maximum, then keep the minimum positive rank per duplicate key; lexical key order. A zero rank accepted by the live Rewards command remains typed state and is serialized until the next actual load. |
| Purchased tabard | Only 90011..90024; ascending unique IDs. Earned tabards 90001..90006 do not become purchased rows. |
| Pets | First matching prefix row, including an empty row. Keep at most two entries; each unknown/empty key becomes squirrel. Duplicate entries and a single entry remain. |
| Resets | First valid u32, including 0; later rows cannot replace it. Zero emits no row. |
| Hero | Exact five fields and an eligible class/race. Sex becomes 0/1; appearance has five valid u8 tokens after filtering. A later valid class record removes the prior record and appends at the end. |

The live Save load path now applies the typed parser. Plaintext/sealed write-back
uses the fixed serializer. Roster, Hero, Pick, achievement-date and statistics getters share the
same schema owners. Reading/serializing an already typed Hero/Pick does not
reapply a newly installed appearance cache; load and explicit Hero/Pick mutations
own that normalization. This preserves the native optional-cache timing.

Validated live account mutations replace only their owned record families through
`Save::replace_runtime_records`, without passing through the file parser. Current
Rewards can accept a known zero-rank purchase: the native serializer emits it and
Reset sees its nonempty vector, while an actual parse reload drops it. Gear,
tabard and reward edits preserve that state and unrelated fields. The
[account command report](account-command-owners.md) owns the executable
serialize/reload/Reset sequences and the unrun source regressions.

Related source regressions now expect native unknown-row/custom-stat discard,
while retaining their original progression, timestamp, spec, Pick and unrelated
Look assertions. No original-game record is fabricated to preserve a raw line.

## Appearance ownership

Current nullable cache getter `1459a29c0` is allowed to return no cache. Current
`1459a2280` preserves packed feature bytes when the cache or race/sex entry is
absent, otherwise clamps each byte to `count.saturating_sub(1)`.

The current Armory dispatch binds feature cycling to `1459a21a0` and Randomize to
`1459a2790`. Cycling first clamps all features, then applies signed Euclidean
wrapping to the selected byte with a count of at least 1. Randomize uses the same
count floor and five successive xorshift64 states, seeded by clock nanoseconds
XOR `0x9e3779b97f4a7c15`. Current `1401620f5..140162118` supplies wrapping u64
`seconds*1_000_000_000+nanos`, or 7 when the epoch duration is unavailable. The
existing source algorithms match these current instructions; their provenance
comments now point at the selected target rather than relying on old addresses.
The cache's complete backend/loading path remains a shared-engine boundary.

## Verification and limits

`python3 -B scripts/check-save-schema.py` executes the **complete original
parser and serializer** for 134 retained canonical cases, including all families,
unknown/malformed rows, numeric overflow/truncation, duplicate/empty records,
class ordering, legacy migration and every current companion key. It also runs
27 current optional-cache clamp cases. The retained
[fixtures](evidence/save-schema/fixtures.json) are the actual native text
results consumed by Rust source regressions.

`python3 -B scripts/check-menu-appearance.py` executes 675 current feature
cycles, 45 seeded randomizers and three clock-seed branches. Inputs include absent
cache, absent race/sex, zero counts, byte outliers, both signed directions and
zero/extreme seeds. The original arithmetic executes; cache/count lookup is an
explicit fixture.

The reusable import-safe `scripts/native_save_fixture.py` maps the verified
reference in memory and rejects control flow outside the curated native ranges.
It provides only allocation/free, byte operations, Rust whitespace trimming,
revalidated synthetic/starter metadata, tabard gate results and optional cache
lookup seams. Core number/string formatting and sorting run their actual native
instructions. No broad whole-text execution fallback remains. Unwindless leaf
ranges are explicit bounds, not claims of a complete EXE function census.

The instruction checkers require the Python `unicorn` package; the repository
uses project-local `runtime/tool-state/python/armory/python-libs` when available. They
read the configured reference EXE without launching it.

Rustfmt syntax parsing, manual source/type review and diff whitespace checks ran.
Rust regression tests were added or corrected but were **not compiled or run**.
No compiler, application build, game launch, real file operation or rendered
comparison ran. These finite instruction fixtures establish the stated contracts,
not complete native equivalence or gameplay parity. The broad shared engine and
complete-image decoding remain separately owned by #41. Actual startup/IO,
interactive menu behavior, cache residency and original/rebuilt gameplay and
presentation comparison still require authorized runtime validation.

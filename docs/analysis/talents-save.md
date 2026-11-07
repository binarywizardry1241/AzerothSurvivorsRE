# Talent definitions, allocation and Save

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the current talent catalog, allocation gates and Talent/spec Save
records under #17. Overall status belongs to [verification-needed](../verification-needed.md).
Gameplay application of talent effects remains separately owned by #12/#16.

## Definitions and allocation

The current nine-class, 27-tree index at `1472255f8` contains 355 definitions.
The [manifest](evidence/0.109.0/talents-menu/manifest.json) binds the definition
spans and 22 current native owners to original bytes, with canonical assembly,
REA/Ghidra provenance and pseudocode where useful. The source loads
`assets/talents-menu-0.109.0.json` directly. Historical gameplay effect catalogs
retain their actual provenance; this new asset describes menu/allocation fields.

All current names, icons, descriptions, rows, columns, maximum ranks and primary
requirements were revalidated. Alternative prerequisite, exclusive-choice and
milestone fields now come from the current records and current classifier rather
than talent-name exceptions. Legion Gate accepts either Soul Devourer or Soul
Link at maximum rank. The two flagged alternatives exclude one another; row-six
choices in one tree also exclude one another.

The current description formatter was executed for every rank. Eight displayed
values previously rounded to one decimal now preserve the native text: Improved
Consecration and Spiritual Attunement show 0.25/0.75; Soul Devourer shows 0.75;
Feral Aggression shows 0.15/0.45/0.75 at the relevant ranks. This changes displayed
values, not an invented gameplay effect implementation.

Points cost `80 + 15 × points already earned`, capped at 51. Normalization first
resolves/clamps requested keys, orders them by row, tree and column, then applies
individual learning gates. Gates enforce available points, maximum rank,
previous-row spending, fully ranked requirements and exclusions. Refund checks
remove one point, normalize with an unlimited budget, then compare totals, so a
refund cannot invalidate dependent allocations. These owners are shared by Save
and the page through `save/talents.rs`.

## Talent and spec records

The current full parser and serializer are retained once in the shared
[Save-core manifest](evidence/0.109.0/save-core/manifest.json). The
[typed schema](save-schema.md) calls
`talents::normalized_rows` for these two record families.

| Record or operation | Current contract and connected source |
| --- | --- |
| `talent` | Exactly four pipe fields. Class is u8 and XP is u32. Whole-line Unicode trim applies; numeric fields otherwise use strict Rust parsing. Unknown numeric classes retain their XP with an empty allocation. |
| Duplicate talents | Valid rows remain in encounter order. The first valid class row supplies live XP and allocation. Mutations update that first row in place. Later duplicate rows remain. |
| Allocation text | Split each CSV entry at its first colon, trim key/rank, parse a nonzero u8 rank and resolve it through the current catalog. Native row/tree/column order is preserved when serialized. |
| `spec` | At least three fields, class u8, selected slot u8 below three. Missing slots are empty; trailing fields are ignored. The last valid class record replaces the earlier one and moves to its encounter position. |
| Spec normalization | All talent rows are parsed before specs. Every stored slot uses XP from the first talent row for its class. Unknown classes retain empty normalized slots. |
| Selected slot | Reads the live talent allocation independently of the stored slot text. Import does not silently replace the live allocation with stored selected-slot content. |
| Switching | Selecting the current slot returns false. A real switch saves the outgoing live allocation, loads/normalizes the incoming slot, updates selected slot and mirrors the new live allocation. Legacy saves first acquire a spec record on an actual switch. |
| Allocation write | Normalizes the supplied allocation, updates the first live row and mirrors the selected stored slot when a spec record exists. Other duplicate talent rows and unrelated spec positions remain. |

The prior source collapsed talent duplicates, read the last row, discarded
unknown numeric classes and serialized allocations in lexical key order. Those
behaviors now follow the current native parser and mutation owners.

## Static verification and limits

`python3 -B scripts/check-talents-menu.py` verifies installed identity,
canonical extract/asset hashes and current data fields, then executes current
native instructions for 1,121 descriptions, 355 metadata/milestone records and
111 allocation/Save/spec cases: 72 normalization cases across all nine classes,
23 complete parse/serialize cases and 16 actual spec switches. The retained
[case fixtures](evidence/0.109.0/talents-menu/native-cases.json) contain native
results. Normalization includes empty through unlimited budgets and the large
native sorting path. Save fixtures include duplicate, unknown, malformed and
whitespace-bearing records, strict numeric parsing and incomplete spec slots.

The checker maps the verified reference PE in memory; the game process is not
launched. Rust numeric formatting, parsing, sorting and talent rules execute as
original instructions. Declared host seams supply allocation/free/reallocation,
C byte operations, C roundf and an explicit English localization fallback. The
whole verified text image is available to pure native callees; this is finite
contract verification, not a complete function census. `--prepare-rea` writes
project-local raw owner carriers and Ghidra plans for reproducing extraction.
The optional `--ui` also validates separately owned page constructors/source.

Rustfmt parsed the source without compilation. No Rust test, compiler, application
build, game launch or original/rebuilt gameplay comparison ran. These finite
native cases and source review do not establish a successful Rust build or
interactive/rendered parity. Localization resource lookup, actual saving and
page interaction require authorized runtime validation. Talent gameplay effects
and shared-engine recovery keep their separate gap ownership.

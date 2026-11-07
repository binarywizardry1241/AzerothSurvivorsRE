# Talent allocation and saved specifications

Target: installed 0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This report owns the current allocation and persistence contracts needed by
Demonology #12. Overall implementation status remains in
[verification-needed](../verification-needed.md); current Warlock definitions and descriptions
are owned by [Warlock talents](warlock-talents.md). Other classes keep
their independently stated definition/effect provenance.

## Current native contracts

The [manifest](evidence/talent-allocations/manifest.json) binds ten selected
Ghidra owners and seven shared replayed bodies to the installed bytes. The class
pointer index is `14723f158`; the Warlock descriptor is `14723e9d8`. Each tree has
64 bytes of descriptor data and 160-byte definitions. Key pointer/length are at
`+48/+56`; row, column, maximum rank and exclusive flag are at `+152..155`.
Historical 120-byte record offsets are not used by this recovery.

| Contract | Current owner and recovered behavior |
| --- | --- |
| Point budget | `1458d3210`: next point costs `80 + 15 × earned`, capped at 51. |
| Decode | `1459d6f70`: split CSV entries at the first colon, trim key/rank, parse a nonzero u8 rank, resolve current keys and clamp to the current maximum. |
| Collect and normalize | `1459cf2a0` / `14599fe20`: resolve requested definitions; order by row, tree, column; admit each requested point through budget, rank, row spending, requirements and exclusions. Missing keys refund their requested points without reducing XP. |
| Learn | `14599f980`: require an unspent point, rank below maximum, five earlier-row points per row, a fully ranked primary or alternative prerequisite where present, and no exclusive conflict. |
| Exclude | `14599f210`: row-six nodes in the same tree exclude each other; flagged choices exclude other flagged nodes on the same row of that tree. |
| Requirements | `1459924d0`: fully ranked primary or alternative is sufficient. Every current Warlock requirement resolves within the same tree, matching the source lookup boundary. |
| Refund | `14599f500`: remove one rank, normalize with an unlimited budget, compare totals; mutate the original allocation only when the remaining allocation is valid. Source `can_refund` plus the action's decrement implements these two steps. |
| Live allocation | `1458d4160`: use the first valid class talent row. The current full parser retains valid duplicate talent rows and their encounter order. |
| Stored slot read | `1458d2340`: the selected slot reads the live talent row independently of the stored selected-slot text; other slots read their stored allocations. |
| Switch | `1458d2770`: a real switch preserves outgoing live allocation, loads/normalizes the requested slot, updates active slot and mirrors the new live allocation. A same-slot selection makes no change. |
| Allocation write | `1458dda90`: normalize the live allocation and mirror it into the selected stored slot when that class has a spec record. |

The complete current parser `1458d45c0` and serializer `1458da250` are replayed
from the installed image. Current fixtures demonstrate strict class/XP/rank
parsing, duplicate and unknown numeric class handling, whitespace, removed keys,
all three stored slots and slot switching. Their bodies are hash-bound in the
manifest without duplicating the full Save extracts in this scope.

## Connected source

`save/talents.rs::Catalog::embedded` overlays the independently recovered current
Warlock class onto the retained other-class definitions. The same catalog serves
`Save::parse`/import normalization, all three stored specs, live reads/writes,
menu learn/refund/reset/spec actions, available points and the run-entry
allocation. Gameplay retains that normalized allocation for effect configuration
and the read-only in-run viewer. There is no separate old Warlock allocation
catalog on these source paths.

Stable saved keys `felfire_training` and `aftermath` preserve ranks under their
current Demonic Echoes and Scorched Earth definitions. Removed
`demonic_knowledge` is discarded, without adding Supremacy automatically or
changing XP. Current row spending, maximum ranks, alternative prerequisites and
exclusions still govern retained keys in both live and stored allocations.

The shared native fixtures additionally check Warrior stable keys `imp_heroic`
and `unbridled_wrath` at ranks zero through five and imported ranks 6/255, which
clamp to five. Unbridled Wrath fixtures include five earlier Fury points; it is
not admitted without its row-spending gate. These checks establish allocation
continuity only; Warrior effect reconstruction remains separately owned by #47.

## Static evidence and limits

`python3 -B scripts/check-talent-allocations.py` verifies current target,
body and canonical extract hashes, then replays:

- 173 normalization cases over all forty current Warlock definitions, including
  all-tree and single-tree ordering, empty through unlimited budgets, clamps and
  120 deterministic shuffled allocations.
- 640 independent learn/refund checks over a spread of normalized allocations,
  including the native refund mutation or unchanged result.
- 23 shared full Save parse/serialize cases and sixteen shared spec-switch cases
  using the retained historical fixture inputs/expected outputs against current
  native instructions. Those original fixtures keep their own provenance.
- 25 newly retained current Save/all-slot/switch fixtures: nine Warlock migration,
  exclusion, duplicate, low-budget and renamed-key cases, plus sixteen Warrior
  stable-key/rank cases. Each checks all three native slot readers.

The [current fixtures](evidence/talent-allocations/native-save-cases.json)
also feed `tests/talent_allocations_0_112.rs` for load, sealed import, all slot
reads, switching and reopen assertions. Those Rust tests were added but **not
run**. The changed allocation source and new regression file were syntax-parsed
with the existing pinned rustfmt, without compilation.

`python3 -B scripts/check-talent-migration.py` separately replays all 32
historical migration input strings through the current native Save parser,
normalizer, all three slot readers, serializer and reopen path. Its
[current expectations](evidence/talent-allocations/migration-cases.json)
feed `tests/talent_migration.rs`; the original 0.105.0 fixture remains unchanged
and is hash-bound as the input source. Current expected order follows row/tree/
column order. The three `preserved-keys` cases refund historical Bane ranks
because Bane now occupies row five and those allocations lack its earlier-row
spending; the current maximum is three. Their unspent totals are 26, 22 and 20.
The Rust regression's sealed-import assertions remain unrun; the checker
executes native plain Save contracts only.

`--prepare-rea` prepares exact project-local carriers and a reproducible plan for
`python3 -B scripts/rea-batch.py`; that runner uses `./scripts/rea` and Ghidra.
Raw carriers contain only the selected code, so their external data/callee/type
context is incomplete. Canonical original-byte assembly and whole-image native
instruction replay govern interpretation when decompiler types are incomplete.

The fixture maps the exact installed image for Unicorn and supplies explicit
host seams for allocator/free/realloc, C byte operations, roundf and an English
localization fallback. It does not execute the rebuilt Rust implementation or
start the game. Compilation, actual save-file I/O, menu input/rendering, live
run application and original/rebuilt parity remain unverified. Current Warlock
labels, effects and presentation retain their separately recorded checks and
limits; this allocation proof does not close their gameplay requirements.

# Installed target review — 0.113.2

Selected SHA-256: `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The 141,932,032-byte AMD64 PE identifies itself as 0.113.2 in matching embedded
updater/dialog markers. [Identity/resources](target-refresh-0.113.2.json),
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), [native census](native-census-0.113.2.md).

The configured installed EXE and Data are read-only inputs. All nine MPQ names,
sizes and complete SHA-256 hashes match 0.113.0. This establishes unchanged
archive bytes, not resource semantics, world-loading or rendered compatibility.
No intermediate 0.113.1 binary was supplied or analyzed; its release notes are
accounted against the selected 0.113.2 target without inventing its identity.

The complete [PE inventory](evidence/0.113.2/refresh-baseline/native-summary.json) covers every file byte,
six sections, 425 imports, 350,352 unwind records and 634,029 nonpadding
relocations. It finds 730 diagnostic paths: 59 custom and 671 engine/other.
`crates/wenilla-rogue/src/realmd.rs` is present again after its absence from the
0.113.0 literal inventory. Its existing `custom-game-realmd` system identity and
#9/#41 ownership are reused; literal reappearance does not prove an unchanged
authentication, roster or network contract. No path disappeared. The imported
library/function sets match 0.113.0 exactly; IAT addresses are newly observed.

[Diagnostic decoding](evidence/0.113.2/refresh-baseline/diagnostic-ownership.json) finds verified reference
leads for every custom path, including two `realmd.rs` references to one candidate
owner. These are not complete native/source contracts. The full embedded-candidate
inventory was compared with retained 0.113.0: all distinct binding identifiers,
Lua function declarations/UI registration terms, save-key and textual-ID leads
match. Module/type differences are changed concatenations around ScreensPlugin,
menu/hero-preview/touch/world-hold plugins, skybox and Discord strings. One packed
`SpellShapeshiftForm.dbcSpellShapeshiftFormSpellShapeshiftForm.dbc` candidate no
longer matches. These changes do not establish module/resource removal or
unchanged UI, IDs, configuration or behavior. PE resource content, code/data
relationships, computed targets and source ownership retain their native limits.
The [comparison record](evidence/0.113.2/discovery-delta.json) binds both full-file
inventories and retains the exact candidate/import changes.

The canonical 15,516-byte embedded addon Lua extract from 0.113.0 occurs exactly
in the current EXE at file offset `0x700e910`, SHA-256
`cc4bf0fc06b88830668bde8c605cf1a5cdb8251809a38539d888b1f80e559b86`.
The current identity manifest records this byte comparison without duplicating
the extract. Its packet producers, native dependencies and runtime are not
revalidated by script equality.

The supplied [release notes](../CHANGELOG.md) add lobby size/open-slot/list
scrolling obligations in 0.113.1 and co-op traffic batching/compression/latency
claims in 0.113.2. Each paragraph/bullet has an individual
[claim record](changelog-coverage-0.113.2.md). Claimed tenfold message and twofold
data reductions are supplied release statements, not measurements reproduced by
this analysis. The standalone chat/card input guard is local UI/input, independently of co-op.
Its current [input](evidence/0.113.2/card-keyboard/report.md) and
[delivery](evidence/0.113.2/card-delivery/report.md) contracts now have bounded
native/source proof; actual chat/VM scheduling and original/rebuilt parity remain
unverified.

**Co-op gameplay, networking and server logic are excluded.** Native co-op leads
remain discovery/accounting under #63/#41; this refresh implements no multiplayer
behavior. Co-op presentation-only work may be selected separately without
introducing hosting, joining, discovery, transport or cooperative simulation.
The historical [party API recovery](addon-party-api-0.113.0.md) keeps its 0.113.0
hash; it is not silently promoted to a current API or backend implementation.

The source mapping review resolves all 423 unique source references, including
historical script aliases, and finds all 138 named definitions. Existing local
startup, mechanics, input and client-delivery consumers remain present; the
four co-op backend systems remain absent/excluded. Current
[migration](legacy-config-0.113.2.md) and [UI-only co-op](coop-ui-0.113.2.md)
repairs supply bounded correspondences for 55 of the 59 custom diagnostic paths;
the UI adapter has no live session/discovery producer. Anchor definitions record
source navigation only, not native equivalence.

The [disjoint file ledger](evidence/0.113.2/refresh-baseline/file-range-summary.json) now assigns every
file byte exactly once across 26 intervals, with unknown semantic state separate
from structural PE classification. Exact header/data/alignment and Data-file
selectors feed the [B01–B05/R01 queue](unknown-recovery-0.113.2.md#whole-file-and-data-range-leads).
The unchanged-target audit reproduces the full inventory, diagnostic ownership
and exact unknown selectors. A [fresh complete all-seed Ghidra replay](coverage/execheck-replay.json)
independently verifies all 22,663,778 new instruction records and reproduces
canonical instruction/body/reference/helper/residual content. The existing
selection and residual counts remain unchanged; source semantics and gameplay
equivalence remain unverified.

Historical source/evidence retains its actual target. No previous RVA, layout,
ID or producer/consumer dependency is certified for this hash merely because a
label or archive matches. Current scans and the independently checked Ghidra
pass establish the bounds in the [native report](native-census-0.113.2.md).
No application compilation, compiling tests, game/network execution,
save/configuration operations or controlled original/rebuilt comparison ran.
#41 remains open for its recorded semantic, dependency and reference limits.

# AS dispatch context and retained source — 0.139.1

Target: installed `AzerothSurvivors.exe` 0.139.1, SHA-256 `1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`, 150,633,472 bytes.

The [machine review](evidence/0.139.1/switch-context-source-review.json) covers all **54 current AS-context tables**, already applied in the reviewed snapshot. It preserves exact context/table/guard selectors, source receipts and existing finding ownership. Forty-six have one predecessor AS geometry candidate, two Armory tables have ambiguous candidates within the same source family, and six have none. All 48 predecessor AS contexts have at least one geometry candidate. These are structural populations, not counts of behavior, new features, missing implementation or source completeness.

The [final selected census](coverage/full-image-selected-0.139.1.json), [switch publication](evidence/0.139.1/native-switch-proposal-review.json) and [computed frontier](evidence/0.139.1/computed-correspondence-frontier.json) now bind this review. The final finite guarded-table population has **3,924 applied and 3,924 proposed tables**, with zero added, changed or removed cases and zero undecoded targets in that proposal delta. All 54 AS contexts exactly match the reviewed source snapshot. Structural closure of this selected table frontier does not establish complete computed-edge coverage, semantics, source equivalence or parity.

## Cumulative source and stable questions

The [0.139.0 review](switch-context-source-review-0.139.0.md) and earlier classifications retain their actual target/hash. All 34 source receipts used by that review still match current files; actual menu, profile, gear, query, command, service, save, action and localization interfaces remain available. Source presence and equal guard geometry do not establish that a current compiled owner implements them.

All fourteen stable `retained-table-…` / `Q41-F01:correspondence:…` questions remain unchanged. Four have unique current geometry candidates:

| Stable question | Current candidate | Existing owner |
| --- | --- | --- |
| `retained-table-1403076a2` | `0x140368c05` | #17/#73 |
| `retained-table-145afbad2` | `0x145e2fa59` | #64/#65 |
| `retained-table-145afbb29` | `0x145e2fa81` | #64/#65 |
| `retained-table-145afbb66` | `0x145e2fabe` | #64/#65 |

The other ten remain pending correspondence. The thirteen current CreatureQuery-context tables retain #64/#65, including those initially unpaired in 0.139.0. Existing `coop_commands::template_entry`, opcode `0x60` dispatch, `creature_queries::{query_with,SPECIALS}`, `query_packets::decode`, the packet encoder and guardian catalog are the source seams. The historical prefix/row/reply classifications and #201 repair are retained. This review does not transfer their old owner address, opcode admission, complete response schema or recipient semantics to a current owner solely through geometry.

## Six contexts without predecessor geometry

These six tables have **declared-extent diagnostic context only** in the reviewed native export: `native_owner` is null. Independent PE boundaries and selected instruction bytes are recorded separately. None is assigned whole-function AS semantics or a new source defect.

### Font table-tag dispatch: #135

`AS-context-table:0x145df1ba5` uses table `0x1476977a0`, ten cells and five distinct destinations, within declared PE extent `0x145def740..0x145df21a8`, associated with `fonts.rs`.

Original instructions read byte `+1` through a stack-held pointer, subtract ASCII `d` (`0x64`) and admit unsigned indices 0–9. Selected branches compare following bytes with suffixes consistent with `dmx`, `ead`, `hea` and `mtx`. Current source `font_patch::augment` reads `head`, `hhea` and `hmtx`, and removes `hdmx` when rebuilding augmented font tables; `menu_fonts::read_font/register_framexml` supplies the patch/publication seam.

This is a precise font-table manipulation candidate, with first-byte/length admission, selected retention/removal/write operations and actual publication still pending. It supplies no CJK classification, IME or renderer conclusion. Generic map/allocation/font-library internals stop at the required patch interface.

### Ability status scaling: #136

Four tables share declared extent `0x145f1f1d0..0x145f23a0b`, associated with `game/abilities.rs`:

| Dispatch | Table | Cells / distinct destinations |
| --- | --- | --- |
| `0x145f20051` | `0x147a23218` | 11 / 9 |
| `0x145f2125b` | `0x147a23270` | 11 / 9 |
| `0x145f2259d` | `0x147a232f4` | 11 / 4 |
| `0x145f2284e` | `0x147a23320` | 11 / 9 |

Each subtracts one from a raw dword tag and admits indices 0–10. Selected branches copy or multiply adjacent float operands, construct tag/value/duration-shaped payloads, and include a `minss` ceiling whose independently read bits are `0x3f666666` (approximately 0.9). Input triplets at offsets `+0x68/+0x6c/+0x70`, multiplier fields and selected output stores are explicit byte observations.

The actual source seam is `StatusEffect`, `scaled_hit_effect` and the cast/direct/periodic consumers. Existing source scales selected tags and caps its tag 10 at 0.95; the observed current branch uses raw tag 11 with the 0.9 operand. **Tag identity and producer/consumer alignment must be recovered before calling that a source mismatch.** The four tables do not independently identify Enhancement, a new spell or a changed rule. Recover the typed definition/instance input, multiplier provenance and each selected hit/cast consumer under #136, retaining older source and proof.

### Runtime talent selector: #141

`AS-context-table:0x145f35e55` uses table `0x147a23628`, seven cells and five distinct destinations, within declared extent `0x145f35560..0x145f38c04`, associated with `game/talents.rs`.

The bounded input separates the low byte of `R14` from its upper byte and guards the low byte at six. Selected branches inspect stack bytes, including equality to 2 and a comparison against the saved upper byte; a common branch reads an indexed float behind `+0x70/+0x78`, while another path calls `0x145f2c590`.

Existing `EffectRow::matches_event/condition_matches`, `EffectRow::matches` and runtime `Event` provide the source-first selector seam. Recover the actual event/row producer, packed-byte meanings, indexed float gate and lookup consumer. This runtime question belongs to #141, separately from UI allocation #148 and Enhancement #305 until concrete data or edges connect them. Generic lookup/container internals are a stopped boundary.

## Every retained current context

All 54 records have exact finding-constituent selectors. The retained families remain:

| Source family / table count | Existing owner |
| --- | --- |
| Menu / 1; picker / 1 | #128; #77 |
| Inspection / 3; Armory / 6; Codex / 3 | #299; #123; #73 |
| Talent allocation / 1 | #148 |
| Route / 1; trust / 1; TCP / 1 | #151; #186; #152 |
| Gear / 3 | #92 |
| Shared commands / 2; party dispatch / 5 | #63/#154 |
| CreatureQuery / 13 | #64/#65 |
| Save / 2 | #146 |
| Hazard action / 1 | #149/#294 |
| Demons / 2 | #138/#24 |
| Service event / 1; localization / 1 | #197/#198; #142 |

The six additional contexts above add #135, four #136 constituents and #141. No new permanent finding is needed. Every actual producer/dependency/consumer question stays with its feature/module finding; #41 retains the global discovery frontier. Current inspection context `0x140268d98` geometrically corresponds to the old tooltip table, but the historical raw query omitted that table and its broader dependencies. Neither that navigation match nor the four separately revalidated local scopes establishes complete current inspection or any other table's semantics.

## Final receipt join and limits

The final join rechecked all 54 exact sites, table byte ranges/hashes, guard/domain/full successor vectors, current owner/context and applied flags. The ordered structural fingerprint remains `b11bae00bd3f66bdce25354302aa0d42f5ea73a0d537c1b654a876b641c5c0ee`. All 40 distinct current source receipts, including the 34 retained receipts, and all fourteen question identities/four candidate locations are unchanged. No affected record or source/semantic scope changed. Exact initial and final parent receipts remain available. Future receipt-only rebinding requires these same equality checks; changed AS sites, owner/context, bytes, vectors, source or question location require affected-record review, even when population counts match.

All 54 current table payloads and signed-relative vectors were independently checked against the installed PE, and complete guard-to-dispatch ranges were decoded with Capstone 5.0.7, including three-byte register jumps. The six new input/selected-case prefixes are bounded static observations. No native query, Program mutation, gameplay source change, compilation, client/game/network/server execution or original/rebuilt comparison was performed. Applied edges, source candidates, recovered semantics, implementation and parity remain separate evidence levels.

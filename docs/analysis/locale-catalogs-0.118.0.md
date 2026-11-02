# Cooperative translations and name consumers — 0.118.0

Selected EXE: **0.118.0**, 145,356,800 bytes, SHA-256
`4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
This is the static investigation of the supplied release's translation item
**#169**, with independent changed-description and name-consumer leads
**#170–#172**. [verification-needed](../verification-needed.md) owns their current status.
No source catalogs or gameplay were repaired by this audit.

## Current catalog data

The [descriptor review](evidence/0.118.0/locale-catalog-review.json) independently
finds fourteen JSON-prefix candidates and one contiguous fourteen-record table
at **`[0x1475d7340,0x1475d7650)`**, raw **`[0x75d5d40,0x75d6050)`**.
Its 784 bytes hash to
`78ebd12f280cadab9694ea70fa3f4371a574b0b03c34bb6e988c781f4b081eef`.
Each seven-u64 descriptor validates its language code, autonym and complete
JSON pointer/length pair. Order is en, pl, cs, de, pt, es, fr, ro, tr, ru, uk,
zh, ja, ko. The trailing word remains uninterpreted, including its correlation
with zh/ja/ko. No historical RVA or key-count assumption selects the records.

All fourteen native catalogs contain the same **2,979 keys**, totaling **41,706
values**. Every full descriptor-bounded payload includes one trailing LF. Their
exact ranges, lengths and hashes are in the descriptor review; no duplicate full
payloads were extracted into the repository.

The [cooperative delta](evidence/0.118.0/coop-locale-additions.json) preserves only
missing source key/value pairs, source receipts and finite feature membership.

| Population | Current native | Inspected source | Difference |
| --- | ---: | ---: | --- |
| English | 2,979 keys | 2,979 keys | Eight description keys replaced; no changed values among the 2,971 shared keys |
| Each of the thirteen other languages | 2,979 keys | 2,929 keys | Fifty missing keys per language; all 2,929 existing values unchanged |
| All languages | 41,706 values | 41,056 values | 650 missing translated values; eight English key replacements remain separate |

The thirteen source catalogs are Polish, Czech, German, Portuguese, Spanish,
French, Romanian, Turkish, Russian, Ukrainian, Chinese, Japanese and Korean.
All fifty cooperative keys have a nonempty current value in every language.
The finite key population consists of fourteen achievement names, fourteen
descriptions, seven cosmetic ID names, one tabard ID name, four companion names,
United Front, and nine White Devilsaur name/prose/switch/control entries.

This establishes payload availability, not translation quality. Eight of the
650 non-English values equal English: German retains Mr. Bigglesworth;
Romanian retains Mini Herod, Mini Nefarian and Mr. Bigglesworth; Turkish retains
those three names and `tabard.90025` → Contest Winner's Tabard. The proof lists
these exact keys. Proper-name identity alone is not a demonstrated defect, and
the unchanged Turkish tabard label remains visible evidence against a stronger
claim that every value differs from English.

## Changed description keys

English removes eight old descriptor-as-key strings and adds eight replacements.
Seven explicitly require at least one other player: Better Together, Against
All Odds, Things That Go Bump in the Night, For the Team, Dragonslayers, The Old
Gods Have No Friends, and Together, To the End. The last also names all twelve
zones. Actual party predicates and event-time eligibility belong to the separate
release-contract investigation; text alone does not prove them.

The eighth is an independently actionable textual lead **#170**: Hakkar Smoothie
now reads “Defeat Hakkar with 5 Warriors, all talented into Bladestorm. Whirlwind
must deliver the killing blow.” Its previous string included “in co-op” after
Hakkar. This data observation does not establish any changed combat condition.
The [current constructor recovery](release-contracts-0.118.0.md#native-ownership-and-bounded-module-contracts)
separately binds the title/description calls at `145b3e61d..145b3e6b3` and the
101-byte text at `1475d81f1` to an actual `achievements.rs` Location owner.
The next static step is to revalidate its five-Warrior/lethal-spell predicate
and update the source description key; no new Hakkar gameplay rule is inferred.

`assets/coop-achievements-0.117.0.json`, actually included by
`progression.rs::Catalog::embedded`, still supplies all eight removed keys.
`Achievement::label` uses those literal descriptions as lookup keys. Importing
the new translated catalogs alone would therefore leave these eight descriptions
using stale source strings. The delta proof identifies every affected `coop:`
achievement key; seven belong to the friend-requirement item and Hakkar retains
its independent finding.

## Actual source connections

`localization.rs::CATALOGS` includes all fourteen source files.
`localization/catalogs.rs::load_from` parses the embedded maps and applies the
executable-directory then save-directory overrides. The inspected source
`Localization::lookup` tries the selected map, then English; `menu_catalog`
starts with English labels and overlays the selected map. `MenuCatalog::label`
returns the resulting value or the supplied key.

The source feature consumers exist: achievement names/descriptions use
`Achievement::label`; companion/perk Rewards controls use literal catalog names;
`armory.rs::cosmetic_name` uses `cosmetic.{id}` with the descriptor fallback;
`talents.rs::white_devilsaur_details` uses the recovered switch/prose keys;
`gameplay/client/inventory.rs::tabard_name` uses `tabard.{id}` and a direct
descriptor fallback. Restoring data is therefore a concrete source-data repair,
but does not certify the current native lookup/index/parser/override behavior.

The public benilla revision/provenance is retained in
[`benilla-vendor.json`](benilla-vendor.json). These are AS catalog/name boundaries;
no generic engine parser, renderer or text-widget reconstruction is needed to
state the following consumer findings.

## Independent name-consumer findings

The [current native interface proof](evidence/0.118.0/localization-consumers/contracts.json)
retains four disjoint code spans totaling 3,614 bytes, two format records,
independently decoded assembly, exact call edges and four completed journaled
Ghidra queries. Preferred PE addresses are not observed live-memory calls.

**#171 — Rewards tabard name lookup.** Native helper
`145aab420..145aab4b7` builds `tabard.{id}` from the descriptor's u32 at +0x30,
calls the current name-lookup boundary `145b29a00`, and returns its non-null
pointer/length pair or the descriptor's original name. The exact format record
is at `1472c86c0`. UI-card owner `140347000..14034762d` calls this helper at
`140347303`, copies the returned name and places it in the text bundle before
the shared widget boundary. Current source
`progression/rewards.rs::tabards` instead calls `labels.label(&tabard.name)`.
The native maps contain `tabard.90025` and no literal Contest Winner's Tabard key,
so this source route cannot select that ID-key translation. This is distinct
from #161's already repaired inventory/template consumer. The next static step
is to finish the top-level Rewards callback binding, then connect this exact
ID-key/fallback interface to the actual row, preserving empty and key-equal
translations. Whole-screen admission and native lookup semantics remain open.

**#172 — Achievement unlock appearance names.** Current iterator
`145c3e370..145c3e87e` filters reward rows by the incoming achievement key and
produces prefix/name/icon pairs. Its tabard branch builds the ID key at
`145c3e614`; its cosmetic branch does so at `145c3e6ff`, using format records
`1472c86c0` and `1472c86ca`. Both call the name-lookup boundary, retaining the
descriptor fallback when absent. Collector `145c2a4e0..145c2a72c` consumes these
48-byte rows; its verified caller is `145b44540..145b4471f` at `145b44704`.
Source `progression.rs`'s achievement-detail unlock loop uses
`labels.label(&unlock.name)` on literal English names. Seven cosmetic names and
the tabard name have ID keys, with no literal-name key in any current native
catalog. The delta proof records all eight exact achievement/name/key joins.
Next recover the remaining `145b44540` producer and top-level achievement-page
binding, then connect the recovered typed ID/name construction to these rows.
This is a separate consumer from the Rewards tabard row and inventory tooltip.

The raw imports omit PE globals/imports and infer a GCC ABI. Independent PE
instructions establish the Windows-x64 argument/data flow used above; unresolved
global registry producers, top-level screen assignment and indirect/callback
closure remain explicit. One attempted secondary cosmetic-helper query had no
Ghidra function in the multi-function raw import. It was not retried unchanged;
the completed independent iterator query supplies the cosmetic branch proof.

## Replay and validation limits

```sh
python3 -B scripts/review-current-locale-catalogs.py
python3 -B scripts/review-coop-locale-additions.py
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/review-coop-locale-additions.py --check-consumers
```

The first two replay the exact selected-target descriptor/source and cooperative
delta snapshots. `--check-consumers` uses the existing Capstone 5.0.7 installation
to decode every retained instruction, compare assembly and byte hashes, verify
source receipts and check retained plan/journal/result hashes. It does not run
native instructions. The data review's `--check-source` currently fails because
the source payloads differ; that expected discrepancy is the finding, not a
reason to replace evidence or modify source during this audit.

These checks pass within their stated bounds. The catalog table/payload is a
bounded current data contract; the recovered name paths are bounded interfaces.
Neither establishes whole-module completeness, linguistic correctness, successful
glyph/layout/input behavior, native loader/fallback equivalence or original
versus rebuilt parity. No compilation, compiling tests, native emulation,
application/client/network/server execution, save/configuration mutation or
controlled comparison occurred.

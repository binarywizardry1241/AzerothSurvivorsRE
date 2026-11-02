# Locale catalog data and source fallback — 0.117.0

The selected EXE is SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`,
145,283,072 bytes. The source English catalog now includes the **50 recovered
additions**, with every prior 2,929 value unchanged. All fourteen source files
match their complete native payload bytes exactly: English has 2,979 keys and
each other catalog has 2,929. This completes the source-data repair for **#158**;
the corresponding features retain their separate findings **#114–#120**.
[verification-needed](../verification-needed.md) owns their current implementation status.

## Current data identity

The original [compact proof](evidence/0.117.0/locale-catalog-review.json) records all
fourteen code/autonym/record/payload ranges and hashes, the exact source-input
hashes, byte comparisons, and the fifty English key/value additions. It retains
no duplicate complete locale payloads. Its source receipts describe the original
pre-repair snapshot; the exact fifty-key delta remains preserved there. The
read-only `--check-source` replay derives current native/source comparisons
without replacing that historical snapshot or erasing the recovered delta.

The entire selected image contains fourteen JSON-prefix candidates beginning
with `game.title`. Their current payload pointers independently locate one
contiguous sequence of fourteen 56-byte records at
`[0x1475c5ce8, 0x1475c5ff8)`, file offsets `[0x75c46e8, 0x75c49f8)`;
the 784-byte table SHA-256 is
`5147ec2ba1669fc0083028bcd06bab732af30c4694ce614bb77c4c149ce81a29`.
Each seven-u64 record has validated code, autonym and JSON pointer/length pairs,
in the source's existing order: en, pl, cs, de, pt, es, fr, ro, tr, ru, uk, zh,
ja, ko. The trailing word remains uninterpreted: it is one for zh/ja/ko and zero
otherwise. This data comparison does not recover the current enumeration/index
consumer or infer a semantic field name from that correlation.

The English payload is `[0x1472dd3ce, 0x14730d743)`, file offset `0x72dbdce`,
197,493 bytes, SHA-256
`73e069c10d1b9c5ecb11ee73866911c83602dae10e13f1a1c58db46476c9c441`.
All fourteen native descriptors include one final LF beyond the parsed JSON
object. The proof distinguishes parsed key/value equality, exact full-payload
byte equality and CRLF-to-LF-normalized equality. The thirteen non-English
source files pass **all three**. Before repair, English lacked the fifty entries
and had SHA-256 `17eabaf3dc46401fccdbc0645feda040393a659a66ddda264f09c6902244e5d8`.
Its restored source bytes now match the native SHA-256 above.

| Population | Native | Source | Comparison |
| --- | ---: | ---: | --- |
| English keys/values | 2,979 | 2,979 | Full payload byte match; 50 additions restored |
| Each other catalog's keys/values | 2,929 | 2,929 | Every full payload byte matches |
| All fourteen values | 41,056 | 41,056 | Every full payload byte matches |

The [0.115.0 report](menu-options-0.115.0.md) owns the previous language-index,
Options and AddOns contracts. Its RVAs, native leaf checks and fallback/loader
claims were not reused as current behavior proof.

## Every added key belongs to a release feature family

The proof's `English_added_key_values` array records every exact key and value,
its label family and related release finding; no key is unassigned. Grouping
text by feature does not recover a predicate or prove a particular native widget
calls that key.

| Finding/family | Keys | Exact membership |
| --- | ---: | --- |
| #114 achievement names | 14 | Better Together; Five of a Kind; Rest in Photosynthesis; Against All Odds; The Brotherhood Falls; Things That Go Bump in the Night; For the Team; Jurassic Pack; Hakkar Smoothie; Holy Frame Drops; Dragonslayers; Totem'ly Balanced; The Old Gods Have No Friends; Together, To the End |
| #114 achievement descriptions | 14 | One exact description for each of the fourteen names above; all are retained in the proof and agree with the current [release descriptor strings](release-review-0.117.0.md) |
| #116 cosmetic names | 7 | `cosmetic.90108` through `cosmetic.90114` |
| #116 tabard name | 1 | `tabard.90025` → Contest Winner's Tabard |
| #117 companion names | 4 | Ancient Protector; Mini Herod; Mini Nefarian; Mr. Bigglesworth |
| #118 perk name | 1 | United Front |
| #119 hunter switch/name/prose | 9 | White Devilsaur; its complete wolf/raptor replacement description; Off; On; Off · no talent point; On · no talent point; Turn off; Turn on; Requires the achievement {name} |

There is no separate added catalog key for #115's `coopbeat|` save field or
#120's `armory-looks` retained viewport identity. Their save and widget contracts
remain separate from localized labels. This complete catalog delta exposes no
additional unassigned behavior/key family beyond these feature families and
the source data mismatch under #158.

## Actual source connections and limits

[`localization.rs`](../../crates/azeroth-survivors-re/src/localization.rs)
includes all fourteen source JSON files in `CATALOGS`.
[`catalogs::load`](../../crates/azeroth-survivors-re/src/localization/catalogs.rs)
parses each embedded catalog and applies executable-directory then save-directory
overrides. Its native loader/parser proof remains historical. In the inspected
source, `Localization::lookup` tries the selected map then English;
`Localization::label` falls back to the supplied key. `menu_catalog` starts with
English labels and overlays the selected catalog. The resulting
[`MenuCatalog::label`](../../crates/azeroth-survivors-re/src/catalog.rs)
returns that map's value or the supplied key. The restored English entries are
therefore available through the existing source fallback path in every selected
language. No translations or lookup/loader semantics were invented or changed.

Source feature connections remain explicit:

- **#114:** `progression.rs::Achievement::label` translates achievement names,
  descriptions and token values through `MenuCatalog::label`. The fourteen
  new achievement definitions/category and award route are still missing under
  their owning findings; adding labels alone does not connect them.
- **#116:** `armory.rs::cosmetic_name` constructs `cosmetic.{id}` and uses the
  independent descriptor name as its fallback. `progression/rewards.rs` displays
  a tabard descriptor's name through `labels.label`; the new tabard definition
  and the selected target's ID-key translation consumer require separate repair.
- **#117–#118:** Rewards renders companion and perk descriptor names through
  `labels.label`. New descriptors/grants/live effects remain independently open.
- **#119:** `talents.rs` translates ordinary names/descriptions through the
  menu catalog. The special free-point switch and its gate/control consumers
  are not present, and the nine new labels do not supply that behavior.

Forty-two of the fifty restored English values equal their literal keys; the other eight
are the seven cosmetic IDs and one tabard ID. Some source consumers also carry
descriptor-name fallbacks. The source data mismatch therefore does not prove
that every missing key produces incorrect visible English text.

The **#158 source-data repair is complete**: the entire restored English payload
matches the selected EXE, and all fourteen payloads match source. Feature-specific
definitions/mechanics remain with #114–#119. Current native lookup/fallback
consumer recovery, index bounds, external
override files/parser behavior, rendered fallback/glyph/layout and original versus
rebuilt parity remain unverified under #17/#41; restoring catalog data does not
establish those broader contracts or the feature widgets' runtime behavior.

`python3 -B scripts/review-current-locale-catalogs.py --check-source` verifies
current complete source/native payload equality without changing the original
audit evidence. The original default replay and `--write` compare/publish the
source-hash-bound audit snapshot; use `--check-source` after source repairs to
preserve its historical delta. The checker uses the existing PE
format reader and retained JSON-prefix/seven-u64 locale recovery format, deriving
all current pointer/range/length/hash data anew. The repair copied only the
descriptor-bounded English payload after verifying the target, full payload hash,
all 2,929 prior values and the exact retained fifty-key delta. No native query,
emulation, compilation, game/server launch or parity comparison occurred. No
bulk extraction or scratch output was retained.

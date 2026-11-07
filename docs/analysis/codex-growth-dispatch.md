# Codex jewelry growth selector

This resolves the original semantic question
`Q41-F01:correspondence:retained-table-1403076a2` under **#41/#17/#73**.
The selected table is the existing jewelry growth-ceiling formatter in Codex
Details. No additional source omission is identified. This classification
does not close the whole Codex, native-discovery or rendering findings.

The selected installed EXE is **0.120.2**, SHA-256
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
The [proof](evidence/0.120.2/codex-growth-dispatch/manifest.json) binds the
original query results, six exact native ranges, native input data and live
source. Historical recovery retains its actual targets: the
[0.109.0 Codex report](codex.md),
[0.119.0 computed frontier](computed-source-frontier.md) and
[0.119.1 table assessment](evidence/0.119.1/native-switch-proposals.json).

## Producer, selector and consumer

Current Details owner `1402de9e0..1402e1e25` admits the selected jewelry index
against the slice length at `1402e0229`. It multiplies the index by **72**,
adds the actual row pointer and saves that pointer at stack `+0x670`.
The initial global `148534660` points to slice `1472c7218`, whose data is
`1472bfb30` with **23 rows**. Exact key/base/type/slot observations match the
existing `loot_rewards/catalog_01120.rs`, including its already documented
stable-source/native tag conversion for Mystaria. This is an initial-data and
bounded-reader contract; arbitrary writers or mutable aliases are not inferred.

After the five rarity rows, the outer growth selector reads the same row's byte
**+0x44**. Its kind-9 cell reaches `1402e1ac8`, the Hand of Justice wording
branch. The selected inner dispatch `1402e1b12`, table `1461c32f0`, reads this
same field again. Its twenty guarded cells have five destinations and implement
the already recovered jewelry ceiling policy:

| Native kind | Value sent to the jewelry description formatter |
| --- | --- |
| 0–6, 8 | Positive infinity |
| 7, 15, 18 | Base at row +0x40 multiplied by 3 |
| 9 | Exact f32 0.6, independently of base |
| 19 | Base multiplied by 4 |
| Other byte values | Base multiplied by 5 |

These are the conditional inner mapper's results, not a claim that every byte
kind can reach this outer Hand of Justice branch. The admitted native row at
index 12 has key `hoj`, kind 9 and base f32 `0x3d75c28f`. Its actual inner cell
therefore supplies **0.6** to jewelry-description helper `145a9ec50` at
`1402e1c0a`. The result becomes the `{ceiling}` value in the exact 73-byte
localized template beginning at `1461c17d3`. The output is then supplied to the
existing text submission, with the explicit **12px** store at `1402e1d48`.

The formerly unmapped call at `1402e1adb` reaches `145b4ef60`. Original
instructions preserve the input pointer/length, call the optional lookup at
`145b4f010`, and return the original pair only when the lookup returns a zero
pointer. A successful empty translation retains its nonzero pointer and zero
length. The complete locale-map/TLS implementation remains a separate contract;
the moved call does not introduce another Codex action or payload type.

## Existing source and checks

`CodexCatalog::embedded` already retains the native-derived catalog and inserts
the existing Mystaria delta after Soulstone. `CodexText::embedded` overlays the
localized records and `detail` supplies `entry_text.growth` through the live
12px muted label. Its English `hoj` text is already:

> Picked again, it grows by nearly the pick's whole worth, up to 60% chance for a spell to cast twice.

The [original Codex recovery](codex.md) exercised the native growth
branch across every then-current jewelry record and fourteen languages. That
implementation knowledge is retained. This selected follow-up classifies the
previously unexplained current field/table/call; it does not repeat the whole
catalog recovery or certify every current localized string.

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs \
  python3 -B scripts/check-codex-growth-dispatch.py
```

The check passes **1,536 original-instruction inner-selector cases** across all
256 byte values and six base values, plus **eight original-instruction lookup
wrapper cases**. It verifies 156 exact decoded instructions in six ranges,
both guarded-table/input relationships, all 23 actual row fields, two durable
Ghidra result receipts and the live source/data connections. The wrapper result
reuses a compatible saved current-target query; the Details query extends the
shared Program. No separate native database was created.

The selector harness stops before the jewelry-description formatter; the
wrapper harness substitutes only its optional lookup result. Neither executes
Rust, the full locale map/formatters, ECS/widgets or a game. Compiler-decompiled
types are not treated as native source types. Compilation, actual input/UI/font
and rendering behavior and original/rebuilt parity remain unverified.

## Current outer selector classification — 0.127.0

The additional current selector `AS-context-table:0x140352e9a` is the
existing **growth text-family selector**, rather than another Codex action.
Its [bounded proof](evidence/0.127.0/codex-growth-dispatch/manifest.json)
binds installed 0.127.0 SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`,
the raw-owner Ghidra query, exact original instruction/data ranges and the
live source. No missing source behavior is identified in this selected scope.
This classification does not revalidate the whole Codex or reopen the fourteen
already classified historical Codex/CreatureQuery table questions.

At `140351c5e..140351c84`, the Details owner loads the actual jewelry slice
through global `14865e628`, checks the selected index against its length and
forms a **72-byte** row. Its initial descriptor is `1470505d0`, data
`14704e5b0`, length **23**. All current keys, base f32 bits and slot fields
match `loot_rewards/catalog_01120.rs`, including its documented stable tag
conversion. The row's byte **+0x44** selects the outer table after the five
rarity descriptions. Its seventeen guarded cells have six destinations:

| Native kind | Growth text family |
| --- | --- |
| 0, 1, 3, 4, 8 | Each repeat grows by nearly the pick's whole worth. |
| 2, 6 | Max health continues growing more slowly around a formatted ceiling. |
| 5 | Separate damage-reduction cap and max-health soft ceiling. |
| 7, 10–15; default for 17–255 | Growth toward the formatted finite ceiling. |
| 9 | Hand of Justice's repeat wording with its formatted ceiling. |
| 16 | Soulstone life refill and maximum-life wording. |

Both inner twenty-cell ceiling tables are retained exactly in the current
proof. These entries are conditional destinations; their presence does not
admit arbitrary kinds to a specific outer branch. The shared result reaches
the text submission through `1403536dc..140353815`, including the explicit
**12px** store. Existing `CodexText::embedded` locale overlays and
`detail`'s `entry_text.growth` consumer already supply these families.

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs \
  python3 -B scripts/check-codex-growth-dispatch.py \
  --proof docs/analysis/evidence/0.127.0/codex-growth-dispatch/manifest.json
```

The non-compiling check validates **291 instructions in ten exact ranges**,
all 23 input rows, three table byte sets, six native templates/source examples
and one completed query using the shared raw-subject/PE-mapping validator.
It replays all **256 outer-selector byte inputs** against the original
instructions, stopping at the selected branch entry. This is bounded static
instruction replay, not application execution.

The raw Ghidra subject omits external tables, strings and callees. Its
decompiler reports unsettled type propagation and unresolved computed jumps;
the independent instruction/table checks supply only the finite classification
above. The full localization/formatter/widget lifecycle, arbitrary mutable
aliases, compilation, gameplay/rendering and original/rebuilt parity remain
separate. Current source/recovery status remains in
[CURRENT-STATE](../CURRENT-STATE.md#gap-41).

## Admitted growth ceilings in 0.141.0

The [current proof](evidence/0.141.0/codex-growth-ceiling.json) binds
`Q41-F01:correspondence:retained-table-1403076a2` to installed EXE SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The Details owner at `0x140371ee0` loads the jewelry slice through
`0x148ac2ba8`. At `0x14037371e` it checks the selected index against
the length of 23 and stores the selected 72-byte row at frame `+0x660`.
The growth dispatcher reads the row's byte `+0x44` after five rarity rows.

| Admitted row | Native growth path | Live source |
| --- | --- | --- |
| Hand of Justice, kind 9 | The outer case enters the repeat template at `0x140374f8b`. Inner table `0x1465cb928` selects literal f32 0.6 at `0x14037528d` and supplies it to the jewelry formatter at `0x1403750cd`. | `CodexText::embedded` supplies the recovered 60% growth sentence to the Details label. |
| Seal of the Damned, kind 19 | The outer default reaches the finite-growth branch at `0x140374ee3`. Its separate inner table `0x1465cb978` selects ten times row `+0x40`, supplying f32 1.0 to the formatter at `0x140375046`. | `codex.rs::detail` renders the shared `JewelryDefinition::value_cap` through the live description and localized growth template. The historical English 40% value is bypassed by this branch. |

Both paths substitute the `ceiling` value and join the Details text
submission. The 12px store remains at `0x140375212`. The kind-19 cell in
the Hand of Justice table also has the multiplier 10, but the actual Seal
row enters the separate finite-growth family. This preserves the historical
0.120.2 multiplier 4 as an observation of that build. The Seal's previously
recovered reward and actor-targeted DoT policy remains under
[#308](../verification-needed.md#gap-308).

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs \
  python3 -B scripts/check-codex-growth-dispatch.py \
  --proof docs/analysis/evidence/0.141.0/codex-growth-ceiling.json
```

The check verifies one saved Ghidra pseudocode query and replays the original
indexed row producer, outer selection and inner ceiling calculation for
these two actual rows. The replay resumes after the template lookup and
stops at the formatter call. It binds the English templates and reviewed
source bytes. The bounded result leaves the broader Codex source contracts,
full locale and UI behavior, and original/rebuilt comparisons open.

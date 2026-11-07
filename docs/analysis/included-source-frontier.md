# Included source containers

Permanent **#41**, leads **Q41-B02/I01**. Selected EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [compact reconciliation](evidence/0.121.0/included-source-frontier.json)
joins the complete current [data-classification population](evidence/0.121.0/data-classification/manifest.json)
to actual AS-source `include_str!` inputs. It preserves that classifier's original
decisions and source receipts. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current
implementation status; [the historical container review](q41-embedded-containers.md)
retains its 0.115.0 evidence.

## Complete source-container boundary

The checker verifies every one of **2,144 candidate rows** against the selected
EXE's exact offsets, lengths, bytes, hashes and preferred addresses. It scans all
**316 AS Rust source files** and accounts for all **236 `include_str!` directives**,
including the existing literal and `concat!(env!(...))` forms. An unsupported
form, missing input or path outside the checkout fails the scan rather than
silently disappearing.

Eight Lua/XML inputs supply source containers: stored-level bindings, the addon
API, native stats parser, character-pane patch, raid popup, WorldState patch,
death popup and level-cap patch. Exact including-source and payload hashes,
lossless selector groups and complete decision/directive stream digests are
retained in the proof; candidate text and whole per-row inventories are reused
from their existing canonical inputs.

| Input-classifier population | Complete current source-container result |
| --- | ---: |
| Rows labelled `embedded_lead_schema_or_consumer_unresolved` | 283 |
| Those rows occurring in included Lua/XML | 173 |
| Included binding identifiers / Lua declarations | 146 / 27 |
| Those rows without an included Lua/XML occurrence | 110 |
| Remaining resource-path / generic Lua-diagnostic rows | 109 / 1 |

Thus the 173 binding/declaration rows are substrings of real included payloads,
not 173 demonstrated absent interfaces. This continues the earlier source
classification; it does not newly recover every callback or change its native
schema status. The additional level-cap payload preserves the separate #181
source repair. The one generic unmatched Lua declaration is `function argument(`.

The 109 resource rows include existing AS core-file contracts, shared loaders,
artwork and packed regex fragments. Existing StaticPopup/GlueStrings and resource
repairs retain their own findings and native provenance. All four resource
literals added since 0.120.5 already have separate [source-first dispositions](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.121.0.md#candidate-changes-beyond-diagnostic-filenames).
This join establishes no additional AS source omission or replacement resource.
The named Orb-model input limitation remains independently owned by #248.

## Reproduction and limits

```sh
python3 -B scripts/check-q41-included-frontier.py
```

Default operation is read-only. `--write` publishes the reviewed compact proof
after an intentional source-boundary change. Existing selector, byte and domain
guards still apply; changed input populations require inspection.

Inclusion is a lexical source boundary, not macro expansion, callback execution,
native schema/ID recovery, lifetime or producer/consumer closure. Mixed B02
constant/mutable data and dynamic aliases remain outside this proof. Further
recovery needs the concrete AS producer, exact data range and consumer contract
whose meaning is still missing; generic `.rdata` completeness and pending
newest-target applicability do not imply missing AS implementations.

No native query, compilation, compiling test, application/game/server operation
or original/rebuilt comparison occurred. Source execution and parity remain
unverified.

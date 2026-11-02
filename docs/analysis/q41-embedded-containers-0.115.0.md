# Included script containers and the I01 frontier — 0.115.0

This is the complete **Q41-B02/I01** population follow-through for permanent
**#41**, target SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [original classification](native-data-classification-0.115.0.md) owns the
retained per-row inventory, structural observations and reference counts.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current overall status.

Run `python3 -B scripts/check-q41-embedded-containers.py` to replay the
[compact proof](evidence/0.115.0/q41-embedded-containers.json). The default is
read-only; `--write` refreshes that proof after intentional changes. It reads
the configured installed EXE in place, verifies all **2,110** literal rows
against their exact native offsets, lengths, bytes and hashes, and checks their
unique category/ordinal selectors. It also verifies the full bytes of all
**13 B02 ranges / 42,795,556 bytes** against the owning classification. That
classification accounts for **634,018 DIR64 sites**; this follow-through does
not infer new relocation or mixed-data schemas.

The script enumerates every current AS Rust source file and accounts for every
`include_str!` invocation in the observed literal and `concat!(env!(...))`
forms. Unsupported forms fail rather than disappearing from the scan. It
resolves all Lua/XML includes, records each including source and payload hash,
then computes every literal/container intersection. The seven current payloads
are the stored level-bindings XML, generated addon API, stats parser,
character-pane Lua, complete WorldState patch, raid popup and death popup.
Canonical historical files retain their actual provenance; this inclusion
scan does not promote all their contents to current native behavioral proof.

| Complete population | Rows |
| --- | ---: |
| I01 input: namespace / binding / Lua-UI / resource / Lua declaration / config / textual ID | 922 / 352 / 336 / 306 / 187 / 5 / 2 |
| Any occurrence in one or more included Lua/XML payloads | 709 |
| Original classifier's unresolved rows | 281 |
| Original unresolved rows with an included occurrence | 173 |
| Original unresolved rows without an included occurrence | 108 |
| Separate recovered AS core contracts among those 108 | 2 |
| Remainder without either of these specific connections | 106 |

The 709 intersection consists of 307 original source-literal candidates, 228
original addon-API-container rows, 173 original unresolved rows and one original
engine-context row. The 173 are **all 146** unmatched binding identifiers and
**27 of 28** unmatched Lua declarations. They are substrings of included
payloads, rather than 173 independently recovered interfaces. Lossless compact
selector ranges in the proof retain every container's membership; an exact
2,110-row decision-stream hash commits the full replay, including nonmatches.

The remaining 108 comprise 107 resource paths and Lua declaration
`Q41-I01:lua_function_declaration:107`, the generic diagnostic substring
`function argument(`. Two resource paths now have separately recovered and
implemented AS core-file contracts:

- `Q41-I01:resource_path:211`: [#106 StaticPopup](q41-data-contracts-0.115.0.md#graveyard-release-popup--106).
- `Q41-I01:resource_path:208`: [#107 GlueStrings](q41-glue-strings-0.115.0.md).

Their target-bound proofs remain separate inputs. Admission requires the exact
selector and schema, complete selected populations, current project/source/query
receipt hashes and native owner/site bytes; a matching target with an empty
proof is rejected. The configured supplying archive is rehashed in place. The [#105 complete
WorldState repair](q41-data-contracts-0.115.0.md#complete-worldstateframe-behavior--105)
came from the included-container review. These three demonstrated omissions
have source repairs; this fact does not close every literal in those scripts.

The resulting **106-row remainder** is **105 resource paths plus one generic
Lua diagnostic**. The proof retains every selector. The resource set includes
existing AS paths, generic engine/data paths and artwork. This work does not
claim that each resource's native consumer has been traced or that all 105 are
engine-owned. Proof-only historical-to-current revalidation such as #103/#104
is excluded from new source work. No further demonstrated source omission was
established by this complete selected review.

This is a source-container and remaining-frontier classification. Literal
occurrence does not establish callbacks, inputs, schema, mutation, lifecycle,
alias/type closure, or a complete native producer/consumer chain. B02 mixed
schemas and unknown AS consumers remain open. No compilation, real Rust/core
loader execution, game/network run, rendering or original/rebuilt parity check
is claimed.

# Release review — 0.119.0

The selected installed EXE is 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
The three nonempty supplied entries in [the changelog](../CHANGELOG.md#01190)
have individual permanent findings **#175–#177**. The separate icon/application
consumer omission is **#178**. Native recovery, source correspondence, source
repair, static checks, runtime and parity are separate evidence levels.

| Finding / item | Current native and actual source | Next static step |
| --- | --- | --- |
| #175 Druid summary | Independent source/static repairs are connected under #176/#177/#178. | Retain their separate runtime/parity limits; the summary is not another executable contract. |
| #176 Tranquility Nature criticals; no other effects | Current pulse rolls the shared RNG separately per victim, uses spell-critical chance/multiplier, passes the critical byte for spell 740/Nature3, and retains source-kind 3 generic-effect suppression. Live pulse now prepares each critical through the existing RNG/stats/attributed-hit interfaces. | [Source repair and 388 bounded instruction cases](tranquility-0.119.0.md) complete; compilation, gameplay/log presentation and original/rebuilt parity remain open. |
| #177 Per-Druid Rejuvenation, own refresh, one stacked icon | Caster-aware aura storage, exact kind14 event inputs, fixed tick-start admission and actual per-recipient delivery now reach independent healing and existing client fields. #178 owns grouped icon publication. | [Source repair and 2,037 bounded instruction cases](rejuvenation-0.119.0.md) complete; sixteen authored Rust regressions, compilation, real party/client/meter behavior and parity remain unverified. |

[The native/source report](release-contracts-0.119.0.md) and its
[curated manifest](evidence/0.119.0/druid-release/manifest.json) retain current
instruction and data selectors, source receipts, twelve completed full-PE
durable REA/Ghidra queries and independent byte/boundary checks. Source-first
inspection establishes the available aura, critical, party and engine-field
interfaces. Generic engine internals remain supporting context.

The #176/#177 gameplay and #178 aura-projection source corrections are implemented and statically checked as
linked above. No application compilation, compiling test,
client/game/network/server execution, save/settings mutation or controlled
original/rebuilt comparison was part of this review. The claim ledger and
[CURRENT-STATE](../CURRENT-STATE.md) retain source/recovery issues;
[verification-needed](../verification-needed.md) retains execution/comparison limits.

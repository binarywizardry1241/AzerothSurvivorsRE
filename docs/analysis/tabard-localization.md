# Tabard item-name localization

Finding **#161**, selected EXE SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
[verification-needed](../verification-needed.md) owns current implementation and validation
status. The new 90025 descriptor belongs separately to
[#116's integration](party-rewards.md).

The live `gameplay/client/inventory.rs::tabard_name` previously looked up the
descriptor's literal English name. The current native item constructor
`145ab6630..145ab78f5` instead formats **`tabard.{id}`**, asks the locale lookup
for that exact key, then uses the descriptor name only when lookup is absent.
Its format record is the exact ten bytes at `1472c79b0`:
`07 74 61 62 61 72 64 2e c0 00`. The selected branch at `145ab67d2` supplies the
descriptor's u32 ID and formatter `145f784e0`; lookup at `145ab681f` invokes
`145b29c00`. Branches `145ab6846..145ab684d` choose the returned string when its
pointer is present, including a zero-length value.

Source now queries `MenuCatalog.labels` with the ID key and falls back directly
to the descriptor name. It preserves explicit empty translations and a value
equal to the key itself. The composed descriptor reader includes the new
Contest Winner's Tabard through #116's current addition asset. This correction
reaches the ordinary `Item::template`/inventory-query tooltip producer.
Recipient-specific cooperative inventory queries reuse that constructor with
the member's localized catalog.

The independent [current ItemQuery bridge](evidence/item-query-bridge/contracts.json)
binds opcode `0x56` through selected table entry 11 at `1472db538`, metadata call
`145af9e97`, name transfer into the response record, serializer call
`145afa9b1` and actual sender `145b1a8d0`. Serializer `145b66370` writes opcode
`0x58` and copies the name bytes unchanged. Its 404-case replay includes all
twenty-one tabards and proves that the localization constructor's output is
the actual item-template response name.

The [shared native contract](evidence/party-rewards/contracts.json)
binds the constructor bytes, format records, tables and completed journaled
Ghidra query without duplicating native extracts.
[Bounded cases](evidence/party-rewards/tabard-localization.json) bind
the full twenty-one-tabard population and four lookup states per tabard.
`python3 -B scripts/check-tabard-localization.py` passes **84 original
instruction cases**: absent ID key with an unrelated literal-name translation,
Unicode ID-key value, empty ID-key value and an ID-key value equal to its key.
The literal-prefix/u32 formatter, locale lookup, allocation/copy and deallocation
are explicit typed seams. Current native branches and selected strings are
executed in synthetic memory; the game and rebuilt source are not executed.

Compilation, real locale/cache/query delivery, tooltip rendering and
original/rebuilt parity remain unverified. This proof does not certify other
item-name or Rewards-page localization paths.

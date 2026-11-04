# Release-claim ownership context for 0.140.0

Selected 0.140.0 target SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [individual reviews](release-review-0.140.0.md) own the 52 supplied items.
Their registered ownership keeps live behavior and source correspondence open
where the checked evidence covers only descriptors, selectors or Lua consumers.

Historical release context: [0.139.1](changelog-coverage-0.139.1.md)

| Release | Scope | Status | Remaining work | Evidence and source |
| --- | --- | --- | --- | --- |
| 0.139.2 | Downed party positions, world-anchor catalog and hero-relative distance | Current Lua consumer ranges and native registration leads reviewed | #63 owns authoritative party publication, #317 owns the catalog and projection, and #307 owns combat distance correspondence | [Addon review](world-anchors-0.140.0.md); [co-op source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs); [addon bootstrap](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs) |
| 0.140.0 | Scholomance, Tier 0.5 rewards and progression, class/gear changes, input, movement and meter | Current source-first review with bounded descriptors and diagnostic references | #312–#315 own Scholomance entry, encounters, rewards and progress. #316 owns Kill Command and #318 owns Rogue reach. The individual reviews retain all remaining changes under their existing owners | [Individual review](release-review-0.140.0.md); [Scholomance evidence](scholomance-0.140.0.md); [class evidence](class-balance-0.140.0.md) |

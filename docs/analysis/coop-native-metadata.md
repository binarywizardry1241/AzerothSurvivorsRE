# Native co-op metadata foundation

Target: installed Windows0.121.0, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This source delivery subset establishes actual Hero4/State15 metadata producers,
storage and typed codecs. It does not claim complete #238 admission, private
rewards, accepted-snapshot settlement, set effect consumers or UI behavior.

The canonical native ranges and journal receipts remain in
[the wire manifest](evidence/0.121.0/coop-heroic-wire/manifest.json), avoiding
duplicate extracts. Builder145af4ae0 produces nineteen equipped star counts,
selected-class saved pity, twelve Save-derived Heroic caps and the selected
achievement-gated glow. Received Hero validation normalizes those actual inputs
at the recovered boundaries. The private gear bridge hydrates its canonical-ID
star map from these received counts.

Each local/remote hero retains its frozen nineteen-star array and actual worn
set descriptor in the existing swapped EffectsState. `configure_armor_set`
sets IDs, counts and the descriptor through the current `sets::equipped_descriptor`
owner. The local run-entry caller captures this metadata before effects
initialization. `equipment_stars` and the slot-order `item_star_rank` query use
that frozen array rather than reading a later local account.

The actual State producer publishes the Game's rank, shared post-clear boss
counter, boss-only mark sum/maximum, maximum equipped star and set-tier-plus-one
or zero for absence. Both local and remote party members publish their own
actual active-set byte, including lethal-event snapshots. Party flag34 now
means Heroic rank at leastIII. State validation enforces the recovered scalar
caps. RunProjection exposes the two floats as `run_marks` and `max_boss_marks`;
the historical density/reward interpretation is removed.

`scripts/check-coop-native-metadata.py` reuses the canonical serializer
replay in metadata-only mode: two actual Hero4 fixtures and two State15 fixtures,
including current party members. Its source inventory checks only the named
metadata producers, getters, validation, typed codecs and local-entry caller.
The [result](evidence/0.121.0/coop-native-metadata/static-check.json) records this
restricted scope. The broader wire checker retains the separate complete
repair's inventory; its full source connection claim is not made by this subset.

The foundation includes the shared counter owner's `run_marks`, `max_boss_marks`
and `endless_boss_kills` fields/defaults/getters; the State producer calls those
exact names. Their reward-roll mutation paths remain separately owned. Renaming
RunProjection requires the current accepted-snapshot settlement consumers;
old density division and reward-threshold accesses cannot remain as aliases.
That consumer group must be integrated before source build validation.
No compiler, application, network, server, game or parity comparison ran.

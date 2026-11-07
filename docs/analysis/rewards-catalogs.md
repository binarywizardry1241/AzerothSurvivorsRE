# Current Rewards catalogs and admission

Target: installed 0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[verification-needed](../verification-needed.md) owns the remaining #17/#26 boundaries.

The [current source catalog](../../crates/azeroth-survivors-re/assets/rewards-catalogs-0.112.0.json)
contains 84 achievement display records worth 1,775 points, 13 perks, 20 tabards
and 22 companion descriptors. The menu, save's accepted pet keys and generic
loot-companion descriptor lookup use this catalog. The older `progression.json`
remains the gameplay achievement predicate catalog with its historical provenance;
this change does not reconstruct new feat awarding conditions.

Constructor `1459adf40` and gear iterator `1459d3570` produce all display records.
Unlock iterator `1459db860` supplies 43 ordered rows, including its prerequisite
suppression. Its order is perks, tabards, cosmetics, companions. The seven cosmetic
rows use the translated `Reward` prefix; companion rows use `Companion`.

Companions add Swift Zulian Tiger, Mini Chromatic Drakonid, Mini Eye of C'Thun,
Mini Stitches, Mini Doomguard, Baby Devilsaur, Mini Ogre, Tiny Gordok and Azure
Whelpling. Their exact display, scale, creature and achievement fields feed the
existing generic actor and pet-save admission path. No actor movement behavior is
inferred from the descriptors.

The refresh is not purely additive: Scarlet Crusade Tabard 90016 is now granted by
`feat:herod`, has cost 0 and follows the six zone tabards. It is no longer
purchasable. Nine separately embedded descriptor table copies agree field for
field, covering frontend and game-side data.

Current tabard admission `1459b6f30` chooses the earned-key branch whenever the
descriptor has a gate; only an ungated descriptor consults purchased tabards.
Consequently an older purchased90016 record does not bypass the Herod requirement.
Iterator `1459d2e10` feeds the combined inventory getter `1458d4270`; the class
getter and appearance projector clear a stored Scarlet look until that feat is
earned. Source now follows the same exclusive branches instead of accepting a
purchase as an alternative to the current achievement gate.

Current validator `1459aadc0`, application `1459ab6c0`, spending `1459aabd0`,
perk clone `1459dc1e0` and instinct collector `1459ca500` execute against current
metadata and the complete current achievement point registry. Pet collector/map
`1459d7ac0` / `1459ef480` take the first two inputs and replace unknown or locked
entries with squirrel; actor-side getter `1459b74d0` independently applies the
same gate. Existing backend regression inputs now use current vectors. Its
separate historical serializer/reload/Reset fixture retains its 0.109.0 identity.

## Static checks and remaining limits

- `scripts/check-rewards-catalogs.py` passes 420 native display fields,
  84 entries / 1,775 points, 43 ordered unlock rows and all descriptor fields.
  The [catalog replay record](evidence/rewards-catalogs/catalogs.json)
  binds instruction/table ranges and output digests.
- `scripts/check-reward-admission.py` passes 312 complete native Rewards
  admission/application cases, 81 pet normalization cases and 243 actor getter
  projections. Its [current vectors](evidence/reward-admission/cases.json)
  include rejection of tabard 90016 purchases. Adjoining analysis manifests retain
  Ghidra identities and current range commitments.
- `scripts/check-tabard-availability.py` passes160 native iterator,
  combined-inventory and class-look cases across all20 tabards, gate presence
  and absent/first/SIMD-lane/scalar-tail purchased entries. Its
  [compact migration proof](evidence/tabard-availability/cases.json)
  retains all eight Scarlet purchase/feat combinations.

Allocation, Vec growth, bytes, String cloning, formatting/locale miss, current
perk/companion lookup and the 84-entry key/point registry are explicit fixture
seams. Original instruction replay runs no game, filesystem operation, native file
parser/serializer or rebuilt Rust. Full save lifecycle, new feat awarding,
companion behavior, compilation and controlled rendered/interactive original/rebuilt
comparisons remain separate unverified boundaries.

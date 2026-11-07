# Permanent race purchases and live consumers

Target: installed read-only EXE, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This implements #188's source scope. Compilation, actual purchase/save/network/
gameplay interaction and original/rebuilt presentation parity remain unverified.
The original [release contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.120.0.md) retains discovery
provenance; the [purchase proof](evidence/0.120.0/race-rewards/proof.json) and
[run carry proof](race-run-carry.md) bind current dependencies separately.

## Purchase transaction and presentation

`progression.rs` now carries a separate race vector in `Progress` and command17's
`RewardPlan`. Each bought race costs 100 achievement points in the shared account
spending calculation. Validation admits only IDs1–8, retains every already bought
race, and includes the entire plan's cost in the earned-point gate. Accepted
commands sort/deduplicate the vector before validation, matching `145b36190`;
the optimistic frontend serializes the same normalized ownership.

`progression/rewards.rs` inserts Races at tab3 and moves Appearances to4. It
iterates the existing eight race descriptors in their native order, reuses the
sex-dependent atlas portrait and shows the exact owned, planned, affordable and
insufficient-point captions. Bought cards are permanent; pending cards can be
toggled off. `14011dd50` supplies the class list by excluding each race's original
base classes, independently of the account's purchased union. The source reuses
that base predicate and existing class order for “Opens it to: {classes}”.

The new pane follows the recovered two-column grid,10/8 gaps,8×6 card padding,
40-pixel portrait and15/11/13-pixel name/class/caption text. The current card
constructor and body bind these boundaries; actual layout/fonts/hover remain
unverified. Existing control, panel, shadow, hover and label owners are reused.
The [locale dependency](race-locales.md) restores the exact eight current
race-feature keys in all fourteen catalogs, including sidebar/reset/modal prose.

Native Action2 at `1401b740b` gets a pending-or-account plan, adds an absent race
or removes its selected byte with the ordered tail shift at `1401b782d`, then
assigns the third vector at `1401b78b9..1401b78fa`. The source's `BuyRace` follows
that add/remove lifecycle through its existing validity gate. Confirm, Undo,
Confirm-and-leave, Discard and Keep Editing retain their established owners.
Race-only edits now participate in sidebar and navigation dirty detection and
account baseline reconciliation, preventing a stale plan after an accepted update.

## Ownership, selection and run entry

The [account dependency](race-account.md) owns current `races|` loading,
ordered base-plus-purchased picker eligibility, class changes, saved hero/Pick
normalization and previews. Purchase command17 and optimistic confirmation both
write through the existing account/save path. Reset18 and optimistic Reset clear
only perks and retain races, their permanent point cost and companions; the
separate [persistence review](race-persistence.md) covers these consumers.

Co-op `coop_profile::build` already carries the actual Pick race. Current remote
normalizer `145aa97a0` checks the valid class mask and race domain1–8 rather than
the host account's class/race eligibility. `coop_profile::sanitize` now supplies
that full race domain to `validate_hero_identity`; the existing GUID, duplicate,
name, appearance, gear, talent and other admission owners remain distinct.
The native downstream call at `145aa98f7` uses the same domain-based Pick
normalizer as the account dependency. This avoids rejecting an unlocked guest
combination merely because the host has not bought that race.

Selected race and class remain independent inputs to the existing run constructor,
racial instance, passive composition, starter inventory and preview. Current proof
checks all eight race records,66 starter descriptors,72 outfits and288 full
racial-stat prefixes with3,456 exact scalar values. No substitute race, starter
outfit or new gameplay modifier was added. Faction-specific Druid form art is
the separately owned #190 dependency; restricted hover guidance is #191.

## Static checks and limits

```sh
python3 -B scripts/check-race-rewards.py --queries
python3 -B scripts/check-race-run-carry.py --queries
```

The purchase checker passes6,194 original-instruction cases:20 card-state cases,
2,563 race-validation cases,27 spending cases and3,584 remote admission cases.
The original release proof additionally verifies twelve ranges/674 instructions,
four literals and eighteen retained queries. Its eleven source receipts explicitly
retain their committed pre-repair bytes, while these repair owners describe the
current source. Native input toggle/assignment and constructors are reviewed
statically. Five additional durable Ghidra results retain their exact journals,
profiles and raw/full-PE input identities.

The synthetic card replay supplies translation/formatting/allocation seams;
validation stops before the shared earned-achievement calculation and is not a
whole validator proof. Remote replay starts after the GUID gate and stops before
name/appearance normalization. Raw Ghidra's inferred ABI and missing PE context
are checked against original instructions, not treated as recovered Rust types.
Source guards and Rust syntax parsing execute no reconstructed code. Native
runtime, renderer, filesystem, network or server services were not run. Whole-image
ownership and unrelated recovery remain #41; static source completion does not
certify compilation, complete gameplay semantics or parity.

The remote Hero and run-carry proofs establish selected AS producer/consumer
interfaces. They do not independently assign a diagnostic filename to those
bodies or register an additional complete native module.

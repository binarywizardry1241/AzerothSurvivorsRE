# Selected-race run carry and starter dependencies

Target SHA-256 `291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This bounded review supports #188's purchased-race/class combinations. It finds
no missing racial/passive/starter source operation after account-aware eligibility
admits the selected race. Existing source is reused; complete gameplay semantics
and runtime parity remain unverified.

## Current native connections

- Eight contiguous 88-byte RaceDef records are at `146f79f68..146f7a228`.
  Native ID is `+50`, racial key `+30/+38`, passive rows `+20/+28`.
  All eight keys and every ordered passive tag/f32 payload match the existing
  `run-entry-0.100.1.json` values. The old asset keeps its original provenance;
  these selected connections now have current correspondence.
- Constructor `145b88390..145b89a6d` reads the input class at `+18c` and race
  at `+18d` independently. It obtains the class starter key from `+40/+48`,
  finds it in the 120-byte AbilityDef catalog, then obtains the race racial key
  at `+30/+38` and finds that independently in the same catalog
  (`145b884cf..145b8859b`). There is no class/race-pair gate in this path.
  It builds the separate racial instance and calls stat refresh at `145b898a9`.
- Refresh `145b7de20..145b7ee40` resolves class `Game+33c` and race `Game+33d`
  independently (`145b7de97..145b7deea`), then consumes the selected race's whole
  passive vector through its twelve-arm dispatch at `145b7e22b..145b7e374`.
  Current pointer tables and jump-table targets are explicitly bound in vectors.
- Constructor calls outfit `145af7160` with the selected race and class at
  `145b8871b..145b8872c`; that owner calls current starter getter `145af68d0`.
  The getter has eight race branches; each admits all nine class IDs with mask
  `0x5df` on `class-1`, independently of original race/class restrictions.
  It traverses the chosen outfit's item IDs and resolves descriptor slots.

## Actual source consumers

- `gameplay/mod.rs::entry_player_stats` resolves `hero.race` in EntryCatalog,
  supplies every racial scalar, and writes `native_race` and actual packed
  race/class/sex. Run entry seeds damage/regeneration/recovery before
  `configure_effects` and supplies the racial movement multiplier.
- `gameplay/mechanics.rs::Mechanics::new` resolves the class starter and
  separately initializes `racial_definition(stats.native_race)`. Its eight-key
  mapping matches the current RaceDef racial keys; the separate instance
  remains outside the learned six-spell pool.
- `gameplay/mechanics/effects.rs::base_numeric` and
  `set_racial_progression_components` preserve native growth-before-racial-add
  order and Gnome's exact tag2 recovery payload `0x3da3d70a`. The current prefix
  replay includes every selected-race scalar before later equipment/proc layers.
- `ArmoryCatalog::starter`, `starter_look` and `GearSave::outfit` already have
  all 72 race/class baseline outfits. No conventional-restriction fallback
  or substitute outfit is needed. Existing menu preview, true inventory and
  gameplay appearance owners consume these same outfits.

## Static evidence

`python3 -B scripts/check-race-run-carry.py` passes:

- Eight current racial/passive records against source-owned entry data.
- 66 independently decoded current item descriptors against source catalog.
- 72 native getter/source outfit cases (all eight races × nine classes).
- 288 complete original racial-stat prefixes (all 72 combinations at levels
  1, 2, 37 and 99), comparing twelve exact f32 lanes, 3,456 scalar values.

Three journaled Ghidra raw queries cover the selected constructor, refresh and
starter getter. [The manifest](evidence/0.120.0/race-run-carry/manifest.json)
binds original results, journals, plans, raw input hashes and source receipts.
[The vectors](evidence/0.120.0/race-run-carry/vectors.json) and canonical assembly
retain selected proof. The default checker verifies current bytes, source
receipts, native/source cases and saved vectors; `--queries` also verifies the
retained ignored query commitments. No duplicate pseudocode export is tracked.
Raw Ghidra lacks external PE data, call-target and ABI context; original
instructions plus current data bind the bounded interpretation above, not
generic raw pseudocode signatures.

The getter replay supplies descriptor ID/slot from independently decoded current
66-item records; allocator/free use deterministic fixture seams. The refresh
replay uses empty gear, temporary, jewelry and active-effect collections and
stops after the complete racial-passive loop. Constructor instructions are
reviewed, not emulated. Reconstructed Rust, game/client/server, filesystem save
operations and renderer do not execute. Complete racial ability execution,
interaction, compilation and controlled original/rebuilt parity remain separate.

## Integration boundary

The account/save repair connects account-aware eligibility from Rewards ownership
through save/picker/hero normalization and co-op admission. Its implementation
status is owned by [verification-needed](../verification-needed.md#gap-188). These existing
class-independent run consumers then receive the chosen race unchanged. The
different existing Druid faction-form predicate defect remains #190 and is
already proved by the separate current form-selector evidence.

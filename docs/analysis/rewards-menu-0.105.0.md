# Rewards menu — selected 0.105.0 target

Current input, confirmation and descriptor revalidation is owned by [the0.109.0 report](rewards-menu-0.109.0.md); this report retains its historical target.

Recovered from `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns integrated status. This report separates
current Rewards data, reconstructed presentation and validation.

## Reward records and localized text

The [data extractor](../../scripts/recover-rewards-data.py) reads the
current pointer/length records directly. The
[provenance](evidence/0.105.0/rewards-menu/data-provenance.json) records their
addresses, byte hashes, locale descriptors and selected-label digests.

| Data | Native address | Count / stride |
| --- | --- | --- |
| Perks | `145dba1b8` | 13 / 120 bytes |
| Companion looks | `145dbbe98` | 13 / 96 bytes |
| Tabards | `145dbc598` | 20 / 64 bytes |

Compared with the former 0.100.1 asset, the Companion, Quick Paws and
Wisp-herder descriptions changed. Costs, ranks, prerequisite/achievement gates
and all twenty tabard records match. The first twelve companion records also
match. The thirteenth is **Sapphiron**, gated by `feat:nou`, whose native name is
`no u`; its model/display/scale/icon/creature fields are retained in the asset.
This adds its menu record, not its gameplay actor or achievement condition.

Eleven selected Rewards labels were added to each existing locale asset:
the unsaved-plan dialog, Sapphiron/name and changed companion prose. Every
selected value matches its pointer-bounded current native catalog. The source
now has **2,643 labels per locale**, with the remaining labels retaining their
older provenance. The achievement catalog/grants remain 0.100.1-bound.

Run `python3 scripts/recover-rewards-data.py` to stage fresh data proof
under `runtime/`; `--write-assets` updates only these reward records and scoped
labels after checking the full EXE hash. Building source never needs the EXE.

Data/JSON comparisons passed for all 13 perks, 13 looks, 20 tabards and selected
labels in all fourteen locales. Static data does not establish menu interaction,
font/rendering parity, companion gameplay or the new achievement's grant.

## Layout and input reconstruction

The [native manifest](evidence/0.105.0/rewards-menu/native-manifest.json) binds
eleven selected owners to the full target; ten have closed REA/Ghidra observations.
The actual twelve-entry input jump table is retained alongside the canonical
[input](evidence/0.105.0/rewards-menu/actions.asm),
[dialog](evidence/0.105.0/rewards-menu/modal.asm) and
[command-control](evidence/0.105.0/rewards-menu/command.asm) instruction extracts.
Raw Ghidra imports use a generic GCC ABI; original PE registers, stack operands,
data and jump-table destinations supply the Windows binding.

[Constructor snapshots](evidence/0.105.0/rewards-menu/layout.json) recover these
selected boundaries:

| Owner | Recovered layout applied to source |
| --- | --- |
| Panels `140124bf0` | 300px sidebar; growing right pane; 16×12 padding;10px vertical gap; intrinsic heights and shared Armory shell/header |
| Sidebar `14020d7d0` | 40px score with14px inline suffix;13px earned/spent/reset copy; intrinsic Confirm/Undo;6px spacers; flow-based headings/navigation |
| Controls `140126a20`, `1401240c0`, `140123aa0` | Command15px with14×6 padding, centered contents,5px corners, native red gradient and0.4 hover lift; navigation16px/12×8; slot14px/10×5 with zero lift |
| Right/Looks `14020f550`, `140126020` | Two-column perk grid10×8;4px spacer before Looks; intrinsic slot row gap10; four-column looks grid8×6 |
| Appearance cards `1402101b0`, `140122ed0` | Intrinsic card heights;6×4 padding;8px icon/content gap;28px icons;13/11px name/status lanes; no fixed row Y or fixed caption bounds |
| Unsaved dialog `14020ccc0` | Centered460px pane;24×20 padding;12px gap;26px heading;15px centered body capped at400px; button row gap10/top margin4;0.6 black cover |

The source path is [Rewards UI](../../crates/azeroth-survivors-re/src/progression/rewards.rs)
with allocation/input in [progression.rs](../../crates/azeroth-survivors-re/src/progression.rs)
and navigation routed through [menu.rs](../../crates/azeroth-survivors-re/src/menu.rs).
It replaces the prior page's absolute offsets with the recovered flow structure.

Leaving Rewards through another tab, Done or Escape with an edited perk/tabard
allocation now retains the destination and opens **Unsaved changes**. Confirm
uses the existing plan validator and save adapter before navigating; Discard
restores the confirmed allocation and navigates; Keep editing closes the dialog
and preserves the plan. Internal Perks/Companions/Tabards switches do not leave
Rewards. Immediate look changes do not become allocation edits. Modal input is
gated so covered reward controls cannot execute. The native switch binds
Confirm-leave9, Discard10 and Keep-editing11; continuations clear pending byte77
to`0xfe`, with`0xff` denoting closing the Armory. Native non-reset actions also
disarm the two-click reset state.

Native companion action8 clones the two appearance slots and replaces slot0 or
slot1, treating any nonzero index as the second. The former source `resize` could
truncate slot1 when changing slot0. The live adapter now preserves both entries,
writes the native two-slot format and retains the pending purchase allocation.
Sapphiron's locked caption uses its recovered achievement name; its new
achievement-grant condition and gameplay companion remain outside this repair.

## Validation and remaining comparison

- **Ten passing original-instruction cases:** six companion-slot cases and four
  Keep-editing/Discard continuations in the
  [native vectors](evidence/0.105.0/rewards-menu/input-vectors.json).
- **31 typed constructor snapshots across ten scopes**, reproduced by
  `python3 scripts/recover-rewards-layout.py`.
- Exact selected reward/locale JSON comparisons and Rust parsing/format checks.
  Two authored Rust regressions cover native slot vectors/save round trips and
  navigation preserving the allocation. They were **not run**.

`python3 scripts/recover-rewards-menu.py --fixtures` reproduces the input
vectors; `--prepare` stages selected raw slices/plans for `./scripts/rea` through
the existing batch runner. The layout replay uses the matching Bevy0.18.1
384-byte Node map at actual typed bundle sites. Allocator, byte-copy, UI
submission, formatting/localization and incoming account/selection values are
explicit seams. Card/control samples stop at their outer Node boundary;
child typography/hover also requires the retained instructions. No OS save,
Bevy world, text shaping or GPU is executed by these checks. Confirm's complete
validation/write pipeline is not part of the bounded input replay.

**The selected gap remains partial.** No compilation, compile-based test,
original application launch or rebuilt application launch was performed.
On-screen purchase/Confirm/Undo/reset, modal button/Escape behavior, hover,
locked/pending/owned tabards, companion selection, multilingual wrapping and
shared shell/font/GPU differences still require a controlled original/rebuilt
comparison. Existing builds/captures do not validate this changed source.

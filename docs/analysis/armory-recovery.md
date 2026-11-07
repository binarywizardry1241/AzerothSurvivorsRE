# Armory, collection, equipment and drop tables

This report records 0.92.0.

The reconstruction targets `AzerothSurvivors/AzerothSurvivors.exe`, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
All addresses in this report belong to that EXE. Historical 0.91.4 findings are not used.

## Recovered data and native consumers

`scripts/extract-menu-armory.py` validates the target hash and produces the build-time
`crates/azeroth-survivors-re/assets/armory.json`. Building the launcher does not require
the EXE. The catalog has 415 permanent pieces, 45 each for seven classes and 50 each
for Rogue and Shaman. Class records at VA `0x1466cc590` have stride304; their weapon
records have stride144. Synthetic IDs decode as
`100000 + class_id*1000 + catalog_slot*100 + rarity*10` in `0x1453e0030`.

The eight armor slots are Head, Shoulder, Chest, Waist, Legs, Feet, Wrist and Hands.
Primary/secondary weapon records supply their actual equipment slot and inventory
kind; Hunter's primary is Ranged. The catalog includes native names, material,
quality, display ID, item class/subclass, inventory type, sheath, effects and flavor.
Effect scaling is recovered from `0x1454f0c40`, `0x1454f0e80` and `0x1454f10c0`:
base multipliers1/1.7/2.5/3.5/4.6, additional multipliers0/1/1.6/2.4/3.4, all scaled
by0.7. Health rounds before merging equal effect tags. Legendary weapons add one
target; legendary armor adds0.042 echo.

Native boss-drop distribution comes from `0x1453de990`. Nine zones map to quality
tiers0,1,1,2,2,3,3,4,4. Base piece chances are60/50/40/30/20 percent. Ordinary bosses
split the eight armor slots across the zones of the tier; final bosses offer that
class's weapon variants. Menu browsing does not simulate or award a drop.

The starter outfit getter `0x1453df460` selects one of eight race tables and a
class-indexed vector. The 66 starter item definitions at `0x1466c9970`, stride40,
carry item and display IDs plus inventory metadata. The generated catalog preserves
all72 race/class results as19 paperdoll slot IDs. Baseline is independent of sex.
`0x1453dfcf0` overlays nonzero equipment, then explicit cosmetic overrides including
zero; a two-handed primary (inventory type17) clears the offhand. The preview agent
has connected these native results in place of DBC starter-outfit selection.

See [catalog provenance](evidence/0.92/armory/catalog-provenance.json) and the adjacent
curated native assembly for table addresses, hashes, scalars and consumer evidence.
Ghidra slice identities are in [slice provenance](evidence/0.92/armory-slices-provenance.json)
and [core slice provenance](evidence/0.92/armory-core-slices-provenance.json).

## Native save interoperability

`items|ID,...` is account ownership. `equip|CLASS|SLOT:ID,...` and
`look|CLASS|SLOT:ID,...` are sparse maps with **native19-slot paperdoll indices**,
not the catalog's compact0..9 ordering. For example, a native shoulder equip and
explicit look produce `equip|1|2:101100` and `look|1|2:101100`.
`look` absent follows worn equipment and then baseline clothes; explicit0 hides
that slot (the native body button calls this Starting clothes, since a separate
baseline shirt may remain). Changes preserve ownership and unrelated progress.

The original EXE was run only in the isolated project-local reference prefix and
save directory. A sealed fixture with two Warrior head pieces showed2/45 and
native equip/look output; a later nine-piece fixture confirmed Shoulder slot2.
Unowned pieces can be inspected but have no Equip action. Locked zones can be
browsed in Drop Tables without unlocking progression. Native Common Head displays
+8 Health and0.7% critical chance; Uncommon Head displays+14 Health,1.9% critical
chance and1.4% speed, matching recovered scaling. Original screenshots are disposable
runtime evidence under `runtime/analysis/history/native-recovery/reference-captures/1415f0451c23/armory-*.png`.

## Implemented and remaining

`armory.rs` implements Character appearance/equipment, collection inspection,
class-specific worn/look persistence, drop-zone/boss browsing, native catalog icons,
and the shared Armory header used by Talents. Input respects the Options modal.
It neither invents owned gear nor grants progress when browsing.

This is not a claim of1:1 parity. Typography, icon cropping, exact tooltip/stat
prose and all window sizes still require systematic original/reconstruction
comparison. Gameplay acquisition is outside the current menu scope. Only bounded
native item examples have runtime proof; the complete catalog is recovered from
the native table and consumer code. Parent-owned integrated build25 passed in14.34s, with105 focused harness cases
passing across overlapping suites. Builds20–25 were not launched; the newer
header/overlay/preview behavior still requires a controlled runtime comparison.

## Full-window overlay recovered2026-10-16

The native Armory is an overlay over the still-present picker. Exact root constructor`0x140043f10..0x140044618` builds the ArmoryRoot tuple (type-name identity linked through native bundle metadata and deferred spawn). Its Node is Absolute,100%wide/high, with GlobalZIndex5400. BackgroundColor is sRGBA(.012,.010,.008,.970), not an estimated black shade. A separate radial gradient uses center anchor with Percent0/Percent−20 offsets, FarthestCorner shape, default Oklaba interpolation, and stops at0%/70%: LinearRgba(.30,.17,.06,.35) to transparent black. The raw colors pass through native144c4bc10 before being stored as LinearRgba, consistent with the recovered common-pane route.

The shell`0x1401f5430` is100%×100%, column layout, padding40px horizontally/20px vertically, gap14px. Its content body is100%wide, grows, and has18px column gaps. The shell dispatches Character/Collection/Drops/Codex/Talents/Achievements/Rewards under the same overlay. The reconstruction's bright picker utility overlap was an observed parity defect; parent-owned shared overlay integration compiled in build19, alongside34 passing focused cases; a post-integration runtime comparison was not launched. See [decoded style and identity chain](evidence/0.92/armory-root-style.json) and [constructor instructions](evidence/0.92/armory-root-constructor.asm). Native data recovery alone does not prove rebuilt layering parity.

## Shared header and shell flow

REA now recovers shared header03bc70→1f4550 and intrinsic button03b3f0. The header is a100% row with14px gaps and centered children. Its growing title column contains46px heading text and15px class-colored summary with a muted collected-count span. Tabs use16px text with native locale keys, positive Talents/Rewards counters, and intrinsic dimensions:14×6px padding,1px border,5px radius. Done uses18px text after an18px spacer. Selected controls use the native red gradient/GOLD border/PAPER text; unselected controls use black alpha.5/EDGE border/GOLD text. Hover is native PAPER with zero lift. These values and exact code extracts are retained in [shared header evidence](evidence/0.92/armory/shared-header-style.json).

The owned build_header_row/shell_node/body_node APIs implement that flow. Codex and, from checkpoint25, Talents use the recovered whole padded shell. From source26, Character/Collection/Drops use that shared shell/header/body flow too; the old independent absolute pane placement is removed. Progression still has its separately tracked body reconstruction. Applying shared inner flow is not a claim that those remaining absolute body layouts are native. The new header/Codex source compiled in parent-owned build20 (8m33s); no UI launch or capture was performed. The collected-count TextSpan explicitly carries the native15px font and compiled in build21. Other page body layouts still require reconstruction and comparison.


## Persistence event follow-up — checkpoint25

Appearance mutations now issue full-Pick commits, while equipment/cosmetic mutations issue account-only commits. Earlier local name/zone edits therefore join an appearance event but do not accidentally enter an equipment save. This distinction follows native Armory input `0x140045520` and the independently bound Core command path, not a generic changed-resource assumption. See the [save-policy evidence](evidence/0.92/save/persistence-policy.json). These call-site corrections compiled and their shared persistence fixtures passed in parent build25; no Armory runtime comparison was launched.


## Intrinsic three-pane body — source26,2026-10-16

Native shell dispatch`0x1401f5430` binds six small pane constructors. The common
Appearance pane is350px wide with14×12px padding and8px row gaps; the right Features
and Details panes are340px wide with16×12px padding and8px/9px gaps. Fixed side
panes do not shrink. Each middle pane grows with zero pixel flex basis and minimum
height0. Character is a centered column with16×12px padding and4px gaps; Collection
is a column with16×12px padding and10px gaps; Drop Tables is a row with14×12px
padding and14px column gaps. All retain the proved common-pane frame helper.
These are intrinsic Nodes, not a scaled version of the old absolute rectangles.

The source now uses those pane constructors under the already recovered shell and
header. Character’s native stage is500×610px with a100%×100% absolute model image;
the old394×578px stage was a concrete layout defect. Name34px, sex/race identity15px,
class blurb15px and the centered turn row now flow in sequence. The floor ellipse,
34px turn images and38px feature-arrow images use their native constants and MPQ
paths. Feature cards have auto height,4×5px padding,6px horizontal gaps, a growing
center column with3px row gaps,11px labels,20px values and6px indicator dots when
there are at most16 choices. The corresponding controls retain the existing input
adapter; this pass does not prove native click/held rotation math.

Collection now uses its150px label track followed by one54px track per class slot,
10px row gaps and6px column gaps, with54px piece cells. Its footer uses automatic
top margin and an intrinsic SpaceBetween row. The recovered missing-list container
has two minmax(0,1fr) tracks with14px horizontal/6px vertical gaps. Its child entry
constructor and truncation remain open: the old six-entry cap is explicitly retained,
not asserted to be native behavior. Drop Tables now has its nonshrinking230px zone
column with5px gaps and a growing boss column with8px gaps. Boss rows have10×6px
padding,12px gaps and a190px identity column; their piece icons are42px. The old
inline miniature item prose was removed from those rows: the native code attaches
that information through icon consumers/tooltips. Item tooltips are still missing.
The Details and Look regions now use their recovered header/footer flow, including
60px selected-item portraits and automatic top margin for the Look footer.

Evidence: [body fields and open gaps](evidence/0.92/armory-intrinsic-body.json),
[curated original instructions](evidence/0.92/armory-intrinsic-body.asm), and the
adjacent hash-bound`armory-body-*-provenance.json` slice manifests. The bounded
Ghidra dossiers cover the native assemblers and child consumers; signatures from
raw GCC imports are not trusted as Win64 call definitions. Original instructions,
measured Bevy0.18.1 layouts and actual spawn pointers bind the decoded fields.

Source26 is **implemented and compiled**. Parent-owned integrated build26 passed
in29.09s, and169 harness cases passed across overlapping suites:74 binary,
19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18 installer.
The source audio fixture checks passed too. Parent subsequently corrected the
loose-audio index fallback and is running its final incremental build; that later
audio edit is outside this Armory batch. Bundled rustfmt passed for armory.rs.
This worker ran no Cargo, app launch, capture or Git command. No runtime comparison
was launched, and no visual or functional1:1 claim follows from this geometry recovery. Remaining defects include
legacy faction/race control bounds, icon tint/cropping/frame/hover/shadows and card
palettes, exact item/bonus prose and its localization, missing-list children,
additional native Look branches/showing text, item tooltips, drag/turn math and
renderer/camera/ground parity. Those child details are not covered merely because
the surrounding panes now use the native flow.

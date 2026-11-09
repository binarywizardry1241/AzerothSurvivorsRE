# Difficulty selection

Target: installed 0.121.0 Windows EXE, 146,088,960 bytes, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the menu and localization portion of permanent finding **#219**.
[verification-needed](../verification-needed.md) owns its remaining gameplay/source status.
The [manifest](evidence/difficulty-ui/manifest.json) binds seventeen durable
Ghidra queries, original PE ranges, locale descriptors and the source connections.
The older [Run Options report](run-options.md) retains its actual target;
its four-percentage policy is not the current Difficulty menu.

## Native flow and source connections

Current owners `140288ed0`, `140289500` and `140289bc0` control modal lifetime,
pressed rank actions and content invalidation. `140289500` reads Pick rank at
`+0x38`. A rank action is accepted only at or below the current Save-derived
maximum, then passes through `145ac00a0` (`min(rank,5)`). Selection keeps the
modal open. The owner compares the final rank with its initial value and queues
one changed Pick when they differ; the independent close action clears the
modal. The actual ECS iteration/command scheduler is not emulated.

`menu.rs` now routes `Action::Heroic` through the shared maximum/rank boundary,
compares the final rank once, and persists through the existing Pick command.
The obsolete modifier/reset actions are removed. `MenuState` owns rank and
Save admission; their parse/write/unlock contracts retain their separate Heroic
recovery. The Difficulty page also invalidates on rank, zone, maximum and Save
revision. `picker.rs::PickerContentKey` follows the current Pick rank rather
than the legacy modifier tuple, retaining the existing name-only exclusion.

The current [state-connection proof](evidence/difficulty-state.json)
binds the constructor's unchanged copy of its rank input into Game, separately
from presentation. The source restores the requested `Pick.heroic_rank` through
save/schema; `gameplay::enter` clamps the effective run rank to the selected
class/zone ceiling without rewriting that Pick. Changing class or zone therefore
can retain a selected, locked row. `RunRules.heroic_rank` reaches
the ordinary and boss spawn paths through the current
[scaling proof](evidence/heroic-scaling/manifest.json); the retained legacy
percentage fields receive unity from live entry. These bounded static proofs
do not establish compilation, application execution or parity.

The actual picker footer is `140126140..14012655e`, reached by the exact
`picker.run_options` literal references. Its native catalog value is now
**Difficulty**. Rank zero retains `picker.normal_difficulty`; positive rank uses
`145ac00b0` and red `(1,0.353,0.235)`. The live footer now follows those consumers
instead of showing a reward derived from the old four percentages.

## Authored layout and rank contents

Original frame `14014b510`, page `14014bce0`, row `140278430`, row contents
`14014d0e0` and badge helper `14014b7e0` execute to typed UI submission seams in
the [retained captures](evidence/difficulty-ui/submissions.json).
`run_options.rs` keeps the established custom overlay and shared UI interfaces,
using these current submissions:

| Part | Native submitted contract |
| --- | --- |
| Canvas | 860×700, maximum scale 1.4 |
| Panel | 28 horizontal/18 vertical padding, gap 7, border 1, radius 10 |
| Header | Difficulty title 34; localized selected zone 15; explanatory text 12 |
| Choices | Normal and Heroic I–V; each row has 12×7 padding, gap 14 and radius 6 |
| Rank gutter | Width 124, title 22, five 18×4 bars with gap 3/radius 2 |
| Contents | Growing column, gap 4; wrapping badge row with gap 5/4 |
| Badges | Text 11, padding 7×2, border 1, radius 9 |
| New twists | Two descriptions for that Heroic level, text 12, 6×6 marker and gap 7 |
| Selection | 16-pixel radio, border 1.5, selected 8-pixel center |

Normal shows its ordinary-zone badge and Marks. Heroic shows Health, Damage,
Marks and Loot/talent-experience badges. Current callback calls respectively
`145ac02f0`, `145ac02b0`, `145ac0270` and `145ac0330`; the shared Heroic module
owns their scalar values and gameplay consumers. `140277c10` supplies two-decimal
formatting and removes trailing zeroes and decimal points. The source uses the
same display policy. The scalar/formatting library seams in the layout fixture
do not independently validate gameplay arithmetic or Rust formatting execution.

The native UI twist table at `1461afc68` is independently checked against all
five shared `heroic::DESCRIPTORS` pairs; sharing the gameplay definitions does
not substitute for inspecting this UI consumer.

Locked rows retain their numeric badges, replace the two new-twist descriptions
with the native class-normal-clear or preceding-account-Heroic reason, and do
not receive a selectable action. Existing shared `Face` admission and hover
interfaces remain in use. Exact rank colors, inactive bars and chip alpha values
are tied to the current data and constructor consumers; interpreting submitted
layout is not proof of rendered fonts, wrapping, hover or visual parity.
The zero admission ceiling selects the Normal-clear reason; the highest cleared
zone ordinal cannot substitute for the selected class's exact zone-clear pair.

## Weekly affixes

Page callsite `14014cad1` invokes `140276f90` when the page is rebuilt. The helper
calls current-week producer `145ac9f90` at `140276fcb`, retaining EAX at
`[rbp+0x3a4]`. For every displayed Heroic rank it passes the same retained week
in R9D at `14027704f`, rank in EDX and its u64 zone input in R8 at
`140277048` to `145ac0090` at `140277056`. That thin helper reaches the previously
recovered selector with `zone input + 7 * week`. Its epoch/zone-ordinal producer
belongs to the shared calendar contract; this UI proof does not invent a hash
or establish the game Config `+0x19c` writer.

The native UI enumerates ranks I–V, deduplicating affix IDs while retaining their
first appearance. All six selector residues produce two distinct rows, first
available at III and V, independently of the currently selected difficulty.
`run_options.rs` uses `current_week`, `zone_selector` and `affix_ids` from the
shared Heroic module, sampling when its page is rebuilt. No additional periodic
open-modal week-rollover behavior is inferred.

Current `145ababa0`/`145ababe0` and actual UI callback `14014a3b0` prove these IDs:

| ID | Name | First-kind description |
| --- | --- | --- |
| 0 | Bolstering | A death makes nearby enemies tougher and stronger, stacking. |
| 1 | Sanguine | A slain elite leaves a pool healing enemies in it. |
| 2 | Explosive | Horde orbs admit direct hits and burst if not destroyed. |

Source uses the exact native localized keys, including the full descriptions.
The weekly panel has 12×8 padding, gap 5, border 1/radius 6 and title 17. Each
row has gap 10, a 124-pixel name gutter with text 13, description 12 and the
localized `from {heroic}` label at 11. Affix effects remain separate gameplay
contracts; these UI getter/capture cases do not demonstrate them.

## Exact locales and static checks

The fourteen current 56-byte locale descriptors begin at `14765af88` (file
`0x7659d88`). The proof preserves each descriptor/payload hash and thirty selected
keys, checking **420 exact source values**, including the changed picker label,
all ten new twists, unlock reasons and weekly name/description consumers.
Other catalog additions retain their own ownership.

```sh
python3 -B scripts/check-difficulty-ui.py
```

The result records **34 original UI constructor cases**, **six original affix
getter cases** and **57,290 interpreted instruction steps**, plus three changed
Rust files parsed with rustfmt/stdin. The checker verifies all original range,
query subject, plan/journal/result, exact locale and source receipts. The
`menu.rs` connection is bound by its owned rank action/admission/change-commit
and picker-rank fragments; its whole-file hash is informational because unrelated
presentation changes share that file. The other two UI files retain mandatory
whole-file receipts. The existing
Bevy Node schema is checked against current submissions; allocation, UI/font,
localization, color conversion and string/number formatting interfaces are
explicit seams. The weekly fixture supplies a synthetic week/selector and the
independently recovered affix helper contract. Its result is not calendar or
engine execution.

Compilation, actual ECS scheduling, fonts/input/layout/rendering, gameplay,
client/network/server operation and original/rebuilt parity remain unverified.

## Hyper Mode in 0.143.0

The [selection receipt](evidence/difficulty-ui/hyper-selection.json) binds the
current Windows PE to exact range hashes, including the original-VA Ghidra
row query. The [release review](release-review.md#01430-hyper-mode) owns the
pacing and settlement consumers.

`0x145e76430` searches saved keys for `heroic:naxx5`. The Difficulty
panel separately receives selected-and-earned and unlocked bytes at
`0x14023f800..0x14023f853`. Action tag 1 checks the same key and toggles
Pick `+0x30`. The rank byte at `+0x39` and the close branch are separate.
`0x14023f267..0x14023f362` queues one Pick update if either selection
changed. The source uses this same account key for the old achievement
and Crusader, with a separate Hyper row at every rank.

The row owner `0x14022eeb0` places Hyper below the rank list with 12×7 padding,
14 gap, 1 border and radius 6. The child at `0x1401bbfd0` supplies a 124px
title gutter with 22px text, a growing 12px help column and a 16px checkbox.
The title is blue when unlocked and muted when locked. The checked 8px
center uses the gold shadow. The lock help substitutes localized Naxxramas.
The picker formats `<rank> · <localized Hyper>` through the shared
difficulty formatter, preserves the rank-or-mode red tint and halves the
final encounter minute sent to `picker.awaits`.

The backend checks the earned key at run construction. Solo admission
`0x145e345d2..0x145e34618` bypasses rank and Hyper for the transient Tester
GUID, and `0x145e349aa..0x145e349b6` copies the mode to the run
configuration. Co-op admission separately carries the host's earned mode.
Again uses the admitted rank and mode with its existing retained-entry
path. The [Save schema](save-schema.md#hyper-pick-field-in-01430) owns the
plain text representation.

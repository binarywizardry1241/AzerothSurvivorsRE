# Talent menu recovery and implementation

This report records 0.92.0.

Historical target only. Current definitions and allocation behavior are owned
by [the 0.97.2 recovery](talents.md); the old addresses and runtime
observations below do not establish current-target parity.

Reviewed 2026-10-16 against SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
This report covers the between-run menu. Gameplay effect application is outside
the current task. Integrated build and visual validation belong in the
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Recovered definitions and rules

[`extract-menu-talents.py`](../../scripts/extract-menu-talents.py) reads the
original PE after checking its hash. It extracts **353 talents in 27 trees for
all nine classes** into the build-independent
[`talents.json`](../../crates/azeroth-survivors-re/assets/talents.json).
The class index is VA `0x1468ac348`, file offset `0x68aab48`, with nine
200-byte records. Each class contains three 64-byte tree records; talent
records are 104 bytes. The retained
[definition evidence](evidence/talent-definitions.json) records every
talent address and record hash. Names, icons, row, column, maximum rank,
prerequisite and raw 64-byte effects all come from those records.

Native budget function `0x1453f9880` purchases the next point for
`80 + 15 * points_already_earned` XP, to a maximum of 51 points. XP belongs
to the class and survives allocation changes. The native 80-XP fixture
earned one point; learning Improved Heroic Strike produced the save line
`talent|1|80|imp_heroic:1` and displayed 1/1 spent with 0/95 progress.

Learning, `0x145425d00`, requires unused earned points, a rank below the
recorded maximum, and at least `row * 5` allocated points in **previous rows
of that tree**. A prerequisite must have at least the child node's maximum
rank. The recovered prerequisite children are one-point nodes.

Refunding, `0x145425880`, clones the allocation, decrements one rank and
normalizes through `0x145426160`. It refuses the refund if normalization
would remove any other point. There is no cascading refund. The source
checks all retained nodes after decrement, which is equivalent for a valid
loaded allocation. Malformed or stale imported allocation normalization is
still unimplemented. Reset removes the class allocation and preserves XP.
Native right-click refund was observed, including the restored green point
counter and `Talents (1)` header suffix.

## Tooltip value recovery

Description formatter `0x145424990` scans effects in order and uses the first
numeric effect to replace `{v}`. Helper `0x145426f20` scales only the field
selected by its discriminant. Both original 23-entry jump tables were read
from the PE at `0x1468aedb0` and `0x1468aee68`.

The effect variant is **one byte**, `payload[0]`. Treating the historical
four-byte `tag` field as the variant incorrectly folds adjacent flags into
the discriminant. Direct variants 30 and 31 use their own numeric fields
and unit selectors. Other variants include raw counts, percentages and
non-numeric effects to skip. The extractor rounds each arithmetic operation
to f32, formats one decimal and removes a trailing `.0`. An independent native
hover capture (`runtime/analysis/history/native-recovery/reference-captures/1415f0451c23/talents-anger-management.png`)
confirmed “Regenerate 0.6 more health per second.” and the red ten-point row
requirement for unallocated Anger Management. Every recovered description containing `{v}` now has a numeric
value for every rank; examples are 5–25 for Improved Heroic Strike, 1–5 for
Deflection, 0.6/1.2/1.8 for Anger Management and 80 for Deep Wounds.

The milestone predicate in `0x145424f80` is an even nonzero row, one maximum
rank and at least one effect variant at most 29. It drives rounded milestone
cells and the summary list under each tree.

## Recovered layout

The menu uses the shared 1600×900 Armory canvas and intrinsic header. The
shell is a full-size Column with 40×20 padding and a 14px gap; its growing
content row has minimum height zero and an 18px column gap. Body constructor
`0x1400a5d80` places three content-sized tree panes and a fixed 310px details
pane in that row. They have Auto height and flex-shrink zero. Tree cards use
10px padding, 8px vertical gaps and centered children. The details pane owns
16×12px padding and 9px gaps. The former x/y/382×772 measurements describe the
reference-sized result, not absolute constraints in the native constructor.

Tree builder `0x1402291d0` uses a 360px-wide content-height heading with a 10px
gap, 30px tree icon, growing 24px name and intrinsic 15px point count. Its
clipped grid is 360×520 in Column flow. Cell builder `0x1400a3860` uses 46×46
cells with 2px borders, at `left = (column + 0.5) * 90 - 23` and
`top = (row + 0.5) * (520 / 7) - 23`. Regular corners have radius 5;
milestone corners have radius 10.

Milestone wrapper `0x1400a35b0` is a 360px Column with 4px top margin and 6px
gaps. Its newly closed row scope `0x140225f80` uses intrinsic-height rows,
8px gaps, centered items, 26×26 non-shrinking icons and 12px text. The icon
border is one pixel with radius six. These rules allow translated names to
wrap instead of relying on a fixed 32px row step. The new
[intrinsic-body dossier](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/talent-intrinsic-body.json) records exact
Node fields, instruction anchors, shared helpers and remaining styling gaps.

Background builder `0x1400a2c60` loads four TalentFrame MPQ quadrants with
original dimensions 256×256, 64×256, 256×128 and 64×128. It applies
`left = x * 1.5805471 - 57.08206`, `top = y * 1.5805471` and
`size = original_size * 1.5805471 + 1.5`, with tint
sRGBA(0.75, 0.72, 0.68, 1). This crops enlarged artwork rather than fitting
the whole source image to the grid. The constants are retained at
`0x1458b9b90`, `0x1458b9b94`, `0x1458ab3bc` and `0x1458b9ba0`.

Details builder `0x140226ef0` calls the common 22px section heading and uses
31px available-point text,
13px allocation summary, 12px progress/help and 14px tooltip body. Node,
background and description consumers are retained in the scoped
[UI](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/talent-ui-slices-provenance.json),
[page](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/talent-page-slices-provenance.json) and
[art](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/talent-art-slices-provenance.json) provenance files.
Disposable disassembly and captured reference pixels stay under
`runtime/analysis/history/interface/menu-recovery/0558cac00653` and `runtime/analysis/history/native-recovery/reference-captures/1415f0451c23`.

## Implemented and unverified

[`talents.rs`](../../crates/azeroth-survivors-re/src/talents.rs) implements
the class-specific trees, icons and cropped backgrounds, hover details,
current/next-rank descriptions, row and prerequisite requirements,
left-click learning, right-click refund, Learn/Unlearn/Reset controls, XP
progress and native save persistence. It reuses the shared Armory header,
MPQ decoder and menu buttons. `available_points()` supplies the dynamic
header suffix.

The module includes four focused tests for budget boundaries, previous-row
gating, refused cascading refunds and the native 80-XP save round trip.
All four passed in the integrated binary harness (`--bin AzerothSurvivorsRE`),
recorded at `runtime/analysis/history/interface/menu-recovery/0558cac00653/talent-rule-tests.log`. Integrated build 7,
including the native Canvas propagation and Armory baseline changes, passed.
Source25 now uses the recovered shared flow, intrinsic tree headers and
milestone rows, and pane-owned details padding. Its source formatting passed;
the integrated source25 build passed offline and locked in14.34s. The parent
reported105 passing harness cases across overlapping suites (41 binary,15 native
save,6 config,1 run modifier,10 save browser,14 updater and18 installer); test
compilation took7.54s. No new original/rebuilt UI launch or
capture was used. Final pixel comparison, talent cell/button/connection-line
styling, detailed tooltip/control flow and malformed imported allocations remain
open. Recovered effects are displayed and persisted but are not applied to
gameplay by this menu implementation.

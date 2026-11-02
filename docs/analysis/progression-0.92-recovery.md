# 0.92.0 account achievements and rewards

Reviewed 2026-10-16 against EXE SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The [verification-needed](../verification-needed.md) own integrated validation. This
report distinguishes native data and behavior from the source rendering.

## Native catalogs

The hash-bound [extractor](../../scripts/extract-menu-progression.py) generates
[`progression.json`](../../crates/azeroth-survivors-re/assets/progression.json).
The menu build uses that asset and does not require the EXE. The
[curated definition evidence](evidence/0.92/progression-definitions.json)
retains record addresses, hashes, field sizes, consumer addresses and totals.

The native achievement constructor is `0x14542a930`–`0x14542edb2`. It builds
112-byte definitions with three owned strings, a kind at +72, kind-specific
payload, icon pointer/length at +88/+96, points at +104 and category at +108.
Four nine-entry loops generate zone, all-class zone, class victory and final
zone class achievements; later statements and two local tables add the
remaining entries. There are **66 achievements worth 1,365 points**:

| Category | Count | Points |
| --- | ---: | ---: |
| Zones | 18 | 355 |
| Classes | 20 | 390 |
| Collection | 7 | 155 |
| Feats | 9 | 245 |
| Lifetime | 12 | 220 |

The native Summary screen independently confirmed every total. Its empty
account has no earned achievements, while an isolated nine-piece gear fixture
shows Almost There progress 9/25, 9/100, 9/250 and 9/415. Reference pixels are
retained at `runtime/reference-captures/achievements-default.png`.

Reward definitions are **13 contiguous 120-byte records** at
`0x1468afa88`. Native key lookup `0x145444e70` independently returns those
exact record addresses. Each contains key/name/icon pairs, rank-cost pointer
and count, rank-description pointer and count, achievement gate, prerequisite
and a Perks/Companions category byte at +112. Six ordinary perks and seven
companion upgrades are recovered; costs and descriptions are per rank.

The tabard pointer table at `0x1468b26e8` covers IDs 90001–90024. The original
consumer's bit mask `0xfffc3f` excludes absent IDs 90007–90010, leaving **20
64-byte records**. Name/icon/zone pairs are at +0/+16/+32, item ID at +48,
display ID at +52 and cost at +56. Six battleground tabards are unlocked by
their zone achievement; fourteen other tabards cost account points.

The **12 companion appearances** occupy 96-byte records at `0x1468b16f8`:
key/name/model/icon/achievement pairs, then display ID, scale and creature ID.
`0x145444d50` resolves a saved appearance and checks its achievement gate,
falling back to Squirrel. Models are retained as data; this menu uses their
native icons and appearance selection, with gameplay followers outside scope.

## Rules and persistence

The progress consumer `0x145433830` dispatches through the original ten-entry
jump table at `0x1468b27bc`. It covers zone clears, all nine classes clearing a
zone, a class clearing any zone, a class clearing zone index 8, classes earning
all 51 talent points, collected gear count, best class legendary collection,
codex count, lifetime counters, and feats without partial progress. Codex
thresholds use a fixed denominator **140**, yielding 70 and 140 seen entries.
Lifetime fields are kills, gold, guardians, bosses, runs, wins and caches.
The native date formatter is `0x145432dc0`.

The account's earned key set determines available points. Reading partial
progress in a menu does not grant an achievement. `0x145430a40` sums every
owned perk rank cost and purchased tabard cost. Plan validator `0x145430c30`
rejects decreases below confirmed ownership, invalid ranks, newly purchased
locked upgrades, unmet prerequisites, excess spending and more purchased
instincts than companions. Instinct assignment follows catalog order.

Native reset `0x145445020` requires a nonempty perk allocation and fewer than
two used resets. It clears perks, increments the used counter, and retains
tabards. The sidebar states that two resets exist in this save. Reset is a
two-click action; its first click changes the label to Click again to reset.

Serializer `0x1453ff1b0` uses these account records:

```text
ach|achievement-key,achievement-key
achat|achievement-key=unix-seconds,...
stat|kills=N,gold=N,guardians=N,bosses=N,runs=N,wins=N,caches=N
perk|perk-key:rank,...
tabard|paid-item-id,...
pets|appearance-key,appearance-key
resets|used-count
beat|class-id|zone-key,...
look|class-id|18:tabard-item-id,...
```

The colon formatter at `0x146ab25d8` is used by perk rank serialization;
`0x146ab2e38` contains the equals formatter used for dates and stats. The
seven stat names are read through pointer/length arrays at `0x146ab2460` and
`0x146ab2498`. Source writes replace only Rewards-owned prefixes, preserving
unrelated records; tabard wear merges only native look slot 18.

## Implemented source and remaining verification

[`progression.rs`](../../crates/azeroth-survivors-re/src/progression.rs)
implements both account pages, Summary/category browsing, native totals and
partial progress, perk rank plans, Confirm/Undo, achievement/prerequisite/
budget/instinct gates, the two-reset limit, companion appearance choices,
tabard plans, wearing/removing tabards, and save persistence. Imported account
state refreshes the plan. The shared native Canvas and Armory header are reused.
`tabard_display_id()` exposes the catalog display ID for the hero preview's
native tabard lane.

The original accepted a sealed synthetic account with all 66 achievement keys,
rendered 1,365 points, and round-tripped confirmed purchases and appearances.
[Runtime proof](evidence/0.92/progression-runtime-proof.json) records the native
click sequence, saved records and capture hashes. Affordable tabard cards toggle
a pending purchase directly; Confirm commits it, and clicking an owned card
immediately wears it. Unaffordable cards have no action. Pending plans survive
picker/Achievements navigation and immediate companion appearance changes.
Native `pets` writes two slots. Both two-click resets were exercised, ending at
zero of two remaining while preserving tabards and pet appearances. The isolated
reference profile was restored through the original Saves menu to an empty
account and returned to the picker.

The source now follows those observed transitions. Perk cards use the native
two-column Grid and intrinsic text sizing, replacing character-count row-height
and indicator-position estimates. Wrapper `0x140188ab0` supplies minimum height
70, padding 10 horizontal/7 vertical, border 1, radius 6 and column gap 12;
`0x1402220b0` supplies the 44-pixel icon, 16-pixel name, 10-pixel rank circles,
content row gap 3, current description and separate next-rank description.
Native shared text includes black 0.85-alpha shadow offset (0, 1.5).

The score medallion uses the actual
`Interface/DialogFrame/UI-DialogBox-Gold-Dragon.blp`, mirrored, tinted alpha
0.85 and drawn as two 84-pixel images around the 128-pixel circle. Builder
`0x1401c3410` supplies border/shadow/gradient colors, 48-pixel score below 1,000
and 40 pixels otherwise, and 11-pixel sublabel. Earned cards render UTC dates
through the recovered day/month/year algorithm and localized month labels.
Small badge helper `0x14016fe30` supplies 44-pixel circle, 16-pixel number and
14-pixel GlowStar overlay for earned entries.

Validation: parent integrated builds 14 and 16 passed, and the integrated
binary harness passed all 13 tests, including the three focused Progression
checks (catalog totals, plan constraints, and preserving unrelated save records).
The next source checkpoint has been formatted and handed to the parent for
build 17. That integrated build passed in 24.72 seconds; rebuilt runtime
comparison remains incomplete.
No gameplay effects or complete menu parity are claimed.

The latest source checkpoint uses native bar helper `0x14016eb10`: a black
0.7-alpha clipped wrapper, border (0.30, 0.24, 0.13), stock
`Interface/PaperDollInfoFrame/UI-Character-Skills-Bar.blp`, partial tint
(1, 0.78, 0.30), complete tint (0.55, 1, 0.45). Its former gradient was a
provisional substitute and is removed. The medallion radial gradient uses a
center anchor, Y −15%, FarthestCorner and stops at 0% and 75%. Recent entries
sort stably by descending timestamp, then descending points. Almost There uses
native f32 fraction ordering, requires a numerator above zero and denominator
at least two, and omits its heading if empty. Earned cards omit partial bars.
Native perk icons use the frame and locked tint from `0x140188660`; plus/minus
controls use 17-pixel text and enabled border hover/lift 0.4 from `0x140186450`.

The build 20 checkpoint replaces fixed achievement-card row heights with the
native minimum 76, padding 10×8 and gap 12 wrapper and content column gap 3. Native unlock
rows include their exact 16-pixel icons, colors, spacing and ordering. The generator
now emits all 66 unlock vectors; each was compared with bounded execution of
`0x145444710`/`0x1454dd850`/`0x1454ebd30` and matched exactly. Perks appear first,
then free tabards, then companion appearances. A dependent perk sharing its
prerequisite's achievement gate is omitted from that achievement's reward list.
The free tabard gate is already a full achievement key such as `zone:wsg`; adding
another `zone:` prefix was a source defect and is fixed. A focused fixture test
covers every free native tabard gate.

The card's bronze gradient layer,50-pixel framed icon and earned/locked shadows,
44-pixel badge radial gradient and partial-progress count formatting are recovered
from native constructors. Summary uses the native right-pane padding 18×12 and gap 10,
small headings and two-column grids, replacing estimated section Y coordinates.
[Card, flow and unlock evidence](evidence/0.92/progression-card-flow-unlocks.json)
retains exact values, addresses, all 66 native vectors and verification limits.
`available_points(&Save)` exposes the existing native earned-minus-spent rule to
the shared Rewards tab caption. Source formatting passed; parent integrated
build 20 passed in 8m33s, with all 18 binary and 3 config tests passing, including the
new free-tabard gate fixture. No UI launch or
new capture was performed in this pass.

Checkpoint 21 applies the next constructor batch from
[category flow evidence](evidence/0.92/progression-category-flow.json). Summary
category rows use the native plain Pick+Interaction+Node bundle, zero padding,
gap 10, 32-pixel framed icon, 15-pixel name, 12-pixel count and 12-pixel bar; there is
no Hover/background component. Category view adds the native 13-pixel counts
header and 8-pixel bar, grid right padding 6, and 34-pixel bottom fade. Its scrolling
node is the native Column+ScrollPosition type. Parent integrated build 21 passed in 12.05s, and all 54 focused harness cases
passed. No new UI launch/capture was performed.

The next bounded trace binds the actual AchList wheel consumer `0x14018a920`
through its TypeId/query initializer and native system vtable. It sums Line
events at 40 pixels and Pixel events at 1 pixel, has no cursor-hover input, clamps
each list every frame using its measured content and inverse scale, restores the
cached position only for newly added components, and writes both the component
and persisted scroll value. Checkpoint 22 applies those rules. Existing page and
modal gates are preserved because external run-condition equivalence remains
unverified. [Wheel consumer evidence](evidence/0.92/progression-achlist-wheel.json)
contains the binding chain, literals, instruction anchors and closed REA IDs;
[bounded assembly](evidence/0.92/progression-achlist-wheel.asm) retains its complete
original instruction flow. Parent build 22 passed in 11.82s and all 26 binary tests passed;
no UI launch/capture was performed.

Checkpoint 23 introduces the [shared native scrollbar](native-scrollbar-0.92.md)
for both Options and Achievements. It targets the existing ScrollPosition,
replaces the separate Options drag approximation, and keeps scroll movement from
despawning the Progression root. Geometry, visibility, hover palette, track
centering and mouse drag math come from three closed native consumer scopes.
The owner wheel readers and scroll caches remain separate because their native
consumers differ. Formatting passed; parent build 23 is pending.

Remaining parity defects are explicit: rebuilt comparison of every account
page/state; native touch/input fallback and multiple-window selection; exact scrollbar scheduling
and external AchList run-condition equivalence; shared intrinsic Armory shell integration; companion Looks/title/slot
flow sizing; tabard intrinsic flow and hover; generic button hover styles; and
non-English layout verification. The isolated AchList wheel algorithm is recovered; its outer source modal
gating remains provisional until native run conditions are traced. The native category texture table
is recovered in [category evidence](evidence/0.92/progression-category-textures.json);
Collection/Feats source constants use native INV_Chest_Plate16 and
Ability_Warrior_SavageBlow textures. These are fidelity defects under the
project's hard rule, not accepted substitutes. The existing source is provisional
where listed.

Bounded static provenance is retained in
[catalog](evidence/0.92/progression-catalog-slices-provenance.json),
[UI](evidence/0.92/progression-ui-slices-provenance.json),
[consumer](evidence/0.92/progression-consumer-slices-provenance.json),
[rule](evidence/0.92/progression-rules-slices-provenance.json) and
[control](evidence/0.92/progression-control-slices-provenance.json) records.
Full raw slices, REA bundles and disposable disassembly stay in the checkout's
ignored `runtime/menu-recovery` directory. A large constructor analysis exceeded
the MCP response limit; its complete retained evidence was successfully read
from the exported bundle, rather than treating the transport error as missing
analysis.

Validation checkpoint: parent build22 passed11.82s and26 binary-rule cases passed. The wheel/cache corrections compile; no source app was launched. Shared scrollbar integration and native outer run-condition equivalence remain open.

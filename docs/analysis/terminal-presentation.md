# Terminal summary and talent presentation

This report uses installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/terminal-presentation/manifest.json) binds fresh
current owners, selected native instruction intervals and REA/Ghidra identities.
Existing canonical terminal root/content and account summary extracts are
referenced in place. Full raw decompilation and regeneration output stay ignored.

The source repair in `gameplay/terminal_view.rs` matches current u32 wrapping
arithmetic and exact f32 operation order in the XP animation. The rest of the summary/layout/parser/loot path
is revalidated here. This is static reconstruction, with compilation and
original/rebuilt rendering/gameplay parity unverified.

Equipment name/icon publication now reads the actual run's race instead of
editable frontend selection. `scripts/check-loot-race.py` executes 512
separate race/faction-ID cases (all 256 byte values with two synthetic ID
branches), reusing this report's canonical equipment-delivery extract. It stops
before metadata lookup and checks the HUD/summary source connections. The
original 1,371 projection/XP/color cases retain their separate scope/count.

## Summary projection and loot

Current payload `14594bf30` reads Game clock`+a34`, level`+4d8`, kills`+754`,
elites`+758`, guardians`+75c`, bosses`+760`, effective damage`+708`,
taken`+710`, gold`+764` and caches`+768`. The current root `140287980`
parses those fields; current content `140203a30` displays survived time, level,
kills, elites, guardians, bosses, damage dealt, damage taken, gold and caches
in that order. Scalar counters are decimal; the number helper `140285c50`
rounds damage before its saturating unsigned conversion and comma grouping.
Time uses nonnegative truncated seconds, unbounded minutes and two second digits.

The payload reads the retained hero name, class`+304`, race`+305` and selected
zone key. Current class/race lookup tables provide their native defaults and
localized names, and the zone resolver selects its localized name/default.
Source captures the selected run identity and localized catalog names; Again
uses the retained selection described by
[run construction](run-seed.md). Native `left` and terminal phase
separate Left, Defeat and Victory; Endless remains a victory-only visible action.
Current title/description, unlock line, stat grid and Again/Endless/Menu labels
are constructed by the same current content owner, rather than assumed from an
older release label.

The effective-damage producer is shared hit owner `145971490`. Its current
health writer and positive prior-health clamp are canonical in
[ward shared-hit evidence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.109.0/raid-wards/common-hit.asm).
Subsequent interpolation branches preserve that prior health before
`145971b66` selects `min(modifiedDamage,max(priorHealth,0))`, promotes to f64
and adds it to Game`+708`. Current payload reads that exact field. Source
`effective_damage()` returns the shared effective meter total. Damage taken
uses its separate post-absorb damage accumulator and is not replaced by outgoing
effective damage. Native meter cases include lethal overkill and already
nonpositive victim health.

The full current server tick moves/clears its pending u32 equipment queue,
visits it in order and resolves each item with `1459a4ba0`. Invalid metadata is
skipped. Valid-character ownership is a sorted set; insertion occurs for each
drop before the next record is examined. Repeated initially unowned drops are
therefore first-new, later-old. Sentinel GUID`ffffff` still compares ownership
but does not insert. Source keeps a separate ordered run history after draining
the account queue, and capture repeats those sequential newness rules from the
entry ownership snapshot. It filters unresolved item metadata and preserves
repetitions/order.

Current loot outer `140285760` counts boolean true `new` flags without
rendering deduplication, then item content `14020c180` visits every record.
The wrapping list has maximum width 500, row gap 6 and column gap 10. Each item
retains its 26×26 frame even when icon text/handle is absent, followed by its
name and optional `end.new` text. Rarity colors come from the current native
RGB tables. Icon/name/race metadata is owned by the current
[armory recovery](armory-pages.md), rather than substituted WoW defaults.

## Canvas and visual ownership

The current root is a 100% full-window blocking layer. Content constructs
Canvas 560×700 with maximum scale 1.3, centered panel padding 30/22 and gap 10,
a 46-point outcome title, 15-point identity line, optional XP/loot, the stat grid
and a horizontal action row with gap 12. The thirteen isolated initializer
vectors check the current outer/Canvas/panel, stat grid, actions, XP and loot
layout fields. Current native panel/button style constructors are independently
covered by [overlay style](overlay-style.md).

Terminal content calls queued bundle `1401de7c0`, whose apply/insert chain is
`1402789b0→14014a330→1402d9c80→14033f360`. The tuple type name at
`145df4923` and concrete component registrations identify exactly:

```
(bevy_ecs::hierarchy::ChildOf,
 (wenilla_rogue_app::screens::Canvas,
  bevy_ui::ui_node::Node, bevy_ui::ui_transform::UiTransform))
```

It contains the Canvas component whose current present-Canvas branch is covered
by [overlay Canvas recovery](overlay-canvas.md). It does not select the
separate no-Canvas fit mode merely because content has grown. This positively
establishes the applicable branch; arbitrary later dynamic/global component
mutation is outside the bounded typed census. Action query/component ownership
and the absence of an invented terminal hover painter are covered by
[terminal command flow](terminal-flow.md).

## Talent parser and animation

Current outer/parser `1400c4070`, positive-parts iterator `14012a2e0`, content
`140253f10` and updater `1400ceb20` were freshly decompiled and their original
Windows instructions inspected. The parser clamps numeric `xp`, `total` and
explicit `before` into u32. Without numeric `before`, previous XP is
`max(total-xp,0)`. The iterator clamps each part, discards zero/negative parts
and preserves remaining order/repetitions. Source's typed projection supplies
the same fields and positive-part filtering.

The display budget subtracts costs`80+15*earned` through 51 points, returning
`(51,0,0)` at cap. The XP panel has width 420, padding 14/10, gap 5, cyan border
and no external margin. Its header, hidden part rows, 14-pixel progress bar,
points footer and pop text retain the current constructor values. Reveal alpha
is `clamp((age-.35-index*.22)*4,0,1)` with cubic 12-pixel slide. Count delay is
`.35+positiveParts*.22+.2`; duration is
`min(.9+.45*pointDifference,3.2)`, followed by cubic easeout and f32 roundf.
Pop lifetime updates only when current points exceed the remembered maximum.
Alpha/scale, early 100% fill for .15 seconds after a point crossing, cap fill and
.45-second flash use the current native arithmetic.

The saved XP grant saturates at u32MAX, but summary JSON emits **full delta xp**
and **explicit old before** alongside the saturated total. The parser honors
that explicit before. Consequently overflow remains reachable: the updater's
`before+gained`, `before+counted`, after/before point difference and displayed
pop point difference wrap as u32. Source previously saturated the sums and used
ordinary subtraction. It now uses `wrapping_add`/`wrapping_sub` at all four
sites; the backend `TerminalSummary.total` correctly remains saturating. A
previous pop can survive a later wrapped count; the native last-points/pop-time
state and wrapping text difference are checked together. Row slide and pop
scale also preserve the native `(remaining³-1)+1` cancellation before their
12/.6 multiplication; simplifying that expression changes f32 rounding.

## Checks and boundaries

`python3 -B scripts/check-terminal-projection.py` checks current saved
XP/JSON projection, numeric parser, full positive-part iteration, all point-cost
boundaries through cap 51, wrapping count/duration, row reveal/slide,
last-points/pop-time/text lifetime, pop/flash/fill, rarity colors, effective
damage and all ten summary fields. The checker passes **1,371 native executions**: 30 saved-XP grants and 30 JSON
projections, 16 real part-iterator calls across 7 arrays, 605 numeric parser cases,
155 point-budget cases, 216 count cases including 72 wrapping inputs, 56 reveal
and 56 slide cases, 8 pop and 8 flash cases, 48 pop-state and 48 pop-text cases,
40 fill cases, 8 rarity cases, 40 effective-damage cases, 3 complete stat
projections and 4 color-constructor cases. Eleven color literal groups and all
8 rarity colors match the source f32 bits exactly. Representative vectors and
complete generated results stay under ignored `runtime/analysis/history/interface/terminal-flow/4e862d14c1ed/`.

`python3 -B scripts/check-terminal-layout.py --python-libs
runtime/tool-state/python/armory/python-libs` passes13 current initializer vectors.
Only four reviewed memcpy call sites are replaced with bounded scratch copies.
Projection checks substitute JSON property lookup with native enum-number
layouts and roundf with its stated f32 leaf model; empty-name part fixtures
execute the real iterator without an allocator. No serde decoder, UI query
scheduler, image/font loader, external native system, source compiler or game
executes. Row-slide and pop-scale comparisons require exact f32 bits. The other
noninteger display comparisons state their float tolerance; color literals and
constructor stores require exact native bits. Actual locale/font,
asset readiness, tiny/large windows, DPI/device rendering, input scheduling and
original/rebuilt gameplay/visual parity remain runtime checks.

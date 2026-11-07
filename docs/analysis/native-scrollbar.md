# Native scrollbar reconstruction

The verified 0.92 EXE defines the shared control used by Options and the
Achievements list. [Evidence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/progression-scrollbar-consumers.json)
records closed REA scopes, constructor/type metadata, system vtable associations,
constants, instruction anchors and limitations. No new UI process or capture was
used in this pass.

`0x14011eae0` constructs an eight-pixel track with a four-pixel radius and black
0.45-alpha background. Its child thumb is absolute, bordered by one pixel and
rounded by four pixels. The track has Interaction, FocusPolicy::Block and
Visibility. The thumb has Interaction and FocusPolicy::Block. Neither uses a
Button component.

`0x140129530` measures content and viewport in logical units. The track is Hidden
when overflow is at most one pixel; it retains its layout width. Thumb height is
`clamp(visible/max(content,1),0.08,1)*100%`. Thumb top is the remaining track
fraction multiplied by the clamped scroll fraction. The idle thumb is
(0.69,0.541,0.227); hovered or dragged it becomes (0.973,0.824,0.416).

`0x14012a3d0` begins a drag from a changed Pressed interaction. A thumb press keeps
the grab offset. A track press centers the thumb at the normalized cursor
position, clamps the result, then captures the new scroll position as the drag
origin. `0x140129e80` applies cursor displacement times the window scale factor,
divided by physical thumb travel, multiplied by maximum logical scroll. It
clamps the result and clears the drag on release or a missing target/track/window.

[`scrollbar.rs`](../../crates/azeroth-survivors-re/src/scrollbar.rs) implements the
proved mouse branch and is used by Options and Achievements. Each owner retains
its wheel reader and cached position. The separate Options ratio/drag state is
removed; Progression no longer rebuilds its entire root for scroll movement.
Two numeric fixture tests cover minimum ratio, visibility threshold, track
centering, preserved grab offset and window scale.

Source formatting and integrated build 23 passed (15.47 seconds). The parent
reported 35 binary, 15 native-save and 14 update integration harness cases passed
(64 cases including overlapping coverage); the binary harness includes both
scrollbar numeric fixtures. The initial Children iterator compile error was
corrected before that successful run. Rebuilt runtime comparison was not run. The native fallback input collection has not been typed,
so touch fallback is not invented. Multiple-window selection, exact native
schedule order and outer modal run conditions remain unverified. Source retains
the existing owner modal gates and Options local pixel scaling; those policies
are not asserted as independently verified by this scrollbar recovery.

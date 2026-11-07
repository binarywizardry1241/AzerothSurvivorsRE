# In-run talent viewer

The selected reference is `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`,
SHA-256 `8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the source implementation and bounded static recovery for
Gap #10. [verification-needed](../verification-needed.md) owns integrated status.

The current 0.115.0 full core patch now owns talent functions, counter
initialization and button layout before addons. Its
[lifetime follow-through](q41-framexml-lifetime.md) supersedes the late
installation/restoration adapter described below. This report preserves the
actual 0.105.0 native watcher/layout evidence and its limits.

## Native contracts and source connections

- **Opening:** the shipped Lua replaces `ToggleTalentFrame` with a string-counter
  increment and initializes `AZS_TALENT_TOGGLES` to `"0"`. It replaces
  `UpdateTalentButton`, shows the talent micro button regardless of the stock
  level restriction, and places it after the character button, with the world
  map button after it. The real FrameXML binding/button path continues to call
  this function. The adapter installs after FrameXML loads, and restores the
  stock functions and anchors when the custom run ends.
- **Counter observation:** native `1401317c0` ignores the first successful
  observation, compares later strings without parsing an increment count,
  toggles once on a changed string, and clears its observation outside a run.
  Missing globals leave the prior observation unchanged. The offline client
  implements this optional bridge with VM identity so a replacement VM establishes
  a new baseline. [Eleven original-instruction cases and exact Lua fragments](evidence/0.105.0/talent-view/input-vectors.json)
  bind this contract to the selected bytes; REA/Ghidra observation
  `ev_3935b31648697d72e6cecfa7bf22624a50939888b11095f63e26aa71b655476d`
  corroborates the owning function and Windows register arguments.
- **Run state:** entry retains the normalized allocation actually passed to
  `Mechanics::configure_effects`. The viewer reads that allocation and the live
  run's class, rather than constructing a new editable specification. Its open
  state participates in the existing pause/controller owner before mechanics
  ticking. The Close button and another talent toggle release that pause reason;
  other pause reasons continue to apply. Entry/logout clear the viewer, and
  opening clears its selected talent, matching `140130c52`–`140130c73`.
- **Screen:** native `1401308b0`, `1401a5a10` and `1401a5ce0` establish a black
  0.72-alpha full-screen cover at Z 5300, a 1600×860 canvas with maximum scale
  1.6, padding 40/20, a 42-pixel Talents heading, the class-colored subtitle and
  its muted hint, an 18-pixel Close label, and a growing three-tree/detail row.
  The source uses the existing per-root canvas fit rather than scaling rasterized
  glyphs. [Layout manifest](evidence/0.105.0/talent-view/layout-manifest.json)
  and [constructor vectors](evidence/0.105.0/talent-view/layout-vectors.json)
  retain selected ranges, instruction replay seams and limits.
- **Shared read-only trees:** `14012bb00` passes the read-only flag to the same
  tree/details consumers used by the Armory. The source shares catalog/art,
  prerequisite links, tree/grid geometry, rank prose and descriptions. Its
  read-only branch clears availability highlighting, retains the native
  learned/locked/selected colors, and attaches no learn/refund actions.
  The detail pane omits spec selection, Reset, Learn and Unlearn; it retains
  requirements and next-rank descriptions, displays points spent, and uses
  the recovered between-run editing guidance. Hover/pointer inspection retains
  the last selected talent until the next opening.
- **Input ownership:** a transparent real-VM guard captures mouse and wheel
  input beneath the custom Bevy overlay. The existing controller pause owner
  clears held movement/camera input. No second raw N handler or substitute
  stock `Talent.dbc` screen is introduced.

The implementation is in `src/gameplay/talent_view.rs`, the shared read-only
branches in `src/talents.rs`, and `src/gameplay/client/talent_view.rs`, relative
to `crates/azeroth-survivors-re`. Run input/pause integration is in
`src/gameplay/mod.rs`; the optional counter transport is in
`crates/benilla-app/src/local_client.rs` and `local_client/extension.rs`.

## Checks and remaining limits

`python3 scripts/recover-talent-view-input.py --check` replays eleven
unchanged native watcher cases, including first observation, unchanged/change,
multiple increments, length changes, missing globals and inactive reset. It
also verifies the current EXE hash and exact Lua fragments. The layout recovery
script replays constructors at typed UI boundaries and six read-only appearance
cases. These use explicit allocation, Lua getter, UI submission and localization
seams; they do not execute the game or a layout engine.

`lua scripts/check-talent-view-bridge.lua` now delegates to the current
[core/addon/publication lifetime regression](q41-framexml-lifetime.md).
It checks that publication preserves the core counter and later addon hooks,
visibility and anchors while retaining the pointer/wheel guard. The earlier
late-installation/stock-restoration adapter is removed.
Changed Rust source was parsed with the project rustfmt tool. Future Rust
counter/UiScript regressions were authored but **not run**. No compilation,
compiling tests, game launches or original/rebuilt comparisons were performed.

The viewer displays the source's actual run allocation and existing talent
catalog. That catalog retains its 0.100.1 provenance; the current Demonology
tree/migration remains Gap #12. This implementation does not relabel that data
as fully current. The nine class subtitle names/colors were independently
checked against the selected target's class descriptors.

Rendered layout, font shaping, touch behavior, keyboard/modal overlap and
original/rebuilt input/pause comparison remain unverified. The bounded native
constructors establish the Close button and toggle route; they do not establish
all global Escape arbitration. Existing FrameXML Escape behavior is preserved.
Gap #10 therefore retains its validation/parity limits.

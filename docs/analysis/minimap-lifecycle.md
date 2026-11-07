# Minimap requests across logout

Gap **#44**, selected EXE SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns the current status. This is a source
lifetime repair supported by current resource evidence; no game was launched.

The [retained reconstructed log](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/execheck-0.109.0.md#retained-reconstructed-launch-findings)
contains four missing tile filenames together immediately before the ChatFrame
and deferred-entity warnings. The current installed translation table maps them
to `Azeroth\map31_31.blp`, `map31_32`, `map32_31` and `map32_32`: the four tiles
around world origin. All four hashed BLPs are absent from every configured
archive, including case/separator variants. They are genuine absent resources,
not a failure to normalize `/`, letter case or the hash suffix.

## Source cause and correction

`player/wire_in.rs::release_on_session_end` resets the player to its default
inactive state and zero position when a logout or terminal disconnect arrives.
The `InWorld` exit and `ui_script::end_ui_session` run at the following state
transition. Until then the old `MinimapWidget` can still be present. Previously,
`minimap::emit_minimap` used that widget and the reset position without checking
`Player.active`. An outdoor view spanning zero therefore requested exactly
these four translation hits. This is a concrete reachable source defect; the
historical log has no stack or frame-state trace to prove its exact scheduling.

The renderer now resets its hover and interior-composite activity before any
early return, then returns while the player is inactive, before either outdoor
or interior tile lookup/load. `drive_composite` observes the cleared activity and
disables the old interior camera/tiles. This also avoids retaining an interior
target when the widget itself disappears. Active players keep the same lookup,
sampler and missing-resource error path. The existing serverless minimap probe
explicitly activates its player and remains admitted.

No asset fallback, archive substitution, fabricated tile or error suppression
was introduced. Missing resources requested by an active player still report
their actual failure.

## Static evidence and limits

`python3 -B scripts/check-minimap-lifecycle.py` checks the selected EXE
identity, all **eight full MPQ hashes**, the winning **8,401-entry** translation
table, four exact missing paths and a readable **256×256 Elwynn tile**. Its
independent bounded MPQ reader follows the registered patch order and refuses
changed archives or unsupported file forms. It checks the live source gate,
player reset and probe admission without executing Rust. The compact
[resource evidence](evidence/0.109.0/minimap-lifecycle.json) retains hashes and
results; extracted asset contents remain ignored under `runtime/`.

The changed renderer syntax-parses with the project rustfmt. These checks do
not compile or type-check Rust, reproduce the historical game session, exercise
GPU/terrain/input behavior, or establish original/rebuilt parity. Gap #44 keeps
those validation/comparison limits. No original release claim is upgraded by
this reconstruction defect repair.

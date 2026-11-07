# Character-pane Run Stats

The selected EXE (SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`)
embeds the complete character-pane extension at `146baffd0`, 8,584 bytes.
The [canonical Lua and manifest](evidence/run-stats/manifest.json)
retain its exact bytes, input fields and translatable literals.

## Connected source

`gameplay/client/run_stats.rs` installs that source through the real client VM's
post-FrameXML extension hook on each VM load, including ReloadUI. The explicit
registration on the existing PaperDollFrame accounts for its stock OnLoad having
already run before the postlude. It wraps the nine stock setters and the stock
OnEvent/OnLoad functions; the pet pane continues to use the stock setters.
The existing selected-target `AZS` publisher supplies all 42 required fields,
including actual equipped/temporary stats and worn-gear contributions.

The native source replaces twelve character-pane rows and hides the resistance
frame. Its 180px side panel contains ten unconditional rows and seven conditional
damage rows. Each conditional row is visible for any nonzero value; hidden rows
leave no vertical gap. The panel reuses seventeen row frames, with 156×13px rows,
14px spacing, and height `40 + 14*n`. Native hover/tooltips, signed percentages,
gear annotations and hidden-pane message handling are preserved. All 73 literal
translations match the current EXE's fourteen locale catalogs. Localization is
applied to the embedding's postlude when its selected language changes.

## Static checks and limits

- `python3 scripts/recover-run-stats.py --check`: full EXE hash, exact
  embedded source/manifest, all 42 live field producers and fourteen locale
  literal comparisons passed.
- `lua scripts/check-run-stats.lua`: the unchanged native Lua passed
  twelve stock rows, seventeen extra rows, conditional signs/layout/frame reuse,
  gear tooltips, player/pet routing, events and hidden-pane refresh cases against
  a narrow stub host.
- The five changed Rust modules were parsed with project-local rustfmt; no
  compilation was performed.

These checks establish embedded-source fidelity and the connected source path.
Compilation, the actual VM/load/event lifecycle, original/rebuilt input and
rendered/layout/font parity remain unverified under permanent gap **#20**.

# Run Options

Target: installed Windows EXE0.109.0, SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`. This report replaces historical0.92 assumptions for the current Run Options page, saved modifier words and numeric helpers. Gameplay consumers require their own current evidence.

## Data and input

The four48-byte descriptors at `0x14720bb88` contain the exact English translation keys, f32 weights and u16 minimum/maximum/step fields. Their current values are:

| Modifier | Minimum | Maximum | Step | Difficulty weight |
| --- | ---: | ---: | ---: | ---: |
| Enemy density |100 |500 |25 |0.05 |
| Enemy health |100 |500 |25 |0.4 |
| Enemy damage |100 |300 |10 |0.6 |
| Enemy speed |100 |150 |5 |2 |

`0x14590e190` calls the current CSV/u16 parser, filters malformed tokens, requires exactly four remaining valid u16 values and otherwise falls back to `[100;4]`. A leading plus is accepted. Empty tokens, negatives, non-ASCII digits, whitespace-containing tokens and u16 overflow are skipped; extra valid values fail the four-value requirement. For example, `500,bad,500,300,150` retains the four valid values, while `500,500,300,150,100` resets to defaults. Successful values clamp to the descriptor bounds and round down to the step relative to100. `RunMods::parse_csv` now shares this filtering and normalization policy with the typed Pick parser.

`0x14590e420` consumes the direction's sign, changes by the descriptor step and clamps. `RunMods::adjust` now centralizes this operation. The current input owner `0x1401cac30` processes every pressed row before comparing the final four words at `0x1401cb1ab`, then queues one changed Pick command through `0x1401838a0`. Menu input now uses the same final comparison: Reset and modifier presses produce one persistence update when the final state differs, including no write when opposing presses cancel. The modal's Done/close action and the shared Pick save operation remain in their existing menu lifecycle.

## Numeric rules and presentation

The uncapped helper `0x14590e3c0` evaluates the f32 expression with native addition order:

```text
hp      = ((health -100) /100) *0.4
density = ((density-100) /100) *0.05
damage  = ((damage -100) /100) *0.6
speed   = ((speed  -100) /100) *2
difficulty = (((hp + density) + damage) + speed) +1
reward = min(difficulty,2)
```

`0x14590e4a0` implements the capped reward. The source `run_mods` helper matches both bit for bit across the retained625-case grid. The summary displays two decimals; at uncapped difficulty≥2 it uses the translated `{mods} (max)` template. Its baseline is muted and its increased value is green.

Current canvas `0x140267da0` reads760×560 design dimensions at `0x145deb740` and max scale1.4. Frame/page/row/summary owners are retained in the [manifest](evidence/runmods/manifest.json). Typed native submissions confirm padding36 horizontal/24 vertical, gap14, title34, description14; row gap12 with18/12 labels,84px percentage box and24px value; summary16/26 and footer gap16. The row and summary widths, label minimum width and spacer minimum height are Auto. The source removes the provisional forced widths/minimums and rebuilds when the locale catalog changes. Row descriptions now translate the complete `{what} · {min}% to {max}%` template as the current owner does.

The shared panel painter is already retained by [overlay-style evidence](evidence/overlay-style/manifest.json); this scope references it instead of duplicating its native range. Native constructors and typed layout capture establish the submitted values, not rendered visual parity.

## Evidence and checks

`python3 -B scripts/recover-runmods.py --check` verifies121 native CSV/normalization cases,625 uncapped/capped formula pairs and140 sign-step/clamp cases. The actual current CSV splitter/u16 parser and arithmetic execute unchanged in Unicorn. Only allocation/free, memcpy/memcmp and RawVec growth use declared scratch-memory seams. The manifest binds15 native ranges,192 descriptor bytes and nine REA/Ghidra queries to this EXE. Curated [native vectors](evidence/runmods/native-vectors.json) are also consumed by unrun Rust regression tests.

`python3 -B scripts/check-runmods-layout.py` replays the current canvas/page/row/summary submissions and compares one canvas,19 Nodes and16 text records with [layout.json](evidence/runmods/layout.json). Font, asset, localization, generic button and constructor callback boundaries are explicit seams. The generic Node schema is reused only after checking the current constructor stores. ECS input iteration and queued command delivery are statically traced, not emulated as a full Bevy schedule.

Rustfmt parsed the four changed Rust files without writing or compiling. No build, Rust tests, application/game launch, installed save/configuration write, audio device or original/rebuilt comparison was performed. Current gameplay difficulty, spawn/stat scaling and reward consumption are separate obligations; this page recovery alone does not establish them.

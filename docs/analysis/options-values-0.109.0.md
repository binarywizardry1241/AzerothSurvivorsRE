# Options numeric writes and dependency refresh — 0.109.0

Target SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the numeric-write, cached-inventory and display-owner repairs
within **#17**. [verification-needed](../verification-needed.md) owns the complete gap.

## Native contracts and source corrections

The current number helper `14001c700..14001c927` formats **two fractional
digits**, trims trailing zeroes/the point and converts the remaining `-0` to
`0`. The previous source formatted four digits and retained negative zero.
Examples from unchanged native execution are `1234.56789f32 → 1234.57`,
`0.0001f32 → 0` and `-0f32 → 0`. Exact f32 inputs and results are retained in
the [vectors](evidence/0.109.0/options-values/native-vectors.json).

The current [write dispatcher](evidence/0.109.0/options/write.asm), already
retained under the descriptor recovery, uses that helper for linked writes.
Brightness separately parses the displayed string, computes `1 - display` in
f32 and formats **six fractional digits**: `0.36 → 0.640000`,
`0.3333333 → 0.666667`. A slider first emits its two-place display string;
source pointer/device inputs now preserve this ordering before inversion.
`options.rs::number_string` and `slider_string` feed the actual existing
`OptionsState::set`, registry queue and callback/save lifecycle.

The menu also previously wrote its displayed `gxWindow`/`gxVSync` values
straight onto the Window after connecting to the real engine. Those displayed
values include pending latched values. The two current 88-byte registered
records at `145ffe198`/`145ffe140` both set their latch byte at **+80**. The
ordinary registry, `RestartGx` commit and `video` consumer own applied display
state and platform presentation. `apply_window` now stops its standalone
fallback when `engine_connected`; it cannot bypass those owners through a
staged menu snapshot. This does not certify every native video/platform policy.

Current world input `140027ba0` retains a definitions cache only when it already
exists and the queued-operation vector is empty. Its canonical assembly remains
in [options-events.asm](evidence/0.109.0/in-run-bindings/options-events.asm).
Source now marks a batched inventory refresh for control writes, binding edits
and accepted button commands, including page switches. The existing rebuild
refreshes Saves/AddOns once for that input batch. Hover/scale-only painting
does not introduce another filesystem poll, and captured import bytes survive
the refresh. Close/import behavior has its separate owning Saves report.

## Static checks and limits

`python3 -B scripts/recover-options-values.py --check` passes **25
native number-format cases and ten native brightness cases**, source consumer
guards and exact current latch records. It executes the real native Rust
formatting, float parsing, binary/decimal conversion and rounding instructions.
Scratch allocation/free and CRT memory routines are explicit host seams; gamma
stops before the first registry call. No synthetic formatter-result seam is
used. The [manifest](evidence/0.109.0/options-values/manifest.json) records all
admitted native byte ranges and scoped Ghidra identity.

Authored Rust regressions consume the native number vectors, check pointer/
device brightness conversion and ensure embedded display state cannot be
overridden by staged menu values. They were **not compiled or run**. Compilation,
actual CVar restart/save, inventory interaction, rendering/platform behavior and
original/rebuilt parity remain unverified. Existing globals/bindings and other
Options contracts keep their actual owning target provenance.

# 0.92.0 picker ability tooltip text

Recovered 2026-10-16 from SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The active scope is main-menu text, without gameplay implementation.

The native lookup `0x1453e2530` walks 111 contiguous 120-byte definitions at
`0x1466d5b20`. The nine class spell pools use 101 of these definitions.
`0x1453dddd0` is the localized **name** getter; it builds
`ability.{key}.name` and falls back to the record's native name. There are no
`ability.{key}.desc` keys in this target's locale tables. The earlier empty
source description fields consequently did not represent recovered content.

Picker helper `0x140116ca0` creates a default AbilityInstance, obtains
level-zero class stats through `0x145493f50`, creates the school/cooldown
subtitle, and invokes description trampoline `0x1454cc0b0` → `0x14540bb90`.
The latter uses twelve category branches, key-specific passive descriptions
through `0x1454ac8a0`, and appended status/healing/shield descriptions.
Power, cooldown and durations use the native float 1.4 at `0x1458a85a4`.
For example Cleave's record power 47 and cooldown 1.5 become **66 damage**
and **2.1 sec**, independently observed in the original application.

The native number helper `0x1454117e0` uses one decimal below 9.95 and removes
trailing `.0`; values at or above 9.95 use zero decimals. The subtitle uses
its separate fractional-threshold rule. PE import names verify the called
`truncf`, `roundf`, `ceilf` and `log1pf` math boundaries.

[extract-menu-ability-tooltips.py historical recipe](../SCRIPTS.md#historical-execution-sources) reuses the
reviewed emulation primitives preceding the Codex extractor's catalog loop.
It executes the exact native menu formatter and listed helper bytes inside
project-local Unicorn. Allocations, String operations, English locale misses,
formatting and named math primitives are explicitly intercepted; unexpected
external calls fail closed. It cannot call the operating system or network.
The source does not depend on Unicorn or the reference EXE.

The generated [expression asset](../../crates/azeroth-survivors-re/assets/ability-tooltips.json)
retains each native localization template, nested token value and exact
concatenation. No alphabetic display text remains as a raw literal. Every
expression renders back to its native emulated English output, and every
referenced template exists in all ten recovered locale maps. These are data
and reconstruction checks, not proof of all-language visual parity.

[`ability_tooltip::picker`](../../crates/azeroth-survivors-re/src/ability_tooltip.rs)
returns the title, subtitle and body as the parent's shared NativeTooltip.
The optional starting annotation uses native key `picker.starting_spell`.
The parent owns generic tooltip placement, icon interaction and integrated
application validation.

[Curated provenance](evidence/0.92/ability-tooltip-native-format.json)
records byte hashes, menu definition locations, intercepted boundaries and
validation. Raw REA scopes, disassembly, full expression input traces and
isolated emulation output remain under ignored `runtime/menu-recovery`.

Current limits: Cleave is independently checked in the original runtime;
additional original hover samples and rebuilt rendering comparisons remain
pending. The 101 recovered outputs are derived native-execution evidence,
not 101 independent runtime observations. No complete menu parity or
upgraded gameplay spell behavior is claimed.

## Spell-pool icon hover

[The icon evidence](evidence/0.92/menu-ability-icon-hover.json) binds the class
spell loop's entity tuple to `picker::Hover`, `UiTransform` and `SpellInfo`.
Its 44-byte Hover contains a resting Color, active Color, and one-pixel lift.
Starting spells rest at gold (0.973, 0.824, 0.416), other spells at LinearRgba
black; both hover at pale gold (1, 0.914, 0.659). The native ImageNode tint is
(0.74, 0.72, 0.68). No additional scale or image-tint mutation is established
by this scope. The separate identity starting-spell icon requires its own
constructor check. The parent's shared hover system owns source integration.

Two proposed candidate systems were disproved: `0x140128fe0` handles name
entry, backspace and letter filtering; `0x140125970` writes a time-based
Node.left animation. Neither supplies the spell hover behavior.

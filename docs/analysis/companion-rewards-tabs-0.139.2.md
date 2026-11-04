# Companion Rewards tabs in 0.139.2

The inspected target was `installed-game/AzerothSurvivors.exe`, version
0.139.2, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
This is the bounded [#130](../verification-needed.md#gap-130) contract for
0.129.0 claims `bcda3181863edfed` and `4c2833b00ecf4764`, and the companion
constituent of summary claim `0df348cf541bc2e4`.

## Rendering and input

- Rewards renderer `1403bfe20` builds a full-width, center-aligned row with
  12 px horizontal gaps. `1403bcf50` puts Companion Perks on the left and
  Companions on the right, around a growing 22 px section heading labeled
  Companions. Both controls call `140068f30`, the 14 px control with 10 × 5 px
  padding also used by the slot headers. The controls emit action tag 10 with
  payload 0 or 1. The pressed-action jump table at `146508700` maps tag 10 to
  `14008e7fc`. After the common reset-confirmation dismissal, this case
  writes the change tick and `view+0x8c` before resuming the action iterator.
  It preserves pending purchases, worn looks and both scroll entries.
- The branch at `1403c04cf` reads that same byte. Zero constructs the
  `rewards-companion-perks` retained list using the 23 bytes at `1465667a7`.
  Its child at `14032a930` puts the explanatory copy before the category-1
  perk cards inside the scroller. Mode 1 calls `14006b8f0`, which places the
  slot controls and their hint above the independent `rewards-companion-looks`
  list. The looks scroll key is at `14656681c`. Both scrolling bodies use an
  8 px row gap.
- `145dc0ed0` counts the nonzero ranks of the `companion` and `second` perks
  from the active plan. `14006b977..14006b984` floors that count at one for
  the looks pane. The header at `1403c0830` uses “Your companion” for one
  slot and “First companion” and “Second companion” for two. The looks pane
  clamps the selected slot to that display range at `14006bbc4..14006bbda`.
- `1403c0cc0` visits all 26 descriptors from `146563970` with 0x60-byte
  stride and terminal offset 0x9c0. Achievement admission controls the
  action and caption while the card remains visible. At `1403c1917`, an
  admitted card emits tag 11 with the clamped slot and its look key.
  `14008e264` reads the slot from the action. `14008eaa3..14008eb00` updates
  that slot in the two-slot clone. Carrying the slot on the rebuilt card
  keeps the click aligned with the visible selection if a pending
  second-slot perk is undone.

The rebuilt [Rewards pane](../../crates/azeroth-survivors-re/src/progression/rewards.rs)
reuses the shared named-scroll implementation for both lists. The
[progression action dispatcher](../../crates/azeroth-survivors-re/src/progression.rs)
updates only the subtab selection for tag-equivalent clicks after the shared
reset-confirmation handling. Explicit look clicks retain their existing save
and publication path. The first mode is the source default and represents
the native zero branch.

## Static evidence

Four journaled Ghidra decompilations used the original PE bytes in
`[1403bcf50, 1403c205f)`, file offsets `[0x3bc350, 0x3c145f)`,
slice SHA-256 `7601ead3018a07bd0405574c893e57e553dc0eba52daf9e12e26f92991865445`.
The raw slice uses the original virtual addresses. Windows x64 operands,
callee arguments and branches were checked against original PE instructions
because raw-slice decompilation lacks external callees and data.

| Function | REA evidence ID |
| --- | --- |
| `1403bcf50` | `ev_210efa89a06e9902c0c0c5ca1c9d3daa38f2e05697593ba8e0506a58634532cd` |
| `1403bfe20` | `ev_87e2ea7c0c455d22caeddaaf5e29d84c2434f8e814bca93bdc33b816803386be` |
| `1403c0830` | `ev_4b74443e348369f5a539a391046e7426b698c29a141d12b8029e74b1a6efa7c5` |
| `1403c0cc0` | `ev_8743638bdb15886b886703d545e3c4526ed0fdedd4f64968cbea2daaf07c7f7a` |

Static checks verified all four result digests against the journal and raw
slice. All 26 source companion records matched the current table order and
its key, name, model, icon, achievement, display, scale and creature fields.
The companion table `[146563970, 146564330)` has SHA-256
`2213d4a43327afc5fd7f547bb7bd87551eae19e09bfad53319ce3b9d9398816e`.
All fourteen Companion Perks labels matched their hash-checked embedded
locale JSON payloads. The existing Companions translations also matched.
Both changed Rust files passed syntax parsing and their diff passed
whitespace review. Compilation, rendered tab switching and scroll restoration,
save behavior and original/rebuilt parity remain unverified.

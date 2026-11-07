# Ordinary projectile timing

[Finding #322](../verification-needed.md#gap-322) binds the ordinary delayed
projectile path to the installed EXE SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.

The target loop at `0x145f55380` converts the zero-based index to f32. It
uses `index * 0.12` when the ability's cast kind at `+0x75` is 1 and passes
zero otherwise. The f32 at `0x1465660f0` is `0x3df5c28f`. The 115 ordinary
ability rows select Holy Shock, Arcane Missiles, Fire Blast, Searing Pain and
Penance for this kind. The cast passes the stagger separately from power and
status at `0x145f55538..0x145f55550`. The producer adds stagger to the current
run clock at `0x145f5ded4`, then adds that sum to the travel time at
`0x145f5dedc` before storing the pending deadline at `0x145f5df5c`.

The [ordinary dispatch](../../crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs)
uses the final selected target order, including repeated targets, and the
[projectile producer](../../crates/azeroth-survivors-re/src/player_abilities/behavior/execution.rs)
uses the recovered deadline expression. Kind 6 continues to supply zero
stagger through its separate periodic cast route.

| Preferred VA range | SHA-256 |
| --- | --- |
| `0x145f55380..0x145f553c9` | `69a86367cd16f63a6b2cc391bf9b468e88285152b89f7ac5519254705d4265cf` |
| `0x145f55520..0x145f55555` | `71d9e130912e51971f47a6cb374b5581831e02182ddcef29e2af87572fb48dbb` |
| `0x145f5ded4..0x145f5dee1` | `373affb116bf26322f19069b2dd1ba13f0a74ef484ddf05e87288c7acfd20e59` |

Isolated original-instruction replay matched 252 cases across three cast
kinds, seven target indices, three clocks and four travel times. At kind 1,
index 1, clock 4096 and travel 0.2, the original deadline bits are
`0x45800290`. The former addition order yields `0x4580028f` even with the
stagger supplied. Pinned rustfmt parsed both Rust files. Actual projectile
impact timing, compilation, and original/rebuilt comparison remain open.

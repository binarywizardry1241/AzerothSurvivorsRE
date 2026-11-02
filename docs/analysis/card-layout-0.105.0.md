# Reward and upgrade card sizing and font — 0.105.0

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [manifest](evidence/0.105.0/card-layout/manifest.json) binds current native
owners, selected instruction ranges, constants and REA/Ghidra IDs.
[verification-needed](../verification-needed.md) owns current implementation and validation.
This recovery covers the shared reward/upgrade card renderer.

## Native contract and source correction

The selected EXE uses **width 252px, height Auto, minimum height 388px**.
It does not impose an unconditional fixed card height. Current native Node
serialization independently binds `width` to offset 136, `height` to 144,
`min_height` to 160 and `margin` to 184. These are not assumed from an older
EXE's Rust layout. The [dimension reads](evidence/0.105.0/card-layout/node-dimensions.asm)
and [margin read](evidence/0.105.0/card-layout/node-margin.asm) pair offsets with
the selected target's field names. The
[card constructor](evidence/0.105.0/card-layout/card-frame.asm) writes `Px(252)`
and `Px(388)` to width and minimum height, leaving height Auto.

The [footer constructor](evidence/0.105.0/card-layout/card-footer.asm) sets
**margin-top Auto**, width 100%, horizontal padding 10px and vertical padding
9px. Its actual Node starts at `RBP+0x5b8`; the explicit zero tag written at
`0x1401bf040` is at Node+200, the top member of its margin. Adjacent default
margin members are `Px(0)`. Auto top margin consumes spare space in the column,
keeping short cards' notes at the bottom while allowing long content to grow.
The source omitted this margin, leaving the note immediately after its description
and unused space below. `card_tile` now sets `UiRect::top(Val::Auto)` on the
shared footer, including replacement items.

Card names use **the same ordinary font handle as the card body**, at 21px.
The [tile forwarding](evidence/0.105.0/card-layout/card-font-forward.asm)
passes that handle into content capture slot zero. Content
[loads it into RDI](evidence/0.105.0/card-layout/card-font-load.asm)
at `0x1401bd2ff`, retains it across the content constructors and
[clones it for the name](evidence/0.105.0/card-layout/card-name-font.asm).
Both handle representations converge on font storage at `RBP+0x768`, followed
by font size 21 at `RBP+0x780`. The reconstruction instead selected
`art.heading_font` for names, loading Morpheus through the existing provider.
It now selects `art.font`, as the description and annotations already do.
The overlay's large heading keeps its separate heading font. Exact font bytes
and glyph coverage still depend on compatible user-supplied fonts; this pass
does not revalidate registration, augmentation or fallback for every locale.

Both corrections use the live shared `card_tile` path in
`crates/azeroth-survivors-re/src/gameplay/native_overlays.rs`, covering spell
offers, jewelry, amulets and gold. The existing minimum height is retained.
The earlier snapshot's fixed-height claim is superseded by the current typed
native stores. No unsupported maximum-height or clipping rule was added.

## Description font and size regression

The live description spans had a separate defect from the corrected card-name
font. Bevy 0.18.1 gives each `TextSpan` its own required `TextFont`; it does not
inherit its parent's face or size. The source supplied only span text/color,
so the enabled Bevy default supplied 20px Fira Mono instead of the game font.
Larger, differently shaped glyphs also change wrapping and the content-derived
height. A correct 252px width/minimum-height constructor alone cannot prevent
that layout difference.

The current [span/font contracts](evidence/0.105.0/card-layout/span-fonts.json)
bind two additional Ghidra owners and original PE instructions. Content
`1401bed77..1401beec9` independently emits a nonempty plain description at
**14px**, then iterates upgrade lines through `140122720`. This is not an
either/or branch. That helper and its span constructor `1401c73c0` clone the
supplied ordinary font at **15px** for every segment. Numeric segments use
RGB `(0.302, 1, 0.416)`; other text uses `(0.949, 0.902, 0.788)`, independently
of card rarity. Original native instructions establish both handle variants,
font sizes and colors; generic raw-import pseudocode alone does not establish
Windows arguments.

The shared renderer now keeps those two content lanes, their distinct sizes
and the native colors. Every upgrade-line span receives the same explicit
font as its parent. Replacement-tooltip spans also explicitly retain their
existing 15px parent font. Card names remain 21px in the ordinary font, and
the native width 252px, height Auto and minimum height 388px remain intact.
Long content can still grow a card as in the selected target; an unconditional
388px clamp would discard that contract.

`python3 -B scripts/check-card-text-style.py` passes the four existing
native geometry/name-font cases and four additional span cases (both handle
representations, ordinary/numeric text), and checks the actual source lanes
and explicit span fonts. The new cases execute the unchanged span constructor
and stop before its first ECS spawn call. They do not invoke any target callee,
allocator, OS, application or renderer. The checker rehashes the latest target
and curated instruction ranges. Compilation and displayed/wrapping parity
remain unverified for this source repair.

## Evidence and validation

Fresh Ghidra analysis used `./scripts/rea` through the project batch runner for
the current tile (`0x14011d220`), content (`0x1401bcfe0`), layout
(`0x1401c02d0`) and Node serializer (`0x142644fa0`). Raw imports bind exact
function bytes; original PE instructions and data bind external references.
The raw-import generic ABI and omitted callees are not Windows argument or UI
execution evidence. Full disposable responses remain in runtime; only necessary
instruction extracts are retained here.

Four [unchanged-instruction vectors](evidence/0.105.0/card-layout/instruction-vectors.json)
passed with Unicorn 2.1.4: card width/height/minimum, footer margin/padding,
and name font/size for both native handle representations. The harness supplies
the selected slices' input registers, stubs an unrelated title-string clone,
copies bytes at native memcpy calls and stops before ECS spawning. It does not
execute the application, Bevy layout or renderer. The changed Rust module
passed rustfmt's syntax/format check with child traversal disabled. No compiler,
build, compiler-based test or game launch was run for this change.

**The source mismatches are corrected; displayed height/font parity remains
unverified.** A controlled original/rebuilt comparison must check short and long
spell/jewelry names and descriptions, replacement/empowerment notes and localized
wrapping at the same resolution and scale. No current rebuilt executable was
produced, so earlier captures cannot validate this source change.

## Reproduction

The archived helper verifies the complete selected EXE hash, never executes it
and invokes no compiler. Inspect its source and review prepared plans from the
repository root:

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/native_card_layout.py --sha256 dd80c84cd14edc14ac4200d5c998d73d14bf5c94b5bec108c54c11ecd08eff8e
python3 scripts/rea-batch.py runtime/card-layout-0.105.0/card-tile-plan.json
python3 scripts/rea-batch.py runtime/card-layout-0.105.0/card-content-plan.json
python3 scripts/rea-batch.py runtime/card-layout-0.105.0/cards-layout-plan.json
python3 scripts/rea-batch.py runtime/card-layout-0.105.0/node-reflection-plan.json
```

Replaying the archived vector harness requires Unicorn; source inspection does
not execute it. An existing project-local dependency directory can be supplied
with `PYTHONPATH`. Plans,
raw slices and sessions stay under `runtime/card-layout-0.105.0`. Review output
under `runtime/native-evidence/0.105.0/card-layout` before promoting it. Completed
matching Ghidra sessions can be reused without repeating analysis.

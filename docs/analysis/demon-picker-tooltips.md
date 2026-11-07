# Demon picker tooltip text

Selected EXE SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This is a bounded #24 presentation/#17 menu dependency repair. It changes one
Azeroth Survivors expression consumed by the existing picker tooltip path;
it adds no engine, rendering, input, font or platform implementation.

Demonic Empowerment's historical picker expression said **22 sec cooldown**.
The current native picker emits **22.4 sec cooldown**. Its descriptor's raw
cooldown/duration are 16/8, while the actual level-zero constructor and initial
AbilityInstance apply the current 1.4 scale. The emitted body still says **40%**
for **11 sec**. Raw descriptor numbers alone would therefore have produced an
incorrect correction.

`ability_tooltip.rs::entries()` now composes the historical expression corpus
with the single current row in
[ability-tooltip-delta-0.112.0.json](../../crates/azeroth-survivors-re/assets/ability-tooltip-delta-0.112.0.json).
`ability_tooltip::picker` renders that row through the existing locale/template
and `NativeTooltip` APIs. The real `picker.rs` spell-pool constructor attaches
the result to its existing icon interaction tuple. The historical base asset
and unrelated tooltip expressions retain their original provenance.

The current custom wrapper `140040d90..14004127b` is bound by its
[Ghidra output](evidence/demon-picker-tooltips/picker.c) and
[identity](evidence/demon-picker-tooltips/rea.json).
The two actual picker callers at `140293359` and `1402a2d04` pass class/key
inputs and the optional annotation to this wrapper; their compact
[call fragments](evidence/demon-picker-tooltips/callers.asm) retain the
original registers and instructions. Current descriptor lookup, real level-zero
class stats, default instance, school/name/subtitle and description dispatch
execute in the bounded check. The raw-carrier decompiler has incomplete external
data/ABI context; original Win64 instructions govern these interpretations.

The checked spell set covers the directly related demon consumers recovered in
#24: Empowerment, Death Coil, Hellfire, Corruption, Curse of Agony, Immolate and
Drain Life. It includes the Succubus kill-coil identity, Infernal spell metadata
and Felhunter/Soul Reaping damage-over-time metadata. The other six subtitles
and all seven bodies already match the current native output and require no
source text change. Summon-talent definitions and rank descriptions retain their
canonical [Warlock talent proof](warlock-talents.md); this repair does not
duplicate those definitions or expand into unrelated picker behavior.

`python3 -B scripts/check-demon-picker-tooltips.py` passes **98 original
instruction cases**: all seven keys in all fourteen current embedded locales.
It compares emitted localized names, subtitles and bodies to the live composed
source expressions, verifies the actual class pool, descriptor/code/caller and
artifact hashes, and traces the live source consumer. The
[compact cases](evidence/demon-picker-tooltips/data.json) retain the exact
outputs. Existing allocation, byte, locale, String and Rust-format fixture
services and imported truncf/roundf are explicit host seams. No inherited engine
implementation is recovered or replaced by this change.

Source/JSON/Python syntax and scoped whitespace checks pass. No Rust compilation,
compiling test, game, actual tooltip input/rendering, file operation or
original/rebuilt runtime/parity comparison ran.

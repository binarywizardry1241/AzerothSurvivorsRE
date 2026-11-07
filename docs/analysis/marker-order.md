# Boss marker draw order

Selected installed EXE: **0.117.0**, 145,283,072 bytes, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
This report owns the source/static repair of **#111**. The
[manifest](evidence/marker-order/manifest.json) binds exact native owners,
selected instruction extracts, journaled Ghidra receipts and replay results.
[verification-needed](../verification-needed.md) owns current implementation limits.

## Recovered submission contract

The current marker draw owner `[0x14014a830,0x14014ba18)` visits ordinary body
groups, current fills and outline groups in that order. All three call the same
group helper `[0x1401371a0,0x140137666)`. After style/admission/color evaluation,
that helper constructs the two alpha/additive submissions through
`0x141807840`. Its instruction at `0x140137519` loads the packed word
`0x000080004636b000`: **f32 sort bias 11692.0**, followed by **i32 raster bias
32768**. Slope and the three following flag bytes are zero.

The projected ground-spell producer `[0x14179dbd0,0x14179f9f1)` instead loads
`0x0000800046000000` at `0x14179f87e`: **8192.0 / 32768**, also with zero slope
and flags. It calls the same commit core, `0x141807670`, directly at
`0x14179f8cc`. The marker wrapper copies a 0x90-byte spec, then calls that core
with triangle topology. The core independently reads spec offsets `+0x78`
(sort float), `+0x7c` (raster integer) and `+0x80` (slope float), preserving them
in the appended draw record. Sort priority and raster depth bias are separate.

Tower columns use a separate construction in the marker draw owner. Their
sort/raster pair remains **8192.0 / 0**, with zero slope and flag bytes. The
ground correction does not change that constructor.

| Submission | Sort bias | Raster bias |
| --- | ---: | ---: |
| Marker body, fill and outline, alpha/additive | 11692 | 32768 |
| Projected spell ground effects | 8192 | 32768 |
| Marker tower columns | 8192 | 0 |

## Live source correction

[`gameplay::raid_markers::present`](../../crates/azeroth-survivors-re/src/gameplay/raid_markers.rs)
previously submitted ground groups with sort bias **-48000**. It now uses the
recovered **11692**, retaining the native body/fill/outline sequence and the
separate tower settings. No shared engine rendering policy is changed.

The existing effect queue in
[`particles::render`](../../crates/benilla-world/src/particles/render.rs) sorts
by anchor view distance plus bias; positive bias draws later. Its depth test
and raster state are independent. The existing
[`ground_fx`](../../crates/benilla-world/src/ground_fx.rs) producer uses
`Rung::GROUND_FX = 8192` and `Rung::DECAL_RASTER = 32768`. Equal-anchor ground
markers therefore have the target's **3500** sort-key increment over those
spell quads instead of the previous negative priority.

The source routes Consecration **26573**, Frost Trap **13810** and Hurricane
**16914** through ability ground-object creation, `RunEvent::Ground`, dynamic
objects, `dest_fx` area models and the shared ground-effect projector. Model
parts can also use ordinary mesh/particle/ribbon paths; this trace does not
claim asset-by-asset or rendered overlap parity.

## Static verification and limits

Run `python3 -B scripts/check-marker-order.py` with the existing optional
Capstone/Unicorn dependencies. It verifies the selected EXE hash, declared
owner extents, current instruction/data bytes, canonical extracts and live
source consumers, then executes **720 complete native group-helper profiles**.
These cover six styles, occupied/unoccupied and fading/active states, three
burst values, positive/zero/negative gains and empty/nonempty geometry.
**192 submissions** carry the exact recovered ground fields; **600 profiles**
submit nothing, including **360 empty-geometry profiles**. Nine separate
native tower-constructor cases preserve 8192/0. No color/paint arithmetic is
reimplemented in Python.

Inputs and output vectors use synthetic preallocated memory. The sole
intercepted group-helper callee is the shared submission boundary; other
external execution is rejected. Tower replay stops before vertex copying or
submission. Ghidra raw imports omit outside types/data/callees: the group-entry
decompilation stops at its external style table, while exact installed-image
table bytes and all six branches are covered by instruction replay.

This completes the identified #111 source/static ordering repair and registers
only that bounded marker contract under #96. Compilation, reconstructed Rust
execution, actual MPQ/model loading, camera/terrain/depth/blend/GPU behavior and
original/rebuilt visual/gameplay parity remain unverified. Broader marker
geometry/fade ownership and native completeness retain #43/#41.

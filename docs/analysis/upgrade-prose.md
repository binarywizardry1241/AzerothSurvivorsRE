# Current upgrade descriptions

Selected EXE SHA-256: `17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
This is bounded instruction recovery, not an original/rebuilt runtime comparison.

## Recovered producers

[Current manifest](evidence/0.100.1/native-overlays/manifest.json) binds every
admitted byte range and the current REA/Ghidra description analysis. Main
formatter `145487680`, class-passive formatter `1454e9d90`, power line
`145420ad0`, cooldown line `1454531a0`, magnitude `14550c1f0` and ordered writer
`14554d6e0` are independently executed from the selected PE. Existing source's
`1454f94c0` magnitude comment names an unrelated current epilogue.

All112 current definitions were read at `146736b48`, stride120, their actual
keys checked, and their literal payloads retained. The literal fields and all112
floating-point description trees initially matched historical0.97.2; the current
integer trace additionally preserves global targets, capped class-passive counts
and the unsigned well-count conversion that the historical extractor missed.
Current addresses, callsite identities, bytes and hash are separately retained. The new build asset
is `assets/native-spell-descriptions-0.100.1.json`; it has no runtime EXE dependency.

The current description stat row starts at Game+`470`, copied by payload owner
`1454f0f10`. Its used lanes are maximum health+0, damage+4, global cooldown+8,
area+40, shield/aura-effect bonus+64 and periodic tick bonus+72. The former source
name `healing_bonus` for+72 was incorrect: it is Game+`4b8`, the capped DoT tick
bonus. The description uses it only in periodic-damage rows. The live numeric
owners are `area`, `buff_bonus`, and `dot_tick` respectively.

New-spell payload initialization `1454f101b..1454f115f` creates a neutral rank1
instance, applies current per-spell aggregate `145451c30` from Game+`6d8`, applies
learned rarity `145420e20`, then invokes the description. The live adapter must
follow that order. Global targets at Game+`4a4`/stats+52 are read as u32, in addition to
ordinary targets+24 and per-spell targets+64. Native target-count sums preserve
u32 wrapping and a minimum1; class-passive target text additionally caps at3.
The initial trace omitted these reads because the compiler moves the stats row
through XMM registers. Integer field identities now survive those native copies.


Radius description callsites are active `14548791b`, passive `1454e9ea2`,
and range-cone `145488690`.
Beyond70yd they display `ln1p((radius-70)/10)*10+70`, using f32 operations in native
order. Current catalog switching must update those branch identities as well.

## Derived validation vectors

`python3 scripts/recover-native-card-prose.py --contract formatter-core baseline`, `modified`,
`large_area`, `upgrades`, then `collect` reproduce the current asset/evidence.
The script admits unchanged native owners and reviewed String, locale-miss,
allocation and named CRT math boundaries; unreviewed calls fail closed. No OS or
network calls or reference-application launch are allowed by the emulator.

[Description fixtures](evidence/0.100.1/native-overlays/prose-fixtures.json) retain
112 baseline,112 modified,112 large-area and2 independent Lightwell scenarios,
actual numeric formatter
outputs, templates, f32 instruction expressions and explicit synthetic inputs.
573 shared numeric outputs match when baseline expressions are evaluated with
independent modified native inputs. Large-area cases set area20, exercising the
logarithmic branch; modified cases also exercise nonneutral shield, DoT and global-target lanes.
Lightwell's target plurality and optional overlapping-well sentence are separate
native decisions. Its two additional rows cover singular/overlap and plural/no
overlap, independently of baseline singular/no-overlap and modified plural/overlap.
The overlap count uses a saturating f32-to-u64 conversion, then clamps1..3. The
extractor preserves that semantic expression rather than the intermediate
signed conversion of `value-2^63` used by native compiler lowering.

[Upgrade fixtures](../../crates/azeroth-survivors-re/tests/fixtures/upgrade-prose-0.100.1-native.json)
retain1120 native bundles/5600 prose lines: all112 definitions, rarities0..4,
baseline and modified instances. Every case includes native float magnitudes,
full rendered English lines and input maps. All five kinds are deliberately
included, even when an offer would exclude one, to exercise pure formatter
behavior. These vectors do not establish offer eligibility or selection parity.

The central Rust comparison passed all338 description scenarios (including both
independent Lightwell branches) and all1120 upgrade bundles/5600 rendered lines.
The large vector sets are cohesive formatter evidence across every definition;
compact JSON retains every input/output/expression without a separate generated
file for each spell. Application payload wiring remains a separate source
integration concern. GPU rendering, original/rebuilt screenshots, all-class live
behavior and Windows execution remain unverified.

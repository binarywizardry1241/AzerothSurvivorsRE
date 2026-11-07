# Appearance portraits and racial tooltip icons

Gap **#51** is source-repaired against installed 0.113.2, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[verification-needed](../verification-needed.md) owns current validation/parity status.

The missing image keys were a source loading/consumer omission. Current
Appearance owner `1402cafd0` copies the 66-byte asset URI
`mpq://interface/glues/charactercreate/ui-charactercreate-races.blp`, then
selects a 64×64 pixel rectangle by native race key and selected sex. The native
copy uses SIMD loads rather than a direct string-pointer reference.

| Race | Male cell origin | Female cell origin |
| --- | --- | --- |
| Human | 0, 0 | 0, 128 |
| Orc | 192, 64 | 192, 192 |
| Dwarf | 64, 0 | 64, 128 |
| Night Elf | 192, 0 | 192, 128 |
| Undead (`SCOURGE`) | 64, 64 | 64, 192 |
| Tauren | 0, 64 | 0, 192 |
| Gnome | 128, 0 | 128, 128 |
| Troll | 128, 64 | 128, 192 |

The installed patch.MPQ contains that BLP2 atlas (256×256, 88,580 bytes,
SHA-256 `d2d36f83715364b6bee51ec54ff82cf2dec27458902408312a7446382982820d`).
Only textual identity/format evidence is retained; users still supply their own
MPQs. The runtime BLP/PNG extracts are ignored and are not source deliverables.

## Connected source

`assets::menu_images` now supplies one `race.atlas` image through the existing
MPQ patch-chain and BLP-to-image loader. Its ordinary Startup path loads it
before menu construction; the existing data check includes that image too.
`armory::race_portraits` applies the current rectangle on the same entity as the
race button, Action and Interaction. This removes the old absent `race.Human`
through `race.Troll` keys and the separately positioned 34px child image.

The native button declares 37×37px, 2px border, 6px radius and opaque black
background. Allowed races use white; restricted races use sRGB `(0.25,0.25,0.25)`
with alpha 1. Selection independently controls the border and shadow: selected
gold `(0.973,0.824,0.416)` with alpha-0.7 shadow/spread1/blur12; ordinary dark
`(0.169,0.129,0.071)` with black alpha-0.85 shadow/spread0/blur6. Both shadows
have zero offset. The existing input gate still rejects unavailable races;
hover remains available to explain restrictions. `NativeStaticFrame` prevents
the generic menu painter from replacing these constructor-owned colors on hover.
No hover/lift component was found in this recovered constructor bundle; that
bounded observation does not certify every possible external handler.

Race, class and sex changes already mark the menu dirty, so rebuilding reads the
new state rather than retaining a prior crop/tint. Existing asset changes also
invalidate Armory. The race tooltip's own current owner `1402c75a0` uses the
**racial ability icon**, not a sex-specific portrait: it reads RaceDef's ability
key, resolves the ability record and forwards its icon path. `race_tip::update`
now reuses `mechanics::racial_definition` and the existing ability image cache.
All eight recovered native key/icon pairs match those source catalogs. Its
40px frame, full tint and uncropped icon remain independent of Appearance tint
and sex. No third racial mapping or replacement artwork is introduced.

## Evidence and limits

[Native/resource proof](evidence/race-portraits/manifest.json) binds the
fresh REA/Ghidra Appearance and tooltip imports, current native ranges/data,
original-instruction checks and MPQ member identity. The checks pass **32 atlas/sex/tint cases**, **72 class eligibility cases**,
**two button Node constructions**, **eight tooltip constructor submissions** and
**nine installed MPQ member checks**. Shadow arguments are instruction/data
interpretation; shadow allocation and color conversion are not replayed. Source guards trace both consumers and startup loading.

```sh
python3 -B scripts/check-race-portraits.py
```

`--stage` writes compact results under ignored `runtime/` for review. The check
reuses the existing bounded MPQ reader and verifies the supplied nine-patch
ordering; it does not rescan or certify unrelated resources.

The native replay supplies bounded memory/state, allowed-race scan results,
shared layout constants and publication seams explicitly; it does not run Rust,
Bevy layout/input, fonts or the GPU. Resource checks establish atlas
availability and complete first-mip payloads, not displayed parity. Rust syntax parsing is
separate from compilation. No build, compiling tests, game/addon execution or
original/rebuilt comparison ran. All eight rendered portraits, allowed/selected
states, actual hover/input, sex/class/race refresh, DPI and visual parity remain
unverified; **#51 remains open for that validation**.

# Changelog source coverage — selected 0.107.0 target

The selected installed EXE is **0.107.0**, SHA-256
`92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a`.
All supplied sections through 0.107.0 are accounted for individually in
[the claim ledger](coverage/changelog.json). The two new release sections were
supplied on 2026-10-21 and preserved in [CHANGELOG](../CHANGELOG.md).

Historical release context: [0.105.0](changelog-coverage-0.105.0.md)

That linked crosswalk retains its 159 historical release contexts and original
source/report references. They are ownership leads for revalidation, not current
native or implementation assessments. All 23 earlier individual claim reviews
retain their actual 0.105.0 hash and are unapplied to this EXE. Neither supplied
release notes nor diagnostic-path continuity establish behavior or parity.

| Release | Game-mode obligation / reviewed scope | Source status | Remaining check or omission | Owning source/report |
| --- | --- | --- | --- | --- |
| 0.106.0 | Sixty boss cast/phase mechanics; timed circles/cones/lines/crosses/donuts/waves, puddles/towers, beams, warnings and Naxxramas difficulty | pending current native/source recovery | Recover exact native boss/phase/target/damage/timing rules and marker geometry, fills, colors, cast bars and presentation under #42/#43; complete native dependencies remain #41. Existing spell scaling does not implement this new raid-mechanic system. | [Current target](target-0.107.0.md), [boss source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs), [client presentation](../../crates/azeroth-survivors-re/src/gameplay/client.rs) |
| 0.107.0 | Per-boss/per-guardian signatures, knockback/root/stance/blink, destructible hatch/heal/shield objects, crystals, orbs/tethers/gaze/shockwaves/burning/dance/bombs/meteors and rectangular line outlines | pending current native/source recovery | Recover the actual sixty-boss/thirty-seven-guardian catalogs, actor lifecycle, targeting/shield arithmetic and event/phase rules under #42; full marker/cast/rectangle geometry and interaction are #43, with shared-engine and native ownership under #41. Locale/object names are leads only. | [Current target](target-0.107.0.md), [boss source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs), [targeting source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/attacks.rs), [marker scaling scope](spell-presentation-0.105.0.md) |

The world-resource archive hashes are unchanged, but compatibility with the new
EXE mechanics and reconstructed consumers is unverified. No compilation,
application launch or original/rebuilt comparison is part of this refresh.

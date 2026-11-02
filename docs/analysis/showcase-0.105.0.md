# Showcase run mode — 0.105.0

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the showcase source portion of **#25**. Current integrated
status and remaining comparison requirements belong to
[verification-needed](../verification-needed.md).

## Activation and identity

The current factory `1458a6bf0` reads `WOW_ROGUE_SHOWCASE`; only the exact
one-byte string `1` enables Game `+a6c`. Source reads it before the initial
account companion gate and configures the live Mechanics instance before
entry. A new run consequently cannot inherit the prior run's showcase flag.
This preserves the separate existing account/feat exclusion for showcase.

The optional leading ordinary roster row is a different feature. Producer
`1458b7e58..1458b7ee9` creates `Tester`, GUID `0xffffff`, level one, the selected
race/class, male sex, zero appearance and zero run/best counters. Startup
`14000ff00..14000ff8b` calls that producer from its explicit character-option
path. This is independent of `WOW_ROGUE_SHOWCASE`, whose only literal reference
is the game factory above. The ordinary frontend must not fabricate a Tester
row merely because the showcase environment flag is enabled. The [optional startup/roster connection](tester-startup-0.105.0.md) now supplies
that row through the ordinary frontend, independently of showcase. The source
showcase run retains its actual selected character identity.

## Connected run behavior

[Reviewed native spans](evidence/0.105.0/showcase/manifest.json) bind these
contracts. The complete Begin owner is already registered by the
[boundary report](evidence/0.105.0/boundary-pillars/manifest.json); its scoped
showcase ranges are retained here without duplicating the unrelated pet and
boundary extracts.

- Begin `145917d45..14591806e` replaces learned spells with every current
  class-pool key, rank one, initial cooldown `0.5`, applying the ordinary
  equipped spell modifiers. It then appends the fourteen unique variant26
  spell keys gathered from all nine classes' talent trees by `1458e5d80`.
  Duplicates against the class pool remain separate learned rows. The current
  source's nine class pools are revalidated against this EXE rather than
  assumed unchanged from their historical catalog provenance.
- The same Begin prefix creates all five selected-zone primary bosses through
  their shared constructor, preserving the normal scheduler cursor. The normal
  enemy, wave and primary-boss schedules remain independent. Showcase creates
  no guardian lairs. After the follower producers, shared Begin tail
  `145919894..145919949` creates four enemy0 actors and two caches, preceding
  the existing magnet schedule and perimeter objects.
- Each playing tick copies maximum health to health and clears Game `+9f4`,
  the pending upgrade-level count. It preserves raw XP and earned player
  levels. The incoming-player owner returns before absorption, damage meters,
  reactive effects or lethal protection whenever showcase is enabled.
- At or after its independent deadline, `145901e4c..1459021ba` creates one
  actor for every selected-zone enemy definition, without the ordinary
  time/weight admission filter. Positions form a radius14 circle around the
  current player. One batch runs per admitted tick, followed by a deadline of
  `now + 12`; elapsed overshoot does not generate catch-up batches.
- That batch then sends nine drops through the shared pickup owners in this
  order: XP1, XP5, XP30, gold1, cache, Speed rune, Berserking rune, Restoration
  rune, magnet. Source uses the original precomputed f32 offset words from the
  current EXE, starting at `[25, 0]`, rather than recalculating their angles.
- Native level/cache/guardian offer gates suppress overlays in showcase.
  Source suppresses level/cache offer generation and supplies the existing
  cache system's `extra_pickup_mode`, so purchases do not request an overlay.
  The native addon lair selector also keeps its previous value in showcase.
- Primary-boss death retains its kill counters, ordinary drops, attraction and
  final-boss phase transition. Only the permanent equipment admission/draw
  branch is bypassed at `145935a18`; source supplies no eligible static zone
  for that draw. This avoids consuming RNG for rejected equipment rolls.

The live owners are `gameplay/mechanics/showcase.rs`, its entry/tick hooks in
`gameplay/mechanics.rs`, and the existing damage, boss, guardian, cache, choice
and addon-list adapters. The dedicated showcase follower grant uses the
existing companion lifecycle rather than a second actor registry; its owning
pet/demon evidence remains with those adapters.

## Static checks and limits

`python3 -B scripts/check-showcase.py` passes **25 bounded original
instruction vectors**, the nine native/source class-pool comparisons, all
fourteen globally collected extra spell keys and every retained pickup offset.
It rehashes the reviewed native spans before replay. The
[compact results](evidence/0.105.0/showcase/vectors.json) state the boundary:
environment-value comparison, playing-tick refill/pending-level/deadline logic
and incoming-damage admission execute original leaf instructions only.
Environment lookup, allocators, terrain, stat composition and native callees
never execute. Ghidra uses raw x86-64 slices with generic ABI types; original
Windows PE instructions establish the field/register bindings.

Four Rust regression cases were added for learned-row ordering/duplicates,
pending-level versus XP ownership, batch deadlines/overshoot and immunity side
effects. They have **not been compiled or run**. Rustfmt parsed the changed
owners, and `git diff --check` passed. No build, game application or controlled
original/rebuilt comparison was performed.

These are source connections, not verified gameplay or visual parity. They
reuse the existing shared actor, pickup, stat and presentation implementations;
their full native internals and Windows CRT/host trigonometry equivalence are
not established by the bounded vectors. Exact MPQ terrain placement, creator
clamping/height and pickup rendering therefore retain their existing runtime
and native coverage limits. Ordinary frontend Tester startup integration is source-connected by its
[separate owner](tester-startup-0.105.0.md) and remains distinct from this mode.

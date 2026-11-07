# Scripted attack part producers

This follow-up uses the installed `installed-game/AzerothSurvivors.exe`,
151,534,080 bytes, SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
It advances the encounter questions in
[`Q41-A01` and `Q41-U01`](unknown-recovery.md).
The 0.141.0 audit and its selectors retain their original target.

## Rotor and Polygon

The publisher at `0x145fd7aa0` sets timing in each 168-byte part, calls
`0x145fd31a0` at `0x145fd7ef2`, then appends the 224-byte attack to the
Game vector at `+0x700/+0x708/+0x710`. The other serializer references are
a tail jump at `0x145fd949d` and a call at `0x146049ded` that traverses
existing 224-byte rows. The shape is the part's first qword. The serializer
normalizes the high-bit tag at `0x145fd37bf..0x145fd37fa` and selects
Rotor or Polygon with cells 6 and 7 at `0x147afec84`. Rotor writes the
five-byte `rotor` key from `0x145fd3fc7`. Polygon writes the four-byte
`poly` key from `0x145fd47bc`. The
[client decoder](../../crates/azeroth-survivors-re/src/gameplay/raid_markers/scripted.rs)
already accepts both.

The shared update at `0x145f83900` reads the original shape tag at
`0x145f85c0c`. Its tag-6 arm copies the inline payload before assigning
the same tag at `0x145f85e6f`. Its tag-7 arm reads the existing point
pointer and count at `0x145f85d7c..0x145f85daa`, copies the points in
eight-byte units, and reattaches tag 7 at `0x145f86731`. The geometry
replacement writes only part bytes `+0x00..+0x47` at
`0x145f86621..0x145f8664d`. The Game handoff at
`0x145e58905..0x145e58922` copies a vector header from the input record,
with no shape construction at the handoff.

The PE call scan verified 25 direct publisher sites at decoded instruction
boundaries. Neither an absolute pointer nor a canonical RIP-relative LEA
candidate targeted the publisher. The one immediate qword 6 in these
caller bodies, at `0x145dc2905`, goes to the formatter input passed at
`0x145dc2956`, before the attack record is prepared. A separate decoded
selector for two or more attack-vector offsets through non-stack registers
and an explicit 224-byte stride placed both exact encoded shape literals
in the shared update among the selected bodies. These selectors do not
cover a tag assembled by a different encoding or through an untraced
part alias. A live source change still requires a fresh shape write
reaching an admitted attack, with the encounter and hit geometry identified.

## Scripted root

The hit owner at `0x145fda470` reads the part's impact mode at
`0x145fdae04` and duration at `0x145fdae09`. The damage call at
`0x145fdb056` precedes dispatch through the five signed cells at
`0x147afecd4`. Mode 4 reaches `0x145fdacf3` and calls the shared root
helper at `0x145fdad03`. The existing
[player mover](../../crates/azeroth-survivors-re/src/gameplay/mechanics/player_mover.rs)
implements its five diminishing factors and eight-second refusal window
for the shared hazard route.

The script registry at `0x147b014c0` selects Kirtonos, Ras, Krastinov,
Barov and Gandling. The construction guards at
`0x145f68adf..0x145f68b43` and `0x145f68e30..0x145f68eab` select those
five entries. Their headers supply 33 distinct action and lifecycle
callbacks. Nineteen directly call the publisher, including the Gandling
phase callback. The writes at `0x146023495` and `0x14601b4bb` target
script state at `+0x68` and `+0x6c` after publication. The base in
each case also carries the script-state vector at `+0x30/+0x38/+0x40`.
Krastinov's live part update at `0x146024ef8` writes mode 2. Its
comparison with 4 at `0x146025019` reads the 224-byte attack's kind at
`+0xac`. The remaining question for census row `53143` is which
constructor or alias, if any, sets mode 4 at `+0x68` of an admitted part.

## Evidence

The journaled Ghidra results were checked against the exact installed PE
slices. The raw imports omit external tables and callees. The original PE
supplies the switch cells, register arguments and direct call sites.

| Procedure | Ghidra evidence ID | Result SHA-256 |
| --- | --- | --- |
| Serializer `0x145fd31a0` | `ev_ff76d7327e1eca17817f39341b5f6e964a3deaf4d8b0cfa6872c0684188f2bc6` | `175337644203ea4685160250494b03d158d74e0f600a603e69a6b61a4697d786` |
| Publisher `0x145fd7aa0` | `ev_5635938061864e4332f0d60d0c3541500b4bd3588b9c493daa1d037bf3ad260a` | `b85a71fee74149692558ca6e672032d2a86d7174aab088a4a9e05f5a924cffac` |
| Hit owner `0x145fda470` | `ev_4d7a948672611c9559e004fbae0def51c9b445a1781f42b0e7b02daeeafe5f9e` | `5bb33c56816ee6bdb69eb818f401232bc672981f734287e46165b56447ba261e` |
| Root helper `0x145f83680` | `ev_653ab87a3e9e58dd257595cd19b28cc214346c3c9604e6605b0d7e54aa299f7a` | `a0b2db1bfdb5b8258fe04d49e1f276030185b1dc90e3348c8335636d96b6681e` |

| Preferred PE VA range | SHA-256 |
| --- | --- |
| Serializer and publisher query slice `0x145fd31a0..0x145fd7fe5` | `3068ffa6469f8ada4799bd1ca5f3eb1bbd65b342554329841659034a4a489547` |
| Hit query slice `0x145fda470..0x145fdb71c` | `b4ca4fa4e1c6fbb72cc7e17b1125d4338f11d2d4bb720e5a2e479907ae2810da` |
| Root query slice `0x145f83680..0x145f83859` | `3ef67c6ac3ce26b818ea4e98e9b5c34431a81cc3eb5df427888134ffae09e241` |
| Shared update `0x145f83900..0x145f881e0` | `37810e0b50fdef596d89f839eb75e79126f41d9e9b229deb20ee34e9802d2d6c` |
| Shape publication table `0x147afec84..0x147afeca8` | `49305b4b8fc94fac94529842348a3d1836265b97c5fe7e969df5cd5b86cf3d22` |
| Impact table `0x147afecd4..0x147afece8` | `bef14dde3ceb8d006c2092c28275c37bd9c11ae18031b59c18b6a64dcc82787a` |
| Script registry `0x147b014c0..0x147b014e8` | `77859a8109fb39c8619c56a7d2682de581a71fa1b765469bec3469ea17515759` |

The static evidence establishes the consumers and rules out the traced
candidate writers. The two leads remain open for untraced typed writers.
Compilation, gameplay and rendered parity remain in
[#313 verification](../verification-needed.md#gap-313).

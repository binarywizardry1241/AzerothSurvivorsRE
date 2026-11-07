# Rewards perk draft edits

The bounded subject is `installed-game/AzerothSurvivors.exe`, version 0.141.1,
SHA-256 `47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
This resolves the Rewards subcase of [#41 `Q41-U01`](unknown-recovery.md).
The [predecessor action 1761 trace](executable-residual-roles.md#incoming-cells-for-the-remaining-36-ranges)
retains its 0.141.0 provenance.

## Button, draft and save boundaries

- The Perks view at `0x140131790` evaluates buttons against the displayed
  draft. Decrement admission at `0x140133098..0x1401330ac` respects the owned
  rank and checks dependents at the transition to zero. The helper at
  `0x145e4eb60` checks active prerequisite users, and `0x145e4ec20` guards
  removing the second companion slot while two instincts use it. Increment
  admission at `0x1401330f7..0x140133128` checks the next cost against available
  points. The renderer computes earned points minus draft spend, clamped at
  zero, at `0x14034f9d8..0x14034f9e5`. The helper at `0x145e4ee30` checks
  maximum rank, the earned achievement, the prerequisite and available instinct
  slots. At `0x14035045e`, the shared button builder attaches the 32-byte Action
  only on the enabled path.
- The changed-interaction loop at `0x140372c20` admits a fresh change and
  Pressed before dispatch through `0x1465c41a8`. Tag 0 reads the key and signed
  delta at `0x14037308b`. It reads the draft rank, adds the delta as a signed
  byte, clamps to zero through the descriptor limit and applies the result at
  `0x14037374e`. The upsert at `0x145e4ecb0` removes the prior key and only
  reinserts a nonzero rank. The draft is published at `0x140373928..0x140373969`
  before the loop advances to the next changed row. The rank branch uses the
  descriptor limit and the current draft. Its admission contains no second
  whole-plan budget or dependency check.
- Confirm at `0x140351fa0` takes the draft before calling `0x145e4e630` at
  `0x140352139`. Rejection discards the draft. Acceptance queues account
  command 19. The rebuilt Confirm and backend save command retain full-plan
  validation.

The native mouse producer writes Changed and Pressed at `0x1433ecf87`. The
controller producer independently writes them for its focused entity at
`0x1400586c8..0x1400586d1`. The existing rebuilt schedule runs mouse focus in
Bevy `PreUpdate` and controller focus before `AccountInput`. Two actions can
therefore be admitted from one displayed snapshot in the rebuilt input path.
For example, an unowned Companion rank in the draft can enable both Companion
decrement and Quick Paws increment. Applying both admitted rows leaves Quick
Paws with its prerequisite removed, so Confirm rejects the draft. The rebuilt
rank editor now applies that per-row contract and lets the user remove Quick
Paws again. The exact registration and ordering of the two producers in the
shipped EXE and an observed mixed-device batch remain unverified.

## Static evidence

| Preferred VA range, end exclusive | File offset | Slice SHA-256 | Ghidra result SHA-256 |
| --- | --- | --- | --- |
| `0x140131790..0x1401331d7` | `0x130b90` | `c9baddca9d11a7abd122b00c01e1c4f7b9c2d835ff2828f42d2fc994c499e351` | `51ba149e068fcb428bb5b9d243cd22ec9ada840d3ad4490cb5ca62c454db399c` |
| `0x140350200..0x1403509c5` | `0x34f600` | `7c33a6e2dda86dba404541ca1338f1bfba65a9e8708c19df071775fee6575ee7` | `38c085ed4d7a1f49fd0a80689cc49ca18e729a1ae09838e34965f6b802394c8f` |
| `0x140372ad0..0x140373c07` | `0x371ed0` | `ccde03cf3c8f007e98dde70313155e9a96428fd482dc16e44c58c956cbfcfe85` | `f4e311143bf639fe3eb85d2f6ced3592ab25bd67a5356783394422cb58a9fedb` |

The three journaled Ghidra 12.1.4 raw queries matched their slice digests.
The original clamp instructions passed 2,560 isolated cases covering all
prior rank bytes, both signed button deltas and absent or rank 0–3
descriptors, with draft and descriptor bytes supplied as seams. The mouse
owner `0x1433ebc90..0x1433ed23f` has SHA-256
`6aa477f82be85f1f011403e9d903dafbef5fd2c5532ffdcfb7539268ae91b02e`.
The controller owner `0x1400572b0..0x140058c9f` has SHA-256
`5c6f584346b5f10c71d660836e1bdad6622294ec067fa761245b4b0fc7276dbd`.

[The live account editor](../../crates/azeroth-survivors-re/src/progression.rs)
and [Perks view](../../crates/azeroth-survivors-re/src/progression/rewards.rs)
passed syntax parsing with pinned rustfmt and `git diff --check`. The authored
Rust regression covers both batch orders, recovery and Confirm rejection.
Compilation, test execution, input timing and original/rebuilt parity remain
open under [#41 verification](../verification-needed.md#gap-41).

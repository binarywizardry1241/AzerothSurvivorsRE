# Level-Up Rays setting

The installed specification is 0.127.0, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
Finding **#33** connects the Graphics setting to the existing level-up and
jewelry-card rays. Other effect/HUD settings retain their owning evidence.

## Native setting contract

[The retained contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.127.0/card-rays/contract.json) binds the exact
descriptor, original instructions, query provenance and scalar fixtures.

- Descriptor `0x146255f38` is `cardRays`, Graphics page 8, ordinary CVar storage
  0, checkbox control 5, without inversion. It follows `noSpellEffects` and
  precedes `menuScene`.
- Current owner `0x14028e6c0..0x14028e98b` registers the eight-byte key with
  default `"1"` on its first update, then reads the CVar on every update.
  The original Win64 argument setup at `0x14028e6e6..0x14028e724` binds the
  key at `0x146273d9c` and one-byte default at `0x146273da4`.
- The returned text passes through `0x140207170..0x1402073e9`. Isolated original
  instruction checks establish the tested ASCII/Unicode trimming boundaries.
  `0x14028e744..0x14028e752` disables only a one-byte result equal to ASCII `0`.
  Absence defaults to enabled; empty text and alternative numeric text such as
  `00` and `0.0` remain enabled. The owner publishes the resulting bool.
- The exact current tooltip specifies rays behind both level-up and jewelry
  cards. [Fourteen locale receipts](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.127.0/card-rays/locales.json)
  retain each payload's target-bound hash and the two connected labels.

The journaled Ghidra query is
`ev_b1e72cb62129a6f617f950c3969558881994441ac611cfa5b70699611f5b6d73`.
Its 715-byte raw subject maps exactly to the original declared PE extent.
Raw-import signatures use Ghidra's generic ABI; the original instructions bind
the stated Windows arguments. Native resource-table bookkeeping does not expand
this bounded setting contract into complete ECS or renderer recovery.

## Source connection

`assets/options.json` includes the recovered row/default. `OptionsState` already
loads ordinary CVars from `config.toml`, validates them with the native trimmed
numeric rule, registers defaults with the embedded client, mirrors live values,
and writes/reset defaults through the existing Options lifecycle. The added
`card_rays_enabled` reader applies the recovered trimmed exact-`0` predicate.

`gameplay/native_overlays.rs::animate` reads that setting and changes only the
existing `Rays` entity's visibility. Its rotation continues to use elapsed time.
The card hierarchy, current offer, opening/exit clocks, input admission and
reward transaction remain owned by their existing consumers. Local
`gameplay::hud` and guest `coop_overlay::present` both spawn this hierarchy and
run before the shared animation system; setting visibility does not reopen an
offer or restart its animation. Retained ray artwork/geometry keeps its original
presentation provenance.

Only `opt.cardRays` and `opt.cardRays.tip` were added to each source locale from
the exact current native catalog. Other locale content retains its own provenance.

## Checks and limits

Run the non-compiling check:

```sh
python3 -B scripts/recover-options.py --check-card-rays docs/analysis/evidence/0.127.0/card-rays/contract.json
```

It verifies the current EXE/ranges, completed query/raw-subject receipts, descriptor
and connected Options default, 28 locale entries, and 172 isolated original
trim/enable cases. Synthetic memory/registers replace application state and the
scalar routines make no external calls. These checks do not compile or execute
the reconstructed application, write real settings, run a game/server or render
an overlay. Compilation, live persistence/reset/input, local/guest rendering
and original/rebuilt visual parity remain under
[#33 verification](../verification-needed.md#gap-33).

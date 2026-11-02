# Fire Nova cast presentation — 0.123.0

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [hash-bound proof](evidence/0.123.0/fire-nova/manifest.json) owns the current
native branch, serialized event, configured DBC rows and resource identities
for **#261**. Current overall status remains in [verification-needed](../verification-needed.md#gap-261).

The descriptor remains spell **1535**, kind **2**, pulse **0**. The current
kind-two cast branch at `0x145b32361..0x145b3236c` substitutes **8349** only for
the cast event; `0x145c74160` serializes that supplied ID with opcode `0x132`.
`player_abilities/behavior/dispatch.rs::visual` now applies this same alias to
the live `CastPort::cast_spell` output. Learned state, first-hit tokens,
cooldown publication and direct damage continue using descriptor **1535**.
Other kind/spell combinations retain their existing event ID.

The live mechanics port publishes `RunEvent::Spell`; the existing
`gameplay/client/events.rs::spell_go` forwards its supplied ID into
`SessionEvent::SpellGo`. Existing benilla spell dispatch and cast-visual routing
look up that event ID in the actual spell catalog and select the cast kit.
The configured MPQ chain maps **8349 → visual 963 → cast kit 984**, whose effect
**714** is `FireNova_Area.mdx` and whose sound **5636** selects `FireNova.wav`.
Existing model-name normalization, MPQ asset loading and spell-kit sound
consumers supply those resources. The canonical **1535** row instead selects
the old totem-birth visual/sound. No asset replacement or engine behavior is
introduced by this repair.

The non-compiling checker is:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-fire-nova.py
```

It verifies **3,661 original instructions**, **two exact raw query subjects**,
**five DBC tables/nine rows**, actual model/audio members and current source
receipts. Source guards check the kind-two event alias and retained canonical
IDs; two live Rust paths are parsed through the existing `rustfmt` using stdin,
without compiling or writing formatted source.

This establishes the source/static repair. Compilation, actual event delivery,
resource loading, ring rendering, audible playback, gameplay and original/rebuilt
parity remain unverified. No native instruction execution, application build,
compiling test, client/game/network/server operation or installed-file mutation
was performed.

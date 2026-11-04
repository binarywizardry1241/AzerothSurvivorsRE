# Co-op fall and revival addon banners in 0.141.0

Installed `installed-game/AzerothSurvivors.exe` has SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
These immediate events use the [current banner publisher](banner-suppression-2026-10-23.md#01410-banner-whisper-identity).
The [downed-party snapshot](coop-downed-0.140.0.md) retains its separate
position, fall epoch and readiness behavior.

The phase-4 owner at `0x145f72680` bypasses these banners on the solo
route. The cooperative path emits `downed` to the affected hero when
Game `+0x10d3` is clear, with an empty name, boss false and
`You are down! A friend standing next to you brings you back.`.
The departure owner sets that byte before calling the phase-4 owner.
Both cooperative paths enqueue the affected slot and name in the
shared fall vector at Game `+0xe18`.

The frame drains the fall vector in order. Each seated hero receives
`frienddown` for each row whose slot differs from their own. The
formatter puts the other hero's name in the banner and substitutes it
into the recipient-localized template
`{name} is down! Stand next to them to bring them back.`.
It clears the boss byte. The remote path borrows the receiving hero
and seats the recipient locale before formatting.

The successful revive path at `0x145f12560` restores the recipient's
health and temporary immunity before emitting `revived`. It uses an
empty name, boss false and `You are back on your feet!`. The same
owner is reached with the local or a borrowed hero seated.

| Original range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Phase-4 gate `0x145f726a2..0x145f7270d` | `0x5f71aa2` | 107 | `08f771039c163e2b43a69f9a4b12f6243e492430adac525a77d5d5ab68e082a6` |
| Personal down and shared fall row `0x145f72ae5..0x145f72c04` | `0x5f71ee5` | 287 | `4366155258d77006c2954fc6683cb01089cc04747bb6787fdd9742632eee85f2` |
| Departure gate `0x145e72646..0x145e7265c` | `0x5e71a46` | 22 | `3be40cf34ca657f378ae64e43614475a601ef4b7427e5af66f9466e9ff68bac1` |
| Friend-down formatter `0x145e81960..0x145e81aa2` | `0x5e80d60` | 322 | `4a6cab1021a4d94da0737c695333f309507f6fb8f4fe7a4853c22dfab635ac54` |
| Local fanout `0x145f0a8e2..0x145f0a934` | `0x5f09ce2` | 82 | `16a3e9096ee9063684d14ea72a30851c8e151275075c0bbe2c8e35e2ff22c526` |
| Remote fanout `0x145e6ef21..0x145e6ef75` | `0x5e6e321` | 84 | `dc20bdf44a4cf4f7f15c5741f8a132750218cc63a8f871389df2ad07298ca431` |
| Remote recipient borrow `0x145f0ab90..0x145f0abc5` | `0x5f09f90` | 53 | `528981b8c13b23ebab846778812505ed3727dcf50e303b2946e4c66118ad8e1f` |
| Revive banner `0x145f128cb..0x145f1294a` | `0x5f11ccb` | 127 | `6f8166aa01c5add16997d30a97b05e0344e2c7c701dee601e945c34bf55c7f22` |

The [cooperative mechanics](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs)
capture each fall on the existing lethal or departure transition. Personal
banners remain in the affected hero's private event queue. The collector
drains the ordered fall notices once, after borrowed heroes are restored,
and queues the other hero's name for each recipient. The existing
[banner publisher](../../crates/azeroth-survivors-re/src/gameplay/client/addon_banners.rs)
renders the template with the admitted recipient's locale and uses their
world GUID. The packet follows the existing private engine route and the
ordinary `CHAT_MSG_ADDON` receiver.

Original instruction operands establish the gate, recipient selection,
string inputs and publication calls. Rustfmt parsed the changed Rust
files and the whitespace check passed. The Rust regression covers a
remote lethal hit, a repeated drain, successful revival and departure.
Compilation and in-game delivery remain unverified. The selected repair
covers the addon whisper. The separate frontend JSON presentation and
live takeover diagnosis retain their existing verification boundaries.

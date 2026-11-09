# Codex membership and account achievements

## 0.143.0 Every Bauble correspondence

The selected `installed-game/AzerothSurvivors.exe` is 151,566,336 bytes with
SHA-256 `f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
This assessment covers the listed-key population and ordinary account evaluator
for `changelog:0.141.1:eaa7fb6599d2747c` under
[#19](../verification-needed.md#gap-19) and [#73](../CURRENT-STATE.md#gap-73).

### Native population and consumers

The current account key constructor at `0x145ec25e0..0x145ec26c2` loads
the jewelry bounds at `0x145ec2604/260f`, shared amulet bounds at
`0x145ec261a/2625` and class bounds at `0x145ec2648/2653`. It passes
them to `0x1460358d0` at `0x145ec2666`. That owner calls the class
iterator `0x146054a30` at `0x14603590b` and `0x146035c63`.

| Native range | Preferred VA | File offset | Byte count | SHA-256 |
| --- | --- | --- | ---: | --- |
| Nine class descriptors | `0x1473ae0e0` | `0x73ad4e0` | 1296 | `23d22284c4f1d2a9787a8bf587c15ba182781adc79df63f5a3fc90dbda27253d` |
| Nine talent descriptors | `0x147742e20` | `0x7742220` | 1800 | `98513774e758ba38830929238b74296a1b059c8fec391c731b86874b89f79bc8` |
| Twenty-three jewelry descriptors | `0x147722740` | `0x7721b40` | 1656 | `637de93383368271c54da0495776395eeb145c466a7b9dc86a21ca6ca3cd02ff` |
| Sixteen shared amulet descriptors | `0x1477239a0` | `0x7722da0` | 1280 | `3b9f9624ef4f4e05310112c21af6d564a1cadf5e3a8bd62f4e6e4acc87a18295` |

The iterator calls the class builder `0x145ec4ae0` at `0x146054b6c`
and `0x146054bf7`. The UI class loop also calls it at `0x140155802`,
passing the class byte from descriptor offset `0x8c`. The builder joins
the ordinary pool at `+0x30/+0x38` with talent extras produced by
`0x145ec6e50..0x145ec734b`. The latter checks effect tag `0x29` at
`0x145ec6f70`, `0x145ec70d0` and `0x145ec7240`. Comparing the three
trees per class with the ordinary pools leaves Rockbiter as the sole addition.
The class join at `0x14603ab40..0x14603afe8` compares the three packed
exclusions `lightning_shield`, `healing_wave` and `explosive_trap`
from `0x147721365..0x14772138f`. The corresponding exact-width reads
start at `0x14603ad78`, `0x14603ada0` and `0x14603ace0`.
The diagnosed Codex body `0x140157de0..0x14015b1f2` independently loads
the same jewelry and shared table bounds through the initial pointer slots
`0x148ad3028` and `0x148ad3030`.

The source comparison checked all nine ordered ordinary class pools, the
talent-only addition and exclusion rule, and the 23 jewelry and 16 shared
keys. The result has 141 unique keys, including 102 legendary keys. SHA-256
of the sorted keys, separated and terminated by LF, is
`f5c3bc948109cf2ad6dda533c7c3be1d7ca3749e22b0de04e3f979905825a86a`.
[Class pools](../../crates/azeroth-survivors-re/src/player_abilities/catalog.rs) ·
[Jewelry](../../crates/azeroth-survivors-re/src/loot_rewards/catalog_01120.rs) ·
[Amulets](../../crates/azeroth-survivors-re/src/loot_rewards/amulets.rs)

### Seen membership and thresholds

The achievement constructor at `0x145ddef20..0x145de8f9a` loads the
Jeweler's Eye and Every Bauble name strings at `0x145de124f` and
`0x145de148f`. The corresponding writes at `0x145de13fb` and
`0x145de163d` store 50 and 100. Verified `achievements.rs` Location
sites `0x145de2222` and `0x145de22a6` share that declared extent.
This binds the two descriptor thresholds and account evaluator to a bounded
contract for `systems[id=custom-game-achievements]`.
[Diagnostic ownership](coverage/diagnostic-ownership.json)

The evaluator at `0x145dec8c0..0x145dee702` (file offset `0x5debcc0`,
SHA-256 `9c2458eb5c12ff6f7fdc1da8014756d67b60c6affb8622f3b4f48075c2682691`)
loads the percentage from descriptor `+0x4c` at `0x145ded09a` and
calls the key constructor at `0x145ded0a2`. Its loop
`0x145ded0d0..0x145ded0f2` calls the exact saved-key lookup
`0x145e78d60` for each constructed key and adds the returned presence bit.
The list length and descriptor percentage feed the ceiling calculation at
`0x145dedbc1..0x145dedc05` (68 bytes, SHA-256
`96f79d094942de807fa07b17fe865ffd5af2944c96b6bf34c2b906c9df3e70db`).
Capstone 5.0.7 verified the instructions from their declared starts. An
isolated Unicorn replay of the 68-byte calculation set `r15` to each list
size 0–144 and `rsi` to 50 or 100, then compared `rdi` with
`(size * percent + 99) // 100`. All 290 vectors passed. At 141 listed
keys, the thresholds are 71 and 141.

The rebuilt `achievement_inputs` intersects the saved Seen map with
`loot_rewards::codex_keys`, and the account progress branch calculates the
ceiling from that same iterator. Menu-state construction calls `grant_account`
on the loaded save, with a source regression for an over-counted save that
still lacks Rockbiter. The current native startup caller and guest wire
admission still require separate correspondence. Compilation, source
execution, save publication, guest delivery and original/rebuilt comparisons
remain open.
[Account adapter](../../crates/azeroth-survivors-re/src/progression.rs) ·
[Threshold](../../crates/azeroth-survivors-re/src/account_progression.rs) ·
[Startup](../../crates/azeroth-survivors-re/src/menu_state.rs)

## Retained 0.141.1 recovery

The original proof retains its own EXE hash
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
It covers the two percentage thresholds, 149 guest key cases, two mixed
packet boundary cases and the connected source for guest Rockbiter under
[#19](../verification-needed.md#gap-19) and [#63](../CURRENT-STATE.md#gap-63).
It also retains the explicit guest admissions for healing wave and lightning
shield independently of the narrower achievement membership.
[0.141.1 native and source proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-codex-0.141.1.md)

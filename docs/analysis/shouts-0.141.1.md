# Co-op Battle Shout caster potency — 0.141.1

The installed desktop EXE SHA-256 is
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
This bounded recovery resolves `changelog:0.141.1:5fb431ffa62f27ff` and
extends [#289](../verification-needed.md#gap-289). The
[0.127.0 shout recovery](shouts-0.127.0.md) retains the separate weakening,
Judgement and strongest-aura lifetime contracts.

## Caster and recipient

The Horn record at `0x147702c00` has native jewelry tag 17. Its stat dispatch
at `0x147afe87c` adds the live jewelry amount to `xmm5` at `0x145fa67da`.
Bloodlust retains the allocation key `unbridled_wrath`. Its payload at
`0x147705c40` supplies stat 23 and a per-rank amount of 0.06. Dispatch
`0x147afe8cc[23]` adds that stat at `0x145fa691b`. The shared sum reaches
the aura stat loop and Game `+0x69c`. The reconstructed numeric producer
already feeds the corresponding jewelry and talent contributions into
`Numeric::buff_bonus`.

The cast handler at `0x145f8efa0` writes a source-zero aura row with the
unmodified ability-scaled status. Its `battle_shout` arm calls
`0x145f49010` after that write. This party producer applies
`(1 + caster_buff_bonus) * status_value` to a damage or haste status (8 or 9)
and copies the result into the 56-byte event. The recipient handler at
`0x145f4b353` replaces only the matching spell and caster row. It copies the
source GUID and status, sets expiry from its own clock plus the event duration,
then calls the stat refresh.

The stat loop at `0x145fa5bb0` compares same-spell rows with their effective
strengths. A source-zero row uses the current hero's potency and a nonzero
source uses factor 1. Equal strength keeps the first live row. The damage and
haste additions at `0x145fa5c90..0x145fa5cd9` use the same factor. The
strongest row can therefore be a weaker base shout from a caster with a
stronger bonus. A received shout retains its cast-time potency until refreshed
or expired.

`apply_self_buff_with_party` now scales only the outgoing Battle Shout copy.
`Aura::buff_strength` serves the same-spell selector, damage and recovery
consumers, and the active tooltip. The existing shared-aura delivery retains
the event value and source GUID.

## Recipient tooltip and party resources

The resource helper `0x145f51390` uses the same source-zero rule to compare
ordered live rows and format the winner's effective percentage. At
`0x145f5151b..0x145f51535`, the selected damage aura contributes its stored
value times the proper source factor and 100. It replaces the secondary text
on the first existing Battle Shout resource and preserves its primary prose.

The ordinary resource owner `0x145f4e350` uses the active hero's class pool.
The party owner `0x145f49fc0` starts from the selected hero's resources,
visits the other occupied slots in order and appends resources whose spell IDs
are absent. The original donor builder invokes the active-tooltip helper at
`0x145f502d4`. After the merge, the party owner reapplies the helper in the
selected hero's frame through the locale wrappers at `0x145f4a91a` or
`0x145f4ab1e`. When the selected hero has no eligible active aura, the
merged row keeps the donor's secondary text. The game loop calls this party
producer for remote publication at `0x145eb9a86` and for the local party at
`0x145ebc78b`.

The reconstructed publication now applies the merge for Battle Shout. If the
recipient has no row, it builds the first eligible donor's row in the
recipient's locale, then updates its secondary text from the recipient's aura
state. A read-only slot lookup avoids swapping unrelated hero state. Both the
local FrameXML feed and the existing wire11 resource feed use this path.

## Evidence and verification

[The fixture](evidence/0.141.1/battle-shout.json) records the selected original
byte ranges and test vectors. The shared journaled Ghidra runner confirmed six
procedures. Both raw slice subjects were checked against the installed EXE,
including their mapped virtual address, input digest and completed result.

| Slice | SHA-256 | Procedure and evidence ID |
| --- | --- | --- |
| `0x145f49010..0x145f51752` | `fec80d2b140492f3ab96517db59a079002de8c9f89bacd2bd1edfcb802273c86` | Producer `0x145f49010`, `ev_94d8d19bcc1c339346f49edff60a6fe1bb681d710d4c37b85cbf3f0e33987d69` |
| Same delivery slice | | Recipient `0x145f4b120`, `ev_070879febd2463d5308370919205376494977b3ff773a8598eeedd5dd3c03e84` |
| Same delivery slice | | Tooltip `0x145f51390`, `ev_ebc42777c8f5a8d50d1858ed5d6ad3696d50771287cb16972e955c15db6ec7c1` |
| Same delivery slice | | Party resources `0x145f49fc0`, `ev_55b1a441b15737746965a13bdf53a1604d8a7d7abec7d55e84ebcc3ac251a09a` |
| Same delivery slice | | Ordinary resources `0x145f4e350`, `ev_b6c8890229bd6739932afc26cfc54a9b84de869e2aedf7778317abc91abf36fc` |
| `0x145fa5420..0x145fa6953` | `4856efdb6596e9354e828cf491eb6614db7ee27eaf4fddde5b16f6c293d454b7` | Stat refresh `0x145fa5420`, `ev_1d74191c8ddb49bba6c4293a743fbb301a661f42d01310721f73d9df28420ee5` |

```sh
python3 -B scripts/check-player-aura-grouping.py --contract battle-shout-potency --verify
```

The checker replays 8,376 original instructions in synthetic scratch memory.
It checks 18 stat and tooltip pairs, 16 producer cases, four recipient
deliveries and 16 Rust syntax parses. The formatting replay stops at the
localization boundary and verifies the original percentage arithmetic
separately. The Rust source regressions use the new native tooltip vectors
and cover two live party auras with different caster bonuses and expiry.
Compilation, gameplay, guest transport, tooltip rendering and parity remain
open.

# Shield capacity and party reservations

The selected installed executable is 0.140.0, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
This repair covers #288's Power Word: Shield capacity, Ice Barrier Talisman,
and ordinary shared shield precedence. The earlier
[0.139.2 Ice Barrier proof](ice-barrier.md) retains its own target.

| Native transition | Evidence and connected source |
| --- | --- |
| Talisman construction and aggregation | The `ice_barrier` and `pw_shield` key branches at `0x145debf50` and `0x145debf87` write keyed native tag 73, modifier 9 with 1.0 and 0.5 at `0x145dec795` and `0x145dec7c6`. They join the retained cooldown and shield burst producers. Selector 9 of table `0x1473e7304` adds that magnitude to lane `+0x24` at `0x145df2073`. The equipped amulet now scales this cap lane and displays it through both localized description formats. |
| Power Word: Shield self cast | `0x145f8039a..0x145f803fe` subtracts the old primary reservation, clears it, and caps the new shield by remaining spell capacity. `0x145fb5030` returns recipient maximum health times `min(1 + modifier9, 2)`. `0x145fb5620..0x145fb56d6` counts PW:S in the primary and separate shared spell reservations. The same-spell aura scan at `0x145f7e9fe` rejects a self cast with a shared PW:S aura even when another spell holds the primary reservation. The caster publishes its uncapped coefficient via `0x145f80471`, and the party receiver uses its own health and cap modifier. |
| Party ordinary shield precedence | `0x145f39070` receives party kind 15. `0x145f3962c..0x145f39707` computes the positive difference above the existing same-spell reservation, subject to remaining capacity. The first spell uses the primary lane. A different spell uses an independent keyed reservation at `0x145f3985a..0x145f398ac`. The source preserves insertion order and the source-zero aura refresh even when a weaker contribution adds zero. The refresh replaces the previous spell-wide expiry rather than tracking a deadline per caster. |
| Ice Barrier capacity | The separate Ice Barrier balance caps at maximum health times `1 + modifier9`. `0x145f7fb3f..0x145f7fb89` replaces the old balance on self cast and calls the capacity helper at `0x145fb5110`. The base coefficient at `0x1473bb9f0+0x6c` remains 0.45. The necklace's initial absorb bonuses give way to capacity. `0x145f390e2..0x145f391fc` still adds party Ice Barrier contributions within the recipient's cap. |
| Damage and expiry | `0x145f9a902..0x145f9a964` clears the empty primary amount instead of making it negative. The latter value would be subtracted again on recast and grow the total. `0x145f9a9b0..0x145f9aa68` consumes shared reservations in order before Soul Link, removing depleted auras. `0x145f8cac3..0x145f8cc92` subtracts expired Ice Barrier, primary, and separate party balances without a second subtraction of the same counted Ice Barrier pool. |
| Stat and equipment refresh | `0x145f993e0..0x145f994bb` clamps the Ice Barrier balance after computing current maximum health and equipment. `0x145f99580..0x145f996f0` trims excess PW:S from the total, then reduces its primary and shared reservations in order. Both source stat refresh paths use these capacity rules. |

The Ice Barrier balance is Game+`0x5e8`. The direct-store scan of 7,126
declared extents starting in `0x145dd0000..0x146076000` included the paired
eight-byte writes beginning at total absorb, Game+`0x5e4`. The only
increasing stores in that scan are `0x145f391d5` (party receipt) and
`0x145fb5220` (self application). The damage and refresh stores reduce
or clear the counted balance. The self cast composes learned power, keyed
power and effect, and buff strength before applying remaining capacity.

The journaled Ghidra results bind exact mapped slices to this installed hash.

| Slice start | Input SHA-256 | Ghidra evidence |
| --- | --- | --- |
| `0x145deab20` | `5a215aec56f55a5d1ed7744a68d3d1b45a502157b3350a1a2d33376301ea4369` | `ev_6ed720f3dfbbe67af5e29a3ed3219d5874e6c63f47be087102daca04f8498117` |
| `0x145f39070` | `b77b8a79c607f84fb8d1c26e1af65a3b4f6518c5940781abb464050d3bc43bea` | `ev_ad5ef193dba10807e6994f17ea55bc5ca3441ab00b436003d5496239af6482a4` |
| `0x145fb5030` | `7edc5db8323da1b6f362bc1be3a9ed4bfaf2857a0914b963cad7f2a1998a8033` | `ev_d11703e86a19c25f91eac899269f42bf951cc6dff07c360b2e05194a711e18f3` |
| `0x145fb5110` | `6cd6f752413316ae711d4f519d23b0fed5982ab106dda07e4df93053a4fa5ec0` | `ev_dc6a3be55422030fc6575ba331d2f70c245724f2ddec4ddc87716618a5869ba3` |

Source regressions exercise recipient and self caps, Talisman rank growth, the
unreserved recast case, and weak-after-strong delivery with a separate primary
shield. The older fixtures retain the original exact output and project only
the known current changes in their expected source results. Compilation,
authored regression execution, shield publication and original/rebuilt parity
remain open.

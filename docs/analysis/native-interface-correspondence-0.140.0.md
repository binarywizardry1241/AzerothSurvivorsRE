# Bounded native-interface correspondence — 0.140.0

The selected installed EXE is 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
Preferred PE addresses and half-open ranges below were resolved from this
image. The [0.139.1 correspondence](native-interface-correspondence-0.139.1.md)
and the 0.139.2 recovery keep their original target identities. Capstone 5.0.7
decoded the selected current extents from their PE unwind starts. The
[diagnostic inventory](coverage/diagnostic-ownership.json) supplies the
independently checked module references. These results establish the named
local scopes. Broader source correspondence, application behavior and parity
remain separate.

## Clock descriptor and callback — #302

`diagnostics[path=crates/wenilla-rogue-app/src/screens/localclock.rs]` has
seven verified references in three declared extents. The two current
references `0x1401a1c9b` and `0x1401a1fe2` reach the same line-22 Location at
`0x14659f1f0` from within `0x1401a1c50..0x1401a203c`. The construction
`0x1401a1c70..0x1401a1c8e` has the same five instructions and stack slots as
the registered 0.139.1 scope, with the relocated name displacement. It stores
the exact `AZS_NativeLocalTime` name pointer, length 19 and callback pointer
`0x1401a21a0`. There are no branch instructions in those five instructions.

The following local admission shape also survives. `0x1401a1c8e` calls
`0x140114730`; `AL >= 2` branches to the decoded instruction start
`0x1401a1fdb`. The fallthrough supplies the descriptor, context and Location
to `0x1401771f0`. The callee semantics, registration lifetime and successful
admission are outside the descriptor scope.

The callback extent `0x1401a21a0..0x1401a2301` has three direct branches, all
with decoded in-extent targets. Its IAT operand at `0x1401a21ba` resolves to
`kernel32.dll!GetLocalTime` via the import table. It reads `SYSTEMTIME` words
`+8/+10`, gates English on the exact two-byte `en` value and uses different
format descriptors for that and the other branch. The English path selects
the two-byte `AM` or `PM` slice at the noon boundary, computes hour modulo 12,
and substitutes 12 for zero. The callback locally stores the returned text
representation, original hour and minute, and the Boolean 24-hour flag. The
exact 307-byte `AZS_GetLocalTime` protected Lua wrapper matches the 0.139.2
range. These are current local code and data observations. The formatter's
internals, VM installation/reload, widget geometry and frame scheduling keep
the separate [0.139.2 evidence and limits](local-clock-0.139.2.md).

The checkout already uses the time provider and shared HUD setting in
`gameplay/run_hud/local_clock.rs` and registers the existing addon bootstrap.
The exact descriptor construction supplies the bounded
`custom-app-screens-localclock` registration. It leaves the runtime cases in
[verification #302](../verification-needed.md#gap-302) open.

| Current VA range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| `0x1401a1c50..0x1401a203c` descriptor owner | `0x1a1050` | 1,004 | `0a19263c4cdfe0b4d8db9e25c36803562ebda1da3f9532eeaa11e0252a1cf81f` |
| `0x1401a1c70..0x1401a1c8e` construction | `0x1a1070` | 30 | `e07f36b4f4e96340111d5a31a5d356f2ac473bb911537fab730fa63bc4223ae6` |
| `0x14659f1d8..0x14659f1eb` name | `0x659e1d8` | 19 | `0ecd0e9c6949dd7f0193767bdf862f128b8573d5f559afaab1fe860a57913477` |
| `0x1401a21a0..0x1401a2301` callback | `0x1a15a0` | 353 | `9fa439bd6bb84ea7192c40b12e16b64f067cbc99bf2a53befd8cb106d8056ae5` |
| `0x1465558e8..0x1465558f0` import slot | `0x65548e8` | 8 | `ff5ecca6c050ca9fbaaa79c646e4d297d151023534eb9ef9aa494c0db642af13` |
| `0x14659f131..0x14659f135` `PM`/`AM` | `0x659e131` | 4 | `2f8b60678c2eb1f6ff60d78834f43af2e7f0ec4c88d9175b8fc06e9723fbd6b4` |
| `0x147aeb079..0x147aeb1ac` protected Lua wrapper | `0x7aea079` | 307 | `5ab5e00080ccd93e1a6c5a9119c01b0240412a5ce58f7f177bc1bf59f3a66e92` |

## Enhancement timed cooldown — #305

The 0.139.1 registration covered only the Rockbiter/Stormstrike timed
cooldown consumer in a mixed body. Its tag 42/subtype 10 and Game
`+0x13c/+0xe88` fields were bound to that target. Current
`diagnostics[path=crates/wenilla-rogue/src/game/enhancement.rs]` has a verified
line-124 Location reference at `0x145f8f2bb` within
`0x145f8c810..0x145f8f366`. Independent decoding covers all 11,094 bytes of
this declared extent. The historical local contract maps to these two current
branches with a changed representation and the same arithmetic.

- At `0x145f8d64c..0x145f8d6fe` and `0x145f8dd09..0x145f8dd71`, the first
  branch scans 64-byte effects using count and pointer at Game `+0xb60/+0xb58`.
  It requires dword tag **54**, subtype byte **10** at `+4` and reads rank at
  `+5`. Exact key-length and byte comparisons admit nine-byte `rockbiter`
  or eleven-byte `stormstrike`. The ordered deadline test at
  `0x145f8dd37` compares Game `+0x154` to Game `+0x1010`. Expired, unordered
  and nonmatching paths keep the factor 1. A live match uses
  `1 + (float(rank) * 6) / 100` and multiplies the frame decrement before
  writing the cooldown at ability-instance `+0x34`.
- At `0x145f8e657..0x145f8e773`, the second branch checks the same row and
  keys and uses the same deadline and factor. It calculates the remaining
  active interval and handles the expiration crossing. When the raw elapsed
  quantity fits under the accelerated remainder, `0x145f8ebcd` divides it
  by the factor. Otherwise the path subtracts the excess acceleration for
  the remaining active interval. The exact local code leaves other cooldown
  and proc branches outside scope.
- All 27 direct jumps in the three selected consumer ranges reach decoded
  instruction starts. Local forward dataflow through the declared owner
  tracks XMM7/8/9 along all decoded direct edges from entry, with the Windows
  x64 nonvolatile register convention at call boundaries. Both multiply
  sites (`0x145f8dd5a`, `0x145f8e72e`) use XMM8 = 6.0 and both add sites use
  XMM9 = 1.0, including the saved value transferred through XMM7 at
  `0x145f8eb7b`. The current divisor is independently read as f32 100.0.
  The three exact constants retain the same IEEE-754 values as 0.139.1.
- A separate current writer at `0x145f25ef0..0x145f25f97` matches the effect
  layout and writes Game `+0x154 = Game+0x1010 + 4.0`, then sets `+0x158` to
  one. Its nine direct branches reach independently decoded targets in the
  containing extent `0x145f25ef0..0x145f26a6d`. This supports the field join
  used by the two consumers. Full callers, the critical input's producer,
  other expiry/reset writers and aura publication remain open.

The 160-byte `enh_flurry` descriptor at `0x1473da4f8` points to one 64-byte
effect at `0x1473d9ad8`. That template stores dword 54, subtype 10 and an
initial byte value of one at `+5`. Its description names melee criticals,
both cooldowns and four seconds. The code independently supplies the
consumer's rank byte and the four-second writer. Live allocation and scaling
that produce the equipped rank remain outside this result.

The old 0.139.2 proc and rank work keeps its [historical
proof](enhancement-0.139.2.md). The current result registers only the local
timed consumer for `custom-game-game-enhancement`. The checkout has an
ordinary spell dispatch and effect collection seam in `player_abilities` and
`run_effects.rs`. The live Enhancement state, migrated effect collection,
surrounding procs and remaining source integration stay under
[#305](../verification-needed.md#gap-305).

| Current VA range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| `0x145f8c810..0x145f8f366` mixed owner | `0x5f8bc10` | 11,094 | `c17b49436696e22542b3151abe1ed8f5ae14a6bb286283f037e33acf19b56dd3` |
| `0x145f8d64c..0x145f8d6fe` row, key and decrement | `0x5f8ca4c` | 178 | `0aa27ef2d0300f93fae86d39232d1e8b0146855c24e39c9f27ec98815bd00966` |
| `0x145f8dd09..0x145f8dd71` key, deadline and factor | `0x5f8d109` | 104 | `37ade8e8383ed1abbf1186857e5a220d384a090de4f872998178e72f7e5afc3a` |
| `0x145f8e657..0x145f8e773` second consumer | `0x5f8da57` | 284 | `6cc798f6c046e07254164866e7fcc609eef4aab5397506f76ed5c7c4593c5db4` |
| `0x145f8ebcd..0x145f8ebd1` crossing divide | `0x5f8dfcd` | 4 | `e5863e77c18df08addc953caa021db7809aec6d1ff1743a9609b6e2b7d89f562` |
| `0x145f25ef0..0x145f25f97` deadline writer prefix | `0x5f252f0` | 167 | `6ed05cd8826adb0423ed3e179cc50fe5b67fc70da5ecc5e987f10643ed09932f` |
| `0x1465581e4..0x1465581e8` f32 1.0 | `0x65571e4` | 4 | `e00e5eb9444182f352323374ef4e08ebcb784725fdd4fd612d7730540b3e0c8c` |
| `0x146559f84..0x146559f88` f32 6.0 | `0x6558f84` | 4 | `fedcca07b1ccdacce623cb6d8afdeed0314e8508d763e228871f18d4e0ebb7c4` |
| `0x14656ccc4..0x14656ccc8` f32 100.0 | `0x656bcc4` | 4 | `2238f30df488055daf5e8f362cf904e370011a172d20df193c1b7ae8e5db8e01` |
| `0x146559fd0..0x146559fd4` f32 4.0 | `0x6558fd0` | 4 | `4f4b9b7d8b86633e2824e2f439819357b0cd010ab410ea1a691b12c5f94e91e0` |
| `0x1473da4f8..0x1473da598` talent descriptor | `0x73d94f8` | 160 | `ddca580f8e2237611b923e4d61d8f520d03f35214cdae83e9161ed80ecff05e4` |
| `0x1473d9ad8..0x1473d9b18` effect template | `0x73d8ad8` | 64 | `6a614ae74aba8cef1f2a354346382b8b2b65b06ed2eed4e3d2f3bb5853531ac3` |

## Death Recap payload consumers — #300

`diagnostics[path=crates/wenilla-rogue-app/src/screens/recap.rs]` has ten
verified references across four declared extents. The selected renderer
`0x14016c4b0..0x14016e1f2` has references at `0x14016c848`, `0x14016ca43`
and `0x14016d4de`. The selected terminal owner `0x140181d70..0x14018254a`
has line-236 references at `0x1401820fe` and `0x1401821e2` and a line-243
reference at `0x1401824e1`. Both extents match the 0.139.0/0.139.1 registered
scope after resolving their encoded address fields. The 1,279 and 364
decoded instructions retain identical offsets and sizes. Architectural
RIP-relative disp32 fields and external direct call immediates are masked
for the navigation comparison. Internal branch operands remain intact.

All 117 internal branches and all 13 selected data references were checked
independently. Each branch keeps its opcode/displacement bytes, source offset
and decoded target offset. Exact mapped fields reach the following locations.
Every external call is bound to its current direct edge at the local consumer;
the helpers retain their pending semantics.

| Current consumer | Exact instruction → data addresses |
| --- | --- |
| Renderer keys | `secs` `0x14016c783 → 0x1465996e4`; `absorbed` `0x14016c8f9` and `0x14016c9bd → 0x1465996f0`; `hits` `0x14016cf36 → 0x146599719`; `by` `0x14016d23e → 0x14659971d`; `avoidable` `0x14016d86d → 0x14659972f`. |
| Renderer labels | `Death Recap` `0x14016c534 → 0x14659965f`; `Final Blows` `0x14016cc9c → 0x14659970e`; `Damage by Source` `0x14016d28b → 0x14659971f`. |
| Terminal nested keys | `recap` `0x140181e7c` and `0x140182249 → 0x146599654`; `killer` `0x140181e9b` and `0x14018226e → 0x146599659`. |
| Terminal admission/state | `0x140181e60` reads generation at `+0xe4`; `0x140181e6a` and `0x140182235` test open state at `+0xa0`; `0x140181eb6` and `0x140182289` check object tag 5. The local generation/open-state instructions match the retained region. |

The 16 selected current call sites preserve their corresponding instructions
and grouping of targets. Renderer lookups call `0x1438a3960`; the local
consumer has direct edges to `0x14016f880` and `0x14016a810`. The terminal
lookups also call `0x1438a3960`, and its separate local edge at `0x140182530`
calls `0x1403c61d0`. These joins support the same bounded named-field and
nested-payload contract under `custom-app-screens-recap`.

| Current VA range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| `0x14016c4b0..0x14016e1f2` renderer | `0x16b8b0` | 7,490 | `76715cb61a4f47348669179eefb11d3d6e182433f9f3ca07948748fbcc4b15dd` |
| `0x140181d70..0x14018254a` terminal | `0x181170` | 2,010 | `04b3692c689977300694fda0dbd99658ea89f71caeed8418b57c9f3df761a1bf` |

The address-masked hashes are
`ba3aa8d4872b38d393f105bedbaa8f2d4fc03cdb28a76196b2afefb596532c01`
for the renderer and
`eb13e6163999eb864957096ecbecce38a43812e13fb67a7ee5ded8fec7783111`
for the terminal. The reconstructed `gameplay/terminal_view/recap.rs`
consumes the retained `DeathRecap` fields and uses the terminal generation
for modal lifetime. The [0.139.2 capture, grouping and delivery
proof](death-recap-0.139.2.md) stays bound to its target. Those producer and
delivery edges, helper internals, numeric behavior and actual input/rendered
lifetime lie outside this 0.140.0 result. See [verification
#300](../verification-needed.md#gap-300).

Static byte, boundary, branch and dataflow checks support these local
correspondence results. Compilation, in-game comparison and parity remain
unverified.

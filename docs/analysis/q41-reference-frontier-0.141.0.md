# Encoded references and ownerless flow — 0.141.0

Permanent [#41](../CURRENT-STATE.md#gap-41), selectors **Q41-A01, Q41-A02
and Q41-G01**. The installed EXE SHA-256 is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This review uses the independently verified [selected Ghidra census](native-census-0.141.0.md)
and [residual inventories](evidence/0.141.0/native-residuals.json).
The [reference proof](evidence/0.141.0/encoded-reference-frontier.json) records
the input commitments and complete structural projections. The independent
encoded and Ghidra reference populations overlap and must be counted separately.

## Q41-A01: declared references

All 3,988,020 encoded direct/address/memory records are classified by
operand, PE destination and saved body membership. The 126,346 records
targeting executable addresses outside saved bodies comprise 113,504
same-extent branch records and 12,842 address operands. No encoded direct
call or memory operand in this population targets an unowned executable
address. An unwind extent can contain several observed bodies, alternate
branches, and mixed code/data. A same-extent jump therefore establishes
local encoded flow without creating a new callable function.

The narrower projection selects 2,757 records whose source body or source
or destination unwind extent has a genuine Survivors Rust Location.
Of the 2,752 same-extent jumps, 345 target observed ownerless instruction
starts and 2,407 lack an observed start there. The other five records
are all LEAs forming observed ownerless targets:

| Operands and targets (preferred VA) | Bounded role |
| --- | --- |
| `0x140201235 → 0x1401df4e0` | The Options path stores the address in a local descriptor at `[rbp+0x568]`. Its thunk tail-jumps to `0x140125800`, which walks 56-byte rows and releases their owned allocations before releasing the backing allocation and other owned fields. This identifies cleanup glue; the selected LEA alone does not prove invocation or the concrete type name. |
| `0x145df1345`, `0x145df16f0 → 0x144c813b0` | These sites write formatting argument descriptors consumed at `0x145df137e` and `0x145df172e`. The adapter dereferences its argument and tail-jumps to `0x146386670`, which reads one unsigned byte and emits decimal digits through the formatter. This identifies a formatting boundary, without assigning the surrounding save/jewelry record a new meaning. |
| `0x145f19f0e → 0x145fd1f70`, `0x145f19f15 → 0x145fd1fc0` | Enemy definition byte `+0x4c` is compared with zero at `0x145f19ecd`. `CMOVNE` selects the nonzero leaf at `0x145f19f1c`; `call rcx` consumes it at `0x145f19f47`. The leaves have the retained scalar operation order and cubic bits `0x3bc2a455` / `0x3be6afcd`. Inputs are seconds divided by 60 and the product of the zone and difficulty scales. The output multiplies the flagged/ordinary base HP factor before the late-run term. |

The enemy selection maps to the
[0.120.0 contract](q41-enemy-callback-0.120.0.md) and live
[`health_polynomial` and its caller](../../crates/azeroth-survivors-re/src/enemies/scaling.rs).
The checked current branch, arithmetic and immediate consumer agree with the
source. The wider [enemy constructor finding](../CURRENT-STATE.md#gap-139)
retains its own applicability limits. The other three operands do not
establish a missing Survivors mechanic or a source defect.

### Marker geometry and local continuations

The 2,752 local branch records span 46 AS-Location-associated PE extents.
The 285 branches in `0x1400c7280..0x1400ccbf6` are the largest
marker-associated group. Two early targets separate geometry from vector
storage. The branch at `0x1400c7f90` skips freeing an empty allocation
before `0x1400c7fa8` calculates the edge width as
`min(0.3 * input, 0.9) * scale` and passes it to the arc geometry path.
The branch at `0x1400c800c` skips vector growth when capacity already
covers the append. Both paths lead to the same next geometry operation.

The guarded dispatch at `0x1400ca5b9` subtracts five from the original
tag and admits normalized indices 0 through 4. The five signed cells at
`0x146567804` hash to
`e7cb397c8acf4c87c51e737e2039331a58a7a4e052f6326b40ee209ced33afdf`.
Raw tags 5 and 6 read inline floats at row `+0xb0..+0xbc`. Raw tag 7
uses a point vector at `+0x38` with a count at `+0x40`. It requires
more than two points and ordered progress above 0.01 before generating
filled vertices. It divides each XY by the count before adding to the
centroid. The vector and scalar loops at `0x1400cc709` and
`0x1400cc7e4` then apply `(point - centroid) * progress + centroid`.
Raw tags 8 and 9 share the empty fill route at `0x1400caf4b`.

The native part serializer's dispatch at `0x145f9a1a8` sends case 7 to
`0x145f9a5ee`, which builds the vector payload and joins at
`0x145f9b121`. The string reference at `0x145f9b16c` passes exactly
four bytes of `poly` and the call from `0x145f9b242` supplies the
`v` field. Case 6 instead publishes `rotor` from `0x145f9a977`.
These are distinct part serialization lanes.

The `atk` receiver at `0x1400c1a30` identifies `poly` at `0x1400c2b3c`
and `rotor` at `0x1400c29af`. It reads `poly.v` as a flat numeric array,
converts its entries to f32 and groups complete XY pairs. The rotor reader
loads `len`, `w`, `a0` and `a1` into the four inline fields. Position updates
keep the shape payload and change length only for tags 2 and 4. The shared
clock fields are `f0` at `+0x6c`, `t2` at `+0x70`, attack `t0` at `+0xd0`
and `t1` at `+0xd4`.

The body table at `0x1465677f0` selects Sweep at `0x1400c7e65`, Rotor at
`0x1400c8438`, and Polygon at `0x1400c8266`. Sweep builds the four starting
corners and four translated corners, then `0x1400bfe20` removes turns at or
below 0.001 in the two sorted hull passes. The ground projection uses the
resulting hull and outlines its edges. The starting rectangle gets an extra
0.6-thickness outline when length is at least width. This restores the live
[Surgical Rush](scholomance-krastinov-0.141.0.md) warning across its full
18-yard route when the arena permits the full ray. Rotor's body covers the
angles from `min(a0, a1) - margin` through `max(a0, a1) + margin`, with
`margin = atan((width / 2) / max(length, 0.1))`, and outlines the starting
rectangle. Polygon uses its authored contour and 0.9-scaled edges. The
shared polygon helper centers the bounding square, takes the inward edge
planes from `0x140030120`, and projects with depth `half_extent * 0.25 + 4`.

Sweep and Rotor share the moving fill branches. During active time, style 9
projects the rectangle at the linear position or angle. During windup the
early preview cycles at 0.9 seconds with style 8. The last
`min((t1 - f0) * 0.5, 1)` seconds use style 6 and progressively fill the
swept hull or the rotor sector and current rectangle. Safe and fading parts
skip these moving fills. The paint dispatcher at `0x1400b2ca0` mixes styles
8 and 9 toward white by 0.35 and 0.4, with alpha/additive pairs
`(0.3, 0.15)` and `(0.8, 0.4)`. Polygon keeps its separate centroid fill.

The [rebuilt receiver](../../crates/azeroth-survivors-re/src/gameplay/raid_markers/scripted.rs)
and [terrain projection](../../crates/azeroth-survivors-re/src/gameplay/raid_markers/geometry.rs)
connect the wire and presentation branches above. The serializer runs both
on initial publication at `0x145f9e8a2` and on retained 224-byte attack rows
at `0x1460396ad`. A live server-side constructor selecting tag 6 or 7 remains
unidentified. Neither variant is assigned to an encounter by the client
repair. Compilation, the two authored Rust regressions, gameplay and rendered
comparison remain open under [#313](../verification-needed.md#gap-313).

The static check compared both five-cell geometry tables, paint entries
8 and 9, 11 wire keys, 14 calls, nine style/mask operands, eight f32
constants, and the four Ghidra result digests. Pinned rustfmt parsed both
changed Rust files.

| Exact PE entry | Slice SHA-256 | Ghidra result SHA-256 |
| --- | --- | --- |
| `0x1400c1a30` | `7d5b3768a7a1ae256730a4f94a5c9570e55d384c3eb43059001c978da9e727d1` | `e25c1c5d5340d1244021d35f142a25752587dd3e536efa6a9cab8bf21081c783` |
| `0x1400bbe60` | `7aed140b4c7e1c0a206cca041ff1a62027b5aca36d0486bb0bfbef27e20d1d2b` | `da4cffb852e60f236013a8e5962e69337d294092ec6dff9ab90795297ac91355` |
| `0x1400bc810` | `4093d8f88bc118a84ddc7a9da61f8604140460ecbd62dc16f711767c5f57c75e` | `2508a0bc35e04c117abad67e6a60c12980c6b42555e054bbc76810794aa25db9` |
| `0x1400b9530` | `9c37dd2f6b31072c086802bee9936ed37a00c79113f9e4acc8a959390f257d56` | `6704d321a5527f784f25df3b78979461f8d2c113df0ccb4bb44cf300d542e6e2` |

Ghidra Evidence
`ev_7abe0626246bc1e32c32f2165d142d90a4450377fed91854c04851ae01817669`
is bound to the exact 22,902-byte owner slice at file offset `0xc6680`,
SHA-256 `a9225c4fb71094594a13fede3babaca05cc32f75e8df9235dbc980616f8170d1`.
The result SHA-256 is
`d44bab9924a6c18a6396d82a37fe9a9c409c42d2e72d9f506b852d3ebc61e2ae`.
The PE table and continuation instructions supply the indirect cases
outside the raw-slice pseudocode.

## Q41-A02: complement references and imports

All 13,280 non-indirect complement records have a saved source-body owner:
1,628 address operands, 18 direct calls, 10,360 direct jumps and 1,274
memory operands. All direct destinations are owned. The only executable
unowned destinations are eleven of thirteen LEA targets; all eleven are
observed instruction starts. The proof records every executable-address
operand and the union of sites whose source or destination body has a
custom diagnostic association.

The 126 fixed RIP-relative IAT transfer sites use `jmp [rip+disp32]` to
119 named PE import slots. The checker resolves the displacement directly
from each instruction in the installed EXE. No other complement operand
addresses an IAT slot. This classifies the static Windows import boundary;
the loader's live pointers, executed targets and OS behavior remain outside
the evidence.

Twelve of the thirteen executable LEAs form callback addresses in repeated
adapters. The receiver preserves R8 and stores it at allocation offset
`+0x10` (for example `0x142524987 → 0x142548030`, store
`0x14254849f`). The allocation also holds a context word at `+0x18`. All
twelve vtables have header `(drop=0, size=16, align=8)`. The methods
consume the stored function and forward the result to `0x145bff8a0`;
representative method calls are at `0x140709225` and `0x140706b21` for
vtable `0x146978a30`. The observed leaves are ten caller-buffer writers,
a scalar `0x101` result and one owned RET-only leaf. The 36 saved direct
caller references to these adapters have no joined diagnostic paths, so
the concrete registering subsystem and dynamic execution remain open.

The shared sink at `0x145bff8a0..0x145bff948` (file `0x5bfeca0`,
SHA-256 `ae40e430bfe092a3bb02b5bb0c76d5eb10387f4a321c3cb3ae94436fa96aca3d`)
uses an indexed 48-byte storage descriptor on one branch. It copies the
returned value into the selected row and writes the same incoming dword to
two parallel row arrays. The other branch forms a 96-byte descriptor and
tail-transfers to `0x145c00af0`. That path bounds a sparse index against
`+0x58`, resolves it through the `+0x50` array and optionally drops the
previous row before copying the new value. Its prefix through
`0x145c00b87` (file `0x5bffef0`) has SHA-256
`a2a0c799ff2a9485c608a4746b9fd3d5411765798686eb0e21139fa81fe08e74`.
These stores classify the callback result's immediate consumer as shared
component storage. The pair of storage paths and the captured function pointer
and component ID correspond to Bevy ECS 0.18.1's
`RequiredComponentConstructor::new` and
`BundleInfo::initialize_required_component` in the pinned dependency.
The former captures a `fn() -> C` and component ID. The latter writes the
constructed value through the table column or sparse-set branch.

Three of the twelve constructor values identify their component types:

| Registering call to adapter | Constructor | Component default evidence |
| --- | --- | --- |
| `0x143c66b9a → 0x14452dc50` | `0x14452df90..0x14452dfc1` | `SpotLight`. White, 1,000,000 intensity, range 20, bias 0.02/1.8, near plane 0.1, and outer angle π/4. |
| `0x143c68eba → 0x144550fa0` | `0x144547930..0x144547963` | `PointLight`. White, 1,000,000 intensity, range 20, bias 0.08/0.6, and near plane 0.1. |
| `0x143c6a0da`, `0x143c6a6d7 → 0x14457b3a0` | `0x144571fc0..0x144571fef` | `DirectionalLight`. White, 10,000 illuminance and bias 0.02/1.8. |

Each adapter passes the constructor in `R8`, loads the other registration
arguments through the incoming descriptor in `RDX`, then tail-transfers
to the registration implementation. These constants and the corresponding
`#[require]` declarations in the pinned Bevy light components identify
ordinary required-component registration. The selected leaves do not prove
which application code instantiated each component. The other nine adapters
retain the same shared storage boundary. Their concrete type IDs and
registration sites remain open where a Survivors dependency can be established.

The other LEA, `0x1463a5014 → 0x1463a5024`, passes a filter
checking C++ exception code `0xe06d7363` and its parameter magic to
`kernel32.dll!SetUnhandledExceptionFilter` through `0x14654f8d8`. It is
generic Windows runtime context.

| Selected custom-context site | Current boundary |
| --- | --- |
| `0x14074cee0` | Stores the `noSpellEffects` byte at `0x148ac3488`. Producer `0x140051da0` loads the exact key, trims its value and tests for one ASCII `1` before the tail transfer. Chain-beam and destination-effect consumers read the flag; rebuilt `spell_settings::hidden` supplies the corresponding gate. |
| `0x1408b1180 → 0x1409a3e60` | The previously mapped [host world reset](world-anchors-0.141.0.md) tail transfer. |
| `0x145e957b4 → 0x145ef38f0` | The sole caller at `0x145e9f2ec` comes from opcode `0x56` in table `0x147aec530`. The wrapper checks party discriminant 3, the peer index, the tagged `0x8a0`-byte peer row and its available game before serving a single-item query. The rebuilt [item-query command](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs) scopes the lookup to the recipient slot. The item registry and recipient-text findings retain their broader limits. |
| `0x145fb9cd1`, `0x145fc10bb → 0x145fb7120` | Both wrappers gate pending offers, phase 1 and a clear `+0x10dd` flag before passing `EDX=0, R8B=1` to the offer generator. The first requires `+0x10e7=0xff` and sets `+0x10d9`; the second writes `+0x10d8` and takes the admitted false branch. The rebuilt [level-up controls](../../crates/azeroth-survivors-re/src/gameplay/mechanics/completion.rs) have separate store-level and spend routes to common generation. The wider [upgrade contract](../CURRENT-STATE.md#gap-91) owns the remaining field and dispatcher semantics. |

## Q41-G01: ownerless instructions and reference sources

The [instruction proof](evidence/0.141.0/as-ownerless-instructions.json)
partitions all 123,402 ownerless instruction records. The complete
Survivors Location slice has 2,827 records in 83 runs and 26 declared
extents; 27,508 other records have a non-AS diagnostic extent, 51,108
are in extents with no diagnostic context, and 41,959 are outside declared
extents. The checker independently verifies the bytes and length of every
instruction in the Survivors slice. It proves 337 terminal instructions
(47 whole runs) by following local direct flow, including both branches of
each conditional, to a checked failure wrapper or `UD2`. Both branches
of the additional wrapper at `0x14654d94b` end in `UD2`, adding 28
verified instruction rows to the four existing wrapper routes.

All 298 saved Ghidra references targeting the selected ownerless starts
come from other selected instructions: 151 conditional jumps, 101
unconditional jumps and 46 computed jumps. The converse projection finds
110 direct edges from observed ownerless starts into saved bodies with a
genuine AS Location: 68 calls and 42 jumps. Of the calls, 57 enter the
localization bodies `0x145e788b0` and `0x145e78c90`. Thirteen jumps rejoin
the font body `0x145dd6ba0` and twelve rejoin the attack-script body
`0x145f4a110`. Both projections are static observations. The saved pass
lacks a complete incoming-flow proof; Ghidra's missing edge is not evidence
that a fragment is unreachable.

The other 2,490 instructions occupy 36 runs in seven extents. The
selectors retain partial-run failures separately from unresolved local
exits. These anchors identify paths to reuse; they do not assign complete
semantics to the enclosing runs.

| Declared extent start | Instructions without a terminal proof | Existing path or next boundary |
| --- | ---: | --- |
| `0x140205c20` | 7 | [Options header removal](q41-diagnostic-consumers-0.141.0.md#returning-removals). The three instructions at `0x140206f30` prepare the Location and call the returning stable-removal helper. The four at `0x140206d66` forward the returned state to the shared continuation at `0x140206190`. |
| `0x145dd6ba0` | 41 | [Existing font filter proof](font-table-publication-0.141.0.md#dispatch-and-rebuild). The eight instructions at `0x145dd9057` dispatch and test `hdmx`. The 33 at `0x145dd9158` finish exact tag matching and publish the replacement or rejoin the original payload path at `0x145dd91e9`. Both runs fall within the verified original tag and payload replay. |
| `0x145f4a110` | 307 | [Attack-script dispatcher](scholomance-barov-0.141.0.md); connect the remaining guarded branches to their script and actor state. |
| `0x145f51870` | 850 | [Ability payload](status-weakening-0.139.2.md#ground-periodic-and-self-aura-payloads-in-01410) and [totem replacement](unknown-recovery-0.141.0.md#q41-d01-immediate-consumers); follow unresolved descriptor inputs and dispatch. |
| `0x145f8e670` | 120 | The 4, 40 and 47 instructions at `0x145f8ebbd`, `0x145f8efa3` and `0x145f919cc` reach the existing [kill-reset selector, admission and deadline clamp](kill-selector-0.139.2.md#kill-reset-and-prepared-selectors-in-01410). The 29 instructions at `0x145f92491` reach the existing [Darkmantle displacement and replacement](q41-diagnostic-consumers-0.141.0.md#returning-removals). |
| `0x145fbbf50` | 266 | The five admitted [spell and treasure card variants](#choice-card-variants) now reach the shared rebuilt payload and presentation. |
| `0x145fc1500` | 899 | Choice acceptance and selected row application, followed by [shared completion](#choice-completion-and-republish). |

The largest remaining cluster, 899 instructions in `0x145fc1500`, belongs
to the successful choice consumer. The guard at
`[0x145fc154c, 0x145fc1592)` requires phase 2 and a non-sentinel offer
source, checks the zero-based index against the row count, and indexes
160-byte rows. Its file offset is `0x5fc094c` and SHA-256 is
`368266ce855aed3cf458fb40e701b18d17be599e72a6904a286f672d4e411a9e`.
Two command paths call it at `0x145e73e58` and `0x145ef89c3` with the
index from command byte `+1`, after admitting a zero offer generation or
an exact match against `[Game+0x1054]`. The existing
[`pick::admits`](../../crates/azeroth-survivors-re/src/coop/pick.rs)
and [live choice consumer](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs)
already connect this gate, the row bounds check and choice application.
The packed formatter calls at `0x145fc2372` and `0x145fc2644` sit inside
the chooser; their diagnostic adjacency does not assign this extent to the
detailed meter. The [diagnostic consumer trace](q41-diagnostic-consumers-0.141.0.md)
separately resolves these operands as equipment display names and follows
the card title to its live producer. The variant and republish proofs below
cover their separate boundaries. The suffix at
`0x145fc32f9..0x145fc330c` loads the selected source byte and calls completion
at `0x145fb8d80`. The verified completion prefix saturating-decrements the
level, cache or guardian count at `+0x103c`, `+0x1040` or `+0x1044`, then
clears and drops the 160-byte offer rows. The [rebuilt completion](../../crates/azeroth-survivors-re/src/gameplay/mechanics/completion.rs)
has the same separate source counters and shared offer closure. The suffix
at `0x145fc330d` drops temporary strings and vectors allocated by selection.

### Choice completion and republish

The [current completion proof](evidence/0.141.0/choice-completion.json)
extends the retained Ghidra completion query to its outgoing branches.
The sweep at `0x145fb8e34` reads the selected hero's XY at `Game+0x5e0`
and the current pickup radius at `+0x670`. It removes in-flight XP and
stationary XP within that radius in stable order. It sums raw XP with
32-bit wrapping, skips a zero sum, and shares the combined raw value once.
The collector's scaled value is rounded and floored to one even in co-op
at `0x145fb8fa9..0x145fb8fd8`. The hero swap exchanges the XY lane at
`0x145f37bc8..0x145f37bf9`. The rebuilt seated action now supplies the
selected hero's admitted position to completion and applies the same
one-XP floor there.

The tail at `0x145fb8fdd` selects a cache, then guardian equipment, then
an eligible level offer. It preserves choice phase for a chained offer.
The final branch clears the source and spending flag, restores phase 1
and replaces all existing spell 1020 rows with one expiring at run clock
plus one second. It then emits ordinary SpellGo (`0x132`), with the player
as the caster and sole hit, flags `0x100` and no explicit target, refreshes
the player's aura fields, and queues `{"type":"resume"}`. The optional
Gossip close depends on a populated alternate-presentation handle. The
[desktop capability trace](coop-command-ingress-0.141.0.md#desktop-and-guest-gossip-capability-initialization)
keeps the desktop custom overlay on its existing route.

The rebuilt completion now queues the spell and aura projection immediately.
Both simulation ticks preserve pre-tick packets for the existing client
drain. Clearing the queue during the same update as an accepted choice
could drop those packets as well as XP object removals and player fields.
The stored-level command at `0x145fb9ca0` requires pending levels, playing
phase and no active offer before setting the spending flag. The rebuilt
command now refuses to arm spending during a cache, guardian or level offer.
The Store Levels setter at `0x145fc1090` requests generation on the disabled
branch only. The native suppression byte at `+0x10dd` is clear in the
ordinary run constructor; its other producers are outside this trace.

The republish helper at `0x145fc10c0` serializes the existing offer when
phase is 2 and the source byte is active. Otherwise it emits resume. The
stale-pick route at `0x145e73f24` already reaches the rebuilt recipient's
republish through the request generation counter. It does not regenerate
the cards or spend another reward.

`scripts/check-coop-overlay.py --choice-completion` checks eight hash-bound
PE spans and replays 66 cases for scheduling, spending admission, XP credit,
aura compaction and choices-versus-resume dispatch. The XP replay supplies
the zone lookup and CRT rounding seams. The resume replay stops at the
packet serializer and checks its arguments against the serializer's
instruction anchors. Compilation, packet delivery and gameplay remain open.

### Solo movement at choice boundaries

The first offer changes phase to 2 and calls the solo stop publisher.
Chained offers, rerolls and banishes retain phase 2 without repeating the
stop. The final completion restores phase 1 and republishes movement
before the resume spell. Both publishers use the same snapshot collector.
It visits live hostile rows, combat followers and loot companions in
native vector order, filtering out completed splines. It samples at the
current run clock without changing the simulation's motion or deadlines.
The stop uses MonsterMove type 1. The resume uses type 0, run flag
`0x100`, one destination and at least one millisecond of remaining travel.

| 0.141.0 preferred VA range | SHA-256 |
| --- | --- |
| Open dispatch `0x145fb8270..0x145fb8291` | `cbc40b0ffb20767f26df1c853db855e9820348ba27f9dd41c71105bd676eac5b` |
| Resume dispatch `0x145fb90c4..0x145fb90dc` | `dc7dc4b95d49c72c81df8a27b9183ad459f188e7de87df732a14d43a8d382cd8` |
| Stop publisher `0x145f61210..0x145f613d1` | `99343e1939b19954a3526bd579b32b9bcc919724a7e7b34b944d40c88b9adbaa` |
| Resume publisher `0x145f6a900..0x145f6ab91` | `ce3485ff0116af5a82f3b2e9801ebff5b7d901f6ed55c1b71707f56a24709f1f` |
| Snapshot collector `0x145f87480..0x145f876c9` | `4b06d1de8024bceea8ce8414ec78de4ac244dddc9b648a3c5af42f881e18b784` |
| Hostile selector `0x14602d610..0x14602d97b` | `196dff1c36a49d9dfe9fd166a9cf11bd3f33d3e878e9b102e6226ddcc29fe335` |
| Follower selector `0x14602da60..0x14602ddae` | `7ea390120219f0214f9d057e437c93d811d370890a9ab6af971fe1c88702767a` |
| Loot companion selector `0x14602d1e0..0x14602d530` | `ac2026ebc97983e82a8d79548c4b97b15d8771dc99dca43e7511dffe8b0e1955` |

The verified Ghidra result for the collector is
`ev_b102880d268d256f190bf997821a09a1b044f9f4239c8a7c4d1317431bd3b059`.
Its three selector results are
`ev_897a3119f5e6fbd18c5ffa6f67d5f653c20327a3de5cf4c968440ee52903356e`,
`ev_7ab71434c77d18188983e8eaadcfe5120c8c5d790055c25daf41d59960d814c4` and
`ev_7d3ffbdf004c476260f1b7731b19186d2dd9cbadd9a6e2ad954553f9b1c813eb`.
Four journaled receipts, 10 PE spans and 30 instruction anchors were checked.
The packet anchors include opcode `0xdd` and move type at `0x145fe4306` /
`0x145fe439d` for stop, and `0x145fde936` / `0x145fde9d4` for resume.

The [rebuilt collector](../../crates/azeroth-survivors-re/src/gameplay/mechanics/terminal_movement.rs)
reuses the terminal movement owner's actor ordering. It captures the endpoints
at the transition and leaves terrain sampling to the
[existing packet projection](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs).
The projector uses the resident primary/indoor height path and preserves the
captured height on a miss. This shifts height sampling to the client event
drain. Verify endpoint heights and rendered stop/resume timing in the client.

### Choice card variants

The [card variant proof](evidence/0.141.0/choice-card-variants.json) binds
the five constructor cells at `0x147af39f4` in `0x145fbbf50`. The
learned-spell path applies the rarity bonus and carries its text in both
the plain summary and a separate highlighted line. Ordinary upgrades carry
their ordered effect lines and the subtitle's previous and next ranks.
Jewelry compares the current and awarded totals. Soulstone instead shows the
awarded increment after clamping it to the player's remaining life slots.
Same-key amulets retain their equipped payload and rarity and compare the
current and next pick count. The comparison owner pairs equally shaped numeric
spans and marks changes with `»`.

The writer at `0x145fb9ce0` publishes the original icon keys, rank,
new-jewelry worn count and replaced-amulet fields. The parser at
`0x1401b03f0` displays the first learned-spell line as plain text and
highlights subsequent lines. Gold highlights the amount from `text`.
Upgrade, jewelry and amulet cards highlight the `lines` field.
The [shared card producer](../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs)
and [renderer](../../crates/azeroth-survivors-re/src/gameplay/native_overlays.rs)
now use those fields in solo and guest views. The co-op publisher carries
the original icon key independently of local image loading.

`scripts/check-coop-overlay.py --choice-variants` verified the current
query receipt, 5,036 decoded instructions, 68 instruction anchors, eight
data anchors and 22 native dispatch and preview cases. The card layout
source guards also passed. The producer query exposes the indirect switch
boundary. The original PE table and instruction spans supply the branch
proof. Full description leaf values and locale resource parity retain
their own evidence boundaries. Arbitrary payload aliases remain under #41.

### Gold credit for selected offers

The [choice credit proof](evidence/0.141.0/choice-gold-credit.json) joins the
two origin branches and their common row and recipient. The empty level offer
branch at `0x145fb7f4c` passes 25 to the builder at `0x145fbbf50`. Cache
origin 1 calls `0x145fbef40` at `0x145fb71cb`. Its fallback at `0x145fc0282`
passes `max(price >> 1, 60)` to the same builder. Both use payload tag
`0x8000000000000004`. The builder writes the tag at row `+0x78` and the raw
u32 at `+0x80` before publication.

After the phase, index and active-source guards, the selected effect dispatch
at `0x145fc1747` maps tag 4 to `0x145fc1aaf`. The call at `0x145fc1ab8`
passes the Game and raw amount to `0x145f87c00`, the same [party credit helper
already traced for Skip](coop-command-ingress-0.141.0.md#guest-gossip-option-ingress).
It shares the raw reward when a party is active and updates the local collector
before completing the offer. The rebuilt level and treasure selections now
use their shared `credit_pickup_gold` helper. Previously both paths scaled and
added gold locally and bypassed the party queue and player-value publication.
The normal reward ordering and completion paths are covered under
[#91](../verification-needed.md#gap-91) and [#63](../verification-needed.md#gap-63).

Six bounded original-instruction cases check the level and cache origins,
raw amount boundaries, row stores and selected helper arguments. The replay
resumes after copying the unrelated display strings and stops before the
credit helper. It checks both live call sites and verifies two completed
Ghidra query receipts for the selected-card and completion owners. Actual
party delivery, gameplay and original/rebuilt comparison remain open.

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs \
  python3 -B scripts/check-coop-overlay.py --choice-gold
```

Of 848,784 saved reference records with sources outside bodies, 823,580
are data references from `.pdata`, `.rdata`, or PE headers and 25,204
originate at observed instructions. The data references are not missing
instruction records. The full Ghidra projection separately reproduces all
11,205 distinct unowned executable destinations from 15,305 saved references.
No function ownership was added.

### Attack geometry and ability payload continuations

The 285-instruction selector at `0x145f4c76c..0x145f4cd0b` is the
scripted attack geometry update. The switch decodes the high-bit shape
tag at `[rbp+0x1a0]`, rejects tags above five at `0x145f4c754`, and
uses the six signed cells at `0x147af30c0..0x147af30d8` (SHA-256
`0c8497c56770408d21c15e8fb497a4ea5c6bb1b7131fc408a513265b44d92865`).
Tags 0 and 1 require update mode 1 at `[rbp+0x1e8]`. Tags 2–5 require
mode 2, with the direction calculation at `0x145f4c8ed` and endpoint
clipping calls at `0x145f4c881`, `0x145f4ca0b` and `0x145f4cb7d`.
All accepted variants repack the updated geometry at `0x145f4cc32`.
The companion 22-instruction selector at `0x145f4ce04..0x145f4ce70`
handles the replaced owned payload, copies the new fields into the live
part and marks the row dirty at `0x145f4ce5c`. The selected branches
belong to the existing [tracking and lock producer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/gandling.rs)
and [arena clip](../../crates/azeroth-survivors-re/src/gameplay/mechanics/scripted_arena.rs).
Exact producer-to-shape admission across all scripts remains separate.

Four ownerless dispatch sites in the 850-instruction ability selector
read the native descriptor status tag at `+0x68`, normalize tags 1–11
and fall back outside that domain. The tables are separate consumers of
one typed payload.

| Site | Table VA / SHA-256 | Selected consumer |
| --- | --- | --- |
| `0x145f53e53` | `0x147af3210` / `1ba73a382944813426268e65a5cb22a787b65f9ae3cf03846ea38e6cf73760b8` | Ground periodic queue. |
| `0x145f5402e` | `0x147af323c` / `52e7b90641b3c14c4f3f4df70d1c9d4575db8c97c5d85ccff06745afad9ceb25` | Status triplet passed to `0x145f5a1f0` after the ordinary immediate damage call. |
| `0x145f546c9` | `0x147af3134` / `0d8b220bd9eb15b9445157c89ceeb3ae2aa18bc89774d030be615c84828446dc` | Self aura and Battle Shout publication. |
| `0x145f5499b` | `0x147af318c` / `75715b5af92e31be4de1c858bac115cf2ba56c02bd5324bfb7e37928204d52bd` | Alternate cast status packer leading to `0x145f5d990`. |

The [typed ground and self-aura proof](status-weakening-0.139.2.md#ground-periodic-and-self-aura-payloads-in-01410)
already accounts for the first and third tables and their current
descriptor values. After the immediate status call, the 169-instruction
range beginning at `0x145f54240` re-finds the living hit victim. It follows
the exact `fire_nova` key check and equipped effect tag 58. In a party it
counts live Flame Shock 8050 rows with the unassigned owner sentinel or
the active party slot. It sums remaining ticks times per-tick power and
hands the Cinderheart hit to the common damage owner without removing
those rows. This is the existing [Cinderheart consumer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/enhancement.rs).
The selected totem continuation starting at `0x145f54d0b` is the
replacement object-field and event publication after the [proved stable
removal](unknown-recovery-0.141.0.md#q41-d01-immediate-consumers).
These checks assign roles to the exact continuations. Additional
descriptor variants, arbitrary effect aliases, and all presentation and
timing validation remain open.

## Remaining questions and checks

Use the exact extents, runs, terminal subranges and incoming selectors in
the proofs to follow remaining admitted code. In particular, do not reopen
the 74 [diagnostic operand roles](unknown-recovery-0.141.0.md#q41-d01-immediate-consumers),
the five A01 LEAs, or the A02 import and exception interfaces simply because
the raw pass still reports ownerless observations. Remaining local and
dynamic dispatch, typed state, and caller-to-source questions stay under
#41 or their existing mechanic findings. The gold credit discrepancy was
repaired in the two selected paths above.

```sh
python3 -B scripts/classify-q41-as-references.py --encoded-frontier
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/classify-as-ownerless-sites.py --instruction-frontier
```

The selected EXE and retained inventories are read in place. These checks do
not compile, launch the target or prove original/rebuilt parity.

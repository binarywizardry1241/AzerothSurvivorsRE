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
component storage. The concrete component types and registration owners
remain open.

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

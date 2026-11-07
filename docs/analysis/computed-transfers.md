# Computed transfer classification

The installed EXE is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This classifies [Q41-F01 and Q41-F02](unknown-recovery.md)
under [#41](../CURRENT-STATE.md#gap-41). The
[residual manifest](evidence/0.141.0/native-residuals.json) binds the independent
instruction databases, selected Ghidra instruction and reference exports,
diagnostic owners, and both exact indirect-site lists.

## Exact populations

The selectors are `sqlite_selectors[lead_id=Q41-F01]` and
`sqlite_selectors[lead_id=Q41-F02]` in the
[queue inventory](evidence/0.141.0/unknown-recovery.json). The operand pass
matched each selected site and transfer kind to the residual list and checked
its decoded instruction bytes against the installed PE. It used Capstone and
the existing [operand decoder](../../scripts/classify-independent-indirects.py).
Fixed RIP-relative slots were joined to the PE import directory and DIR64
relocations. Jumps were joined by site to the applied and candidate lists
in the [guarded switch proof](evidence/0.141.0/native-switch-proposal-review.json)
under the `guarded-2/guarded-proposals.json` input.

| Structural class | F01 calls | F01 jumps | F02 jumps |
| --- | ---: | ---: | ---: |
| Declared import slot | 1,404 | 50 | 126 |
| Fixed slot with an initial relocated pointer | 3 | 1 | 0 |
| Fixed slot without a declared binding | 8 | 0 | 0 |
| Applied guarded table | 0 | 2,664 | 341 |
| Unapplied table candidate | 0 | 503 | 23 |
| Other register operand | 26,508 | 7,346 | 137 |
| Register-relative memory | 46,430 | 81 | 37 |
| Indexed memory | 23 | 0 | 1 |
| **Total** | **74,376** | **10,645** | **665** |

F02 contains zero indirect calls. The 3,005 applied sites in these two
selectors are an intersection with the 3,936-site Ghidra population. The
independent and Ghidra counts describe different views of the same PE.
The candidate rows retain their unproved guards or incoming conditions.

The four relocated F01 transfers use one `.rdata` slot at `0x14654fe90`,
initially `0x1463a5790`. The eight other fixed transfers use six zero-initialized
`.data` slots at `0x148a79dc0`, `0x148a79dd0`, `0x148a822a0`,
`0x148a822a8`, `0x148a90e20` and `0x148ac30a8`. The fixed-slot roles and
indirect stores are traced below.

### Fixed transfer slots and initialization

The PE load-configuration directory at `0x147b95d50` points to
`0x14654fe90` at offset `+0x78`. The slot's relocated initial pointer
reaches `jmp rax` at `0x1463a5790`. At `0x1463a48ea`, `0x1463a50aa`
and `0x1463a50e6`, the caller supplies RAX from the selected runtime
callback entry. `0x1463a57b0` forwards to the same guard-dispatch slot.
These four transfers belong to the PE runtime dispatch interface.

The independent declared-reference inventory adds address-taking sites
that the Ghidra read-only projection misses. Four setter wrappers check a
Once state at slot `+8`, then pass the slot address and the caller's
function pointer to its initializer. The closure at `0x140e2ac60` takes
the pointer and writes it through the saved destination at `0x140e2ac89`.
The other two closure copies have the same sequence and write at
`0x14292c819` and `0x1460ab7e9`. These indirect stores explain the lack
of a direct write reference to each fixed slot.

| Slot | Producer and consumer | Classification |
| --- | --- | --- |
| `0x148a79dc0` | Startup `0x140044b0e` registers `0x145e13560` through setter `0x14074cea0`. Read at `0x141442b78`. The resolver checks the `0xf00000` base and uses the synthetic description index. | AS tooltip text override, connected through [LocalItemDescriptions](../../crates/benilla-app/src/local_client/item_descriptions.rs). |
| `0x148a79dd0` | Startup `0x140044b1a` registers `0x14006e8c0` through setter `0x14074ce70`. Read at `0x141442420`. The callback reaches set descriptor builder `0x145e32390` and its `0xa000` set family. | AS item-set override, connected through the [local set publication](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs) and [tooltip resolver](../../crates/benilla-app/src/ui_items/sets.rs). |
| `0x148a90e20` | Startup `0x140044b26` registers `0x145e35ee0` through `0x14074cf10` and setter `0x142a2f4d0`. Read at `0x142a2f561`. The callback joins an equipment ID vector to star bytes and calls `0x145e35390` for set-bonus activity. | AS bonus-activity override, connected through the existing `set_bonus_active` source. The native helper also admits tier 7 at `0x145e35654`. |
| `0x148ac30a8` | At `0x14143e644`, the three-byte `out` flag gates registration of `0x140784670` through setter `0x1460906c0`. The successful outbound World send calls it at `0x14608ea0b` with opcode, payload pointer and length. | Shared opt-in packet tracing. The registered callback formats the diagnostic row. |
| `0x148a822a0`, `0x148a822a8` | The Once record at `0x148a82290` uses closure `0x1418ec480`. The factory at `0x1418f07f0` resolves four `ntdll.dll` symbols through the `GetProcAddress` import at `0x14654f940`. The writes at `0x1418f0865` and `0x1418f0869` supply `NtDeviceIoControlFile` and `RtlNtStatusToDosError` to aggregate offsets `+0x10/+0x18`. The closure copies both in one 16-byte write at `0x1418ec4f9`. | Shared Windows networking and error conversion. The factory requires all four addresses before publishing the success record. |

| Preferred VA range | SHA-256 |
| --- | --- |
| PE load configuration `0x147b95d50..0x147b95e90` | `61f2c9b5ca6b7b76a6f5662f45064eeb7eb9a7ecf069b71da109829efc700d34` |
| Three AS registrations `0x140044b0e..0x140044b32` | `858594f7add6801a0ea580145bbf8686fa67a4dc627ccd08589e2e6996913b90` |
| Shared Once closure `0x140e2ac60..0x140e2ac91` | `b9fe7b48ce211fca40d95c3fa2c821e7e70d35069fd2ab2cc75276c1c477162d` |
| Windows initializer `0x1418ec480..0x1418ec50b` | `285e6b6542d9a6f02d51e1140f8998bf1a9fc7565336d2729e74c8e95f8ca4f9` |
| Windows symbol resolution `0x1418f07f0..0x1418f08c0` | `e511281be5ff7dcb639441f35c5f1d028bf4d4d2299d2712b053589f1a8ad81d` |
| Outbound trace gate `0x14143e644..0x14143e665` | `8c3f7876f4641fb8b93c7e09d9e55c8770b6035811f19a5e39a410cbd864d491` |

This assigns the selected fixed transfers to their native producers and
consumers. Live Windows loader pointers, dynamically executed callback
order and UI/runtime parity remain separate.

## Q41-F01 declared-range AS context

Joining the residual site's `source_owner` to `actual_body_owner` for
`crates/wenilla-rogue/` and `crates/wenilla-rogue-app/` diagnostics gives
194 same-body contexts across the 435 diagnostic-bearing body owners. The
194 comprise eight declared imports, 45 applied guarded jumps, three unapplied
table candidates, 54 other register jumps, 46 register calls and 38 calls
through register-relative memory. This join is a way to prioritize sites.
Separate extent, caller and typed-input evidence can also establish AS
connections, as the co-op app dispatcher below demonstrates.

### Three unapplied AS-context candidates

The same-body join selects the following three `candidate_tables` entries
from `guarded-2/guarded-proposals.json`. The 256-value proposals cross
actual instruction boundaries. The exact producers narrow their next actions.

| Transfer | Original prefix and bounded interpretation |
| --- | --- |
| `0x145ef89a5` | Prefix `0x145ef8993..0x145ef89a7` reads the command byte at `[r8]`. The first eleven signed cells at `0x147af2de8..0x147af2e14` all enter the local party command extent `0x145ef8950..0x145ef8e32`. Their SHA-256 is `a0e63d7be81906edae734b07acbe193d898bc3cb5ef0090021da341693541bf9`. Cell 11 of the broad candidate leaves that extent and lands inside an instruction. The known selection, Skip and refresh cases retain their [existing source owners](coop-command-ingress.md#guest-gossip-option-ingress) and [party control handler](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs). Follow actual command constructors for any remaining alias. |
| `0x145f1bcf4` | Prefix `0x145f1bccd..0x145f1bcf6` loads Game bytes `+0x2a5` and `+0x2a6`. Zero `+0x2a5` takes a separate path. The other path uses `+0x2a6` as the index into `0x147af2ec8` and carries `+0x2a5` into the destinations. This lies in the [hit source and combat-packet owner](combat-meter-attribution.md#source-selection). Follow the scoped writes to both fields before treating any finite prefix as the full domain. |
| `0x145f25cd5` | [Guardian wake and leash](#guardian-wake-and-leash) resolves all four return tags of `0x145e5ff00`, their caller records, and their source consumers. |

### Guardian wake and leash

The [party actor owner](coop-incoming.md#shared-inputs-and-recipient-state)
loads the lair position at `0x145f25b63` or substitutes the sampled actor
position for an invalid lair index. At `0x145f25cbe` it passes the actor,
home, selected player position and clock to `0x145e5ff00`. The four signed
cells at `0x147af2f04..0x147af2f14` have SHA-256
`06a6fc45ae1c64a441d32b5da67be675ad45a384200eedce585f9215b13f2ecf`.

| AL | Destination | State and consumer |
| ---: | --- | --- |
| 0 | `0x145f25cd7` | Sleeping. Wait for any positive-duration spline to finish and queue a home trip only if the XY distance exceeds two. Keep the existing movement refresh deadline. |
| 1 | `0x145f25e88` | Newly awake. Damage wakes the guardian from any distance. Otherwise it wakes within three XY units of home and twenty XY units of the player. Queue its GUID for the later engagement consumer and fall through to ordinary combat. |
| 2 | `0x145f261da` | Outside the awake leash. Restore current health to maximum, clear the selected state and rebuild recurring timers from half their repeat values. Queue movement home even for a zero or short trip, set the refresh deadline to arrival and clear the cast state. A second queue carries the reset GUID. |
| 3 | `0x145f25f23` | Continue the admitted combat path. An awake guardian within the inclusive 97.5 XY leash returns this tag. |

The cooperative branch at `0x145f25b94` searches other hero records only
when the awake guardian's selected hero is outside the leash. The helper
`0x145efd4c0` admits phase-one heroes within 97.5 XY units of the lair and
chooses the nearest by squared XY distance, preserving the first equal row.
The caller changes actor slot `+0x118`, sets movement refresh `+0x1d4` to
the clock and copies the alternative position to the leash decision record.
The ordinary combat continuation still reads the original active hero's
position at `[rbp+0x70]` and the original active Game lane. The rebuilt
[guardian adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs)
uses the alternative for the leash check, and the
[actor frame](../../crates/azeroth-survivors-re/src/gameplay/mechanics/actor_frame.rs)
applies the new slot after it drains already collected actions.

The reset GUID consumer at `0x145f29603` re-finds the actor after the
engagement queue. It takes the 16 aura IDs from actor `+0x158`, removes
the nonzero IDs in order except Darkmantle 8647, and sends field 22 with
the ceiling of maximum health. The common aura writer skips a dead actor
at `0x145f356fa`. The rebuilt guardian reset now runs both publications
through the existing aura and unit-field routes. The separate idle and
reset movement paths reuse the active slow and whirlwind speed calculation.

| Preferred PE VA range | SHA-256 |
| --- | --- |
| Guardian selector `0x145e5ff00..0x145e602b6` | `1ca8f2c20dd809e276cb88dac94d8c00f39e60bf160c36c83174fec6422c4b6f` |
| Cooperative target selector `0x145efd4c0..0x145efd635` | `02ea4214353080a25bd02271e0a33b506290659d5036143131400445ba11498b` |
| Cooperative admission `0x145f25b94..0x145f25c35` | `3b0f0e1250b99963306821d9ef0abb362c61db577df63b531efa69f267071547` |
| Sleeping return `0x145f25cd7..0x145f25e88` | `26e4da00a0c5ac3e1642a98fbe16810182ea340ac6a4e716aa37642811b6582d` |
| Reset queues `0x145f261da..0x145f26406` | `c99a6bc89e83034aaa798566ea061ec00b3c02b72f6f2f9c75f608724f920f06` |
| Reset publication prefix `0x145f29603..0x145f29785` | `3ad1a75b0424efd6f930ce079eea7b4e56988d7ba66d6fe4441a11aa8c45846d` |

The saved Ghidra query at `0x145e5ff00` returned Evidence
`ev_37344173f0ab6a0008ee539bb8e18f4172cc174d5d74f67a438540222d3f98c2`,
result SHA-256 `b6f938dfe6b879a7b9d69933899c33ece4f627842afbd9bab8fe9935ae0d175e`.
The query journal's 950-byte raw subject matches the selected EXE at file
offset `0x5e5f300`. The code/data replay follows the caller and table outside
that slice and supplies allocator, ceiling and packet-builder seams.

```sh
PYTHONPATH=runtime/tests/query-python-deps \
  python3 -B scripts/check-raid-guardian-lifecycle.py --leash
```

The checker passed 26 bounded cases with 476 distinct instruction
observations across the four replay families. Compilation, terrain and
rendered movement, health and aura packets, and original/rebuilt co-op
actor-pass ordering remain in [#89 verification](../verification-needed.md#gap-89).

### Three additional CreatureQuery tables

The [host ingress trace](coop-command-ingress.md#nested-creaturequery-selectors)
identifies thirteen applied tables inside opcode `0x60`. Three additional
tables in the same owner are present in the independent F01 list. The
zero-filled entry reaches `r14d` at `0x145e9efeb`. The special-template
lookup at `0x145ea057c` sends its null branch to the first two guards.
The third guard follows the higher entry-family checks at
`0x145ea1e26`. Each table uses signed dword offsets from its table base.

| Jump | Entry interval and guard | Table VA / file offset | Cells / destinations | Table SHA-256 |
| --- | --- | --- | ---: | --- |
| `0x145ea0c38` | 600–693, subtract 600 and take `jbe` at `0x145ea0af8` | `0x147aec824` / `0x7aeae24` | 94 / 17 | `f6b6a01787e7f7a33058af82def73138b19aa6709b04d46002921c04fe32e4b9` |
| `0x145ea0b2a` | 9510–9532, subtract 9510 and reject above 22 at `0x145ea0b08` | `0x147aec99c` / `0x7aeaf9c` | 23 / 17 | `06a0a1d52f044228f529567fc2711f60a364a23220859e9d375698b04444d564` |
| `0x145ea1e59` | 1406–1494, subtract 1406 and reject above 88 at `0x145ea1e3e` | `0x147aed888` / `0x7aebe88` | 89 / 16 | `6d825c71337363c4cdbb341091eb59622720a89536d5205872aa618e9b74dca6` |

All 206 cells land on exact instruction starts in the original ingress
extent. Following the case blocks yields 16 catalog rows in the first family
and 15 in the third. The ordinary name/zone-name consumer at `0x145ea0f2f`
reads display/type/rank from descriptor offsets `+0x24/+0x2c/+0x4c`.
The boss consumer at `0x145ea0ebe` reads display/type at `+0x44/+0x4c`
and supplies rank 3. The companion consumer at `0x145ea1030` reads the
name pair and display at `+0x24`, and supplies `Companion`, type 1 and
rank 0. Sixteen companion rows match, including `9532` Devilsaur Matriarch
with display 5238. Entry 9513 and entries 9524–9529 go to the fallback
instead of reading a companion descriptor. All three hit paths reach
`0x145ea06ac`, which calls the response builder at `0x145ea06d2` and
joins the existing recipient writer at `0x145ea10ba`.

The 47 selected rows agree with the raw name, display, creature type
and rank in the [shared catalog](../../crates/azeroth-survivors-re/src/guardians/catalog.rs)
and [query-specific source](../../crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs).
The 600 and companion selectors continue `retained-table-145afb3fb` and
`retained-table-145afb49a` from the
[0.120.2 proof](creature-query-tables.md#thirteen-stable-table-questions).
The 1406–1494 table covers the high part of the earlier 1000–1494 family.
Exact current fallback paths, other descriptors, localized values and
recipient cache behavior stay under [#64](../CURRENT-STATE.md#gap-64) and
[#65](../CURRENT-STATE.md#gap-65).

The journaled raw Ghidra query used the hash-verified
`0x145e9e690..0x145ea2004` slice, SHA-256
`ac64bb527d54f19058a76a4de5493ed1738f366ddec5c6d49a41b4c70ad21daa`.
Its exported evidence retained record
`ev_2985ec9d16f306e6a2d3a582c99725bdd4c2fd3aa3b74c861f943944a917245a`
when the inline response exceeded the transport limit. The shared
pseudocode object has SHA-256
`ab2a3b5781a8a6bf86af904e8ec1f32bf4ba6f209059faa4f56075cefb615ec8`.
The exact PE reads supplied the tables outside that slice and the dispatch
blocks absent from its Ghidra body.

### Co-op form and app action dispatch

The [local poller trace](coop-relay-selection.md#local-poller-commands)
accounts for all eight destinations at `0x145ea7797`. The app-side jump
at `0x1401046a7` supplies an additional typed action selector that has no
same-body diagnostic in the join above. The pressed check at `0x14010467e`
admits zero and the load at `0x14010468e` reads the action byte from `[r9]`.
All 18 observed signed dword cells at `0x14656d95c..0x14656d9a4` land on
instruction starts in `0x140104120..0x14010590a`. The cell range starts
at file offset `0x656bf5c` and has SHA-256
`5cef3e7c3699e2de550449c22ab283954b2a11dc262680d0f74a3bf308697a00`.
The jump itself supplies no numerical bound on the action byte.

The original instructions distinguish the actions within this table.

| Action byte | Destination | State change or request |
| ---: | --- | --- |
| 0 | `0x1401046a9` | Select the tab at payload byte 1. Lobbies clears field focus and shares the refresh path, Host selects field 1, and Code selects field 4. |
| 1 | `0x14010497c` | Sample the refresh clock and queue tag 22 at `0x140104f5d`. |
| 2 | `0x140104844` | Bound the original directory row index against the retained `0x128`-byte rows. Check the row's eligibility and password flags. The password branch selects Code and password focus. The other admitted branch sets `joining` and queues the Pick and Join records. |
| 3, 4 | `0x14010492b`, `0x140104789` | Pass form discriminants 1 and 2 to `0x1400eb9a0`. That helper sends Pick tag 12 first, then Host tag 23 or Join tag 24. |
| 5 | `0x140104a34` | Queue Leave tag 25 before clearing local party and chat presentation. |
| 6, 7 | `0x140104d18`, `0x14010495a` | Clear the co-op open latch or set the field focus from payload byte 1. |
| 8, 9 | `0x140104d58`, `0x1401047df` | Bound the member index and read the Hero GUID at `+0x1b8` of its `0x1d0`-byte row. Queue Kick tag 26 or populate the inspection state. |
| 10–12 | `0x140104d36`, `0x14010429d`, `0x1401047b8` | Store the capacity byte or toggle the two directory filter bytes. |
| 13, 14 | `0x140104b8e`, `0x140104707` | Cycle the retained zone or difficulty selection from the complete directory rows. |
| 15, 16 | `0x140104907`, `0x1401046e9` | Set the private flag to the complement of the visibility action byte, or open the separate Difficulty state. |
| 17 | `0x14010499e` | Take the chat draft, clear the draft slot and queue tag 27 only when the trimmed span is nonempty. |

### Local lobby Leave

Case 5 sends tag 25 at `0x140104a46`. It then zeros the party role
length at UI `+0x50`, sets status to `off`, drops the `0x1d0`-byte
member rows and zeros the code length at `+0x68`. The badge branch at
`0x140103bee` reads that same role length. A zero value selects
`Play with friends` before the badge reads the member count or code.
The Leave branch drops the same 64-byte chat rows and clears the same
draft and unread fields as the independent status consumer at
`0x140107e1a`. Both advance the two chat change counters through the
same vector subtraction pattern.

The rebuilt [lobby input](../../crates/azeroth-survivors-re/src/coop_ui.rs)
now queues Leave and runs the existing local departure and chat reset
inside the click handler. The picker caption, lobby rebuild and chat
presentation read cleared state in the same update. Previously the
role and chat remained populated until the directory and runtime poll
in the next `First` schedule. The network request still reaches its
existing drain. A source regression covers the local state and ensures
the next status poll does not advance the chat epoch again.

| Preferred PE VA range | File offset | SHA-256 |
| --- | --- | --- |
| Lobby input owner `0x140104120..0x14010590a` | `0x103520` | `c4f3002400f9cf0fb7509a103f5ea236841eb88c3270838a044b104199f1424a` |
| Leave status, role, roster and code `0x140104a34..0x140104b8e` | `0x103e34` | `5d01bf67385e70b5761f6ed7e5fc0718015db6442c3b1c998255b6a831c87e05` |
| Leave draft, unread and counters `0x140104d9d..0x140104dd5` | `0x10419d` | `498f97193951049de42851c8a6d07ba5b018cafe35e4d58eda5d1d58656fcfd5` |
| Matching status consumer `0x140107e1a..0x140107ea8` | `0x10721a` | `701ba4fa462e74e02833ce0ecb41b9d92741fd26e9e170f66f478e719e1973fa` |
| Badge role gate `0x140103bee..0x140103cce` | `0x102fee` | `f34870f8226bee9381c0bb8e9e8d4f4741a83edd81f4c4681b55a48e6a84c252` |

Ghidra Evidence `ev_e20db60c9f2ea7869f7059552e46fe9ace9860bae2bf2e098f66c516fecb7462`
uses the 6,122-byte lobby owner slice above. The completed operation and
result digests are respectively
`87179636b27c2fa47fc6b9ff5d0978d86fee928b83dd2e9a4afb37ca403f1fd1` and
`117f548323448c45d1b87df24c4166ca6c15d29e2337e6dab2fc6d387dd2915f`.
Exact PE bytes supply the external action table and badge/status routines.
Compilation, live lobby updates, and original/rebuilt parity remain under
[#150](../verification-needed.md#gap-150).

### Chat submission

The Chat destination `0x145ea7df2` calls the normalizer at `0x145e385a0`.
It filters control characters and Unicode White_Space, joins nonempty
spans with a single ASCII space and caps the result at 160 UTF-8 scalars.
The 246-byte normalizer at file offset `0x5e379a0` has SHA-256
`866ffe7446296ffbe322c22fdae47680d68bbcff8d0d9756e00044b0eed9b7d0`.
Its journaled Ghidra result digest is
`2899301f9b2c80805a2a82ee88b0ad308cb2f6fb1785008c2e1811078dfce1d9`.
This matches the [existing chat normalizer](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
and its [admitted host and guest consumers](../../crates/azeroth-survivors-re/src/gameplay/coop.rs).

### Relay event rows after the transport pump

The locked wrapper at `0x145e8da50` runs the
[outer pump](coop-relay-selection.md), drains its retained event
vector and clears the original length at `0x145e8dab4`. The poller loop
advances by 120 bytes at `0x145ea3fcc`. A first word of `-1` terminates the
iteration. It normalizes the negative first word by XOR with the sign bit,
uses an out-of-table value 10 for a nonnegative first word and admits
indices 0–9 at `0x145ea40af`. The 40-byte signed table at
`0x147aed9ec` hashes to
`1320b0464ccb7445225ba2e218b27f8d9193c3dd5b24b381d6d545d83d353f8c`.

| Row index | Wire response | Local destination and immediate effect |
| ---: | ---: | --- |
| 0 | 20 | `0x145ea40d7` calls the directory row formatter at `0x145da3dc0` and publishes the resulting `lobbies` record. |
| 1 | 21 | `0x145ea4459` takes the Hosted text, checks the retained local state, constructs the host role and publishes `hosting`. |
| 2 | 22 | `0x145ea41c0` takes the Joined text and reaches the distinct guest role constructor. |
| 3 | 23 | `0x145ea4545` forwards the reason to the status publisher with `denied`. |
| 4–6 | 24–26 | `0x145ea3fa6` drops the row if it reaches the local poller. The outer pump already owns peer creation, departure and received bytes. |
| 7 | 27 | `0x145ea456c` retires retained state and reaches the `closed` publication at `0x145ea46dd`. |
| 8 | 28 | `0x145ea3fa6` drops the unit row. |
| 9 | 29 | `0x145ea42ac` transfers the structured profile payload and replaces the retained profile on the admitted path. |

The [wire decoder](../../crates/azeroth-survivors-re/src/coop/directory_wire.rs)
and [directory pump](../../crates/azeroth-survivors-re/src/coop_directory.rs)
use separate source arms for these wire types. The native peer and payload
arms operate in the transport pump before its local status consumer. The
reconstruction keeps that ordering in the selected send and reset paths
already traced in the relay report. The [form credential repair](coop-relay-selection.md#host-and-join-form-credential-lifetime)
connects both request producers and both role consumers through the same
take-on-reply password slot. The constructors at `0x145ec7000` and
`0x145ec7250` test both local game `+0x10` and party role `+0x1100` for
Off independently of password ownership. For wire 29, `0x145ea4303`
tests the directory slot and the admitted branch moves the profile into
`+0x1ee0` through `+0x1f48`. The absent-directory branch reaches the
existing [guarded Hero4 refresh](coop-replication.md#guest-login-and-synchronized-recipients)
at `0x145eca010` and drops the new profile. On the native pump's ordinary
path the same directory slot is required before collecting the event vector.

The transport collection writes each source bit into its 32-byte row.
At `0x145e83efe..0x145e83f9f` the bit and the current secondary's presence
gate the secondary handshake state. A valid non-refusal marks it admitted
and clears the retry deadline. Refusal closes it, forwards the first
refusal before admission and consumes refusal after admission. The existing
`SecondaryLifetime::admit` connects those state distinctions. The original
profile path and secondary-admission slices hash to
`5b1159536b2d70e1d6f417ad779e3d9285720894fadc6762bd8d0ec4040f0337`
for `0x145ea42ac..0x145ea4459` and
`3bb586706f25f8fb474ab37b8b8812d285c24bbf745121b7a2687c8c4576b66f`
for `0x145e83efe..0x145e83f9f`. External relay behavior remains under
[#63](../CURRENT-STATE.md#gap-63) and [#206](../CURRENT-STATE.md#gap-206).

## Q41-F02 outside declared ranges

All 665 sites have a saved spatial body owner. None shares a body with
an AS Rust Location in the diagnostic join. The 126 IAT jumps use 119
declared slots. The 341 applied guarded sites account for 7,807 cells,
whose signed offsets and hashes match the original image. There are
198 other sites beyond the import and applied-table partitions.

To find AS caller context, walk backward from each F02 site through the
complement inventory's decoded fallthrough and direct jumps, stopping at
terminal edges. Join `seeds(target,source)` for the visited starts to
`(site,target)` in `declared-reference-roles.tsv.gz`, then join
`source_owner` to `actual_body_owner` for AS diagnostics. This finds
34 distinct F02 sites with an encoded AS caller context. The compact
JSON-lines projection of each hexadecimal site and its sorted
`[source, source_owner, path, seed]` tuples has SHA-256
`7b39a57edadad50eb0fe1bdd04e081746dd0eabb6b7a76f9e5bed2105022ba18`.
Twenty-one
reach declared imports, eight match applied tables, and five require
separate treatment. The five comprise one locally guarded Codex table,
two tables that rely on a typed domain and two receiver-slot tail calls.
This is an encoded path join. It leaves indirect callers and arbitrary
runtime receiver aliases open.

The Codex table at `0x145e06796` reads the tag at `+0x44` and limits
it to 19. Its table at `0x14771ae3c` has SHA-256
`fb3ee46c549859e5c87cd63cb9712ef17fe6ae59a01c75957c4726584794c6a5`.
The `0x145e90ab6` owner-only packet switch is reached by the poller
call at `0x145eaab4f`. It agrees with the existing opcode classifier's
fixed list and its three payload-length-dependent branches.

The applied table at `0x14604a075` has a current AS producer and
consumer in the [guest Gossip option path](coop-command-ingress.md#guest-gossip-option-ingress).

### Codex jewelry stat labels

The exact call to `0x1400f2a80` is at `0x1403728e2` in the
[Codex Details owner](codex-growth-dispatch.md#admitted-growth-ceilings-in-01410).
The earlier producer at `0x1403723d0` loads the descriptor through
`0x148ac2ba8`, checks the selected index against the slice length and forms
the `0x48`-byte row in R12 at `0x1403723eb`. The call passes that pointer in
RCX. The selector reads row byte `+0x44`, jumps through the 20 signed cells
at `0x14656d8e4`, and tail-calls the locale lookup at `0x145e78800` with the
label pointer and length. The caller pairs the returned label with the
earlier slot label through the format program at `0x1465c5580`.

The [stat label proof](evidence/0.141.0/codex-stat-labels.json) reuses the
exact Codex owner query and verifies all 20 cells and all 23 initial rows.
The English labels match the effective Codex assets, including the Mystaria
delta. The [live Details consumer](../../crates/azeroth-survivors-re/src/codex.rs)
uses `entry_text.tag_label` in the 12px subtitle. This bounds the installed
row domain and subtitle branch under [#73](../CURRENT-STATE.md#gap-73).
The leaf has no local range check. Alternate producers, dynamic locale-map
state and other Details branches retain their separate evidence limits.

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-codex-growth-dispatch.py \
  --proof docs/analysis/evidence/0.141.0/codex-stat-labels.json
```

### Shared color comparison and receiver dispatch

The meter switch at `0x140439d90` belongs to the tagged color equality
leaf `0x140439d70..0x140439dc9` (file `0x439170`, SHA-256
`e4acf0cc9015582f47ddb8f2d4905d20a6494b6b0a73accb75b1e5767929eb7b`).
It rejects unequal dword tags before indexing. All ten signed dword cells
at `0x1465ce060` (file `0x65cc660`, SHA-256
`623cd6b67ddf378905d88cf336c3ad60ff6cf9b4a0ca948f3f7dead278851ba2`)
reach the same comparison of four f32 fields. A NaN or unequal field returns
false. This is consistent with the pinned Bevy `Color` enum's ten variants and
derived `PartialEq`. The declared reference selector has three calls at
`0x14041e77a`, `0x1404244e2` and `0x140427963`. The meter call at `0x1404244e2`
constructs tag zero with `(0.78, 0.78, 0.78, 1.0)` and updates the existing
value on inequality. The [rebuilt meter paint](../../crates/azeroth-survivors-re/src/gameplay/meter.rs)
uses the same inactive sRGB color. The checked boundary identifies comparison
and writeback. The [meter tint repair](meter-scroll.md#minimap-tint-change-detection)
connects the change-tick guard in the live paint path. The other callers'
wider paint and change detection retain separate evidence limits.

The tail edge at `0x146347d96` dereferences the input pointer, reads its
first word as a dispatch table and jumps through slot zero. The edge at
`0x14638ac23` dereferences the input pointer and tail-jumps through the
receiver's `+0x18` slot. The declared reference projection records 621 and
879 direct call/jump operands to their entries respectively, with another
nine complement jumps to the first entry. These are shared dispatch leaves.
The AS caller join alone does not identify a concrete receiver or writer.

## F01 local commands and hit packet keys

The declared direct-reference projection has one caller of
`0x145ef8950`, at `0x145ec9a83`. Its wrapper requires party discriminant
3, an in-range peer with tag 1, and an available Game. The assigned slot
comes from the peer's `+8` field. Positive assigned slots within the
Game roster enter the separately recovered seated locale wrapper at
`0x145ef8baa`. The direct arm takes the same typed command, including
the host slot. The [wire admission](coop-replication.md#engine7-and-control8)
limits Control8 to subtypes 0–10. The other wrapper caller at
`0x145e9fd97` uses the [Gossip option translation](coop-command-ingress.md#guest-gossip-option-ingress)
and excludes the `0xff` sentinel first.

The eleven entries at `0x147af2de8` select Pick, Reroll, Banish, Skip,
ordinary flush, Abandon, Spend Levels, cache-click option, Store Levels,
guardian tracking and republish, in that order. Pick and Skip compare
the nonzero offer generation at command `+4` against Game `+0x1054`
and take the same republish on mismatch. The native option stores are
`+0x10d7`, `+0x10d8` and `+0x10d0`. The source routes these through
[party control](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs)
and its [generation handling](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs).
The Ghidra query at `0x145ef8950` returned Evidence
`ev_0b27250de7f254d6e377d86e3360fb2a1c8ef8d45958178ca8dd3c447fd886b4`,
result SHA-256 `e3bc080d6c5aa1d11afa24ccaca37ba8d98089ac2e82a0cbf96187a5dc5c5889`.
Its 1,250-byte raw subject matches file `0x5ef7d50..0x5ef8232`, SHA-256
`252861fd1a913d434e7a78699549994a27b4fa0562892770416d3274e65bab88`.
The original PE table supplies the case destinations outside that slice.
The existing host-control checker passed 336 bounded seated cases.

The hit packet switch's first four cells at `0x147af2ec8..0x147af2ed8`
have SHA-256 `7af9c9b0d06a62163d3321b8683b995160bdefb8068b3af7ca6c0d22bf714ec2`.
The apparent fifth cell is the start of the adjacent table selected at
`0x145f1df72`. The command-strike producer at `0x145f95506` sets
`+0x2a5/+0x2a6` to `1/2`. The periodic bleed writes source kind 1 at
`0x145f28505`, and the Matriarch area completion writes source kind 3 at
`0x145effe28`. These writers retain their separate effect and mode checks.
Kind 1 with meter mode 2, owned effect `+0x30/+0x38` and equipped tag 62
chooses `Bleed`; kind 3 with mode 2, owned effect `+0x20/+0x28` and tag 63
chooses `Shockwave`. Kind 2 can use the captured attack label from
`+0x238/+0x240`. All three feed the same attack-key formatter
`0x145e19b40`. Other admitted branches go to the ordinary source selector
`0x145fa3b10`. The [pet producer report](pet-meter.md#source-and-attack-identity)
and [rebuilt hit adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs)
retain the exact named source, original hit owner and separate meter share.
This accounts for the selected packet-key dispatch and its typed producers.

The four destinations are respectively the fallback at `0x145f1bdc1`,
Bleed at `0x145f1bcf6`, captured label at `0x145f1bd3f` and Shockwave at
`0x145f1bd88`. The captured branch uses the installed descriptor at
`+0x268` unless `+0x261` is 2. The common path at `0x145f1bd53` also
admits kind 2 with `+0x261` unequal to 2. The ordinary pet producer
`0x145f97ee5` installs kind 2 before calling the hit owner and restores it
afterward. It supplies a dedicated Bite descriptor only on the Matriarch
path. The scoped Howl write at `0x145f1bb48` sets mode/kind to 2/2 and
passes spell 24604 to the recorder at `0x145f1bba8`. It restores the
saved pair and label before the packet dispatch. Those two writers
correspond to the existing [ordinary pet and separate Howl paths](pet-meter.md).

### Hit source writers and death qualification

Both switches read the same Game source-kind byte `+0x2a6`. The second
switch at `0x145f1df82` has four signed dword cells at `0x147af2ed8`.
The raw bytes are `b9b042feacb042fef1b342feb7b042fe`, SHA-256
`34fc004f3f336c9e3b7746581ed392b4327ba3f659644880a3af6afca05f0bf0`.
The ordered remaining-HP comparison skips the selector for a surviving
or unordered victim. On death, kind 0 uses the ordinary-source predicate
from `+0x40/+0x284/+0xc7c`. Kind 1 enters `0x145f1df84` and tests
`!Game+0x30`. Kind 2 enters `0x145f1e2c9` and admits the death. Kind 3
enters `0x145f1df8f` and clears that admission. Both boolean consumers
at `0x145f1eda6` and `0x145f1ee02` call `0x145fad2b0`, which checks the
exact `soul_fire` learned key, the shard cap and the credit deadline before
the existing [Soulfire launcher](soulfire.md). The adjacent
Redemption path consumes the same qualified death. The [source gates](../../crates/azeroth-survivors-re/src/player_abilities/behavior/hit_passives.rs)
already encode these four cases, including the ordered HP boundary.

The two packet-name rows and two death-admission rows answer
`Q41-U01` entries 52710–52712 and 52714. The bounded writer audit confirms
the periodic Bleed and named pet producers above. The demon writers at
`0x145f5c05f`, `0x145fb0eb3`, `0x145fb16d3`, `0x145fb4070` and
`0x145fb582a` install kind 2 for captured demon hits. The explicit label
stores identify Conflagrate, Consume Magic and Inferno. They restore the
saved source byte and captured descriptor after the nested hit. The
[demon impact](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demon_bounce.rs),
[Consume Magic](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demon_post_hit.rs)
and [demon cast](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demon_spells.rs)
source paths already carry the scoped attribution. The hit owner's
recursive effect writers install and restore kind 3, distinct from
the ordinary kind 0 route and the temporary meter-only Heroism/Howl writes.

The completed Ghidra query `ev_a1bf545acb74d615e2d63128bb08b32843b7d548162060e49f3caa2dbf213783`
binds the exact `0x145f1adf0..0x145f1fd2b` slice at file offset `0x5f1a1f0`,
SHA-256 `cb0097e01dce6c69b958f241fda2304a412e6af3ed761b0b7043ac724dd0cf29`.
Its shared result hashes to `5e719c6d75e3841f85f3989aade6e57b1c86837d99fc6bfc2070bd76966647de`.
The original PE cells supply the external targets missing from the raw
pseudocode. Whole-image aliases, unrelated proc formulas and executed
hit ordering retain their separate proof boundaries.

## F02 shared failure cleanup

The declared-reference projection joined against all 435 AS diagnostic
body owners finds six direct AS-context calls to the slot-zero entry and
sixteen to the slot-`+0x18` entry. They are callers of the shared leaves
and do not identify a single concrete receiver type.

All sixteen direct slot-`+0x18` callers with an AS diagnostic body share
the same tagged-error cleanup interface. They test the low two bits,
admit tag 1, subtract one and place the pointer in an owned stack slot
before calling `0x14638ac20`. The leaf dereferences that slot into RCX
and jumps through `[rcx+0x18]`. The retained staff-key case has a Kill
Command diagnostic in the same extent. Its producer resolves
`WOW_ROGUE_STAFF_KEY`, `APPDATA` and `XDG_DATA_HOME`. The read call at
`0x145eeebb5` has the tagged cleanup gate and empty fallback in the
[staff key reader](../../crates/azeroth-survivors-re/src/coop_directory.rs).

| Diagnostic body | Exact call sites |
| --- | --- |
| Legacy config | `0x140017c3a`, `0x140017d84`, `0x14001820b`, `0x14001838d`, `0x140018eb9` |
| Discord | `0x140093287`, `0x1400934c0`, `0x14009354c`, `0x1400941bb` |
| Ready Check-associated bodies | `0x14012d14e`, `0x14012d305`, `0x14012d482`, `0x1401e5150`, `0x1401e5299` |
| Options | `0x140201adc` |
| Staff-key reader | `0x145eeec50` |

The six direct slot-zero callers are content/navigation/terrain reader
failures. Their guards compare an output record's first word with `-1`,
then pass its adjacent error receiver to `0x146347d90`. The leaf loads
the receiver's table and jumps through its first slot. This binds the
selected cleanup paths to failed read/parse results, while the actual
error payloads and callback assignments remain separate.

| Exact call | Result storage | Producer or branch |
| --- | --- | --- |
| `0x145da2d2d` | `[rbp+0x20]/[rbp+0x28]` | `0x1462a6180` failure; retain the sentinel. |
| `0x145da3158` | `[rbp+0x168]/[rbp+0x170]` | `0x1462a66a0` failure. |
| `0x146009430` | `[rbp+0x30]/[rbp+0x38]` | `0x14623cf50` failure; retain the sentinel. |
| `0x1460094fd` | `[rbp+0x30]/[rbp+0x38]` | `0x146264f70` failure; initialize an empty result. |
| `0x146009a4c` | `[rbp+0x190]/[rbp+0x198]` | `0x1462a66a0` failure. |
| `0x14600bad6` | `[rbp-0x48]/[rbp-0x40]` | `0x1462a66a0` failure. |

| Preferred VA range | SHA-256 |
| --- | --- |
| Staff-key read and failure `0x145eeebad..0x145eeec55` | `75a76dbf3c8882e74bf2d9d7e0347161dd8cdaf19ac0207758dcc5a21a631191` |
| Terrain reader failure `0x1460093ee..0x146009436` | `93462aee2f53db1b2dbf1559512d9e8caeb49b9f998ee584b4c00c34967887e6` |
| Slot-`+0x18` entry `0x14638ac20..0x14638ac27` | `8cbc0a542f5641e293d6cd9000bf03935dc3f901b09ae90e646366af6a2bc396` |
| Slot-zero entry `0x146347d90..0x146347d99` | `2a3c53712037a9d42bacd07d0803c4777e37dfeaa7a1d3e13309402b16a7f265` |

The slot-zero receiver is concrete on the selected M2 read and parse failures
and the WMO read failure. The three branches call `0x1465346e0` from
`0x1462a645d`, `0x1462a64d1` and `0x1462a69c3`, then store the returned
owned pointer beside the `-1` result sentinel. The helper allocates `0x58`
bytes and writes table `0x147b6d5b0` in its first word. Table slot zero is
`0x146207fd0`, which drops the contained context and owned error and frees
the `0x58`-byte allocation. These are shared asset-error destruction routes.
The helper span `0x1465346e0..0x14653478c` hashes to
`d6be1b03370b4df813aefa3fbccc4987d422d0062ad83f08758e046917d7ba4a` and
the destructor `0x146207fd0..0x14620803b` to
`5c8c3bfd0c938d8265c72d958a87b1cd795aaaa1ef5a2378fce758225087400d`.

The shared text-I/O error constructor at `0x146348f40` calls
`0x1463781f0`, which allocates 0x28 bytes and writes destructor
`0x1463758c0` at receiver `+0x18`. The wrapper at `0x14637b900` publishes
pointer+1. Its destructor drops the contained data through `0x146389e50`
before freeing the allocation. An invalid create/truncate request reaches
this producer from `0x146353cf1`. The staff-key reader at `0x1463686d0`
passes read-only flags. Its ordinary open and read failures have tag 2
and allocation failure has tag 3. Invalid UTF-8 returns aligned static
error `0x147b877d8`. These admitted failures bypass the tag-1 callback.

| Preferred VA range | SHA-256 |
| --- | --- |
| Custom error object `0x1463781f0..0x14637826b` | `32e9405282d534585d45c340deff874dfecf7b620e6bf3c365d348d363d61d17` |
| Custom error destructor `0x1463758c0..0x1463758f5` | `59ed25076aa68555bc7923cb9752e86e06b5a8028e42f38d8e42970501e8139f` |
| Staff-key reader `0x1463686d0..0x1463688aa` | `648cb1f361885d019a02aef189fe8f3661683b2ff9c0afd77c5cf7e86e6c9244` |

The selected caller paths establish shared failure cleanup. The remaining
runtime receiver question is a concrete AS use of another typed assignment,
if found through an incoming producer. The 539 non-IAT stops under
`Q41-U04` are the same runtime-operand jumps in the F02 partition, including
the 341 applied guarded tables. The other 198 retain the exact F02 selector
for unresolved ownership or assignment. Runtime dispatch and original/rebuilt
parity remain separate.

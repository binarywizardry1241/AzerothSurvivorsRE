# Host engine-command ingress in 0.141.0

The installed EXE is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This covers selected commands under [#63](../CURRENT-STATE.md#gap-63)
and the host counterpart of [#67](../verification-needed.md#gap-67).

The owner at `0x145e9e690` reads the u16 engine opcode from `r9w`.
The branch at `0x145e9e761` dispatches NameQuery, ItemQuery,
GameObjectQuery and CreatureQuery along with LogoutRequest.
The branch at `0x145e9e71c` dispatches five inventory refusals,
CastSpell and SetSelection. These two tables select opcodes directly.
The later tables include entry selectors within an admitted opcode.

| Original range | File offset | SHA-256 |
| --- | --- | --- |
| Owner `0x145e9e690..0x145ea2004` | `0x5e9da90` | `ac64bb527d54f19058a76a4de5493ed1738f366ddec5c6d49a41b4c70ad21daa` |
| Low opcode table `0x147aec530..0x147aec588` | `0x7aeab30` | `1fb8a2b13ca9d8a5c5c9785e8ede48b902185e1a871d8e80a64e7e385403084a` |
| High opcode table `0x147aec588..0x147aec658` | `0x7aeab88` | `29ddd0de6273ccadaa0fb4893aefc0162f3a725abe90c9fb35a22824590d022c` |

GameObjectQuery `0x5e` and CreatureQuery `0x60` assemble up to four
little-endian bytes with a zero-filled missing suffix. Their readers reach
`0x145e9ef2a` and `0x145e9efeb` with the entry in `r14d`. The
GameObject range `9005..=9013` selects the existing type and display tables.
CreatureQuery dispatch at `0x145e9f009` selects entries `9500..=9614`
through the first finite descriptor table. These branches share the live
template prefix reader. Their descriptor populations and wider publication
remain separate questions under [#64](../CURRENT-STATE.md#gap-64)
and [#65](../CURRENT-STATE.md#gap-65).

CastSpell `0x12e` enters `0x145e9ea79`. Its short-input paths converge at
`0x145e9f48c`, including the empty branch through `0x145e9ec6e`.
At `0x145e9f49a`, `edx` holds the zero-filled u32 spell ID. The next
instruction loads refusal reason `0x17`; the result goes through
`0x145eca7e0` with the existing recipient argument. The reconstructed
host now uses the same prefix reader for this denial.

Opcodes `0x10a`, `0x10b`, `0x10c`, `0x10d` and `0x111` all enter
`0x145e9e71e`. An absent first or second byte contributes zero. SwapInvItem
`0x10d` selects the first byte. The other four select the second. At
`0x145e9e9ae`, `edx` contains reason `0x18` for DestroyItem or `0x15`
for the others. `r8` contains `0x4000000000000100 | slot` when the slot is
below 19, and zero otherwise. The host now passes defaulted bytes to its
existing inventory refusal builder and sends the resulting packet to the
requesting peer. Full-length inputs follow the same existing result paths.
[Host command drain](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs).

The existing template-prefix Unicorn harness replayed 19,917 original
CastSpell, CreatureQuery and GameObjectQuery cases and 11,525 inventory
prefix/slot/reason cases. The replay checked 152 instruction sites across
1,680,116 steps and stopped before the native serializers. The edited host
source syntax-parsed. These checks leave compilation, client and server
execution, network delivery and original/rebuilt parity open.

## Nested CreatureQuery selectors

Starting at the concrete opcode destinations and following the internal
branches and verified table cells puts all thirteen later current-only
selectors under CreatureQuery `0x60`. The first reads the entry from
`r14d` for `9500..=9614`. The remaining sites derive their index from
that same entry. The five inventory requests, cast, selection, logout,
name query, item query and object query use their own branches.

| Nested site | Guarded entry range |
| --- | --- |
| `0x145e9f009` | 9500–9614 |
| `0x145ea0f9d` | 694–794 |
| `0x145ea10fb` | 1200–1294 |
| `0x145ea112b` | 100–194 |
| `0x145ea115e` | 1500–1511 |
| `0x145ea1580` | 800–994 |
| `0x145ea15a8` | 1300–1394 |
| `0x145ea15ec` | 300–309 |
| `0x145ea161f` | 1590–1594 |
| `0x145ea19cc` | 1000–1194 |
| `0x145ea1ab2` | 306–394 |
| `0x145ea1ade` | 10475–10508 |
| `0x145ea1b6f` | 1400–1405 |

Ranges describe the guarded table domains. Individual cells can select
a miss, repeat a descriptor, or lead to another guarded family. The live
Creature query consumes the existing ordinary enemy, boss and special
catalogs. Exact current row-field correspondence for the remaining
descriptor entries stays under [#64](../CURRENT-STATE.md#gap-64).

## Guest target selection and addon publication

Opcode `0x13d` enters `0x145e9ea59`. Its bounded reader assembles up to
eight little-endian bytes at `0x145e9f38c`; missing bytes are zero and
later bytes are ignored. The host path requires role 3 and an in-range
peer index, then stores the GUID at `0x145e9f3c8` in that peer's
`+0x370` slot in the 0x8a0-byte row. The command's additional active-game
match and follow-up at `0x145ea05ab..0x145ea0603` retain a separate
consumer question.

The host poll at `0x145ea91cb` and `0x145ea920c` loads that same peer slot
into its `+0xbc0` staging record. At `0x145ea9491` it passes that record
to `0x145ef58e0`. The wrapper forwards the GUID at `0x145ef5967` to
`0x145e60e50`. The common list builder calls the target formatter
`0x145f05000` at `0x145e60f6f` and binds the result to `AZSTGT` at
`0x145e61412`. A zero GUID produces `kind=none`; the seated hero's own
GUID produces `kind=player`. The source reuses its existing target
formatter and the seated recipient snapshot.

The stock selection writer sends the full GUID, including zero on clear.
The guest wire bridge already transports that opcode. The rebuilt Session
now stores it in the synchronized host peer, where ordinary peer retirement
also retires its selection. The existing authority-generated recipient feed
passes the value to the target formatter and publishes through the same
changed-payload addon message path as the other snapshot rows.
[Host Session](../../crates/azeroth-survivors-re/src/coop/session.rs),
[recipient publisher](../../crates/azeroth-survivors-re/src/gameplay/coop_publish.rs).

Bounded replay checked 11,265 original prefix cases, 91 instruction sites
and 798,769 steps, stopping before peer mutation. Current original-byte
stores and calls establish the producer and consumer separately. Rust
syntax checks leave socket ordering, actual addon display and parity open.

The separate self-selection follow-up seats the requested hero through
the shared swap at `0x145f375e0`. For the local actor path,
`0x145ef9363..0x145ef9384` dispatches Game phase 2 to the choice publisher
and phases 4/5 to the result publisher. The same helper is called after
manual-cast refusal at `0x145e9f508`. Both publishers check the per-hero
capability at Game `+0x10d2`; the hero swap exchanges that byte with
remote row `+0xc0e`. The selected strings include
`You left the run.` and `A guardian falls!`. These are the
[historically recovered alternate Gossip publishers](local-requests-0.100.1.md#post-rejection-dispatch-and-desktop-capability).
The 827-byte current follow-up slice has SHA-256
`d52a6ded9328d67dcded18306292b1fe7e3056fe948d852c0e36834a40d314e0`,
and its verified Ghidra result digest is
`2c17f124d7c5673a22568526af6b093b811179012088cad816207220a04265f4`.
The phase-2 publisher rejects capability zero and choice kind `0xff`;
the phase-4/5 publisher requires capability one.

## Desktop and guest Gossip capability initialization

The common Game constructor `0x145f7cfb0` writes little-endian dword
`1` to `[rbp+0x1098]` at `0x145f7e0ea`. The returned Game is copied
from `rbp-0x38` for `0x10f0` bytes. The third byte of that dword is
the initial Game `+0x10d2` value, zero.

For the local hero, `0x145ec08c9` calls the constructor with Game output
at `rbp-0x48`. It then calls Core's callback slot `+0x40` and writes
AL at `rbp+0x108a`, the same Game offset. Desktop startup supplies
vtable `0x146554a08` in R9 at `0x14003ddc6`. The driver forwards it
in R9 at `0x145e80f69`, the Core forwarding call moves it to R8 at
`0x145ed0c4c`, and `0x145ea2d61` stores it at Core `+0x1fb0`.
Vtable slot `0x146554a48` points to `0x14006e750` (`31 c0 c3`,
`xor eax,eax; ret`), so the desktop override is zero.

Guest admission constructs the temporary Game at `rbp+0x1cb8`
through the locale wrapper `0x145e6d8f0`. The wrapper forwards the
output to the same constructor at `0x145e6da54`. Admission copies
the host's Game `+0x10d0` byte individually at `0x145f1301a`, leaving
`+0x10d2` at the constructor default. The row conversion at
`0x145e49166..0x145e491af` moves the eight bytes at Game `+0x10d0`
to row `+0xc0c`. The subsequent `0xc20`-byte row copy installs
the zero at row `+0xc0e`. The self-selection refresh seats the row
at `0x145ef9548`, sets the actor slot, and calls the locale-aware
phase dispatcher `0x145e74200` before restoring the row. The capability
guards suppress both Gossip publishers for the seated desktop recipient.

| PE span | File offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| Common packed initialization `0x145f7e0ea` | `0x5f7d4ea` | 10 | `1d636e8d50dcfcbfa199a8d6d18a7ffb608a0d915d29298284537b2750e872f9` |
| Game publication `0x145f7ece9` | `0x5f7e0e9` | 25 | `d61e0685b9f1e3f0fe133a9c12602da040e90fc15657bffe2e1c87fb5e1119f5` |
| Desktop vtable argument `0x14003ddbf` | `0x3d1bf` | 27 | `c5df319fa008bc569f4502023e7f0e3495430ad3d05ff04aa48d6c2bc18a64a9` |
| Callback slot `0x146554a48` | `0x6553048` | 8 | `acced0327cccf088b50ad9a029cf3f6edb7d3ad1146a05de0cf97a3f18e1eb44` |
| Zero-return leaf `0x14006e750` | `0x6db50` | 3 | `251447ee91a9067dcd6ab96703133f617565974cd6c4819021760c4688c91abf` |
| Desktop factory override `0x145ec08bf` | `0x5ebfcbf` | 40 | `2e8570054e52c6a3a551b918a1601633b3513ad6388260c12791882178f811d3` |
| Guest Game construction `0x145f12df9` | `0x5f121f9` | 35 | `1334d734dd6ea9f3a9c39f1d02c7cdc231602d4065db6c8557a90ecdb4059ba9` |
| Guest row conversion and publication `0x145f1301a` | `0x5f1241a` | 145 | `85c32c5669815eef3278161424b3dd7f2fb2ca6735d7b3facc7bfbea36245b38` |
| Packed copy into row `0x145e49166` | `0x5e48566` | 74 | `2dbbbb2308981480f5c1c7b27d3f5d8017445dfcd9e358fa15572f537085f054` |

The journaled Ghidra slices for guest admission and the common constructor
have SHA-256 `b2f70a80fef776732df3eb4a8675712bc88849fb814ed247fbbcb5396fd78663`
and `2a0a93e9b7e98c04959b1b6ea70d3d294301a94cff0498d4ce4afe572b2ac5e1`.
Their verified result digests are
`69c04b33ed18581e2518991d877f33f6fb9c920231a3c811475ef90fc7c5ce28` and
`3d9513c02c5e35e4e85af3b6ae1d0f7add06fd90102ed613e7b4a7990b38b700`.

The reconstructed desktop sends custom choices through the existing
[recipient overlay publisher](../../crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs)
and consumes the authoritative guest terminal state in the
[results overlay](../../crates/azeroth-survivors-re/src/gameplay/terminal.rs).
Those paths require no alternate Gossip emitter for this desktop contract.
Actual co-op delivery and rendered behavior remain unverified.

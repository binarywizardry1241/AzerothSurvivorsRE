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

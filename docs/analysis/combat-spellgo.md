# Combat addon reflection words

The installed `AzerothSurvivors.exe` is 0.140.0, 151,521,280 bytes, with
SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
This assessment covers the instant `SMSG_SPELL_GO` miss constituent of
[#307](../CURRENT-STATE.md#gap-307). The
[0.139.2 combat feed report](combat-text.md) retains its original
target and owns the surrounding event and projection contracts.

The current `SMSG_SPELL_GO` owner at `0x1409d90c0` iterates 16-byte miss
entries. For an admitted outcome code from 1 through 11, it emits the target's
word through `0x140988900`. The store at `0x1409d945b` writes zero to the
event's reflected byte at stack offset `+0x3d2`, including when the word is
`REFLECT`. Only primary code 11 reaches the secondary-outcome gate at
`0x1409d94a3..0x1409d94c2`. An admitted secondary code from 1 through 11
targets the original unit caster, sets the same reflected byte to one at
`0x1409d9521`, and enters the same producer again. A zero or out-of-range
secondary code emits no second event.

| Installed EXE range | File offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| `0x1409d90c0..0x1409d95e7` | `0x9d84c0` | 1,319 | `c5a810fbe6659ea3faea5261904f97f47e567e9db691be8cda0dffd115302e53` |
| `0x1409d93e0..0x1409d956d` | `0x9d87e0` | 397 | `e4021413fb3d45a6c28b1769db25d5a842a5f286cc9ff490eded0e53c813fd7c` |

The [live combat packet adapter](../../crates/benilla-app/src/combat_text/anchors.rs)
now assigns the reflected flag per outcome. The initial word remains
`REFLECT` where applicable and only the return word is marked reflected.
Both events retain the existing ownership and outcome admission. Rust syntax
and diff whitespace checks passed. Compilation, event delivery during play
and original/rebuilt comparison remain in
[verification](../verification-needed.md#gap-307).

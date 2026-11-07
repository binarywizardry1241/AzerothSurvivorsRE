# Protocol 13 Hero receive fields

Finding [#63](../CURRENT-STATE.md#gap-63) uses the 151,493,632-byte
`installed-game/AzerothSurvivors.exe`, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
Join and lobby inspection use their separate
[admission](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-admission-0.141.0.md) and [roster](coop-inspection.md)
contracts.

The writer dispatch at `0x14604fae1` selects `0x146050195` for the
Hero record and emits tag 4. The reader dispatch at `0x14604a59a`
selects `0x14604af10` for wire tag 4. The writer emits cooperative luck
after the two companion perk ranks and before the three option bytes.
The [existing Tier 0.5 carrier](scholomance-loot.md) still
places the owned-item vector after pity and before Heroic unlocks. The
writer emits dated achievements after language, with a u32 count and
six bytes per row.

The reader applies three rules at the Hero receive boundary:

- The luck reader first checks the f32 magnitude bits against
  `0x7f7fffff`. NaNs and infinities become positive zero. Finite values
  clamp to the inclusive range 0–0.1. The native MAXSS and MINSS order
  preserves negative zero.
- The two account option bytes and three run option bytes use the
  native nonzero boolean reader. Its outputs are exactly 0 and 1.
- EOF immediately after the language field represents an empty
  achievement vector. When bytes remain, the reader requires a complete
  count and enough bytes for every declared row. An incomplete supplied
  appendix clears the reader's valid flag, and the final Hero gate at
  `0x14604d63d` rejects the record.

The [Hero codec](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
now applies these rules before the [replication adapter](../../crates/azeroth-survivors-re/src/coop/replication.rs)
passes the record to host admission. The same adapter already maps unknown
companion keys to absence and instinct values at least 4 to 0. The host
uses the admitted profile when building the [guest actor](../../crates/azeroth-survivors-re/src/gameplay/coop.rs),
and [the profile bridge](../../crates/azeroth-survivors-re/src/coop_profile.rs)
passes the bounded luck to gameplay. The writer continues emitting the
achievement count, including for an empty list.

The current host dispatcher retains the 0.1-second replacement window.
The branch at `0x145ecaff5` tests for a stored profile and either replaces
the pending Hero or enters the apply owner at `0x145ecf570`. The pending
drain calls that owner at `0x145ea5d0c`. The owner writes the last-apply
clock before calling the sanitizer at `0x145e39680`. Its identity prefix
uses the existing world GUID interval, the same class mask shifted to
index by class ID, races 1–8 and a nonempty name.

The duplicate guard compares two driver GUIDs and each other peer's
present profile. The driver constructor computes the process world GUID
at `0x145ea2b7b` and stores it at +0x2078. The local run activation
matches the requested GUID against the roster row's +0x18 field and
stores the selected row's GUID at driver +0x1fb8. The custom roster
producer at `0x145ebd640` fills that field from the process GUID. The
stock roster path can provide a distinct selected row. Guest run
activation copies the process GUID to +0x1fb8 at `0x145eccb92`. The
guest's own tag 4 table cell at `0x147aedd04` reaches the cleanup
dispatcher at `0x145ece255`. The
[guest session](../../crates/azeroth-survivors-re/src/coop/session.rs)
now drops the upstream Hero before queuing messages for the application.
It continues with the rest of the batch. Profile admission belongs to
the host.

The source host now checks the process identity from `CoopRuntime` and
the active player's identity from `Mechanics` when present. These usually
coincide during a custom host run. The check keeps the two producers
distinct across run activation. The first-profile zone and rank gate at
`0x145ecf75c` still precedes the duplicate rejection.

## Static evidence

| Native range, end exclusive | File offset | SHA-256 |
| --- | --- | --- |
| Hero writer prefix `0x146050195..0x146050a2f` | `0x604f595` | `4125d3d2ad9a9e40a01e52b7a0daa9bc10a9431afa14e41a5532e5666b9e23fe` |
| Account option reader `0x14604dd24..0x14604dd48` | `0x604d124` | `970b19164e184ad8f91455567c3b19ec934c511c1f2210fdccdee2b851e72fd2` |
| Cooperative luck guard `0x14604de66..0x14604de95` | `0x604d266` | `19a49e833e01317866aba008f9c0af7658db07fec2c171c7eabdeb508bf28023` |
| Luck maximum `0x146554130..0x146554134` | `0x6552730` | `fb360f7241a770dc32cade9a1d1273c92b13bd4959b1c130931312b7fe95e63f` |
| Run option and profile presence readers `0x14604de95..0x14604ded8` | `0x604d295` | `973da845752d1d37893de0b850ac0f9f105838cae8e48bc8df48cca1c536a4b8` |
| Optional achievement appendix `0x14604df30..0x14604dfbf` | `0x604d330` | `242c9db807660d5d717cea0fc49ec9e95fd75d6e7645f56988b9b6b14acf0b34` |
| Final Hero validity gate `0x14604d63d..0x14604d66d` | `0x604ca3d` | `a0b95b0f60741d46a13428f54ddfd22383e5f25bfe1a859c5c4c90cde4dc7555` |
| Host apply owner `0x145ecf570..0x145ecf84d` | `0x5ece970` | `6f6701e470dfbc777fde5bcf6b2244d5f7e4e1036257a76522ed5a0a14e7b617` |
| Duplicate guard `0x145ecf637..0x145ecf6ab` | `0x5ecea37` | `ae428cdd3cbbb498e23c661b284237ca03acea57b433ac39f196a16d4eea0d22` |
| Process identity mixer `0x145ea2b7b..0x145ea2bcc` | `0x5ea1f7b` | `3dc8f7b24a53496477d1571d30eef24830aad9d78ff6b0b654ea0c5058edfc2a` |
| Process identity store `0x145ea2e2d..0x145ea2e34` | `0x5ea222d` | `12b268c6b7d0fc6dfa016b18ae3e6f0a7c146a0ccb37bb2d882cd84ec2e0770e` |
| Local roster selection `0x145eb6dcf..0x145eb6e64` | `0x5eb61cf` | `a77ece9e9deb65f35418c780a2e94b433f2ed57fe61b64791eda8aad8b16e4bf` |
| Active local identity store `0x145eb6f26..0x145eb6f34` | `0x5eb6326` | `406ac38a51cd9cb6ba958ad10bdeae82d38ff8df4a0e7bc0d4104d3d8d511579` |
| Active guest identity store `0x145eccb8a..0x145eccb9a` | `0x5ecbf8a` | `ae7b77e66718f2aba8d5bf182ec368b0b2bbd7f7c14061c9931cf39c52dc46e9` |
| Guest Hero table cell `0x147aedd04..0x147aedd08` | `0x7aec304` | `e22d4ec94872dd7ec0a03885201cecadfdc145b2edb20bcf50c698a481e95180` |

The retained [writer query](coop-inspection.md#exact-static-evidence)
has Ghidra evidence ID
`ev_79e6ddb9191644b1d02eb6d242402ea3ab9fab7e88c28ec0ef50fc994f2b803d`.
Its raw-slice digest and saved result digest match the journal. The
original PE instructions and tables resolve the dispatch branches.

The existing scratch-memory native replay harness passed 18 luck cases,
512 boolean cases across both byte groups and 17 achievement appendix
prefix cases across 30,976 original instruction steps. The appendix replay
checked the native count, reader validity and EOF branch and substituted
the row collector after its bounded count. The same harness checked 40
duplicate-identity cases across 376 original instruction steps, including
process and active matches, the sender exclusion, absent peer profiles
and the host role gate. Rust syntax and whitespace checks passed. The
Rust regressions remain uncompiled and unrun.
Client/server execution, interoperability and original/rebuilt parity
remain in [verification](../verification-needed.md#gap-63).

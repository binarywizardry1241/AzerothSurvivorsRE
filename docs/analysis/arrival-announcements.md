# Arrival announcements

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns gap #28. The live source now delivers
enemy/wave arrivals, boss entry and the associated guardian/boss messages through
the real client chat and FrameXML path. Compilation, actual display/timing and
original/rebuilt parity remain unverified.

## Native producers and packet contracts

The [manifest](evidence/0.105.0/arrival-announcements/manifest.json) binds the
selected producer ranges, original PE bytes and Ghidra yell-helper observation.
The existing [boss constructor](evidence/0.105.0/boss-catalog/constructor.asm) and
[emote serializer](evidence/0.105.0/terminal/notification-packet.asm) remain their
canonical extracts; they are referenced without duplicating them.

| Producer | Current native range | Recovered message |
| --- | --- | --- |
| Timed elite | `14590e0d4..14590e273` | Attempt creation, then `RAID_BOSS_EMOTE` with localized selected enemy name and body `%s approaches!`; next elite deadline follows publication. |
| Four formations | `14590eae3`, `14590ef43`, `14590f432`, `14590f7b3..14590f913` | Localize the Swarm/Stampede/Wall/Pack template and selected enemy name separately, then queue one emote after formation attempts. |
| Guardian refill | `145910acf..145910c67` | Publish `%s claims its lair once more.` with the enemy name only when the run clock is greater than 21 seconds. |
| Guardian death | `1459354cf..145935566` | Publish `%s is slain! Its lair yields treasure and its strength, and the other guardians grow stronger.` with the enemy name; the existing sound/account/reward sequence follows. |
| Boss entry | `145930739..1459309b6` in shared constructor | Publish a monster yell with the boss's actual GUID, localized name and entrance yell, then an emote with that name and `%s enters the battlefield!`, then the [arrival sounds](boss-voices.md). |
| Boss death | `145935754..145935813` | Publish localized `Impossible...` as a monster yell through the dying boss's GUID and name. |
| Minion summons | `14593e5a3..14593e64b` | Publish localized `Minions, to me!` as a monster yell through the source actor's GUID and name, before processing the add count. |
| Guardian engagement | `14593f9cc..14593fa4b` | Publish localized `Who dares enter my lair?` as a monster yell on the engagement transition. |

The `1458a9500..1458a97d9` serializer emits opcode `0x96`, chat type `0x5a`
(`RAID_BOSS_EMOTE`), language zero, a length-prefixed inline speaker/title, zero
target GUID, a length-prefixed body and tag zero. The
[`1458aae00..1458ab145` serializer](evidence/0.105.0/arrival-announcements/yell-packet.asm)
emits the same opcode with type `0x0c` (`MONSTER_YELL`), language zero, the
actual source GUID, inline source name, zero target GUID, body and tag zero.
All lengths count UTF-8 bytes plus the terminating NUL. Ghidra Evidence
`ev_6efd73cdd9acc2a64c9e6c4827fc7ac4da1c35cc52b4a274a87593436358528b`
observed the complete current yell-helper body; raw-import generic ABI
pseudocode does not recover the original Rust types or Win64 argument names.
The PE instructions govern parameter interpretation.

Native name lookup uses `enemy.{id}.name` or `boss.{id}.name`; entrance yell
lookup uses `boss.{id}.yell`. Each falls back to its definition string when
lookup fails. The body template is localized independently. `%s` remains in the
body passed to the client: the stock chat/FrameXML consumer inserts the separate
speaker name. Concatenating the name to a wave message or replacing `%s` before
delivery changes that contract.

## Connected source

[`mechanics/announcements.rs`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/announcements.rs)
now represents native emotes and monster yells separately, retaining keyed
speaker/body labels and source GUIDs. Timed elite and formation adapters create
emotes from their selected enemy definition. Guardian refill/death retain the
name and template rather than emitting only a name or substituting early.
Guardian engagement, minion summons and primary-boss death carry actual actor
identity. Boss construction now queues its missing entrance yell and arrival
notice before the already connected sound sequence. The unrecovered-ability
diagnostic goes to the application log, without fabricating game chat.

The [event collector](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
forwards each typed intent once as `SessionEvent::Chat`; it no longer reports
`native_announcement_packet` missing. `LocalPresentationEvents` enters the normal
inbound handler table, chat log and `CHAT_MSG_RAID_BOSS_EMOTE` /
`CHAT_MSG_MONSTER_YELL` FrameXML events. The existing engine consumer owns
formatting, display, bubbles and any stock frame behavior. No replacement toast,
custom HUD label or new timer is introduced.

## Checks and remaining limits

`python3 -B scripts/recover-announcements.py --check` passes:

- Newest supplied target resolution and full executable SHA-256 verification.
- **44 bounded unchanged-native serializer cases**, comparing every emitted byte
  against the recovered packet layout. Cases cover both chat types, empty and
  UTF-8 names/bodies, title-length boundaries, long strings, allocation/growth
  branches and GUID preservation.
- All **148 enemy name/id rows in each of the two live historical catalogs**
  match the selected EXE for this narrow announcement contract. Other fields
  retain their prior provenance. The current boss catalog already owns its
  name/yell revalidation.
- Eleven exact native message literals, current lookup templates and all
  **14 locale catalogs** contain the required keys. Canonical extract/source
  hashes also match.

Replay executes only the two reviewed packet serializer instruction ranges.
Synthetic memory supplies allocation, byte-copy and vector growth seams; native
callees and operating-system functions do not execute. Unknown calls fail.
Producer ordering and lookup fields are static traces, without a game session.
Rust syntax parsing passes for the five changed Rust files and `git diff
--check` passes. Authored regression source checks localization/fallback fields
and actual scheduled boss entry order/no replay; it was not compiled or run.
Compilation, exact native producer scheduling beyond the selected traced
branches, real client/MPQ display and controlled original/rebuilt interaction,
visual and timing comparison remain open. Source builds need neither the
reference EXE nor analysis tooling.

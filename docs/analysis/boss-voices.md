# Boss arrival sounds

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns permanent gap #29. Source now connects
the recovered arrival sound sequence; compilation, audible playback and
original/rebuilt timing remain unverified. [Arrival text delivery](arrival-announcements.md)
is now connected under #28, with compilation/display/timing comparison still open.

## Native producer and live consumer

The selected primary-boss constructor `14592ff90..145930df2` queues its
localized chat and arrival announcement, followed by **SoundEntries kit 8174**
for every creation. It then reads the boss record's `+0x50` u32. A nonzero
value queues that voice kit immediately after 8174; zero skips only the voice.
Both packets have opcode `0x02d2` (`SMSG_PLAY_SOUND`) and one little-endian u32
body. There is no speaker GUID, position, delayed timer or phase gate in this
sound branch. The byte-backed source is the shared
[constructor extract](evidence/0.105.0/boss-catalog/constructor.asm), with
Ghidra Evidence `ev_4013bdef3f794cf06df3c99ac1f48cfbd0958abc4c64e4dd43e722251fb2c9bc`
and its identity retained by the [boss catalog](boss-catalog.md).

The 60 current boss rows contain 22 nonzero voice kits:

| Zone | Boss / SoundEntries ID |
| --- | --- |
| Elwynn | Rhahk'Zor / 5774; Mr. Smite / 5775; Edwin VanCleef / 5782 |
| Gurubashi Arena | High Priestess Jeklik / 8417; High Priest Venoxis / 8421; Bloodlord Mandokir / 8413; Jin'do / 8425; Hakkar / 8414 |
| Scarlet Monastery | Houndmaster Loksey / 5841; Arcanist Doan / 5842; Herod / 5830; Scarlet Commander Mograine / 5835; High Inquisitor Whitemane / 5838 |
| Blackrock Mountain | Majordomo Executus / 8035; Nefarian / 8288 |
| Ahn'Qiraj | General Rajaxx / 8609; Ossirian / 8598; C'Thun / 8581 |
| Naxxramas | Anub'Rekhan / 8788; Noth / 8845; Patchwerk / 8909; Kel'Thuzad / 9088 |

The [canonical catalog](../../crates/azeroth-survivors-re/src/guardians/catalog.rs)
stores these values in `raw_50`, preserving the historical field name.
`bosses::spawning::arrival_sounds` returns the exact ordered kits, and the live
`BossSpawner::spawn_boss` adapter appends them as `RunEvent::PlaySound` after
creating the boss. Ordinary scheduled and endless bosses share that adapter;
the schedule cannot replay a sound merely because the same boss stays alive.

The existing presentation collector forwards each event to
`SessionEvent::PlaySound`. The real client's sound packet handler converts it
to `ServerSoundKind::Sound2d`, and the ordinary sound-kit/mixer path resolves
the SoundEntries ID against user-provided data. No replacement sound files,
direct file paths or fabricated text-to-speech are introduced. Source builds
do not require the reference executable or bundled MPQs.

## Static checks and limits

`python3 scripts/recover-boss-voices.py --check` verifies the full selected
EXE hash and replays **124 bounded unchanged-native instruction cases** from
`1459309b6..145930ab9`. Every current boss is checked with spare and full packet
vectors, plus nonzero-one and unsigned-maximum voice boundaries. Checks verify
the packet order, opcode, four-byte body, zero gate and preservation of existing
queued packets. [Retained vectors](evidence/0.105.0/boss-voices/native-vectors.json)
include the exact instruction-range digest. Allocation and vector growth are
explicit synthetic-memory seams; native callees and operating-system calls do
not execute. These checks do not execute the game or its audio engine.

Authored Rust regression source compares the live catalog/helper with the native
fixtures and exercises the real scheduler/event producer through three Elwynn
arrivals and a subsequent no-arrival tick. Those tests were not compiled or run.
Rust source parsing and whitespace checks are recorded in the source/verification registers.
Compilation, actual MPQ kit availability, audible playback/mixing and controlled
original/rebuilt comparison remain open. The source connection does not close
those runtime requirements or the announcement presentation/timing comparisons.

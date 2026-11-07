# Main-menu save format

Updated 2026-10-16. This report concerns the selected 0.92.0 EXE, SHA-256 `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`. Historical 0.91.4 addresses are not used. The reconstruction's [`save.rs`](../../crates/azeroth-survivors-re/src/save.rs) now implements the recovered envelope and menu records. The isolated native export/import validation below confirms the envelope and tested picker fields; the menu now integrates picker persistence, safe import/export, gear/look state and talent allocation. Full legacy migration remains incomplete.

## Evidence and reproduction

Run [recover-menu-save.py historical recipe](../SCRIPTS.md#historical-execution-sources) inside this checkout. It verifies the EXE hash and refreshes the [manifest](evidence/0.92/save/manifest.json), nine pointer-backed class/race slices, four run-modifier descriptors, compact Rust format bytes and ten bounded native instruction extracts. It never executes the EXE. The evidence is instruction and constant data; semantic interpretations below are distinguished explicitly.

An isolated REA/Ghidra batch was also started through `scripts/rea-batch.py` with seeds for the 0.92 save parser, serializer and path functions. Its disposable protocol output is under `runtime/menu-save-recovery/rea`. The first pseudocode query did not complete during startup and was cancelled after 852.53 seconds. REA exported its partial bundle and closed the target successfully. Bounded instruction disassembly and the native export/import observations resolved the concrete format; no result here depends on the cancelled pseudocode query.

## Envelope

Native opening function `0x1454569f0` trims text, requires `RSE1:`, decodes standard Base64, rejects blobs shorter than 36 bytes and splits the decoded payload into:

```text
nonce[16] || encrypted_utf8_text[N] || authentication_tag[20]
```

The native HMAC helper is `0x145456320`: SHA-1 initial constants, 64-byte compiled inner/outer key pads and 20-byte big-endian digest output are visible. It hashes three sequential byte slices. The 42-byte format compatibility constant is compiled into the program; it is not a user credential. The reconstruction reproduces it from the native pads.

For block index `i`, starting at zero, native XOR helper `0x1454560a0` generates:

```text
stream_block[i] = HMAC-SHA1(format_constant, "ks" || nonce || u64_le(i))
encrypted_text = UTF8(text) XOR consecutive_stream_blocks

authentication_tag = HMAC-SHA1(format_constant, "tag" || nonce || encrypted_text)
file_text = "RSE1:" || standard_base64(nonce || encrypted_text || authentication_tag)
```

The encoder fills the nonce with 16 random bytes. Opening verifies the tag before decrypting and rejects invalid UTF-8. The native writer wrapper `0x1453fe8c0` seals and immediately opens its result, compares that result with the plaintext, and falls back to writing plaintext with a warning if its own seal round trip fails. Strict decode/import returns an error for a damaged seal. Active startup has a separate native recovery path: retain a numbered raw backup, log a warning and use an empty account, as recovered for checkpoint26 below. Later committing menu actions may replace the active damaged file. Write failures still return an error to the caller, whose native event path logs and continues.

## Menu records

The native text serializer is `0x1453ff1b0` and the parser is `0x1453fab00`. Records are newline separated with pipe-separated fields; numeric lists use commas.

| Record | Recovered field order | Evidence/limits |
| --- | --- | --- |
| `hero` | `hero\|class_id\|race_id\|sex\|skin,face,hair_style,hair_color,facial_hair` | Serializer uses an 8-byte record: three `u8` identity values followed by five appearance bytes. Parser validates class/race eligibility and maps nonzero sex to female. The native appearance-normalization call remains a separate unfinished behavior. |
| `pick` | `pick\|class_id\|race_id\|sex\|zone\|name\|appearance[5]\|run_modifiers[4]` | Three bytes, two strings, five `u8` appearance values and four `u16` modifier percentages. The parser accepts older rows without appearance/modifier fields; missing modifiers become 100 each. Zone-before-name ordering was confirmed by native import and normalized re-export. |
| Unprefixed character | `guid\|name\|race\|class\|sex\|appearance[5]\|map\|x\|y\|z` | Exact formatter types are `u64`, string, three `u8`, five `u8`, `u32`, three `f32`. GUID/map/position meanings also use the pinned shared roster protocol as context; the save-only instruction stream does not recover original field names. This is distinct from `hero` rows. |
| `unlock` | `unlock\|class_id\|u64` | The value is the number of consecutively unlocked zones. Native import of `unlock\|8\|3` displayed 3 of 9 and opened Elwynn Forest, Duskwood and Warsong Gulch for Mage. |
| `talent` | `talent\|class_id\|experience\|allocation` | Three fields follow the prefix. Class experience is distinct from individual names/appearance. Allocation is comma-separated `key:rank`; native spending XP80 writes `talent|1|80|imp_heroic:1`. Allocation reads/writes preserve XP and other classes. See the [Talents report](talents-recovery.md). |

Permanent gear uses `items|ID,...`, with class-specific `equip|CLASS|SLOT:ID,...` and `look|CLASS|SLOT:ID,...`; slot keys are native19-slot paperdoll positions. These menu behaviors are implemented in `armory.rs` and documented in the [Armory report](armory-recovery.md). Other serializer prefixes include `seen`, `ach`, `achat`, `stat`, `perk`, `tabard`, `pets`, `resets` and `beat`; Codex/account menu consumers are implemented separately, with remaining verification gaps recorded in their owning reports. Record retention is not proof of gameplay implementation. The reconstruction preserves unrelated lines when editing each menu record family.

## Native class/race order

The parser uses class mask `0x5df` and pointer/length tables at `0x1466dc038` and `0x1466dc090`. The order matters for the picker.

| Class ID | Allowed race IDs, in native order |
| --- | --- |
| 1 Warrior | 1, 2, 3, 4, 5, 6, 7, 8 |
| 2 Paladin | 1, 3 |
| 3 Hunter | 3, 4, 2, 6, 8 |
| 4 Rogue | 1, 3, 4, 7, 2, 5, 8 |
| 5 Priest | 1, 3, 4, 5, 8 |
| 7 Shaman | 2, 6, 8 |
| 8 Mage | 1, 7, 5, 8 |
| 9 Warlock | 1, 7, 2, 5 |
| 11 Druid | 4, 6 |

## Run modifiers

Four 48-byte descriptors begin at `0x146895448`. Serialization helper `0x1454248a0` formats four `u16` values, separated by commas. The default packed value `0x0064006400640064` is four percentages of 100. Parser/normalizer `0x145424520` clamps each value to its bounds, then rounds down to an allowed step from 100.

| Index | Name | Minimum | Maximum | Step |
| --- | --- | ---: | ---: | ---: |
| 0 | Enemy density | 100 | 500 | 25 |
| 1 | Enemy health | 100 | 500 | 25 |
| 2 | Enemy damage | 100 | 300 | 10 |
| 3 | Enemy speed | 100 | 150 | 5 |

The descriptor also contains reward-weight floats 0.05, 0.4, 0.6 and 2.0 respectively. These are recovered data; menu persistence does not implement gameplay reward calculations.

## Original native paths

Native file resolver `0x145421220` returns `WOW_ROGUE_SAVE` directly when set. Directory resolver `0x145420f30` independently checks `WOW_ROGUE_SAVE` first and returns that path's parent when present. If the override is absent, it uses `APPDATA`, then `XDG_DATA_HOME`, then `HOME/.local/share`, and appends `wenilla-rogue`. The active resolver then appends `characters.txt`. `BENILLA_HOME` does not participate in either native resolver. A present override whose path has no parent produces no directory; this branch does not fall through to the platform directories.

The active reconstruction task stays inside this repository. Merely recovering native precedence does not authorize reading or writing an installed save outside the workspace. The caller must select a project-local reconstruction save or explicit project-local override during this task.

## Validation and remaining work

The source module compiled in an isolated local verification harness. Its RSE1 output matched an independent Python standard-library `hashlib`/`hmac`/Base64 known-answer vector byte for byte using a fixed nonce. Opening that vector recovered the original text; a modified payload failed authentication. Record checks covered typed hero/pick reads, preservation of unrelated progress lines, class/race eligibility and run-modifier clamp/step behavior. Logs and the generated test harness are disposable under `runtime/menu-save-recovery`.

The real 0.92.0 EXE was then exercised through its native Options → Saves panel in the disposable project-local reference profile. Native Export produced a 53-character sealed empty save, which the Rust decoder authenticated and opened. Native Import accepted both an independently produced vector and a file emitted by the Rust implementation. The latter visibly selected an Orc Warrior, male, named `Changed`, with Elwynn Forest selected and the intended custom run modifiers. Importing the original empty native export restored the isolated progress afterward. No installed player save was read or written.

The [interoperability fixtures](evidence/0.92/save/interop-fixtures.json) retain the exact synthetic/native text, hashes and decoded records. `crates/azeroth-survivors-re/tests/native_save.rs` checks these native exported/accepted bytes, field ordering, tamper rejection, unknown progress retention, invalid class/race rejection and native direct-file replacement. The five initial compatibility/persistence tests passed in the normal package twice. The latest build19 native-save harness passed11 cases, including3 repeated shared name-rule cases; it covers allocation preservation, invalid-name fallback, direct replacement and maximum-quality seen parsing. The save-browser harness passed6 additional cases, including fixed backup naming for custom active filenames and ignored backup-write failure. Earlier dependency-cache/minimal-harness limitations are historical, not the current package validation result.

Native import also normalized a lowercase name to initial uppercase, changed an invalid selected zone to Elwynn Forest, and synthesized `ach`/`beat` migration records from the imported unlock count. The shared native name validator now trims whitespace, requires2–12 ASCII letters and applies initial-uppercase casing on picker reads/writes. Its Pick caller falls back to`Hero` when the validator returnsNone (`0x145402afd` writes literal`0x6f726548`), rather than rejecting the entire pick. Complete migration/zone rules remain unfinished. Native export filenames were observed as `AzerothSurvivors YYYY-MM-DD HH-MM-SS.sav` in the profile's `Saves` folder; the displayed filename used UTC. Native save lists refresh when the Options dialog is reopened. Complete legacy migration, all native-equivalent import normalization rules and gameplay remain unfinished. Appearance bounds, talent allocation, permanent gear/look persistence and import/export are connected to the menu; Codex and account Rewards/Achievements are separate implemented menu modules with ongoing fidelity recovery. Their detailed owning reports distinguish implemented and still unverified behavior. The current save module must not be described as full save-system or gameplay parity.

The ordinary writer now matches native`0x145421430` →`0x1456ba4c0`: resolve the active path, attempt parent-directory creation while ignoring its failure, then open with write/create/truncate, write all bytes, and close. It does not create temporary files or retain ordinary-write backups. Native`0x1453fe8c0` first opens its newly sealed envelope and compares the plaintext, with a plaintext fallback on a self-round-trip mismatch. The reconstruction performs that same verification. Import retains its separate native-observed`characters.before-import.txt` backup through the Options Saves bridge. The replacement test now checks that repeated ordinary writes leave only`characters.txt`; the prior per-write backup test described a provisional difference and has been replaced. The native-name fallback and these writer changes passed the parent-owned build19 package tests. See the [writer instruction evidence](evidence/0.92/save/native-writer-145421430.asm) and [write/create/truncate helper](evidence/0.92/save/native-writer-1456ba4c0.asm).

Native import backup destination is now traced independently of runtime basename observation. `0x145402ca0` first reads the old active file through`0x145421330` (using active-path resolver`0x145421220` and therefore`WOW_ROGUE_SAVE`). It then calls`0x145420cf0` with the fixed24-byte stem`characters.before-import`. That helper calls data-directory resolver`0x145420f30`, formats`{stem}.txt` (bytecode`c0 04 .txt 00` at`0x146894d68`), joins it to that directory, and writes the original raw bytes. Directory resolver`0x145420f30` first checks the same`WOW_ROGUE_SAVE` override and returns its parent; a custom active-save path therefore locates the backup in that parent, with the fixed filename`characters.before-import.txt` regardless of the active file's basename. Without the override, the platform data-directory precedence above applies. The reconstructed bridge's prior`active_path.with_extension("before-import.txt")` only coincided with the native basename for an active`characters.txt`; its custom-basename behavior was a file-operation difference. Native import does not inspect the backup writer's return at`0x145402da3`; it continues to the ordinary save writer at`0x145402dc8`, including after a failed backup. The parent-owned bridge now implements the fixed basename and ignored backup error; build19 save-browser cases passed. See [native import caller](evidence/0.92/save/import-backup-name.asm) and [backup writer](evidence/0.92/save/import-backup-write.asm).

The shared`Save::seen()` parser now follows native account records: first`=` separator, nonempty key, u8 quality with optional leading`+`, reject overflow/malformed values, clamp to4, preserve unknown keys. Native`0x1454d8630` deduplicates equal keys using the maximum quality (CMOVA at`0x1454d86ae` and`0x1454d8731`), reproduced by the shared map. Codex totals filter those records against the140-entry catalog; account achievement progress reads raw valid map length, so unknown valid keys can affect achievement progress without appearing in Codex. The new focused test covers those differences. [Deduplication instructions](evidence/0.92/save/seen-dedup-max-quality.asm) retain the native maximum-quality merge.

Native export-directory helper`0x145402f00` is now independently recovered: it appends`Saves` to the native save base, without consulting benilla configuration home. Native export action18e183..18e1dc and folder action194081..1940c5 call it directly. `WOW_CAPTURE` does not alter save/base/export path resolution; picker startup1120b0 unconditionally invokes the save loader at1120d7. The capture exception belongs to the separate benilla configuration-home resolver140eacbe0, which returnsNone when capture is present. The source now uses native_base_directory/native_path for these separate paths. MenuState represents a missing native path asNone, retains in-memory state and skips file persistence; it does not invent a reconstruction fallback. The independent Saves directory works even when capture mode disables benilla configuration persistence. These changes compiled in parent build21(12.05s), with54 focused harness cases passing. Development launchers have first been pinned to explicit project-local WOW_ROGUE_SAVE; no application was launched. See [save/config path distinction](evidence/0.92/save/save-vs-config-paths.json).

Native import also succeeds after an ordinary persistence failure:145402ca0 invokes the void writer1453fe8c0, then returns its parsed account. The source bridge now logs `rogue: cannot save characters to {path}: {error}` and still replaces the in-memory save; decoding/authentication failures remain import errors. A project-local fixture makes the active filename a directory to force the failed write while asserting successful imported-state retention. Three pure path fixtures cover custom/empty override paths, platform precedence, capture/config independence and absent native directories without reading or mutating process environment. The new path/import cases passed in parent-owned build21, which reported54 total focused harness cases. Build21 was not launched; no installed player files were accessed by these fixtures.

## Picker transition follow-up

The bounded native class selector `0x1453f9420` now proves an additional picker restriction. A saved destination-class hero restores race, sex and all five appearance bytes. Without that record, the selector preserves sex, always clears all five appearance bytes, and keeps the current race when allowed. Otherwise it chooses the first allowed race in the current faction, falling back to the first allowed race when that faction has no eligible candidate. Alliance membership uses native mask `0x9a` for IDs 1, 3, 4 and 7. For example, an unsaved Mage selected from a Tauren Warrior uses Undead, rather than Human. The source now uses `Save::select_class_hero` from `MenuState::choose_class` for these exact transition rules; the previous first-race/default-feature differences are corrected for checkpoint23. [Class-selection evidence](evidence/0.92/save/class-selection.json) retains the full small constructor and producer cases.

Native class action tag 0 emits core command 11 both before and after the class transition. The subsequent resource-registration and queue-consumer recovery below resolves the normal picker event boundaries and ordinary write-error continuation. Checkpoint23 changed only the class-selection rule; checkpoint25 replaces the earlier eager `MenuState::changed()` persistence policy. No new application was launched for either trace.

The tracked [native class-selection fixture](evidence/0.92/save/class-selection-fixtures.json) records all 144 fresh combinations (nine destination classes × eight current races × two sexes) and nine saved-hero restores. [`recover-menu-class-selection.py`](../../scripts/recover-menu-class-selection.py) verifies the EXE digest and executes the unchanged small selector in bounded Unicorn, recording its actual eight-byte outputs. The two reviewed stubs disable the optional appearance cache and exclude the separate final zone clamp; every other external call aborts. The fixture is not computed from the reconstructed Rust rule. A native-save helper test and a MenuState class-switch test compare against all 153 records; the latter constructs in-memory state explicitly and never resolves or reads an installed save. Parent-owned checkpoint23 compiled in 15.47s. Both new tests passed all 153 recorded outputs; the parent reported 35 binary, 15 native-save and 14 updater cases passing (64 harness cases, including repeated shared-module cases). No application was launched. Checkpoint23 did not change save timing or ordinary error policies; those are addressed by checkpoint25 below.


## Picker persistence boundaries and ordinary write failures

The [persistence-policy manifest](evidence/0.92/save/persistence-policy.json) now binds the native Pick resource to its registrations and consumers, rather than inferring timing from a void writer alone. The resource is64 bytes: name String, zone String, four packed u16 modifiers and an eight-byte Hero. All three copies of its native TypeID were followed to15 typed systems. Picker initializer `0x14011b4d0` registers nine update systems; the suspected synchronizer `0x140124e40` is caret blinking. The remaining typed readers belong to Run Options, Armory, Talents, Rewards and explicit environment automation. The registered Pick destructor `0x140091ec0` only frees its two Strings. These recovered normal paths do not provide an independent changed-Pick or exit save.

| Menu action | Native boundary | Source25 behavior |
| --- | --- | --- |
| Typing, Random, zone selection | `128fe0`, action2 at `12664c`, action1 at `126732` modify local Pick and return without a Core command. | Mark the UI dirty; leave the committed account Pick and active file unchanged. |
| Class selection, including the selected class | Action0 at `1261a5` stores the old Hero, queues command11 at `1262d3`, selects/stores the new Hero, then queues command11 at `126560`. There is no class-equality guard. Selected class styling converges on the same actionable button spawn at `20047e`. | Retain two ordered Save snapshots. Either command includes prior local name/zone edits. Saved destination appearance still restores through the native selector. |
| Run modifier change | `01de80` compares the packed modifier value with its entry snapshot at `01e409`; only a difference queues command11 at `01e4e1`. | Commit the full Pick only when values change. Done or a no-op reset does not write. |
| Appearance change | Armory input `045520` creates full-Pick command11. | Commit the complete live Pick. |
| Gear/look, talent or Rewards mutation | Dedicated account commands carry their own mutation. | Save the changed account without copying uncommitted local picker edits into Pick. |
| Enter | Post-input validation generates a name when invalid, normalizes/clamps Pick and queues command10. | Commit the selected Pick; world entry remains outside scope. |
| Picker X/Quit | AppExit is emitted directly; the recovered Pick destructor has no save. | No invented exit flush of local name/zone edits. |

Native queue producer `0x140061c70` copies232-byte commands under a lock. Core tick `0x1453e5b70` drains that queue and calls dispatcher `0x1453f3380` at `0x1453e66bc`. Command11 updates normalized account Pick and Hero before invoking the sealed writer at `0x1453f3fe1`. A failed ordinary file write does not revert those in-memory changes. Writer `0x145421430` prints `rogue: cannot save characters to {path}: {error}` to stderr, releases the IO error and returns void. The command loop advances unconditionally to the next queued command. Parent-directory creation failure is also ignored before the file-write attempt. [Bounded instruction extracts](evidence/0.92/save/persistence-policy-instructions.asm) retain these control-flow and state boundaries.

The source now separates `mark_dirty`, `commit_pick` and `commit_account`, and drains ordered snapshots through the existing `persist_selection` call. Options Export drains pending commands before reading the committed save. Ordinary write errors are logged without setting a persistent menu error or blocking later events. Checkpoint25 retained the earlier guard after an unreadable/damaged save as an unrecovered policy. The independent startup recovery below closes that gap and removes the unsupported guard for checkpoint26. The source also retains its menu-schedule queue draining instead of recreating the original Core worker's25ms cadence; exact thread/timing parity is not claimed.

Parent-owned build25 passed in14.34s with locked/offline dependencies. Its105 focused harness cases passed:41 binary,15 native-save,6 config,1 run-modifier,10 save-browser,14 updater and18 installer; shared modules overlap between harnesses. Six new project-local fixtures cover local-edit nonwrites followed by a committing event, account/Pick separation, two class snapshots, selected-same-class commits, write-failure recovery and the retained bad-read guard. The earlier native153-output class fixture comparisons also pass. Fixture constructors do not call MenuState::default or resolve installed player paths. No application was launched. Logs are `runtime/menu-recovery/menu-build-25-save-events-talents-progress.log` and `menu-tests-25-save-events-talents-progress.log`.


## Active startup recovery and loaded selection — checkpoint26

[Startup recovery evidence](evidence/0.92/save/startup-recovery.json) now separates active startup from strict Import. Native reader `0x145421330` converts all read failures into None and drops the error without a warning. Its underlying read-to-string helper also rejects invalid UTF-8; the native error literal is `stream did not contain valid UTF-8`. Loader `0x1453f9d00` turns None into an empty account. It does not create a backup or a persistent write hold in this branch.

A readable text file whose trimmed prefix is `RSE1:` but whose seal fails to open follows a different branch. Native `0x1453f8ad0` checks `characters.unreadable.1.txt` through `.32.txt`, selecting the first backup which cannot be read or whose raw text exactly equals the damaged input. When all32 contain different readable text, it chooses32. Loader then attempts to write the original raw text to that slot and logs `rogue: the save does not open; starting fresh, the old one kept as characters.unreadable.N`. The warning omits the `.txt` extension even though the file uses it. Auxiliary writer `0x145420cf0` ignores both directory-creation and write failures; neither failure changes the fresh-account result. Startup leaves the active file untouched until a later committing action.

Nonempty legacy plaintext has its own fixed `characters.legacy.txt` backup. The loader attempts that backup only when it cannot read an existing one. A readable empty backup is retained. It then parses the original plaintext. Empty/whitespace-only input does not create a legacy backup. Complete native legacy parsing/migration is still independent unfinished work; preserving unsupported lines is not proof that those records match native normalization.

Picker constructor `0x1401120b0` also proves that no saved Pick means the default from `0x1454034c0`: Human Warrior, male, five zero appearance bytes, Elwynn and100% modifiers. It does not restore a Warrior hero row in this branch. The native default name `Hero` then goes through the already recovered random-name branch. A loaded Pick is normalized and passed through zone clamp `0x1453f9130`: missing/zero unlock means one open zone, counts cap at9, and a zone outside that range moves to the **last unlocked zone**. The source previously omitted that clamp during startup.

Source26 implements permissive active-load recovery while keeping `Save::parse`/`Save::import` seal validation strict. MenuState no longer turns startup recovery or an earlier validation message into a permanent queue/write block. Startup's unsupported saved-Warrior fallback is removed, and its zone restoration uses the shared clamp helper. Import-without-Pick replacement is a separate lifecycle and remains unverified for that edge; the startup proof is not extended to it.

[`recover-menu-startup-save.py`](../../scripts/recover-menu-startup-save.py) verifies the target SHA and records unchanged native instructions in bounded Unicorn. Its [fixture](evidence/0.92/save/startup-recovery-fixtures.json) contains six loader/backup cases and162 zone outputs: Warrior and Mage, nine unlock states including missing/zero/u64MAX, and all nine zones. Every damaged-loader output is byte-identical to the440-byte no-readable-save account. The native loader and backup-slot helper choose the slots; the native zone clamp and zone-index leaf choose the zone strings. Expected outputs are not computed from the reconstructed Rust rules. Declared IO/seal/format/allocation stubs exclude OS/files/network execution inside the fixture.

Rustfmt passed for source26. Four shared Save tests cover the native backup vectors, invalid UTF-8, ignored backup-write failure and legacy backup preservation. Four additional MenuState tests cover damaged/unreadable startup followed by a successful later write, all162 recorded zone results and the no-Pick default hero. The earlier retained-guard test now verifies future command continuation. All file tests use explicit paths under project `runtime`; they do not call MenuState::default or access installed saves. Parent-owned locked/offline build26 passed in11.08s after the preceding combined29.09s build. All169 focused harness cases passed:74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18 installer; shared modules overlap between harnesses. Test compilation took12.95s. These results include the startup recovery and native-zone comparisons; they do not establish audible, rendered or full menu parity. No application was launched. Exact native25ms Core-worker scheduling, complete invalid-Pick/appearance normalization and full migration remain open; no full save-system or menu parity is claimed.

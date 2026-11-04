# World-anchored combat text in 0.139.2

The installed `AzerothSurvivors.exe` is 0.139.2, 150,793,728 bytes, SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`. The [evidence manifest](evidence/0.139.2/combat-text/manifest.json) records hash-bound native slices, Ghidra result identities and the exact Lua callback block. The 0.139.1 full-audit baseline retains its original identity.

## Frame-handler source connection

The embedded script builds `AZS_CT_HANDLERS` for each loaded VM. Registration deduplicates by function identity. Unregistration walks backward, and `AZS_CombatTextFrame` calls handlers in registration order through `pcall`, routing failures to `geterrorhandler`. The combat handlers in 0.139.2 retain their live-list iteration. The separate world-anchor handlers in the adjacent Lua use a copied list.

The embedding appends the recovered handler block to `WorldStateFrame.lua` through `addon_bootstrap::extension`, which the normal FrameXML loader applies before addons and again on reload. `UiPaint` invokes the embedding callback for the visible in-game VM after the camera and plate update, before the second layout pass. The callback is independent of the built-in combat-number pass. Lua validation covered duplicate registration, removal, a failing handler followed by a successful handler, and a fresh registry. Frame timing and execution in the rebuilt client remain unverified.

## Native hit attribution

- The plugin builder at `0x140969550` registers `on_hit_bytes`, `on_attacker_state`, `on_spell_log_miss`, `on_spell_damage_log`, `on_periodic_aura_log`, `on_damage_shield` and `on_spell_go`. The `0x11` registration discriminant is for the raw-byte event. `on_hit_bytes` at `0x140988210` independently checks wire opcodes `0x014a`, `0x024e` and `0x0250` at `0x140988276..0x14098828c`.
- For those three opcodes, the raw-byte reader calls `0x146046f50` to recover the base parser's unread byte count. It advances to the trailing span, splits at the first NUL and reads the second field up to NUL or the remaining tail. The UTF-8 checks call `0x146326720` at `0x14098846d` and `0x140988536`. The filter at `0x141012f60` removes `|`, U+0000 through U+001F and U+007F through U+009F, keeping up to 96 accepted Unicode scalars per field. Empty filtered fields fail admission of the pair at combat-text state `+0x170..+0x19f`.
- Typed melee (`0x14098a7ea..0x14098a82c`), direct spell (`0x14098b990..0x14098b9c5`) and periodic (`0x14098bde2..0x14098be18`) paths take and clear that pair before staging or emitting the hit. The Lua event serializer at `0x140946060` writes the pair as `meterSource` and `meterSourceKey` at `0x140946fc9` and `0x140947002` when the event supplies it. The damage-shield path enters the shared hit producer at `0x14161bbec` without a paired raw-hit suffix.
- The host's canonical hit owner `0x145f0ba80` checks the latest applicable queued packet for the same three wire opcodes at `0x145f0d90f..0x145f0d925`. It appends the localized name and row key through `0x145d9ecd0`. The serializer copies each argument by length and writes a zero byte at `0x145d9ed30` and `0x145d9ed7f`. The standard `0x014a`, `0x024e` and `0x0250` body constructors are separate from this append.
- The name path leads to `0x145ee78a0`, with explicit `Pets`, `Melee`, `Talents`, `Soulstone`, `Thorns` and `Other` descriptor arms. The row-key path selects through `0x145f58b40`. `0x145f58a00` checks learned and static definitions against both primary and alias spell IDs. For a matched ability, `0x145deeb00` constructs `ability:<key>`, conditionally adds `:r<rank>` and uses `:pulse` for the secondary match. The `demon:` path uses `0x145df75e0`. These facts distinguish the cast row key from its hit label and from the localized meter name. Source still needs the full row-identity and origin mapping, including free talent casts, pet and totem attribution, before connecting the same key to `AZS_GetMeterSnapshot`.

## Event stream and projection boundaries

The native event reader `0x140946060` enforces an integer limit from 1 through 256 with the omitted limit defaulting to 256. The absent cursor seats the current tail and the read updates the subscription clock. The common hit producer `0x1409369e0` rejects hits on the local hero, classifies the attacker through `0x140936520` and checks the read lease against the double `5.0` at `0x1465f4ec0`. The owned-unit classifier checks the pet number and consults creature type 11 to distinguish `totem` from `summon`. `on_spell_go` at `0x140987c40` checks the spell record and zero travel speed before emitting instant miss words.

The stream-reset owner `0x14098c310` consumes three event readers and compares the current identity and active-world state to their retained values. A supplied map value can trigger a reset when it differs from a previously known map. The shared reset helper `0x14092c6c0` clears the subscription and both retained ranges before replacing the identity fields. A second caller at `0x140949e63` resolves the same resource and invokes the reset. The raw event-reader parameter names and the second caller's external trigger remain unresolved. The in-world callback runner reaches `0x140b79d80`, which sets combat-text byte `+0x299` before Lua invocation and clears it afterward. This is the native `frameCurrent` boundary.

Projection batch owner `0x140948750` validates mode `impact` or `follow`, a dense array of string handles and the 256-handle limit. The per-entry owner `0x140945890` handles stream and lifetime states before invoking `0x140948400` for the camera verdict and metrics. Its `playerDistance` path at `0x140945ea8..0x140945ee2` takes the Euclidean norm of the sampled player-to-point difference. The WorldFrame seat supplied by Lua includes effective scale, left and bottom. The batch serializer emits `cameraSampleId` and `frameCurrent` separately.

## Hit and projection source connection

The authoritative game bridge pairs the recovered `melee` and ordinary learned, racial and static ability descriptors with the latest matching hit. The co-op encoder writes the two fields after the stock body. The local wire reader obtains the tail length from the normal decoder and pairs the sanitized result with that same decoded event. Solo delivery carries the same optional pair through the typed packet lane. The packet handler table still receives the original event, and the addon stream consumes the pair independently of the stock combat-number CVars and their visible number cap.

The addon stream consumes spell damage, periodic damage, melee, damage-shield and spell-miss events. Deferred melee uses the engine swing sequence through the receive, animation impact and flush paths. The current run identity from `RunSession`, active map and Lua VM identity seat the stream, so a replacement run can invalidate its cursor on the same map. Held target identities survive anchor expiry. Explicit health and removal events freeze the last known overhead point, and a known revive receives a new target-life identity. The projection batch uses the latest world-camera pose and lens before the frame callback and reports the prior sample to an earlier `OnUpdate`. The embedded event and projection wrappers are byte-identical to the adjacent 0.139.2 Lua range in the evidence manifest.

Remaining source work under [#307](../CURRENT-STATE.md#gap-307) covers the dynamic row identities and origin keys for free talent casts, pet and demon swings, totems, procs and items. Those hit labels and row keys depend on the newer [meter ledger](../CURRENT-STATE.md#gap-75), while the reconstructed legacy meter still groups totals by label. The native reset reader types, additional reset trigger, special spell presentation branches and exact target-life behavior across out-of-range reacquisition require further recovery. The separately exposed world-anchor and player-position APIs remain distinct from this combat feed.

Static checks rehashed the installed image, 21 native ranges and three Lua ranges. Standalone Lua verified wrapper arity, delegation, the WorldFrame seat, duplicate registration, removal, error isolation and a fresh registry. Rust source parsing and the diff whitespace check passed. Compilation, game execution and original/rebuilt parity remain in [verification](../verification-needed.md#gap-307).

## 0.140.0 companion and fixed packet attribution

This correspondence and source repair use the installed 0.140.0 EXE,
SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The earlier recovery above retains its own target.

The current hit owner at `0x145f43fc3..0x145f4421d` chooses the captured
primary attack when Game `+0x2a6` is 2 and `+0x261` is unequal to 2.
The key formatter `0x145df8690` lowercases ASCII and replaces each ASCII
space with an underscore before adding `demon:`. Secondary labels remain
independent accounting components. The detailed meter constructor
`0x145f24c90` calls the same formatter. The other companion branch of
`0x145fd1b40` resolves an ability first and chooses `melee` for a zero
spell ID. The separate label resolver `0x145f90c30` uses the captured
icon-bearing companion descriptor when available and falls back to `Pets`.
Its separate Kill Command case depends on the companion producer under #316.

The non-companion fallback reads exact records at `0x147af9038`,
`0x147af9098` and `0x147af8f50` for `soulstone`, `thorns` and
`talents`. The reconstructed hit paths now attach those keys when the
corresponding fallback descriptor wins. They also attach the recovered
companion keys on actual damage events. Melee packet matching uses the
captured attacking GUID so a companion's swing retains its attribution
through the existing local and co-op encoding path. Ordinary meter row
names and attack breakdowns still come from their existing accounting paths.

| 0.140.0 native range | File offset | SHA-256 |
| --- | --- | --- |
| Canonical key/name selection and packet suffix `0x145f43fc3..0x145f4421d` | `0x5f433c3` | `e068bd7e5653c040ef935c2b3bd5189819e768fc0dd44a082dbceacedb897b59` |
| Companion key formatter `0x145df8690..0x145df8a1b` | `0x5df7a90` | `749f33df48fb36f068852084267fb78428762cc531b78b4e63df240dc84a78b6` |
| Detailed descriptor selector `0x145fd1b40..0x145fd21c9` | `0x5fd0f40` | `92dc0564d39c10bf84a19d16a3d4fb807166a9cf9e355977ae791701bf39efbe` |
| Detailed companion descriptor `0x145f24c90..0x145f24e04` | `0x5f24090` | `a3828af7e07c3cfb42db83b8541f570b74deb57fa11a53195b0d4130c3cc664d` |
| Separate name resolver, traced range `0x145f90c30..0x145f91184` | `0x5f90030` | `de8629983cb382b63d841def0382d681c8d9c5aa873bc361c68653f914f830ab` |

The descriptor selector has Ghidra 12.1.4 raw-slice result
`ev_ebfd1ebb59fd305fb61558e9ab1ce97267d877f2d69653a76341a809df4bd5f1`.
Original PE instructions and pointed-to data establish external calls and
descriptors. Rust source parsing and scoped whitespace checks passed. The
regressions for deferred companion damage and melee packet projection are
authored and await compilation.

The current combat projection entry at `0x140997af0..0x14099821a`
(file offset `0x996ef0`, SHA-256
`d323b0d06280ebdf7a92738277f7902e2d91e807aef1b986ca9d4e8220d86c86`)
selects the follow target row or the retained impact row. The target-row
state value 2 clears distance admission for follow mode. The on-screen path
at `0x1409980ec..0x140998150` reads the sampled hero coordinates at
`+0x184..+0x18c` and computes the Euclidean distance from the selected feet
position when both positions are available. This is separate from the
world catalog projection in #317. The already connected Rust combat
projection uses the same hero-relative distance contract.

The current reset system `0x1409dd790` and extra reset helper
`0x14099bf90` both call `0x14097e3e0`. Ghidra raw-slice results
`ev_402d73c52a9455f04758f750a698ff6bc161f20adbebf7df1684cc46e94418db`
and `ev_4a8730f4b8f52fcc6afbe147efda0e265dbb9a0340a981fa836c690f0742a73a`
cover those functions. The extra helper looks up and locks the combat
resource before resetting. Its indirect trigger and the out-of-range
identity transition remain open. The common hit result
`ev_499e69908732fb96ce6717d08aa702df0e41818287eac5627ad3c5e52080bb89`
locates the target-row producers for that trace. Detailed source origins
and their meter snapshot join remain under #75. Totem, free talent and
item attribution beyond the fixed descriptors still require their own
producer and key mapping.

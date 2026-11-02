# Source-first discovery frontier — 0.123.0

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [machine assessment](evidence/0.123.0/source-frontier.json) binds the complete
current inventories, predecessor delta, actual inspected source hashes and all
added literal candidates. It establishes source navigation and bounded interface
roles, not native dependency correspondence or behavioral equivalence.

This is the initial source-first assessment. The subsequent
[pick/smooth native proof](evidence/0.123.0/pick-smooth/manifest.json) establishes
partial pick-source correspondence through the existing `receive_choices`
payload parser. Offer identity/ack integration remains #272. The AS smoothing
wrapper remains absent under #273, while #275 supplies its separately bounded
native contract. Initial pending counterpart statements below are superseded
within those precise reviewed scopes; they are not current claims that all
pick implementation is missing.

## Diagnostic modules

The complete comparison adds two previously unregistered AS diagnostic modules
and restores `realmd.rs`, producing **66 current AS diagnostic paths**. None of
the 63 previous current paths disappears. The native ranges below are declared
unwind owners with independently decoded diagnostic references; actual Ghidra
body ownership and recovered semantics remain separate evidence.

| Stable module / finding | Exact current lead | Existing source seam and next recovery |
| --- | --- | --- |
| `custom-game-coop-pick` / source #272, bounded contract #274 | `coop/pick.rs`, Location `0x1476a1a68` (62:10), instruction `0x145bd71bb`, declared owner `0x145bd7010..0x145bd7494` | `gameplay/coop_commands.rs`, `gameplay/mechanics/choices.rs` and `coop/replication.rs` already own guest command admission, offer state and wire messages. Inspect the native owner's incoming offer/selection fields, pending state, identity and retry/ack consumers before connecting its actual contract. Existing adjacent source does not establish this new module's correspondence. |
| `custom-game-coop-smooth` / source #273, bounded contract #275 | `coop/smooth.rs`, Locations `0x1476a19b0/0x1476a19c8` (228:17/227:17), instructions `0x145be151c/0x145be1500`, owner `0x145be0a60..0x145be1534` | `coop/client_state.rs`, `coop/engine_packets.rs` and `gameplay/client/coop_feed.rs` own existing snapshot/presentation interfaces. Shared `benilla-app/src/net/motion/remote.rs` and `spline.rs` supply ordinary movement. Recover AS-specific sample timestamps, actor state and correction consumers before assigning an implementation counterpart. |
| `custom-game-realmd` / retained #94 | `realmd.rs`, Locations `0x146fcccd8/0x146fcccf0` (128:88/130:60), instructions `0x145aa6b7b/0x145aa6bb5`, owner `0x145aa4380..0x145aa6c12` | Existing glue manager, local stock frontend, login/roster and character/save source remain retained. Reconcile the current state/producer/consumer contract under the same #94 identity. Returning diagnostic membership does not erase implementation or create a second issue. |

The [system register](coverage/systems.json) keeps candidate source seams
separate from established partial source correspondence. Module findings are
distinct from the supplied lag and pick release findings, which retain their
individual [release review](release-review-0.123.0.md) entries.

## Added candidates beyond filenames

All **nine added namespace candidates** and **three added resource candidates**
have exact `Q41-I01:<category>:<ordinal>` selectors in the machine assessment.
The namespace changes are packed names and changed suffix/boundary spellings for
existing application composition, Discord, hero preview, host input, world hold,
audio-device output, terrain, portal and asset-loader roles. Actual source was
inspected at those boundaries. In particular, available source does not prove
that a similarly named type was compiled into this target or that an unseen AS
override is absent. These observations do not establish independent new AS bugs.

| Added resource selector | Exact data boundary and inspected source |
| --- | --- |
| `Q41-I01:resource_path:3` | The regex starts at `//interface/buttons/ui-rotationright-button-up.blp`. The exact pointer/length descriptor at file offset `0x620ea98` selects the full 54-byte `mpq://interface/buttons/ui-rotationright-button-up.blp` at `0x146210052`. Existing `armory.rs::load_art` supplies the turn-right button texture; ordinary MPQ asset loading supplies the engine boundary. |
| `Q41-I01:resource_path:263` | `DBFilesClient\LoadingScreens.dbc`, exact descriptor at file offset `0x772a348`. `benilla-formats/src/loading_screen.rs::load_loading_screens` and `benilla-app/src/loading_screen.rs` supply the established catalog and loading-cover interface. Native AS-specific lifecycle correspondence is not established by the path. |
| `Q41-I01:resource_path:225` | The candidate packs `FrontSpell_Holy_PrayerOfHealing` beside `DBFilesClient\CreatureSoundData.dbc`. The exact descriptor at file offset `0x76b0ca8` selects only the 35-byte DBC path at `0x1476b227e`. Existing `gameplay/client/addon_bootstrap/creature_sound.rs`, `LocalClientExtension` and the shared creature-voice loader supply the custom patch and generic parser boundaries. The historical #175 death-sound contract needs current dependency applicability; the adjacent spell text does not establish a combined filename or new effect. |

The remaining literal categories are unchanged sets: game bindings, Lua function
declarations, Lua/UI registrations, textual ID assignments, textual numeric IDs
and save/configuration-key candidates. Equality is a discovery observation, not
proof that code, fields, IDs or behavior stayed unchanged.

The embedded **16,665-byte addon API** has the same payload hash as 0.121.0,
at its current `0x1473213b8` location. Native producers, interface lifetimes and
runtime consumption remain separately unverified.

No new REA/Ghidra query, application compilation, compiling test, client/game/
network/server operation or original/rebuilt comparison was performed by this
source-first assessment. The parent audit's whole-image census has its own
evidence. Generic supporting uncertainty remains in the residual queue unless a
concrete AS contract requires a further bounded trace.

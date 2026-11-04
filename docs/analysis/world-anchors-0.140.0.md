# Downed party locations and world anchors in 0.140.0

The installed EXE is 0.140.0, 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [0.139.2 release](../CHANGELOG.md#01392) introduced three individually
tracked addon claims. The bounded native owners and connected source below
separate catalog state, camera projection, combat distance and party publication.

| Claim | Finding | Current assessment |
| --- | --- | --- |
| `changelog:0.139.2:c456a516752982b8` | [#63](../CURRENT-STATE.md#gap-63), with [legacy revive API #11](../verification-needed.md#gap-11) | The [authoritative party producer](coop-downed-0.140.0.md) supplies the exact embedded getter through the normal addon stream. |
| `changelog:0.139.2:a6b9bed3be9c9ffa` | [#317](../CURRENT-STATE.md#gap-317) | The live catalog, projection and post-camera callback are source-connected. Exact native scheduler and edge ordering remain open below. |
| `changelog:0.139.2:20d7218da9c188d5` | [#307](../CURRENT-STATE.md#gap-307) and [#317](../CURRENT-STATE.md#gap-317) | The world and combat projectors have separately recovered distance inputs. The world projector samples the selected unshifted attachment and the combat projector samples unshifted feet. |

The release summary `changelog:0.139.2:abd40bd242005cfd` provides context for
these claims.

## Downed party location publication

The embedded `AZSDOWNED` branch parses `id`, `name`, `x`, `y`, `z`, `ep`
and `state`, calls `AZS_TagSpace`, stores `AZS_DOWNED_UPDATED` and calls
`AZS_WALine` to notify the world catalog. The getter checks zero arguments,
passes through `AZS_GetPlayerPosition` errors and requires a received zone line
whose map matches the player sample. It then ensures the world catalog is
synchronized. Each result is a new table for a row whose state is `down`.
The row retains its identity and optional anchor and starts with
`positionAvailable = false`. All three coordinates must be numeric and the
row's `spaceId` must match the player sample before it publishes coordinates
and the player's map, space and run identifiers.

The existing [party state](../../crates/azeroth-survivors-re/src/coop/game_party.rs)
owns per-slot positions and revival eligibility. The [mechanics party owner](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs)
captures those rows and applies revival in the addressed hero context.
The [guest addon feed](../../crates/azeroth-survivors-re/src/gameplay/client/coop_feed.rs)
and `Party::revive_payload` publish the legacy recipient-local `AZSREVIVE`
progress line. The [addon bootstrap](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs)
already installs player position and space helpers, including the shared
[current-run and replay source](addon-run-space-0.139.2.md).

The [producer recovery](coop-downed-0.140.0.md) connects the host and
recipient writers, timestamps, stable world unit GUIDs and departure states.
The FrameXML bootstrap installs the exact receiver, map/run reset and public
getter. The Lua getter projects fresh tables and delegates catalog activation
and handle annotation to the same native sync seam used for other destinations.

## Catalog, projection and combat distance

`AZS_GetWorldAnchorCapabilities` publishes API version 1, eight kinds,
`position` and `overhead` attachments, world offsets, frame projection and
handler support, and player distance metrics. The advertised page and batch
limit is 256, living and fallen capacities are 4,096 each, and fallen retention
is 60 seconds. The query and projector cap their input/output at 256. The
unit life frame scan checks both 4,096-entry ceilings, and the adjacent native
double at `0x146641458` is `60.0`.

`AZS_WASync` sends run, map, unit, cache, lair and downed rows to the native
catalog. It activates on demand, marks dirty on addon line updates and
resynchronizes when its native stream identity changes. The query delegates
query, cursor, limit and `GetTime()`. Projection delegates the request table,
`GetTime()` and the existing combat WorldFrame seat. The world frame callback
copies the handler list before calling each function through `pcall`. This
allows handlers to unregister during traversal. The shipped wrapper identifies
the post-camera and pre-paint seam. The rebuilt callback runs at that seam,
with its own `frameCurrent` scope and error handling.

The whole-image scan identifies the distinct
`benilla_app::host_controls::world_anchors::WorldAnchorsPlugin` name at
VA `0x146597348`. The accompanying `world_anchors.rs` path occurs at
VAs `0x146648c56`, `0x146648cb8` and `0x14664be16`. The diagnostic scan
supplies no verified Location-derived owner for those path occurrences. The
packed registration names give additional inputs for resolving the sync,
query, project, unit and stream callables and the separate frame callback.
At `0x140045616` the screen compositor passes the six name slices to
`0x14010a760`. The Lua bridge wrappers reach catalog query `0x1409a4ae0`
and projection `0x1409a0070` through `0x140bb9cf6` and `0x140bb7c88`.
The sync body at `0x14099c440` reads `map`, `run`, `units`, `chests`, `lairs`
and `downed`. Its downed reconciliation at `0x140918600` retires the fall's
handle as the state or presence changes. The world sample at `0x1409cab50`
filters type 3, the registered faction template and an available UNIT health
field before maintaining the living and fallen rows. It marks the sample
complete at `0x1409cc2f8`.

The query reads an optional kind and state filter, then hashes the query
parts with 32-bit FNV-1a and a zero separator. A page cursor has the `k`
prefix followed by stream, catalog revision, query hash and offset. The
response distinguishes a stream mismatch, an obsolete catalog and a changed
query. Projection reads `w`-prefixed handles with the stream text and a
terminal sequence, then resolves each request in input order. It adds XYZ
offsets before the camera call at `0x1409a1f2a`.
The independent hero-distance branch at `0x1409a210e` uses the unshifted
attachment, requires a valid hero sample and computes the f32 norm. The
combat projector's separate `0x1409980ec..0x140998155` branch computes distance
to unshifted feet. Impact and follow choose their positions before that branch.
The retire owner at `0x14097fed0` caps explicit reason records at 8,192 and
evicts the oldest reason at `0x140980221`. A missing anchor below the issued
sequence bound projects as `expired`, using `age` when the reason was
evicted. A fallen row is still current at its exact expiration timestamp.

The [catalog source](../../crates/benilla-app/src/combat_text/world_anchors.rs)
reads live UNIT descriptors and actual pose/overhead anchors, reconciles the
addon rows, freezes observed deaths, and exposes the five native functions
through the regular VM seed. The
[existing projector](../../crates/benilla-app/src/combat_text/anchors.rs)
supplies the frame camera and WorldFrame conversion. The world distance uses
the same settled local hero sample as `AZS_GetPlayerPosition`. The
[paint pass](../../crates/benilla-app/src/ui_script/extract/mod.rs) runs the
exact Lua frame callback after sampling and ahead of widget extraction.

The remaining native questions are the relative order of the erased
combat/world frame callbacks, same-map run invalidation ahead of an incoming
zone line, and tied entity admission at the living cap. The rebuilt catalog
uses the published run-space transition and the existing world's entity query.
The exact native stream token producer and callback order remain under the
same finding.

## Exact evidence

Each row identifies a byte range in the installed EXE. Virtual addresses are
preferred PE addresses. The registration names and strings give static search
inputs. The Lua ranges establish the wrapper behavior above.

| Range | File offset | Preferred VA | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Packed world anchor registration names | `0x655ab28` | `0x14655bb28` | 151 | `6f47f7ec49288491149bef95837977bc13984054b4e3134c96cd80ee36c5311b` |
| World anchors plugin name | `0x6596348` | `0x146597348` | 61 | `5eb4619aec02fa35f0a80ec3e41755b04248d5bda6cdba53a9c7160c3f4c32ae` |
| Packed addon channel name `AZSDOWNED` | `0x77329fe` | `0x1477339fe` | 9 | `07b65226b1fe169d6a742ed3d44fa8a8f494adedd07278ab454e936340abdd11` |
| Lua `AZSDOWNED` receiver | `0x7aed9f4` | `0x147aee9f4` | 178 | `652aa3911c0fe93740e50716b201996ae517dabf84dcae13364a4e9dab8cd142` |
| Lua downed party getter | `0x7aeb889` | `0x147aec889` | 975 | `711b61df8e5719f5bd38efe7ebe305fd6268bdaf3c471d74ff57d6401dadfd6d` |
| Lua world anchor capabilities | `0x7aead66` | `0x147aebd66` | 609 | `b06b8b45b90bfd60e0485cedfaf771563cf80893e7d65549b37b6d1a60d89e84` |
| Lua world anchor sync | `0x7aeb046` | `0x147aec046` | 462 | `ec0b25003be21f2858d845236a385f07ca1e31b43cffd208ef87cd3bdc3afb56` |
| Lua world anchor query | `0x7aeb4b4` | `0x147aec4b4` | 392 | `a7743692306abf90fd1cdbcf31fd7baaee957513babd2e22c447ee0944da2a40` |
| Lua world anchor projection | `0x7aeb63d` | `0x147aec63d` | 393 | `1666c8e1c62b8abcde63e939765839220ed54ca2c497c2231c177a0fc0ce8c17` |
| Lua world anchor frame callback | `0x7aebf11` | `0x147aecf11` | 372 | `a8240b5229afdd379e5101285c368e830952dbd0d7d0c23876d08337f5822dca` |
| [Combat event and projection Lua](evidence/0.139.2/combat-text/event-projection-api.lua) | `0x7aea1ac` | `0x147aeb1ac` | 1,810 | `d9fd81b72da25e2d89c5b590885794c483a4d21fe5de6d66456fedd220612982` |
| [Combat frame-handler Lua](evidence/0.139.2/combat-text/frame-handlers.lua) | `0x7aea8be` | `0x147aeb8be` | 830 | `85c566b495b1968d89d8265d284eb3aae73e2ce94b638185f35708561629fd55` |

## Native owners

| Owner | Preferred VA range | File offset | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Screen name carrier | `0x14010a760..0x14010a85f` | `0x109b60` | 255 | `281abe7c38008073b7b27db3f2b9b680236a384ef7adddb7dbc594753433f513` |
| World catalog sync | `0x14099c440..0x14099eba6` | `0x99b840` | 10,086 | `597c213227142a7f4343d4b7f916ada17bcdf5bc615f2d24c40ea2336ee7637e` |
| World catalog query | `0x1409a4ae0..0x1409a8594` | `0x9a3ee0` | 15,028 | `77f6e2723c76c0531d459f761980766d81d4a781235408e4eed74135a8f9c19c` |
| World projection | `0x1409a0070..0x1409a2a9e` | `0x99f470` | 10,798 | `5de5a7d218a98b5eee415a90fb70febed0cb799cb51f54a43c4f6e92cd89c9b1` |
| Unit life frame scan | `0x1409cab50..0x1409cc3f3` | `0x9c9f50` | 6,307 | `290e4cebeadfd1db170ebd24b79e36ae2df9612faf5d521ac05ef4e6f3caa55c` |
| Downed row expiry reconciliation | `0x140918600..0x1409189b5` | `0x917a00` | 949 | `b3950d96c0276a6f3da8a1242ee3c424931e7636588532f898353b03d65f92d2` |
| Retirement reason FIFO | `0x14097fed0..0x1409802c1` | `0x97f2d0` | 1,009 | `b68fab83664ea45430aedbdf880fbd62e27f6c703b9253b6fec3abbdca265e4d` |
| Issued handle fallback and expiry equality | `0x1409a1d5c..0x1409a1e11` | `0x9a115c` | 181 | `fe19dd79c0f071d6bc40eff1a46c3cd01e7a8e70508889a0f334e421295ba0fb` |
| Combat sample and unshifted feet distance | `0x1409980ec..0x140998155` | `0x9974ec` | 105 | `2529042af531dd241aa74d7e7df30a0a1628d569cef5c76e0984d62681942f7d` |
| World offset projector and distance | `0x1409a1eec..0x1409a21b7` | `0x9a12ec` | 715 | `b4b191881d8fbc63d0388a0a32cc9bd099d8b8b6fe5bb6a559d284f2293793b4` |
| Kind string pointer/length rows | `0x14664f6a0..0x14664f720` | `0x664e6a0` | 128 | `1385ced2cb59ff2f75d2ea92947cc1775cea801de63ab692f8028e4f85ce6388` |
| Cursor literal formatter | `0x1466480a5..0x1466480b2` | `0x66470a5` | 13 | `8e176a1294cdd52c654ba5e85869c1def64cd8eb5234b65f587be6f52d09cfef` |

The query, projection, sync and unit-life results have respective Ghidra
receipts `ev_8aa0ce3df7220bdb40669dc4a831ce959a54415bdfd170f8d1c4d18c92fa8684`,
`ev_7480a7f8383d48f05ad0450825eac39d6335fa590fcf11acf537d5dba99c2534`,
`ev_0ab16f5ea55df34bcc75d9d95940c3b64694fb333a389f6dc782dcff226145b5`, and
`ev_2f9226b82bcad566c834863d95097a4f98622cd494d2a890d7a3b39889849ffe`.
Each uses an original-VA slice with its own digest. The PE operand traces
identify out-of-slice literals, global data and direct calls.

The embedded Lua and assembled bootstrap pass `scripts/check-addon-bootstrap.lua`,
including the downed getter, world capabilities and callback list mutation.
The Rust source syntax-parses. The two catalog regressions are authored and
unrun. Compilation, in-world addon behavior, co-op execution and
original/rebuilt comparison remain unverified.

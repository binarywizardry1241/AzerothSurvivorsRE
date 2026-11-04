# Downed party locations and world anchors in 0.140.0

The installed EXE is 0.140.0, 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [0.139.2 release](../CHANGELOG.md#01392) introduced three individually
tracked addon claims. The embedded Lua below verifies their current Lua
boundary. Native state, scheduler, producer and consumer correspondence
remains open where identified below.

| Claim | Finding | Current assessment |
| --- | --- | --- |
| `changelog:0.139.2:c456a516752982b8` | [#63](../CURRENT-STATE.md#gap-63), with [legacy revive API #11](../verification-needed.md#gap-11) | The embedded getter and `AZSDOWNED` receive branch are present. The rebuilt revive feed supplies progress, and still needs the authoritative party location producer, delivery and getter. |
| `changelog:0.139.2:a6b9bed3be9c9ffa` | [#317](../CURRENT-STATE.md#gap-317) | The embedded catalog and projection wrappers, callback list and native binding names are present. The rebuilt combat anchors have reusable camera and hit-life inputs. The general catalog and its native source connections are missing. |
| `changelog:0.139.2:20d7218da9c188d5` | [#307](../CURRENT-STATE.md#gap-307) and [#317](../CURRENT-STATE.md#gap-317) | The combat projection wrapper matches the retained bytes and rebuilt combat projection already returns hero-relative distance. Current native combat distance correspondence and general world projection require separate proof. |

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

Follow the packed `AZSDOWNED` producer name at VA `0x1477339fe` back through
the addon publication selector to the host's authoritative revive position,
fall epoch, stable member ID, removal and terminal writers. Recover delivery
and empty/replay ordering per recipient, including host and guest state,
departure, map change, fresh VM and paused/chooser cases. The Lua branch
establishes its received fields. It leaves the producer, event lifetime and
where the revive point is captured to be recovered. The
[supplied API reference](../addon-api/reference-supplied-0.139.2.md#azs_getdownedpartymembers--list-nil-or-nil-err)
describes additional expected behavior and supplies those follow-up cases.

## Catalog, projection and combat distance

`AZS_GetWorldAnchorCapabilities` publishes API version 1, eight kinds,
`position` and `overhead` attachments, world offsets, frame projection and
handler support, and player distance metrics. The advertised page and batch
limit is 256, living and fallen capacities are 4,096 each, and fallen retention
is 60 seconds. These values come from the Lua return table. Native enforcement
and expiration remain open.

`AZS_WASync` sends run, map, unit, cache, lair and downed rows to the native
catalog. It activates on demand, marks dirty on addon line updates and
resynchronizes when its native stream identity changes. The query delegates
query, cursor, limit and `GetTime()`. Projection delegates the request table,
`GetTime()` and the existing combat WorldFrame seat. The world frame callback
copies the handler list before calling each function through `pcall`. This
allows handlers to unregister during traversal. The Lua path identifies the
callback. Its call position relative to camera and paint requires native
scheduler correspondence.

The whole-image scan identifies the distinct
`benilla_app::host_controls::world_anchors::WorldAnchorsPlugin` name at
VA `0x146597348`. The accompanying `world_anchors.rs` path occurs at
VAs `0x146648c56`, `0x146648cb8` and `0x14664be16`. The diagnostic scan
supplies no verified Location-derived owner for those path occurrences. The
packed registration names give additional inputs for resolving the sync,
query, project, unit and stream callables and the separate frame callback.
The source has no corresponding plugin or catalog registration. Its
[combat anchors](../../crates/benilla-app/src/combat_text/anchors.rs) and
[frame callback consumer](../../crates/benilla-app/src/ui_script/extract/mod.rs)
provide existing inputs for camera projection, VM lifetime, and the
combat-specific hit stream. The rebuilt combat projection already returns
`playerDistance` from the sampled hero to the selected anchor's feet.

Follow the plugin descriptor and the individual packed registration name
addresses to their callable slots, then connect world objects and unit
health/removal events to catalog insertion, death freezing, expiry and reset.
Verify the native query and projection limits, catalog versus stream cursor
invalidation, request order, attachment offsets and the unshifted
`playerDistance` input for world projection. The native strings
`playerDistance` at VA `0x146647b1a` and `CATALOG_CHANGED` at VA
`0x1466480bc` are additional operand search seeds. The [0.139.2 combat
recovery](combat-text-0.139.2.md) proved the hero-relative calculation in that
image. The same combat Lua bytes are present in 0.140.0. Verify the current
native combat projection, point selection and sample producer separately
from the general world projection owner.

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

Compilation, in-world addon behavior, co-op execution and original/rebuilt
comparison remain unverified.

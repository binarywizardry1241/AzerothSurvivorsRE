# Engine lineage and release claims

This is a source comparison for the selected installed **0.117.0** EXE,
SHA-256 `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`,
145,283,072 bytes. The supplied [0.116.0 release notes](../CHANGELOG.md#01160)
say that its underlying client was updated. Public repository history identifies
a plausible engine update, but **does not identify the engine revision compiled
into either 0.116.0 or 0.117.0**. Native contract recovery and original/rebuilt
comparisons remain separate requirements. [verification-needed](../verification-needed.md)
owns current findings and their validation limits.

## Verified source identities

The local [vendor manifest](benilla-vendor.json) now pins
[`samwhosung/benilla@0367a2c2180d777392470860693009465495a30d`](https://github.com/samwhosung/benilla/commit/0367a2c2180d777392470860693009465495a30d),
dated 2026-10-22 07:07:23 UTC. Its source archive SHA-256 is
`5ee3fc618bcd361e0378441079fe6e24cea0c5bae29e07c0e3b507a4397ff9fb`.
The [2026-10-25 import report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/benilla-update-2026-10-25.md) records the 23-commit
advance from `66b73cd6`, preserved AS adapters and static validation. Pristine
upstream hashes do not describe the adapted local files. The source comparison
below retains the pre-import `66b73cd6` baseline for its ancestry counts.

The GitHub repository metadata identifies
[`Arnesen/wenilla`](https://github.com/Arnesen/wenilla) as a direct fork of
`samwhosung/benilla`. Its [upstream policy](https://github.com/Arnesen/wenilla/blob/3426fd28c55b1d3dad22459d1a80e72a05a8006c/docs/UPSTREAM.md)
keeps the shared client and merges benilla, with browser/wasm, WebSocket,
JavaScript bridge and realm-service carries. “benilla” and “wenilla” therefore
describe related source trees, not unrelated engines. The repository names alone
are not a reason to replace the local engine or its AS adapters.

Public heads and ancestry were checked on **2026-10-25**:

| Source | Immutable revision | Observed history |
| --- | --- | --- |
| Current local engine baseline | `0367a2c2180d777392470860693009465495a30d` | Imported with AS reconstruction changes preserved |
| Previous local baseline | `66b73cd6d46b29c0b2c17d05947ac277e374b217` | Starting point for the ancestry counts below |
| Latest benilla revision merged into wenilla | `0367a2c2180d777392470860693009465495a30d` | 2026-10-22 07:07:23 UTC, packet-order cast/form/group/auction events |
| Wenilla engine merge | `c9b1b373b50ed07f7835492ce004e34b8881c170` | 2026-10-22 07:27:42 UTC, merges benilla through `0367a2c2` |
| Observed wenilla `main` | `3426fd28c55b1d3dad22459d1a80e72a05a8006c` | 2026-10-24 17:10:11 UTC, JavaScript `fire()`/`hold()` call-host fix |
| Observed benilla `main` | `42db0b49d2cad512ab736910cc6affffef29f58a` | 2026-10-25 20:48:07 UTC, party/raid getters at each packet's place |

The [wenilla merge](https://github.com/Arnesen/wenilla/commit/c9b1b373b50ed07f7835492ce004e34b8881c170)
is titled “110 commits,” measured from wenilla's previous sync. The
[exact comparison from the previous local pin](https://github.com/samwhosung/benilla/compare/66b73cd6d46b29c0b2c17d05947ac277e374b217...0367a2c2180d777392470860693009465495a30d)
is **23 commits ahead, 0 behind**, with `66b73cd6` as the merge base. The
[observed benilla head](https://github.com/samwhosung/benilla/compare/66b73cd6d46b29c0b2c17d05947ac277e374b217...42db0b49d2cad512ab736910cc6affffef29f58a)
is **111 commits ahead, 0 behind** the previous local pin. These are ancestry counts,
not measured functional differences or a prescription to import every commit.
The [latest wenilla commit](https://github.com/Arnesen/wenilla/commit/3426fd28c55b1d3dad22459d1a80e72a05a8006c)
is a bridge change, not the latest engine sync.

## Relevant interface changes in the 23-commit interval

The interval includes client-side cast refusal gates; spell cooldown insertion;
live unit/token targeting and getters; party/raid roster, getters and verbs;
object-update notifications; and ordered UI/cast/form/group dispatch. Relevant
local owners include `benilla-app/src/net/objects{,/update}.rs`,
`script_calls.rs`, `player/{controller,movement_net,posture,state,wire_in}.rs`,
`ui_unit`, `ui_cast` and their shared UI dispatch interfaces. These paths are
concrete candidates when a recovered AS contract depends on those interfaces.
They are not proof that the selected EXE contains any particular upstream fix.

The merge also preserves wenilla-specific asynchronous transport, sliced entry
loading, event taps, browser clocks and browser storage. Those public fork
changes must not be treated as required native-AS behavior without a selected
EXE connection. The later source import is recorded separately in the import report above; no AS gameplay repair follows from this comparison.

## Bounded marker and aura source comparison

The five files below were fetched directly from immutable GitHub raw URLs at
the previous local baseline `66b73cd6`, merged benilla `0367a2c2`, and wenilla head
`3426fd28`. **Each row has identical bytes across all three upstream trees.**
This is a narrow file comparison, not an equivalence claim for the whole client.

| Shared path beneath `crates/` | Bytes | SHA-256 in all three upstream trees |
| --- | ---: | --- |
| `benilla-world/src/particles/buffer.rs` | 20,959 | `26b7e59445bc7ed8da3c803bee89fc223d5b13908084e0925ff04058883d2d66` |
| `benilla-world/src/particles/render.rs` | 38,732 | `a7fe1acf2478ec9191f99a1130439c323fba6ab86908b1eeffddaf4f7dc6e1ec` |
| `benilla-world/src/sky_order.rs` | 13,575 | `2a18cc059e4bfca8364ecedf19d3706593b42199d2ed94e299f9afd7835db8de` |
| `benilla-ui/src/script/tooltip_aura.rs` | 15,327 | `ef4acfa7ab5af30130c10d2165f07d435adbd0e41784485556f7530f76d8b8bd` |
| `benilla-app/src/ui_aura.rs` | 56,712 | `a6f1a630a74954052f38d3be6987b6d895985124fcbf34d6dba335b5117f9e2c` |

The local first three files match these hashes too. The local aura files carry
AS-specific adapters: `tooltip_aura.rs` hashes to
`f4ed2d61d1f36aacecd5579c69616729672bd9ef99bd5dc5822b77b749ca7e2e`;
`ui_aura.rs` hashes to
`62f5db59c1b332a2209d062bbb2f91c0e75ccba5ee8e6b982e715f1cb243bc88`.
Later source work can change those local hashes without changing upstream
provenance.

The existing AS aura-text connection is
[`coop_overlay::guest_metadata`](../../crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs)
→ `LocalSpellDescriptions` →
[`spell_descriptions::publish`](../../crates/benilla-app/src/local_client/spell_descriptions.rs)
→ `UiScript::replace_spell_tooltip_overrides` →
[`tooltip_aura::aura_view_of`](../../crates/benilla-ui/src/script/tooltip_aura.rs).
It supplies local spell-resource rows outside a guest session and received
resource rows for a guest. The aura lookup uses overrides keyed by spell ID,
preserves the ordinary aura view's dispel class, and uses secondary text with
primary-text fallback. The same aura builder is reached by `SetPlayerBuff`,
`SetUnitBuff` and `SetUnitDebuff`. Therefore “no AS aura override exists” would
be false; the remaining 0.116.0 question is which producer and replicated
metadata represent a friend's actual numbers, and whether they reach both self
and party consumers under the selected EXE's ordering and identity rules.

The existing
[`gameplay::raid_markers::present`](../../crates/azeroth-survivors-re/src/gameplay/raid_markers.rs)
projects body/fill/outline geometry onto terrain and submits alpha/additive
draws into the shared `EffectQuads` stream. The later
[0.117.0 marker-order repair](marker-order.md) changes ground sort bias
from `-48000` to the recovered `11692`, retaining raster depth bias `32768` and
`no_depth_test: false`; vertical columns retain sort bias `8192`. The shared
[`particles::render`](../../crates/benilla-world/src/particles/render.rs)
queues by `rangefinder.distance(anchor) + bias`; the buffer documents positive
sort bias as drawing later. Raster depth bias and stream sort bias are separate
controls. The unchanged shared files above cannot by themselves explain a new
AS marker ordering policy. The linked follow-up now recovers the selected marker submission and shared
commit interface. Source constants and bounded native replay do not prove a
rendered overlap result or original/rebuilt parity.

The [Discord client destination repair](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.117.0.md#discord-client-destination-112)
separately resolves the old invite in the local menu action against current native
action 12 and its URL-helper boundary. The client now uses
`https://discord.gg/azerothsurvivors`. This source correction does not establish
engine lineage or the external website link; no website source or operation is
part of this repository comparison.

## Evidence limits and next static step

The engine-sync hypothesis is supported by the official fork relationship,
merge history and timing. It remains an **inference** that the game's 0.116.0
update used that sync. Matching source names, a `wenilla-rogue` diagnostic path,
the release description, or similar semantics do not establish the compiled
revision. A version/build stamp, if recoverable, needs its consumer and build
meaning checked; otherwise compare selected-target instruction/data contracts
for the specific changed interfaces and retain uncertainty about the rest.

No original/rebuilt application, server, network session, compilation or
compiling test ran for this comparison. Source reads, GitHub HTTPS metadata and
immutable file-byte comparisons establish only the stated lineage and bounded
source facts. The separate import report owns the dependency update and its validation.

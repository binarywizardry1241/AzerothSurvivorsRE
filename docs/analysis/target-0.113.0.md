# Installed target review — 0.113.0

Selected SHA-256: `c3a82f594e05dc8cea49dfa38e69aca96c9ee625a5b7df3ffa93c19dc8c95773`.
The 141,960,192-byte AMD64 PE identifies itself as 0.113.0 in matching embedded
updater/dialog markers. [Identity/resources](target-refresh-0.113.0.json),
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), [native census](native-census-0.113.0.md).

The configured installed EXE and Data are read-only inputs. All nine MPQ names,
sizes and complete SHA-256 hashes match 0.112.5. This does not prove resource
content semantics, world-loading or rendered compatibility.

The complete [PE scan](coverage/native-summary.json) covers every file byte,
six sections, 425 imports, 350,243 unwind records and 634,045 nonpadding
relocations. It finds 729 diagnostic paths: 58 custom and 671 engine/other.
Five custom paths are new: app `screens/coop.rs`, game `coop/route.rs`,
`coop/tcp.rs`, `game/party.rs` and `server/party.rs`. The formerly present
`realmd.rs` diagnostic is absent. Literal disappearance does not prove behavior
removal; its system record retains historical ownership. All 58 current custom
paths have [decoded reference leads](coverage/diagnostic-ownership.json), not
complete native/source contracts. New socket imports are `accept`, `bind`,
`listen` and `shutdown` from `ws2_32`.

The full embedded-candidate inventory was compared with retained 0.112.5.
New distinct binding/API leads include `AZS_GetPartyMeter`, `AZS_GetRevive`,
`AZS_PARTY`, `AZS_PARTY_UPDATED`, `AZS_REVIVE`, `AZS_REVIVE_UPDATED` and
`AZS_StaticPopup_Show`. Lua UI-registration, save-key and textual-ID literal
sets match; equal labels do not establish equal contracts. New module leads
include co-op canvas/actions/badges/root/staff and HUD revive bar/fill/line.
Resource leads add the gold-dragon dialog artwork, `StaticPopup.lua`, and
concatenated `SpellDispelType.dbc`/`SpellRadius.dbc` strings. The prior
`DBFilesClient\\ItemDisplayInfo.dbc` literal no longer matches the inventory;
this is not proof that the resource or consumer was removed. PE resource payload
extent remains 210,688 bytes. Module/resource concatenation changes remain
candidates rather than inferred type or feature removals.

The supplied [0.113.0 notes](../CHANGELOG.md) introduce co-op and the two addon
read APIs. [API recovery](addon-party-api-0.113.0.md) separately traces the exact
embedded Lua, native packet producers, values, precision and callback behavior
under #11/#41. [Claim ownership](changelog-coverage-0.113.0.md) keeps lobby,
transport, cooperative gameplay/UI/persistence and Discord obligations pending
under #63/#41. Co-op integration is deferred; addon metadata recovery does not
provide a multiplayer backend or establish the other release claims.

Historical source and evidence retain their actual target. No previous RVA,
layout, ID, behavior or producer/consumer dependency is certified for this hash
unless the linked current recovery explicitly revalidates it. This refresh runs
static discovery/recovery only: no application compilation, compiling test,
game launch, network session, save/configuration write or controlled
original/rebuilt comparison. #41 remains open.

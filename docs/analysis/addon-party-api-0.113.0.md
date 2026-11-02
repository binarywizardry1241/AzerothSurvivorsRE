# Party meter and revive addon APIs — 0.113.0

The installed **0.113.0** EXE, SHA-256
`c3a82f594e05dc8cea49dfa38e69aca96c9ee625a5b7df3ffa93c19dc8c95773`,
contains both APIs as actual embedded Lua. Their native producers, serialization,
defaults and Lua consumption are recovered below. This is static API recovery
plus interpreted Lua checks; no original or rebuilt game was launched, and no
compilation or live co-op validation occurred. Current reconstruction delivery
status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md); these calls are not added
to the reconstructed client by this investigation. Addon integration belongs to
gap #11; new co-op simulation belongs to #63 and whole-target coverage to #41.

## `AZS_GetPartyMeter()`

```lua
local heroes, totalDamage, partyDps = AZS_GetPartyMeter();
```

No arguments. **Three return values:** a dense, 1-based array of hero records,
the sum of their `dmg` values, and the sum of their `dps` values. Outside a party,
or before any party snapshot arrives, the result is `{}`, `0`, `0`.

| Record field | Normal Lua type | Meaning and native precision |
| --- | --- | --- |
| `name` | string | Hero's name. |
| `class` | string | Lowercase class key: `warrior`, `paladin`, `hunter`, `rogue`, `priest`, `shaman`, `mage`, `warlock`, `druid`. |
| `dmg` | number | Hero's cumulative damage, rounded to a whole number before transmission. |
| `dps` | number | Hero's raw cumulative damage / `max(run seconds, 1)`; transmitted with 1 decimal place. |
| `share` | number | Raw hero damage / `max(raw party damage, 1)`; a **fraction**, transmitted with 4 decimal places. Multiply by 100 for a percentage. |
| `top` | string | Display name of that hero's highest-damage spell; empty string if there is no spell row. It is not a spell ID or ability key. |
| `topdps` | number | That spell's damage / `max(run seconds, 1)`; transmitted with 1 decimal place, `0` if there is no spell row. |

Rows are ordered by descending raw damage. The small-party insertion sort leaves
equal-damage rows in their input order; the input order is not documented as a
stable hero identity. The API does not expose a GUID, unit token, local-player
flag, per-hero spell breakdown, healing, gear or revive state in these rows.
`name` is display data and array indices are ranks, so neither provides an
identity guarantee for joining unrelated data.

The Lua totals sum the already serialized rows. Consequently `totalDamage` is
the sum of individually rounded amounts and `partyDps` the sum of individually
rounded rates. Recomputing DPS as `totalDamage / time` can give a slightly
different value. A zero-damage hero has `share = 0`; a no-damage party gives
zero totals. These are run averages, not rolling-window DPS.

Illustrative record shape, **not a captured live party**:

```lua
{ name = "Ada", class = "mage", dmg = 1235, dps = 12.3,
  share = 0.6000, top = "Frost Nova", topdps = 7.1 }
```

## `AZS_GetRevive()`

```lua
local revive = AZS_GetRevive();
```

No arguments. Returns **one table describing the local hero's revive context**,
not a list of every party member's state.

| Field | Normal Lua type | Meaning |
| --- | --- | --- |
| `down` | number | `1` while the local hero is down, otherwise `0` in an active party snapshot. |
| `share` | number or nil | Local hero's revival progress, 0–1, while down. Native code clamps elapsed revive time / **6 seconds** to 0–1; transmitted with 2 decimals. |
| `by` | string or nil | Name of the friend bringing the local hero back, while down; `""` when nobody is doing so. If several matching helpers exist, the producer takes the first matching name. |
| `reviving` | string or nil | Name of the downed friend the local hero is currently standing over to revive. |
| `rshare` | number or nil | That friend's revival progress, 0–1, transmitted with 2 decimals. |

The native serializer starts an alive-party snapshot with `down=0` and adds the
last two fields only when a matching revive interaction exists. It selects the
interaction with the greatest recorded progress if several match the local
hero. `rshare` is emitted from that interaction's progress field; the serializer
does not apply the local `elapsed / 6` calculation a second time.

These are the recovered payload shapes:

```lua
{}                                             -- solo / not yet received
{ down = 0 }                                   -- alive, no revive interaction
{ down = 1, share = 0.00, by = "" }             -- down, no helper
{ down = 1, share = 0.50, by = "Ada" }          -- being revived
{ down = 0, reviving = "Bo", rshare = 0.25 }    -- reviving a friend
```

**Use `revive.down == 1`, not `if revive.down then`: numeric zero is truthy in
Lua.** Absent optional fields are `nil`; they are not automatically filled with
zero or empty strings. `by` and `reviving` contain names, not IDs, indices or
`partyN` tokens. No remaining-time, distance, revive count, helper list or
party-wide downed roster is returned. Progress × 100 gives a bar percentage;
`6 * (1 - progress)` is only an estimate of seconds left while progress continues.

## Updates, storage and addon use

The embedded `AZSApiFrame` handles **`CHAT_MSG_ADDON`**, reading the prefix from
`arg1` and payload from `arg2`:

| Prefix | Replacement cache | Timestamp global |
| --- | --- | --- |
| `AZSPARTY` | `AZS_PARTY` | `AZS_PARTY_UPDATED` |
| `AZSREVIVE` | `AZS_REVIVE` | `AZS_REVIVE_UPDATED` |

The `_UPDATED` globals are `GetTime()` timestamps, **not event names**. They
start as `nil` and change on receipt of their corresponding payload. The
inspected script does not dispatch a separate custom event for either API.
The native sender checks an eligible polling path at a 0.2-second threshold and
suppresses payloads equal to its cached strings. Thus timestamps do not advance
on every poll, and this is not a guarantee of updates every 0.2 seconds.

Each received payload creates a **new table** and replaces its cache. Each
getter returns the current cache itself, not a copy. Re-fetch it when refreshing
the display; storing the first returned table forever leaves a stale snapshot.
Avoid mutating these shared API tables. An empty received payload clears that
cache to `{}`. The getters do not request network data or perform an update.

Both parsers use `tonumber(value) or value`, so numeric fields are numbers after
parsing and numeric-looking text is also converted. Native name sanitization
replaces tab, comma, semicolon and equals with spaces before transmission.
Raw party records are separated by `;`, and their seven fields by `,` in the
table's listed order. Revive uses `key=value` fields separated by `;`.

A 1.12-style addon can poll the getters in an existing throttled `OnUpdate`
handler. That avoids depending on whether its own `CHAT_MSG_ADDON` handler runs
before or after `AZSApiFrame`. For example, the refresh body can be:

```lua
if ( AZS_GetPartyMeter ) then
    local heroes, damage, dps = AZS_GetPartyMeter();
    for i = 1, table.getn(heroes) do
        local h = heroes[i];
        -- h.name, h.class, h.dps, h.share * 100, h.top, h.topdps
    end
end

if ( AZS_GetRevive ) then
    local r = AZS_GetRevive();
    if ( r.down == 1 ) then
        local progress = r.share or 0;
        local helper = r.by or "";
        -- Show the local downed/revive display.
    elseif ( r.reviving and r.reviving ~= "" ) then
        local progress = r.rshare or 0;
        -- Show progress for r.reviving.
    end
end
```

These support a party damage table with class colors, damage shares and top
spell labels, plus local downed and outgoing-revive progress bars. Broader
co-op implementation is not required to write a consuming addon for the
original game; the reconstruction still needs real producers before exposing
equivalent nonempty data.

## Evidence and reproducibility

The [manifest](evidence/0.113.0/party-api/manifest.json) binds the exact
[embedded Lua](evidence/0.113.0/party-api/embedded-api.lua), original native
function ranges, constants, class keys and REA Evidence IDs to the target hash.
The Lua is an exact 15,516-byte EXE range at file offset `0x700bfa0`; it ends at
the API frame registration, before the adjacent `HUD_CVARS_LUA` literal.

Native packet builder `0x1458c2f80` binds the party producer `0x1458d5c80` to
`AZSPARTY` and revive producer `0x1458d66d0` to `AZSREVIVE`.
`0x1459af260` supplies party row values/precision;
`0x14598d280` selects names of helpers reviving the local hero;
`0x1459c84b0` supplies the small-party stable descending sort; and
`0x1459b04e0` sanitizes names. Original PE instructions and constants corroborate
the raw-slice Ghidra output, whose external types and ABI guesses are incomplete.

```sh
python3 -B scripts/check-party-addon-api.py --lua
python3 -B scripts/check-party-addon-api.py --prepare-rea
```

The first command verifies current EXE byte ranges and interprets the actual
extracted Lua with explicit local frame/time/legacy-table seams. The
[case results](evidence/0.113.0/party-api/lua-contract-results.json) record passed
return-count, parser, empty/default, optional-field, timestamp, replacement and
zero-truthiness checks. It uses synthetic wire payloads, not a live game.
The second stages a project-local static plan for `scripts/rea-batch.py`; it
does not start REA or execute the target itself. Both REA batches used here
completed and closed normally. Network synchronization, actual party DPS
sampling and live visual behavior remain untested.

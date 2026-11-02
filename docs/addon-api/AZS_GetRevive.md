# AZS_GetRevive — custom revive UI for SurvivorsDragonUI

Recovered from Azeroth Survivors **0.113.0**. This reference describes the API
available to an addon running in the original game. It does not require co-op
to be implemented in AzerothSurvivorsRE.

Use it to display your downed state, who is reviving you, or progress while you
revive a friend. It describes **the local hero's context**, not every party member.

## Call

```lua
local revive = AZS_GetRevive();
```

Takes no arguments and returns one table. On older game versions, the function
may not exist, so check availability before calling it.

## Return fields

| Field | Normal Lua type | Meaning |
| --- | --- | --- |
| `down` | number or nil | `1` if you are down; `0` in an alive-party snapshot. Absent in an empty snapshot. |
| `share` | number or nil | Progress toward reviving **you**, from `0` to `1`, while you are down. |
| `by` | string or nil | Name of the friend reviving **you**. An empty string means no helper is reported while you are down. |
| `reviving` | string or nil | Name of the downed friend **you are reviving**. Present during an outgoing revive interaction. |
| `rshare` | number or nil | Progress toward reviving that friend, from `0` to `1`. |

Progress is transmitted with **two decimal places**. Multiply it by `100` for
a percentage. Set a status bar's range to `0, 1` to use the value directly.

The local downed progress is clamped elapsed revive time divided by **6 seconds**.
`rshare` comes from the selected outgoing interaction's progress field; do not
divide either API value by six again. `6 * (1 - progress)` is only an estimated
remaining time while progress continues, not an API-provided countdown.

Names are display values, not GUIDs or `partyN` unit tokens. The embedded parser
uses `tonumber(value) or value` for every value, so numeric-looking names can
become numbers. Use `tostring` when formatting a name for display.

## Exact state shapes

The names below are illustrative, not a captured live party.

```lua
{}                                          -- solo / no snapshot yet
{ down = 0 }                                -- alive, no revive interaction
{ down = 1, share = 0.00, by = "" }          -- down, no helper reported
{ down = 1, share = 0.50, by = "Ada" }       -- someone is reviving you
{ down = 0, reviving = "Bo", rshare = 0.25 } -- you are reviving a friend
```

Absent fields are `nil`. Do not expect every snapshot to contain all five fields.

**Check `revive.down == 1`. Numeric `0` is true in Lua**, so
`if revive.down then` incorrectly treats an alive-party snapshot as downed.

## Suggested UI mapping

These labels and visibility choices are addon design suggestions, not text
returned by the API.

| Condition | Custom UI |
| --- | --- |
| Function unavailable, or empty/idle snapshot | Hide the revive panel. |
| `down == 1`, with a helper name | Show “Being revived by NAME” and `share`. |
| `down == 1`, with no helper name | Show “Downed — waiting for help”; display the reported `share` if desired. |
| `down == 0`, with `reviving` present | Show “Reviving NAME” and `rshare`. |

If multiple helpers match the downed local hero, the native producer reports the
first matching helper name. If multiple outgoing interactions match the local
hero, it selects the one with the greatest recorded progress. Neither field
is a complete list of helpers or downed friends.

## Lua adapter example

This example converts the API snapshot into values for your own renderer.
`ReadRevivePanelState` is an example helper, **not another game API**. It does not
create widgets or change the native UI. The syntax fits a legacy 1.12-style addon.

```lua
local function ClampReviveProgress(value)
    local progress = tonumber(value) or 0;
    if ( progress < 0 ) then progress = 0; end
    if ( progress > 1 ) then progress = 1; end
    return progress;
end

local function ReadRevivePanelState()
    if ( type(AZS_GetRevive) ~= "function" ) then
        return nil;
    end

    -- Fetch on every refresh: incoming snapshots replace the cached table.
    local r = AZS_GetRevive();
    if ( type(r) ~= "table" ) then
        return nil;
    end

    if ( r.down == 1 ) then
        return "down", ClampReviveProgress(r.share), tostring(r.by or "");
    end

    if ( r.down == 0 and r.reviving ~= nil and r.reviving ~= "" ) then
        return "reviving", ClampReviveProgress(r.rshare), tostring(r.reviving);
    end

    return nil;
end

local mode, progress, person = ReadRevivePanelState();
-- mode == nil: hide your panel.
-- mode == "down": progress is your revival; person is your helper or "".
-- mode == "reviving": progress is the friend's revival; person is their name.
-- For a StatusBar: SetMinMaxValues(0, 1), then SetValue(progress).
```

Call this helper from the addon's existing throttled UI refresh. A refresh every
0.1–0.2 seconds is a reasonable presentation choice, not an API timing guarantee.
Always hide/reset the custom widgets when the helper returns `nil`, and replace
the previous label/progress when the mode changes.

## Updates and cache ownership

- The game API frame receives `CHAT_MSG_ADDON` with prefix **`AZSREVIVE`**.
- It parses the payload into a new table, assigns `AZS_REVIVE`, then sets
  **`AZS_REVIVE_UPDATED = GetTime()`**.
- `AZS_REVIVE_UPDATED` is a timestamp global, **not an event name**. It starts as
  `nil`; no separate custom revive event is dispatched by the inspected script.
- `AZS_GetRevive()` returns the current cache itself. Fetch it again on refresh;
  a stored old table does not receive later changes. Do not modify the shared table.
- An empty received payload replaces the cache with `{}`.
- The native sender checks an eligible path at a 0.2-second threshold and sends
  changed payloads. The timestamp can stay unchanged while the state stays equal.
  An old timestamp alone does not establish a disconnect or an expired revive.
- Calling the getter reads the cache; it does not request or send network data.

Polling during an existing throttled `OnUpdate` avoids relying on whether an
addon's own `CHAT_MSG_ADDON` handler runs before or after the game's API frame.

## Limits relevant to a custom UI

The call does not provide party-wide downed state, remote health, GUIDs, distance,
revive counts, a helper list, or an authoritative remaining-time field.

It is a read API. It does not initiate a revive, choose a target or suppress the
native revive widgets. A supported native revive-UI hide/takeover control has
not been recovered; do not assume a `revive` HUD visibility option exists.

## Evidence and validation

The owning [party/revive API recovery report](../analysis/addon-party-api-0.113.0.md)
contains the broader meter API and native producer details. Its
[manifest](../analysis/evidence/0.113.0/party-api/manifest.json) and
[exact embedded Lua](../analysis/evidence/0.113.0/party-api/embedded-api.lua)
bind these findings to EXE SHA-256:

```text
c3a82f594e05dc8cea49dfa38e69aca96c9ee625a5b7df3ffa93c19dc8c95773
```

The recovered Lua passed interpreted tests for defaults, parsing, optional fields,
numeric-zero truthiness, timestamps and cache replacement. Those tests use
synthetic payloads and explicit frame/time seams. The adapter above is an
illustrative integration example; no live addon/co-op/rendering validation or
application build was performed. Later EXE versions require contract revalidation.

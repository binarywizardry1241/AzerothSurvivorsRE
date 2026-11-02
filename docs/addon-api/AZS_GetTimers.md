# AZS_GetTimers() — recovered 0.115.0 API

Recovered from the installed EXE, SHA-256 `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`. REA/Ghidra static analysis; the game and addon were not executed.

The reconstruction now connects this API through the live local addon bridge.
[Source, current native inputs and validation limits](../analysis/addon-timers-0.115.0.md)
are separate from the addon-consumer integration below.

## Calls

```lua
local timers = AZS_GetTimers();        -- all received eligible equipped-effect timers
local matches = AZS_GetTimers("Butcher"); -- exact name match; still returns a list
local phase = AZS_GetPhase();          -- current native run phase
local now = AZS_GetRunTime();          -- pause-aware run seconds, or nil
```

Feature-detect `AZS_GetTimers` on older clients. With no filter, the getter returns an array of new tables in native equipped-effect order. A truthy filter uses exact Lua equality with `t.name`: case-sensitive, with no substring, key, spell-ID or kind matching. No match returns `{}`. More than one effect can share a name; do not assume a single result. Use the literal name supplied by the getter, including any language-specific spelling.

## Returned row

| Field | Lua type | Meaning |
| --- | --- | --- |
| `name` | string | Native source display name from talent/jewelry effect metadata, sanitized for the wire. No stable key or ID is included. |
| `icon` | string | Native icon string. The getter passes it through without icon lookup or fallback. |
| `kind` | string | `summon` or `cooldown`. |
| `duration` | number | Current full wait, in seconds, supplied by the native timer producer. |
| `remaining` | number | `max(raw.ready - (AZS_GetRunTime() or 0), 0)`. Fractional seconds are retained; there is no upper clamp to `duration`. |
| `ready` | boolean | `remaining == 0`. This boolean differs from the raw cache field of the same name, which is a deadline number. |

No target, summon ID, talent key, spell ID, rank, item slot, charge count, proc chance, stacks, trigger condition or health/damage data is returned. This call reads state: it neither requests packets nor casts, summons, resets a cooldown or changes the HUD.

## Two timer kinds

- `summon`: Legion Gate waves and Pact of the Annihilan / Butcher recurring demon summons. These count to the next summon, not the expiry of a living demon.
- `cooldown`: waits between supported procs, heals, cooldown resets and second-life effects. Applicable equipped jewelry effects enter through the same effect/metadata projection.

The current selector handles native tags 0, 10, 16, 17, 19, 32 and 34, omitting nonpositive ordinary proc waits and effects with missing metadata. It does not expose every ability cooldown, every buff duration or every talent. `ready` means the timer has elapsed; actual execution still depends on native triggers, caps and conditions.

## Eligible current talent definitions

These are catalog capabilities, not a live character snapshot. Only acquired/equipped effects enter the native source vector; all rows below are not returned on every character. Values are base-definition waits rather than a promise of the final reported duration.

| Class | Talent | Kind | Base wait |
| --- | --- | --- | --- |
| Warrior | Mortal Wounds | `cooldown` | 1s |
| Warrior | Last Stand | `cooldown` | 90s |
| Paladin | Daybreak | `cooldown` | 3s |
| Paladin | Hallowed Ground | `cooldown` | 4s |
| Paladin | Divine Intervention | `cooldown` | 90s |
| Paladin | The Art of War | `cooldown` | 1s |
| Hunter | Kill Shot | `cooldown` | 2s |
| Hunter | Counterattack | `cooldown` | 1s |
| Rogue | Riposte | `cooldown` | 1s |
| Rogue | Cheat Death | `cooldown` | 150s |
| Priest | Rapture | `cooldown` | 15s |
| Priest | Inspiration | `cooldown` | 1s |
| Priest | Shadowy Apparitions | `cooldown` | 0.5s |
| Shaman | Reincarnation | `cooldown` | 120s |
| Warlock | Nightfall | `cooldown` | 0.5s |
| Warlock | Legion Gate | `summon` | 4s; native special rule can use 12s |
| Warlock | Pact of the Annihilan | `summon` | 30s before CDR; 13s floor |
| Warlock | Butcher | `summon` | 30s before CDR; 13s floor |
| Druid | Nature's Grasp | `cooldown` | 2s |
| Druid | Enrage | `cooldown` | 2s |
| Druid | Swiftmend | `cooldown` | 8s |

For Pact/Butcher the native timer is based on `last summon timestamp + max(base interval * current cooldown multiplier, minimum interval)` while active. Before its activity flag is set, its deadline is current native run time, making it immediately ready. Both current talent definitions have a 30s base interval and 13s minimum. Legion Gate uses its own stored deadline and duration calculation; consume the API values rather than deriving it from pet arrivals.

## Clock and updates

`AZS_GetRunTime()` adds `GetTime() - AZS_RUN_UPDATED` to received `AZS_RUN.t` only while `AZS_RUN.ph == "playing"`. During choosing, paused, ready, dead and victory it holds the received run time. If no run time exists, it returns nil and `AZS_GetTimers()` uses zero. The timer getter itself does not suppress results for an inactive phase or clear an old cache.

The main native path checks publication at a 0.2s threshold, subject to its existing delivery gates. Each payload is compared to its previous string and sent only when changed. Deadlines and waits use one decimal place on the timer wire; the getter then recomputes fractional remaining time from the run clock. This is not a guaranteed 5Hz packet stream.

The embedded API frame receives `CHAT_MSG_ADDON` prefix **`AZSTIMERS`** and replaces the entire `AZS_TIMERS` cache using fields `name, icon, kind, ready, wait`. Rows are semicolon-separated; fields are comma-separated. `tonumber(v) or v` converts numeric fields. The handler then sets **`AZS_TIMERS_UPDATED = GetTime()`**. This is a timestamp global, not an event dispatched by the game. An empty payload produces an empty list.

Read via the getter on your existing throttled refresh. If handling `CHAT_MSG_ADDON` yourself, defer the read until your next update because the native API handler may run after yours. An unchanged timestamp does not establish expiry: time left continues to change locally. On zone/world transitions, clear your own display and wait for a new accepted snapshot/phase; the getter has no world-reset guard.

## Example consumer

```lua
if ( type(AZS_GetTimers) == "function" ) then
    local timers = AZS_GetTimers();
    for i = 1, table.getn(timers) do
        local t = timers[i];
        -- Use t.icon, t.name and t.kind for the presentation.
        -- Display math.ceil(t.remaining) for whole seconds.
        -- t.ready is a real boolean; it is safe to test directly.
    end
end
```

For the lifetime/identity of already active demons, use `AZS_GetSummons("felguard")` or `AZS_GetSummons("pitlord")`. `AZS_GetSummonCount()` and `AZS_GetSummonGroups()` serve active-summon counts/grouping. These complement the next-summon timer. For ordinary learned ability cooldowns, the separate received `AZS_SPELLS` rows expose `key, spell, rank, cd, cdmax`; they are not part of this getter.

## Evidence

- Exact relevant embedded Lua is reproduced below; its whole-bootstrap byte range and SHA-256 are retained in the manifest. The owning target refresh retains the complete bootstrap separately.
- Native snapshot wrapper: `0x1458f6040..0x1458f612f`.
- Native timer selector: `0x1459721c0..0x145972592`; switch table `0x14733303c` (35 entries).
- Native timer formatting: `0x1458e4220..0x1458e454a`; wire descriptor `0x14732edf8`.
- Main native publication: snapshot call `0x14587db98`, changed-payload comparison `0x14587dc9d..0x14587dcc3`, 0.2s gate `0x14587d6d9..0x14587d718`.
- Fresh REA/Ghidra Evidence: timer selector **`ev_da269800848ee2a5e0d0ffa2eae7294b4dad7a7b1823c7b71dd2575c0358a68b`**, formatter **`ev_fa6c8d28de1bb7458ed5b3076cec32a9760e6ff829c343f06cec042cb957a18d`**.
- [Manifest](../analysis/evidence/0.115.0/addon-timers/manifest.json) binds code/data ranges and raw analysis subjects to the current EXE; [current talent timer definitions](../analysis/evidence/0.115.0/addon-timers/talent-timer-definitions.json) retains all 21 eligible effects from 355 definitions.

Raw Ghidra imports infer approximate types/ABI; original Win64 assembly and separately verified original table/constants govern the contract. The selector import includes the separately enumerated original switch table, constants and kind strings in a sparse carrier. Current source recovery separately traces name localization/construction, all eligible timer-bearing talent/shared/generated-amulet metadata and cache/input contracts in the [owning report](../analysis/addon-timers-0.115.0.md). Packet loss/reconnect and live in-game presentation remain unverified.

## Exact embedded read functions

```lua
function AZS_GetRunTime()
	local t = AZS_RUN.t;
	if ( not t ) then
		return nil;
	end
	if ( AZS_RUN.ph == "playing" and AZS_RUN_UPDATED ) then
		t = t + (GetTime() - AZS_RUN_UPDATED);
	end
	return t;
end

function AZS_GetPhase()
	return AZS_RUN.ph;
end

function AZS_GetTimers(name)
	local out = {};
	local now = AZS_GetRunTime() or 0;
	for i = 1, table.getn(AZS_TIMERS) do
		local t = AZS_TIMERS[i];
		if ( not name or t.name == name ) then
			local remaining = t.ready - now;
			if ( remaining < 0 ) then
				remaining = 0;
			end
			table.insert(out, { name = t.name, icon = t.icon, kind = t.kind, duration = t.wait,
				remaining = remaining, ready = remaining == 0 });
		end
	end
	return out;
end
```

The relevant `CHAT_MSG_ADDON` handler branch is:

```lua
elseif ( arg1 == "AZSTIMERS" ) then
    AZS_TIMERS = AZS_List(arg2, { "name", "icon", "kind", "ready", "wait" });
    AZS_TIMERS_UPDATED = GetTime();
```

## Local Buffs consumer

The local SurvivorsDragonUi integration uses `modules/unit/auras.lua` to append
all received timer rows after the native aura/enchant buttons in the existing
Buffs group. Icons share six-column wrapping, flip direction, measured bounds,
move/scale/hide, Confirm/Cancel and profile geometry. Native aura content and
handlers are preserved. Ready timers remain visible with zero; hover shows the
source name, timer kind, full wait and remaining/ready state. Five captions are
represented in all fourteen source/runtime catalogs. Native effect order and
separate rows with the same name are retained.

The consumer reads phase first, requires received timer and run snapshots,
defers packet-triggered getter calls until the next update, and samples native
remaining time rather than maintaining a private cooldown deadline. Zone/world/
logout/reload cleanup retires old timer/run cache identities and hides owned
tooltips. Static, paused and hidden views stop their timer updater until relevant
delivery or visibility wakes it. Missing/invalid API state hides only the added
timer icons. No setting, SavedVariable, asset, command or gameplay persistence
is added.

The addon changes are installed locally only. The addon runtime manifest already
includes the modified module and localization data. No addon check, formatter,
test, syntax check or game/addon execution was performed, and this local addon
version has not run GitHub Actions. Addon-side installation does not establish reconstruction or runtime/parity proof;
the reconstructed source route is covered by the separate report above.

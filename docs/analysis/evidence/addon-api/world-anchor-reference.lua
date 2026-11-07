

-- Azeroth Survivors: the run for addons, off the server's addon lines. See the README's
-- "For addon authors" for every field.
AZS_ZONE = {};
AZS_RUN = {};
AZS_SCHEDULE = {};
AZS_UNITS = {};
AZS_DEBUFFS = {};
AZS_TARGET = { kind = "none" };
AZS_SPELLS = {};
AZS_TIMERS = {};
AZS_BUFFS = {};
AZS_PETS = {};
AZS_TOTEMS = {};
AZS_METER = {};
AZS_HEALING = {};
AZS_BOSSMETER = {};
AZS_PARTY = {};
AZS_REVIVE = {};
AZS_DOWNED = {};
AZS_CHESTS = {};
AZS_LAIRS = {};
AZS_TAKEN = {};
AZS_END = {};
AZS_BANNERS = {};
AZS_BANNER_HANDLERS = {};

-- The run's own key binding (Bindings.xml, `bindings.rs`).
BINDING_HEADER_AZS = "Azeroth Survivors";
BINDING_NAME_AZS_OPENLEVELS = "Open Level-Ups";

function AZS_Fields(msg)
	local t = {};
	local pos = 1;
	while ( true ) do
		local s, e, k, v = string.find(msg, "(%w+)=([^;]*)", pos);
		if ( not s ) then
			break;
		end
		t[k] = tonumber(v) or v;
		pos = e + 1;
	end
	return t;
end

-- A list line: entries split by ";", fields by ",", named by `names`.
function AZS_List(msg, names)
	local list = {};
	local pos = 1;
	local len = string.len(msg);
	while ( pos <= len ) do
		local s, e = string.find(msg, ";", pos, 1);
		local entry = string.sub(msg, pos, (s or len + 1) - 1);
		local row = {};
		local i = 1;
		local fpos = 1;
		while ( names[i] ) do
			local fs = string.find(entry, ",", fpos, 1);
			local v = string.sub(entry, fpos, (fs or string.len(entry) + 1) - 1);
			row[names[i]] = tonumber(v) or v;
			if ( not fs ) then
				break;
			end
			fpos = fs + 1;
			i = i + 1;
		end
		table.insert(list, row);
		if ( not s ) then
			break;
		end
		pos = e + 1;
	end
	return list;
end

-- The run's clock in seconds, carried on between the server's lines while it runs.
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

-- ready, playing, choosing, paused, dead or victory; nil out of a run.
function AZS_GetPhase()
	return AZS_RUN.ph;
end

-- When the final boss comes, in run seconds.
function AZS_GetRunLength()
	return AZS_ZONE.len;
end

-- The debuffs on a boss or guardian by its id: { spell, name, icon, stacks, duration,
-- remaining, permanent, dispelType } each; timings nil when unknown, `remaining` off the run's
-- clock.
function AZS_GetDebuffs(id)
	local out = {};
	local now = AZS_GetRunTime() or 0;
	for i = 1, table.getn(AZS_DEBUFFS) do
		local d = AZS_DEBUFFS[i];
		if ( d.id == id ) then
			local duration, remaining, permanent, dispel;
			if ( d.ends >= 0 ) then
				duration = d.duration;
				remaining = d.ends - now;
				if ( remaining < 0 ) then
					remaining = 0;
				end
			end
			if ( d.permanent == 1 ) then
				permanent = true;
			end
			if ( d.dispel ~= "" ) then
				dispel = d.dispel;
			end
			table.insert(out, { spell = d.spell, name = d.name, icon = d.icon, stacks = d.stacks,
				duration = duration, remaining = remaining, permanent = permanent, dispelType = dispel });
		end
	end
	return out;
end

-- Your summons out, every class's (a beast, Treants, Spirit Wolves, a Water Elemental, demons),
-- in the order they came: { id, entry, key, kind, name, icon, permanent, duration, remaining }
-- each. `key` its English name in lower case ("imp", "spirit_wolf"); `kind` "pet" or the
-- demon's ("felguard", "pitlord"...); a temporary one's `duration` and `remaining` (off the
-- run's clock), nil for one that stays (`permanent`). With `which` (a key or a kind), only those.
function AZS_GetSummons(which)
	local out = {};
	local now = AZS_GetRunTime() or 0;
	for i = 1, table.getn(AZS_PETS) do
		local p = AZS_PETS[i];
		if ( not which or p.key == which or p.kind == which ) then
			local duration, remaining, permanent;
			if ( p.ends >= 0 ) then
				duration = p.dur;
				remaining = p.ends - now;
				if ( remaining < 0 ) then
					remaining = 0;
				end
			else
				permanent = true;
			end
			local icon;
			if ( p.icon ~= "" ) then
				icon = p.icon;
			end
			table.insert(out, { id = p.id, entry = p.entry, key = p.key, kind = p.kind, name = p.name,
				icon = icon, permanent = permanent, duration = duration, remaining = remaining });
		end
	end
	return out;
end

-- How many summons are out, with `which` (a key or a kind) only those.
function AZS_GetSummonCount(which)
	return table.getn(AZS_GetSummons(which));
end

-- The hero's totems standing, a table a kind (with `which`, a totem's key, that kind's alone):
-- { key, spell, name, icon, count, cap, duration, remaining }, `remaining` the seconds until the
-- soonest of the kind goes.
function AZS_GetTotems(which)
	local out = {};
	local now = AZS_GetRunTime() or 0;
	for i = 1, table.getn(AZS_TOTEMS) do
		local t = AZS_TOTEMS[i];
		if ( not which or t.key == which ) then
			local remaining = t.ends - now;
			if ( remaining < 0 ) then
				remaining = 0;
			end
			table.insert(out, { key = t.key, spell = t.spell, name = t.name, icon = t.icon,
				count = t.count, cap = t.cap, duration = t.dur, remaining = remaining });
		end
	end
	return out;
end

-- How many totems stand, with `which` (a totem's key) only that kind's.
function AZS_GetTotemCount(which)
	local n = 0;
	local all = AZS_GetTotems(which);
	for i = 1, table.getn(all) do
		n = n + all[i].count;
	end
	return n;
end

-- Your summons by kind of creature, in the order the first of each came: { key, kind, name,
-- icon, count, permanent, temporary, remaining } each, `permanent` and `temporary` how many of
-- the count stay for good or go, `remaining` the time left of the one that goes first (nil if
-- none goes); and the count of all.
function AZS_GetSummonGroups()
	local groups = {};
	local all = AZS_GetSummons();
	for i = 1, table.getn(all) do
		local p = all[i];
		local g;
		for j = 1, table.getn(groups) do
			if ( groups[j].key == p.key ) then
				g = groups[j];
			end
		end
		if ( not g ) then
			g = { key = p.key, kind = p.kind, name = p.name, icon = p.icon, count = 0, permanent = 0, temporary = 0 };
			table.insert(groups, g);
		end
		g.count = g.count + 1;
		if ( p.permanent ) then
			g.permanent = g.permanent + 1;
		else
			g.temporary = g.temporary + 1;
			if ( not g.remaining or p.remaining < g.remaining ) then
				g.remaining = p.remaining;
			end
		end
	end
	return groups, table.getn(all);
end

-- The bosses alive now: { id, name, hp, hpm, final, enraged, debuffs } each, several at once too.
function AZS_GetBosses()
	local out = {};
	for i = 1, table.getn(AZS_UNITS) do
		local u = AZS_UNITS[i];
		if ( u.kind == "boss" or u.kind == "final" ) then
			table.insert(out, { id = u.id, name = u.name, hp = u.hp, hpm = u.hpm,
				final = (u.kind == "final"), enraged = (u.state == 1), debuffs = AZS_GetDebuffs(u.id),
				anchorId = AZS_WAUnitAnchor(u.id) });
		end
	end
	return out;
end

-- The guardians alive now: { id, name, hp, hpm, awake, debuffs } each.
function AZS_GetGuardians()
	local out = {};
	for i = 1, table.getn(AZS_UNITS) do
		local u = AZS_UNITS[i];
		if ( u.kind == "guardian" ) then
			table.insert(out, { id = u.id, name = u.name, hp = u.hp, hpm = u.hpm, awake = (u.state == 1),
				debuffs = AZS_GetDebuffs(u.id), anchorId = AZS_WAUnitAnchor(u.id) });
		end
	end
	return out;
end

-- The bosses still to come: { index, name, at, left, final } each, `left` seconds from now.
function AZS_GetUpcomingBosses()
	local out = {};
	local now = AZS_GetRunTime() or 0;
	for i = 1, table.getn(AZS_SCHEDULE) do
		local b = AZS_SCHEDULE[i];
		if ( b.state == "due" ) then
			table.insert(out, { index = b.index, name = b.name, at = b.at, left = b.at - now, final = (b.final == 1) });
		end
	end
	return out;
end

-- The damage meter: its lines, the most first ({ name, dmg, dps, share, proc }), and the
-- run's total and damage per second.
function AZS_GetMeter()
	local total = 0;
	for i = 1, table.getn(AZS_METER) do
		total = total + AZS_METER[i].dmg;
	end
	local t = AZS_GetRunTime() or 0;
	if ( t < 1 ) then
		t = 1;
	end
	return AZS_METER, total, total / t;
end

-- A meter's lines, its total and its total per second (the sum of the lines' own).
function AZS_MeterTotals(lines)
	local total, rate = 0, 0;
	for i = 1, table.getn(lines) do
		total = total + lines[i].dmg;
		rate = rate + lines[i].dps;
	end
	return lines, total, rate;
end

-- The healing meter: its lines, the most first ({ name, dmg, dps, share, proc }, `dmg` the
-- health it gave, overhealing left out, `dps` that per second), the run's total and per second.
function AZS_GetHealing()
	return AZS_MeterTotals(AZS_HEALING);
end

-- The last boss fight's meter: the damage dealt to bosses, as AZS_GetMeter, per second over
-- that fight; empty before the first one.
function AZS_GetBossMeter()
	return AZS_MeterTotals(AZS_BOSSMETER);
end

-- A party's revives: { down, share, by, reviving, rshare }. `down` 1 while the hero is down,
-- `share` how far (0 to 1) it is brought back and `by` the friend bringing it; `reviving` the
-- friend down the hero stands over and `rshare` how far that one is. Empty out of a party.
-- The talents' (and jewelry's) own clocks, the ones the build shows counting down and every
-- wait a talent keeps: { name, icon, kind, duration, remaining, ready } each. `kind` "summon" (Pact
-- of the Nathrezim's or Butcher's next demon, Legion Gate's next wave) or "cooldown" (a proc's,
-- a heal's or a second life's wait between two goes); `duration` the whole wait, `remaining` off
-- the run's clock, 0 and `ready` true when it may go now. With `name`, only that talent's.
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

function AZS_GetRevive()
	return AZS_REVIVE;
end

-- A party's damage meter: a line a hero, the most damage first ({ name, class, dmg, dps, share,
-- top, topdps }: `class` the class's key, `top` the hero's spell that dealt the most, `topdps`
-- its damage per second), the party's total and per second. Empty out of a party.
function AZS_GetPartyMeter()
	return AZS_MeterTotals(AZS_PARTY);
end

-- The guardians' lairs, each with `active` true while a guardian holds it.
function AZS_GetLairs()
	for i = 1, table.getn(AZS_LAIRS) do
		AZS_LAIRS[i].active = (AZS_LAIRS[i].state ~= "empty");
	end
	return AZS_LAIRS;
end

-- The coordinate space of map `map` in run `run` (nil: no run): AZS_GetPlayerPosition's
-- spaceId, and every AZS_CHESTS and AZS_LAIRS entry's.
function AZS_SpaceOf(map, run)
	return "m" .. tostring(map) .. ":" .. (run or "none");
end

-- Each destination of `list` tagged with the run, map and coordinate space it is in.
function AZS_TagSpace(list)
	local run = AZS_ZONE.run;
	if ( type(run) ~= "string" or run == "" ) then
		run = nil;
	end
	local map = AZS_ZONE.map;
	for i = 1, table.getn(list) do
		list[i].runId = run or "none";
		list[i].mapId = map;
		list[i].spaceId = AZS_SpaceOf(map, run);
	end
	return list;
end

-- The lair the minimap's flag points at (the nearest held, else the one that fills soonest),
-- shown or not; nil before the first.
function AZS_GetFlaggedLair()
	local lairs = AZS_GetLairs();
	for i = 1, table.getn(lairs) do
		if ( lairs[i].flag == 1 ) then
			return lairs[i];
		end
	end
end

-- The run's end, as the end screen shows it, once the hero fell, left or won: nil while the
-- run goes on.
function AZS_GetRunSummary()
	if ( not AZS_END.result ) then
		return nil;
	end
	return AZS_END;
end

-- The level-ups stored (Store Level-Ups), waiting to be opened; 0 with the setting off.
function AZS_GetStoredLevels()
	return AZS_RUN.sl or 0;
end

-- Open the stored level-ups, as the HUD's Level Up! button does: each is offered in turn.
function AZS_OpenStoredLevels()
	SetCVar("spendLevels", "1");
end

-- Whether level-ups are stored instead of offered as they come (Store Level-Ups).
function AZS_IsStoringLevels()
	return GetCVar("storeLevels") == "1";
end

-- Turn Store Level-Ups on or off, kept as the Controls page's setting; turned off, the levels
-- stored so far are offered at once.
function AZS_SetStoringLevels(on)
	if ( on ) then
		SetCVar("storeLevels", "1");
	else
		SetCVar("storeLevels", "0");
	end
end

-- The run's own screens: clock, bosses, tally, build, banners, loot, meter, levels, flag (the
-- minimap's flag on the nearest guardian), revive (a party's revive bar and "you are down" line),
-- and localClock (the device's time under the minimap).
AZS_HUD_CVARS = { HUD_CVARS_LUA };

-- The device's local time, as the minimap's clock shows it, shown or not, in a run or out of one:
-- a new table each call, or nil while it cannot be read.
function AZS_GetLocalTime()
	local read = AZS_NativeLocalTime;
	if ( type(read) ~= "function" ) then
		return nil;
	end
	local ok, text, hour, minute, is24Hour = pcall(read);
	if ( not ok or not text ) then
		return nil;
	end
	return { text = text, hour = hour, minute = minute, is24Hour = is24Hour };
end

-- Outgoing combat text with a world anchor per hit, the client's own feed: what it keeps and for
-- how long is `CombatTextAnchorsPlugin`'s (its constants are the numbers stated here).
function AZS_CTErr(code, message)
	return nil, { code = code, message = message };
end

-- The offsets a SetPoint on WorldFrame's bottom left takes, whatever an addon did to it.
function AZS_CTSeat()
	if ( WorldFrame ) then
		return { scale = WorldFrame:GetEffectiveScale(), left = WorldFrame:GetLeft(), bottom = WorldFrame:GetBottom() };
	end
	return nil;
end

function AZS_GetCombatTextCapabilities(...)
	if ( arg.n ~= 0 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetCombatTextCapabilities takes no arguments");
	end
	return { apiVersion = 1, impactAnchors = true, followAnchors = true, frameProjection = true,
		distanceMetrics = true, playerDistanceMetrics = true, frameHandler = true, maxEventsPerRead = 256, maxAnchorsPerRead = 256,
		eventCapacity = 4096, anchorCapacity = 4096, eventRetentionSeconds = 5, anchorRetentionSeconds = 5 }, nil;
end

function AZS_GetCombatTextEvents(...)
	if ( arg.n > 2 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetCombatTextEvents takes a cursor and a limit");
	end
	local read = AZS_NativeCombatTextEvents;
	if ( type(read) ~= "function" ) then
		return AZS_CTErr("NOT_READY", "the feed starts with the first frame");
	end
	return read(arg[1], arg[2], GetTime());
end

function AZS_ProjectCombatTextAnchors(...)
	if ( arg.n ~= 2 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_ProjectCombatTextAnchors takes anchorIds and a mode");
	end
	local project = AZS_NativeCombatTextProject;
	if ( type(project) ~= "function" ) then
		return AZS_CTErr("NOT_READY", "the feed starts with the first frame");
	end
	return project(arg[1], arg[2], GetTime(), AZS_CTSeat());
end

-- Called once a world frame after this frame's camera, before the paint: what a handler anchors
-- draws with this frame's view, where OnUpdate, which runs ahead of the camera, is a frame behind.
AZS_CT_HANDLERS = {};

function AZS_RegisterCombatTextFrameHandler(handler)
	for i = 1, table.getn(AZS_CT_HANDLERS) do
		if ( AZS_CT_HANDLERS[i] == handler ) then
			return;
		end
	end
	table.insert(AZS_CT_HANDLERS, handler);
end

function AZS_UnregisterCombatTextFrameHandler(handler)
	for i = table.getn(AZS_CT_HANDLERS), 1, -1 do
		if ( AZS_CT_HANDLERS[i] == handler ) then
			table.remove(AZS_CT_HANDLERS, i);
		end
	end
end

function AZS_CombatTextFrame()
	for i = 1, table.getn(AZS_CT_HANDLERS) do
		local ok, err = pcall(AZS_CT_HANDLERS[i]);
		if ( not ok and geterrorhandler ) then
			geterrorhandler()(err);
		end
	end
end

-- World anchors: a handle on each enemy, cache, lair and downed friend, projected through the camera
-- of the frame, the client's own catalog: what it keeps and for how long is `WorldAnchorsPlugin`'s
-- (its constants are the numbers stated here). It sees the enemies for itself and hears the rest
-- here, each time their lines change once anybody has asked.
function AZS_GetWorldAnchorCapabilities(...)
	if ( arg.n ~= 0 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetWorldAnchorCapabilities takes no arguments");
	end
	return { apiVersion = 1,
		kinds = { "enemy", "elite", "guardian", "boss", "finalBoss", "cache", "guardianLair", "downedPartyMember" },
		attachments = { "position", "overhead" }, frameProjection = true, frameHandler = true,
		playerDistanceMetrics = true, occlusion = false, worldOffsets = true,
		maxEntriesPerCall = 256, maxProjectionsPerCall = 256,
		fallenRetentionSeconds = 60, fallenCapacity = 4096, livingCapacity = 4096 }, nil;
end

-- Hand the client what only the lines say, if they changed since it last heard.
AZS_WA_ACTIVE = false;
AZS_WA_DIRTY = true;

function AZS_WASync()
	if ( not AZS_WA_ACTIVE ) then
		return;
	end
	local sync = AZS_NativeWorldAnchorSync;
	if ( type(sync) ~= "function" ) then
		AZS_WA_DIRTY = true;
		return;
	end
	local run = AZS_ZONE.run;
	if ( type(run) ~= "string" or run == "" ) then
		run = nil;
	end
	AZS_WA_STREAM = sync({ run = run, map = AZS_ZONE.map, units = AZS_UNITS, chests = AZS_CHESTS,
		lairs = AZS_LAIRS, downed = AZS_DOWNED });
	AZS_WA_DIRTY = (AZS_WA_STREAM == nil);
end

function AZS_WALine()
	AZS_WA_DIRTY = true;
	AZS_WASync();
end

-- Before any read: the catalog up to the lines, a stream that ended (a new world, a new run) given
-- them again. `stream` is what the native side answers now.
function AZS_WAEnsure()
	AZS_WA_ACTIVE = true;
	local stream = AZS_NativeWorldAnchorStream;
	if ( AZS_WA_DIRTY or type(stream) ~= "function" or stream() ~= AZS_WA_STREAM ) then
		AZS_WASync();
	end
end

-- A living unit's handle by its id, once something asked for enemies.
function AZS_WAUnitAnchor(id)
	local unit = AZS_NativeWorldAnchorUnit;
	if ( not AZS_WA_ACTIVE or type(unit) ~= "function" ) then
		return nil;
	end
	return unit(id);
end

function AZS_GetWorldAnchors(...)
	if ( arg.n > 3 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetWorldAnchors takes a query, a cursor and a limit");
	end
	local read = AZS_NativeWorldAnchorQuery;
	if ( type(read) ~= "function" ) then
		return AZS_CTErr("NOT_READY", "the catalog starts with the first frame");
	end
	AZS_WAEnsure();
	return read(arg[1], arg[2], arg[3], GetTime());
end

function AZS_ProjectWorldAnchors(...)
	if ( arg.n ~= 1 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_ProjectWorldAnchors takes the requests");
	end
	local project = AZS_NativeWorldAnchorProject;
	if ( type(project) ~= "function" ) then
		return AZS_CTErr("NOT_READY", "the catalog starts with the first frame");
	end
	AZS_WAEnsure();
	return project(arg[1], GetTime(), AZS_CTSeat());
end

-- The party's other heroes down: a new list of new tables each call, empty when none is, nil and
-- an error when the list itself cannot be told yet. Only a hero of the map and run you are on.
function AZS_GetDownedPartyMembers(...)
	if ( arg.n ~= 0 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetDownedPartyMembers takes no arguments");
	end
	local p, err = AZS_GetPlayerPosition();
	if ( not p ) then
		return nil, err;
	end
	if ( not AZS_ZONE_UPDATED or AZS_ZONE.map ~= p.mapId ) then
		return AZS_CTErr("NOT_READY", "the run's lines have not come yet");
	end
	AZS_WAEnsure();
	local out = {};
	for i = 1, table.getn(AZS_DOWNED) do
		local d = AZS_DOWNED[i];
		if ( d.state == "down" ) then
			local m = { id = d.id, name = tostring(d.name), positionAvailable = false,
				anchorStatus = d.anchorStatus or "notReady", anchorId = d.anchorId };
			if ( type(d.x) == "number" and type(d.y) == "number" and type(d.z) == "number"
				and d.spaceId == p.spaceId ) then
				m.positionAvailable = true;
				m.x, m.y, m.z = d.x, d.y, d.z;
				m.mapId, m.runId, m.spaceId = p.mapId, p.runId, p.spaceId;
			end
			table.insert(out, m);
		end
	end
	return out, nil;
end

-- Called once a world frame after this frame's camera, before the paint, as the combat text's.
AZS_WA_HANDLERS = {};

function AZS_RegisterWorldAnchorFrameHandler(handler)
	if ( type(handler) ~= "function" ) then
		return AZS_CTErr("INVALID_ARGUMENT", "the handler must be a function");
	end
	for i = 1, table.getn(AZS_WA_HANDLERS) do
		if ( AZS_WA_HANDLERS[i] == handler ) then
			return true, nil;
		end
	end
	table.insert(AZS_WA_HANDLERS, handler);
	return true, nil;
end

function AZS_UnregisterWorldAnchorFrameHandler(handler)
	for i = table.getn(AZS_WA_HANDLERS), 1, -1 do
		if ( AZS_WA_HANDLERS[i] == handler ) then
			table.remove(AZS_WA_HANDLERS, i);
		end
	end
	return true, nil;
end

function AZS_WorldAnchorFrame()
	-- Over a copy: a handler may take itself off, and the next one still runs.
	local handlers = {};
	for i = 1, table.getn(AZS_WA_HANDLERS) do
		handlers[i] = AZS_WA_HANDLERS[i];
	end
	for i = 1, table.getn(handlers) do
		local ok, err = pcall(handlers[i]);
		if ( not ok and geterrorhandler ) then
			geterrorhandler()(err);
		end
	end
end

-- Show or hide one of the run's screens, or all of them for `part` nil or "all"; kept as the
-- Interface page's setting.
function AZS_SetHudShown(part, shown)
	local value = "0";
	if ( shown ) then
		value = "1";
	end
	if ( not part or part == "all" ) then
		for _, cvar in pairs(AZS_HUD_CVARS) do
			SetCVar(cvar, value);
		end
	elseif ( AZS_HUD_CVARS[part] ) then
		SetCVar(AZS_HUD_CVARS[part], value);
	end
end

function AZS_IsHudShown(part)
	local cvar = AZS_HUD_CVARS[part];
	return cvar and GetCVar(cvar) ~= "0";
end

-- The frames kept over the level-up and jewelry cards (AZS_SetOnTopOfScreens), by their global
-- names; the screens read AZS_ON_TOP_FRAMES, the names with "," between.
AZS_ON_TOP = {};
AZS_ON_TOP_FRAMES = "";

-- A frame's global name, the frame given or its name.
function AZS_FrameName(frame)
	if ( type(frame) == "table" and frame.GetName ) then
		return frame:GetName();
	end
	return frame;
end

-- Keep `frame` (a frame or its global name) and every frame under it over the level-up and
-- jewelry cards while they are up, taking its own clicks there; `on` false puts it back under.
function AZS_SetOnTopOfScreens(frame, on)
	local name = AZS_FrameName(frame);
	if ( type(name) ~= "string" or name == "" ) then
		error("AZS_SetOnTopOfScreens(frame, on): the frame needs a global name", 2);
	end
	if ( on ) then
		AZS_ON_TOP[name] = 1;
	else
		AZS_ON_TOP[name] = nil;
	end
	local names = {};
	for n in pairs(AZS_ON_TOP) do
		table.insert(names, n);
	end
	table.sort(names);
	AZS_ON_TOP_FRAMES = table.concat(names, ",");
end

function AZS_IsOnTopOfScreens(frame)
	local name = AZS_FrameName(frame);
	return name ~= nil and AZS_ON_TOP[name] ~= nil;
end

-- The banners kept for AZS_BANNERS, the newest last.
AZS_BANNERS_KEPT = 20;

-- Call `handler(banner)` for every banner from now on ({ id, kind, boss, name, text, time }),
-- shown or hidden; once per handler however often it is registered.
function AZS_RegisterBannerHandler(handler)
	for i = 1, table.getn(AZS_BANNER_HANDLERS) do
		if ( AZS_BANNER_HANDLERS[i] == handler ) then
			return;
		end
	end
	table.insert(AZS_BANNER_HANDLERS, handler);
end

function AZS_UnregisterBannerHandler(handler)
	for i = table.getn(AZS_BANNER_HANDLERS), 1, -1 do
		if ( AZS_BANNER_HANDLERS[i] == handler ) then
			table.remove(AZS_BANNER_HANDLERS, i);
		end
	end
end

-- A banner line: its fields, the text last and whole.
function AZS_ParseBanner(msg)
	local _, _, id, kind, boss, name, text = string.find(msg, "^id=(%d+);kind=(%w+);boss=(%d);name=([^;]*);text=(.*)$");
	if ( not id ) then
		return nil;
	end
	return { id = tonumber(id), kind = kind, boss = (boss == "1"), name = name, text = text, time = GetTime() };
end

function AZS_OnBanner(msg)
	local b = AZS_ParseBanner(msg);
	if ( not b ) then
		return;
	end
	AZS_BANNER = b;
	table.insert(AZS_BANNERS, b);
	while ( table.getn(AZS_BANNERS) > AZS_BANNERS_KEPT ) do
		table.remove(AZS_BANNERS, 1);
	end
	AZS_BANNER_UPDATED = b.time;
	-- One addon's error leaves the others theirs: it goes to the error handler, as a script's would.
	for i = 1, table.getn(AZS_BANNER_HANDLERS) do
		local ok, err = pcall(AZS_BANNER_HANDLERS[i], b);
		if ( not ok and geterrorhandler ) then
			geterrorhandler()(err);
		end
	end
end

function AZS_UnitKind(unit)
	if ( not UnitExists(unit) or UnitIsPlayer(unit) or UnitPlayerControlled(unit) ) then
		return nil;
	end
	local name = UnitName(unit);
	if ( UnitIsUnit(unit, "target") and AZS_TARGET.name == name ) then
		return AZS_TARGET.kind;
	end
	for i = 1, table.getn(AZS_UNITS) do
		local u = AZS_UNITS[i];
		if ( u.name == name and ( u.kind == "final" or u.kind == "boss" ) ) then
			return u.kind;
		end
	end
	local c = UnitClassification(unit);
	if ( c == "worldboss" ) then
		return "boss";
	elseif ( c == "elite" or c == "rareelite" ) then
		return "elite";
	end
	return "normal";
end

function AZS_ApiOnEvent()
	if ( event ~= "CHAT_MSG_ADDON" ) then
		return;
	end
	if ( arg1 == "AZSRUN" ) then
		AZS_RUN = AZS_Fields(arg2);
		AZS_RUN_UPDATED = GetTime();
	elseif ( arg1 == "AZSZONE" ) then
		local was = AZS_ZONE;
		AZS_ZONE = AZS_Fields(arg2);
		if ( AZS_ZONE.run ) then
			AZS_ZONE.run = tostring(AZS_ZONE.run);
		end
		AZS_ZONE_UPDATED = GetTime();
		-- Another run or map: the old destinations are retired before any new one is taken.
		if ( was.run ~= AZS_ZONE.run or was.map ~= AZS_ZONE.map ) then
			AZS_CHESTS = {};
			AZS_LAIRS = {};
			AZS_DOWNED = {};
			AZS_WALine();
		end
	elseif ( arg1 == "AZSBOSSES" ) then
		AZS_SCHEDULE = AZS_List(arg2, { "index", "at", "name", "final", "state" });
		AZS_SCHEDULE_UPDATED = GetTime();
	elseif ( arg1 == "AZSUNITS" ) then
		AZS_UNITS = AZS_List(arg2, { "kind", "id", "name", "hp", "hpm", "state" });
		AZS_UNITS_UPDATED = GetTime();
		AZS_WALine();
	elseif ( arg1 == "AZSDEBUFFS" ) then
		AZS_DEBUFFS = AZS_List(arg2, { "id", "spell", "stacks", "duration", "ends", "permanent", "dispel", "icon", "name" });
		AZS_DEBUFFS_UPDATED = GetTime();
	elseif ( arg1 == "AZSTGT" ) then
		AZS_TARGET = AZS_Fields(arg2);
		AZS_TARGET_UPDATED = GetTime();
	elseif ( arg1 == "AZSSPELLS" ) then
		AZS_SPELLS = AZS_List(arg2, { "key", "spell", "rank", "cd", "cdmax" });
		AZS_SPELLS_UPDATED = GetTime();
	elseif ( arg1 == "AZSTIMERS" ) then
		AZS_TIMERS = AZS_List(arg2, { "name", "icon", "kind", "ready", "wait" });
		AZS_TIMERS_UPDATED = GetTime();
	elseif ( arg1 == "AZSBUFFS" ) then
		AZS_BUFFS = AZS_List(arg2, { "spell", "left" });
		AZS_BUFFS_UPDATED = GetTime();
	elseif ( arg1 == "AZSPETS" ) then
		AZS_PETS = AZS_List(arg2, { "id", "entry", "key", "kind", "ends", "dur", "icon", "name" });
		AZS_PETS_UPDATED = GetTime();
	elseif ( arg1 == "AZSTOTEMS" ) then
		AZS_TOTEMS = AZS_List(arg2, { "key", "spell", "count", "cap", "ends", "dur", "icon", "name" });
		AZS_TOTEMS_UPDATED = GetTime();
	elseif ( arg1 == "AZSMETER" ) then
		AZS_METER = AZS_List(arg2, { "name", "dmg", "dps", "share", "proc" });
		AZS_METER_UPDATED = GetTime();
	elseif ( arg1 == "AZSHEAL" ) then
		AZS_HEALING = AZS_List(arg2, { "name", "dmg", "dps", "share", "proc" });
		AZS_HEALING_UPDATED = GetTime();
	elseif ( arg1 == "AZSBOSSDMG" ) then
		AZS_BOSSMETER = AZS_List(arg2, { "name", "dmg", "dps", "share", "proc" });
		AZS_BOSSMETER_UPDATED = GetTime();
	elseif ( arg1 == "AZSREVIVE" ) then
		AZS_REVIVE = AZS_Fields(arg2);
		AZS_REVIVE_UPDATED = GetTime();
	elseif ( arg1 == "AZSPARTY" ) then
		AZS_PARTY = AZS_List(arg2, { "name", "class", "dmg", "dps", "share", "top", "topdps" });
		AZS_PARTY_UPDATED = GetTime();
	elseif ( arg1 == "AZSDOWNED" ) then
		AZS_DOWNED = AZS_TagSpace(AZS_List(arg2, { "id", "name", "x", "y", "z", "ep", "state" }));
		AZS_DOWNED_UPDATED = GetTime();
		AZS_WALine();
	elseif ( arg1 == "AZSCHESTS" ) then
		AZS_CHESTS = AZS_TagSpace(AZS_List(arg2, { "id", "x", "y", "z", "mx", "my" }));
		AZS_CHESTS_UPDATED = GetTime();
		AZS_WALine();
	elseif ( arg1 == "AZSLAIRS" ) then
		AZS_LAIRS = AZS_TagSpace(AZS_List(arg2, { "index", "state", "name", "id", "left", "x", "y", "z", "mx", "my", "flag" }));
		AZS_LAIRS_UPDATED = GetTime();
		AZS_WALine();
	elseif ( arg1 == "AZSTAKEN" ) then
		AZS_TAKEN = AZS_List(arg2, { "source", "dmg" });
		AZS_TAKEN_UPDATED = GetTime();
	elseif ( arg1 == "AZSEND" ) then
		AZS_END = AZS_Fields(arg2);
		AZS_END_UPDATED = GetTime();
	elseif ( arg1 == "AZSBANNER" ) then
		AZS_OnBanner(arg2);
	elseif ( arg1 == "AZS" ) then
		if ( AZS_Parse ) then
			AZS_STATS = AZS_Parse(arg2);
		end
	end
end

AZSApiFrame = CreateFrame("Frame", "AZSApiFrame");
AZSApiFrame:RegisterEvent("CHAT_MSG_ADDON");
AZSApiFrame:SetScript("OnEvent", AZS_ApiOnEvent);
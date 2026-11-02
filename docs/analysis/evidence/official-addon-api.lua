-- Azeroth Survivors: the run for addons, off the server's addon lines. See the README's
-- "For addon authors" for every field.
AZS_ZONE = {};
AZS_RUN = {};
AZS_SCHEDULE = {};
AZS_UNITS = {};
AZS_TARGET = { kind = "none" };
AZS_SPELLS = {};
AZS_BUFFS = {};
AZS_METER = {};
AZS_TAKEN = {};

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

-- The bosses alive now: { id, name, hp, hpm, final, enraged } each, several at once too.
function AZS_GetBosses()
	local out = {};
	for i = 1, table.getn(AZS_UNITS) do
		local u = AZS_UNITS[i];
		if ( u.kind == "boss" or u.kind == "final" ) then
			table.insert(out, { id = u.id, name = u.name, hp = u.hp, hpm = u.hpm,
				final = (u.kind == "final"), enraged = (u.state == 1) });
		end
	end
	return out;
end

-- The guardians alive now: { id, name, hp, hpm, awake } each.
function AZS_GetGuardians()
	local out = {};
	for i = 1, table.getn(AZS_UNITS) do
		local u = AZS_UNITS[i];
		if ( u.kind == "guardian" ) then
			table.insert(out, { id = u.id, name = u.name, hp = u.hp, hpm = u.hpm, awake = (u.state == 1) });
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

-- The run's own screens: clock, bosses, tally, build, banners, loot, meter.
AZS_HUD_CVARS = { HUD_CVARS_LUA };

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
		AZS_ZONE = AZS_Fields(arg2);
		AZS_ZONE_UPDATED = GetTime();
	elseif ( arg1 == "AZSBOSSES" ) then
		AZS_SCHEDULE = AZS_List(arg2, { "index", "at", "name", "final", "state" });
		AZS_SCHEDULE_UPDATED = GetTime();
	elseif ( arg1 == "AZSUNITS" ) then
		AZS_UNITS = AZS_List(arg2, { "kind", "id", "name", "hp", "hpm", "state" });
		AZS_UNITS_UPDATED = GetTime();
	elseif ( arg1 == "AZSTGT" ) then
		AZS_TARGET = AZS_Fields(arg2);
		AZS_TARGET_UPDATED = GetTime();
	elseif ( arg1 == "AZSSPELLS" ) then
		AZS_SPELLS = AZS_List(arg2, { "key", "spell", "rank", "cd", "cdmax" });
		AZS_SPELLS_UPDATED = GetTime();
	elseif ( arg1 == "AZSBUFFS" ) then
		AZS_BUFFS = AZS_List(arg2, { "spell", "left" });
		AZS_BUFFS_UPDATED = GetTime();
	elseif ( arg1 == "AZSMETER" ) then
		AZS_METER = AZS_List(arg2, { "name", "dmg", "dps", "share", "proc" });
		AZS_METER_UPDATED = GetTime();
	elseif ( arg1 == "AZSTAKEN" ) then
		AZS_TAKEN = AZS_List(arg2, { "source", "dmg" });
		AZS_TAKEN_UPDATED = GetTime();
	elseif ( arg1 == "AZS" ) then
		if ( AZS_Parse ) then
			AZS_STATS = AZS_Parse(arg2);
		end
	end
end

AZSApiFrame = CreateFrame("Frame", "AZSApiFrame");
AZSApiFrame:RegisterEvent("CHAT_MSG_ADDON");
AZSApiFrame:SetScript("OnEvent", AZS_ApiOnEvent);

-- Shared exact-API contract checks; capability gates retain historical fixtures.
arg[1] = arg[1] or "docs/analysis/evidence/0.112.0/addon-api.lua";
do
-- Source-only contract check; no game/client process or Rust compilation.
-- Run from the checkout root: lua scripts/check-addon-bootstrap.lua
-- This uses host stubs, not the real FrameXML VM. Rust lifecycle regressions
-- live alongside addon_bootstrap.rs and remain unrun without build permission.
local api_path = arg[1] or "docs/analysis/evidence/0.105.0/game-mode-audit/addon-api.lua";
local parser_path = arg[2] or "docs/analysis/evidence/0.105.0/addon-bridge/native-stats-parser.lua";
local function read(path)
    local file = assert(io.open(path, "rb"));
    local source = file:read("*a");
    file:close();
    return source;
end
local execute = loadstring or load;
-- The selected source uses Lua 5.0's table.getn; modern standalone Lua omits it.
table.getn = table.getn or function(t)
    local count = 0;
    for _ in ipairs(t) do count = count + 1; end
    return count;
end;

local now = 100;
local settings = { storeLevels = "1", hudClock = "0", hudScale = "1.5" };
local created, registered = 0, 0;
local replay_requests = {};
function GetTime() return now; end
function GetCVar(name) return settings[name]; end
function SetCVar(name, value) settings[name] = value; end
function SendAddonMessage(prefix, payload, channel)
    table.insert(replay_requests, { prefix, payload, channel });
end
function CreateFrame(kind, name)
    assert(kind == "Frame" and (name == "AZSApiFrame" or name == "AZSMeterFrame"));
    if name == "AZSApiFrame" then created = created + 1; end
    return {
        RegisterEvent = function(self, event)
            if name == "AZSApiFrame" then
                assert(event == "CHAT_MSG_ADDON"); registered = registered + 1;
            else
                assert(event == "PLAYER_ENTERING_WORLD");
            end
        end,
        SetScript = function(self, name, handler)
            assert(name == "OnEvent"); self.handler = handler;
        end
    };
end
function UnitExists() return false; end
function UnitIsPlayer() return false; end
function UnitPlayerControlled() return false; end
function UnitName() return "Boss"; end
function UnitIsUnit() return false; end
function UnitClassification() return "normal"; end

local parts = "clock = 'hudClock', bosses = 'hudBosses', tally = 'hudTally', " ..
    "build = 'hudBuild', banners = 'hudBanners', loot = 'hudLoot', " ..
    "meter = 'hudMeter', levels = 'hudLevels', flag = 'hudFlag'";
local api = read(api_path);
local has_revive = string.find(api, "function AZS_GetRevive()", 1, true) ~= nil;
local has_local_clock = string.find(api, "function AZS_GetLocalTime()", 1, true) ~= nil;
if has_revive then parts = parts .. ", revive = 'hudRevive'"; end
if has_local_clock then parts = parts .. ", localClock = 'hudLocalClock'"; end
local source, substitutions = string.gsub(api, "HUD_CVARS_LUA", parts);
assert(substitutions == 1 or (substitutions == 0 and string.find(api, "AZS_HUD_CVARS = {", 1, true)));
assert(execute(read(parser_path), "native-stats-parser"))();
assert(execute(source, "native-addon-api"))();
assert(created == 1 and registered == 1);
if AZSMeterFrame then
    assert(table.getn(replay_requests) == 1);
    local request = replay_requests[1];
    assert(request[1] == "AZSMREQ" and request[2] == "full" and request[3] == "PARTY");
    AZSMeterFrame.handler();
    assert(table.getn(replay_requests) == 1);
    now = now + 1;
    AZSMeterFrame.handler();
    assert(table.getn(replay_requests) == 2);
    now = now - 1;
    print("Passed addon replay request: bootstrap, world entry and one-second throttle; stub host only");
end
assert(AZS_GetPhase() == nil and AZS_GetRunSummary() == nil);
assert(AZS_GetStoredLevels() == 0 and AZS_IsStoringLevels());
assert(not AZS_IsHudShown("clock") and AZS_IsHudShown("bosses"));
AZS_SetHudShown(nil, false);
local count = 0;
for part, cvar in pairs(AZS_HUD_CVARS) do
    count = count + 1; assert(settings[cvar] == "0");
end
assert(count == 9 + (has_revive and 1 or 0) + (has_local_clock and 1 or 0));
assert(settings.hudScale == "1.5" and settings.storeLevels == "1");
AZS_SetHudShown("clock", true);
assert(AZS_IsHudShown("clock") and not AZS_IsHudShown("bosses"));
AZS_SetStoringLevels(false); assert(settings.storeLevels == "0");
AZS_OpenStoredLevels(); assert(settings.spendLevels == "1");

-- Invoke the actual embedded handler; event fan-out belongs to the real host
-- and is covered by the authored, currently unrun Rust VM integration test.
local function line(prefix, payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
    AZSApiFrame.handler();
end
line("AZSRUN", "t=8;ph=playing;sl=2;proc=150;pv=3;pm=1");
now = 101;
assert(AZS_GetRunTime() == 9 and AZS_GetStoredLevels() == 2);
assert(AZS_RUN.proc == 150 and AZS_RUN.pv == 3 and AZS_RUN.pm == 1);
line("AZSZONE", "len=60;key=test");
assert(AZS_GetRunLength() == 60);
line("AZSBOSSES", "1,30,Next,0,due;2,60,Final,1,due");
assert(table.getn(AZS_GetUpcomingBosses()) == 2 and AZS_GetUpcomingBosses()[2].final);
line("AZSUNITS", "boss,42,Boss,50,100,1;guardian,43,Guard,10,20,1");
line("AZSDEBUFFS", "42,9,2,10,20,0,Magic,icon,Name");
assert(table.getn(AZS_GetBosses()) == 1 and AZS_GetBosses()[1].enraged);
assert(table.getn(AZS_GetGuardians()) == 1 and AZS_GetGuardians()[1].awake);
assert(AZS_GetDebuffs(42)[1].remaining == 11);
line("AZSTGT", "kind=boss;id=42;name=Boss");
assert(AZS_TARGET.kind == "boss");
line("AZSSPELLS", "key,9,2,1,3");
line("AZSBUFFS", "9,10");
line("AZSMETER", "Damage,20,2,100,0");
line("AZSHEAL", "Healing,10,1,100,1");
line("AZSBOSSDMG", "Boss,5,0.5,100,0");
assert(AZS_SPELLS[1].rank == 2 and AZS_BUFFS[1].left == 10);
local _, damage, dps = AZS_GetMeter(); assert(damage == 20 and dps == 20/9);
local _, healed, hps = AZS_GetHealing(); assert(healed == 10 and hps == 1);
local _, bossdamage, bossdps = AZS_GetBossMeter(); assert(bossdamage == 5 and bossdps == 0.5);
line("AZSCHESTS", "1,2,3,4,0.5,0.6");
line("AZSLAIRS", "1,held,Boss,42,0,1,2,3,0.4,0.5,1");
line("AZSTAKEN", "Enemy,15");
line("AZSEND", "result=victory;gold=123;magnets=2");
assert(AZS_CHESTS[1].id == 1 and AZS_GetFlaggedLair().active);
assert(AZS_TAKEN[1].dmg == 15 and AZS_GetRunSummary().gold == 123);
assert(AZS_GetRunSummary().magnets == 2);
line("AZSEND", "result=left;magnets=0");
assert(AZS_GetRunSummary().magnets == 0);
line("AZS", "hp=12;unknown=text;negative=-1;fraction=2.5");
assert(AZS_STATS.hp == 12 and AZS_STATS.unknown == 0);
assert(AZS_STATS.negative == -1 and AZS_STATS.fraction == 2.5);
line("AZSRUN", "t=8;ph=paused");
now = 102; assert(AZS_GetRunTime() == 8);
line("AZSUNITS", ""); line("AZSDEBUFFS", ""); line("AZSLAIRS", "");
assert(table.getn(AZS_GetBosses()) == 0 and table.getn(AZS_GetGuardians()) == 0);
assert(table.getn(AZS_GetLairs()) == 0 and AZS_GetFlaggedLair() == nil);
assert(created == 1 and registered == 1);
print("Passed embedded Lua checks: established streams, getters, clock/phase, numeric stats parser and " .. count .. " HUD CVars; stub host only");
end
if type(AZS_GetLocalTime) == "function" then
    assert(AZS_HUD_CVARS.localClock == "hudLocalClock");
    assert(AZS_GetLocalTime() == nil);
    AZS_NativeLocalTime = function() error("local time unavailable"); end;
    assert(AZS_GetLocalTime() == nil);
    AZS_NativeLocalTime = function() return nil, 0, 0, true; end;
    assert(AZS_GetLocalTime() == nil);
    AZS_NativeLocalTime = function() return "12:05 AM", 0, 5, false; end;
    assert(AZS_IsHudShown("clock"));
    AZS_SetHudShown("localClock", false);
    assert(not AZS_IsHudShown("localClock") and AZS_IsHudShown("clock"));
    local first, second = AZS_GetLocalTime(), AZS_GetLocalTime();
    assert(first ~= second and first.text == "12:05 AM" and first.hour == 0);
    assert(first.minute == 5 and first.is24Hour == false);
    first.hour = 99;
    assert(second.hour == 0 and AZS_GetLocalTime().hour == 0);
    AZS_NativeLocalTime = function() return "23:59", 23, 59, true; end;
    local current = AZS_GetLocalTime();
    assert(current.text == "23:59" and current.hour == 23);
    assert(current.minute == 59 and current.is24Hour == true);
    print("Passed local clock API: protected reads, fresh tables, both formats and independent HUD visibility; stub host only");
end
if type(AZS_GetRevive) == "function" then
-- Current revive additions share the native API frame and legacy event arguments.
local now = 300;
function GetTime() return now; end
local function message(payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", "AZSREVIVE", payload;
    AZSApiFrame.handler();
end
assert(AZS_GetRevive() == AZS_REVIVE and next(AZS_GetRevive()) == nil);
assert(AZS_REVIVE_UPDATED == nil);
assert(AZS_HUD_CVARS.revive == "hudRevive");
assert(select("#", AZS_SetHudShown("revive", false)) == 0);
assert(GetCVar("hudRevive") == "0" and not AZS_IsHudShown("revive"));
local old = AZS_GetRevive();
event, arg1, arg2 = "UNRELATED", "AZSREVIVE", "down=1";
AZSApiFrame.handler();
assert(AZS_GetRevive() == old and AZS_REVIVE_UPDATED == nil);
message("down=1;share=0.50;by=Ada");
local r = AZS_GetRevive();
assert(r == AZS_REVIVE and r ~= old and next(old) == nil);
assert(r.down == 1 and r.share == 0.5 and r.by == "Ada");
assert(r.reviving == nil and r.rshare == nil and AZS_REVIVE_UPDATED == 300);
assert(not AZS_IsHudShown("revive"), "hidden HUD does not suppress receipts");
now = 301; old = r;
message("down=0;reviving=Bo;rshare=0.25");
r = AZS_GetRevive();
assert(r ~= old and old.down == 1 and r.down == 0 and r.down);
assert(r.reviving == "Bo" and r.rshare == 0.25 and r.share == nil and r.by == nil);
assert(AZS_REVIVE_UPDATED == 301);
AZS_SetHudShown("revive", 0); assert(AZS_IsHudShown("revive"));
AZS_SetHudShown("revive", nil); assert(not AZS_IsHudShown("revive"));
AZS_SetHudShown("Revive", true); assert(not AZS_IsHudShown("revive"));
assert(AZS_IsHudShown("Revive") == nil);
AZS_SetHudShown("all", true); assert(AZS_IsHudShown("revive"));
assert(AZS_GetRevive() == r, "visibility does not replace the cache");
now = 302; old = r; message("");
assert(next(AZS_GetRevive()) == nil and AZS_GetRevive() ~= old);
assert(old.reviving == "Bo" and AZS_REVIVE_UPDATED == 302);
print("Passed revive API: shared frame, hidden receipts, optional fields, numeric-zero truthiness, visibility/all, replacement, timestamps and empty clears; synthetic payloads only");
end
if type(AZS_RegisterBannerHandler) == "function" then
-- Interpreted exact selected-target API. Stub host only; no game or compiler.

local calls, errors = {}, {};
function geterrorhandler() return function(err) table.insert(errors, err); end; end
local function good(b) table.insert(calls, b); end
local function bad() error("addon failed"); end
AZS_RegisterBannerHandler(bad);
AZS_RegisterBannerHandler(good);
AZS_RegisterBannerHandler(good);
assert(table.getn(AZS_BANNER_HANDLERS) == 2);
local function banner(payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", "AZSBANNER", payload;
    AZSApiFrame.handler();
end

-- Invalid input changes neither latest/history nor timestamps/callbacks.
for _, msg in ipairs({"", "id=-1;kind=cache;boss=0;name=;text=x",
    "id=1;kind=bad-kind;boss=0;name=;text=x", "id=1;kind=cache;boss=10;name=;text=x",
    "id=1;kind=cache;boss=0;name=bad;name;text=x"}) do
    banner(msg);
    assert(AZS_BANNER == nil and AZS_BANNER_UPDATED == nil);
    assert(table.getn(AZS_BANNERS) == 0 and table.getn(calls) == 0);
end
-- HUD visibility and paused/out-of-run clocks do not gate delivery.
AZS_SetHudShown("banners", false);
for id = 1, 25 do
    banner("id=" .. id .. ";kind=guardian;boss=1;name=É,中;text=Text;=,🙂");
end
assert(table.getn(calls) == 25 and table.getn(errors) == 25);
assert(table.getn(AZS_BANNERS) == 20 and AZS_BANNERS[1].id == 6);
assert(AZS_BANNER == calls[25] and AZS_BANNERS[20] == AZS_BANNER);
assert(AZS_BANNER.name == "É,中" and AZS_BANNER.text == "Text;=,🙂" and AZS_BANNER.boss);
assert(AZS_BANNER_UPDATED == GetTime() and AZS_BANNER.time == GetTime());
AZS_UnregisterBannerHandler(bad);
AZS_UnregisterBannerHandler(good);
AZS_UnregisterBannerHandler(good);
assert(table.getn(AZS_BANNER_HANDLERS) == 0);
banner("id=0;kind=cache;boss=0;name=;text=");
assert(AZS_BANNER.id == 0 and not AZS_BANNER.boss and AZS_BANNER.text == "");
assert(table.getn(calls) == 25 and table.getn(errors) == 25);
-- The native parser has no invented duplicate-ID suppression.
banner("id=0;kind=cache;boss=0;name=;text=");
assert(AZS_BANNERS[19].id == 0 and AZS_BANNERS[20].id == 0);
print("Passed banner branch: malformed input, 20-entry history, final text, callbacks, errors, hidden HUD and wrapped/duplicate IDs; stub host only");
end
if type(AZS_GetSummons) == "function" then
-- Execute the exact installed-target API with a stub host; no game or compiler.
-- Reuse the historical stream/banner contracts against the current Lua chunk.

local now = 200;
function GetTime() return now; end
local function message(prefix, payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
    AZSApiFrame.handler();
end

assert(table.getn(AZS_PETS) == 0 and AZS_PETS_UPDATED == nil);
assert(AZS_GetSummonCount() == 0 and AZS_GetSummonCount("unknown") == 0);
local groups, count = AZS_GetSummonGroups();
assert(table.getn(groups) == 0 and count == 0);

message("AZSRUN", "t=10;ph=playing");
message("AZSPETS", "91,9510,wolf,pet,-1.0,-1.0,,Wolf;" ..
    "92,9512,imp,imp,25.0,20.0,Spell_Shadow_SummonImp,Imp;" ..
    "93,9512,imp,imp,-1.0,-1.0,,Permanent Imp;" ..
    "94,9523,pit_lord,pitlord,30.0,20.0,Icon,Pit Lord;" ..
    "95,9512,imp,imp,9.0,16.0,Other,Expired Imp");
assert(AZS_PETS_UPDATED == 200 and AZS_GetSummonCount() == 5);
local all = AZS_GetSummons();
assert(all[1].id == 91 and all[2].id == 92 and all[5].id == 95);
assert(all[1].entry == 9510 and all[1].key == "wolf" and all[1].kind == "pet");
assert(all[1].permanent and all[1].icon == nil);
assert(all[1].remaining == nil and all[1].duration == nil);
assert(all[2].duration == 20 and all[2].remaining == 15 and not all[2].permanent);
assert(all[2].icon == "Spell_Shadow_SummonImp");
assert(all[5].remaining == 0, "expired rows stay present until a server clear");
assert(AZS_GetSummonCount("imp") == 3 and AZS_GetSummonCount("pet") == 1);
assert(AZS_GetSummonCount("pit_lord") == 1 and AZS_GetSummonCount("pitlord") == 1);
assert(AZS_GetSummonCount("missing") == 0);

groups, count = AZS_GetSummonGroups();
assert(count == 5 and table.getn(groups) == 3);
assert(groups[1].key == "wolf" and groups[2].key == "imp" and groups[3].key == "pit_lord");
assert(groups[1].permanent == 1 and groups[1].temporary == 0 and groups[1].remaining == nil);
assert(groups[2].count == 3 and groups[2].permanent == 1 and groups[2].temporary == 2);
assert(groups[2].name == "Imp" and groups[2].icon == all[2].icon);
assert(groups[2].remaining == 0 and groups[3].remaining == 20);
all[2].remaining, groups[2].name = 999, "changed";
assert(AZS_PETS[2].ends == 25 and AZS_PETS[2].name == "Imp", "getters return projections");

now = 203;
assert(AZS_GetSummons("imp")[1].remaining == 12, "playing time advances locally");
message("AZSRUN", "t=12;ph=choosing");
now = 250;
assert(AZS_GetSummons("imp")[1].remaining == 13, "choice pause uses frozen run time");
message("AZSRUN", "t=15;ph=paused");
now = 270;
assert(AZS_GetSummons("pitlord")[1].remaining == 15);
message("AZSRUN", "ph=ready");
assert(AZS_GetSummons("imp")[1].remaining == 25, "missing run time uses zero");

message("AZSPETS", "1,9512,imp,imp,0.0,0.0,,Имп");
all = AZS_GetSummons();
assert(#all == 1 and not all[1].permanent and all[1].remaining == 0);
assert(all[1].duration == 0 and all[1].name == "Имп");
message("AZSPETS", "");
groups, count = AZS_GetSummonGroups();
assert(count == 0 and table.getn(groups) == 0 and AZS_PETS_UPDATED == now);
print("Passed summon API: stream, filtering, order, grouping, lifetime, pause, empty clears and copied projections; stub host only");
end
if type(AZS_GetPlayerPosition) == "function" then
    -- Standalone Lua uses a global arg here in place of the 5.0 vararg local.
    local function position(n)
        arg = { n = n or 0 };
        return AZS_GetPlayerPosition();
    end
    local function line(prefix, payload)
        event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
        AZSApiFrame.handler();
    end
    local function expect_error(code, nargs)
        local sample, err = position(nargs);
        assert(sample == nil and err.code == code);
    end

    expect_error("INVALID_ARGUMENT", 1);
    expect_error("NOT_READY");
    for _, status in ipairs({ "NO_WORLD", "NO_PLAYER", "NOT_READY" }) do
        AZS_NativePlayerSample = function() return status; end;
        expect_error(status);
    end
    AZS_NativePlayerSample = function() return "ok", 533, 5, 6, 7, 8, 9; end;
    line("AZSZONE", "run=abcd-1;map=533");
    line("AZSCHESTS", "1,2,3,4,0.5,0.6");
    line("AZSLAIRS", "1,awake,Guardian,42,-1,1,2,3,0.4,0.5,1");
    local sample, err = position();
    assert(err == nil and sample.apiVersion == 1 and sample.mapId == 533);
    assert(sample.x == 5 and sample.y == 6 and sample.z == 7 and sample.facing == 8);
    assert(sample.sampleId == "f9" and sample.runId == "abcd-1" and sample ~= position());
    assert(sample.spaceId == "m533:abcd-1");
    assert(AZS_CHESTS[1].spaceId == sample.spaceId and AZS_LAIRS[1].spaceId == sample.spaceId);
    line("AZSZONE", "run=abcd-1;map=533");
    assert(AZS_CHESTS[1] and AZS_LAIRS[1]);
    line("AZSZONE", "run=abcd-2;map=533");
    assert(not next(AZS_CHESTS) and not next(AZS_LAIRS) and position().runId == "abcd-2");
    line("AZSCHESTS", "1,2,3,4,0.5,0.6");
    line("AZSZONE", "run=abcd-2;map=1");
    assert(not next(AZS_CHESTS));
    sample = position();
    assert(sample.runId == nil and sample.spaceId == "m533:none");
    AZS_NativePlayerSample = function() return "ok", 533, 1 / 0, 6, 7, 8, 10; end;
    expect_error("INTERNAL_ERROR");
    print("Passed player-position API: arity, readiness, coordinate space, cache invalidation and finite samples; stub host only");
end

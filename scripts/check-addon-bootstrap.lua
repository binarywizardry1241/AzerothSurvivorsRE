-- Shared exact-API contract checks; capability gates retain historical fixtures.
local suite = arg[1];
if suite == "--timers" then
    table.remove(arg, 1);
    assert(arg[1], "pass the installed bootstrap Lua fixture");
elseif suite == "--totems" then
    table.remove(arg, 1);
    arg[1] = arg[1] or "docs/analysis/evidence/addon-api/embedded-reference.lua";
else
    arg[1] = arg[1] or "docs/analysis/evidence/addon-api/bootstrap-contract.lua";
end;
do
-- Source-only contract check; no game/client process or Rust compilation.
-- Run from the checkout root: lua scripts/check-addon-bootstrap.lua
-- This uses host stubs, not the real FrameXML VM. Rust lifecycle regressions
-- live alongside addon_bootstrap.rs and remain unrun without build permission.
local api_path = arg[1] or "docs/analysis/evidence/addon-api/game-mode-contract.lua";
local parser_path = arg[2] or "docs/analysis/evidence/addon-api/native-stats-parser.lua";
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
local settings = { storeLevels = "1", hudClock = "0", hudScale = "1.5",
    azsLanguage = "pl", azsProcess = "0123456789abcdef" };
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
                assert(event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LEAVING_WORLD"
                    or event == "CHAT_MSG_ADDON");
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
local function line(prefix, payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
    AZSApiFrame.handler();
end
if suite == "--timers" then
    local checks = 0;
    local function check(value) assert(value); checks = checks + 1; end;
    check(type(AZS_GetTimers) == "function" and #AZS_GetTimers() == 0);
    local party, total, rate = AZS_GetPartyMeter();
    check(#party == 0 and total == 0 and rate == 0);
    line("AZSPARTY", "Ada,mage,15,1.5,0.75,Frostbolt,1.0;Bo,warrior,5,0.5,0.25,Cleave,0.3");
    party, total, rate = AZS_GetPartyMeter();
    check(#party == 2 and party[1].name == "Ada" and party[2].top == "Cleave" and total == 20 and rate == 2);
    line("AZSPARTY", "");
    party, total, rate = AZS_GetPartyMeter();
    check(#party == 0 and total == 0 and rate == 0 and AZS_PARTY_UPDATED == now);
    line("AZSTIMERS", "Butcher,icon,summon,25.5,13.0;Proc,,cooldown,5.0,1.0;Butcher,other,summon,40.0,30.0");
    check(AZS_TIMERS_UPDATED == 100 and #AZS_TIMERS == 3);
    check(AZS_TIMERS[1].ready == 25.5 and AZS_TIMERS[1].wait == 13);
    check(AZS_GetTimers()[1].remaining == 25.5);
    check(#AZS_GetTimers("Butcher") == 2 and #AZS_GetTimers("butcher") == 0);
    check(#AZS_GetTimers("summon") == 0 and #AZS_GetTimers(false) == 3);
    line("AZSRUN", "t=20;ph=playing"); now = 101.25;
    local timers = AZS_GetTimers();
    check(timers[1].remaining == 4.25 and not timers[1].ready and timers[1].duration == 13);
    check(timers[2].remaining == 0 and timers[2].ready and timers[2].icon == "");
    check(timers[3].remaining == 18.75 and timers[3].duration == 30);
    timers[1].name = "changed";
    check(AZS_TIMERS[1].name == "Butcher" and AZS_GetTimers()[1].name == "Butcher");
    line("AZSRUN", "t=20;ph=paused"); now = 500;
    check(AZS_GetTimers()[1].remaining == 5.5);
    for _, phase in ipairs({ "choosing", "ready", "dead", "victory" }) do
        line("AZSRUN", "t=20;ph=" .. phase); now = now + 10;
        check(AZS_GetTimers()[1].remaining == 5.5);
    end;
    line("AZSTIMERS", "Expired,,cooldown,19.0,1.0;Ready,,cooldown,20.0,1.0;Future,,cooldown,100.0,1.0");
    timers = AZS_GetTimers();
    check(timers[1].ready and timers[2].ready and timers[3].remaining == 80);
    check(timers[3].remaining > timers[3].duration);
    local before = AZS_TIMERS_UPDATED;
    line("AZSPETS", ""); check(AZS_TIMERS_UPDATED == before and #AZS_GetTimers() == 3);
    line("AZSTIMERS", ""); check(#AZS_GetTimers() == 0 and AZS_TIMERS_UPDATED == now);
    -- Ordinary fresh VM evaluation resets only through the exact native initializers.
    assert(execute(source))();
    check(#AZS_GetTimers() == 0 and #AZS_REVIVE == 0 and #AZS_PARTY == 0);
    print("PASS: " .. checks .. " exact timer Lua assertions; stub host only");
    return;
end;
if suite == "--totems" then
    local checks = 0;
    local function check(value) assert(value); checks = checks + 1; end;
    local current = #api == 18935;
    assert(current or #api == 17776, "wrong embedded API fixture");
    check(AZS_ZONE.affixes == nil and AZS_ZONE_UPDATED == nil);
    check(table.getn(AZS_GetTotems()) == 0 and AZS_GetTotemCount() == 0);
    check(AZS_TOTEMS_UPDATED == nil);
    line("AZSZONE", "len=1200;affixes=sanguine,explosive");
    check(AZS_ZONE.affixes == "sanguine,explosive" and AZS_ZONE.len == 1200);
    check(AZS_ZONE_UPDATED == now);
    local oldZone = AZS_ZONE;
    line("AZSZONE", "affixes=");
    check(AZS_ZONE.affixes == "" and AZS_ZONE ~= oldZone);
    line("AZSZONE", "len=1200");
    check(AZS_ZONE.affixes == nil);

    -- Synthetic values exercise the actual parser; keys/caps are not game claims.
    line("AZSTOTEMS", "fixture_one,123,3,4,25.5,12.0,Interface\\Icons\\Fixture,Fixture One;fixture_two,456,2,2,19.0,10.0,,Fixture Two");
    check(AZS_TOTEMS_UPDATED == 100 and table.getn(AZS_TOTEMS) == 2);
    local raw = AZS_TOTEMS[1];
    check(raw.key == "fixture_one" and raw.spell == 123 and raw.count == 3);
    check(raw.cap == 4 and raw.ends == 25.5 and raw.dur == 12);
    check(raw.icon == "Interface\\Icons\\Fixture" and raw.name == "Fixture One");
    local rows = AZS_GetTotems();
    check(table.getn(rows) == 2 and rows[1].duration == 12 and rows[1].remaining == 25.5);
    check(rows[1].ends == nil and rows[1].dur == nil and rows[2].icon == "");
    check(AZS_GetTotemCount() == 5 and AZS_GetTotemCount("fixture_one") == 3);
    check(table.getn(AZS_GetTotems("fixture_one")) == 1);
    check(table.getn(AZS_GetTotems("Fixture_one")) == 0);
    check(table.getn(AZS_GetTotems("missing")) == 0 and AZS_GetTotemCount("missing") == 0);
    rows[1].count = 999;
    check(AZS_TOTEMS[1].count == 3 and AZS_GetTotems()[1].count == 3);

    line("AZSRUN", "t=20;ph=playing"); now = 101.25;
    rows = AZS_GetTotems();
    check(rows[1].remaining == 4.25 and rows[1].duration == 12);
    check(rows[2].remaining == 0 and rows[2].count == 2);
    check(AZS_GetTotemCount() == 5);
    for _, phase in ipairs({ "paused", "choosing", "ready", "dead", "victory" }) do
        line("AZSRUN", "t=20;ph=" .. phase); now = now + 10;
        check(AZS_GetTotems()[1].remaining == 5.5);
    end;
    local oldTotems = AZS_TOTEMS;
    local updated = AZS_TOTEMS_UPDATED;
    event, arg1, arg2 = "OTHER_EVENT", "AZSTOTEMS", "";
    AZSApiFrame.handler();
    check(AZS_TOTEMS == oldTotems and AZS_TOTEMS_UPDATED == updated);
    line("AZSPETS", "");
    check(AZS_TOTEMS == oldTotems and AZS_TOTEMS_UPDATED == updated);
    line("AZSTOTEMS", "");
    check(AZS_TOTEMS ~= oldTotems and table.getn(AZS_GetTotems()) == 0);
    check(AZS_GetTotemCount() == 0 and AZS_TOTEMS_UPDATED == now);

    -- Re-evaluating the bootstrap resets tables but does not clear timestamp globals.
    local totemStamp, zoneStamp = AZS_TOTEMS_UPDATED, AZS_ZONE_UPDATED;
    assert(execute(source))();
    check(table.getn(AZS_TOTEMS) == 0 and AZS_ZONE.affixes == nil);
    check(AZS_TOTEMS_UPDATED == totemStamp and AZS_ZONE_UPDATED == zoneStamp);
    check(AZS_GetRunTime() == nil);
    if current then
        check(AZS_ON_TOP_FRAMES == "" and next(AZS_ON_TOP) == nil);
        check(not AZS_IsOnTopOfScreens(nil));
        local frame = { GetName = function() return "ZFixture"; end };
        AZS_SetOnTopOfScreens(frame, true);
        check(AZS_IsOnTopOfScreens(frame) and AZS_IsOnTopOfScreens("ZFixture"));
        AZS_SetOnTopOfScreens("AFixture", 0); -- zero is truthy in Lua
        check(AZS_ON_TOP_FRAMES == "AFixture,ZFixture");
        AZS_SetOnTopOfScreens(frame, true);
        check(AZS_ON_TOP_FRAMES == "AFixture,ZFixture");
        AZS_SetOnTopOfScreens(frame, false);
        check(not AZS_IsOnTopOfScreens(frame) and AZS_ON_TOP_FRAMES == "AFixture");
        AZS_SetOnTopOfScreens("AFixture", nil);
        check(AZS_ON_TOP_FRAMES == "");
        for _, bad in ipairs({ "", false, 4, {} }) do
            check(not pcall(AZS_SetOnTopOfScreens, bad, true));
        end;
        check(not pcall(AZS_SetOnTopOfScreens, nil, true));
        AZS_SetOnTopOfScreens(" space ", true);
        check(AZS_ON_TOP_FRAMES == " space "); -- no invented trimming
        assert(execute(source))();
        check(AZS_ON_TOP_FRAMES == "" and not AZS_IsOnTopOfScreens(" space "));
    end;
    print("PASS: " .. checks .. " shipped addon Lua assertions; stub host only");
    return;
end;
if AZSMeterFrame then
    assert(table.getn(replay_requests) == 1);
    local request = replay_requests[1];
    assert(request[1] == "AZSMREQ" and request[2] == "full" and request[3] == "PARTY");
    event = "PLAYER_ENTERING_WORLD";
    AZSMeterFrame.handler();
    assert(table.getn(replay_requests) == 1);
    now = now + 1;
    AZSMeterFrame.handler();
    assert(table.getn(replay_requests) == 2);
    now = now - 1;
    print("Passed addon replay request: bootstrap, world entry and one-second throttle; stub host only");
end
if type(AZS_GetMeterSnapshot) == "function" then
    local saved_arg = arg;
    arg = { n = 0 };
    local function line(distribution, sender, payload)
        event, arg1, arg2, arg3, arg4 = "CHAT_MSG_ADDON", "AZSM", payload, distribution, sender;
        AZSMeterFrame.handler();
    end
    local f = table.concat({
        "F", "0", "1", "run", "party:fixture", "e1", "12", "playing", "en", "l.en",
        "5", "9", "H101", "active", "fixture", "1", "0", "", "", "", "", "", "", ""
    }, ",");
    local tail = table.concat({
        "H,H101,active",
        "S,ability:fireball:r1,ability,ability,Fireball,en,r,Interface%5CIcons%5CSpell_Fire_FlameBolt,133,,,,fireball,,,,,,1",
        "A,H101,hero,Boss,en,active,H101,m,missing,mage,,,,,,",
        "R,H101,1,d,H101,ability:fireball:r1,,n,n,d,0,k,4,1,k,,,,,21,0,0,"
    }, ";");
    local first, second = "v=1;seq=7;i=1;n=2|" .. f, "v=1;seq=7;i=2;n=2|" .. tail;
    local capabilities = AZS_GetMeterCapabilities();
    assert(capabilities.features.liveInstancePosition and not capabilities.features.completeSourceBreakdowns);
    assert(capabilities.languageCode == "pl" and capabilities.languageRevision == "l.pl");
    assert(string.find(capabilities.uiSessionId, AZS_MHash("0123456789abcdef|ui"), 1, true));
    settings.azsLanguage = "de";
    local localized = AZS_GetMeterCapabilities();
    assert(localized.languageCode == "de" and localized.languageRevision == "l.de");
    assert(localized.uiSessionId == capabilities.uiSessionId);
    line("PARTY", "Boss", first);
    line("UNKNOWN", "Another player", first);
    assert(AZS_ML.pend == nil);
    line("UNKNOWN", "Boss", second);
    assert(AZS_GetMeterContext() == nil);
    line("UNKNOWN", "Boss", first);
    local context = AZS_GetMeterContext();
    assert(context.runId == "run" and context.localOwnerId == "H101");
    assert(AZS_GetMeterCapabilities().features.completeSourceBreakdowns);
    arg = { n = 1, {
        apiVersion = 1, runId = "run", metric = "damage", scope = "self",
        period = "run", groupBy = "source", windowSeconds = 0
    } };
    local snapshot, err = AZS_GetMeterSnapshot();
    assert(err == nil and snapshot.complete and snapshot.totals.displayAmount == 21);
    assert(snapshot.rows[1].sourceKey == "ability:fireball:r1");
    event = "PLAYER_LEAVING_WORLD";
    AZSMeterFrame.handler();
    arg = { n = 0 };
    assert(AZS_GetMeterContext() == nil);
    assert(not AZS_GetMeterCapabilities().features.completeSourceBreakdowns);
    arg = saved_arg;
    print("Passed detailed meter receiver: recipient lane, multipart assembly, typed snapshot and world reset; stub host only");
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
if type(AZS_GetDownedPartyMembers) == "function" then
    local function line(prefix, payload)
        event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
        AZSApiFrame.handler();
    end
    local function downed(n)
        arg = { n = n or 0 };
        return AZS_GetDownedPartyMembers();
    end
    local position = AZS_GetPlayerPosition;
    AZS_GetPlayerPosition = function() return nil, { code = "NO_PLAYER" }; end;
    local list, err = downed(1);
    assert(not list and err.code == "INVALID_ARGUMENT");
    list, err = downed();
    assert(not list and err.code == "NO_PLAYER");
    AZS_GetPlayerPosition = function() return { mapId = 533, runId = "one", spaceId = "m533:one" }; end;
    line("AZSZONE", "run=one;map=1");
    list, err = downed();
    assert(not list and err.code == "NOT_READY");
    line("AZSZONE", "run=one;map=533");
    line("AZSDOWNED", "u7,Friend,0,2,3,9,down;u8,Departed,1,2,3,9,left;u9,Ended,1,2,3,9,ended");
    list, err = downed();
    assert(err == nil and #list == 1 and list[1].id == "u7" and list[1].name == "Friend");
    assert(list[1].positionAvailable and list[1].x == 0 and list[1].y == 2 and list[1].z == 3);
    assert(list[1].mapId == 533 and list[1].runId == "one" and list[1].spaceId == "m533:one");
    assert(list[1].anchorStatus == "notReady" and list[1].anchorId == nil);
    list[1].x = 100;
    assert(downed()[1].x == 0);
    AZS_DOWNED[1].spaceId = "m533:old";
    assert(not downed()[1].positionAvailable and downed()[1].x == nil);
    line("AZSDOWNED", "u7,Friend,0,2,3,9,down");
    line("AZSZONE", "run=two;map=533");
    assert(#downed() == 0 and not next(AZS_DOWNED));
    line("AZSDOWNED", "u7,Friend,0,2,3,9,down");
    line("AZSDOWNED", "");
    assert(#downed() == 0);
    AZS_GetPlayerPosition = position;
    print("Passed downed-party API: readiness, arity, recipient rows, zero coordinates, fresh tables, old space and clears; stub host only");
end
if type(AZS_GetWorldAnchorCapabilities) == "function" then
    arg = { n = 0 };
    local capabilities = AZS_GetWorldAnchorCapabilities();
    assert(capabilities.apiVersion == 1 and #capabilities.kinds == 8);
    assert(capabilities.maxEntriesPerCall == 256 and capabilities.maxProjectionsPerCall == 256);
    assert(capabilities.fallenRetentionSeconds == 60 and capabilities.fallenCapacity == 4096);
    local first, second, calls = nil, nil, {};
    first = function()
        table.insert(calls, "first");
        AZS_UnregisterWorldAnchorFrameHandler(first);
    end;
    second = function() table.insert(calls, "second"); end;
    assert(AZS_RegisterWorldAnchorFrameHandler(first));
    assert(AZS_RegisterWorldAnchorFrameHandler(first));
    assert(AZS_RegisterWorldAnchorFrameHandler(second));
    AZS_WorldAnchorFrame();
    AZS_WorldAnchorFrame();
    assert(table.concat(calls, ",") == "first,second,second");
    AZS_UnregisterWorldAnchorFrameHandler(second);
    print("Passed world-anchor Lua capabilities and handler mutation checks; stub host only");
end

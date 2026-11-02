-- Execute the retained 0.125.0 or current 0.127.0 embedded Lua with a stub clock/event host.
-- Run from the checkout root: lua scripts/check-addon-totem-api.lua
-- The retained fixture is bound by 0.125.0/addon-api-extract.json; the current
-- fixture is bound by 0.127.0/ontop-interface/manifest.json.
-- This checks the shipped Lua contract, not native publishers or the game VM.
local path = arg[1] or "docs/analysis/evidence/0.125.0/embedded-api.lua";
local file = assert(io.open(path, "rb"));
local source = file:read("*a"); file:close();
local current = string.len(source) == 18935;
assert(current or string.len(source) == 17776, "wrong embedded API fixture");
table.getn = table.getn or function(value)
    local count = 0;
    for _ in ipairs(value) do count = count + 1; end;
    return count;
end;
local now = 100;
function GetTime() return now; end;
function CreateFrame(kind, name)
    assert(kind == "Frame" and name == "AZSApiFrame");
    return {
        RegisterEvent = function(self, name) assert(name == "CHAT_MSG_ADDON"); end,
        SetScript = function(self, name, handler)
            assert(name == "OnEvent"); self.handler = handler;
        end
    };
end;
local execute = loadstring or load;
assert(execute(source))();
local checks = 0;
local function check(value) assert(value); checks = checks + 1; end;
local function line(prefix, payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
    AZSApiFrame.handler();
end;

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

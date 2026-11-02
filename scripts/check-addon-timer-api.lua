-- Execute the exact timer Lua with host stubs. No game or FrameXML VM runs.
local path = assert(arg[1], "pass the installed bootstrap Lua fixture");
local file = assert(io.open(path, "rb"));
local source = file:read("*a"); file:close();
table.getn = table.getn or function(value) return #value; end;
local now = 100;
function GetTime() return now; end;
function CreateFrame()
    return { RegisterEvent = function() end,
        SetScript = function(self, _, handler) self.handler = handler; end };
end;
local execute = loadstring or load;
assert(execute(source))();
local checks = 0;
local function check(value) assert(value); checks = checks + 1; end;
local function line(prefix, payload)
    event, arg1, arg2 = "CHAT_MSG_ADDON", prefix, payload;
    AZSApiFrame.handler();
end;
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

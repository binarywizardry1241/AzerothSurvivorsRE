-- Exercise the installed stock consumer with the exact AS core-file suffix.
local stock, suffix = assert(arg[1]), assert(arg[2]);
local cap = tonumber(arg[3]) or 99;
local levels = {0, 59, 60, 61, cap - 1, cap, cap + 1};
if cap > 100 then
    -- The old run boundary must still display ordinary XP after the cap rises.
    levels[#levels + 1] = 98;
    levels[#levels + 1] = 99;
    levels[#levels + 1] = 100;
end
local checks = 0;
local function check(value, label)
    checks = checks + 1;
    assert(value, label);
end
local function chunk(path, env)
    if setfenv then return setfenv(assert(loadfile(path)), env); end
    return assert(loadfile(path, "t", env));
end
local function widget()
    return {
        shown = false,
        Show = function(self) self.shown = true; end,
        Hide = function(self) self.shown = false; end,
        IsShown = function(self) return self.shown; end,
        IsVisible = function(self) return self.shown; end,
        GetFrameLevel = function() return 3; end,
        SetHeight = function(self, height) self.height = height; end,
        SetFrameLevel = function() end,
        ClearAllPoints = function() end,
        SetPoint = function() end,
        SetMinMaxValues = function() end,
        SetValue = function() end,
        SetText = function() end,
        SetStatusBarColor = function() end,
    };
end

for generation = 1, 2 do
    local env = setmetatable({}, { __index = _G });
    env._G = env;
    chunk(stock, env)();
    check(env.MAX_PLAYER_LEVEL == 60, "installed stock cap");
    local update = env.ReputationWatchBar_Update;
    local colors = env.FACTION_BAR_COLORS;
    chunk(suffix, env)();
    check(env.MAX_PLAYER_LEVEL == cap, "native run cap");
    check(env.ReputationWatchBar_Update == update and env.FACTION_BAR_COLORS == colors,
        "existing functions and data survive the append");

    for _, level in ipairs(levels) do
        for _, watched in ipairs({false, true}) do
            for _, explicit in ipairs({false, true}) do
                for _, name in ipairs({"ReputationWatchBar", "ReputationWatchStatusBar",
                    "ReputationWatchStatusBarText", "MainMenuBarArtFrame", "MainMenuBar",
                    "ReputationWatchBarOverlayFrame", "ExhaustionTick", "MainMenuExpBar",
                    "MainMenuBarMaxLevelBar"}) do
                    env[name] = widget();
                end
                for i = 0, 3 do
                    env["ReputationWatchBarTexture" .. i] = widget();
                    env["ReputationXPBarTexture" .. i] = widget();
                end
                env.GetWatchedFactionInfo = function()
                    if watched then return "Faction", 5, 100, 3100, 223; end
                end;
                env.UnitLevel = function(unit)
                    check(unit == "player", "stock player level subject");
                    return level;
                end;
                env.UIParent_ManageFramePositions = function() end;
                env.updateContainerFrameAnchors = function() end;
                env.ReputationWatchBar_Update(explicit and level or nil);
                local xp = watched and level < cap or not watched and level ~= cap;
                check(env.MainMenuExpBar.shown == xp, "stock XP bar cap boundary");
                check(env.MainMenuBarMaxLevelBar.shown == (not watched and level == cap),
                    "stock max-level rail cap boundary");
                check(env.ReputationWatchBar.shown == watched, "watched-faction admission preserved");
                if watched then
                    check(env.ReputationWatchStatusBar.height == (level < cap and 8 or 13),
                        "watched-faction rail geometry branch");
                end
                env.ShowWatchedReputationBarText(true);
                check(env.ReputationWatchStatusBarText.shown == (watched and level == cap),
                    "stock locked reputation text cap boundary");
                env.HideWatchedReputationBarText(true);
                check(not env.ReputationWatchStatusBarText.shown,
                    "stock unlock hides reputation text");
            end
        end
    end
    -- Addons run later and may intentionally replace globals on this VM.
    env.MAX_PLAYER_LEVEL = 73;
    check(env.MAX_PLAYER_LEVEL == 73, "no per-frame override of later addon state");
end
print("Passed " .. checks .. " stock run-level-cap Lua assertions");

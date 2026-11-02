-- Interpret the full canonical core patch, later addon hooks and the actual
-- Rust publication body with the existing explicit widget/stock-function seams.
-- No Rust compilation, application, real input or renderer is executed.
local function read(path)
    local file = assert(io.open(path, "rb"));
    local value = file:read("*a"); file:close(); return value;
end;
local execute = loadstring or load;
local rust = read(arg[1] or "crates/azeroth-survivors-re/src/gameplay/client/talent_view.rs");
local body = assert(rust:match('const BRIDGE: &str = r#"(.-)"#;'));
local publication = assert(execute(body, "@talent-overlay-publication"));
local cases, generations, previous_guard = 0, 0, nil;
local function check(value, message)
    assert(value, message); cases = cases + 1;
end;

function AZS_CheckCorePublicationLifetime(generation)
    generations = generations + 1;
    -- These fixtures already executed the entire canonical native core patch.
    -- Addon hooks and placements happen after that core chunk, as in the loader.
    local core_toggle, core_update = ToggleTalentFrame, UpdateTalentButton;
    local hook_calls, update_calls = 0, 0;
    local hooked_toggle = function()
        hook_calls = hook_calls + 1; core_toggle();
        return nil, false, hook_calls;
    end;
    local hooked_update = function()
        update_calls = update_calls + 1; core_update();
    end;
    ToggleTalentFrame, UpdateTalentButton = hooked_toggle, hooked_update;
    TalentMicroButton:Hide(); TalentMicroButton:ClearAllPoints();
    TalentMicroButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 701, 702);
    WorldMapMicroButton:Show(); WorldMapMicroButton:ClearAllPoints();
    WorldMapMicroButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 901, 902);
    for _,frame in ipairs({TalentMicroButton,WorldMapMicroButton}) do
        function frame:IsShown() return self.shown; end;
        function frame:GetNumPoints() return table.getn(self.points); end;
        function frame:GetPoint(index) return (unpack or table.unpack)(self.points[index]); end;
    end;
    local initial_counter = tonumber(AZS_TALENT_TOGGLES);
    local xp_frame, name_frame = AZS_XPText, AZS_NameFit;
    local base_create = CreateFrame;
    local guard_creations = 0;
    AZSTalentInputGuard = nil;
    function CreateFrame(kind, name, parent)
        local frame = base_create(kind, name, parent);
        function frame:SetAllPoints(other) self.all = other; end;
        function frame:SetFrameStrata(value) self.strata = value; end;
        function frame:EnableMouse(value) self.mouse = value; end;
        function frame:EnableMouseWheel(value) self.wheel = value; end;
        if name == "AZSTalentInputGuard" then
            guard_creations = guard_creations + 1;
            check(kind == "Frame" and parent == UIParent, "guard belongs to the real VM root");
            check(frame ~= previous_guard, "replacement VM gets its own guard");
        end;
        return frame;
    end;
    local function publish(active, open)
        -- The Rust header publishes these booleans; source guards bind its clamp.
        AZS_TALENT_ACTIVE, AZS_TALENT_VIEW_OPEN = active, active and open;
        publication();
    end;
    local states = {{false,false},{true,false},{true,true},{true,true},
                    {false,true},{false,false},{true,false},{true,true},{false,false}};
    for _, state in ipairs(states) do
        publish(state[1], state[2]);
        check(ToggleTalentFrame == hooked_toggle, "publication preserves the later addon toggle hook");
        check(UpdateTalentButton == hooked_update, "publication preserves the later addon button hook");
        check(AZS_TALENT_TOGGLES == tostring(initial_counter + hook_calls), "entry/retry/inactive publication does not reset or clear the core counter");
        check(update_calls == 0, "publication never invokes a button hook");
        check(not TalentMicroButton.shown and WorldMapMicroButton.shown, "addon button visibility remains authoritative");
        check(TalentMicroButton.points[1][4] == 701 and TalentMicroButton.points[1][5] == 702,
              "publication never reanchors the talent button");
        check(WorldMapMicroButton.points[1][4] == 901 and WorldMapMicroButton.points[1][5] == 902,
              "publication never reanchors the map button");
        check(AZS_XPText == xp_frame and AZS_NameFit == name_frame, "publication never reinstalls core frames");
        check(UIPARENT_MANAGED_FRAME_POSITIONS.CastingBarFrame.baseY == 113, "core layout offset is applied once");
        if state[1] and state[2] then
            check(AZSTalentInputGuard and AZSTalentInputGuard.shown, "open overlay shows the input guard");
            check(AZSTalentInputGuard.mouse and AZSTalentInputGuard.wheel, "guard owns mouse and the separate wheel sweep");
            check(AZSTalentInputGuard.strata == "FULLSCREEN_DIALOG" and AZSTalentInputGuard.all == UIParent,
                  "guard retains the custom overlay input surface");
            check(type(AZSTalentInputGuard.OnMouseWheel) == "function", "guard has a wheel handler");
            AZSTalentInputGuard.OnMouseWheel();
        else
            check(not AZSTalentInputGuard or not AZSTalentInputGuard.shown, "closed/inactive publication hides the guard");
        end;
        local a,b,c = ToggleTalentFrame();
        check(a == nil and b == false and c == hook_calls, "addon hook retains its return tuple and dispatch");
        check(AZS_TALENT_TOGGLES == tostring(initial_counter + hook_calls), "the original core function remains the counter producer");
    end;
    check(guard_creations == 1, "repeated opens/retry use one guard in this VM");
    previous_guard = AZSTalentInputGuard;
    CreateFrame = base_create;
end;

-- Reuse the complete stock/widget fixture, injecting only the later publication
-- scenario after its ordinary native checks. Keep its original 242 assertions.
local fixture = read("scripts/check-framexml-hud.lua");
local anchor = "    -- A later addon owns its changes; the host must not replay this patch per frame/locale.";
local first = assert(fixture:find(anchor, 1, true));
assert(not fixture:find(anchor, first + #anchor, true));
fixture = fixture:sub(1,first-1).."    AZS_CheckCorePublicationLifetime(generation);\n"..fixture:sub(first);
assert(execute(fixture, "@full-core-with-publication-lifetime-fixture"))();
check(generations == 2, "fresh and replacement core VM fixtures both ran");
print("Passed "..cases.." core/addon/publication lifetime checks across two VM fixtures; Rust/core-loader/rendering remain unexecuted");

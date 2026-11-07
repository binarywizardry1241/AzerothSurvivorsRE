-- Executes the exact extracted Lua with a narrow FrameXML stub; no game/build.
local execute = loadstring or load;
table.getn = table.getn or function(t) return #t; end;
getglobal = function(name) return _G[name]; end;
setglobal = function(name, value) _G[name] = value; end;
GREEN_FONT_COLOR_CODE, GRAY_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE = "<green>", "<gray>", "</color>";
NORMAL_FONT_COLOR = { r = 1, g = 0.8, b = 0.2 };
local created, stock, events = 0, 0, 0;
local function frame(name)
    local f = { shown = true, scripts = {} };
    function f:SetWidth(v) self.width = v; end;
    function f:SetHeight(v) self.height = v; end;
    function f:SetPoint(...) self.point = {...}; end;
    function f:ClearAllPoints() self.point = nil; end;
    function f:EnableMouse(v) self.mouse = v; end;
    function f:SetScript(key, value) self.scripts[key] = value; end;
    function f:SetBackdrop(v) self.backdrop = v; end;
    function f:SetBackdropBorderColor(...) self.border = {...}; end;
    function f:SetText(v) self.text = v; end;
    function f:Show() self.shown = true; end;
    function f:Hide() self.shown = false; end;
    function f:IsVisible() return self.shown; end;
    function f:RegisterEvent(e) assert(e == "CHAT_MSG_ADDON"); events = events + 1; end;
    function f:CreateFontString(n) return frame(n); end;
    _G[name] = f;
    return f;
end;
function CreateFrame(kind, name, parent)
    assert(kind == "Frame" and parent); created = created + 1;
    return frame(name);
end;
PaperDollFrame, CharacterFrame = frame("PaperDollFrame"), frame("CharacterFrame");
CharacterResistanceFrame = frame("CharacterResistanceFrame");
local names = { "CharacterStatFrame1", "CharacterStatFrame2", "CharacterStatFrame3", "CharacterStatFrame4",
    "CharacterStatFrame5", "CharacterArmorFrame", "CharacterAttackFrame", "CharacterAttackPowerFrame",
    "CharacterDamageFrame", "CharacterRangedAttackFrame", "CharacterRangedAttackPowerFrame", "CharacterRangedDamageFrame" };
for _, name in ipairs(names) do frame(name); frame(name.."Label"); frame(name.."StatText"); end;
local setters = { "Stats", "Resistances", "Armor", "Damage", "AttackPower", "AttackBothHands",
    "RangedAttack", "RangedDamage", "RangedAttackPower" };
for _, suffix in ipairs(setters) do
    _G["PaperDollFrame_Set"..suffix] = function(unit, prefix) stock = stock + 1; assert(unit == "pet" or unit == "player" or unit == nil); end;
end;
PaperDollFrame_OnLoad = function() stock = stock + 1; end;
PaperDollFrame_OnEvent = function() stock = stock + 1; end;
GameTooltip = frame("GameTooltip");
function GameTooltip:SetOwner(owner, anchor) self.owner = owner; assert(anchor == "ANCHOR_RIGHT"); end;
function GameTooltip:AddLine(text) self.line = text; end;
local f = assert(io.open("docs/analysis/evidence/run-stats/paperdoll.lua", "rb"));
local source = f:read("*a"); f:close(); assert(execute(source, "native-character-pane"))();
PaperDollFrame_SetStats("player"); assert(stock == 1);
this = PaperDollFrame; PaperDollFrame_OnLoad(); assert(stock == 2 and events == 1);
local fields = { "hp", "dmg", "cd", "crit", "cm", "arm", "area", "cnt", "echo", "spd", "reg", "pick",
    "ghp", "gdmg", "gcd", "gcrit", "gcm", "garm", "garea", "gcnt", "gecho", "gspd", "greg", "gpick", "ggold",
    "lch", "heal", "thn", "liv", "xp", "gold", "luck", "bp", "dots", "doth", "big", "exe", "cc", "dotd", "shd", "auto", "pet" };
local payload = {};
for _, key in ipairs(fields) do payload[#payload+1] = key.."=0"; end;
arg1, arg2 = "AZS", table.concat(payload, ";")..";hp=100;dmg=1.5;cd=0.75;cm=1.5;spd=1.2;pick=9;xp=1;gold=1;ghp=20";
PaperDollFrame_OnEvent("CHAT_MSG_ADDON");
assert(CharacterStatFrame1StatText.text == "100" and CharacterStatFrame2StatText.text == "+50%");
assert(CharacterStatFrame3StatText.text == "+25%" and not CharacterResistanceFrame.shown);
assert(created == 18 and AZSMoreStats.height == 180 and AZSMoreStatsTitle.text == "Run Stats");
for i = 1,17 do assert(AZS_MORE_ROWS[i].shown == (i <= 10)); end;
assert(CharacterStatFrame1.azsText:find("Worn gear: +20 health", 1, true));
assert(not CharacterArmorFrame.azsText:find("Stormguard", 1, true));
AZS_STATS.bwk, AZS_STATS.bwa = 0.15, 1; AZS_Update();
assert(CharacterArmorFrame.azsText:find("<green>Stormguard: +15% Damage Reduction (Active)</color>", 1, true));
AZS_STATS.bwa = 0; AZS_Update();
assert(CharacterArmorFrame.azsText:find("<gray>Stormguard: +15% Damage Reduction (Inactive)</color>", 1, true));
-- Each conditional row admits any nonzero value, including a negative bonus.
for _, key in ipairs({"big", "exe", "cc", "dotd", "shd", "auto", "pet"}) do
    AZS_STATS[key] = -0.1; AZS_Update(); AZS_STATS[key] = 0;
end;
AZS_STATS.pet = 0.2; AZS_Update();
assert(AZS_MORE_ROWS[17].shown and AZS_MORE_ROWS[17].point[5] == -170 and AZSMoreStats.height == 194);
AZS_STATS.pet = 0; AZS_Update(); assert(not AZS_MORE_ROWS[17].shown and created == 18);
this = AZS_MORE_ROWS[1]; AZS_RowEnter(); assert(GameTooltip.owner == this and GameTooltip.shown);
this.scripts.OnLeave(); assert(not GameTooltip.shown);
PaperDollFrame_SetStats("pet"); assert(stock == 3);
PaperDollFrame_SetStats("player"); assert(stock == 3);
-- Hidden panes receive data without touching their widgets; stock Show/setters refresh later.
PaperDollFrame:Hide(); this = PaperDollFrame; arg2 = arg2..";hp=123";
PaperDollFrame_OnEvent("CHAT_MSG_ADDON"); assert(AZS_STATS.hp == 123 and CharacterStatFrame1StatText.text == "100");
PaperDollFrame:Show(); PaperDollFrame_SetStats("player"); assert(CharacterStatFrame1StatText.text == "123");
arg1 = "OTHER"; PaperDollFrame_OnEvent("CHAT_MSG_ADDON"); assert(stock == 3);
PaperDollFrame_OnEvent("UNIT_STATS", "player"); assert(stock == 4);
print("Passed exact native Run Stats Lua: 12 stock rows, 17 extra rows, gear and Stormguard tooltips, player/pet routing and hidden-pane updates; stub host only");

-- Run the exact selected EXE Lua with explicit widget/font/event seams.
-- This executes interpreted Lua, not the game, compiled Rust or a renderer.
local file = assert(io.open("docs/analysis/evidence/hud-framexml/world-state-patch.lua", "rb"));
local patch = file:read("*a"); file:close();
local source = patch;
local execute = loadstring or load;
abs, max = math.abs, math.max;
table.getn = table.getn or function(t) return #t; end;
getglobal = function(name) return _G[name]; end;
local cases = 0;
local function check(value, message) assert(value, message); cases = cases + 1; end;
local function near(a, b) return math.abs(a - b) < 0.000001; end;

for generation = 1, 2 do
    local created, textures, listeners = {}, {}, {};
    local xp, maximum, name = 7, 100, "Hero";
    local function widget(id, parent)
        local w = {name=id, parent=parent, shown=true, points={}, height=43, font="Fonts\\FRIZQT__.TTF", size=12, level=5};
        function w:GetName() return self.name; end;
        function w:GetParent() return self.parent; end;
        function w:SetWidth(x) self.width=x; end;
        function w:SetHeight(x) self.height=x; end;
        function w:ClearAllPoints() self.points={}; end;
        function w:SetPoint(...) table.insert(self.points, {...}); end;
        function w:Show() self.shown=true; end;
        function w:Hide() self.shown=false; end;
        function w:SetTexture(x) self.texture=x; end;
        function w:SetTexCoord(...) self.uv={...}; end;
        function w:SetFrameLevel(x) self.level=x; end;
        function w:GetFrameLevel() return self.level; end;
        function w:SetParent(x) self.parent=x; end;
        function w:CreateTexture(n, layer)
            check(_G[n] == nil, "new texture name must be free in a fresh VM");
            local t=widget(n, self); t.layer=layer; textures[#textures+1]=t; return t;
        end;
        function w:SetText(x) self.text=x; end;
        function w:GetFont() return self.font, self.size, "OUTLINE"; end;
        function w:SetFont(font, size) self.font, self.size=font,size; end;
        function w:RegisterEvent(e) self.events=self.events or {}; self.events[e]=true; listeners[#listeners+1]={self,e}; end;
        function w:SetScript(key, handler) self[key]=handler; end;
        _G[id]=w; return w;
    end;
    function CreateFrame(kind, id, parent)
        check(kind == "Frame", "frame kind");
        local w=widget(id,parent); created[#created+1]=w; return w;
    end;
    function UnitXP(unit) assert(unit=="player"); return xp; end;
    function UnitXPMax(unit) assert(unit=="player"); return maximum; end;
    function UnitName(unit) assert(unit=="player"); return name; end;
    function TEXT(x) return x; end;
    TALENTS_BUTTON="Talents";
    function MicroButtonTooltipText(label, binding) return label..":"..binding; end;
    local names={"UIParent","MainMenuBar","MainMenuBarArtFrame","MainMenuBarMaxLevelBar",
        "MainMenuBarLeftEndCap","MainMenuBarRightEndCap","MainMenuExpBar","MainMenuBarExpText",
        "CharacterMicroButton","TalentMicroButton","SpellbookMicroButton","QuestLogMicroButton",
        "SocialsMicroButton","WorldMapMicroButton","MainMenuMicroButton","HelpMicroButton",
        "ActionBarUpButton","ActionBarDownButton","MainMenuBarPageNumber","MainMenuBarPerformanceBarFrame",
        "MainMenuBarBackpackButton","KeyRingButton","CharacterFrameTab3","CharacterFrameTab4","PlayerName",
        "MultiBarBottomRight","MultiBarRight","MultiBarLeft","GameTooltip"};
    -- A new VM has only the stock objects, including four strips per texture set.
    _G.AZS_MainMenuBarTexture4=nil;
    _G.AZS_RacialRim=nil;
    for _,id in ipairs(names) do widget(id); end;
    for i=0,3 do
        widget("MainMenuBarTexture"..i); widget("MainMenuMaxLevelBar"..i);
        widget("MainMenuXPBarTexture"..i); widget("CharacterBag"..i.."Slot");
    end;
    for i=1,12 do widget("ActionButton"..i, MainMenuBarArtFrame); widget("ActionButton"..i.."HotKey"); end;
    UIPARENT_MANAGED_FRAME_POSITIONS={};
    for _,id in ipairs({"MultiBarBottomLeft","GroupLootFrame1","TutorialFrameParent","FramerateLabel","CastingBarFrame","PETACTIONBAR_YPOS"}) do
        UIPARENT_MANAGED_FRAME_POSITIONS[id]={baseY=100};
    end;
    UIPARENT_MANAGED_FRAME_POSITIONS.Unrelated={baseY=100};
    MainMenuExpBar.TextString=MainMenuBarExpText;
    -- Each VM starts with the ordinary engine/FrameXML functions. The native
    -- patch must wrap them once, before external addons load.
    local stock_toggles, stock_chat, managed = {}, {}, 0;
    function ToggleCharacter(tab) stock_toggles[#stock_toggles+1]=tab; end;
    function ToggleSpellBook() error("stock spellbook must be disabled"); end;
    function ToggleQuestLog() error("stock quest log must be disabled"); end;
    function ToggleFriendsFrame() error("stock social frame must be disabled"); end;
    function ChatFrame_OnEvent(e) stock_chat[#stock_chat+1]={e,this}; end;
    function UIParent_ManageFramePositions() managed=managed+1; end;
    NUM_ALWAYS_UP_UI_FRAMES, NUM_EXTENDED_UI_FRAMES = 3, 3;
    widget("AlwaysUpFrame1"); widget("AlwaysUpFrame3");
    widget("WorldStateCaptureBar1"); widget("WorldStateCaptureBar3");
    _G.AlwaysUpFrame2, _G.WorldStateCaptureBar2 = nil, nil;
    function ActionButton_GetPagedID(button) check(button==this,"tooltip keeps action button"); return 12; end;
    local tooltip_action = true;
    function GameTooltip:SetOwner(owner,anchor) self.owner,self.anchor=owner,anchor; end;
    function GameTooltip:SetAction(slot) check(slot==12,"tooltip keeps paged action ID"); return tooltip_action; end;
    TOOLTIP_UPDATE_TIME=0.2;
    ChatTypeInfo={SYSTEM={r=0.1,g=0.2,b=0.3,id=17}};
    LEVEL_UP="You have reached level %d!"; format=string.format;
    assert(execute(source, "@Interface\\FrameXML\\WorldStateFrame.lua"))();
    WorldStateAlwaysUpFrame_Update();
    check(not AlwaysUpFrame1.shown and not AlwaysUpFrame3.shown and not WorldStateCaptureBar1.shown and not WorldStateCaptureBar3.shown,"all existing world-state rows hidden");
    check(managed==1,"world-state suppression still manages frame positions");
    ToggleSpellBook("spell"); ToggleQuestLog(); ToggleFriendsFrame("FriendsFrame");
    check(AZS_TALENT_TOGGLES=="0","fresh talent counter is a string");
    ToggleTalentFrame(); ToggleTalentFrame();
    check(AZS_TALENT_TOGGLES=="2","native talent binding increments the existing counter");
    AZS_TALENT_TOGGLES="invalid"; ToggleTalentFrame();
    check(AZS_TALENT_TOGGLES=="1","talent counter handles malformed previous text");
    ToggleCharacter("ReputationFrame");
    check(#stock_toggles==0,"reputation tab is rejected before stock dispatch");
    ToggleCharacter("PaperDollFrame"); ToggleCharacter("PetPaperDollFrame");
    check(#stock_toggles==2 and stock_toggles[1]=="PaperDollFrame" and stock_toggles[2]=="PetPaperDollFrame","ordinary character tabs retain stock dispatch");
    check(MainMenuBar.width==397 and MainMenuBar.height==66 and MainMenuBarMaxLevelBar.width==397, "bar bounds");
    check(#textures==2 and #created==3, "one added art strip/racial rim and XP/hidden/name frames");
    check(AZS_MainMenuBarTexture4.layer=="ARTWORK" and AZS_MainMenuBarTexture4.height==43, "fifth strip creation");
    for i,slice in ipairs(AZS_MAIN_BAR_SLICES) do
        local t=i<=4 and _G["MainMenuBarTexture"..(i-1)] or AZS_MainMenuBarTexture4;
        local rows=AZS_MAIN_BAR_ROWS[slice[1]];
        check(t.width==math.abs(slice[3]-slice[2]) and t.points[1][4]==slice[4], "strip width/offset");
        check(near(t.uv[1],slice[2]/256) and near(t.uv[2],slice[3]/256) and t.uv[3]==rows[1] and t.uv[4]==rows[2], "strip UVs");
    end;
    check(AZS_MainMenuBarTexture4.uv[1]>AZS_MainMenuBarTexture4.uv[2], "mirrored micro panel");
    check(MainMenuMaxLevelBar1.width==141 and MainMenuMaxLevelBar1.uv[1]>MainMenuMaxLevelBar1.uv[2], "mirrored max-level rail");
    check(not MainMenuMaxLevelBar2.shown and not MainMenuMaxLevelBar3.shown, "unused stock strips hidden");
    check(MainMenuExpBar.width==393 and MainMenuExpBar.points[1][4]==2 and MainMenuExpBar.points[1][5]==43, "XP inset/height");
    check(MainMenuExpBar.level==MainMenuBar.level and MainMenuExpBar.TextString==nil, "XP text leaves stock hover owner");
    check(MainMenuXPBarTexture0.width==18 and MainMenuXPBarTexture2.width==18, "XP border ends");
    check(#MainMenuXPBarTexture1.points==2 and MainMenuXPBarTexture1.points[2][4]==-9 and not MainMenuXPBarTexture3.shown, "stretch XP center");
    check(MainMenuBarExpText.text=="7 / 100" and MainMenuBarExpText.shown, "initial XP text");
    for _,e in ipairs({"PLAYER_ENTERING_WORLD","PLAYER_XP_UPDATE","PLAYER_LEVEL_UP"}) do
        check(AZS_XPText.events[e], "XP event registration");
        xp=xp+1; maximum=maximum+100; AZS_XPText.OnEvent();
        check(MainMenuBarExpText.text==xp.." / "..maximum and MainMenuBarExpText.shown, "XP event refresh");
    end;
    check(PlayerName.width==120 and AZS_PLAYER_NAME_SIZE==12, "name font captured once");
    for _,n in ipairs({0,1,19,20,21,64}) do
        name=string.rep("a",n); AZS_NameFit.OnEvent();
        check(near(PlayerName.size,n>19 and 12*19/n or 12), "name byte length boundary");
    end;
    name=nil; AZS_NameFit.OnEvent(); check(PlayerName.size==12, "absent name restores base font");
    name=string.rep("é",10); AZS_NameFit.OnEvent(); check(near(PlayerName.size,12*19/#name), "native byte length, including UTF-8");
    AZS_PLAYER_NAME_FONT=nil; AZS_NameFit.OnEvent(); check(near(PlayerName.size,12*19/#name), "missing font gate");
    check(AZS_NameFit.events.PLAYER_ENTERING_WORLD and AZS_NameFit.events.UNIT_NAME_UPDATE, "name event registration");
    for i=7,11 do check(_G["ActionButton"..i].parent==AZS_HiddenBar and not AZS_HiddenBar.shown, "hidden buttons retained"); end;
    check(ActionButton12.points[1][4]==280 and AZS_RacialRim.width==64, "racial slot/rim");
    for _,i in ipairs({1,2,3,4,5,6,12}) do check(not _G["ActionButton"..i.."HotKey"].shown, "hotkey labels hidden"); end;
    check(CharacterMicroButton.points[1][4]==332 and TalentMicroButton.points[1][4]==-3, "micro anchors");
    for _,id in ipairs({"SpellbookMicroButton","QuestLogMicroButton","SocialsMicroButton","WorldMapMicroButton","MainMenuMicroButton","HelpMicroButton","ActionBarUpButton","ActionBarDownButton","MainMenuBarPageNumber","MainMenuBarPerformanceBarFrame","MainMenuBarBackpackButton","KeyRingButton"}) do check(not _G[id].shown, "unused stock widgets hidden"); end;
    for i=0,3 do check(not _G["CharacterBag"..i.."Slot"].shown, "bags hidden"); end;
    for id,position in pairs(UIPARENT_MANAGED_FRAME_POSITIONS) do check(position.baseY==(id=="Unrelated" and 100 or 113), "managed offsets once per VM"); end;
    this=TalentMicroButton; event="UPDATE_BINDINGS"; TalentMicroButton_OnEvent();
    check(this.tooltipText=="Talents:TOGGLETALENTS", "talent binding tooltip");
    event="PLAYER_LEVEL_UP"; this:Hide(); TalentMicroButton_OnEvent(); check(this.shown, "talent button stays available without pulse");
    for _,parent in ipairs({MultiBarBottomRight,MultiBarRight,MultiBarLeft,MainMenuBarArtFrame}) do
        this=ActionButton12; this.parent=parent;
        tooltip_action=true; ActionButton_SetTooltip();
        check(GameTooltip.owner==this and GameTooltip.anchor==(parent==MainMenuBarArtFrame and "ANCHOR_RIGHT" or "ANCHOR_LEFT"),"action tooltip uses button-side anchor");
        check(this.updateTooltip==TOOLTIP_UPDATE_TIME,"successful action tooltip schedules refresh");
        tooltip_action=false; ActionButton_SetTooltip();
        check(this.updateTooltip==nil,"missing action cancels tooltip refresh");
    end;
    this={messages={}};
    function this:AddMessage(...) self.messages[#self.messages+1]={...}; end;
    arg1=7; ChatFrame_OnEvent("PLAYER_LEVEL_UP");
    check(#this.messages==1 and #stock_chat==0,"level-up replaces stock multi-line dispatch");
    local line=this.messages[1];
    check(line[1]=="You have reached level 7!" and line[2]==0.1 and line[3]==0.2 and line[4]==0.3 and line[5]==17,"level-up preserves localized system line and color");
    ChatFrame_OnEvent("CHAT_MSG_SYSTEM");
    check(#stock_chat==1 and stock_chat[1][1]=="CHAT_MSG_SYSTEM" and stock_chat[1][2]==this,"other chat events retain stock context and dispatch");
    -- A later addon owns its changes; the host must not replay this patch per frame/locale.
    MainMenuBar:SetWidth(500); AZS_MainBar_UpdateXPText();
    check(MainMenuBar.width==500 and #textures==2, "event refresh preserves later addon changes");
end;
print("Passed "..cases.." exact native FrameXML Lua checks across two fresh widget fixtures; host/rendering seams remain");

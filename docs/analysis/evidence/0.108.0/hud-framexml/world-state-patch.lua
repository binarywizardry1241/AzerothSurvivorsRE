

-- Azeroth Survivors: no always-up world-state readout.
function WorldStateAlwaysUpFrame_Update()
	local frame;
	for i=1, NUM_ALWAYS_UP_UI_FRAMES do
		frame = getglobal("AlwaysUpFrame"..i);
		if ( frame ) then
			frame:Hide();
		end
	end
	for i=1, NUM_EXTENDED_UI_FRAMES do
		frame = getglobal("WorldStateCaptureBar"..i);
		if ( frame ) then
			frame:Hide();
		end
	end
	UIParent_ManageFramePositions();
end

-- Azeroth Survivors: the talent key and button toggle the run's own talent window (the game
-- watches AZS_TALENT_TOGGLES); no spellbook, quest log, social frame or reputation tab.
function ToggleTalentFrame()
	AZS_TALENT_TOGGLES = tostring((tonumber(AZS_TALENT_TOGGLES) or 0) + 1);
end
AZS_TALENT_TOGGLES = "0";

function ToggleSpellBook(bookType)
end

function ToggleQuestLog()
end

function ToggleFriendsFrame(tab)
end

AZS_ToggleCharacter = ToggleCharacter;
function ToggleCharacter(tab)
	if ( tab == "ReputationFrame" ) then
		return;
	end
	AZS_ToggleCharacter(tab);
end

function UpdateTalentButton()
	TalentMicroButton:Show();
end

-- Azeroth Survivors: the talent button never pulses at a level-up (a run's levels give no
-- talent points: they are spent in the armory).
function TalentMicroButton_OnEvent()
	if ( event == "UPDATE_BINDINGS" ) then
		this.tooltipText = MicroButtonTooltipText(TEXT(TALENTS_BUTTON), "TOGGLETALENTS");
	else
		UpdateTalentButton();
	end
end

SpellbookMicroButton:Hide();
TalentMicroButton:Show();
QuestLogMicroButton:Hide();
SocialsMicroButton:Hide();
WorldMapMicroButton:Hide();
MainMenuMicroButton:Hide();
HelpMicroButton:Hide();

-- Azeroth Survivors: a short main bar between the gryphons. A row of sockets: the six spells, a carved
-- divider, the racial (ActionButton12, the server's last slot) in a gold-rimmed socket of its
-- own, and the character and talent buttons in a panel at the end; on it the experience bar in
-- the cast bar's framing, its numbers always up. No paging, bags, keyring, latency meter or
-- hotkey labels (the bar's spells cast on their own). The stock art is cut into slices ({strip,
-- u0, u1, x}: the strip's texels u0 to u1, mirrored when u0 > u1, at x): the first six sockets,
-- the oval column beside the stock page arrows, one more socket, and the micro buttons' panel as
-- its left half and that half mirrored. Every stock frame keeps its name and the unused buttons
-- wait in a hidden frame, so an addon that rebuilds the bars finds them all where it looks.
AZS_MAIN_BAR_WIDTH = 397;
AZS_MAIN_BAR_HEIGHT = 66;
AZS_MAIN_BAR_SLICES = { {0, 0, 256, 0}, {2, 18, 39, 256}, {1, 1, 45, 277}, {2, 28, 66, 321}, {2, 66, 28, 359} };
AZS_MAX_LEVEL_BAR_SLICES = { {0, 0, 256, 0}, {0, 141, 0, 256} };
-- The experience bar's inset from the bar's sides (its ends under the gryphons' heads), and its
-- bottom above the sockets, its frame's bottom rail on their top one.
AZS_XP_BAR_INSET = 2;
AZS_XP_BAR_Y = 43;
AZS_MAIN_BAR_ROWS = { [0] = {0.83203125, 1.0}, {0.58203125, 0.75}, {0.33203125, 0.5}, {0.08203125, 0.25} };
AZS_MAX_LEVEL_BAR_ROWS = { [0] = {0, 0.21875}, {0.25, 0.46875}, {0.5, 0.71875}, {0.75, 0.96875} };

function AZS_MainBar_Slice(texture, file, rows, slice, anchor, relativePoint, y)
	local strip, u0, u1 = slice[1], slice[2], slice[3];
	texture:SetTexture(file);
	texture:SetTexCoord(u0 / 256, u1 / 256, rows[strip][1], rows[strip][2]);
	texture:SetWidth(abs(u1 - u0));
	texture:ClearAllPoints();
	texture:SetPoint("BOTTOMLEFT", anchor, relativePoint, slice[4], y);
	texture:Show();
end

-- The stock textures `prefix`0 to 3 and, past them, new ones on `parent`, one per slice; the stock
-- ones left over hidden.
function AZS_MainBar_Slices(prefix, parent, height, file, rows, slices, relativePoint, y)
	local n = table.getn(slices);
	for i = 0, max(n, 4) - 1 do
		local texture = getglobal(prefix..i);
		if ( not texture and i < n ) then
			texture = parent:CreateTexture("AZS_"..prefix..i, "ARTWORK");
			texture:SetHeight(height);
		end
		if ( i < n ) then
			AZS_MainBar_Slice(texture, file, rows, slices[i + 1], parent:GetName(), relativePoint, y);
		elseif ( texture ) then
			texture:Hide();
		end
	end
end

MainMenuBar:SetWidth(AZS_MAIN_BAR_WIDTH);
MainMenuBar:SetHeight(AZS_MAIN_BAR_HEIGHT);
MainMenuBarMaxLevelBar:SetWidth(AZS_MAIN_BAR_WIDTH);
AZS_MainBar_Slices("MainMenuBarTexture", MainMenuBarArtFrame, 43, "Interface\\MainMenuBar\\UI-MainMenuBar-Dwarf", AZS_MAIN_BAR_ROWS, AZS_MAIN_BAR_SLICES, "BOTTOMLEFT", 0);
AZS_MainBar_Slices("MainMenuMaxLevelBar", MainMenuBarMaxLevelBar, 7, "Interface\\MainMenuBar\\UI-MainMenuBar-MaxLevel", AZS_MAX_LEVEL_BAR_ROWS, AZS_MAX_LEVEL_BAR_SLICES, "TOPLEFT", 0);
MainMenuBarLeftEndCap:ClearAllPoints();
MainMenuBarLeftEndCap:SetPoint("BOTTOM", "MainMenuBarArtFrame", "BOTTOMLEFT", -32, 0);
MainMenuBarRightEndCap:ClearAllPoints();
MainMenuBarRightEndCap:SetPoint("BOTTOM", "MainMenuBarArtFrame", "BOTTOMRIGHT", 32, 0);

-- The experience bar on the sockets, framed by the cast bar's border (its rows 16 to 48, whose
-- 28th row is the bar's top, as on the cast bar): its knobbed ends, and between them its middle
-- stretched.
MainMenuExpBar:ClearAllPoints();
MainMenuExpBar:SetPoint("BOTTOMLEFT", "MainMenuBar", "BOTTOMLEFT", AZS_XP_BAR_INSET, AZS_XP_BAR_Y);
MainMenuExpBar:SetWidth(AZS_MAIN_BAR_WIDTH - 2 * AZS_XP_BAR_INSET);
-- Under the art frame, so the gryphons' heads lie over its ends.
MainMenuExpBar:SetFrameLevel(MainMenuBar:GetFrameLevel());
for i, part in ipairs({ {22, 40, "BOTTOMLEFT", -9}, {40, 216}, {216, 234, "BOTTOMRIGHT", 9} }) do
	local texture = getglobal("MainMenuXPBarTexture"..(i - 1));
	texture:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border");
	texture:SetTexCoord(part[1] / 256, part[2] / 256, 0.25, 0.75);
	texture:SetHeight(32);
	texture:ClearAllPoints();
	if ( part[3] ) then
		texture:SetWidth(part[2] - part[1]);
		texture:SetPoint(part[3], "MainMenuExpBar", part[3], part[4], -7);
	else
		texture:SetPoint("BOTTOMLEFT", "MainMenuExpBar", "BOTTOMLEFT", 9, -7);
		texture:SetPoint("BOTTOMRIGHT", "MainMenuExpBar", "BOTTOMRIGHT", -9, -7);
	end
end
MainMenuXPBarTexture3:Hide();

-- Its numbers always up, written here on each change: the stock text comes and goes with the
-- mouse (TextStatusBar's hover count), so the bar gives it up.
MainMenuExpBar.TextString = nil;
function AZS_MainBar_UpdateXPText()
	MainMenuBarExpText:SetText(UnitXP("player").." / "..UnitXPMax("player"));
	MainMenuBarExpText:Show();
end
AZS_XPText = CreateFrame("Frame", "AZS_XPText", MainMenuExpBar);
AZS_XPText:RegisterEvent("PLAYER_ENTERING_WORLD");
AZS_XPText:RegisterEvent("PLAYER_XP_UPDATE");
AZS_XPText:RegisterEvent("PLAYER_LEVEL_UP");
AZS_XPText:SetScript("OnEvent", AZS_MainBar_UpdateXPText);
AZS_MainBar_UpdateXPText();

-- What stands above the bar stands as much higher as the bar grew.
for _, name in ipairs({ "MultiBarBottomLeft", "GroupLootFrame1", "TutorialFrameParent", "FramerateLabel", "CastingBarFrame", "PETACTIONBAR_YPOS" }) do
	local position = UIPARENT_MANAGED_FRAME_POSITIONS[name];
	if ( position ) then
		position.baseY = position.baseY + AZS_MAIN_BAR_HEIGHT - 53;
	end
end

AZS_HiddenBar = CreateFrame("Frame", "AZS_HiddenBar", UIParent);
AZS_HiddenBar:Hide();
for i = 7, 11 do
	getglobal("ActionButton"..i):SetParent(AZS_HiddenBar);
end
ActionButton12:ClearAllPoints();
ActionButton12:SetPoint("BOTTOMLEFT", "MainMenuBarArtFrame", "BOTTOMLEFT", 280, 4);
AZS_RacialRim = MainMenuBarArtFrame:CreateTexture("AZS_RacialRim", "OVERLAY");
AZS_RacialRim:SetTexture("Interface\\Buttons\\UI-EmptySlot");
AZS_RacialRim:SetWidth(64);
AZS_RacialRim:SetHeight(64);
AZS_RacialRim:SetPoint("CENTER", "ActionButton12", "CENTER", 0, 0);
for _, i in ipairs({ 1, 2, 3, 4, 5, 6, 12 }) do
	getglobal("ActionButton"..i.."HotKey"):Hide();
end
CharacterMicroButton:ClearAllPoints();
CharacterMicroButton:SetPoint("BOTTOMLEFT", "MainMenuBarArtFrame", "BOTTOMLEFT", 332, 2);
TalentMicroButton:ClearAllPoints();
TalentMicroButton:SetPoint("BOTTOMLEFT", "CharacterMicroButton", "BOTTOMRIGHT", -3, 0);

ActionBarUpButton:Hide();
ActionBarDownButton:Hide();
MainMenuBarPageNumber:Hide();
MainMenuBarPerformanceBarFrame:Hide();
MainMenuBarBackpackButton:Hide();
for i = 0, 3 do
	getglobal("CharacterBag"..i.."Slot"):Hide();
end
KeyRingButton:Hide();
function MainMenuBar_UpdateKeyRing()
end
function ActionBar_PageUp()
end
function ActionBar_PageDown()
end

CharacterFrameTab3:Hide();
CharacterFrameTab4:SetPoint("LEFT", "CharacterFrameTab3", "LEFT", 0, 0);

-- Azeroth Survivors: a hero's name up to twenty letters with a space whole on the player frame:
-- the name's line as wide as its box, its font a little smaller past nineteen.
PlayerName:SetWidth(120);
AZS_PLAYER_NAME_FONT, AZS_PLAYER_NAME_SIZE = PlayerName:GetFont();
function AZS_FitPlayerName()
	local n = string.len(UnitName("player") or "");
	if ( AZS_PLAYER_NAME_FONT and AZS_PLAYER_NAME_SIZE ) then
		local size = AZS_PLAYER_NAME_SIZE;
		if ( n > 19 ) then
			size = size * 19 / n;
		end
		PlayerName:SetFont(AZS_PLAYER_NAME_FONT, size);
	end
end
AZS_NameFit = CreateFrame("Frame", "AZS_NameFit");
AZS_NameFit:RegisterEvent("PLAYER_ENTERING_WORLD");
AZS_NameFit:RegisterEvent("UNIT_NAME_UPDATE");
AZS_NameFit:SetScript("OnEvent", AZS_FitPlayerName);

-- Azeroth Survivors: a spell's tooltip beside its action button, never in the screen's corner
-- (the stock "UberTooltips" branch).
function ActionButton_SetTooltip()
	if ( this:GetParent() == MultiBarBottomRight or this:GetParent() == MultiBarRight or this:GetParent() == MultiBarLeft ) then
		GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	else
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
	end
	if ( GameTooltip:SetAction(ActionButton_GetPagedID(this)) ) then
		this.updateTooltip = TOOLTIP_UPDATE_TIME;
	else
		this.updateTooltip = nil;
	end
end

-- Azeroth Survivors: a level-up says only its level. The run's own line tells what it gave, and
-- the stock "You have gained 0 hit points." (no health on the event) never shows.
local AZS_ChatFrame_OnEvent = ChatFrame_OnEvent;
function ChatFrame_OnEvent(event)
	if ( event == "PLAYER_LEVEL_UP" ) then
		local info = ChatTypeInfo["SYSTEM"];
		this:AddMessage(format(TEXT(LEVEL_UP), arg1), info.r, info.g, info.b, info.id);
		return;
	end
	AZS_ChatFrame_OnEvent(event);
end

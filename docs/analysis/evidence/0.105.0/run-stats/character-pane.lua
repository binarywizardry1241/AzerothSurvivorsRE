

-- Azeroth Survivors: the run's numbers on the character pane, off the server's addon line.
AZS_STATS = nil;

function AZS_Parse(msg)
	local t = {};
	local pos = 1;
	while ( true ) do
		local s, e, k, v = string.find(msg, "(%w+)=([^;]*)", pos);
		if ( not s ) then
			break;
		end
		t[k] = tonumber(v) or 0;
		pos = e + 1;
	end
	return t;
end

function AZS_Pct(v)
	return string.format("%+.0f%%", v * 100);
end

function AZS_Gear(v, text)
	if ( v and v ~= 0 ) then
		return "\n"..GREEN_FONT_COLOR_CODE.."Worn gear: "..text..FONT_COLOR_CODE_CLOSE;
	end
	return "";
end

function AZS_RowEnter()
	GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
	GameTooltip:SetText(this.azsTitle, 1.0, 1.0, 1.0);
	GameTooltip:AddLine(this.azsText, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
	GameTooltip:Show();
end

function AZS_Row(name, label, value, text)
	local frame = getglobal(name);
	if ( not frame ) then
		return;
	end
	getglobal(name.."Label"):SetText(label..":");
	getglobal(name.."StatText"):SetText(value);
	frame.azsTitle = label.." "..value;
	frame.azsText = text;
	if ( not frame.azs ) then
		frame.azs = 1;
		frame:SetScript("OnEnter", AZS_RowEnter);
	end
end

function AZS_Update()
	local s = AZS_STATS;
	AZS_Row("CharacterStatFrame1", "Health", string.format("%.0f", s.hp),
		"The most health you can have."..AZS_Gear(s.ghp, string.format("+%.0f health", s.ghp)));
	AZS_Row("CharacterStatFrame2", "Damage", AZS_Pct(s.dmg - 1),
		"Every spell you cast deals this much more damage. It grows with your level, gear, talents, jewelry and buffs."
		..AZS_Gear(s.gdmg, AZS_Pct(s.gdmg).." damage"));
	AZS_Row("CharacterStatFrame3", "Haste", AZS_Pct(1 - s.cd),
		"Your spells come back this much sooner."
		..AZS_Gear(s.gcd, AZS_Pct(s.gcd).." cooldown reduction"));
	AZS_Row("CharacterStatFrame4", "Crit", string.format("%.1f%%", s.crit * 100),
		"The chance a spell strikes critically. Past 100%, the rest adds to your critical damage."
		..AZS_Gear(s.gcrit, AZS_Pct(s.gcrit).." critical strike"));
	AZS_Row("CharacterStatFrame5", "Crit Dmg", string.format("%.0f%%", s.cm * 100),
		"A critical strike deals this much of a spell's damage."
		..AZS_Gear(s.gcm, AZS_Pct(s.gcm).." critical damage"));
	AZS_Row("CharacterArmorFrame", "Armor", string.format("%.0f%%", s.arm * 100),
		"Damage you take is reduced by this much (60% at most)."
		..AZS_Gear(s.garm, AZS_Pct(s.garm).." damage reduction"));
	AZS_Row("CharacterAttackFrame", "Area", AZS_Pct(s.area - 1),
		"Your spells' areas and ranges are this much larger."
		..AZS_Gear(s.garea, AZS_Pct(s.garea).." area"));
	AZS_Row("CharacterAttackPowerFrame", "Targets", string.format("+%d", s.cnt),
		"Every spell that picks its targets picks this many more."
		..AZS_Gear(s.gcnt, string.format("+%d targets", s.gcnt)));
	AZS_Row("CharacterDamageFrame", "Echo", string.format("%.0f%%", s.echo * 100),
		"The chance a spell strikes twice. Past 100%, every spell strikes twice and the rest is the chance of a third."
		..AZS_Gear(s.gecho, AZS_Pct(s.gecho).." echo"));
	AZS_Row("CharacterRangedAttackFrame", "Speed", AZS_Pct(s.spd - 1),
		"You run this much faster."..AZS_Gear(s.gspd, AZS_Pct(s.gspd).." movement speed"));
	AZS_Row("CharacterRangedAttackPowerFrame", "Regen", string.format("%.1f", s.reg),
		"Health you regain every second."
		..AZS_Gear(s.greg, string.format("+%.1f health per second", s.greg)));
	AZS_Row("CharacterRangedDamageFrame", "Pickup", string.format("%.0f yd", s.pick),
		"Experience and gold fly to you from this far."
		..AZS_Gear(s.gpick, AZS_Pct(s.gpick).." pickup range"));
	CharacterResistanceFrame:Hide();
	AZS_UpdateMore();
end

-- The rest of the run's numbers, in a panel beside the pane: always the first rows, the
-- conditional damage rows only once something raises them.
AZS_MORE_ROWS = {};

function AZS_MoreRow(i)
	local row = AZS_MORE_ROWS[i];
	if ( row ) then
		return row;
	end
	row = CreateFrame("Frame", "AZSMoreStat"..i, AZSMoreStats);
	row:SetWidth(156);
	row:SetHeight(13);
	row:EnableMouse(1);
	row:SetScript("OnEnter", AZS_RowEnter);
	row:SetScript("OnLeave", function() GameTooltip:Hide(); end);
	row.label = row:CreateFontString("AZSMoreStat"..i.."Label", "OVERLAY", "GameFontNormalSmall");
	row.label:SetPoint("LEFT", row, "LEFT", 0, 0);
	row.value = row:CreateFontString("AZSMoreStat"..i.."StatText", "OVERLAY", "GameFontHighlightSmall");
	row.value:SetPoint("RIGHT", row, "RIGHT", 0, 0);
	AZS_MORE_ROWS[i] = row;
	return row;
end

function AZS_UpdateMore()
	if ( not AZSMoreStats ) then
		AZSMoreStats = CreateFrame("Frame", "AZSMoreStats", PaperDollFrame);
		AZSMoreStats:SetWidth(180);
		AZSMoreStats:SetPoint("TOPLEFT", CharacterFrame, "TOPRIGHT", -34, -14);
		AZSMoreStats:SetBackdrop({
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 16, edgeSize = 16,
			insets = { left = 4, right = 4, top = 4, bottom = 4 },
		});
		AZSMoreStats:SetBackdropBorderColor(0.6, 0.6, 0.6, 1.0);
		local title = AZSMoreStats:CreateFontString("AZSMoreStatsTitle", "OVERLAY", "GameFontNormal");
		title:SetPoint("TOP", AZSMoreStats, "TOP", 0, -10);
		title:SetText("Run Stats");
	end
	local s = AZS_STATS;
	local rows = {
		{ "Lifesteal", string.format("%.1f%%", s.lch * 100), "Heals you for this much of all the damage you deal.", true },
		{ "Kill Heal", string.format("%.0f", s.heal), "Every kill heals you for this much.", true },
		{ "Thorns", string.format("%.0f%%", s.thn * 100), "This much of the melee damage you take is dealt back to the attacker.", true },
		{ "Lives", string.format("%d", s.liv), "Times you rise again instead of dying.", true },
		{ "Experience", AZS_Pct(s.xp - 1), "You gain this much more experience.", true },
		{ "Gold", AZS_Pct(s.gold - 1), "You find this much more gold."..AZS_Gear(s.ggold, AZS_Pct(s.ggold).." gold"), true },
		{ "Luck", AZS_Pct(s.luck), "Better odds of rarer upgrades when you level up.", true },
		{ "Buff Power", AZS_Pct(s.bp), "Your damage, haste, shield and thorns buffs are this much stronger.", true },
		{ "DoT Stacks", string.format("%d", s.dots), "How many of each of your damage-over-time effects one enemy carries at once.", true },
		{ "DoT Haste", AZS_Pct(s.doth), "Your damage-over-time effects tick this much faster.", true },
		{ "Vs Elites", AZS_Pct(s.big), "More damage to elites and bosses.", s.big ~= 0 },
		{ "Execute", AZS_Pct(s.exe), "More damage to enemies below 30% health.", s.exe ~= 0 },
		{ "Vs Controlled", AZS_Pct(s.cc), "More damage to rooted, stunned, slowed or fleeing enemies.", s.cc ~= 0 },
		{ "Vs Afflicted", AZS_Pct(s.dotd), "More damage to enemies carrying one of your damage-over-time effects.", s.dotd ~= 0 },
		{ "Shielded", AZS_Pct(s.shd), "More damage while you hold an absorb shield.", s.shd ~= 0 },
		{ "Melee", AZS_Pct(s.auto), "Your melee swings deal this much more damage.", s.auto ~= 0 },
		{ "Pet Damage", AZS_Pct(s.pet), "Your pets deal this much more damage.", s.pet ~= 0 },
	};
	local n = 0;
	for i = 1, table.getn(rows) do
		local r = rows[i];
		local row = AZS_MoreRow(i);
		if ( r[4] ) then
			row:ClearAllPoints();
			row:SetPoint("TOPLEFT", AZSMoreStats, "TOPLEFT", 12, -30 - 14 * n);
			row.label:SetText(r[1]..":");
			row.value:SetText(r[2]);
			row.azsTitle = r[1].." "..r[2];
			row.azsText = r[3];
			row:Show();
			n = n + 1;
		else
			row:Hide();
		end
	end
	AZSMoreStats:SetHeight(40 + 14 * n);
	AZSMoreStats:Show();
end

-- Each stock setter stands aside for the hero once the numbers came; the pet's pane is its own.
function AZS_Wrap(name)
	local stock = getglobal(name);
	setglobal(name, function(unit, prefix)
		if ( AZS_STATS and ( not unit or unit == "player" ) ) then
			AZS_Update();
		else
			stock(unit, prefix);
		end
	end);
end
AZS_Wrap("PaperDollFrame_SetStats");
AZS_Wrap("PaperDollFrame_SetResistances");
AZS_Wrap("PaperDollFrame_SetArmor");
AZS_Wrap("PaperDollFrame_SetDamage");
AZS_Wrap("PaperDollFrame_SetAttackPower");
AZS_Wrap("PaperDollFrame_SetAttackBothHands");
AZS_Wrap("PaperDollFrame_SetRangedAttack");
AZS_Wrap("PaperDollFrame_SetRangedDamage");
AZS_Wrap("PaperDollFrame_SetRangedAttackPower");

AZS_StockOnLoad = PaperDollFrame_OnLoad;
function PaperDollFrame_OnLoad()
	AZS_StockOnLoad();
	this:RegisterEvent("CHAT_MSG_ADDON");
end

AZS_StockOnEvent = PaperDollFrame_OnEvent;
function PaperDollFrame_OnEvent(event, unit)
	if ( event == "CHAT_MSG_ADDON" ) then
		if ( arg1 == "AZS" ) then
			AZS_STATS = AZS_Parse(arg2);
			if ( this:IsVisible() ) then
				AZS_Update();
			end
		end
		return;
	end
	AZS_StockOnEvent(event, unit);
end

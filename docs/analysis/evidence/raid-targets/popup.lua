

-- Azeroth Survivors: anyone puts raid marks on, alone or in a party, the host's hero or a
-- guest's (the stock menu offers them only to a party's leader); never on another player who is
-- no friend, as the stock menu does.
local AZS_UnitPopup_HideButtons = UnitPopup_HideButtons;
function UnitPopup_HideButtons()
	AZS_UnitPopup_HideButtons();
	local dropdownMenu = getglobal(UIDROPDOWNMENU_INIT_MENU);
	for index, value in UnitPopupMenus[dropdownMenu.which] do
		if ( strsub(value, 1, 12) == "RAID_TARGET_" ) then
			UnitPopupShown[index] = 1;
			if ( dropdownMenu.which ~= "SELF" and UnitExists("target") and UnitIsPlayer("target")
				and not UnitPlayerOrPetInParty("target") and not UnitCanCooperate("player", "target")
				and not UnitIsUnit("target", "player") ) then
				UnitPopupShown[index] = 0;
			end
		end
	end
end
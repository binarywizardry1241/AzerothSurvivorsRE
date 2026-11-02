

-- Azeroth Survivors: no graveyard to release to.
local AZS_StaticPopup_Show = StaticPopup_Show;
function StaticPopup_Show(which, text_arg1, text_arg2, data)
	if which == "DEATH" then return nil; end
	return AZS_StaticPopup_Show(which, text_arg1, text_arg2, data);
end

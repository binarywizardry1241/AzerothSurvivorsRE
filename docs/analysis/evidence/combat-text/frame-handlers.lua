-- Called once a world frame after this frame's camera, before the paint: what a handler anchors
-- draws with this frame's view, where OnUpdate, which runs ahead of the camera, is a frame behind.
AZS_CT_HANDLERS = {};

function AZS_RegisterCombatTextFrameHandler(handler)
	for i = 1, table.getn(AZS_CT_HANDLERS) do
		if ( AZS_CT_HANDLERS[i] == handler ) then
			return;
		end
	end
	table.insert(AZS_CT_HANDLERS, handler);
end

function AZS_UnregisterCombatTextFrameHandler(handler)
	for i = table.getn(AZS_CT_HANDLERS), 1, -1 do
		if ( AZS_CT_HANDLERS[i] == handler ) then
			table.remove(AZS_CT_HANDLERS, i);
		end
	end
end

function AZS_CombatTextFrame()
	for i = 1, table.getn(AZS_CT_HANDLERS) do
		local ok, err = pcall(AZS_CT_HANDLERS[i]);
		if ( not ok and geterrorhandler ) then
			geterrorhandler()(err);
		end
	end
end


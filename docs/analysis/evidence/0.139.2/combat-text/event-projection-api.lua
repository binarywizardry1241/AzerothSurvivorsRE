-- Outgoing combat text with a world anchor per hit, the client's own feed: what it keeps and for
-- how long is `CombatTextAnchorsPlugin`'s (its constants are the numbers stated here).
function AZS_CTErr(code, message)
	return nil, { code = code, message = message };
end

-- The offsets a SetPoint on WorldFrame's bottom left takes, whatever an addon did to it.
function AZS_CTSeat()
	if ( WorldFrame ) then
		return { scale = WorldFrame:GetEffectiveScale(), left = WorldFrame:GetLeft(), bottom = WorldFrame:GetBottom() };
	end
	return nil;
end

function AZS_GetCombatTextCapabilities(...)
	if ( arg.n ~= 0 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetCombatTextCapabilities takes no arguments");
	end
	return { apiVersion = 1, impactAnchors = true, followAnchors = true, frameProjection = true,
		distanceMetrics = true, playerDistanceMetrics = true, frameHandler = true, maxEventsPerRead = 256, maxAnchorsPerRead = 256,
		eventCapacity = 4096, anchorCapacity = 4096, eventRetentionSeconds = 5, anchorRetentionSeconds = 5 }, nil;
end

function AZS_GetCombatTextEvents(...)
	if ( arg.n > 2 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_GetCombatTextEvents takes a cursor and a limit");
	end
	local read = AZS_NativeCombatTextEvents;
	if ( type(read) ~= "function" ) then
		return AZS_CTErr("NOT_READY", "the feed starts with the first frame");
	end
	return read(arg[1], arg[2], GetTime());
end

function AZS_ProjectCombatTextAnchors(...)
	if ( arg.n ~= 2 ) then
		return AZS_CTErr("INVALID_ARGUMENT", "AZS_ProjectCombatTextAnchors takes anchorIds and a mode");
	end
	local project = AZS_NativeCombatTextProject;
	if ( type(project) ~= "function" ) then
		return AZS_CTErr("NOT_READY", "the feed starts with the first frame");
	end
	return project(arg[1], arg[2], GetTime(), AZS_CTSeat());
end


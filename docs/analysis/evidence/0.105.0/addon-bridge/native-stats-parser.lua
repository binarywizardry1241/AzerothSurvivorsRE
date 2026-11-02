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

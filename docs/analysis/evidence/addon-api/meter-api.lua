

-- Azeroth Survivors: the version 1 meter API (README "For addon authors"). Lua 5.0: no `#`, no
-- `select`, varargs through `arg`.
AZS_ML = { inWorld = false, world = 1, seen = false, req = {}, cps = {}, ncp = 0, serial = 0 };
AZS_ML_LANGS = { "en", "pl", "cs", "de", "pt", "es", "fr", "ro", "tr", "ru", "uk", "zh", "ja", "ko" };
AZS_ML_MAXCP = 64;
AZS_ML_STEP = 0.2;

AZS_ML_ERRS = {
	INVALID_ARGUMENT = { false }, UNSUPPORTED_VERSION = { false }, UNSUPPORTED_QUERY = { false },
	NO_WORLD = { true, 1 }, NO_PLAYER = { true, 0.2 }, NO_RUN = { true, 1 }, RUN_MISMATCH = { false },
	NOT_READY = { true, 0.2 }, NO_PARTY = { true, 1 }, NO_ENCOUNTER = { true, 0.2 },
	UNKNOWN_OWNER = { false }, OWNER_NOT_PRESENT = { true, 1 }, INVALID_CHECKPOINT = { false },
	CHECKPOINT_EXPIRED = { false }, CHECKPOINT_INVALIDATED = { false }, RESOURCE_LIMIT = { false },
	UNKNOWN_PORTRAIT = { false }, ART_NOT_READY = { true, 0.2 }, ART_UNAVAILABLE = { false },
	INTERNAL_ERROR = { true, 1 },
};

-- Every feature of the version 1 contract this game supplies.
AZS_ML_FEATURES = {
	liveInstancePosition = true, completeSourceBreakdowns = true, partySourceBreakdowns = true,
	partyHealing = true, performedHealing = true, nativeSourceIcons = true, currentLoadouts = true,
	partyLoadouts = true, retainedPortraits = true, atomicCheckpoints = true,
	nativeRecentWindows = true, localizedMetadata = true,
};

function AZS_MErr(code, message, argument, reason)
	local d = AZS_ML_ERRS[code];
	local e = { code = code, message = message, retryable = d[1] };
	if ( d[1] ) then
		e.retryAfterSeconds = d[2];
	end
	if ( argument ) then
		e.argument = argument;
	end
	if ( reason ) then
		e.reason = reason;
	end
	return nil, e;
end

function AZS_MBad(path, what)
	return AZS_MErr("INVALID_ARGUMENT", what or ("invalid " .. path), path);
end

-- ── text and numbers ─────────────────────────────────────────────────────────────────────────

function AZS_MUnesc(s)
	if ( not s ) then
		return "";
	end
	return (string.gsub(s, "%%(%x%x)", function(h) return string.char(tonumber(h, 16)); end));
end

function AZS_MEsc(s)
	return (string.gsub(s, "([%%|:])", function(c) return string.format("%%%02X", string.byte(c)); end));
end

-- `s` split on the one character `sep`, empty pieces kept.
function AZS_MSplit(s, sep)
	local out = {};
	local pos = 1;
	while ( true ) do
		local i = string.find(s, sep, pos, 1);
		if ( not i ) then
			table.insert(out, string.sub(s, pos));
			return out;
		end
		table.insert(out, string.sub(s, pos, i - 1));
		pos = i + 1;
	end
end

function AZS_MOpt(v)
	v = AZS_MUnesc(v);
	if ( v == "" ) then
		return nil;
	end
	return v;
end

function AZS_MKeys(v)
	local out = {};
	if ( not v or v == "" ) then
		return out;
	end
	local parts = AZS_MSplit(v, "~");
	for i = 1, table.getn(parts) do
		table.insert(out, AZS_MUnesc(parts[i]));
	end
	return out;
end

-- Bytewise order, whatever the locale.
function AZS_MLess(a, b)
	if ( a == b ) then
		return false;
	end
	local la, lb = string.len(a), string.len(b);
	local n = la;
	if ( lb < n ) then
		n = lb;
	end
	for i = 1, n do
		local x, y = string.byte(a, i), string.byte(b, i);
		if ( x ~= y ) then
			return x < y;
		end
	end
	return la < lb;
end

function AZS_MMod(a, m)
	return a - math.floor(a / m) * m;
end

function AZS_MHash(s)
	local h1, h2 = 5381, 52711;
	for i = 1, string.len(s) do
		local b = string.byte(s, i);
		h1 = AZS_MMod(h1 * 33 + b, 16777213);
		h2 = AZS_MMod(h2 * 31 + b, 16777199);
	end
	return string.format("%06x%06x", h1, h2);
end

function AZS_MIsInt(v)
	return type(v) == "number" and v == v and v >= 0 and v <= 9007199254740991 and math.floor(v) == v;
end

function AZS_MIsId(v)
	return type(v) == "string" and v ~= "";
end

function AZS_MCopy(v)
	if ( type(v) ~= "table" ) then
		return v;
	end
	local out = {};
	for k, x in pairs(v) do
		out[k] = AZS_MCopy(x);
	end
	return out;
end

function AZS_MCVar(name)
	if ( not GetCVar ) then
		return nil;
	end
	local ok, v = pcall(GetCVar, name);
	if ( ok and type(v) == "string" and v ~= "" ) then
		return v;
	end
	return nil;
end

function AZS_MProcessTag()
	return AZS_MCVar("azsProcess") or AZS_ML.fallbackTag;
end

-- The game's language code, before any run too.
function AZS_MLang()
	local code = AZS_MCVar("azsLanguage");
	for i = 1, table.getn(AZS_ML_LANGS) do
		if ( AZS_ML_LANGS[i] == code ) then
			return code;
		end
	end
	if ( AZS_ML.st ) then
		return AZS_ML.st.lang;
	end
	return "en";
end

AZS_ML.fallbackTag = "p" .. string.gsub(string.format("%.3f", GetTime()), "%.", "");
AZS_ML.ui = "u" .. string.gsub(string.format("%.3f", GetTime()), "%.", "") .. "-" .. AZS_MHash(AZS_MProcessTag() .. "|ui");

-- The unknown keys of request table `q`: a non-string key is "query"'s fault, else the bytewise
-- first unknown name.
function AZS_MUnknown(q, declared, path)
	local bad = false;
	local unknown = {};
	local k = next(q);
	while ( k ~= nil ) do
		if ( type(k) ~= "string" ) then
			bad = true;
		elseif ( not declared[k] ) then
			table.insert(unknown, k);
		end
		k = next(q, k);
	end
	if ( bad ) then
		return path;
	end
	if ( table.getn(unknown) > 0 ) then
		table.sort(unknown, AZS_MLess);
		return path .. "." .. unknown[1];
	end
	return nil;
end

-- ── the feed ─────────────────────────────────────────────────────────────────────────────────

function AZS_MRequest(what)
	local now = GetTime();
	if ( AZS_ML.req[what] and now - AZS_ML.req[what] < 1 ) then
		return;
	end
	AZS_ML.req[what] = now;
	if ( SendAddonMessage ) then
		pcall(SendAddonMessage, "AZSMREQ", what, "PARTY");
	end
end

function AZS_MEpoch(st)
	return st.ep .. "." .. st.lep;
end

-- A line of the feed: kept until its frame is whole, then applied.
function AZS_MOnFeed(msg)
	local bar = string.find(msg, "|", 1, 1);
	if ( not bar ) then
		return;
	end
	local h = {};
	local items = AZS_MSplit(string.sub(msg, 1, bar - 1), ";");
	for i = 1, table.getn(items) do
		local eq = string.find(items[i], "=", 1, 1);
		if ( eq ) then
			h[string.sub(items[i], 1, eq - 1)] = tonumber(string.sub(items[i], eq + 1));
		end
	end
	if ( h.v ~= 1 or not h.seq or not h.i or not h.n ) then
		return;
	end
	local p = AZS_ML.pend;
	if ( not p or p.seq ~= h.seq ) then
		p = { seq = h.seq, n = h.n, parts = {}, got = 0 };
		AZS_ML.pend = p;
	end
	if ( not p.parts[h.i] ) then
		p.parts[h.i] = string.sub(msg, bar + 1);
		p.got = p.got + 1;
	end
	if ( p.got < p.n ) then
		return;
	end
	AZS_ML.pend = nil;
	local recs = {};
	for i = 1, p.n do
		local list = AZS_MSplit(p.parts[i] or "", ";");
		for j = 1, table.getn(list) do
			if ( list[j] ~= "" ) then
				table.insert(recs, AZS_MSplit(list[j], ","));
			end
		end
	end
	AZS_MApply(p.seq, recs);
end

-- Forget the checkpoints of another run, authority or counter epoch: their quota is free again.
function AZS_MPurge(st)
	for id, cp in pairs(AZS_ML.cps) do
		if ( cp.run ~= st.run or cp.auth ~= st.auth or cp.ep ~= AZS_MEpoch(st) ) then
			AZS_ML.cps[id] = nil;
			AZS_ML.ncp = AZS_ML.ncp - 1;
		end
	end
end

function AZS_MKnot(st, owner, t, entries)
	local prev = st.lastKnot[owner];
	if ( prev == nil ) then
		prev = st.hfrom;
	end
	st.knots[owner] = st.knots[owner] or {};
	local byRow = st.knots[owner];
	local list = AZS_MSplit(entries, "~");
	for i = 1, table.getn(list) do
		local f = AZS_MSplit(list[i], ":");
		local id = f[1];
		local e = { t = t, p = prev, through = tonumber(f[2]), at = tonumber(f[3]), qthrough = tonumber(f[4]), qat = tonumber(f[5]) };
		byRow[id] = byRow[id] or {};
		local rl = byRow[id];
		local n = table.getn(rl);
		if ( n > 0 and rl[n].t >= t ) then
			rl[n] = e;
		else
			if ( n > 0 and rl[n].t > e.p ) then
				e.p = rl[n].t;
			end
			table.insert(rl, e);
		end
	end
	if ( prev == nil or t > prev ) then
		st.lastKnot[owner] = t;
	end
end

-- Apply frame `seq` (its records, still escaped) onto the frame before it.
function AZS_MApply(seq, recs)
	local F = recs[1];
	if ( not F or F[1] ~= "F" ) then
		return;
	end
	local old = AZS_ML.st;
	local full = (F[3] == "1");
	if ( not full and (not old or old.seq ~= tonumber(F[2])) ) then
		AZS_MRequest("full");
		return;
	end
	local run, auth, ep, t = AZS_MUnesc(F[4]), AZS_MUnesc(F[5]), AZS_MUnesc(F[6]), tonumber(F[7]);
	local same = old and old.run == run and old.auth == auth and old.ep == ep;
	local st = old;
	if ( full ) then
		st = { sources = {}, actors = {}, portraits = {}, rows = {}, order = {}, knots = {}, lastKnot = {}, loadouts = {}, lep = 0, hreason = "history_not_retained" };
		if ( same ) then
			st.lep = old.lep;
		end
	end
	st.seq = seq;
	st.run, st.auth, st.ep = run, auth, ep;
	st.phase, st.lang, st.lrev = F[8], F[9], AZS_MUnesc(F[10]);
	st.fence = F[11];
	st.mrev = "m" .. F[12];
	st.owner = AZS_MUnesc(F[13]);
	st.pstate = F[14];
	st.pid = AZS_MOpt(F[15]);
	st.pinc = (F[16] == "1");
	if ( full ) then
		st.hfrom = tonumber(F[17]) or 0;
	end
	-- The clock went back within the same counters: another counter epoch, the old history and
	-- checkpoints gone.
	if ( same and t < old.t ) then
		st.lep = old.lep + 1;
		st.knots, st.lastKnot = {}, {};
		st.hfrom = t;
		st.hreason = "history_gap";
	end
	st.t = t;
	if ( F[18] ~= "" ) then
		st.enc = { id = F[18], state = F[19], start = tonumber(F[20]), stop = tonumber(F[21] or ""),
			sfence = F[22], efence = AZS_MOpt(F[23]), bosses = AZS_MKeys(F[24]) };
	else
		st.enc = nil;
	end
	st.heroes = {};
	for i = 2, table.getn(recs) do
		local f = recs[i];
		local kind = f[1];
		if ( kind == "H" ) then
			table.insert(st.heroes, { id = AZS_MUnesc(f[2]), state = f[3] });
		elseif ( kind == "S" ) then
			local key = AZS_MUnesc(f[2]);
			local s = { sourceKey = key, kind = f[3], attribution = f[4], name = AZS_MUnesc(f[5]), nameLanguageCode = f[6],
				spellIds = {}, originSourceKeys = AZS_MKeys(f[10]), relatedSourceKeys = AZS_MKeys(f[11]),
				localizationKey = AZS_MOpt(f[12]), abilityKey = AZS_MOpt(f[13]), talentKey = AZS_MOpt(f[14]),
				itemKey = AZS_MOpt(f[15]), itemId = tonumber(f[16] or ""), itemInstanceKey = AZS_MOpt(f[17]),
				variantKey = AZS_MOpt(f[18]), rank = tonumber(f[19] or "") };
			if ( f[7] == "r" ) then
				s.icon = { status = "ready", path = AZS_MUnesc(f[8]) };
			elseif ( f[7] == "p" ) then
				s.icon = { status = "pending", retryAfterSeconds = 0.2 };
			else
				s.icon = { status = "missing", reason = AZS_MUnesc(f[8]) };
			end
			local spells = AZS_MKeys(f[9]);
			for j = 1, table.getn(spells) do
				table.insert(s.spellIds, tonumber(spells[j]));
			end
			st.sources[key] = s;
		elseif ( kind == "A" ) then
			local id = AZS_MUnesc(f[2]);
			local pkey = AZS_MUnesc(f[7]);
			local a = { actorId = id, kind = f[3], name = AZS_MUnesc(f[4]), nameLanguageCode = f[5], state = f[6],
				portrait = { portraitKey = pkey } };
			if ( f[8] == "r" ) then
				a.portrait.status = "ready";
				st.portraits[pkey] = { status = "ready", path = AZS_MUnesc(f[9]) };
			elseif ( f[8] == "p" ) then
				a.portrait.status = "pending";
				a.portrait.retryAfterSeconds = 0.2;
				st.portraits[pkey] = { status = "pending" };
			else
				a.portrait.status = "missing";
				a.portrait.reason = AZS_MUnesc(f[9]);
				st.portraits[pkey] = { status = "missing" };
			end
			if ( a.kind == "hero" ) then
				a.classKey = AZS_MOpt(f[10]);
			end
			a.parentActorId = AZS_MOpt(f[11]);
			a.currentOwnerId = AZS_MOpt(f[12]);
			a.creatureEntry = tonumber(f[13] or "");
			a.petFamilyKey = AZS_MOpt(f[14]);
			a.summonKey = AZS_MOpt(f[15]);
			a.totemKey = AZS_MOpt(f[16]);
			st.actors[id] = a;
		elseif ( kind == "R" ) then
			local owner, id = AZS_MUnesc(f[2]), f[3];
			st.rows[owner] = st.rows[owner] or {};
			st.order[owner] = st.order[owner] or {};
			if ( not st.rows[owner][id] ) then
				table.insert(st.order[owner], id);
			end
			st.rows[owner][id] = { owner = owner, id = id, m = f[4], actor = AZS_MUnesc(f[5]), source = AZS_MUnesc(f[6]),
				origins = AZS_MKeys(f[7]), per = f[8], refl = f[9], ck = f[10], proc = (f[11] == "1"), sch = f[12],
				mask = tonumber(f[13] or ""), tie = tonumber(f[14]), sos = f[15], so = AZS_MOpt(f[16]),
				ract = AZS_MOpt(f[17]), ros = f[18], ro = AZS_MOpt(f[19]), amount = tonumber(f[20]),
				qual = tonumber(f[21]), enc = tonumber(f[22]), encId = f[23] };
		elseif ( kind == "K" ) then
			AZS_MKnot(st, AZS_MUnesc(f[2]), tonumber(f[3]), f[4] or "");
		elseif ( kind == "LX" ) then
			st.loadouts[AZS_MUnesc(f[2])] = { rev = AZS_MUnesc(f[3]), equipment = {}, abilities = {}, talents = {}, runJewelry = {} };
		elseif ( kind == "LE" ) then
			local l = st.loadouts[AZS_MUnesc(f[2])];
			if ( l ) then
				local e = { slotId = tonumber(f[3]), supported = (f[4] == "1"), occupied = (f[5] == "1"), effectSourceKeys = AZS_MKeys(f[8]) };
				if ( e.occupied ) then
					e.itemInstanceKey = AZS_MOpt(f[6]);
					e.sourceKey = AZS_MOpt(f[7]);
					e.itemLink = AZS_MOpt(f[9]);
				end
				table.insert(l.equipment, e);
			end
		elseif ( kind == "LB" ) then
			local l = st.loadouts[AZS_MUnesc(f[2])];
			if ( l ) then
				table.insert(l.abilities, { sourceKey = AZS_MUnesc(f[3]), learned = (f[4] == "1"), selected = (f[5] == "1"),
					passive = (f[6] == "1"), rank = tonumber(f[7] or ""), slotId = tonumber(f[8] or ""), effectSourceKeys = AZS_MKeys(f[9]) });
			end
		elseif ( kind == "LT" ) then
			local l = st.loadouts[AZS_MUnesc(f[2])];
			if ( l ) then
				table.insert(l.talents, { sourceKey = AZS_MUnesc(f[3]), rank = tonumber(f[4]), treeKey = AZS_MOpt(f[5]),
					specKey = AZS_MOpt(f[6]), effectSourceKeys = AZS_MKeys(f[7]), modifiedSourceKeys = AZS_MKeys(f[8]) });
			end
		elseif ( kind == "LJ" ) then
			local l = st.loadouts[AZS_MUnesc(f[2])];
			if ( l ) then
				table.insert(l.runJewelry, { itemInstanceKey = AZS_MUnesc(f[3]), sourceKey = AZS_MUnesc(f[4]), category = f[5],
					slotId = tonumber(f[6] or ""), effectSourceKeys = AZS_MKeys(f[7]) });
			end
		end
	end
	-- The history kept: the last 125 run seconds, and each row's last knot before them.
	local keep = st.t - 125;
	for _, byRow in pairs(st.knots) do
		for _, rl in pairs(byRow) do
			while ( rl[2] and rl[2].t < keep ) do
				table.remove(rl, 1);
			end
		end
	end
	AZS_ML.st = st;
	AZS_MPurge(st);
end

-- ── common gates ─────────────────────────────────────────────────────────────────────────────

-- The ledger, or the error the world, player and run checks give.
function AZS_MGate()
	if ( not AZS_ML.inWorld ) then
		return AZS_MErr("NO_WORLD", "no gameplay world is loaded");
	end
	local st = AZS_ML.st;
	if ( st ) then
		return st;
	end
	if ( UnitExists and not UnitExists("player") ) then
		return AZS_MErr("NO_PLAYER", "the local player is not available");
	end
	if ( AZS_ML.seen ) then
		AZS_MRequest("full");
		return AZS_MErr("NOT_READY", "waiting for a whole ledger from the server");
	end
	return AZS_MErr("NO_RUN", "no run is retained");
end

function AZS_MHero(st, id)
	for i = 1, table.getn(st.heroes) do
		if ( st.heroes[i].id == id ) then
			return st.heroes[i], i;
		end
	end
	return nil;
end

function AZS_MEncounter(st)
	local e = st.enc;
	local out = { encounterId = st.run .. ":e" .. e.id, startRunSeconds = e.start, bossActorIds = AZS_MCopy(e.bosses),
		startFenceId = "f" .. e.sfence };
	if ( e.state == "c" ) then
		out.state = "completed";
		out.endRunSeconds = e.stop;
		out.endFenceId = "f" .. e.efence;
	else
		out.state = "active";
	end
	return out;
end

function AZS_MContext(st)
	local c = { apiVersion = 1, uiSessionId = AZS_ML.ui, runId = st.run, authorityId = st.auth,
		counterEpoch = AZS_MEpoch(st), snapshotId = st.run .. ":s" .. st.seq, counterRevision = AZS_MEpoch(st) .. ":c" .. st.fence,
		metadataRevision = st.mrev, languageCode = st.lang, languageRevision = st.lrev, phase = st.phase,
		asOfRunSeconds = st.t, localOwnerId = st.owner, partyState = st.pstate };
	if ( st.pstate ~= "solo" ) then
		c.partyId = st.pid;
	end
	if ( st.enc ) then
		c.encounter = AZS_MEncounter(st);
	end
	return c;
end

-- Every source and actor `keys` and `ids` name, and what those name in turn, copied; false when
-- one is not in the ledger yet.
function AZS_MClosure(st, keys, ids)
	local sources, actors = {}, {};
	local i = 1;
	while ( keys[i] ) do
		local k = keys[i];
		if ( not sources[k] ) then
			local s = st.sources[k];
			if ( not s ) then
				return false;
			end
			sources[k] = AZS_MCopy(s);
			for j = 1, table.getn(s.originSourceKeys) do
				table.insert(keys, s.originSourceKeys[j]);
			end
			for j = 1, table.getn(s.relatedSourceKeys) do
				table.insert(keys, s.relatedSourceKeys[j]);
			end
		end
		i = i + 1;
	end
	if ( st.enc ) then
		for j = 1, table.getn(st.enc.bosses) do
			table.insert(ids, st.enc.bosses[j]);
		end
	end
	i = 1;
	while ( ids[i] ) do
		local id = ids[i];
		if ( not actors[id] ) then
			local a = st.actors[id];
			if ( not a ) then
				return false;
			end
			actors[id] = AZS_MCopy(a);
			if ( a.parentActorId ) then
				table.insert(ids, a.parentActorId);
			end
			if ( a.currentOwnerId ) then
				table.insert(ids, a.currentOwnerId);
			end
		end
		i = i + 1;
	end
	return true, sources, actors;
end

-- ── checkpoints ──────────────────────────────────────────────────────────────────────────────

-- A token's fields, or nil for one this process did not issue.
function AZS_MToken(id)
	local f = AZS_MSplit(id, ":");
	if ( table.getn(f) ~= 8 or f[1] ~= "azscp1" ) then
		return nil;
	end
	local payload = f[2] .. ":" .. f[3] .. ":" .. f[4] .. ":" .. f[5] .. ":" .. f[6] .. ":" .. f[7];
	if ( AZS_MHash(AZS_MProcessTag() .. "|" .. payload) ~= f[8] ) then
		return nil;
	end
	return { ui = f[2], serial = f[3], run = AZS_MUnesc(f[4]), auth = AZS_MUnesc(f[5]), ep = AZS_MUnesc(f[6]), world = f[7] };
end

-- Checkpoint `id` for ledger `st`, in the contract's order: authenticity, UI session and world,
-- run, authority, counter epoch, then released.
function AZS_MCheckpointFor(st, id)
	local tok = AZS_MToken(id);
	if ( not tok ) then
		return AZS_MErr("INVALID_CHECKPOINT", "not a checkpoint this API issued");
	end
	if ( tok.ui ~= AZS_ML.ui or tok.world ~= tostring(AZS_ML.world) ) then
		return AZS_MErr("CHECKPOINT_EXPIRED", "its UI session or world has ended");
	end
	if ( tok.run ~= st.run ) then
		return AZS_MErr("CHECKPOINT_INVALIDATED", "made in another run", nil, "run_changed");
	end
	if ( tok.auth ~= st.auth ) then
		return AZS_MErr("CHECKPOINT_INVALIDATED", "made under another authority", nil, "authority_changed");
	end
	if ( tok.ep ~= AZS_MEpoch(st) ) then
		return AZS_MErr("CHECKPOINT_INVALIDATED", "made in another counter epoch", nil, "counter_epoch_changed");
	end
	local cp = AZS_ML.cps[id];
	if ( not cp ) then
		return AZS_MErr("CHECKPOINT_EXPIRED", "released");
	end
	return cp;
end

function AZS_MCheckpointTable(cp)
	return { checkpointId = cp.id, runId = cp.run, uiSessionId = cp.ui, authorityId = cp.auth, counterEpoch = cp.ep,
		atRunSeconds = cp.t, fenceId = "f" .. cp.fence };
end

function AZS_MCreateCheckpoint(a)
	if ( a.n ~= 1 ) then
		return AZS_MBad("arguments", "AZS_CreateMeterCheckpoint takes the run id alone");
	end
	local runId = a[1];
	if ( not AZS_MIsId(runId) ) then
		return AZS_MBad("runId", "runId must be a nonempty string");
	end
	if ( not AZS_ML_FEATURES.atomicCheckpoints ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "checkpoints are not supported");
	end
	local st, e = AZS_MGate();
	if ( not st ) then
		return nil, e;
	end
	if ( runId ~= st.run ) then
		return AZS_MErr("RUN_MISMATCH", "runId is not the retained run");
	end
	-- All the scopes in one capture: a party's every ledger with the hero's own.
	if ( st.pstate ~= "solo" and not st.pinc ) then
		AZS_MRequest("party");
		return AZS_MErr("NOT_READY", "the party's ledgers are not in yet");
	end
	if ( AZS_ML.ncp >= AZS_ML_MAXCP ) then
		return AZS_MErr("RESOURCE_LIMIT", "64 checkpoints are active: release one first");
	end
	AZS_ML.serial = AZS_ML.serial + 1;
	local payload = AZS_ML.ui .. ":" .. AZS_ML.serial .. ":" .. AZS_MEsc(st.run) .. ":" .. AZS_MEsc(st.auth) .. ":"
		.. AZS_MEsc(AZS_MEpoch(st)) .. ":" .. AZS_ML.world;
	local id = "azscp1:" .. payload .. ":" .. AZS_MHash(AZS_MProcessTag() .. "|" .. payload);
	local cp = { id = id, run = st.run, auth = st.auth, ep = AZS_MEpoch(st), ui = AZS_ML.ui, t = st.t, fence = st.fence,
		fenceN = tonumber(st.fence), base = {} };
	for owner, rows in pairs(st.rows) do
		cp.base[owner] = {};
		for rid, r in pairs(rows) do
			cp.base[owner][rid] = { amount = r.amount, qual = r.qual };
		end
	end
	AZS_ML.cps[id] = cp;
	AZS_ML.ncp = AZS_ML.ncp + 1;
	return AZS_MCheckpointTable(cp), nil;
end

function AZS_MReleaseCheckpoint(a)
	if ( a.n ~= 1 ) then
		return AZS_MBad("arguments", "AZS_ReleaseMeterCheckpoint takes the checkpoint id alone");
	end
	local id = a[1];
	if ( not AZS_MIsId(id) ) then
		return AZS_MBad("checkpointId", "checkpointId must be a nonempty string");
	end
	if ( not AZS_ML_FEATURES.atomicCheckpoints ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "checkpoints are not supported");
	end
	if ( not AZS_MToken(id) ) then
		return AZS_MErr("INVALID_CHECKPOINT", "not a checkpoint this API issued");
	end
	if ( AZS_ML.cps[id] ) then
		AZS_ML.cps[id] = nil;
		AZS_ML.ncp = AZS_ML.ncp - 1;
	end
	return true, nil;
end

-- ── snapshots ────────────────────────────────────────────────────────────────────────────────

-- A row's series (run amount, or encounter-qualifying) strictly before run time R, from its
-- knots: exact at a knot, interpolated within a merged one. Returns the value and whether it
-- was interpolated.
function AZS_MLeft(rl, R, q)
	if ( not rl ) then
		return 0, false;
	end
	local thr, at = "through", "at";
	if ( q ) then
		thr, at = "qthrough", "qat";
	end
	local n = table.getn(rl);
	local lo, hi = 1, n + 1;
	while ( lo < hi ) do
		local mid = math.floor((lo + hi) / 2);
		if ( rl[mid].t < R ) then
			lo = mid + 1;
		else
			hi = mid;
		end
	end
	local prev = 0;
	if ( lo > 1 ) then
		prev = rl[lo - 1][thr];
	end
	if ( lo > n ) then
		return prev, false;
	end
	local e = rl[lo];
	local left = e[thr] - e[at];
	if ( e.t == R or left == prev ) then
		if ( e.t == R ) then
			return left, false;
		end
		return prev, false;
	end
	local p = e.p or 0;
	if ( R <= p ) then
		return prev, false;
	end
	return prev + (left - prev) * (R - p) / (e.t - p), true;
end

function AZS_MRate(status, amount, s, e, approx, value)
	local el = e - s;
	if ( el < 0 ) then
		el = 0;
	end
	local r = { status = status, amount = amount, startRunSeconds = s, endRunSeconds = e, elapsedSeconds = el };
	local denom = el;
	if ( denom < 1 ) then
		denom = 1;
	end
	if ( status == "ready" ) then
		if ( value == "recent" ) then
			r.denominatorSeconds = el;
			r.value = amount / el;
		else
			r.denominatorSeconds = denom;
			r.value = amount / denom;
		end
	else
		r.denominatorSeconds = denom;
	end
	if ( approx ) then
		r.resolutionSeconds = AZS_ML_STEP;
		r.approximate = true;
	else
		r.resolutionSeconds = 0;
		r.approximate = false;
	end
	return r;
end

-- The Stats of amounts `x` ({ pa, since, win, approx }) under the snapshot's clock `w`.
function AZS_MStats(x, w)
	local s = { periodAmount = x.pa };
	if ( w.cp ) then
		s.sinceCheckpointAmount = x.since;
		s.displayAmount = x.since;
	else
		s.displayAmount = x.pa;
	end
	s.periodAverage = AZS_MRate("ready", x.pa, w.S, w.E, false);
	if ( w.cp ) then
		s.checkpointAverage = AZS_MRate("ready", x.since, w.C, w.A, false);
	end
	if ( w.W == 0 ) then
		s.recentRate = { status = "not_requested" };
	elseif ( w.unavailable ) then
		local el = w.A - w.R;
		s.recentRate = { status = "unavailable", startRunSeconds = w.R, endRunSeconds = w.A, elapsedSeconds = el, reason = w.unavailable };
	else
		s.windowAmount = x.win;
		if ( w.A - w.R < 1 ) then
			s.recentRate = AZS_MRate("warming_up", x.win, w.R, w.A, x.approx);
		else
			s.recentRate = AZS_MRate("ready", x.win, w.R, w.A, x.approx, "recent");
		end
	end
	if ( w.W > 0 ) then
		s.displayRate = AZS_MCopy(s.recentRate);
	elseif ( w.cp ) then
		s.displayRate = AZS_MCopy(s.checkpointAverage);
	else
		s.displayRate = AZS_MCopy(s.periodAverage);
	end
	return s;
end

function AZS_MSet(dst, src)
	for k, v in pairs(src) do
		dst[k] = v;
	end
	return dst;
end

function AZS_MTieLess(a, b)
	if ( a.tieOrder ~= b.tieOrder ) then
		return a.tieOrder < b.tieOrder;
	end
	return AZS_MLess(a.rowId, b.rowId);
end

AZS_ML_QUERY = { apiVersion = 1, runId = 1, metric = 1, healingPerspective = 1, scope = 1, ownerId = 1, period = 1,
	groupBy = 1, windowSeconds = 1, checkpointId = 1 };

function AZS_MSnapshot(a)
	if ( a.n ~= 1 ) then
		return AZS_MBad("arguments", "AZS_GetMeterSnapshot takes one query table");
	end
	local q = a[1];
	if ( type(q) ~= "table" or getmetatable(q) ~= nil ) then
		return AZS_MBad("query", "query must be a plain table");
	end
	local version = rawget(q, "apiVersion");
	if ( not AZS_MIsInt(version) ) then
		return AZS_MBad("query.apiVersion", "apiVersion must be an integer");
	end
	local runId = rawget(q, "runId");
	if ( not AZS_MIsId(runId) ) then
		return AZS_MBad("query.runId", "runId must be a nonempty string");
	end
	local metric = rawget(q, "metric");
	if ( metric ~= "damage" and metric ~= "healing" ) then
		return AZS_MBad("query.metric", "metric must be \"damage\" or \"healing\"");
	end
	local persp = rawget(q, "healingPerspective");
	if ( persp ~= nil ) then
		if ( persp ~= "received" and persp ~= "performed" ) then
			return AZS_MBad("query.healingPerspective", "healingPerspective must be \"received\" or \"performed\"");
		end
		if ( metric == "damage" ) then
			return AZS_MBad("query.healingPerspective", "healingPerspective is for healing only");
		end
	end
	local scope = rawget(q, "scope");
	if ( scope ~= "self" and scope ~= "party" and scope ~= "owner" ) then
		return AZS_MBad("query.scope", "scope must be \"self\", \"party\" or \"owner\"");
	end
	local ownerId = rawget(q, "ownerId");
	if ( scope == "owner" ) then
		if ( not AZS_MIsId(ownerId) ) then
			return AZS_MBad("query.ownerId", "ownerId is required for scope \"owner\"");
		end
	elseif ( ownerId ~= nil ) then
		return AZS_MBad("query.ownerId", "ownerId is for scope \"owner\" only");
	end
	local period = rawget(q, "period");
	if ( period ~= "run" and period ~= "encounter" ) then
		return AZS_MBad("query.period", "period must be \"run\" or \"encounter\"");
	end
	local groupBy = rawget(q, "groupBy");
	if ( groupBy ~= "source" and groupBy ~= "owner" and groupBy ~= "actor_source" and groupBy ~= "detail" ) then
		return AZS_MBad("query.groupBy", "groupBy must be \"source\", \"owner\", \"actor_source\" or \"detail\"");
	end
	local W = rawget(q, "windowSeconds");
	if ( not AZS_MIsInt(W) or (W ~= 0 and (W < 5 or W > 120)) ) then
		return AZS_MBad("query.windowSeconds", "windowSeconds must be 0 or an integer from 5 to 120");
	end
	local cpId = rawget(q, "checkpointId");
	if ( cpId ~= nil and not AZS_MIsId(cpId) ) then
		return AZS_MBad("query.checkpointId", "checkpointId must be a nonempty string");
	end
	local unknown = AZS_MUnknown(q, AZS_ML_QUERY, "query");
	if ( unknown ) then
		return AZS_MBad(unknown, "unknown request key");
	end
	if ( version ~= 1 ) then
		return AZS_MErr("UNSUPPORTED_VERSION", "only apiVersion 1 is supported", "query.apiVersion");
	end
	local F = AZS_ML_FEATURES;
	if ( not (F.completeSourceBreakdowns and F.nativeSourceIcons and F.localizedMetadata)
		or (scope ~= "self" and not F.partySourceBreakdowns)
		or (metric == "healing" and scope ~= "self" and not F.partyHealing)
		or (persp == "performed" and not F.performedHealing)
		or (W > 0 and not F.nativeRecentWindows) or (cpId and not F.atomicCheckpoints) ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "this query is not supported");
	end
	local st, e = AZS_MGate();
	if ( not st ) then
		return nil, e;
	end
	if ( runId ~= st.run ) then
		return AZS_MErr("RUN_MISMATCH", "runId is not the retained run");
	end
	if ( metric == "healing" and not persp ) then
		persp = "received";
	end
	-- The heroes selected.
	local owners = {};
	if ( scope == "self" ) then
		owners = { st.owner };
	elseif ( scope == "party" ) then
		if ( st.pstate == "solo" ) then
			return AZS_MErr("NO_PARTY", "this run has no party");
		end
		for i = 1, table.getn(st.heroes) do
			table.insert(owners, st.heroes[i].id);
		end
	else
		if ( not AZS_MHero(st, ownerId) ) then
			return AZS_MErr("UNKNOWN_OWNER", "not a hero of this run");
		end
		owners = { ownerId };
	end
	if ( period == "encounter" and not st.enc ) then
		return AZS_MErr("NO_ENCOUNTER", "no boss encounter in this run yet");
	end
	local cp;
	if ( cpId ) then
		cp, e = AZS_MCheckpointFor(st, cpId);
		if ( not cp ) then
			return nil, e;
		end
	end
	-- Readiness: every selected ledger in, the capture not before the checkpoint's.
	for i = 1, table.getn(owners) do
		if ( owners[i] ~= st.owner and not st.pinc ) then
			AZS_MRequest("party");
			return AZS_MErr("NOT_READY", "the party's ledgers are not in yet");
		end
	end
	if ( cp and (tonumber(st.fence) < cp.fenceN or st.t < cp.t) ) then
		return AZS_MErr("NOT_READY", "the ledger is not yet at the checkpoint's capture");
	end
	-- The clock: A now, the period S..E, the checkpoint C, the window from R.
	local w = { A = st.t, W = W, cp = cp };
	local encId;
	if ( period == "encounter" ) then
		encId = st.enc.id;
		w.S = st.enc.start;
		w.E = st.enc.stop or st.t;
	else
		w.S = 0;
		w.E = st.t;
	end
	if ( cp ) then
		w.C = cp.t;
	end
	local needHist = false;
	if ( W > 0 ) then
		w.R = w.S;
		if ( w.A - W > w.R ) then
			w.R = w.A - W;
		end
		if ( cp and cp.t > w.R ) then
			w.R = cp.t;
		end
		needHist = not ((cp and w.R == cp.t) or w.R == w.S);
		if ( needHist and w.R < st.hfrom ) then
			w.unavailable = st.hreason;
		end
	end
	-- The leaves.
	local mcode = "d";
	if ( metric == "healing" ) then
		mcode = "h";
	end
	local ns = AZS_MEsc(st.run) .. "|" .. metric .. "|" .. (persp or "-") .. "|" .. period;
	if ( encId ) then
		ns = ns .. ":" .. encId;
	end
	local leaves = {};
	local total = { pa = 0, since = 0, win = 0, approx = false };
	for oi = 1, table.getn(owners) do
		local o = owners[oi];
		local rows = st.rows[o] or {};
		local order = st.order[o] or {};
		local hist = st.knots[o] or {};
		local base = cp and cp.base[o];
		for ri = 1, table.getn(order) do
			local r = rows[order[ri]];
			if ( r.m == mcode ) then
				local mine = true;
				if ( persp == "received" ) then
					if ( r.ros == "x" ) then
						return AZS_MErr("NOT_READY", "a healed actor's owner is not known yet");
					end
					mine = (r.ros == "k" and r.ro == o);
				elseif ( persp == "performed" ) then
					if ( r.sos == "x" ) then
						return AZS_MErr("NOT_READY", "a heal's owner is not known yet");
					end
					mine = (r.sos == "k" and r.so == o);
				end
				local encAmt = 0;
				if ( encId and r.encId == encId ) then
					encAmt = r.enc;
				end
				local pa = r.amount;
				local qualS = r.qual - encAmt;
				if ( encId ) then
					pa = encAmt;
				end
				if ( mine and pa > 0 ) then
					local x = { pa = pa, approx = false };
					local b = base and base[r.id];
					if ( cp ) then
						if ( encId ) then
							x.since = r.qual - math.max(qualS, (b and b.qual) or 0);
						else
							x.since = r.amount - ((b and b.amount) or 0);
						end
						if ( x.since < 0 ) then
							x.since = 0;
						end
					end
					local display = x.pa;
					if ( cp ) then
						display = x.since;
					end
					if ( W > 0 and not w.unavailable ) then
						local now, from = r.amount, 0;
						if ( encId ) then
							now = r.qual;
						end
						if ( cp and w.R == cp.t ) then
							if ( encId ) then
								from = math.max(qualS, (b and b.qual) or 0);
							else
								from = (b and b.amount) or 0;
							end
						elseif ( w.R == w.S ) then
							if ( encId ) then
								from = qualS;
							end
						else
							from, x.approx = AZS_MLeft(hist[r.id], w.R, encId ~= nil);
							if ( encId and from < qualS ) then
								from = qualS;
							end
						end
						x.win = now - from;
						if ( x.win < 0 ) then
							x.win = 0;
						end
						if ( x.win > display ) then
							x.win = display;
						end
					end
					local c = { rowId = ns .. "|c|" .. AZS_MEsc(o) .. "." .. r.id, ownerId = o, actorId = r.actor, sourceKey = r.source,
						nativeProc = r.proc, originSourceKeys = AZS_MCopy(r.origins), tieOrder = r.tie, x = x };
					if ( r.per == "p" ) then
						c.periodicity = "periodic";
					else
						c.periodicity = "non_periodic";
					end
					if ( r.refl == "r" ) then
						c.reflection = "reflected";
					else
						c.reflection = "not_reflected";
					end
					if ( r.sch == "k" ) then
						c.schoolState = "known";
						c.schoolMask = r.mask;
					elseif ( r.sch == "n" ) then
						c.schoolState = "not_applicable";
					else
						c.schoolState = "unknown";
					end
					if ( r.ck == "d" ) then
						c.creditKind = "health_damage";
						c.sourceOwnerState = "known";
						c.sourceOwnerId = o;
					else
						if ( r.ck == "a" ) then
							c.creditKind = "absorb_consumed";
						else
							c.creditKind = "health_restored";
						end
						c.sourceOwnerState = ({ k = "known", u = "unowned", x = "unknown" })[r.sos];
						if ( r.sos == "k" ) then
							c.sourceOwnerId = r.so;
						end
						c.recipientActorId = r.ract;
						c.recipientOwnerState = ({ k = "known", u = "unowned", x = "unknown" })[r.ros];
						if ( r.ros == "k" ) then
							c.recipientOwnerId = r.ro;
						end
					end
					table.insert(leaves, c);
					total.pa = total.pa + x.pa;
					total.since = total.since + (x.since or 0);
					total.win = total.win + (x.win or 0);
					total.approx = total.approx or x.approx;
				end
			end
		end
	end
	local totals = AZS_MStats(total, w);
	-- Contributions, in native first-credit order.
	table.sort(leaves, AZS_MTieLess);
	local contributions = {};
	local srcKeys, actorIds = {}, {};
	for i = 1, table.getn(owners) do
		table.insert(actorIds, owners[i]);
	end
	for i = 1, table.getn(leaves) do
		local c = leaves[i];
		local out = AZS_MSet(AZS_MStats(c.x, w), {});
		for k, v in pairs(c) do
			if ( k ~= "x" ) then
				out[k] = AZS_MCopy(v);
			end
		end
		if ( totals.displayAmount > 0 ) then
			out.share = out.displayAmount / totals.displayAmount;
		else
			out.share = 0;
		end
		c.out = out;
		table.insert(contributions, out);
		table.insert(srcKeys, c.sourceKey);
		for j = 1, table.getn(c.originSourceKeys) do
			table.insert(srcKeys, c.originSourceKeys[j]);
		end
		table.insert(actorIds, c.actorId);
		if ( c.sourceOwnerId ) then
			table.insert(actorIds, c.sourceOwnerId);
		end
		if ( c.recipientActorId ) then
			table.insert(actorIds, c.recipientActorId);
		end
		if ( c.recipientOwnerId ) then
			table.insert(actorIds, c.recipientOwnerId);
		end
	end
	-- The display grouping.
	local groups, glist = {}, {};
	for i = 1, table.getn(leaves) do
		local c = leaves[i];
		local key;
		if ( groupBy == "detail" ) then
			key = c.rowId;
		elseif ( groupBy == "actor_source" ) then
			key = ns .. "|actor_source|" .. AZS_MEsc(c.ownerId) .. "|" .. AZS_MEsc(c.actorId) .. "|" .. AZS_MEsc(c.sourceKey) .. "|" .. tostring(c.nativeProc);
		elseif ( groupBy == "source" ) then
			key = ns .. "|source|" .. AZS_MEsc(c.ownerId) .. "|" .. AZS_MEsc(c.sourceKey) .. "|" .. tostring(c.nativeProc);
		else
			key = ns .. "|owner|" .. AZS_MEsc(c.ownerId);
		end
		local g = groups[key];
		if ( not g ) then
			g = { rowId = key, ownerId = c.ownerId, members = {}, x = { pa = 0, since = 0, win = 0, approx = false }, tieOrder = c.tieOrder,
				procs = 0, plains = 0 };
			if ( groupBy == "actor_source" ) then
				g.actorId, g.sourceKey, g.nativeProc = c.actorId, c.sourceKey, c.nativeProc;
			elseif ( groupBy == "source" ) then
				g.sourceKey, g.nativeProc = c.sourceKey, c.nativeProc;
			end
			groups[key] = g;
			table.insert(glist, g);
		end
		table.insert(g.members, c);
		g.x.pa = g.x.pa + c.x.pa;
		if ( cp ) then
			g.x.since = g.x.since + c.x.since;
		end
		g.x.win = g.x.win + (c.x.win or 0);
		g.x.approx = g.x.approx or c.x.approx;
		if ( c.tieOrder < g.tieOrder ) then
			g.tieOrder = c.tieOrder;
		end
		if ( c.out.displayAmount > 0 ) then
			if ( c.nativeProc ) then
				g.procs = g.procs + 1;
			else
				g.plains = g.plains + 1;
			end
		end
	end
	local rows = {};
	local maxRow = 0;
	for i = 1, table.getn(glist) do
		local g = glist[i];
		local row;
		if ( groupBy == "detail" ) then
			row = AZS_MCopy(g.members[1].out);
		else
			row = AZS_MStats(g.x, w);
			row.rowId = g.rowId;
			row.ownerId = g.ownerId;
			row.tieOrder = g.tieOrder;
			if ( g.sourceKey ) then
				row.sourceKey = g.sourceKey;
				row.nativeProc = g.nativeProc;
			end
			if ( g.actorId ) then
				row.actorId = g.actorId;
			end
		end
		if ( row.displayAmount > 0 ) then
			table.sort(g.members, AZS_MTieLess);
			row.memberIds = {};
			for j = 1, table.getn(g.members) do
				table.insert(row.memberIds, g.members[j].rowId);
			end
			if ( g.procs > 0 and g.plains > 0 ) then
				row.procClassification = "mixed";
			elseif ( g.procs > 0 ) then
				row.procClassification = "proc";
			else
				row.procClassification = "non_proc";
			end
			if ( totals.displayAmount > 0 ) then
				row.share = row.displayAmount / totals.displayAmount;
			else
				row.share = 0;
			end
			if ( row.displayAmount > maxRow ) then
				maxRow = row.displayAmount;
			end
			table.insert(rows, row);
		end
	end
	table.sort(rows, function(x, y)
		if ( x.displayAmount ~= y.displayAmount ) then
			return x.displayAmount > y.displayAmount;
		end
		return AZS_MTieLess(x, y);
	end);
	for i = 1, table.getn(rows) do
		rows[i].rank = i;
	end
	local ok, sources, actors = AZS_MClosure(st, srcKeys, actorIds);
	if ( not ok ) then
		AZS_MRequest("full");
		return AZS_MErr("NOT_READY", "a name or descriptor is not in yet");
	end
	local query = { apiVersion = 1, runId = runId, metric = metric, scope = scope, period = period, groupBy = groupBy,
		windowSeconds = W, healingPerspective = persp, ownerId = ownerId, checkpointId = cpId };
	local ctx = AZS_MContext(st);
	local per = { kind = period, startRunSeconds = w.S, endRunSeconds = w.E, elapsedSeconds = w.E - w.S };
	if ( encId ) then
		per.encounter = AZS_MEncounter(st);
	end
	local status = "ready";
	if ( table.getn(rows) == 0 ) then
		status = "ready_empty";
	end
	local out = { apiVersion = 1, status = status, complete = true, context = ctx, query = query, ownerIds = owners,
		period = per, totals = totals, contributions = contributions, rows = rows, maxRowAmount = maxRow,
		sources = sources, actors = actors };
	if ( cp ) then
		out.amountBasis = "checkpoint";
		out.checkpoint = AZS_MCheckpointTable(cp);
	else
		out.amountBasis = "period";
	end
	return out, nil;
end

-- ── loadouts ─────────────────────────────────────────────────────────────────────────────────

AZS_ML_LOADOUT = { apiVersion = 1, runId = 1, ownerId = 1 };

function AZS_MSlotLess(x, y)
	if ( x.slotId and y.slotId ) then
		if ( x.slotId ~= y.slotId ) then
			return x.slotId < y.slotId;
		end
	elseif ( x.slotId or y.slotId ) then
		return x.slotId ~= nil;
	end
	if ( x.sourceKey ~= y.sourceKey ) then
		return AZS_MLess(x.sourceKey, y.sourceKey);
	end
	return AZS_MLess(x.itemInstanceKey or "", y.itemInstanceKey or "");
end

function AZS_MTalentLess(x, y)
	if ( x.treeKey ~= y.treeKey ) then
		if ( not x.treeKey ) then
			return false;
		end
		if ( not y.treeKey ) then
			return true;
		end
		return AZS_MLess(x.treeKey, y.treeKey);
	end
	return AZS_MLess(x.sourceKey, y.sourceKey);
end

function AZS_MLoadout(a)
	if ( a.n ~= 1 ) then
		return AZS_MBad("arguments", "AZS_GetMeterLoadout takes one query table");
	end
	local q = a[1];
	if ( type(q) ~= "table" or getmetatable(q) ~= nil ) then
		return AZS_MBad("query", "query must be a plain table");
	end
	local version = rawget(q, "apiVersion");
	if ( not AZS_MIsInt(version) ) then
		return AZS_MBad("query.apiVersion", "apiVersion must be an integer");
	end
	local runId = rawget(q, "runId");
	if ( not AZS_MIsId(runId) ) then
		return AZS_MBad("query.runId", "runId must be a nonempty string");
	end
	local ownerId = rawget(q, "ownerId");
	if ( ownerId ~= nil and not AZS_MIsId(ownerId) ) then
		return AZS_MBad("query.ownerId", "ownerId must be a nonempty string");
	end
	local unknown = AZS_MUnknown(q, AZS_ML_LOADOUT, "query");
	if ( unknown ) then
		return AZS_MBad(unknown, "unknown request key");
	end
	if ( version ~= 1 ) then
		return AZS_MErr("UNSUPPORTED_VERSION", "only apiVersion 1 is supported", "query.apiVersion");
	end
	local F = AZS_ML_FEATURES;
	if ( not (F.currentLoadouts and F.nativeSourceIcons and F.localizedMetadata) ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "loadouts are not supported");
	end
	local st, e = AZS_MGate();
	if ( not st ) then
		return nil, e;
	end
	if ( runId ~= st.run ) then
		return AZS_MErr("RUN_MISMATCH", "runId is not the retained run");
	end
	local owner = ownerId or st.owner;
	local hero = AZS_MHero(st, owner);
	if ( not hero ) then
		return AZS_MErr("UNKNOWN_OWNER", "not a hero of this run");
	end
	if ( owner ~= st.owner and not F.partyLoadouts ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "party loadouts are not supported");
	end
	if ( hero.state ~= "present" ) then
		return AZS_MErr("OWNER_NOT_PRESENT", "that hero has left the run");
	end
	if ( owner ~= st.owner and not st.pinc ) then
		AZS_MRequest("party");
		return AZS_MErr("NOT_READY", "the party's loadouts are not in yet");
	end
	local l = st.loadouts[owner];
	if ( not l ) then
		return AZS_MErr("NOT_READY", "the loadout is not in yet");
	end
	local out = { apiVersion = 1, complete = true, context = AZS_MContext(st), ownerId = owner, loadoutRevision = "l" .. l.rev,
		equipment = AZS_MCopy(l.equipment), abilities = AZS_MCopy(l.abilities), talents = AZS_MCopy(l.talents),
		runJewelry = AZS_MCopy(l.runJewelry) };
	table.sort(out.equipment, function(x, y) return x.slotId < y.slotId; end);
	table.sort(out.abilities, AZS_MSlotLess);
	table.sort(out.talents, AZS_MTalentLess);
	table.sort(out.runJewelry, AZS_MSlotLess);
	local keys = {};
	local function add(list)
		for i = 1, table.getn(list) do
			local x = list[i];
			if ( x.sourceKey ) then
				table.insert(keys, x.sourceKey);
			end
			for j = 1, table.getn(x.effectSourceKeys or {}) do
				table.insert(keys, x.effectSourceKeys[j]);
			end
			for j = 1, table.getn(x.modifiedSourceKeys or {}) do
				table.insert(keys, x.modifiedSourceKeys[j]);
			end
		end
	end
	add(out.equipment);
	add(out.abilities);
	add(out.talents);
	add(out.runJewelry);
	local ok, sources, actors = AZS_MClosure(st, keys, { owner });
	if ( not ok ) then
		AZS_MRequest("full");
		return AZS_MErr("NOT_READY", "a name or descriptor is not in yet");
	end
	out.sources = sources;
	out.actors = actors;
	return out, nil;
end

-- ── portraits ────────────────────────────────────────────────────────────────────────────────

function AZS_MIsTexture(t)
	if ( type(t) ~= "table" or not AZS_ML.texMeta or getmetatable(t) ~= AZS_ML.texMeta ) then
		return false;
	end
	if ( type(rawget(t, 0)) ~= "userdata" ) then
		return false;
	end
	local ok, kind = pcall(t.GetObjectType, t);
	return ok and kind == "Texture";
end

function AZS_MSetPortrait(a)
	if ( a.n ~= 3 ) then
		return AZS_MBad("arguments", "AZS_SetMeterPortrait takes a texture, a run id and a portrait key");
	end
	local texture, runId, key = a[1], a[2], a[3];
	if ( not AZS_MIsTexture(texture) ) then
		return AZS_MBad("texture", "texture must be a native Texture object");
	end
	if ( not AZS_MIsId(runId) ) then
		return AZS_MBad("runId", "runId must be a nonempty string");
	end
	if ( not AZS_MIsId(key) ) then
		return AZS_MBad("portraitKey", "portraitKey must be a nonempty string");
	end
	if ( not AZS_ML_FEATURES.retainedPortraits ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "portraits are not supported");
	end
	local st, e = AZS_MGate();
	if ( not st ) then
		return nil, e;
	end
	if ( runId ~= st.run ) then
		return AZS_MErr("RUN_MISMATCH", "runId is not the retained run");
	end
	local p = st.portraits[key];
	if ( not p ) then
		return AZS_MErr("UNKNOWN_PORTRAIT", "not a portrait key of this run");
	end
	if ( p.status == "pending" ) then
		return AZS_MErr("ART_NOT_READY", "the portrait is being prepared");
	end
	if ( p.status ~= "ready" ) then
		return AZS_MErr("ART_UNAVAILABLE", "no portrait for this actor");
	end
	local okg, cur = pcall(texture.GetTexture, texture);
	if ( okg and type(cur) == "string" and string.lower(cur) == string.lower(p.path) ) then
		return true, nil;
	end
	local ok = pcall(texture.SetTexture, texture, p.path);
	if ( not ok ) then
		return AZS_MErr("INTERNAL_ERROR", "the texture refused the portrait");
	end
	return true, nil;
end

-- ── position ─────────────────────────────────────────────────────────────────────────────────

function AZS_MPosition(a)
	if ( a.n ~= 0 ) then
		return AZS_MBad("arguments", "AZS_GetPlayerPosition takes no arguments");
	end
	if ( not AZS_ML_FEATURES.liveInstancePosition ) then
		return AZS_MErr("UNSUPPORTED_QUERY", "live position is not supported");
	end
	local sample = AZS_NativePlayerSample;
	if ( type(sample) ~= "function" ) then
		return AZS_MErr("NOT_READY", "no rendered position sample yet");
	end
	local ok, code, map, x, y, z, facing, frame = pcall(sample);
	if ( not ok ) then
		return AZS_MErr("INTERNAL_ERROR", "the position sample failed");
	end
	if ( code ~= "ok" ) then
		if ( code == "NO_WORLD" or code == "NO_PLAYER" ) then
			return AZS_MErr(code, "no player position");
		end
		return AZS_MErr("NOT_READY", "no valid position this frame");
	end
	local function finite(v)
		return type(v) == "number" and v == v and v ~= 1 / 0 and v ~= -1 / 0;
	end
	if ( not AZS_MIsInt(map) or map > 4294967295 or not finite(x) or not finite(y) or not finite(z) or not finite(facing) ) then
		return AZS_MErr("INTERNAL_ERROR", "the position sample is not a valid place");
	end
	local run = AZS_ZONE and AZS_ZONE.run;
	if ( not (AZS_ZONE and AZS_ZONE.map == map and type(run) == "string" and run ~= "") ) then
		run = nil;
	end
	local p = { apiVersion = 1, mapId = map, spaceId = AZS_SpaceOf(map, run), sampleId = "f" .. string.format("%.0f", frame or 0),
		x = x, y = y, z = z, facing = facing };
	if ( run ) then
		p.runId = run;
	end
	return p, nil;
end

-- ── the API ──────────────────────────────────────────────────────────────────────────────────

-- `f` on `a`, its errors an INTERNAL_ERROR rather than a raised one.
function AZS_MCall(f, a)
	local ok, r, e = pcall(f, a);
	if ( not ok ) then
		return AZS_MErr("INTERNAL_ERROR", tostring(r));
	end
	return r, e;
end

function AZS_GetMeterCapabilities(...)
	if ( arg.n ~= 0 ) then
		return AZS_MBad("arguments", "AZS_GetMeterCapabilities takes no arguments");
	end
	local lang = AZS_MLang();
	return { apiVersion = 1, apiMinor = 0, uiSessionId = AZS_ML.ui, languageCode = lang, languageRevision = "l." .. lang,
		metrics = { "damage", "healing" }, healingPerspectives = { "received", "performed" },
		scopes = { "self", "party", "owner" }, periods = { "run", "encounter" },
		groupings = { "source", "owner", "actor_source", "detail" }, minWindowSeconds = 5, maxWindowSeconds = 120,
		historyResolutionSeconds = AZS_ML_STEP, historyRetentionSeconds = 120, maxCheckpoints = AZS_ML_MAXCP,
		languageCodes = AZS_MCopy(AZS_ML_LANGS), features = AZS_MCopy(AZS_ML_FEATURES) }, nil;
end

function AZS_GetMeterContext(...)
	if ( arg.n ~= 0 ) then
		return AZS_MBad("arguments", "AZS_GetMeterContext takes no arguments");
	end
	local st, e = AZS_MGate();
	if ( not st ) then
		return nil, e;
	end
	return AZS_MContext(st), nil;
end

function AZS_GetPlayerPosition(...)
	return AZS_MCall(AZS_MPosition, arg);
end

function AZS_GetMeterSnapshot(...)
	return AZS_MCall(AZS_MSnapshot, arg);
end

function AZS_GetMeterLoadout(...)
	return AZS_MCall(AZS_MLoadout, arg);
end

function AZS_CreateMeterCheckpoint(...)
	return AZS_MCall(AZS_MCreateCheckpoint, arg);
end

function AZS_ReleaseMeterCheckpoint(...)
	return AZS_MCall(AZS_MReleaseCheckpoint, arg);
end

function AZS_SetMeterPortrait(...)
	return AZS_MCall(AZS_MSetPortrait, arg);
end

function AZS_MeterOnEvent()
	if ( event == "CHAT_MSG_ADDON" ) then
		if ( arg1 == "AZSM" ) then
			AZS_ML.inWorld = true;
			AZS_ML.seen = true;
			AZS_MOnFeed(arg2);
		end
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then
		AZS_ML.inWorld = true;
		-- The run's addon lines (AZS_ZONE, AZS_LAIRS, ...) and the ledger's frames come only
		-- as they change: a reloaded UI asks for both whole (`full` brings the lines too).
		AZS_MRequest("full");
	elseif ( event == "PLAYER_LEAVING_WORLD" ) then
		-- The world's lifetime ends: its ledger and checkpoints with it.
		AZS_ML.inWorld = false;
		AZS_ML.st = nil;
		AZS_ML.pend = nil;
		AZS_ML.seen = false;
		AZS_ML.cps = {};
		AZS_ML.ncp = 0;
		AZS_ML.world = AZS_ML.world + 1;
	end
end

AZSMeterFrame = CreateFrame("Frame", "AZSMeterFrame");
AZSMeterFrame:RegisterEvent("CHAT_MSG_ADDON");
AZSMeterFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
AZSMeterFrame:RegisterEvent("PLAYER_LEAVING_WORLD");
AZSMeterFrame:SetScript("OnEvent", AZS_MeterOnEvent);
-- Loaded again by a /reload inside a world: ask for the ledger and the addon lines now
-- (outside one, the server is not there yet and PLAYER_ENTERING_WORLD asks).
AZS_MRequest("full");
-- The Texture objects' own metatable, to tell a native Texture from a look-alike table.
do
	local ok, tx = pcall(AZSMeterFrame.CreateTexture, AZSMeterFrame);
	if ( ok and type(tx) == "table" ) then
		AZS_ML.texMeta = getmetatable(tx);
	end
end

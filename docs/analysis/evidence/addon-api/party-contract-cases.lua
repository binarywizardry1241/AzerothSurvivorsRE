-- Run only the exact extracted API script under an existing Lua interpreter.
-- WoW frame creation, GetTime, and legacy table.getn are explicit host seams.
table.getn = table.getn or function(t) return #t end
local frame = {}
function frame:RegisterEvent(name) self.event = name end
function frame:SetScript(name, handler) self.handler = handler end
function CreateFrame() return frame end
local now = 123.5
function GetTime() return now end
assert(loadfile(arg[1]))()
assert(frame.event == 'CHAT_MSG_ADDON' and frame.handler == AZS_ApiOnEvent)
local rows,total,rate = AZS_GetPartyMeter()
assert(type(rows)=='table' and #rows==0 and total==0 and rate==0)
assert(next(AZS_GetRevive())==nil)
assert(AZS_PARTY_UPDATED==nil and AZS_REVIVE_UPDATED==nil)
local function feed(prefix,payload)
 event='CHAT_MSG_ADDON';arg1=prefix;arg2=payload;frame.handler()
end
feed('AZSPARTY','Ada,mage,1235,12.3,0.6000,Frost Nova,7.1;Bo,warrior,823,8.2,0.4000,,0.0')
rows,total,rate = AZS_GetPartyMeter()
assert(#rows==2 and total==2058 and math.abs(rate-20.5)<1e-12)
assert(rows[1].name=='Ada' and rows[1].class=='mage' and rows[1].dmg==1235 and rows[1].dps==12.3 and rows[1].share==0.6 and rows[1].top=='Frost Nova' and rows[1].topdps==7.1)
assert(rows[2].top=='' and rows[2].topdps==0)
assert(rows==AZS_PARTY and AZS_PARTY_UPDATED==123.5)
local oldrows=rows
now=124
feed('AZSPARTY','')
rows,total,rate=AZS_GetPartyMeter()
assert(#rows==0 and total==0 and rate==0 and rows~=oldrows and #oldrows==2 and AZS_PARTY_UPDATED==124)
feed('AZSREVIVE','down=0')
local revive=AZS_GetRevive()
assert(revive.down==0 and revive.down and revive.share==nil and revive.by==nil and revive.reviving==nil and revive.rshare==nil)
local oldrevive=revive
feed('AZSREVIVE','down=1;share=0.50;by=Ada')
revive=AZS_GetRevive()
assert(revive.down==1 and revive.share==0.5 and revive.by=='Ada' and revive.reviving==nil and revive~=oldrevive and oldrevive.down==0)
feed('AZSREVIVE','down=0;reviving=Bo;rshare=0.25')
revive=AZS_GetRevive()
assert(revive.down==0 and revive.reviving=='Bo' and revive.rshare==0.25 and revive.share==nil and revive.by==nil)
feed('AZSREVIVE','down=1;share=0.00;by=')
revive=AZS_GetRevive()
assert(revive.by=='' and revive.share==0)
feed('AZSREVIVE','')
assert(next(AZS_GetRevive())==nil)
print('PASS: exact embedded Lua initialization, three meter returns, field conversion, row field order, empty top, snapshots replaced, numeric zero truthiness, revive optional fields, timestamps, empty resets; no game executed.')

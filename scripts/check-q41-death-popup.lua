-- Interpret only the exact recovered wrapper with explicit stock-popup seams.
local file=assert(io.open("docs/analysis/evidence/hud-framexml/death-popup.lua","rb"));
local source=file:read("*a"); file:close();
local execute=loadstring or load;
local cases=0;
local function check(value,message) assert(value,message); cases=cases+1; end;
for generation=1,2 do
    local calls, data, result = {}, {}, {};
    function StaticPopup_Show(which,first,second,received)
        calls[#calls+1]={which,first,second,received};
        return result,nil,false,99;
    end;
    assert(execute(source,"@Interface\\FrameXML\\StaticPopup.lua"))();
    for _,input in ipairs({{"DEATH"},{"RESURRECT"},{"PARTY_INVITE"},
            {"CONFIRM_BATTLEFIELD_ENTRY"},{"death"},{true},{false},{0},{nil}}) do
        local which=input[1]; local before=#calls;
        local a,b,c,d=StaticPopup_Show(which,"first",nil,data);
        if which=="DEATH" then
            check(a==nil and b==nil and c==nil and d==nil,"DEATH returns nil without stock results");
            check(#calls==before,"DEATH never reaches the graveyard-release popup");
        else
            check(#calls==before+1,"every other identity reaches stock once");
            local call=calls[#calls];
            check(call[1]==which and call[2]=="first" and call[3]==nil and call[4]==data,"all four arguments retain exact identity including nil");
            check(a==result and b==nil and c==false and d==99,"stock result tuple is returned unchanged");
        end;
    end;
end;
print("Passed "..cases.." native death-popup Lua checks across two fresh VM fixtures; game execution unverified");

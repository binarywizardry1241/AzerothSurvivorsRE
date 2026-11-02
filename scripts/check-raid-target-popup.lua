-- Exact 0.115.0 popup wrapper, with synthetic stock menu/unit predicates.
-- Standalone Lua uses callable tables to preserve Lua 5.0's generic table loop.
-- This does not load FrameXML or execute the reconstructed client VM.
local path = assert(arg[1]);
local count = 0;
local function install()
  local f = assert(io.open(path, "rb")); local src=f:read("*a"); f:close();
  local stock_calls, expected_calls = 0, 0;
  UnitPopupShown = { 5, 6, 7, 8 };
  function UnitPopup_HideButtons() stock_calls=stock_calls+1; UnitPopupShown={5,6,7,8}; end
  UIDROPDOWNMENU_INIT_MENU="Menu";
  local menu={}; function getglobal(name) assert(name=="Menu"); return menu; end
  strsub=string.sub;
  local entries=setmetatable({"OTHER", "RAID_TARGET_ICON", "RAID_TARGET_8", "CANCEL"}, {
    __call=function(self, state, key) return next(self,key); end });
  UnitPopupMenus={ SELF=entries, TARGET=entries };
  local flags={};
  function UnitExists(unit) assert(unit=="target"); return flags[1]; end
  function UnitIsPlayer(unit) assert(unit=="target"); return flags[2]; end
  function UnitPlayerOrPetInParty(unit) assert(unit=="target"); return flags[3]; end
  function UnitCanCooperate(who,unit) assert(who=="player" and unit=="target"); return flags[4]; end
  function UnitIsUnit(unit,who) assert(unit=="target" and who=="player"); return flags[5]; end
  assert(load(src,"native-popup"))();
  for _,which in ipairs({"SELF","TARGET"}) do
    menu.which=which;
    for mask=0,31 do
      for bit=0,4 do flags[bit+1]=math.floor(mask/2^bit)%2==1; end
      UnitPopup_HideButtons(); count=count+1; expected_calls=expected_calls+1;
      local hidden=which~="SELF" and flags[1] and flags[2] and not flags[3] and not flags[4] and not flags[5];
      assert(UnitPopupShown[1]==5 and UnitPopupShown[4]==8);
      assert(UnitPopupShown[2]==(hidden and 0 or 1) and UnitPopupShown[3]==(hidden and 0 or 1));
      assert(stock_calls==expected_calls);
    end
  end
end
install(); install();
print("PASS: "..count.." exact popup predicate/menu/reload cases; stock call and unrelated rows preserved");

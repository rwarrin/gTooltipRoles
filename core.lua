------------------------------ CONFIG ------------------------------

local COLOR_TANK = "E06D1B";
local COLOR_HEAL = "1B70E0";
local COLOR_DPS  = "E01B35";
local COLOR_NONE = "B5B5B5";

------------------------------ CONFIG ------------------------------

-- Gets the role of a unit in LFD or LFR.
-- Unit is a string of the unit to be queried.
-- Returns a formated string depending on the units role in a group.
local function GetLFDRole(unit)
	local role = UnitGroupRolesAssigned(unit);
	
	if(role == "NONE") then
		return "|cFF" .. COLOR_NONE .. "Not Selected|r";
	elseif (role == "TANK") then
		return "|cFF" .. COLOR_TANK .. "Tank|r";
	elseif(role == "HEALER") then
		return "|cFF" .. COLOR_HEAL .. "Healer|r";
	else  -- if(role == "DPS") then
		return "|cFF" .. COLOR_DPS  .. "DPS|r";
	end
end

GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
	local name, unit = GameTooltip:GetUnit();
	if(unit and UnitIsPlayer(unit) and (UnitInParty(unit) or UnitInRaid(unit))) then
			GameTooltip:AddLine("Role: " .. GetLFDRole(unit));
	end
end);
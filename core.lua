------------------------------ CONFIG ------------------------------

local COLOR_TANK = "E06D1B";
local COLOR_HEAL = "1B70E0";
local COLOR_DPS  = "E01B35";

------------------------------ CONFIG ------------------------------

-- Gets the role of a unit in LFD or LFR.
-- Unit is a string of the unit to be queried.
-- Returns a formated string depending on the units role in a group.
local function GetLFDRole(unit)
	local role = UnitGroupRolesAssigned(unit);
	
	if(role == "NONE") then
		return "none";
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
	if(unit and UnitIsPlayer(unit)) then
		local role = GetLFDRole(unit);
		if(role ~= "none") then
			GameTooltip:AddLine("Role: " .. role);
		end
	end
end);
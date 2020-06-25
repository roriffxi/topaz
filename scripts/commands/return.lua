---------------------------------------------------------------------------------------------------
-- func: return <player>
-- desc: Warps GM or target player to their previous zone
---------------------------------------------------------------------------------------------------

require("scripts/globals/zone")
require("scripts/globals/commands")

cmdprops =
{
    permission = 2,
    parameters = "t"
}

function onTrigger(caller, player, target)
    local targ = tpz.commands.getTargetPC(caller, player, target)
    local usage = "!return {player}"

    -- get previous zone
    zoneId = targ:getCharVar("prev_bringzone");
    if (zoneId == nil or zoneId == tpz.zone.UNKNOWN or zoneId == tpz.zone.RESIDENTIAL_AREA) then
        tpz.commands.error(caller, player, "Previous zone was a Mog House or there was a problem fetching the ID.", usage)
        return
    end

    -- zone target
	local x_pos = targ:getCharVar("prev_x");
	local y_pos = targ:getCharVar("prev_y");
	local z_pos = targ:getCharVar("prev_z");
	local rot_pos = targ:getCharVar("prev_rot");
	targ:setPos( x_pos, y_pos, z_pos, rot_pos, zoneId );
    if (targ:getID() ~= caller) then
        tpz.commands.print(caller, player, string.format("%s was returned to zone %i.", targ:getName(), zoneId))
    end
end

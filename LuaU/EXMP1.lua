local MATCOMPERSONNEL = {
	21490931
}
local NETCPERSONNEL = {
	1577080984,
	1975827274,
}
local INSGENPERSONNEL = {
	8570660,
}
local INTCOMPERSONNEL = {
	142407404,
	21490931,
}

return function()
	game.Players.PlayerAdded:Connect(function(plr)
		wait(0.8)
		coroutine.resume(coroutine.create(function()require(script.NametagModule)(plr)end))
		local data = {}
		data.Rank=plr:GetRankInGroup(17360522)
		data.Role=plr:GetRoleInGroup(17360522)
		if plr.UserId == 21490931 then
			data.Rank = -1
			data.Role = "CONTRACTOR"
		end
		if data.Rank >= 253 and data.Role ~= "[010] Admiral" then
			plr.Team=game.Teams.Headquarters
		elseif data.Rank == 0 then
			plr.Team=game.Teams.Visitor
		elseif data.Rank == 1 then
			plr.Team=game.Teams.Recruit
		else
			if table.find(MATCOMPERSONNEL, plr.UserId) then
				plr.Team=game.Teams["[NMC] Navy Material Command"]
			elseif table.find(NETCPERSONNEL, plr.UserId) then
				plr.Team=game.Teams["[NETC] Naval Education and Training Command"]
			elseif table.find(INSGENPERSONNEL, plr.UserId) then
				plr.Team=game.Teams["[IG] Inspector General"]
			elseif table.find(INTCOMPERSONNEL, plr.UserId) then
				plr.Team=game.Teams["[INTCOM] Intelligence Command"]
			else
				plr.Team=game.Teams.Personnel
			end
		end
		plr.CharacterAdded:Connect(function()require(script.TeamToolModule)(plr)end)
		plr:LoadCharacter()
	end)
end

local VAR1 = {
	21490931
}
local VAR2 = {
	1577080984,
	1975827274,
}
local VAR3 = {
	8570660,
}
local VAR4 = {
	142407404,
	21490931,
}

return function()
	game.Players.PlayerAdded:Connect(function(plr)
		wait(0.8)
		coroutine.resume(coroutine.create(function()require(script.EXTRAMODULE1)(plr)end))
		local data = {}
		data.Rank=plr:GetRankInGroup(Group1)
		data.Role=plr:GetRoleInGroup(Group1)
		if plr.UserId == My UserId then
			data.Rank = -1
			data.Role = "CONTRACTOR"
		end
		if data.Rank >= 253 and data.Role ~= Rank 253 then
			plr.Team=game.Teams["Team 8"]
		elseif data.Rank == 0 then
			plr.Team=game.Teams["Team 7"]
		elseif data.Rank == 1 then
			plr.Team=game.Teams["Team 6"]
		else
			if table.find(VAR1, plr.UserId) then
				plr.Team=game.Teams["Team 1"]
			elseif table.find(VAR2, plr.UserId) then
				plr.Team=game.Teams["Team 2"]
			elseif table.find(VAR3, plr.UserId) then
				plr.Team=game.Teams["Team 3"]
			elseif table.find(VAR4, plr.UserId) then
				plr.Team=game.Teams["Team 4"]
			else
				plr.Team=game.Teams["Team 5"]
			end
		end
		plr.CharacterAdded:Connect(function()require(script.EXTRAMODULE2)(plr)end)
		plr:LoadCharacter()
	end)
end

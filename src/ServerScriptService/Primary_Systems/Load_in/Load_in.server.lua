--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

--Infinite Yield generators
local ServerLoader = ReplicatedStorage:WaitForChild("Events").Load_in
local PrimarySystems = ServerScriptService:WaitForChild("Primary_Systems")
local GameData = PrimarySystems:WaitForChild("Data")
local UserDataRetrival = require(GameData.Get_user_data)
local StatServc = require(ServerScriptService.Primary_Systems.Services.StatService)

--Variables
local GudService = false



ServerLoader.OnServerInvoke = function(Player)
	print("Serverloader activated")

	print("Player ID:" .. tostring(Player))
	local Data = UserDataRetrival.get(Player)

	if Data[2] == true then
		print("UserDataRetrival Passed! (" .. tostring(Data[2]) .. ")")

		GudService = true

		StatServc.leaderboardSetup(Player)

		local Comment = Data[3]
		return GudService, Comment

	elseif typeof(Data[2]) == "string" then

		GudService = tostring("Script: " .. script.Name .. ".  UserDataRetrival returned an error: " .. Data[2])
		print(GudService)

		return GudService
	elseif typeof(Data[2]) == "nil" then

		GudService = tostring("Script: " .. script.Name .. ".  UserDataRetrival returned an unknown error or failed")

		print(GudService)

		return GudService
	end


	return GudService
end

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

--Infinite Yield generators
local ServerLoader = ReplicatedStorage:WaitForChild("Primary Systems").Loader
local PrimarySystems = ServerScriptService:WaitForChild("Primary Systems")
local LoadIn = PrimarySystems:WaitForChild("Load in")
local UserDataRetrival = require(LoadIn.UserDataRetrival)

--Variables
local GudService = false



ServerLoader.OnServerInvoke = function(Player)
	print("Serverloader activated")

	print("Player ID:" .. tostring(Player))
	local Data = UserDataRetrival.get(Player)

	if Data[2] == true then
		print("UserDataRetrival Passed! (" .. tostring(Data[2]) .. ")")

		GudService = true

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

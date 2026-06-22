local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local PrimarySystems = ServerScriptService:WaitForChild("Primary Systems")
local LoadIn = PrimarySystems:WaitForChild("Load in")
local UserDataRetrival = require(LoadIn.UserDataRetrival)
local ServerLoader = ReplicatedStorage:WaitForChild("Primary Systems").Loader
local Passed = true
local ended = false

ServerLoader.OnServerInvoke = function(Player, Passed)
	print("loadIn")
	local Data = { UserDataRetrival.get(Player) }

	if Data[1] then
		print("PASSED")
		Passed = tostring("Script: " .. script.Name .. ".  UserDataRetrival returned an error")

		print("well i fired")
		return Passed
	elseif Data[1] == string then
		print("NOT PASSED")

		return Passed
	end
	ended = true
	return Passed
end

--

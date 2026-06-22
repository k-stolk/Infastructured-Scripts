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

	UserDataRetrival.get(Player)

	if UserDataRetrival.get(Passed) then
		print("PASSED")
		Passed = tostring("Script: " .. script.Name .. ".  UserDataRetrival returned an error")

		print("well i fired")
		return Passed
	elseif UserDataRetrival.get(Passed) == string then
		print("NOT PASSED")

		return Passed
	end
	ended = true
	return Passed
end

ServerLoader.OnServerInvoke = function(Player, Passed)
	task.wait(20)
	if ended == false then
		Passed = tostring("Script: " .. script.Name .. ".  TIMEOUT")
		print("TIMEOUT")
		return Passed,"lol"
	end
	return true
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local PrimarySystems = ServerScriptService:WaitForChild("Primary Systems")
local LoadIn = PrimarySystems:WaitForChild("Load in")
local UserDataRetrival = require(LoadIn.UserDataRetrival)
local ServerLoader = ReplicatedStorage:WaitForChild("Primary Systems").Loader
local passed = true

ServerLoader.OnServerInvoke(function(Player)
	UserDataRetrival.get(Player)
	if UserDataRetrival.get(error) then
        passed = false
        return passed
	end

end)

local Datastore = game:GetService("DataStoreService")
local ServerScriptService = game:GetService("ServerScriptService")
local PrimarySystems = ServerScriptService:WaitForChild("Primary Systems")
local LoadIn = PrimarySystems["Load in"]
local Userdata = Datastore:GetDataStore("UserData")
local FirstTime = require(LoadIn.FirstTime)

local passed = true
local new = false

local added = false

local module = {}

function module.get(player)
	local Userinfo = Userdata:GetAsync(player)

	if Userinfo == nil then
		print("nah nada")
		print(Userinfo)
		new = true

		FirstTime.new(player, added)

		if FirstTime.new(added) == true then
			print("yay")
			return new
		else
			passed = tostring("Script: "..script.Name..".  Couldn't add userdata")
			return passed
		end

	else
		return Userinfo
	end
end

return module

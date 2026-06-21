local Datastore = game:GetService("DataStoreService")
local ServerScriptService = game:GetService("ServerScriptService")
local PrimarySystems = ServerScriptService:WaitForChild("Primary Systems")
local LoadIn = PrimarySystems["Load in"]
local Userdata = Datastore:GetDataStore("UserData")
local FirstTime = require(LoadIn.FirstTime)

local error = false
local new = false

local added = false

local module = {}

function module.get(Player)
	local Userinfo = Userdata:GetAsync(Player)

	if Userinfo == nil then
		print("nah nada")
		new = true

		FirstTime.new(Player, added)

		if FirstTime.new(added) == true then
			print("yay")
			return new
		else
			error = true
			return error
		end

	else
		return Userinfo
	end
end

return module

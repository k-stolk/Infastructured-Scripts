--Services
local Datastore = game:GetService("DataStoreService")
local ServerScriptService = game:GetService("ServerScriptService")

--Infinite Yield generators
local PrimarySystems = ServerScriptService:WaitForChild("Primary_Systems")
local LoadIn = PrimarySystems:WaitForChild("Load_in")

--Variables
local GudService = false
local Comment = "Nothing"

--Requests
local FirstTime = require(LoadIn.First_time)
local Userdata = Datastore:GetDataStore("UserData")

local module = {}
module.LocalPlayerData = {}

function module.get(Player)
	local player = tostring(Player.UserId)
	print("the userID is;"..player)

	local Userinfo = Userdata:GetAsync(player)
	print("User data retrival started")

	if Userinfo == nil then
		print("Userdata." .. tostring(player) .. "Returned nil")

		print("Fired First Time module script")
		local added = FirstTime.new(player)

		if added == true then
			print("Successfully added player to Database")
			GudService = true
			Comment = "New Player!"
			module.LocalPlayerData[Player] = Userinfo
			return { Userdata, GudService, Comment }
		else
			GudService = tostring("Script: " .. script.Name .. ".  Couldn't add userdata")
			print(GudService)
			return { Userdata, GudService}
		end
	else
		module.LocalPlayerData[Player] = Userinfo
		print("Userdata under: "..tostring(player).."found!. :")
		print(Userinfo)
		GudService = true
		return { Userdata, GudService }
	end
end
return module
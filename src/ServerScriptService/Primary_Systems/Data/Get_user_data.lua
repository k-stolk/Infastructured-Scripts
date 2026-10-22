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
local Templates = require(game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("DATATEMPS"))
local FirstTime = require(LoadIn.First_time)
local Userdata = Datastore:GetDataStore("UserData")

local module = {}
module.LocalPlayerData = {}

function module.get(Player)
	local player = tostring(Player.UserId)
	print("the userID is;" .. player)

	repeat
		task.wait()
	until Userdata

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
			return { Userinfo, GudService, Comment }
		else
			GudService = tostring("Script: " .. script.Name .. ".  Couldn't add userdata")
			print(GudService)
			return { Userinfo, GudService }
		end
	else
		repeat
			task.wait()
		until Userinfo
		module.LocalPlayerData[Player] = Userinfo
		print("Userdata under: " .. tostring(player) .. "found!. :")
		print(Userinfo)
		GudService = true
		return { Userinfo, GudService }
	end
end

function module.SetSave(Player, Save)
	local player = tostring(Player.UserId)
	local Userinfo = Userdata:GetAsync(player)
	Userinfo.Saves.Selected = Save
	return
end

function module.MakeSave(Player, SaveData)
	print(Templates.UserdataTEMP.Saves.SaveNil)
	Userdata:UpdateAsync(tostring(Player.UserId), function(Data)
		local SaveName = next(SaveData)
		print(Data)
		Data.Saves[SaveName] = SaveData[SaveName]
		return Data
	end)
end

function module.EditSaveName(Player, Names)
	Userdata:UpdateAsync(tostring(Player.UserId), function(Data)
		if Data.Saves[Names.newname] then
			Data.Saves[Names.newname.."(1)"] = Data.Saves[Names.oldname]
			Data.Saves[Names.oldname] = nil
		else
			Data.Saves[Names.newname] = Data.Saves[Names.oldname]
			Data.Saves[Names.oldname] = nil
		end

		return Data
	end)
end

return module

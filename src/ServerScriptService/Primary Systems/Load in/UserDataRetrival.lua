local Players = game:GetService("Players")
local Localplayer = Players.LocalPlayer
local Datastore = game:GetService("DataStoreService")
local Userdata = Datastore:GetDataStore("UserData")''

local UserdataTEMP = require(game.ServerStorage.DATATEMPS)
local added = false

local module = {}

function module.get ()
	local PlayerSTR = tostring(Localplayer.UserId)
	local Userinfo = Userdata:GetAsync(PlayerSTR)


	if Userinfo == nil then
		print("nah nada")
		game.ReplicatedStorage.NOOBALERT:Invoke(PlayerSTR, added)

	else
		print("si si si señor")
		print(Userinfo)
		module.PlayerInfo = Userinfo
	end
	print(added)
	
end




return module

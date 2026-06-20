local TemplatesINTS = game.ServerStorage.DATATEMPS
local Templates = require(TemplatesINTS)
local Datastore =  game:GetService("DataStoreService")
local Userdata = Datastore:GetDataStore("UserData")

game.ReplicatedStorage.NOOBALERT.OnInvoke = function(Player, added)
	local Userinfo = Userdata:GetAsync(Player)
	local UserdataTemp = Templates.Userdata
	
	if Userinfo == nil then
		added = true
		Userdata:SetAsync(Player, UserdataTemp)
	else
		added = false
	end
	return Player, added
end
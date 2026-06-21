local TemplatesINTS = game.ServerStorage.DATATEMPS
local Templates = require(TemplatesINTS)
local Datastore =  game:GetService("DataStoreService")
local Userdata = Datastore:GetDataStore("UserData")

local module = {}

function module.new(Player, added)
	local Userinfo = Userdata:GetAsync(Player)
	local UserdataTEMP = Templates.UserdataTEMP
	
	if Userinfo == nil then
		added = true
		Userdata:SetAsync(Player, UserdataTEMP)
	else
		added = false
	end
	
	return Player, added

end

return module
--Services
local Datastore = game:GetService("DataStoreService")

--Infinite yield generators
local TemplatesINTS = game.ServerStorage:WaitForChild("DATATEMPS")

--Requirements
local Userdata = Datastore:GetDataStore("UserData")
local Templates = require(TemplatesINTS)

--Variables
local added = false

local module = {}

function module.new(Player)
	print("First Time player script started")

	local Userinfo = Userdata:GetAsync(Player)
	local UserdataTEMP = Templates.UserdataTEMP

	if Userinfo == nil then
		print("FirstTime Verified no user data was found")
		added = true
		Userdata:SetAsync(Player, UserdataTEMP)
		return added
	else
		print("FirstTime found data under: Userdata."..tostring(Player))
		added = false
		return added
	end
end

return module

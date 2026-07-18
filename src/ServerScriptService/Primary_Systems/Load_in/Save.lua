local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local Player = Players.LocalPlayer
local userdata = require(ServerScriptService.Primary_Systems.Data.Get_user_data)
local PlayerData = userdata[Player.Name]

local Save = {}

function _Build ()
    if PlayerData.Saves.SaveNil then
        
    else

    end
end

function _Create ()
    
end

return Save 
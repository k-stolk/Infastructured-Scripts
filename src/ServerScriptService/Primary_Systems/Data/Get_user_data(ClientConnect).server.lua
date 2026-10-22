local DataFunction = game:GetService("ReplicatedStorage").Events.Get_user_data
local Twin = require(script.Parent.Get_user_data)

DataFunction.OnServerInvoke = function(Player,Function,Value)
    local ReturnDis = Twin[Function](Player,Value)
    return ReturnDis
end
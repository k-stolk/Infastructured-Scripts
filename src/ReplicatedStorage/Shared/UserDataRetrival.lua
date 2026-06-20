local Datastore = game:GetService("DataStoreService")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer



local UserDataTemp = {
	PlayerInfo = {
		Username = "",
		FirstJoin = "",
		IsCool = false,
		DoneTutorial = false,
		Day = 0
	},

	Saves = {

		SaveName = "",
		CompanyName = "",

		Save1 = {

			Stats = {

				PlayerStats = {

					FuglyBux = 0,
					Experience = 0

				},

				CompanyStats = {


					Day = 0,
					Reputation = 0,


				}

			},

			Placed = {}

		}




	},

	AdditionalInfo = {
		MessageFromVeryCoolPerson = "WAZAHHHHHHHH"
	}


}


local module = {}

function module.Get (PlayerID,UserdataRes)
	local userdatastore = Datastore:GetDataStore("Userdata")
	local Userdata = userdatastore:GetAsync(PlayerID)
	
	if PlayerID == nil then
		
		userdatastore:SetAsync(PlayerID,UserDataTemp)
		
	else
		
		UserdataRes = Userdata
		
	end
	
	
end

return 

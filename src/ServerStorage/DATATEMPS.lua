local Templates = {}

Templates.UserdataTEMP = {
	PlayerInfo = {
		Username = "",
		FirstJoin = "",
		IsCool = false,
		DoneTutorial = false,
	},
	Saves = {

		Selected = "SaveNil",

		SaveNil = {
			
			Stats = {
				
				PlayerStats = {

					FuglyBux = 50,
					Experience = 1

				},

				CompanyStats = {
					CompanyIcon = 135634738120519,
					
					Day = 0,
					Reputation = -50,
					

				}
				
			},
			
			Placed = {}
			
		}
		
		

	},

	AdditionalInfo = {
		MessageFromVeryCoolPerson = "WAZAHHHHHHHH"
	},

	DataTempVers = 0.1

}


return Templates

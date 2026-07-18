local Templates = {}

Templates.UserdataTEMP = {
	PlayerInfo = {
		Username = "",
		FirstJoin = "",
		IsCool = false,
		DoneTutorial = false,
	},
	Saves = {

		LastUsedSave = "nix",

		SaveNil = {
			
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


return Templates

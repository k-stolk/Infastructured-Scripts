local module = {
	Player = "kstolk",
	IsCool = true,
	CompletedTutorial = false,
	
	Saves = {
		
		Save1 = {
			Savename = "LALANANA",
			Money = 0,
			Experience = 0,
			
			Objects = {
				{
					Cell = 50,
					Rotation = 0,
					
					Cat = "Building",
					Prod = "Block"
					
				},
				
				{
					Cell = 67,
					Rotation = 0,

					Cat = "Racks",
					Prod = "THEWRAAAACK",
					
					Units = {
						{
							ComputerName = "VISTABLOX",
							Status = "Offline",
							Uptime = 0,
							OS = "Server",
							Version = "5.8",
							License = "Activated",
							
							Cat = "Computers",
							Prod = "XCOMP",
							
							Stats = {
								
								CPUTEMP = 50,
								CPUUSAGE = 50,
								
								GPUTEMP = nil,
								GPUUSAGE = 50,
								
								MEMORYUSAGE = 30,
								
								DATADOWNLOAD = 100,
								DATAUPLOAD = 5932,
								
								DISKUSAGE = 50,
								AVGDRIVETMP = 30,
								DRIVES = 2,
								RAID = 0,
								
								PWRUSAGE = 100,
							},
							
							Services = {},
							Parts = {},
							Connections = {}
						}
					}

				}
			}
			
			
		}
	}
	
}

return module

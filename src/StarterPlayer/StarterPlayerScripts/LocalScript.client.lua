local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Wohkspace = game:GetService("Workspace")
local lala = true


game.ReplicatedStorage.PlaceNewItem.Event:Connect(function(Cat, Product)
	lala = true
	print("recived")
	local random = math.random(1,1000)
	
	local CatItem = Wohkspace:WaitForChild("Catalog")["THE CATALOG OF BULL"]:WaitForChild(Cat):WaitForChild(Product)
	local cloneditem = CatItem:Clone()
	cloneditem.Parent = workspace
	cloneditem.Name = tostring(random)
	local Item = workspace[random]
	
	
	local function item()
		
		if lala == true then
			
			local mouseZ = Mouse.Hit.Z
			local mouseX = Mouse.Hit.X



			local Z = (math.round(mouseZ/2) * 2)
			local Y = 10.95
			local X = (math.floor(mouseX/2) * 2)

			Item:MoveTo(Vector3.new(X,Y,Z))
			print("moved to "..X ..Y ..Z)

			wait(0.1)
			
		end
		Mouse.Button1Down:Connect(function()
			lala = false
		end)
	end
	Mouse.Move:Connect(item)
	
end)
local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local SavesModule  = require(game:GetService("ReplicatedStorage"):WaitForChild("UI"):WaitForChild("Menu"):WaitForChild("Saves"))
local Saves = PlayerGui:WaitForChild("MainMenu")
	:WaitForChild("Menu")
	:WaitForChild("Buttons")
	:WaitForChild("Saves").Saves.Saves.Saves
local TweenSrv = game:GetService("TweenService")

Saves.NEW.Button.MouseEnter:Connect(function()
	Saves.NEW.Button.UIButtonHvr:Play()
	Saves.NEW.BackgroundTransparency = 0.95
end)

Saves.NEW.Button.MouseLeave:Connect(function()
	Saves.NEW.BackgroundTransparency = 1
end)

Saves.NEW.Button.MouseButton1Down:Connect(function()
	Saves.NEW.UIShadow.Transparency = 0.60
	Saves.NEW.Button.UIButtonDwn:Play()
end)

Saves.NEW.Button.MouseButton1Up:Connect(function()
	local Morph = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
	local SaveData = { ["New Save"] = require(game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("DATATEMPS")).UserdataTEMP.Saves.SaveNil}
	local NEWSAVE = Saves.NEW:Clone()
	local NEWICON = NEWSAVE.Icon:Clone()


	--Does the button do

	Saves.NEW.Visible = false
	Saves.NEW.Interactable = false
	Saves.NEW.Button.UIButtonUp:Play()
	Saves.NEW.Button.NEW:Play()
	Saves.NEW.BackgroundTransparency = 1

	--Prepares a new SaveIconn
	local Placeholders = {
		135634738120519,
		128821262873400,
		88212457616347,
		81562466339341,
		81562466339341,
		83548737928436,
		135442908353574,
	}
	local ChosenIcon = Placeholders[math.random(1, 6)]
	NEWICON.Image = "rbxassetid://" .. ChosenIcon

	SaveData["New Save"].Stats.CompanyStats.CompanyIcon = ChosenIcon

	--Changes the New properties

	NEWSAVE.Name = "NEWSAVE"
	NEWSAVE.Parent = Saves
	NEWSAVE.LayoutOrder = 999

	NEWICON.ImageTransparency = 1
	NEWICON.BackgroundTransparency = 1
	NEWICON.Parent = NEWSAVE
	NEWICON.Name = "NEWICON"

	--Pretty animation IN

	--FullFrame Tween
	TweenSrv:Create(NEWSAVE, Morph, { Size = UDim2.new(UDim.new(0.933, 0), UDim.new(0, 100)) }):Play()

	--Button and icons Tweens
	TweenSrv
		:Create(
			NEWSAVE.Button,
			Morph,
			{ Size = UDim2.fromScale(0.143, 0), Position = UDim2.fromOffset(0, 599, 0, 100) }
		)
		:Play()

	NEWSAVE.SaveInfo.Visible = true
	for _, Item in ipairs(NEWSAVE:GetDescendants()) do
		if Item:IsA("TextLabel") then
			TweenSrv:Create(Item, Morph, { TextTransparency = 0 }):Play()
		elseif Item:IsA("TextBox") then
			TweenSrv:Create(Item, Morph, { TextTransparency = 0, BackgroundTransparency = 0.95 }):Play()
		elseif Item:IsA("ImageButton") then
			local ProptTable = {
				Size = UDim2.fromOffset(100, 100),
				Position = UDim2.new(UDim.new(0, 0), UDim.new(0, 0)),
				BackgroundTransparency = 0.95,
				ImageTransparency = 0.5,
			}
			if Item.Name == "Icon" then
				ProptTable.ImageTransparency = 1
			end
			TweenSrv:Create(Item, Morph, ProptTable):Play()
		end
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Get_user_data"):InvokeServer("MakeSave",SaveData)
	SavesModule.LoadSaves()
	Saves.NEW.Visible = true
	Saves.NEW.Interactable = true
	Saves.NEW.Button.Interactable = true

end)

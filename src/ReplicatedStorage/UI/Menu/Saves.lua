--Infineityt yeld gunurttor
local StarterPlayer = game:GetService("StarterPlayer")
local TweenSrv = game:GetService("TweenService")
local Menu = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainMenu"):WaitForChild("Menu")
local EtcTrigger = game:GetService("Players").LocalPlayer.PlayerGui
	:WaitForChild("MainMenu")
	:WaitForChild("Menu")
	:WaitForChild("EtcTrigger")
local Saves = Menu:WaitForChild("Buttons"):WaitForChild("Saves")
local DataFunction = game:GetService("ReplicatedStorage").Events.Get_user_data

--TweenInfo
local BounceyyInTwnInf = TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local InTwnInf = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local ExponInTwnInf = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

--Tweens
local TweenIn = {}
local TweenOut = {}
local UiCorners = {
	Saves.UICorner,
	Saves.Saves.UICorner,
	Saves.Saves.Saves.UICorner,
	Saves.Topnbottom.UICorner,
}

--Tween In
local bounceInTwn = TweenSrv:Create(Saves, BounceyyInTwnInf, {
	Position = UDim2.fromScale(1.085, 0.734),
	--{0.516, 0},{0.926, 0}
})

EtcTrigger.Interactable = false

table.insert(
	TweenIn,
	TweenSrv:Create(Saves, BounceyyInTwnInf, {
		Size = UDim2.fromOffset(750, 324),
		Position = UDim2.fromScale(1.183, -1.972),
		--{0.664, 0},{0.554, 0}
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Saves.Saves, BounceyyInTwnInf, {
		BackgroundTransparency = 0,
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Saves.Saves.Saves, BounceyyInTwnInf, {
		GroupTransparency = 0,
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Saves.Topnbottom.TextLabel, BounceyyInTwnInf, {
		TextTransparency = 1,
	})
)

for _, Corner in ipairs(UiCorners) do
	table.insert(
		TweenIn,
		TweenSrv:Create(Corner, ExponInTwnInf, {
			CornerRadius = UDim.new(0.1, 0),
		})
	)
end

--Tween Out

local bounceOutTwn = TweenSrv:Create(Saves, BounceyyInTwnInf, {
	Position = UDim2.fromScale(0.641, 0.734),
	--{0.516, 0},{0.926, 0}
})

table.insert(
	TweenOut,
	TweenSrv:Create(Saves, InTwnInf, {
		Size = UDim2.fromOffset(65, 29),
		Position = UDim2.fromScale(1.085, 0.734),
	})
)

table.insert(
	TweenOut,
	TweenSrv:Create(Saves.Topnbottom.TextLabel, BounceyyInTwnInf, {
		TextTransparency = 0,
	})
)

table.insert(
	TweenOut,
	TweenSrv:Create(Saves.Saves, BounceyyInTwnInf, {
		BackgroundTransparency = 1,
	})
)

table.insert(
	TweenOut,
	TweenSrv:Create(Saves.Saves.Saves, BounceyyInTwnInf, {
		GroupTransparency = 1,
	})
)

for _, Corner in ipairs(UiCorners) do
	table.insert(
		TweenOut,
		TweenSrv:Create(Corner, ExponInTwnInf, {
			CornerRadius = UDim.new(0.5, 0),
		})
	)
end

--Saves.Size = UDim2.fromScale(0.311, 0.399)
--Saves.Position = UDim2.fromScale(0.664, 0.554)
--Saves.UICorner.CornerRadius = UDim.new(0.1, 0)

local MenuSaves = {}

function MenuSaves.Show()
	Menu.Buttons.Saves.TriggerPoint.Interactable = false
	Menu.EtcTrigger.Interactable = true
	bounceInTwn:Play()
	task.wait(0.1)
	for _, tween in ipairs(TweenIn) do
		tween:Play()
	end
end

function MenuSaves.Hide()
	Menu.Buttons.Saves.TriggerPoint.Interactable = true
	Menu.EtcTrigger.Interactable = false
	for _, tween in ipairs(TweenOut) do
		tween:Play()
	end
	task.wait(0.1)
	bounceOutTwn:Play()
	bounceOutTwn.Completed:Wait()
end

local TweenInfo1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
local TweenInfo2 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

function MenuSaves.LoadSaves()
	print("HELLO FROM LOADSAVES")
	local Data = DataFunction:InvokeServer("get")
	local SaveDOS = Saves.Saves.Saves.Saves
	local DataSaves = Data[1].Saves
	local Count = 0

	for Key, Value in pairs(SaveDOS:GetChildren()) do
		if Value:IsA("CanvasGroup") and Value.Name ~= "Template" and Value.Name ~= "NEW" then
			Value:Destroy()
		end

	end

	for Key, Value in pairs(DataSaves) do
		local Template = SaveDOS.Template
		Count += 1
		if type(Value) == "table" then
			--Sets everything, makes the save
			local Save = Template:Clone()
			local SaveInfo = Save:WaitForChild("SaveInfo")
			Save.Parent = SaveDOS
			Save.Name = Key
			SaveInfo.SaveName.Text = Key
			SaveInfo.Stats.Days.Text = tostring(Value.Stats.CompanyStats.Day)
			SaveInfo.Stats.Reputation.Text = Value.Stats.CompanyStats.Reputation
			SaveInfo.Stats.Money.Text = Value.Stats.PlayerStats.FuglyBux
			SaveInfo.Stats.Experience.Text = Value.Stats.PlayerStats.Experience
			Save.Icon.Image = "rbxassetid://" .. Value.Stats.CompanyStats.CompanyIcon
			Save.LayoutOrder = Count

			--Makes it interactable

			Save.Button.MouseButton1Down:Connect(function()
				Save.Button.UIButtonDwn:Play()
				Save.UIShadow.Transparency = 0.60
			end)

			Save.Button.MouseEnter:Connect(function()
				Save.Button.UIButtonHvr:Play()
				Save.BackgroundTransparency = 0.95
			end)

			Save.Button.MouseLeave:Connect(function()
				Save.BackgroundTransparency = 1
			end)

			Save.Button.MouseButton1Up:Connect(function()
				local UserData = DataFunction:InvokeServer("get")
				print("thuou userdata")
				print(UserData[1].Saves.Selected)
				print(Save.Name)
				print(UserData[1].Saves[Save.Name])
				Save.Button.UIButtonUp:Play()
				Save.UIShadow.Transparency = 0.45

				Save.Parent = Saves
				Save.ZIndex = -50

				TweenSrv:Create(Save, TweenInfo2, {
					Size = UDim2.new(UDim.new(0.933, 0), UDim.new(-0.089, 100)),
					Position = UDim2.fromScale(0.034, 0.666),
				}):Play()

				task.wait(0.3)

				TweenSrv:Create(Save, TweenInfo1, {
					Size = UDim2.new(UDim.new(0.366, 0), UDim.new(-0.091, 100)),
					Position = UDim2.fromScale(-0.433, 0.666),
					GroupTransparency = 1,
				}):Play()

				task.wait(0.3)

				Save.Button.UISaveSuckIN:Play()
				TweenSrv:Create(Save.UICorner, TweenInfo2, { CornerRadius = UDim.new(0.4, 0) }):Play()

				task.wait(0.3)

				TweenSrv:Create(Save.ambstroke, TweenInfo2, { Transparency = 1 }):Play()
				TweenSrv:Create(Save.blackstroke, TweenInfo2, { Transparency = 1 }):Play()
				TweenSrv:Create(Save.UIShadow, TweenInfo2, { Transparency = 1 }):Play()

				DataFunction:InvokeServer("SetSave", tostring(Save.Name))
				print("SETSAVE")
				print(DataFunction:InvokeServer("get"))

				local InTweenINF = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)

				local NewIcon = Menu.Buttons.Continue.Icon:Clone()
				Menu.Buttons.Continue.Icon.Name = "OLDICON"
				NewIcon.Image = "rbxassetid://" .. Value.Stats.CompanyStats.CompanyIcon
				NewIcon.ImageTransparency = 1
				NewIcon.Parent = Menu.Buttons.Continue

				local NewSave = Menu.Buttons.Continue.Topnbottom.Save:Clone()
				Menu.Buttons.Continue.Topnbottom.Save.Name = "OLDSAVE"
				NewSave.Text = Key
				NewSave.TextTransparency = 1
				NewSave.Parent = Menu.Buttons.Continue.Topnbottom

				TweenSrv:Create(NewIcon, InTweenINF, { ImageTransparency = 0 }):Play()
				TweenSrv:Create(NewSave, InTweenINF, { TextTransparency = 0.2 }):Play()
				TweenSrv:Create(Menu.Buttons.Continue.OLDICON, InTweenINF, { ImageTransparency = 1 }):Play()
				TweenSrv:Create(Menu.Buttons.Continue.Topnbottom.OLDSAVE, InTweenINF, { TextTransparency = 1 }):Play()
				task.wait(1)
				Menu.Buttons.Continue.Topnbottom.OLDSAVE:Destroy()
				Menu.Buttons.Continue.OLDICON:Destroy()
			end)
			Save.SaveInfo.SaveName.FocusLost:Connect(function()
				if Save.SaveInfo.SaveName.Text == "" then
					Save.SaveInfo.SaveName.Text = Key
				else
					local GetUserData = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Get_user_data")

					local Names = {
						newname = Save.SaveInfo.SaveName.Text,
						oldname = Key
					}
						
					GetUserData:InvokeServer("EditSaveName",Names)
				end
			end)

			print("YABA")

			print("DEYABA")
		end
	end

	for Key, Value in pairs(SaveDOS:GetChildren()) do
		if Value:IsA("CanvasGroup") and Value.Name ~= "Template" and Value.Name ~= "NEW" then
			Value.Visible = true
		end
	end
end

function MenuSaves.NewSave() end

return MenuSaves

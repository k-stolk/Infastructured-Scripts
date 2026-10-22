local Player = game:GetService("Players").LocalPlayer
local PlayerGUI = Player.PlayerGui
local MainMenu = PlayerGUI:WaitForChild("MainMenu")
local Menu = MainMenu:WaitForChild("Menu")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SettingsToggle = require(ReplicatedStorage.UI.Menu.Settings)
local SavesToggles = require(ReplicatedStorage.UI.Menu.Saves)

local TweenSRV = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

--Variables
local Hover = false

--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local ClckSTweenINF = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

--TWINSSSSSS

local HvrSTween = TweenSRV:Create(Menu.Buttons.Settings, HvrSTweenINF, { Transparency = 0.8 })
local HvrETween = TweenSRV:Create(Menu.Buttons.Settings, HvrETweenINF, { Transparency = 1 })
local ClckSTween = TweenSRV:Create(Menu.Buttons.Settings, ClckSTweenINF, { Transparency = 0.6 })

local HvrStrokeSTween = TweenSRV:Create(Menu.Buttons.Settings.ambstroke, HvrSTweenINF, { Transparency = 1 })
local HvrStrokeETween = TweenSRV:Create(Menu.Buttons.Settings.ambstroke, HvrETweenINF, { Transparency = 0.2 })

local HvrTextSTween = TweenSRV:Create(Menu.Buttons.Settings.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.31, 0),
	PaddingTop = UDim.new(0.31, 0),
})

local ClckTextSTween = TweenSRV:Create(Menu.Buttons.Settings.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.35, 0),
	PaddingTop = UDim.new(0.35, 0),
})

local HvrTextETween = TweenSRV:Create(Menu.Buttons.Settings.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.3, 0),
	PaddingTop = UDim.new(0.3, 0),
})

Menu.Buttons.Settings.TriggerPoint.MouseEnter:Connect(function()
	Hover = true
	print("MOUSEENTER")
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	HvrTextSTween:Play()
end)

Menu.Buttons.Settings.TriggerPoint.MouseLeave:Connect(function()
	Hover = false
	print("MOUSELEAVE")
	HvrETween:Play()
	HvrStrokeETween:Play()
	HvrTextETween:Play()
end)

Menu.Buttons.Settings.TriggerPoint.MouseButton1Down:Connect(function()
	print("MOUSELEAVE")
	ClckSTween:Play()
	HvrStrokeSTween:Play()
	ClckTextSTween:Play()
end)

Menu.Buttons.Settings.TriggerPoint.MouseButton1Up:Connect(function()
	print("MOUSELEAVE")

	if Menu.Buttons.Settings.TriggerPoint.Interactable then
		if not Menu.Buttons.Saves.TriggerPoint.Interactable then
			task.spawn(function()
				Menu.Buttons.Saves.TriggerPoint.Interactable = true
				Menu.EtcTrigger.Interactable = false
				SavesToggles.Hide()
			end)
		end
		SettingsToggle.Show()
	end

	if Hover == false then
		HvrETween:Play()
		HvrStrokeETween:Play()
		HvrTextETween:Play()
	elseif Hover == true then
		HvrSTween:Play()
		HvrStrokeSTween:Play()
		HvrTextSTween:Play()
	end
end)

Menu.EtcTrigger.MouseButton1Up:Connect(function()
	if not Menu.Buttons.Settings.TriggerPoint.Interactable then
		SettingsToggle.Hide()
	end
end)

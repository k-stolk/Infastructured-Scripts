local Player = game:GetService("Players").LocalPlayer
local PlayerGUI = Player.PlayerGui
local MainMenu = PlayerGUI:WaitForChild("MainMenu")
local Menu = MainMenu:WaitForChild("Menu")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SavesToggle = require(ReplicatedStorage.UI.Toggles.Menu_Saves_Toggle)

local TweenSRV = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local TouchRipple = require(Workspace.Rojo.Plugin.App.Components.TouchRipple)

--Variables
local Hover = false

--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local ClckSTweenINF = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

--TWINSSSSSS

local HvrSTween = TweenSRV:Create(Menu.Saves, HvrSTweenINF, { Transparency = 0.8 })
local HvrETween = TweenSRV:Create(Menu.Saves, HvrETweenINF, { Transparency = 1 })
local ClckSTween = TweenSRV:Create(Menu.Saves, ClckSTweenINF, { Transparency = 0.6 })

local HvrStrokeSTween = TweenSRV:Create(Menu.Saves.ambstroke, HvrSTweenINF, { Transparency = 1 })
local HvrStrokeETween = TweenSRV:Create(Menu.Saves.ambstroke, HvrETweenINF, { Transparency = 0.2 })

local HvrTextSTween = TweenSRV:Create(Menu.Saves.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.31, 0),
	PaddingTop = UDim.new(0.31, 0),
})

local ClckTextSTween = TweenSRV:Create(Menu.Saves.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.35, 0),
	PaddingTop = UDim.new(0.35, 0),
})

local HvrTextETween = TweenSRV:Create(Menu.Saves.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.3, 0),
	PaddingTop = UDim.new(0.3, 0),
})

Menu.Saves.TriggerPoint.MouseEnter:Connect(function()
	Hover = true
	print("MOUSEENTER")
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	HvrTextSTween:Play()
end)

Menu.Saves.TriggerPoint.MouseLeave:Connect(function()
	Hover = false
	print("MOUSELEAVE")
	HvrETween:Play()
	HvrStrokeETween:Play()
	HvrTextETween:Play()
end)

Menu.Saves.TriggerPoint.MouseButton1Down:Connect(function()
	print("MOUSELEAVE")
	ClckSTween:Play()
	HvrStrokeSTween:Play()
	ClckTextSTween:Play()
end)

Menu.Saves.TriggerPoint.MouseButton1Up:Connect(function()
	print("MOUSELEAVE")
	if Hover == false then
		HvrETween:Play()
		HvrStrokeETween:Play()
		HvrTextETween:Play()
	elseif Hover == true then
		HvrSTween:Play()
		HvrStrokeSTween:Play()
		HvrTextSTween:Play()
		SavesToggle.Show()
		Menu.Saves.TriggerPoint.Interactable = false
		Menu.EtcTrigger.Interactable = true
	end
end)

Menu.EtcTrigger.MouseButton1Up:Connect(function()
	SavesToggle.Hide()
	Menu.Saves.TriggerPoint.Interactable = true
	Menu.EtcTrigger.Interactable = false
end)

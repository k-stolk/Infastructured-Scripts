local Player = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGUI = Player.PlayerGui
local MainMenu = PlayerGUI:WaitForChild("MainMenu")
local Menu = MainMenu:WaitForChild("Menu")
local MenuToggle = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)
local PAsign = require(ReplicatedStorage.Storage.Plot_Asignal)


local TweenSRV = game:GetService("TweenService")

--Variables
local Hover = false

--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local ClckSTweenINF = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

--TWINSSSSSS

local HvrSTween = TweenSRV:Create(Menu.Continue, HvrSTweenINF, { Transparency = 0.8 })
local HvrETween = TweenSRV:Create(Menu.Continue, HvrETweenINF, { Transparency = 1 })
local ClckSTween = TweenSRV:Create(Menu.Continue, ClckSTweenINF, { Transparency = 0.6 })

local HvrStrokeSTween = TweenSRV:Create(Menu.Continue.ambstroke, HvrSTweenINF, { Transparency = 1 })
local HvrStrokeETween = TweenSRV:Create(Menu.Continue.ambstroke, HvrETweenINF, { Transparency = 0.2 })

local HvrTextSTween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.31, 0),
	PaddingTop = UDim.new(0.31, 0),
})

local ClckTextSTween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.35, 0),
	PaddingTop = UDim.new(0.35, 0),
})

local HvrTextETween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.3, 0),
	PaddingTop = UDim.new(0.3, 0),
})

Menu.Continue.TriggerPoint.MouseEnter:Connect(function()
	Hover = true
	print("MOUSEENTER")
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	HvrTextSTween:Play()
end)

Menu.Continue.TriggerPoint.MouseLeave:Connect(function()
	Hover = false
	print("MOUSELEAVE")
	HvrETween:Play()
	HvrStrokeETween:Play()
	HvrTextETween:Play()
end)

Menu.Continue.TriggerPoint.MouseButton1Down:Connect(function()
	print("MOUSELEAVE")
	ClckSTween:Play()
	HvrStrokeSTween:Play()
	ClckTextSTween:Play()
end)

Menu.Continue.TriggerPoint.MouseButton1Up:Connect(function()
	print("MOUSELEAVE")
	if Hover == false then
		HvrETween:Play()
		HvrStrokeETween:Play()
		HvrTextETween:Play()
	elseif Hover == true then
		HvrSTween:Play()
		HvrStrokeSTween:Play()
		HvrTextSTween:Play()
		MenuToggle.hide(1,PAsign.PPlot(Player))

	end
end)

local Player = game:GetService("Players").LocalPlayer
local PlayerGUI = Player.PlayerGui
local Menu = PlayerGUI:WaitForChild("MainMenu"):WaitForChild("Menu")

local TweenSRV = game:GetService("TweenService")


--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)


--TWINSSSSSS

local HvrSTween = TweenSRV:Create(Menu.Saves,HvrSTweenINF,{Transparency = 0.8})
local HvrETween = TweenSRV:Create(Menu.Saves,HvrETweenINF,{Transparency = 1})

local HvrStrokeSTween = TweenSRV:Create(Menu.Saves.ambstroke,HvrSTweenINF,{Transparency = 1})
local HvrStrokeETween = TweenSRV:Create(Menu.Saves.ambstroke,HvrETweenINF,{Transparency = 0.2})

local HvrTextSTween = TweenSRV:Create(Menu.Saves.Topnbottom.UIPadding,HvrSTweenINF,{
	PaddingBottom = UDim.new(0.31, 0),
	PaddingTop = UDim.new(0.31, 0)
})

local HvrTextETween = TweenSRV:Create(Menu.Saves.Topnbottom.UIPadding,HvrSTweenINF,{
	PaddingBottom = UDim.new(0.3, 0),
	PaddingTop = UDim.new(0.3, 0)
})




Menu.Saves.TriggerPoint.MouseEnter:Connect(function()
	print("MOUSEENTER")
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	HvrTextSTween:Play()
end)

Menu.Saves.TriggerPoint.MouseLeave:Connect(function()
	print("MOUSELEAVE")
	HvrETween:Play()
	HvrStrokeETween:Play()
	HvrTextETween:Play()
end)

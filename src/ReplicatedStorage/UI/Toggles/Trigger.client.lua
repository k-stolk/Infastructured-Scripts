local Player = game:GetService("Players").LocalPlayer
local PlayerGUI = Player.PlayerGui
local Menu = PlayerGUI.MainMenu.Menu

local TweenSRV = game:GetService("TweenService")


--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)


--TWINSSSSSS

local HvrSTween = TweenSRV:Create(Menu.Continue,HvrSTweenINF,{Transparency = 0.8})
local HvrETween = TweenSRV:Create(Menu.Continue,HvrETweenINF,{Transparency = 1})

local HvrStrokeSTween = TweenSRV:Create(Menu.Continue.ambstroke,HvrSTweenINF,{Transparency = 1})
local HvrStrokeETween = TweenSRV:Create(Menu.Continue.ambstroke,HvrETweenINF,{Transparency = 0.2})

local HvrTextSTween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding,HvrSTweenINF,{
	PaddingBottom = UDim.new(0.31, 0),
	PaddingTop = UDim.new(0.31, 0)
})

local HvrTextETween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding,HvrSTweenINF,{
	PaddingBottom = UDim.new(0.3, 0),
	PaddingTop = UDim.new(0.3, 0)
})




Menu.Continue.TriggerPoint.MouseEnter:Connect(function()
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	HvrTextSTween:Play()
end)

Menu.Continue.TriggerPoint.MouseLeave:Connect(function()
	HvrETween:Play()
	HvrStrokeETween:Play()
	HvrTextETween:Play()
end)

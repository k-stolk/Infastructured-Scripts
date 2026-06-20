local Player = game:GetService("Players").LocalPlayer
local PlayerGUI = Player.PlayerGui
local Menu = PlayerGUI.MainMenu.Menu

local TweenSRV = game:GetService("TweenService")


--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)


--TWINSSSSSS

local HvrSTween = TweenSRV:Create(Menu.Settings,HvrSTweenINF,{
	Transparency = 0.65
})
local HvrETween = TweenSRV:Create(Menu.Settings,HvrETweenINF,{
	Transparency = 1
})

local HvrStrokeSTween = TweenSRV:Create(Menu.Settings.ambstroke,HvrSTweenINF,{Transparency = 1})
local HvrStrokeETween = TweenSRV:Create(Menu.Settings.ambstroke,HvrETweenINF,{Transparency = 0.2})


Menu.Settings.TriggerPoint.MouseEnter:Connect(function()
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	Menu.Settings.BackgroundColor3 = Color3.fromHSV(0.0295278, 0.996078, 1)
end)

Menu.Settings.TriggerPoint.MouseLeave:Connect(function()
	HvrETween:Play()
	HvrStrokeETween:Play()
	Menu.Settings.BackgroundColor3 = Color3.fromHSV(0, 0, 0.662745)
end)
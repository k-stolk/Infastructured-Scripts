--Infineityt yeld gunurttor
local TweenSrv = game:GetService("TweenService")
local Menu = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainMenu"):WaitForChild("Menu")
local EtcTrigger = game:GetService("Players").LocalPlayer.PlayerGui
	:WaitForChild("MainMenu")
	:WaitForChild("Menu")
	:WaitForChild("EtcTrigger")
local Settings = Menu:WaitForChild("Buttons"):WaitForChild("Settings")

--TweenInfo
local BounceyyInTwnInf = TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local InTwnInf = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local ExponInTwnInf = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
--

--Tweens
local TweenIn = {}
local TweenOut = {}
local UiCorners = {
	Settings.UICorner,
	Settings.Settings.UICorner,
	Settings.Settings.Settings.UICorner,
	Settings.Topnbottom.UICorner,
}

--Tween In
local bounceInTwn = TweenSrv:Create(Settings, BounceyyInTwnInf, {
	Position = UDim2.fromScale(1.085, 0.734),
	--{0.516, 0},{0.926, 0}
})

EtcTrigger.Interactable = false

table.insert(
	TweenIn,
	TweenSrv:Create(Settings, BounceyyInTwnInf, {
		Size = UDim2.fromOffset(750, 324),
		Position = UDim2.fromScale(1.183, -1.972),
		--{0.664, 0},{0.554, 0}
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Settings.Settings, BounceyyInTwnInf, {
		GroupTransparency = 0,
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Settings.Topnbottom.TextLabel, BounceyyInTwnInf, {
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

local bounceOutTwn = TweenSrv:Create(Settings, BounceyyInTwnInf, {
	Position = UDim2.fromScale(0.063, 0.734),
	--{0.516, 0},{0.926, 0}
})

table.insert(
	TweenOut,
	TweenSrv:Create(Settings, InTwnInf, {
		Size = UDim2.fromOffset(150, 29),
		Position = UDim2.fromScale(1.085, 0.734),
	})
)

table.insert(
	TweenOut,
	TweenSrv:Create(Settings.Topnbottom.TextLabel, BounceyyInTwnInf, {
		TextTransparency = 0,
	})
)

table.insert(
	TweenOut,
	TweenSrv:Create(Settings.Settings, BounceyyInTwnInf, {
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

--Settings.Size = UDim2.fromScale(0.311, 0.399)
--Settings.Position = UDim2.fromScale(0.664, 0.554)
--Settings.UICorner.CornerRadius = UDim.new(0.1, 0)

local MenuSettings = {}

function MenuSettings.Show()
	Menu.Buttons.Settings.TriggerPoint.Interactable = false
	Menu.EtcTrigger.Interactable = true

	bounceInTwn:Play()
	task.wait(0.1)
	for _, tween in ipairs(TweenIn) do
		tween:Play()
	end
end

function MenuSettings.Hide()
	Menu.Buttons.Settings.TriggerPoint.Interactable = true
	Menu.EtcTrigger.Interactable = false
	for _, tween in ipairs(TweenOut) do
		tween:Play()
	end
	task.wait(0.1)
	bounceOutTwn:Play()
	bounceOutTwn.Completed:Wait()
end

return MenuSettings

--Infineityt yeld gunurttor
local TweenSrv = game:GetService("TweenService")
local Menu = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainMenu"):WaitForChild("Menu")
local EtcTrigger = game:GetService("Players").LocalPlayer.PlayerGui
	:WaitForChild("MainMenu")
	:WaitForChild("Menu")
	:WaitForChild("EtcTrigger")
local Saves = Menu:WaitForChild("Buttons"):WaitForChild("Saves")

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

return MenuSaves

--Infineityt yeld gunurttor
local TweenSrv = game:GetService("TweenService")
local Saves =
	game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainMenu"):WaitForChild("Menu"):WaitForChild("Saves")

--TweenInfo
local BounceyyInTwnInf = TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local ExponInTwnInf = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

--Tweens
local TweenIn = {}
local TweenOut = {}
local UiCorners = {
	Saves.UICorner,
	Saves.Saves.UICorner,
	Saves.Saves.Frame.UICorner,
	Saves.Topnbottom.UICorner,
}

--Tween In
local bounceInTwn = TweenSrv:Create(Saves, BounceyyInTwnInf, {
	Position = UDim2.fromScale(0.316, 0.926),
	--{0.516, 0},{0.926, 0}
})

table.insert(
	TweenIn,
	TweenSrv:Create(Saves, BounceyyInTwnInf, {
		Size = UDim2.fromScale(0.664, 0.554),
		Position = UDim2.fromScale(0.311, 0.68),
		--{0.664, 0},{0.554, 0}
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Saves.Topnbottom.TextButton, BounceyyInTwnInf, {
		TextTransparency = 1,
	})
)

table.insert(
	TweenIn,
	TweenSrv:Create(Saves.Saves, BounceyyInTwnInf, {
		GroupTransparency = 0,
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
	Position = UDim2.fromScale(0.216, 0.926),
	--{0.516, 0},{0.926, 0}
})

table.insert(
	TweenOut,
	TweenSrv:Create(Saves, BounceyyInTwnInf, {
		Size = UDim2.fromScale(0.069, 0.057),
		Position = UDim2.fromScale(0.316, 0.926),
	})
)

table.insert(
	TweenOut,
	TweenSrv:Create(Saves.Topnbottom.TextButton, BounceyyInTwnInf, {
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
	bounceInTwn:Play()
	task.wait(0.1)
	for _, tween in ipairs(TweenIn) do
		tween:Play()
	end
end

function MenuSaves.Hide()
	for _, tween in ipairs(TweenOut) do
		tween:Play()
	end
	task.wait(0.1)
	bounceOutTwn:Play()
end

return MenuSaves

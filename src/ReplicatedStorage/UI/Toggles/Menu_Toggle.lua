local module = {}
local teleport = {}

print("lolz")

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tween = game:GetService("TweenService")
local Players = game:GetService("Players")

--Infinite Yield generators
local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer
local PlayerGUI = Player.PlayerGui
local MMenu = PlayerGUI.MainMenu
local MMMenu = MMenu:WaitForChild("Menu")
local MStats = MMenu:WaitForChild("Stats")
local Stats = PlayerGUI.TopBar.Stats
local Music = game.SoundService:WaitForChild("MenuMusic")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local Menu = player.PlayerGui:WaitForChild("MainMenu").BG
local Top_bar_Toggle = require(ReplicatedStorage.UI.Toggles.Top_bar_Toggle)
local FiberLines = {
	MMMenu.Logo.FiberLine1,
	MMMenu.Logo.FiberLine2,
	MMMenu.Logo.FiberLine3,
	MMMenu.Logo.FiberLine4,
	MMMenu.Logo.FiberLine5,
}

local MenuElements = {
	MMMenu.Logo.FiberLine1.Signal1,
	MMMenu.Logo.FiberLine1.Signal1.UIShadow,
	MMMenu.Logo.FiberLine1.Signal2,
	MMMenu.Logo.FiberLine1.Signal2.UIShadow,
	MMMenu.Logo.FiberLine1.Signal3,
	MMMenu.Logo.FiberLine1.Signal3.UIShadow,
	MMMenu.Logo.FiberLine1.Signal4,
	MMMenu.Logo.FiberLine1.Signal4.UIShadow,
	MMMenu.Logo.FiberLine2.Signal1,
	MMMenu.Logo.FiberLine2.Signal1.UIShadow,
	MMMenu.Logo.FiberLine2.Signal2,
	MMMenu.Logo.FiberLine2.Signal2.UIShadow,
	MMMenu.Logo.FiberLine2.Signal3,
	MMMenu.Logo.FiberLine2.Signal3.UIShadow,
	MMMenu.Logo.FiberLine2.Signal4,
	MMMenu.Logo.FiberLine2.Signal4.UIShadow,
	MMMenu.Logo.FiberLine3.Signal1,
	MMMenu.Logo.FiberLine3.Signal1.UIShadow,
	MMMenu.Logo.FiberLine3.Signal2,
	MMMenu.Logo.FiberLine3.Signal2.UIShadow,
	MMMenu.Logo.FiberLine3.Signal3,
	MMMenu.Logo.FiberLine3.Signal3.UIShadow,
	MMMenu.Logo.FiberLine4.Signal1,
	MMMenu.Logo.FiberLine4.Signal1.UIShadow,
	MMMenu.Logo.FiberLine4.Signal2,
	MMMenu.Logo.FiberLine4.Signal2.UIShadow,
	MMMenu.Logo.FiberLine4.Signal3,
	MMMenu.Logo.FiberLine4.Signal3.UIShadow,
	MMMenu.Logo.FiberLine5.Signal1,
	MMMenu.Logo.FiberLine5.Signal1.UIShadow,
	MMMenu.Logo.FiberLine5.Signal2,
	MMMenu.Logo.FiberLine5.Signal2.UIShadow,
	MMMenu.Logo.FiberLine5.Signal3,
	MMMenu.Logo.FiberLine5.Signal3.UIShadow,
	MMMenu.Logo.Cloud.Cloudpart1,
	MMMenu.Logo.Cloud.Cloudpart1.UIShadow,
	MMMenu.Logo.Cloud.Cloudpart2,
	MMMenu.Logo.Cloud.Cloudpart2.UIShadow,
	MMMenu.Logo.Cloud.Cloudpart3,
	MMMenu.Logo.Cloud.Cloudpart3.UIShadow,
	MMMenu.Logo.Cloud.Cloudpart4,
	MMMenu.Logo.Cloud.Cloudpart4.UIShadow,
}

--Tween Info

local CloudTween = TweenInfo.new(15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local CameraTween = TweenInfo.new(60, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local CameraTweenOUT = TweenInfo.new(2.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
local QuickINTWEEN = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
local InAnimINF = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

--Tweens

local QuickINTWEENR = Tween:Create(MMMenu, QuickINTWEEN, { BackgroundTransparency = 0 })
local QuickOUTTWEENR = Tween:Create(MMMenu, QuickINTWEEN, { BackgroundTransparency = 1 })
local AudioInTween = Tween:Create(Music, InAnimINF, { PlaybackSpeed = 0.97 })
local AudioOutTween = Tween:Create(Music, CameraTweenOUT, { PlaybackSpeed = 0 })
local CloudINTWEEN = Tween:Create(MMMenu.Logo.Cloud, CloudTween, { Size = UDim2.new(0.877, 0, 1.38, 0) })
local CloudOUTTWEEN = Tween:Create(MMMenu.Logo.Cloud, CloudTween, { Size = UDim2.new(0.457, 0, 1.38, 0) })
local BGRevealTwn = Tween:Create(MMenu.BG, InAnimINF, { BackgroundTransparency = 0 })
local BGHideTwn = Tween:Create(MMenu.BG, InAnimINF, { BackgroundTransparency = 1 })
local InAnim = Tween:Create(Camera, InAnimINF, {
	CFrame = CFrame.new(501.86, 108.826, -968.814) * CFrame.fromEulerAnglesXYZ(math.rad(-3.678), math.rad(151.875), 0),
})

local CameraOutTwn = Tween:Create(camera, CameraTweenOUT, { CFrame = CFrame.new(70.344, 14.464, 522.401) })
local MenuFrameTween = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)

local OutAnim = Tween:Create(
	Camera,
	InAnimINF,
	{ CFrame = CFrame.new(157.05, 40.139, 636.601) * CFrame.fromEulerAnglesXYZ(math.rad(-4.825), math.rad(25.252), 0) }
)

local DopamineTweenOUT = Tween:Create(Camera, CameraTween, {
	CFrame = CFrame.new(-423.882, 89.952, -884.297)
		* CFrame.fromEulerAnglesXYZ(math.rad(-1.673), math.rad(-155.126), 0),
})

local DopamineTweenOUT2 = Tween:Create(Camera, CameraTween, {
	CFrame = CFrame.new(157.05, 40.139, 636.601) * CFrame.fromEulerAnglesXYZ(math.rad(-4.825), math.rad(25.252), 0),
})

local DopamineTweenIN = Tween:Create(Camera, CameraTween, {
	CFrame = CFrame.new(501.86, 108.826, -968.814) * CFrame.fromEulerAnglesXYZ(math.rad(-3.678), math.rad(151.875), 0),
})
local StatsOut = Tween:Create(MStats, QuickINTWEEN, { Position = Stats.Position, Size = Stats.Size })

local StatIn = Tween:Create(MStats, QuickINTWEEN, {
	Position = UDim2.fromScale(0.523, 0.123),
	Size = UDim2.fromOffset(400, 16),
})

-- Coroutines

--Start of script
--hello
Camera.CameraType = Enum.CameraType.Scriptable

function module.show()
	local CloudDance = coroutine.create(function()
		while true do
			CloudINTWEEN:Play()
			task.wait(15)
			CloudOUTTWEEN:Play()
			task.wait(15)
			CloudINTWEEN:Play()
			task.wait(15)
		end
	end)

	local DopamineCamera = coroutine.create(function()
		while true do
			DopamineTweenOUT:Play()
			task.wait(60)
			DopamineTweenOUT2:Play()
			task.wait(60)
			DopamineTweenIN:Play()
			task.wait(60)
		end
	end)

	camera.CameraType = Enum.CameraType.Scriptable
	Tween:Create(Stats, QuickINTWEEN, { GroupTransparency = 1 }):Play()
	Tween:Create(MStats, QuickINTWEEN, { GroupTransparency = 0 }):Play()

	Top_bar_Toggle.Hide()
	BGHideTwn:Play()
	InAnim:Play()
	Music.Playing = true
	AudioInTween:Play()
	StatIn:Play()

	task.wait(1)

	Tween:Create(MMMenu.Logo.BG, InAnimINF, { BackgroundTransparency = 0.4 }):Play()

	local Elements = coroutine.create(function()
		for _, Item in ipairs(MenuElements) do
			print("WAHAHHHHHHHHH")
			if Item:IsA("Frame") then
				Tween:Create(Item, InAnimINF, { BackgroundTransparency = 0.1 }):Play()
			elseif Item:IsA("UIShadow") then
				Tween:Create(Item, InAnimINF, { Transparency = 0.45 }):Play()
			end
			task.wait(0.01)
		end
	end)

	coroutine.resume(Elements)

	for _, Line in ipairs(FiberLines) do
		print("WAHAHHHHHHHHH")
		Tween:Create(Line, InAnimINF, { BackgroundTransparency = 0.85 }):Play()
	end

	Tween:Create(MMMenu.Logo.TextLabel, InAnimINF, { Position = UDim2.fromScale(0.393, 0.258) }):Play()

	--Position = UDim2.fromScale(0, Line.Position.Y.Scale)

	coroutine.resume(CloudDance)
	coroutine.resume(DopamineCamera)
end

function module.hide(waitT, spawn)
	if spawn == 1 then
		teleport = Vector3.new(251.885, 15.364, 495.876)
	elseif spawn == 2 then
		teleport = Vector3.new(72.11, 15.491, 188.043)
	elseif spawn == 3 then
		teleport = Vector3.new(227.361, 14.331, -245.66)
	elseif spawn == 4 then
		teleport = Vector3.new(-36.424, 14, -496.437)
	elseif spawn == 5 then
		teleport = Vector3.new(73.024, 15.492, 516.045)
	end
	player.Character:MoveTo(teleport)
	local PlayerCam = Player.Character.Head.CFrame
		* CFrame.new(0, 3.236, 12.075)
		* CFrame.Angles(math.rad(-15), math.rad(0), math.rad(0))

	print("Humanoid" .. tostring(Player.Character.Head.CFrame))
	print("bi")

	local CloudDance = coroutine.create(function()
		while true do
			CloudINTWEEN:Play()
			task.wait(15)
			CloudOUTTWEEN:Play()
			task.wait(15)
			CloudINTWEEN:Play()
			task.wait(15)
		end
	end)

	local DopamineCamera = coroutine.create(function()
		while true do
			DopamineTweenOUT:Play()
			task.wait(60)
			DopamineTweenOUT2:Play()
			task.wait(60)
			DopamineTweenIN:Play()
			task.wait(60)
		end
	end)
	coroutine.close(CloudDance)
	coroutine.close(DopamineCamera)
	AudioOutTween:Play()

	Tween:Create(MMMenu.Logo.BG, InAnimINF, { BackgroundTransparency = 1 }):Play()

	Tween:Create(camera, CameraTweenOUT, { CFrame = PlayerCam }):Play()

	local Elements = coroutine.create(function()
		for _, Item in ipairs(MenuElements) do
			print("WAHAHHHHHHHHH")
			if Item:IsA("Frame") then
				Tween:Create(Item, InAnimINF, { BackgroundTransparency = 1 }):Play()
			elseif Item:IsA("UIShadow") then
				Tween:Create(Item, InAnimINF, { Transparency = 1 }):Play()
			end
			task.wait(0.01)
		end
	end)

	coroutine.resume(Elements)

	for _, Line in ipairs(FiberLines) do
		print("WAHAHHHHHHHHH")
		Tween:Create(Line, InAnimINF, { BackgroundTransparency = 1 }):Play()
	end

	Tween:Create(MMMenu.Logo.TextLabel, InAnimINF, { Position = UDim2.fromScale(1.393, 0.258) }):Play()

	player.Character:MoveTo(teleport + Vector3.new(0, 20, 0))
	player.Character.HumanoidRootPart.Anchored = true

	if waitT >= 2.5 then
		BGRevealTwn:Play()
	end

	task.wait(waitT)

	if waitT <= 2.5 then
		task.wait(1)
	end

	player.Character.HumanoidRootPart.Anchored = false
	Tween:Create(Menu, MenuFrameTween, { BackgroundTransparency = 1 }):Play()
	StatsOut:Play()
	task.wait(1)
	Tween:Create(Stats, QuickINTWEEN, { GroupTransparency = 0 }):Play()
	Tween:Create(MStats, QuickINTWEEN, { GroupTransparency = 1 }):Play()
	camera.CameraType = Enum.CameraType.Custom
	camera.CFrame = PlayerCam
	Top_bar_Toggle.Show()
	Music.Playing = false
	print("PlayerCam" .. tostring(PlayerCam))

	print("yas")
end

return module

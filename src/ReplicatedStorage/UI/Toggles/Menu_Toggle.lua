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
local MMMenu = MMenu.Menu
local Music = game.SoundService:WaitForChild("MenuMusic")
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local Menu = player.PlayerGui:WaitForChild("MainMenu").BG
local Top_bar_Toggle = require(ReplicatedStorage.UI.Toggles.Top_bar_Toggle)
local PlayerCam = Player.Character.Head.CFrame

--Tween Info

local CloudTween = TweenInfo.new(15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local CameraTween = TweenInfo.new(60, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local CameraTweenOUT = TweenInfo.new(2.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
local QuickINTWEEN = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
local InAnimINF = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

--Tweens

local QuickINTWEENR = Tween:Create(MMMenu, QuickINTWEEN, { GroupTransparency = 0 })
local QuickOUTTWEENR = Tween:Create(MMMenu, QuickINTWEEN, { GroupTransparency = 1 })
local AudioInTween = Tween:Create(Music, InAnimINF, { PlaybackSpeed = 0.97 })
local AudioOutTween = Tween:Create(Music, InAnimINF, { PlaybackSpeed = 0 })
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

-- Coroutines

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

--Start of script

Camera.CameraType = Enum.CameraType.Scriptable

function module.show()
	BGHideTwn:Play()
	InAnim:Play()
	QuickINTWEENR:Play()
	Music.Playing = true
	AudioInTween:Play()

	task.wait(1)

	coroutine.resume(CloudDance)
	coroutine.resume(DopamineCamera)
end

function module.hide(waitT, spawn)
	if spawn == 1 then
		teleport = Vector3.new(0, 0, 0)
	elseif spawn == 2 then
		teleport = Vector3.new(0, 0, 1)
	elseif spawn == 3 then
		teleport = Vector3.new(73.024, 15.5, 526)
	elseif spawn == 4 then
		teleport = Vector3.new(73, 15.5, 045)
	elseif spawn == 5 then
		teleport = Vector3.new(73.024, 15.5, 526.045)
	end
	player.Character:MoveTo(teleport - Vector3.new(0, 0, 10))
	print("bi")
	Tween:Create(camera, CameraTween, { CFrame = PlayerCam }):Play()

	player.Character:MoveTo(teleport + Vector3.new(0, 500, 0) - Vector3.new(0, 0, 10))

	CameraOutTwn:Play()
	coroutine.close(CloudDance)
	coroutine.close(DopamineCamera)
	AudioOutTween:Play()

	QuickOUTTWEENR:Play()

	if waitT >= 2.5 then
		BGRevealTwn:Play()
	end

	task.wait(waitT)

	if waitT <= 2.5 then
		task.wait(0.5)
	end

	player.Character:MoveTo(teleport + Vector3.new(0, 20, 0) - Vector3.new(0, 0, 10))
	Tween:Create(Menu, MenuFrameTween, { BackgroundTransparency = 1 }):Play()
	task.wait(1)
	camera.CFrame = PlayerCam
	camera.CameraType = Enum.CameraType.Custom
	camera.CFrame = PlayerCam
	Top_bar_Toggle.Show()
	Music.Playing = false
	print(PlayerCam)

	print("yas")
end

return module

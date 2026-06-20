local module = {}



--Services
local Tween = game:GetService("TweenService")
local Players = game:GetService("Players")

--Infinite Yield generators
local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer
local PlayerGUI = Player.PlayerGui
local MMenu = PlayerGUI.MainMenu
local MMMenu = MMenu.Menu
local Music = game.SoundService:WaitForChild("MenuMusic")



--Tween Info

local CloudTween = TweenInfo.new(15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut)
local CameraTween = TweenInfo.new(60,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut)
local QuickINTWEEN = TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.In)
local InAnimINF = TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

--Tweens

local QuickINTWEENR = Tween:Create(MMMenu,QuickINTWEEN,{GroupTransparency = 0})
local QuickOUTTWEENR = Tween:Create(MMMenu,QuickINTWEEN,{GroupTransparency = 1})
local AudioInTween = Tween:Create(Music,InAnimINF,{PlaybackSpeed = 0.97})
local AudioOutTween = Tween:Create(Music,InAnimINF,{PlaybackSpeed = 0})
local CloudINTWEEN = Tween:Create(MMMenu.Logo.Cloud,CloudTween,{Size = UDim2.new(0.877, 0,1.38, 0)})
local CloudOUTTWEEN = Tween:Create(MMMenu.Logo.Cloud,CloudTween,{Size = UDim2.new(0.457, 0,1.38, 0)})
local BGRevealTwn = Tween:Create(MMenu.BG,InAnimINF,{BackgroundTransparency = 0})
local BGHideTwn = Tween:Create(MMenu.BG,InAnimINF,{BackgroundTransparency = 1})
local InAnim = Tween:Create(Camera,InAnimINF,{CFrame = CFrame.new(501.86, 108.826, -968.814) * CFrame.fromEulerAnglesXYZ(math.rad(-3.678), math.rad(151.875), 0)})
local OutAnim = Tween:Create(Camera,InAnimINF,{CFrame = CFrame.new(157.05, 40.139, 636.601) * CFrame.fromEulerAnglesXYZ(math.rad(-4.825), math.rad(25.252), 0)})


local DopamineTweenOUT = Tween:Create(Camera,CameraTween,{
	CFrame = CFrame.new(-423.882, 89.952, -884.297) * CFrame.fromEulerAnglesXYZ(math.rad(-1.673), math.rad(-155.126), 0)
})

local DopamineTweenOUT2 = Tween:Create(Camera,CameraTween,{
	CFrame = CFrame.new(157.05, 40.139, 636.601) * CFrame.fromEulerAnglesXYZ(math.rad(-4.825), math.rad(25.252), 0)
})

local DopamineTweenIN = Tween:Create(Camera,CameraTween,{
	CFrame = CFrame.new(501.86, 108.826, -968.814) * CFrame.fromEulerAnglesXYZ(math.rad(-3.678), math.rad(151.875), 0)
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

function module.show ()
	BGHideTwn:Play()
	InAnim:Play()
	QuickINTWEENR:Play()
	Music.Playing = true
	AudioInTween:Play()


	wait(1)


	coroutine.resume(CloudDance)
	coroutine.resume(DopamineCamera)
end

function module.hide ()
	BGRevealTwn:Play()
	QuickOUTTWEENR:Play()
	
	OutAnim:Play()
	Music.Playing = true
	AudioOutTween:Play()


	wait(1)


	coroutine.close(CloudDance)
	coroutine.close(DopamineCamera)
end

return module
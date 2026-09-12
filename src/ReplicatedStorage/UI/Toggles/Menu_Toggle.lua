local module = {}

--Services
local Players = game:GetService("Players")
local Tween = game:GetService("TweenService")

--Infinite Yield generators
local TransEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerTrans")
local PlotAsignal = require(game:GetService("ReplicatedStorage").Storage.Plot_Asignal)
local TopBar = require(game:GetService("ReplicatedStorage").UI.Toggles.Top_bar_Toggle)
local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer
local MMenu = Player.PlayerGui:WaitForChild("MainMenu")
local MMMenu = MMenu:WaitForChild("Menu")
local MStats = MMenu:WaitForChild("Stats")
local Stats = Player.PlayerGui.TopBar.Stats
local Music = game.SoundService:WaitForChild("MenuMusic")

TopBar.Hide()
MMMenu.Buttons.Continue.Position = UDim2.fromScale(-2, 0)
MMMenu.Buttons.Settings.Position = UDim2.fromScale(-1.063, 0.734)
MMMenu.Buttons.Saves.Position = UDim2.fromScale(-1.641, 0.734)
MMMenu.Logo.BG.BackgroundTransparency = 1

--Logo Element Index

local LogoElements = {}
local Fiberlines = {}

for i = 1, 5 do
	local FiberLine = MMMenu.Logo:WaitForChild("FiberLine" .. i)
	table.insert(Fiberlines, FiberLine)

	for i2 = 1, 4 do
		local signal = FiberLine:WaitForChild("Signal" .. i2)
		table.insert(LogoElements, signal)
		table.insert(LogoElements, signal.UIShadow)
	end
end

for i = 1, 4 do
	local Cloudpart = MMMenu.Logo.Cloud:WaitForChild("Cloudpart" .. i)
	table.insert(LogoElements, Cloudpart)
	table.insert(LogoElements, Cloudpart.UIShadow)
end

TransEvent:FireServer(1)
--

local function CloudDance()
	local CloudTween = TweenInfo.new(15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local T1 = Tween:Create(MMMenu.Logo.Cloud, CloudTween, { Size = UDim2.fromScale(0.877, 1.38) })
	local T2 = Tween:Create(MMMenu.Logo.Cloud, CloudTween, { Size = UDim2.fromScale(0.457, 1.38) })

	while true do
		T1:Play()
		print("tween 1 start")
		local state = T1.Completed:Wait()
		print("T1 completed with:", state)
		T2:Play()
		T2.Completed:Wait()
		print("tweencomplet")
	end
end

local function DopamineCamera()
	local CameraTween = TweenInfo.new(60, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	while true do
		Tween:Create(Camera, CameraTween, {
			CFrame = CFrame.new(-423.882, 89.952, -884.297)
				* CFrame.fromEulerAnglesXYZ(math.rad(-1.673), math.rad(-155.126), 0),
		}):Play()

		task.wait(60)

		Tween:Create(Camera, CameraTween, {
			CFrame = CFrame.new(157.05, 40.139, 636.601)
				* CFrame.fromEulerAnglesXYZ(math.rad(-4.825), math.rad(25.252), 0),
		}):Play()

		task.wait(60)

		Tween:Create(Camera, CameraTween, {
			CFrame = CFrame.new(501.86, 108.826, -968.814)
				* CFrame.fromEulerAnglesXYZ(math.rad(-3.678), math.rad(151.875), 0),
		}):Play()

		task.wait(60)
	end
end

local function MainTween(EasingDirection)
	print("IVE BEEN ACTIVATED")
	local InAnimINF = TweenInfo.new(1, Enum.EasingStyle.Quint, EasingDirection)
	local InTweenInf = TweenInfo.new(0.5, Enum.EasingStyle.Quint, EasingDirection)
	Tween:Create(MMMenu.Logo, InTweenInf, { Size = UDim2.fromScale(1, 0.219), Position = UDim2.fromScale(0, 0.135) })
		:Play()

	local TweenTargets = {
		[Enum.EasingDirection.In] = {

			CameraTarget = CFrame.new(501.86, 108.826, -968.814)
				* CFrame.fromEulerAnglesXYZ(math.rad(-3.678), math.rad(151.875), 0),
			LogoBG = 0.7,
			FiberLineBG = 0.8,
			SignalT = 0.1,
			SignalShadowT = 0.2,
			PlaybackSpeedTarget = 0.97,

			MStatsPos = {
				Position = UDim2.fromScale(0.523, 0.123),
				Size = UDim2.fromOffset(400, 16),
			},
			CamSpeed = 1,
			CamEasing = Enum.EasingDirection.In,
		},

		[Enum.EasingDirection.Out] = {

			CameraTarget = Player.Character.Head.CFrame
				* CFrame.new(0, 3.236, 12.5)
				* CFrame.Angles(math.rad(-15), math.rad(0), math.rad(0)),
			LogoBG = 1,
			FiberLineBG = 1,
			SignalT = 1,
			SignalShadowT = 1,
			PlaybackSpeedTarget = 0,

			MStatsPos = {
				Position = Stats.Position,
				Size = Stats.Size,
			},
			CamSpeed = 3,
			CamEasing = Enum.EasingDirection.InOut,
		},
	}
	local TweenTarget = TweenTargets[EasingDirection]
	local CamTweenINF = TweenInfo.new(TweenTarget.CamSpeed, Enum.EasingStyle.Quint, TweenTarget.CamEasing)

	--Checks the argument

	if not TweenTarget then
		print("FKNWHAT")
		print(TweenTarget)
		return
	end

	--Animation Start
	Camera.CameraType = Enum.CameraType.Scriptable

	local CameraTween = Tween:Create(Camera, CamTweenINF, { CFrame = TweenTarget.CameraTarget })

	Tween:Create(Music, CamTweenINF, { PlaybackSpeed = TweenTarget.PlaybackSpeedTarget }):Play()
	CameraTween:Play()

	Tween:Create(MStats, CamTweenINF, TweenTarget.MStatsPos):Play()

	--Tweens FibeLines Transparency

	Tween:Create(MMMenu.Logo.BG, InAnimINF, { BackgroundTransparency = TweenTarget.LogoBG }):Play()
	Tween:Create(MMMenu.Logo.BG, InAnimINF, { BackgroundColor3 = Color3.new(0, 0, 0) }):Play()
	for _, Line in ipairs(Fiberlines) do
		Tween:Create(Line, InAnimINF, { BackgroundTransparency = TweenTarget.FiberLineBG }):Play()
	end

	--Tweens Logo Elements Transparency

	task.spawn(function()
		for _, Item in ipairs(LogoElements) do
			if Item:IsA("Frame") then
				Tween:Create(Item, InAnimINF, { BackgroundTransparency = TweenTarget.SignalT }):Play()
			elseif Item:IsA("UIShadow") then
				Tween:Create(Item, InAnimINF, { Transparency = TweenTarget.SignalShadowT }):Play()
			end
			task.wait(0.02)
		end
	end)

	CameraTween.Completed:Wait()
end

local function Buttons(Show)
	local Properties = {
		[true] = {
			Continue = { Position = UDim2.fromScale(0, 0) },
			Settings = { Position = UDim2.fromScale(0.063, 0.734) },
			Saves = { Position = UDim2.fromScale(0.641, 0.734) },
		},
		[false] = {
			Continue = { Position = UDim2.fromScale(-2, 0) },
			Settings = { Position = UDim2.fromScale(-1.063, 0.734) },
			Saves = { Position = UDim2.fromScale(-1.641, 0.734) },
		},
	}
	local Propt = Properties[Show]

	local TweenInf = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

	Tween:Create(MMMenu.Buttons.Continue, TweenInf, Propt.Continue):Play()
	task.wait(0.1)
	Tween:Create(MMMenu.Buttons.Settings, TweenInf, Propt.Settings):Play()
	task.wait(0.1)
	Tween:Create(MMMenu.Buttons.Saves, TweenInf, Propt.Saves):Play()
end

--Start of script

function module.show(PreHide)
	MMenu.Enabled = true
	MMMenu.Logo.BG.BgGradient.Enabled = true
	local QuickINTWEEN = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	MStats.Visible = true

	local StatsTwn = Tween:Create(Stats, QuickINTWEEN, { GroupTransparency = 1 })
	Tween:Create(MStats, QuickINTWEEN, { GroupTransparency = 0 }):Play()
	StatsTwn:Play()
	if not PreHide then
		print("YIAY")
		StatsTwn.Completed:Wait()
		TopBar.Hide()
	end

	Music:Resume()

	print("ehrm")

	MainTween(Enum.EasingDirection.In)

	CloudDanceTASK = task.spawn(CloudDance)
	DopamineCameraTASK = task.spawn(DopamineCamera)

	Tween:Create(MMMenu.Logo.TextLabel, QuickINTWEEN, { Position = UDim2.fromScale(0.393, 0.258) }):Play()

	Buttons(true)
end

function module.hide(waitT, SpawnNum)
	TransEvent:FireServer(1)
	local SpawnLocation = PlotAsignal.plots[5].TP

	if SpawnNum then
		SpawnLocation = PlotAsignal.plots[SpawnNum].TP
	end

	Player.Character:MoveTo(SpawnLocation)

	task.spawn(Buttons, false)

	local QuickINTWEEN = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

	Tween:Create(MMMenu.Logo.TextLabel, QuickINTWEEN, { Position = UDim2.fromScale(1.393, 0.258) }):Play()

	task.cancel(CloudDanceTASK)
	task.cancel(DopamineCameraTASK)

	print("HEAD CFRAME: " .. tostring(Player.Character.Head.CFrame))

	MainTween(Enum.EasingDirection.Out)

	print("CAMERA POS AFTER TWEEN: " .. tostring(Camera.CFrame))
	Player.Character:MoveTo(SpawnLocation + Vector3.new(0, 20, 0))
	Player.Character.PrimaryPart.Anchored = true

	TransEvent:FireServer(0)
	Player.Character.PrimaryPart.Anchored = false

	task.wait(1)

	Camera.CameraType = Enum.CameraType.Custom

	local StatTween = Tween:Create(MStats, QuickINTWEEN, { GroupTransparency = 1 })
	Tween:Create(Stats, QuickINTWEEN, { GroupTransparency = 0.3 }):Play()

	StatTween:Play()
	task.spawn(TopBar.Show)
	StatTween.Completed:Wait()

	MStats.Visible = false

	print("CAMERA POS AFTER script: " .. tostring(Camera.CFrame))

	MMenu.Enabled = false
end

return module

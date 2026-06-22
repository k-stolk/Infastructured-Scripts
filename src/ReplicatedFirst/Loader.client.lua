--Services
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")

--Infinite yield generators
local player = Players.LocalPlayer
local PlayerID = tostring(player.UserId)
local camera = workspace.CurrentCamera
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local workspaceplayerhead = workspace:WaitForChild(tostring(player)).Head
local loadingScreen = ReplicatedFirst:FindFirstChild("Preloading")
local menu = require(game.StarterGui.MainMenu.Menu.MenuToggle)
local PrimarySystems = ReplicatedStorage:WaitForChild("Primary Systems")
local ServerLoader = PrimarySystems:WaitForChild("Loader")

--Variables
local DPRESS = 0
local Loaded = false

--Tweeninfo
local BarTween = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local FrameTween = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local CameraTween = TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
local LSTween = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

--Tweens
local LSTweenOut = Tween:Create(loadingScreen.Preloading, LSTween, { GroupTransparency = 1 })
local BgReveal = Tween:Create(loadingScreen.Preloading, FrameTween, { BackgroundTransparency = 0.08 })
local HideTxtTwn = Tween:Create(loadingScreen.Preloading.Frame.Loader, BarTween, { TextTransparency = 1 })
local ShowTxtTwn = Tween:Create(loadingScreen.Preloading.Frame.Loader, BarTween, { TextTransparency = 0 })

--Start of script

Tween:Create(loadingScreen.Preloading.Frame.Loader, FrameTween, { TextTransparency = 0 }):Play()

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.D and Loaded == false then
		DPRESS += 1
		print(DPRESS)
		if DPRESS >= 3 then
			loadingScreen.Preloading.Frame.DevMode.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			print("🤤")

			if DPRESS > 10 then
				player.Character:MoveTo(Vector3.new(96.368, 940.017, -177.03))
				loadingScreen:Destroy()
				camera.CameraType = Enum.CameraType.Custom
				task.wait(0.5)
				script:Destroy()
			end
		end
	end
end)

local camerapos = coroutine.create(function()
	while true do
		camera.CameraType = Enum.CameraType.Scriptable
		local posX, posY, posZ = 158.516, 13.535, -856.884

		-- 2. Your exact Orientation angles (converted to radians)
		local rotX = math.rad(18.115)
		local rotY = math.rad(135.936)
		local rotZ = math.rad(0)

		-- 3. Combine them effortlessly
		camera.CFrame = CFrame.new(posX, posY, posZ) * CFrame.fromOrientation(rotX, rotY, rotZ)

		task.wait(1)
	end
end)

local Loadinganim = coroutine.create(function()
	local loadbar = loadingScreen.Preloading.LoadBar.thingy

	loadbar.Position = UDim2.new(0, 0, 0, 0)
	loadbar.Size = UDim2.new(0, 0, 1, 0)

	while true do
		--loadbar.Size = UDim2.new(0, 0,0, 0)

		Tween:Create(loadbar, BarTween, { Position = UDim2.new(0, 0, 0, 0) }):Play()
		Tween:Create(loadbar, BarTween, { Size = UDim2.new(0, 0, 1, 0) }):Play()

		task.wait(1)

		Tween:Create(loadbar, BarTween, { Position = UDim2.new(0, 0, 0, 0) }):Play()
		Tween:Create(loadbar, BarTween, { Size = UDim2.new(1, 0, 1, 0) }):Play()

		task.wait(1)

		Tween:Create(loadbar, BarTween, { Position = UDim2.new(0.997, 0, 0, 0) }):Play()
		Tween:Create(loadbar, BarTween, { Size = UDim2.new(0.003, 0, 1, 0) }):Play()

		task.wait(1)

		Tween:Create(loadbar, BarTween, { Position = UDim2.new(0, 0, 0, 0) }):Play()
		Tween:Create(loadbar, BarTween, { Size = UDim2.new(1, 0, 1, 0) }):Play()

		task.wait(1)

		Tween:Create(loadbar, BarTween, { Position = UDim2.new(0, 0, 0, 0) }):Play()
		Tween:Create(loadbar, BarTween, { Size = UDim2.new(0, 0, 1, 0) }):Play()
	end
end)

if loadingScreen then
	print("wazah")
	loadingScreen.IgnoreGuiInset = true
	loadingScreen.Parent = playerGui

	-- Remove the default loading screen
	ReplicatedFirst:RemoveDefaultLoadingScreen()
	coroutine.resume(camerapos)
	coroutine.resume(Loadinganim)

	print(PlayerID)
	local RETURNED = {ServerLoader:InvokeServer()}
	print(RETURNED)
	print(RETURNED[1])

	--workspace.k_stolk.Head.CFrame.char

	BgReveal:Play()

	task.wait(5)
	print("waited")
	if DPRESS == 3 then
		player.Character:MoveTo(Vector3.new(96.368, 940.017, -177.03))
		task.wait(3)
		coroutine.close(camerapos)
		Loaded = true
		local target = workspaceplayerhead.CFrame
		loadingScreen:Destroy()
		Tween:Create(camera, CameraTween, { CFrame = target }):Play()
		task.wait(3)
		camera.CameraType = Enum.CameraType.Custom
	else
		if RETURNED[1] == true then
			print("NICE")
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = false

			coroutine.close(Loadinganim)
			coroutine.close(camerapos)

			Loaded = true

			HideTxtTwn:Play()

			task.wait(1)
			loadingScreen.Preloading.Frame.Loader.Text = "Welcome, " .. tostring(Players.LocalPlayer.Name)

			ShowTxtTwn:Play()

			task.wait(3)

			LSTweenOut:Play()

			menu.show()

			task.wait(5)

			loadingScreen:Destroy()
			script:Destroy()
		elseif RETURNED[1] == string then
			print("LOL WTF HAPPEND")
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text = RETURNED[1]
		elseif RETURNED[1] == nil then
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text = "I have no idea what happend..., this is what passed said: "..tostring(RETURNED[1])
		end
	end
end

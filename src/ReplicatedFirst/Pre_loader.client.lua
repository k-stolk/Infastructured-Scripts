--Services

local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
local Tween = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local workspace = game:GetService("Workspace")
local PreLoading = ReplicatedFirst:FindFirstChild("Preloading")
local player = Players.LocalPlayer

--Loading Screen Replace

ReplicatedFirst:RemoveDefaultLoadingScreen()
PreLoading.IgnoreGuiInset = true
PreLoading.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

--Waits for load GUI

local loadingScreen = player.PlayerGui:WaitForChild("Preloading")



if loadingScreen then
	--TweenInfo
	local BarTween = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local FrameTween = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local CameraTween = TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
	local LSTween = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

	--Loading screen text in

	Tween:Create(loadingScreen.Preloading.Frame.Loader, FrameTween, { TextTransparency = 0 }):Play()

	--Inf Yield generators

	local PlayerID = tostring(player.UserId)
	local camera = workspace.CurrentCamera
	local ServerLoader = game.ReplicatedStorage:WaitForChild("Events").Load_in
	local workspaceplayerhead = workspace:WaitForChild(tostring(player)).Head
	local UI = ReplicatedStorage:WaitForChild("UI")
	local PlotAsign = require(ReplicatedStorage.Storage.Plot_Asignal)
	local menu = require(UI:WaitForChild("Menu").Menu)

	--Variables
	local DPRESS = 0
	local Loaded = false
	local GudService = nil

	--Tweens
	local LSTweenOut = Tween:Create(
		loadingScreen.Preloading,
		LSTween,
		{ GroupTransparency = 1, Position = UDim2.fromScale(0, 0.135), Size = UDim2.fromScale(1, 0.219) }
	)
	local BgReveal = Tween:Create(loadingScreen.Preloading, FrameTween, { BackgroundTransparency = 0.08 })
	local HideTxtTwn = Tween:Create(loadingScreen.Preloading.Frame.Loader, BarTween, { TextTransparency = 1 })
	local ShowTxtTwn = Tween:Create(loadingScreen.Preloading.Frame.Loader, BarTween, { TextTransparency = 0 })

	--Start of script

	Tween:Create(loadingScreen.Preloading.Frame.Loader, FrameTween, { TextTransparency = 0 }):Play()
	--TransEvent:FireServer(1,player)

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

	function camerapos()
		while true do
			camera.CameraType = Enum.CameraType.Scriptable
			local posX, posY, posZ = 158.516, 13.535, -856.884

			local rotX = math.rad(18.115)
			local rotY = math.rad(135.936)
			local rotZ = math.rad(0)

			camera.CFrame = CFrame.new(posX, posY, posZ) * CFrame.fromOrientation(rotX, rotY, rotZ)

			task.wait(1)
		end
	end

	function Loadinganim()
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
	end

	print("wazah")

	local CameraPosTH = task.spawn(camerapos)
	local LoadinganimTH = task.spawn(Loadinganim)

	print("Pre-Serverloader Fire" .. tostring(PlayerID))
	local RETURNED = { ServerLoader:InvokeServer() }
	print("Post-Serverloader Fire, Serverloader returned:" .. tostring(RETURNED))
	print(RETURNED)
	--workspace.k_stolk.Head.CFrame.char

	BgReveal:Play()

	--start of afterload

	for Plot, SavdPlayer in ipairs(PlotAsign.plots) do
		if Plot == 5 then
			GudService = "NO PLOTS LEFT"
			print("FUH")
			break
		end
		if SavdPlayer.Assignee == "nix" then
			SavdPlayer.Assignee = player
			print("Assigned you to plot " .. Plot)
			break
		end
	end

	if player.Name ~= "k_stol" then
		GudService = "Your save file apears to be corrupt, please contact a developer"
		loadingScreen.Preloading.Frame.Error.BADERR.Playing = true
	end

	print(PlotAsign.plots)

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
		if RETURNED[1] == true and not GudService then
			if RETURNED[2] == "New Player!" then
				print("Hello new player :D, now get out of the console and play the game i spend a year making")
				loadingScreen.Preloading.Frame.DevMode.Visible = false
				loadingScreen.Preloading.Frame.Error.Visible = false

				task.cancel(CameraPosTH)
				task.cancel(LoadinganimTH)

				Loaded = true

				HideTxtTwn:Play()

				task.wait(1)
				loadingScreen.Preloading.Frame.Loader.Text = "Welcome, " .. tostring(Players.LocalPlayer.Name)

				ShowTxtTwn:Play()

				task.wait(3)

				LSTweenOut:Play()

				menu.show(true)

				loadingScreen:Destroy()
				script:Destroy()
			elseif not RETURNED[2] then
				print(RETURNED[2])
				loadingScreen.Preloading.Frame.DevMode.Visible = false
				loadingScreen.Preloading.Frame.Error.Visible = false

				task.cancel(CameraPosTH)
				task.cancel(LoadinganimTH)

				print("hiii")

				Loaded = true

				LSTweenOut:Play()
				menu.show(true)
				LSTweenOut.Completed:Wait()

				loadingScreen:Destroy()
				script:Destroy()
			end
		elseif GudService then
			print("LOL WTF HAPPEND")
			task.cancel(CameraPosTH)
			task.cancel(LoadinganimTH)
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text = GudService
		elseif typeof(RETURNED[1]) == "string" then
			task.cancel(CameraPosTH)
			task.cancel(LoadinganimTH)
			print("LOL WTF HAPPEND")
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text = "Debug: " .. RETURNED[1]
		elseif RETURNED[1] == false then
			task.cancel(CameraPosTH)
			task.cancel(LoadinganimTH)
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text = "Debug: GudService was being nonchalant and just said false"
		elseif RETURNED[1] == nil then
			task.cancel(CameraPosTH)
			task.cancel(LoadinganimTH)
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text =
				"Debug: I have no idea what happend, cuz stupid GudService said NOTHING"
		else
			task.cancel(CameraPosTH)
			task.cancel(LoadinganimTH)
			loadingScreen.Preloading.Frame.DevMode.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.Loader.Visible = false
			loadingScreen.Preloading.Frame.Error.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Visible = true
			loadingScreen.Preloading.Frame.DEBUG.Text = "Debug: I have no idea what happend..., this is what GudService said: "
				.. tostring(RETURNED[1])
		end
	end
end

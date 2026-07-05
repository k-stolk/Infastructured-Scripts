local Inposs = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tween = game:GetService("TweenService")
local camera = workspace.CurrentCamera
local player = game:GetService("Players").LocalPlayer

local Menu = player.PlayerGui:WaitForChild("MainMenu").BG

local MenuTog = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)
local Top_bar_Toggle = require(ReplicatedStorage.UI.Toggles.Top_bar_Toggle)

local CameraTween = TweenInfo.new(2.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
local MenuFrameTween = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
Top_bar_Toggle.Hide()

local menutoggle = coroutine.create(function()
	MenuTog.hide()
end)

Inposs.InputBegan:Connect(function()
	if Inposs:IsKeyDown(Enum.KeyCode.B) and Inposs:IsKeyDown(Enum.KeyCode.Y) then
		local workspaceplayerhead = workspace:WaitForChild(tostring(player)).Head
		local target = workspaceplayerhead.CFrame
		player.Character:MoveTo(Vector3.new(70.344, 14.464, 512.401))
		print("bi")
		Tween:Create(camera, CameraTween, { CFrame = CFrame.new(70.344, 14.464, 522.401) }):Play()
		coroutine.resume(menutoggle)
		task.wait(2)
		player.Character:MoveTo(Vector3.new(70.344, 34.464, 512.401))
		Tween:Create(Menu, MenuFrameTween, { BackgroundTransparency = 1 }):Play()
		task.wait(1)
		camera.CameraType = Enum.CameraType.Custom
		Top_bar_Toggle.Show()
	end
end)

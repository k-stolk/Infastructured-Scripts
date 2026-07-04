local Inposs = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tween = game:GetService("TweenService")
local camera = workspace.CurrentCamera
local player = game:GetService("Players")
local workspaceplayerhead = workspace:WaitForChild(tostring(player)).Head

local MenuTog = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)

local CameraTween = TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)

Inposs.InputBegan:Connect(function()
	if Inposs.GetKeysPressed() == Enum.KeyCode.B and Enum.KeyCode.Y then
		MenuTog.hide()
		player.Character:MoveTo(Vector3.new(96.368, 940.017, -177.03))
		task.wait(3)
		local target = workspaceplayerhead.CFrame
		Tween:Create(camera, CameraTween, { CFrame = target }):Play()
		task.wait(3)
		camera.CameraType = Enum.CameraType.Custom
	end
end)

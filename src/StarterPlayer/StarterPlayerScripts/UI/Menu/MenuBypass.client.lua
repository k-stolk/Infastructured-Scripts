local Inposs = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tween = game:GetService("TweenService")
local camera = workspace.CurrentCamera
local player = game:GetService("Players").LocalPlayer
local Menu = player.PlayerGui:WaitForChild("MainMenu").BG
local MenuToggle = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)

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
		MenuToggle.hide(2,5)
	end
end)

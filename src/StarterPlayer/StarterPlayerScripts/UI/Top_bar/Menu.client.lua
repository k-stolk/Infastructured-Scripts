local Player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Tween = game:GetService("TweenService")

local PlayerGui = Player.PlayerGui

local Current = PlayerGui:WaitForChild("TopBar").Leading.Save.Menu.Menu
local MenuTog = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)

local Button = Current.Button

local UpSound = Button.UIButtonUp
local DwnSound = Button.UIButtonDwn
local hvrSound = Button.UIButtonHvr

local TweenInfuhHVR = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local state = false

local Hover = false

Current.Button.MouseEnter:Connect(function()
	Hover = true
	if state == false then
		Tween:Create(Button, TweenInfuhHVR, {
			BackgroundTransparency = 0.6,
		}):Play()
	elseif state == true then
		Tween:Create(Button, TweenInfuhHVR, {
			BackgroundTransparency = 0.8,
		}):Play()
	end

	hvrSound.TimePosition = 0
	hvrSound.Playing = true
	hvrSound.Ended:Connect(function()
		hvrSound.Playing = false
	end)

	task.wait(1)
	if Hover == true then
		Current.Tooltip.Visible = true
		Tween:Create(Current.Tooltip, TweenInfuhHVR, {
			GroupTransparency = 0.3,
			Position = UDim2.fromOffset(21, 48),
		}):Play()
	end
end)

Current.Button.MouseLeave:Connect(function()
	Hover = false
	Tween:Create(Current.Tooltip, TweenInfuhHVR, {
		GroupTransparency = 1,
		Position = UDim2.fromOffset(21, 40),
	}):Play()
	Current.Tooltip.Visible = false
	if state == false then
		Tween:Create(Button, TweenInfuhHVR, {
			BackgroundTransparency = 1,
		}):Play()
	elseif state == true then
		Tween:Create(Button, TweenInfuhHVR, {
			BackgroundTransparency = 0.6,
		}):Play()
	end
end)

Current.Button.MouseButton1Up:Connect(function()
	Current.Button.Interactable = false
	Hover = false
	UpSound.TimePosition = 0
	UpSound.Playing = true
	UpSound.Ended:Connect(function()
		UpSound.Playing = false
	end)

	Tween:Create(Button, TweenInfuhHVR, {
		BackgroundTransparency = 1,
	}):Play()
	MenuTog.show(false)
	Current.Button.Interactable = true
end)

Current.Button.MouseButton1Down:Connect(function()
	Hover = false

	DwnSound.TimePosition = 0
	DwnSound.Playing = true
	DwnSound.Ended:Connect(function()
		DwnSound.Playing = false
	end)
end)

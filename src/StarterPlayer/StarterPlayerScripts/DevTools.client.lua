local Inposs = game:GetService('UserInputService')
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TweenService = game:GetService('TweenService')
local Me = Players.LocalPlayer
local DeveloperGUI = Me.PlayerGui:WaitForChild("Developer")
local DevTools = {}

function Notif(Message)
	local Tween = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	local Tween2 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local Notive = DeveloperGUI.Notif

	Notive.Notif.Notif.Text = Message

	Notive.Visible = true

	TweenService:Create(Notive, Tween, { GroupTransparency = 0 }):Play()
	TweenService:Create(Notive.UIShadow, Tween, { Transparency = 0.5 }):Play()

	task.wait(1)

	TweenService:Create(Notive, Tween2, { GroupTransparency = 1 }):Play()
	TweenService:Create(Notive.UIShadow, Tween2, { Transparency = 1 }):Play()
	Notive.Visible = true
end

function DevTools.BypassMenu()
	Notif("Bypassing Menu")
	local MenTog = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)
	MenTog.hide(15, 5)
	Notif("Menu Bypassed")
end

function DevTools.ShowMenu()
	Notif("Opening Menu")
	local MenTog = require(ReplicatedStorage.UI.Toggles.Menu_Toggle)
	MenTog.show()
	Notif("Menu Open")
end

function DevTools.Trans()
	Notif("Made you trans")
	local TransEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerTrans")
	TransEvent:FireServer(1)
	Notif("You're now trans")
end

function DevTools.UnTrans()
	Notif("Made you trans")
	local TransEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerTrans")
	TransEvent:FireServer(0)
	Notif("You're now trans")
end

Inposs.InputBegan:Connect(function()
	if Inposs:IsKeyDown(Enum.KeyCode.B) and Inposs:IsKeyDown(Enum.KeyCode.Y) then
		DevTools.BypassMenu()
	end
end)

Inposs.InputBegan:Connect(function()
	if Inposs:IsKeyDown(Enum.KeyCode.M) and Inposs:IsKeyDown(Enum.KeyCode.R) then
		DevTools.ShowMenu()
	end
end)

Inposs.InputBegan:Connect(function()
	if Inposs:IsKeyDown(Enum.KeyCode.T) and Inposs:IsKeyDown(Enum.KeyCode.R) then
		DevTools.Trans()
	end
end)

Inposs.InputBegan:Connect(function()
	if Inposs:IsKeyDown(Enum.KeyCode.T) and Inposs:IsKeyDown(Enum.KeyCode.U) then
		DevTools.UnTrans()
	end
end)

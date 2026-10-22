local Player = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGUI = Player.PlayerGui
local MainMenu = PlayerGUI:WaitForChild("MainMenu")
local Menu = MainMenu:WaitForChild("Menu"):WaitForChild("Buttons")
local MenuToggle = require(ReplicatedStorage.UI.Menu.Menu)
local PAsign = require(ReplicatedStorage.Storage.Plot_Asignal)
local SettingsToggle = require(ReplicatedStorage.UI.Menu.Settings)
local SavesToggles = require(ReplicatedStorage.UI.Menu.Saves)
local Error = "nix"

if Player.Name ~= "k_stosk" then
	Error = "No access!"
end

if true then
	Error = "No save loaded"
end


local TweenSRV = game:GetService("TweenService")

--Variables
local Hover = false

--TWIN INFO
local HvrSTweenINF = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local ClckSTweenINF = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local HvrETweenINF = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local BAMTweenInf = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

--TWINSSSSSS

local ShadowTweenS = TweenSRV:Create(Menu.Continue.UIShadow, HvrSTweenINF, { Transparency = 0.7 })
local ShadowTweenE = TweenSRV:Create(Menu.Continue.UIShadow, HvrSTweenINF, { Transparency = 0.9 })

local HvrSTween = TweenSRV:Create(Menu.Continue, HvrSTweenINF, { Transparency = 0.8 })
local HvrETween = TweenSRV:Create(Menu.Continue, HvrETweenINF, { Transparency = 1 })
local ClckSTween = TweenSRV:Create(Menu.Continue, ClckSTweenINF, { Transparency = 0.6 })

local HvrStrokeSTween = TweenSRV:Create(Menu.Continue.ambstroke, HvrSTweenINF, { Transparency = 1 })
local HvrStrokeETween = TweenSRV:Create(Menu.Continue.ambstroke, HvrETweenINF, { Transparency = 0.2 })

local HvrTextSTween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.31, 0),
	PaddingTop = UDim.new(0.31, 0),
})

local ClckTextSTween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.35, 0),
	PaddingTop = UDim.new(0.35, 0),
})

local HvrTextETween = TweenSRV:Create(Menu.Continue.Topnbottom.UIPadding, HvrSTweenINF, {
	PaddingBottom = UDim.new(0.3, 0),
	PaddingTop = UDim.new(0.3, 0),
})

function BihError(Message)
	Menu.Continue.TriggerPoint.Sound:Play()
	ClckSTween:Play()
	Menu.Continue.BackgroundColor3 = Color3.new(1, 0, 0)
	Menu.Continue.UIShadow.Color = Color3.new(1, 0, 0)
	Menu.Continue.Topnbottom.TEXT2.Text = tostring(Message)
	Menu.Continue.Topnbottom.TEXT2.TextTransparency = 0
	Menu.Continue.Topnbottom.TextButton.TextTransparency = 1
	task.wait(0.5)
	TweenSRV:Create(Menu.Continue, BAMTweenInf, { BackgroundColor3 = Color3.fromRGB(169, 169, 169) }):Play()
	shatween = TweenSRV:Create(Menu.Continue.UIShadow, BAMTweenInf, { Color = Color3.fromRGB(0, 0, 0) })
	shatween:Play()
	shatween.Completed:Wait()
	TweenSRV:Create(Menu.Continue.Topnbottom.TEXT2, HvrETweenINF, { TextTransparency = 1 }):Play()
	TweenSRV:Create(Menu.Continue.Topnbottom.TextButton, HvrETweenINF, { TextTransparency = 0 }):Play()
end

Menu.Continue.TriggerPoint.MouseEnter:Connect(function()
	Hover = true
	print("MOUSEENTER")
	ShadowTweenS:Play()
	HvrSTween:Play()
	HvrStrokeSTween:Play()
	HvrTextSTween:Play()
end)

Menu.Continue.TriggerPoint.MouseLeave:Connect(function()
	Hover = false
	print("MOUSELEAVE")
	ShadowTweenE:Play()
	HvrETween:Play()
	HvrStrokeETween:Play()
	HvrTextETween:Play()
end)

Menu.Continue.TriggerPoint.MouseButton1Down:Connect(function()
	print("MOUSELEAVE")
	ClckSTween:Play()
	HvrStrokeSTween:Play()
	ClckTextSTween:Play()
end)

Menu.Continue.TriggerPoint.MouseButton1Up:Connect(function()
	print("MOUSELEAVE")
	if Hover == false then
		HvrETween:Play()
		HvrStrokeETween:Play()
		HvrTextETween:Play()
	elseif Hover == true then
		if Error == "nix" then
			HvrSTween:Play()
			HvrStrokeSTween:Play()
			HvrTextSTween:Play()

			if not Menu.Settings.TriggerPoint.Interactable then
				task.spawn(function()
					SettingsToggle.Hide()
				end)
			end

			if not Menu.Saves.TriggerPoint.Interactable then
				task.spawn(function()
					SavesToggles.Hide()
				end)
			end

			MenuToggle.hide(1, PAsign.PPlot(Player))
		else
			if Error ~= "nix" then
				HvrSTween:Play()
				HvrStrokeSTween:Play()
				HvrTextSTween:Play()
				if not shatween or shatween.PlaybackState ~= Enum.PlaybackState.Playing then
					task.spawn(BihError, Error)
				end
			end
		end
	end
end)

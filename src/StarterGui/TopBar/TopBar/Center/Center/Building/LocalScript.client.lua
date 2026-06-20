local Player = game.Players.LocalPlayer
local Tween = game:GetService("TweenService")

local PlayerGui = Player.PlayerGui

local Current = PlayerGui.TopBar.TopBar.Center.Center.Building

local Inventory = PlayerGui.Sidebar.inv

local Button = Current.Button

local UpSound = Button.UIButtonUp
local DwnSound = Button.UIButtonDwn
local hvrSound = Button.UIButtonHvr

local TweenInfuh = TweenInfo.new(0.5,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local TweenInfuhHVR = TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
local state = false

script.Parent.Button.MouseEnter:Connect(function()
	
	if state == false then
		
		Tween:Create(Button,TweenInfuhHVR,{
			BackgroundTransparency = 0.6
		}):Play()
		
	elseif state == true then
		
		Tween:Create(Button,TweenInfuhHVR,{
			BackgroundTransparency = 0.8
		}):Play()
	
	end
	
	hvrSound.TimePosition = 0
	hvrSound.Playing = true
	hvrSound.Ended:Connect(function()
		hvrSound.Playing = false
	end)
	
end)

script.Parent.Button.MouseLeave:Connect(function()
	
	if state == false then

		Tween:Create(Button,TweenInfuhHVR,{
			BackgroundTransparency = 1
		}):Play()

	elseif state == true then

		Tween:Create(Button,TweenInfuhHVR,{
			BackgroundTransparency = 0.6
		}):Play()

	end

end)

script.Parent.Button.MouseButton1Up:Connect(function()
	
	UpSound.TimePosition = 0
	UpSound.Playing = true
	UpSound.Ended:Connect(function()
		UpSound.Playing = false
	end)
	
	if state == false then
		
		Tween:Create(Inventory,TweenInfuh,{
			Position = UDim2.new(0.992, 0,0.984, 0)
		}):Play()
		state = true
		
	elseif state == true then
		
		Tween:Create(Inventory,TweenInfuh,{
			Position = UDim2.new(1.2, 0,0.984, 0)
		}):Play()
		state = false
	
	end
end)

script.Parent.Button.MouseButton1Down:Connect(function()
	
	DwnSound.TimePosition = 0
	DwnSound.Playing = true
	DwnSound.Ended:Connect(function()
		DwnSound.Playing = false
	end)
	
end)
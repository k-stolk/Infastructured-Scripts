_G.CurCatSel = "none"
local CurCatPre = tostring(script.Parent)

local player = game.Players.LocalPlayer
local tween = game:GetService("TweenService")



local inv = player.PlayerGui.Sidebar.inv
local catsel = inv.InvFrame.CatSelect.Bar

--player.PlayerGui.Sidebar.inv.InvFrame.CatSelect.Bar.Building.UIButtonUp.Playing

local CurrCat = catsel:WaitForChild(CurCatPre)
local CatName = CurrCat.Label
local CurrCatFrame = CurrCat.Icon
local Img = CurrCatFrame.Icon

local Press = CurrCat.UIButtonDwn
local Release = CurrCat.UIButtonUp
local Hover = CurrCat.UIButtonHvr


local State = false


--twinsss
local HvrTween = TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
local AnimTweenIn = TweenInfo.new(0.15,Enum.EasingStyle.Exponential,Enum.EasingDirection.In)
local AnimTweenOut = TweenInfo.new(0.5,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out)

local POPOUT = TweenInfo.new(1,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)


local function hover (S)
	print("ACTIVATED")
	
	if S == "H" then
		--hover
		tween:Create(CurrCat,HvrTween,{
			BackgroundTransparency = 0.4
		}):Play()
		
	elseif S == "S" then
		--standby
		tween:Create(CurrCat,HvrTween,{
			BackgroundTransparency = 0.05
		}):Play()

	end
	
end

local function toggle ()
	
	if State == false then

		local Size = {Size = UDim2.new(0.85,0,1,0)}

		tween:Create(CurrCat,POPOUT,Size):Play()
		print("Yes"..tostring(State))
		
		tween:Create(CatName,POPOUT,{
			TextTransparency = 0
		}):Play()
		
		tween:Create(Img,POPOUT,{
			ImageTransparency = 0.5
		}):Play()
		
		
		State = true

	elseif State == true then
		local Size = {Size = UDim2.new(0.15,0,1,0)}

		tween:Create(CurrCat,POPOUT,Size):Play()
		print("No"..tostring(State))
		
		tween:Create(CatName,POPOUT,{
			TextTransparency = 1
		}):Play()  
		
		tween:Create(Img,POPOUT,{
			ImageTransparency = 0
		}):Play()
		
		State = false

	end
end

--Hoverstart
CurrCat.Button.MouseEnter:Connect(function()
	tween:Create(Img,AnimTweenIn,{Rotation = -15}):Play()
	hover("H")
	
	Hover.TimePosition = 0
	Hover.Playing = true
	Hover.Ended:Connect(function()
		Hover.Playing = false
	end)
	
end)

--Hoverstop
CurrCat.Button.MouseLeave:Connect(function()
	tween:Create(Img,AnimTweenOut,{Rotation = 0}):Play()
	hover("S")

end)




--Press Started
CurrCat.Button.MouseButton1Down:Connect(function()

	Press.TimePosition = 0
	Press.Playing = true
	Press.Ended:Connect(function()
		Press.Playing = false
	end)
	
end)

--Press Ended
CurrCat.Button.MouseButton1Up:Connect(function ()
	tween:Create(Img,AnimTweenIn,{Rotation = -50}):Play()
	task.wait(0.15)
	tween:Create(Img,AnimTweenOut,{Rotation = 0}):Play()
	toggle()
	
	Release.TimePosition = 0
	Release.Playing = true
	Release.Ended:Connect(function()
		Release.Playing = false
	end)
end)


local CurCatSel = "none"

local player = game.Players.LocalPlayer
local tween = game:GetService("TweenService")

local inv = player.PlayerGui:WaitForChild("Sidebar").inv
local catsel = inv.InvFrame.CatSelect.Bar

--player.PlayerGui.Sidebar.inv.InvFrame.CatSelect.Bar.Building.UIButtonUp.Playing

local State = false

--twinsss
local HvrTween = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local AnimTweenIn = TweenInfo.new(0.15, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
local AnimTweenOut = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)

local POPOUT = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)

local function hover(S, I)
	print("ACTIVATED")

	if S == "H" then
		--hover
		tween
			:Create(I, HvrTween, {
				BackgroundTransparency = 0.4,
			})
			:Play()
	elseif S == "S" then
		--standby
		tween
			:Create(I, HvrTween, {
				BackgroundTransparency = 0.05,
			})
			:Play()
	end
end

local function toggle(I)
	local Img = I.Icon.Icon

	function Enable(INS)
		local Size = { Size = UDim2.new(0.85, 0, 1, 0) }
		local IMAG = I.Icon.Icon

		tween:Create(INS, POPOUT, Size):Play()
		print("Yes" .. tostring(State))

		tween
			:Create(INS.Label, POPOUT, {
				TextTransparency = 0,
			})
			:Play()

		tween
			:Create(IMAG, POPOUT, {
				ImageTransparency = 0.5,
			})
			:Play()
	end

	if State == false then
		Enable(I)
		State = true

	elseif State == true then
		if CurCatSel == I then
			local Size = { Size = UDim2.new(0.15, 0, 1, 0) }

			tween:Create(I, POPOUT, Size):Play()
			print("No" .. tostring(State))

			tween
				:Create(I.Label, POPOUT, {
					TextTransparency = 1,
				})
				:Play()

			tween
				:Create(Img, POPOUT, {
					ImageTransparency = 0,
				})
				:Play()

			State = false
		elseif CurCatSel ~= I then
			local IMAG = CurCatSel.Icon.Icon
			Enable(I)

						local Size = { Size = UDim2.new(0.15, 0, 1, 0) }

			tween:Create(CurCatSel, POPOUT, Size):Play()
			print("No" .. tostring(State))

			tween
				:Create(CurCatSel.Label, POPOUT, {
					TextTransparency = 1,
				})
				:Play()

			tween
				:Create(IMAG, POPOUT, {
					ImageTransparency = 0,
				})
				:Play()


		end
	end
end

--Hoverstart
for _, kutkat in ipairs(catsel:GetChildren()) do
	if kutkat:IsA("Frame") then
		kutkat.Button.MouseEnter:Connect(function()
			local Img = kutkat.Icon
			local Hover = kutkat.UIButtonHvr
			tween:Create(Img, AnimTweenIn, { Rotation = -15 }):Play()
			hover("H", kutkat)

			Hover.TimePosition = 0
			Hover.Playing = true
			Hover.Ended:Connect(function()
				Hover.Playing = false
			end)
		end)
	end
end

--Hoverstop

for _, kutkat in ipairs(catsel:GetChildren()) do
	if kutkat:IsA("Frame") then
		local Img = kutkat.Icon
		kutkat.Button.MouseLeave:Connect(function()
			tween:Create(Img, AnimTweenOut, { Rotation = 0 }):Play()
			hover("S", kutkat)
		end)
	end
end

--Press Started
for _, kutkat in ipairs(catsel:GetChildren()) do
	if kutkat:IsA("Frame") then
		kutkat.Button.MouseButton1Down:Connect(function()
			local Press = kutkat.UIButtonDwn
			Press.TimePosition = 0
			Press.Playing = true
			Press.Ended:Connect(function()
				Press.Playing = false
			end)
		end)
	end
end

--Press Ended
for _, kutkat in ipairs(catsel:GetChildren()) do
	if kutkat:IsA("Frame") then
		local Img = kutkat.Icon
		local Release = kutkat.UIButtonUp
		kutkat.Button.MouseButton1Up:Connect(function()
			tween:Create(Img, AnimTweenIn, { Rotation = -50 }):Play()
			task.wait(0.15)
			tween:Create(Img, AnimTweenOut, { Rotation = 0 }):Play()
			toggle(kutkat)

			Release.TimePosition = 0
			Release.Playing = true
			Release.Ended:Connect(function()
				Release.Playing = false
			end)
			CurCatSel = kutkat
		end)
	end
end

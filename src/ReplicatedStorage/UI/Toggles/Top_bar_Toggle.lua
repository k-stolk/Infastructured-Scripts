--Services
local TweenSrvc = game:GetService("TweenService")

--Infinite Yield Generators

--Tween Info
local ShowTW = TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)

--Tweens

--ShowTweens
local ShowSH = TweenSrvc:Create(script.Parent["Top shadow"], ShowTW, {Transparency = 0.8})
local ShowI1 = TweenSrvc:Create(script.Parent.Leading, ShowTW, {Position = UDim2.fromOffset(208, 34)})
local ShowI2 = TweenSrvc:Create(script.Parent.TopBar.Center, ShowTW, {Position = UDim2.fromScale(0.387,0)})
local ShowI3 = TweenSrvc:Create(script.Parent.TopBar.Trailing, ShowTW, {Position = UDim2.fromScale(0.769,0)})
--HideTweens
local HideSH = TweenSrvc:Create(script.Parent["Top shadow"], ShowTW, {Transparency = 1})
local HideI1 = TweenSrvc:Create(script.Parent.Leading, ShowTW, {Position = UDim2.fromOffset(208, -34)})
local HideI1 = TweenSrvc:Create(script.Parent.TopBar.Center, ShowTW, {Position = UDim2.fromScale(0.387,0)})
local HideI1 = TweenSrvc:Create(script.Parent.TopBar.Trailing, ShowTW, {Position = UDim2.fromScale(0.769,0)})


local module = {}

function module.Show()

end

function module.Hide()

end

return module
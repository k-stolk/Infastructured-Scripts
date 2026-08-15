--Services
local TweenSrvc = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TopBar = Player.PlayerGui:WaitForChild("TopBar")

--Infinite Yield Generators

--Tween Info
local ShowTW = TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)

--Tweens

--ShowTweens
local ShowSH = TweenSrvc:Create(TopBar["Top shadow"], ShowTW, {Transparency = 0.8})
local ShowI1 = TweenSrvc:Create(TopBar.Leading, ShowTW, {Position = UDim2.fromOffset(208, 34)})
local ShowI2 = TweenSrvc:Create(TopBar.TopBar.Center, ShowTW, {Position = UDim2.fromScale(0.411,2.205)})
local ShowI3 = TweenSrvc:Create(TopBar.TopBar.Trailing, ShowTW, {Position = UDim2.fromScale(0.812,0)})
--HideTweens
local HideSH = TweenSrvc:Create(TopBar["Top shadow"], ShowTW, {Transparency = 1})
local HideI1 = TweenSrvc:Create(TopBar.Leading, ShowTW, {Position = UDim2.fromOffset(208, -34)})
local HideI2 = TweenSrvc:Create(TopBar.TopBar.Center, ShowTW, {Position = UDim2.fromScale(0.387,-1.5)})
local HideI3 = TweenSrvc:Create(TopBar.TopBar.Trailing, ShowTW, {Position = UDim2.fromScale(0.812,-1.5)})



local module = {}

function module.Show()

    TopBar.Enabled = true
    ShowSH:Play()
    task.wait(0.3)
    ShowI1:Play()
    task.wait(0.1)
    ShowI2:Play()
    task.wait(0.1)
    ShowI3:Play()

end

function module.Hide()
    HideI1:Play()
    task.wait(0.1)
    HideI2:Play()
    task.wait(0.1)
    HideI3:Play()
    task.wait(0.1)
    HideSH:Play()
    task.wait(0.5)
    TopBar.Enabled = false

end

return module
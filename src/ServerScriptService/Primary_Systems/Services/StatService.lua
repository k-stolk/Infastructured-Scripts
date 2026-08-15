--Services
local TweenSrv = game:GetService("TweenService")

--Infinite yeld gensr
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local GetServerStats = require(ServerScriptService.Primary_Systems.Data.Get_user_data)

--Tween Infuh
local StatIncrTweenInf = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)

--Tweens

local Stats = {}

function Stats.leaderboardSetup(Player)
	print("ran")

	local ServerStats = GetServerStats.get(Player)[1]
	local SelectedSave = ServerStats.Saves.Selected

	local ServerFB = ServerStats.Saves[SelectedSave].Stats.PlayerStats.FuglyBux
	local ServerREP = ServerStats.Saves[SelectedSave].Stats.CompanyStats.Reputation
	local ServerEXP = ServerStats.Saves[SelectedSave].Stats.PlayerStats.Experience

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = Player

	local FB = Instance.new("IntValue")
	FB.Name = "FB$"
	FB.Value = tonumber(ServerFB)
	FB.Parent = leaderstats

	local Reputation = Instance.new("IntValue")
	Reputation.Name = "REP"
	Reputation.Value = tonumber(ServerREP)
	Reputation.Parent = leaderstats

	local Experience = Instance.new("IntValue")
	Experience.Name = "XP"
	Experience.Value = tonumber(ServerEXP)
	Experience.Parent = leaderstats

	local SET = function(PROPT)
		
		Player.PlayerGui.TopBar.Stats[PROPT].Text = tostring(leaderstats[PROPT].Value).." "..PROPT
		Player.PlayerGui.MainMenu.Stats[PROPT].Text = tostring(leaderstats[PROPT].Value).." "..PROPT
	end

	SET("FB$")
	SET("REP")
	SET("XP")

	FB.Changed:Connect(function()
		SET("FB$")
	end)

	Reputation.Changed:Connect(function()
		SET("REP")
	end)

	Experience.Changed:Connect(function()
		SET("XP")
	end)
end

--require(game.ServerScriptService.Primary_Systems.Services.StatService).Update(k_stolk, Reputation, 90)

function Stats.Update(Player, Stat, Goal)
	local StatBar = Player.PlayerGui.TopBar
	local StatInf = Player.leaderstats[Stat]
	local Stats = StatBar.Stats[Stat]
	TweenSrv:Create(StatInf, StatIncrTweenInf, { Value = Goal }):Play()
	StatInf:GetPropertyChangedSignal("Value"):Connect(function()
		Stats.Text = tostring(StatInf.Value)
	end)
end

--require(game.StarterPlayer.StarterPlayerScripts.UI.Stat_bar.StatUpt).Update(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("StatBar"):WaitForChild("Stats"):WaitForChild("Money"),5)

return Stats

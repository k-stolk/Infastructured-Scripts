local TransEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerTrans")

function Trans(tran, Player)
	for Index, Item in ipairs(Player.Character:GetDescendants()) do
		if Item:IsA("BasePart") or Item:IsA("Decal") or Item:IsA("Texture") then
			if Item.Name ~= "HumanoidRootPart" then
				Item.Transparency = tran
			end
		end
	end
end

TransEvent.OnServerEvent:Connect(function(P, T)
	print("yes")
	Trans(T, P)
end)

local module = {}

module.plots = {
	[1] = {
		Assignee = "nix",
		TP = Vector3.new(251.885, 15.364, 495.876),
	},
	[2] = {
		Assignee = "nix",
		TP = Vector3.new(72.11, 15.491, 188.043),
	},
	[3] = {
		Assignee = "nix",
		TP = Vector3.new(227.361, 14.331, -245.66),
	},
	[4] = {
		Assignee = "nix",
		TP = Vector3.new(-36.424, 14, -496.437),
	},
}

function module.PPlot(Player)
	for i = 1, 4 do
        if module.plots[i].Assignee == Player then
            return i
        end
	end
    return
end

return module

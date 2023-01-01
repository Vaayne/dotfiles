local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
}

-- M.nvterm = {
-- 	n = {
-- 		["<a-g>"] = {
-- 			function()
-- 				require("nvterm.terminal").send("lazygit", "float")
-- 			end,
-- 			"toggle lazygit term",
-- 		},
-- 	},
-- 	v = {
-- 		["<A-g>"] = {
-- 			function()
-- 				require("nvterm.terminal").send("lazygit", "float")
-- 			end,
-- 			"toggle lazigit term",
-- 		},
-- 	},
-- }

-- more keybinds!

return M

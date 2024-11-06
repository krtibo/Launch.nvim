return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = {
			theme = {
				[241]                      = { fg = "Special" },
				activeBorderColor          = { fg = "MatchParen", bold = true },
				cherryPickedCommitBgColor  = { fg = "Identifier" },
				cherryPickedCommitFgColor  = { fg = "Function" },
				defaultFgColor             = { fg = "Normal" },
				inactiveBorderColor        = { fg = "FloatBorder" },
				optionsTextColor           = { fg = "Function" },
				searchingActiveBorderColor = { fg = "MatchParen", bold = true },
				selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
				unstagedChangesColor       = { fg = "DiagnosticError" },
			},
		}
	},
	keys = {
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
	},
}

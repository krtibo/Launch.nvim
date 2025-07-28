return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
		bigfile = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		words = { enabled = true },
		statuscolumn = {
			enabled = true,
			left = { "git" },
			right = { "mark", "sign" },
			git = {
				patterns = { "GitSign", "MiniDiffSign" },
			},
		},
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
		},
		picker = {
			enabled = true,
			sources = {
				marks = {
					actions = {
						delmark = function(picker)
							local select = picker:selected { fallback = true }
							local delete = vim
								.iter(select)
								:map(function(it)
									return it.label
								end)
								:join ''
							vim.api.nvim_win_call(vim.fn.win_getid(vim.fn.winnr '#'), function()
								if pcall(vim.cmd.delmark, delete) then
									picker.list:set_selected()
									picker.list:set_target(math.min(picker.list.cursor, picker:count() - 1))
									picker:find() -- NOTE: Should also be called inside `nvim_win_cal`
								else
									Snacks.notify.error(string.format('Unable to delete marks: %s', delete))
								end
							end)
						end,
					},
					win = {
						input = {
							keys = {
								['<C-d>'] = { 'delmark', mode = { 'i', 'n' } },
								['d'] = 'delmark',
							},
						},
					},
				},
			},
		},

	},
	keys = {
		{ "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		{ "<leader>fd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fg", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
		{ "<leader>fl", function() Snacks.picker.resume() end, desc = "Resume" },
		{ "<leader>fo", function() Snacks.picker.recent() end, desc = "Oldfiles" },
		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
		{ "<leader>fr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		{ "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
		{ "<leader>ft", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fT", function() Snacks.picker.todo_comments() end, desc = "Todo" },
		{ "<leader>fb", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
		{ "<leader>f'", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
		{ "<leader>gl", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
		{ "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
		{ '<leader>r', function() Snacks.picker.registers() end, desc = "Registers" },
		{ '<leader>ba', function() Snacks.bufdelete.all() end, desc = "Close all" },
		{ '<leader>bo', function() Snacks.bufdelete.other() end, desc = "Close others" },
		{ '<leader>c', function() Snacks.bufdelete() end, desc = "Close" },
	},
}

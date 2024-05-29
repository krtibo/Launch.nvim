local M = {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons'
}

function M.config()
	require("bufferline").setup{
		options = {
			numbers = function(opts)
				return string.format('%s', opts.raise(opts.ordinal))
			end,
			themable = true,
			show_buffer_icons = false,
			separator_style= {"│", "│"},
			always_show_bufferline = false,
			auto_toggle_bufferline = true,
			indicator = {
				-- icon = '█ ',
				style = 'none',
			},
			offsets = {
				{
					filetype = "NvimTree",
					highlight = "Directory",
					text_align = "left"
				}
			},
		},
		highlights = require("flannel.groups.integrations.bufferline").get()
	}
end

return M

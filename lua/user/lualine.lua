local M = {
  "nvim-lualine/lualine.nvim",
}

local theme_colors = require("flannel.palettes").get_palette()

local function minimap()
		local sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #sbar) + 1
		return string.rep(sbar[i], 2)
end

function M.config()
  local icons = require "user.icons"
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
			theme = 'flannel',
    },
    sections = {
      lualine_a = {},
      lualine_b = { "branch" },
      lualine_c = {
				{
					"diff",
					symbols = {
						added = icons.git.LineAdded,
						modified = icons.git.LineModified,
						removed = icons.git.LineRemoved,
					}
				},
			},
      lualine_x = { "diagnostics", "filetype" },
      lualine_y = {
				{
					"location",
					padding = 2,
					color = { fg = theme_colors.blue, bg = theme_colors.base, gui='italic,bold' },
				},
				{
					minimap,
					padding = 0,
					color = { fg = theme_colors.red, bg = theme_colors.surface0, gui='italic,bold' },
				}
			},
      lualine_z = {},
    },
    extensions = { "quickfix", "man" },
  }
end

return M

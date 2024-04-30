local M = {
  "nvim-lualine/lualine.nvim",
}

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
      lualine_y = { "location", "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M

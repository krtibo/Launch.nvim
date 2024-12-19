local M = {
  "krtibo/flannel.nvim",
  name = "flannel",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	require("flannel").setup({
		custom_highlights = function(colors)
			return {
				LspSignatureActiveParameter = { bg = colors.lavender, fg = colors.crust, style = { "bold" } },
			}
		end
	})
	vim.cmd.colorscheme "flannel-vibrant"
end

return M

local theme_colors = require("flannel.palettes").get_palette("muted")

return {
	"rachartier/tiny-devicons-auto-colors.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	event = "VeryLazy",
	config = function()
		require('tiny-devicons-auto-colors').setup({
			colors = theme_colors,
		})
	end
}

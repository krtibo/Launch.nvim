return {
  "L3MON4D3/LuaSnip",
	version = 'v2.*',
  dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		-- require("luasnip").filetype_extend("typescript", { "javascript" })
		-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
		local ls = require("luasnip")
		vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump( 1) end, {silent = true})
		vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}

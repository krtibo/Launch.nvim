return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip").filetype_extend("typescript", { "javascript" })
		require("luasnip").filetype_extend("javascript", { "javascriptreact" })
	end
}

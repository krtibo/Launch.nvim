return {
  "L3MON4D3/LuaSnip",
	version = 'v2.*',
  dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip").filetype_extend("typescript", { "javascript" })
		require("luasnip").filetype_extend("javascript", { "javascriptreact" })
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}

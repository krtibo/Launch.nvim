return {
  'saghen/blink.cmp',
  version = 'v0.*',

  ---@module 'blink.cmp'
	---@type blink.cmp.Config
  opts = {
    keymap = {
			preset = 'enter',
			['<Tab>'] = { 'select_next', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback' },
		},

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

		completion = {
			list = {
				selection = { preselect = false, auto_insert = false },
			},
			menu = {
				border = 'rounded'
			},
			documentation = {
				auto_show = true,
				window = {
					border = 'rounded'
				}
			},
		},

		snippets = {
			expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
			active = function(filter)
				if filter and filter.direction then
					return require('luasnip').jumpable(filter.direction)
				end
				return require('luasnip').in_snippet()
			end,
			jump = function(direction) require('luasnip').jump(direction) end,
		},

    sources = {
      default = {
				'lsp',
				'snippets',
				'buffer',
				'path',
			},
    },
  },
  opts_extend = { "sources.default" }
}

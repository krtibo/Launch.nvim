local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{
			"isak102/telescope-git-file-history.nvim",
			dependencies = {
					"nvim-lua/plenary.nvim",
					"tpope/vim-fugitive"
			}
		}
	},
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    -- { "<leader>fb", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout branch" },
    -- { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    -- { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    -- { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    -- { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    -- { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
    -- { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
    -- { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    -- { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    -- { "<leader>fs", "<cmd>Telescope treesitter<cr>", desc = "Symbols" },
    -- { "<leader>ft", "<cmd>lua require(\"telescope\").extensions.live_grep_args.live_grep_args()<cr>", desc = "Find Text" },
    -- { "<leader>fb", "<cmd>lua require(\"telescope\").extensions.git_file_history.git_file_history()<cr>", desc = "Open buffer at commit" },
  }

  local icons = require "user.icons"
  local actions = require "telescope.actions"
	local action_state = require "telescope.actions.state"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
			layout_strategy = 'horizontal',
			layout_config = { height = 0.9 },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

			git_commits = {
				mappings = {
					i = {
						["<CR>"] = function() -- show diffview for the selected commit
							-- Open in diffview
							local entry = action_state.get_selected_entry()
							-- close Telescope window properly prior to switching windows
							actions.close(vim.api.nvim_get_current_buf())
							vim.cmd(("DiffviewOpen %s^!"):format(entry.value))
						end,
					},
				},
			},
			},
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
			["ui-select"] = {
				require("telescope.themes").get_dropdown {
					-- even more opts
				},
				specific_opts = {
				  codeactions = false,
				},
			},
    },
  }
	require("telescope").load_extension("live_grep_args")
	require("telescope").load_extension("ui-select")
	require("telescope").load_extension("git_file_history")
end

return M

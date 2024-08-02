local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
		{ "<leader>g", group = "Git" },
		{ "<leader>f", group = "Find" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
		{ "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
		{ "<leader>T", group = "Treesitter" },
		{ "<leader>t", group = "Test" },
		{ "<leader>p", group = "Plugins" },
		{ "<leader>o", group = "Other" },
		{ "<leader>r", ":Telescope registers<CR>", desc = "Registers" },
		{ "<leader>ow", ":set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×<cr>:set list<cr>", desc = "Show whitespaces" },
		{ "<leader>oh", ":set nolist<cr>", desc = "Hide whitespaces" },
		{ "<leader>ol", ":set nolist<cr>", desc = "Toggle linewrap" },
		{ "<leader>n", group = "Wiki" },
		{ "<leader>nn", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
		{ "<leader>nt", ":lua require(\"kiwi\").todo.toggle()<cr>", desc = "Toggle task" },
		{ "<leader>a", group = "Tab" },
		{ "<leader>an", "<cmd>$tabnew<cr>", desc = "New empty tab" },
		{ "<leader>aN", "<cmd>tabnew %<cr>", desc = "New tab" },
		{ "<leader>ao", "<cmd>tabonly<cr>", desc = "Only" },
		{ "<leader>ah", "<cmd>-tabmove<cr>", desc = "Move left" },
		{ "<leader>al", "<cmd>+tabmove<cr>", desc = "Move right" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>lp", ":lua vim.lsp.buf.hover()<cr>", desc = "Peek type" },
		{ "<leader>lx", ":LspRestart<cr>", desc = "LSP restart" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>ba", ":BufDelAll<cr>", desc = "Close all" },
		{ "<leader>bo", ":BufDelOthers<cr>", desc = "Close others" },
		{ "<leader>bl", ":BufferLineCloseLeft<cr>", desc = "Close all to left" },
		{ "<leader>br", ":BufferLineCloseRight<cr>", desc = "Close all to right" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      -- position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    -- ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.add(mappings, opts)
end

return M

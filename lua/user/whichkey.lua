local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
		{ "<leader>g", group = "Git" },
		{ "<leader>gc", ":Telescope git_commits<CR>", desc = "Commits" },
		{ "<leader>f", group = "Find" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>q", "<cmd>confirm q<CR>", desc = "Quit", hidden = true },
		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL", hidden = true },
		{ "<leader>t", group = "Test" },
		{ "<leader>to", "<cmd>lua require(\"neotest\").output_panel.toggle()<cr>", desc = "Test output toggle" },
		{ "<leader>tc", "<cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<cr>", desc = "Run current file" },
		{ "<leader>tn", "<cmd>lua require(\"neotest\").run.run()<cr>", desc = "Run nearest" },
		{ "<leader>p", group = "Plugins" },
		{ "<leader>o", group = "Other" },
		{ "<leader>r", ":Telescope registers<CR>", desc = "Registers" },
		{ "<leader>ow", ":set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×<cr>:set list<cr>", desc = "Show whitespaces" },
		{ "<leader>oh", ":set nolist<cr>", desc = "Hide whitespaces" },
		{ "<leader>ol", ":set nolist<cr>", desc = "Toggle linewrap" },
		{ "<leader>n", group = "Wiki" },
		{ "<leader>nn", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
		{ "<leader>nt", ":lua require(\"kiwi\").todo.toggle()<cr>", desc = "Toggle task" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>lp", ":lua vim.lsp.buf.hover()<cr>", desc = "Peek type" },
		{ "<leader>lx", ":LspRestart<cr>", desc = "LSP restart" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>ba", ":BufDelAll<cr>", desc = "Close all" },
		{ "<leader>bo", ":BufDelOthers<cr>", desc = "Close others" },
		{ "<leader>1", ":BufferLineGoToBuffer 1<cr>", hidden = true },
		{ "<leader>2", ":BufferLineGoToBuffer 2<cr>", hidden = true },
		{ "<leader>3", ":BufferLineGoToBuffer 3<cr>", hidden = true },
		{ "<leader>4", ":BufferLineGoToBuffer 4<cr>", hidden = true },
		{ "<leader>5", ":BufferLineGoToBuffer 5<cr>", hidden = true },
		{ "<leader>6", ":BufferLineGoToBuffer 6<cr>", hidden = true },
		{ "<leader>7", ":BufferLineGoToBuffer 7<cr>", hidden = true },
		{ "<leader>8", ":BufferLineGoToBuffer 8<cr>", hidden = true },
		{ "<leader>9", ":BufferLineGoToBuffer 9<cr>", hidden = true },
		{ "<leader>c", ":BufDel<cr>", hidden = true },
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
      padding = { 2, 2, 2, 2 },
			title = false,
    },
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

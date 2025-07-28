local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
		{ "<leader>g", group = "Git" },
		-- { "<leader>gc", ":Telescope git_commits<CR>", desc = "Commits" },
		{ "<leader>f", group = "Find" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>dt", ":DapViewToggle!<cr>", desc = "Toggle DAP View" },
		{ "<leader>db", ":DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
		{ "<leader>dc", ":DapContinue<cr>", desc = "Continue" },
		{ "<leader>dx", ":DapDisconnect<cr>", desc = "Disconnect" },
		{ "<leader>dr", "<cmd>lua require(\"neotest\").run.run({strategy = \"dap\"})<cr>", desc = "Run test in debug mode" },
		{ "<leader>q", "<cmd>qall<CR>", desc = "Quit" },
		{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
		{ "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
		{ "<leader>T", group = "Treesitter" },
		{ "<leader>t", group = "Test" },
		{ "<leader>to", "<cmd>lua require(\"neotest\").output_panel.toggle()<cr>", desc = "Test output toggle" },
		{ "<leader>tc", "<cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<cr>", desc = "Run current file" },
		{ "<leader>tn", "<cmd>lua require(\"neotest\").run.run()<cr>", desc = "Run nearest" },
		{ "<leader>p", group = "Plugins" },
		{ "<leader>o", group = "Other" },
		{ "<leader>ow", ":set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×<cr>:set list<cr>", desc = "Show whitespaces" },
		{ "<leader>oh", ":set nolist<cr>", desc = "Hide whitespaces" },
		{ "<leader>ol", ":set nolist<cr>", desc = "Toggle linewrap" },
		{ "<leader>n", group = "Wiki" },
		{ "<leader>nn", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
		{ "<leader>nn", ":enew | e /home/tibork/Documents/wiki/index.md<cr>", desc = "Open Wiki index" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>lp", ":lua vim.lsp.buf.hover()<cr>", desc = "Peek type" },
		{ "<leader>lx", ":LspRestart<cr>", desc = "LSP restart" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>1", ":BufferLineGoToBuffer 1<cr>", hidden = true },
		{ "<leader>2", ":BufferLineGoToBuffer 2<cr>", hidden = true },
		{ "<leader>3", ":BufferLineGoToBuffer 3<cr>", hidden = true },
		{ "<leader>4", ":BufferLineGoToBuffer 4<cr>", hidden = true },
		{ "<leader>5", ":BufferLineGoToBuffer 5<cr>", hidden = true },
		{ "<leader>6", ":BufferLineGoToBuffer 6<cr>", hidden = true },
		{ "<leader>7", ":BufferLineGoToBuffer 7<cr>", hidden = true },
		{ "<leader>8", ":BufferLineGoToBuffer 8<cr>", hidden = true },
		{ "<leader>9", ":BufferLineGoToBuffer 9<cr>", hidden = true },
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

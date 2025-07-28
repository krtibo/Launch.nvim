return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
  },
	config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = "node node_modules/.bin/jest",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
				require("neotest-vitest") {
					-- is_test_file = function(file_path)
					-- 	return string.match(file_path, ".spec.ts")
					-- end
				},
      }
    })
  end
}

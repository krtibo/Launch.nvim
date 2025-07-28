local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"igorlfs/nvim-dap-view", opts = {
				windows = {
					terminal = {
						start_hidden = true,
					}
				}
			}
		},
	},
}

function M.config()
	vim.fn.sign_define('DapBreakpoint', {text='', texthl='Debug', linehl='', numhl=''})
	vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='@exception', linehl='', numhl=''})
	vim.fn.sign_define('DapStopped', {text='', texthl='WarningMsg', linehl='', numhl=''})

	require("dap").adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = {"/home/tibork/.config/nvim/js-debug-dap/js-debug/src/dapDebugServer.js", "${port}"},
		}
	}

	require("dap").configurations.javascript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
	}
end

return M

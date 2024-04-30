return {
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
			enabled = true,
			write_all_buffers = false,
			execution_message = {
				message = function()
					local text = "AutoSaved at " .. vim.fn.strftime("%H:%M:%S")
					-- require("notify")(text)
					return text
				end,
				dim = 0.18, -- dim the color of `message`
				cleaning_interval = 3000, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
			},
			trigger_events = {"InsertLeave", "TextChanged"},
			debounce_delay = 5000,
		 }
	end,
}

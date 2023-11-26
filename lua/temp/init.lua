local M = {}
local window = require("temp.window")
local filetype = ""

M.opt = {}

M.opt.ask_filetype = true

function M.toggle_menu() -- i know the names are the same but i dont care
	if (not window.is_open()) and M.opt.ask_filetype then
		filetype = vim.fn.input("Filetype > ")
	end

	window.toggle_menu(filetype)
end

return M

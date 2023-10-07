local temp = require("temp.init")

vim.api.nvim_create_user_command("TempToggleMenu", function ()
    temp.toggle_menu()
end)

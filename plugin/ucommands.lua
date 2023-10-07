local temp = require("temp.init")

vim.api.nvim_create_user_command("GutenMachine", function ()
    temp.toggle_menu()
end)

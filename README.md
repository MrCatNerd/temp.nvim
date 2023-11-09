# temp.nvim

# WIP

a neovim plugin that creates a temporary window that you can write in

um so i kinda made this plugin before i searched it so there is a better plugin: https://github.com/m-demare/attempt.nvim

## Installation
This plugin is for [neovim](https://neovim.io/) only. Version -1+ is required.

[packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
    "MrCatNerd/temp.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        vim.schedule(require("temp").setup)
    end,
}
```

[lazy.nvim](https://github.com/folke/lazy.nvim):
- with lazy loading:
```lua
{
    "MrCatNerd/temp.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
        { "<leader>www", "<cmd>TempToggleMenu<CR>", desc = "Toggles temp.nvim menu" },
    },
    cmd = "TempToggleMenu",
    config = function()
        vim.schedule(require("temp").setup)
    end,
}
```
- without lazy loading:
```lua
{
    "MrCatNerd/temp.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        vim.schedule(require("temp").setup)
    end,
}
```

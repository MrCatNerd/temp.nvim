local popup = require("plenary.popup")

local win_id = nil
local bufnr = nil

local M = {}

local function create_menu()
    bufnr = vim.api.nvim_create_buf(false, false)

    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    win_id = popup.create(bufnr, {
        title = "Temporary",
        line = math.floor(((vim.o.lines - 10) / 2) - 1),
        col = math.floor((vim.o.columns - 60) / 2),
        minwidth = 60,
        minheight = 10,
        border = true,
        borderchars = borderchars,
    })

    return { win_id = win_id, bufnr = bufnr }
end

local function close_menu()
    if win_id ~= nil and vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_win_close(win_id, true)
    end

    win_id = nil
    bufnr = nil
end

function M.toggle_menu(buffer_filetype)
    if win_id ~= nil and vim.api.nvim_win_is_valid(win_id) then
        close_menu()
        return
    end

    local win_info = create_menu()
    local contents = {}

    win_id = win_info.win_id
    bufnr = win_info.bufnr

    if not vim.api.nvim_win_is_valid(win_id) then
        print("validated")
    end

    vim.api.nvim_win_set_option(win_id, "number", true)
    vim.api.nvim_buf_set_name(bufnr, "temporary")
    vim.api.nvim_buf_set_lines(bufnr, 0, #contents, false, contents)
    vim.api.nvim_buf_set_option(bufnr, "filetype", "temporary")
    vim.api.nvim_buf_set_option(bufnr, "bufhidden", "delete")
    vim.api.nvim_buf_set_option(0, "filetype", buffer_filetype)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "q",
        string.format("<Cmd>lua require('temp.window').toggle_menu(%s)<CR>", buffer_filetype), -- i can do it with nil but i dont want to
        { silent = true }
    )

    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<ESC>",
        string.format("<Cmd>lua require('temp.window').toggle_menu(%s)<CR>", buffer_filetype), -- i can do it with nil but i dont want to
        { silent = true }
    )
end

function M.is_open()
    return win_id ~= nil and vim.api.nvim_win_is_valid(win_id)
end

return M

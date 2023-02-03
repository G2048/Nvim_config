local M = {}

function M.setup()

    local keymap = vim.api.nvim_set_keymap
    local opt = vim.opt

    opt.termguicolors = true
    -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

    opt.list = true
    -- opt.listchars:append("space:⋅") 
    -- opt.listchars:append("space: ")
    -- opt.listchars:append("eol:↴")

    -- keymap("n", "<F6>", ":lua opt.list = false", default_opts)
    -- keymap("n", "<F7>", ":lua opt.list = true", default_opts)


    -- require("indent_blankline").setup {
        -- show_end_of_line = true,
        -- space_char_blankline = " ",

        -- Need nvim-treesitter
        -- show_current_context = true,
        -- show_current_context_start = true,
    -- }

end

return M

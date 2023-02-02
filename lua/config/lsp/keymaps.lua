local M = {}

local whichkey = require "which-key"
local builtin = require('telescope.builtin')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function keymappings(client, bufnr)
    local opts = { noremap = true, silent = true }

    -- Key mappings
    buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
    keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

    keymap('n', '<leader>D', "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    keymap('n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap('n', '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- keymap('n', '<leader>to', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)


    -- Whichkey
    local keymap_l = {
        l = {
            name = "Code",
            r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
            i = { "<cmd>LspInfo<CR>", "Lsp Info" },
        },
    }
    if client.server_capabilities.documentFormattingProvider then
        keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
    end

    local keymap_g = {
        name = "Goto",
        d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    }

    -- Telescope
    local telescope_map = {
        f = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
            f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Finde files" },
            g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep"},
            b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers"},
            h ={"<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help tags"},
        }
    }

    whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
    whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
    whichkey.register(telescope_map, { buffer = bufnr, prefix = "<leader>" })


end

function M.setup(client, bufnr)
    keymappings(client, bufnr)
end

return M

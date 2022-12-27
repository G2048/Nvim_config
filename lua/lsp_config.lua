--Install autocompletition plugin
vim.cmd [[ packadd completion-nvim ]]

--Core
local lsp = require('lspconfig')
local completion = require('completion')

--New mappings
local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

--For more see https://github.com/nvim-lua/completion-nvim
local custom_attach = function()
  completion.on_attach()
  -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
end

--Attach above
lsp.pyls.setup{
  on_attach = custom_attach
}

--Include in init.lua
--require('lsp_config')

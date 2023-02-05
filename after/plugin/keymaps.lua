--For more see :h nvim_set_keymap
--Begin
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = false, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "F", "<gv", default_opts)
keymap("v", "f", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

--My custom key-map
keymap("n", "<F2>", ":set nonumber!<CR>:set foldcolumn=0<CR>", default_opts)
keymap("n", "<F3>", ":set nocursorcolumn!<CR>:set foldcolumn=0<CR>", default_opts)
keymap("n", "<F4>", ":set norelativenumber!<CR>", default_opts)
keymap("n", "<F5>", ":set nocursorline! <CR>", default_opts)
keymap("n", ",<leader>", ":nohlsearch <CR>", default_opts)

keymap("n", '<leader>s', ':so % <CR>', default_opts)
keymap("n", ';', '%', default_opts)

-- Working with tabs
keymap('n', '<c-t>n', ':tabnew <CR>', default_opts)
keymap('n', '<c-t>c', ':tabclose <CR>', default_opts)
keymap('n', '=', ':tabnext<CR>', default_opts)
keymap('n', '-', ':tabNext<CR>', default_opts)
keymap('n', '+', ':tabmove <CR>', default_opts)
keymap('n', '<c-t>1', ':tabfirst <CR>', default_opts)
keymap('n', '<c-t>0', ':tablast <CR>', default_opts)

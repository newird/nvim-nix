-- this file was mostly translate from
-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
-- Navigate vim panes better
local map = vim.keymap.set
map('n', '<C-c>', '<Esc>')
map('i', '<C-c>', '<Esc>')
map('v', '<C-c>', '<Esc>')
map('s', '<C-c>', '<Esc>')
map('x', '<C-c>', '<Esc>')
map('c', '<C-c>', '<C-c>')
map('o', '<C-c>', '<Esc>')
map('l', '<C-c>', '<Esc>')
map('t', '<C-c>', '<Esc>')

--for copilot

--remove file
map('n', '<Leader>rb', ':bdelete')
map('n', '<Leader>rf', ':UseFZFToRemoveFiles')

-- No arrow keys --- force yourself to use the home row
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i', '<right>', '<nop>')

-- Left and right can switch buffers
map('n', '<left>', ':bp<CR>')
map('n', '<right>', ':bn<CR>')

-- markdown preview

-- Move by line
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- use system  clipboard
-- Visual mode mappings
map('v', '<Leader>y', '+y')
map('v', '<Leader>d', '+d')

-- Visual mode mappings (again, for completeness)
map('v', '<Leader>p', '+p')
map('v', '<Leader>P', '+P')

-- select all
map('n', '<Leader>a', 'ggVG')

-- greatest remap ever
map('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

map({ 'n', 'v' }, '<leader>d', [["_d]])
-- magic search
map('n', '<leader>pv', vim.cmd.Ex)

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
-- map('n', 'n', 'nzzzv')
-- map('n', 'N', 'Nzzzv')

map('n', '<C-s>', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
-- fzf
map('n', '<Leader>f', '<Esc>:Files<Cr>')
map('n', '<Leader>g', '<Esc>:GFiles<Cr>')
map('n', '<C-f>', ':Rg!<Cr> ')
--save
map('n', '<Leader>w', '<Esc>:w<Cr>')
map('n', '<Leader>q', '<Esc>:q<Cr>')

-- Search results centered please
map('n', '<silent> n', 'nzzzv')
map('n', '<silent> N', 'Nzzzv')
map('n', '<silent> *', '*zz')
map('n', '<silent> #', '#zz')
map('n', '<silent> g*', 'g*zz')

-- resize windows
map('n', '<M-l>', '<c-w>5<')
map('n', '<M-h>', '<c-w>5>')
map('n', '<M-j>', '<C-W>+')
map('n', '<M-k>', '<C-W>-')

--fold
local function close_all_folds()
  vim.api.nvim_exec2('%foldc!', { output = false })
end
local function open_all_folds()
  vim.api.nvim_exec2('%foldo!', { output = false })
end
vim.keymap.set('n', '<leader>zc', close_all_folds, { desc = '[c]lose all folds' })
vim.keymap.set('n', '<leader>zo', open_all_folds, { desc = '[o]pen all folds' })

local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

opt.showcmd = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true

vim.keymap.set('n', '<leader>h', ':nolsearch<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

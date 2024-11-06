-- Generic vim settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.nu = true

-- Remap Y to yank to system clipboard
vim.api.nvim_set_keymap('n', 'Y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true, silent = true })

-- Remap B/P to insert breakpoint for debugging
vim.api.nvim_set_keymap('i', '<leader>p', 'import pdb; pdb.set_trace()<ESC>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<leader>b', 'binding.pry<ESC>i', { noremap = true, silent = true })

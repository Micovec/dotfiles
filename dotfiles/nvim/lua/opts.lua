local opt = vim.opt
local g = vim.g

-- Show line numbers
opt.number = true
opt.relativenumber = true

-- Highlight current line
opt.cursorline = true

-- Split new buffer below
opt.splitbelow = true

-- Tabs
opt.tabstop = 8
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Gruvbox theme
g.gruvbox_contrast_dark = 'dark'
--vim.cmd([[autocmd vimenter * ++nested colorscheme gruvbox]])
vim.cmd([[autocmd vimenter * ++nested colorscheme juliana]])

-- Lualine
require('lualine').setup{
    --options = { theme = 'gruvbox' }
    options = { theme = 'juliana' }
}

-- lspcmp
opt.completeopt = menu, menuone, noselect


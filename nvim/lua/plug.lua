local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/autoload')

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { tag = 'nvim-0.5.0' })
Plug ('rust-lang/rust.vim')
Plug ('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install'], ['for'] = { 'markdown', 'vim-plug' }})

vim.call('plug#end')


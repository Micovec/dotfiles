local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/autoload')

Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim', { tag = 'nvim-0.5.0' })
Plug ('rust-lang/rust.vim')
Plug ('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install'], ['for'] = { 'markdown', 'vim-plug' }})
Plug ('morhetz/gruvbox')
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate'})
Plug ('nvim-lualine/lualine.nvim')
Plug ('kyazdani42/nvim-web-devicons')
Plug ('neovim/nvim-lspconfig')
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')

Plug ('hrsh7th/cmp-vsnip')
Plug ('hrsh7th/vim-vsnip')

vim.call('plug#end')


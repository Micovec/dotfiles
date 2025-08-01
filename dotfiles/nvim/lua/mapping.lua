local api = vim.api
local noremap_silent = { noremap = true, silent = true}

api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', noremap_silent)
api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', noremap_silent)
api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', noremap_silent)
api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', noremap_silent)

local builtin = require('telescope.builtin')

-- General
vim.keymap.set('n', '<leader>cm', '<cmd>e ~/.config/nvim/lua/config/keymaps.lua<cr>', { desc = 'Open mappings config' })
vim.keymap.set('n', '<leader>cf', '<cmd>e ~/.config/nvim/lua/config/settings.lua<cr>', { desc = 'Open general config' })

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

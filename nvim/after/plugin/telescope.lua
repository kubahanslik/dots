local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files registered by git' })
vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = 'Telescope grep files with string' })

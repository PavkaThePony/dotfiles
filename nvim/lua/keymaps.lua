-- lua\keymaps.lua
local keymap = vim.keymap.set

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- time to get rid of the need to type <C-w> everytime i want to move from window to window
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap('n', '<leader>la', '<cmd>Lazy home<cr>', { desc = 'Open Lazy UI' })

-- I have to use [[string_literal]] so lua ignores the '\' escape character and interprets it just as a string literal. Lua is great. Princess Luna? What? Nevermind.
keymap('t', '<esc><esc>', [[<C-\><C-n>]], { desc = 'Switch to normal mode from terminal mode' })
keymap('n', '<leader>aa', '<cmd>Alpha<cr>', { desc = 'Go to home page(alpha header)' })

-- Many many keymaps are located in \plugins\*.lua files. I do that to separate every single plugin, just like with autocmds, so everything is modular.

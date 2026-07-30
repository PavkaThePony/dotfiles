-- autocmds.lua
local autocmd = vim.api.nvim_create_autocmd 
local augroup = vim.api.nvim_create_augroup 

autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = augroup('highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,})

-- most autocmds are located in \plugins\plugin_name.lua
-- the reasoning behind that is simple:
-- if i mess up syntax or misunderstand an api, then the whole sheize won't explode,
-- and i wont be thrown into a half-functioning neovim. I will only lose
-- that specific plugin i messed up. Same thing with any keymap and other stuff.

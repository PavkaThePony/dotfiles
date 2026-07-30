-- basic options, any non-basic configuration is located in separated lua files.
vim.loader.enable()
-- always setup the leaders first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.undofile = true
-- make search engine better: if i type word in lowercase, it will ignore case while searching,
-- but if i type at least one character uppercase, then it will care about it while searching
vim.o.ignorecase = true
vim.o.smartcase = true
--vim.o.cursorline = true -- first i thought i would like it but nah
vim.o.scrolloff = 5
vim.o.confirm = true
-- decreasing updatetime so nvim triggers background actions faster
vim.o.updatetime = 250
-- decreasing timeoutlen to prevent potential accidental triggering of a shortcut
vim.o.timeoutlen = 300
-- ======================================================================================
-- this section makes indenting less insufferable
-- ======================================================================================
-- making tabs take only 2 spaces, good for autopairs too.
vim.opt.expandtab   = true  -- make Neovim type spaces instead of \t characters. whenever
-- i press <tab>, it doesn't insert '\t' char, it inserts 2 spaces. cool!
vim.opt.shiftwidth  = 2     -- indent thickness for tabs aka tabs are now 2 spaces instead of 8
vim.opt.softtabstop = -1    -- softtabstop will use shiftwidth if set to -1, this setting makes it so
-- whenever i press <tab>, it looks for the nearest tab stop.
-- for example, if my cursor was at ***|
-- then after hitting tab it won't be *****|
-- , instead it will be ****|
-- --------------------------------------------------------------------------------------
-- enable severity_sort so errors are the first things to display, even if warnings were received faster (for lsp)
vim.diagnostic.config({ severity_sort = true })
-- scheduling the synchronisation between OS clipboard and nvim for faster startup time
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- requiring other configuration files
require("keymaps")
require("autocmds")
require("treesitter-setup")
-- lazy.nvim!
require("lazyconfig.lazy")


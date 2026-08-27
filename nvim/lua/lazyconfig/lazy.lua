-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "twilight-sparkle-colorscheme" } },
  -- do not automatically check for plugin updates
  checker = { enabled = false },
})

-- ==============================================================================
-- WHY LAZY.NVIM IS GOATED
-- ==============================================================================
-- There's a file called lazy-lock.json. This json contains and hardlocks every single plugin version(commit) so a random update from a plugin dev won't 
-- collapse my universe/neovim. Updates only happen whenever I enter the :Lazy ui and press U. Even after that, it is possible to rollback
-- to the previous commit of a plugin to make it work again(but i need to have the older lazy-lock.json since it automatically updates after plugin updating. 
-- Also, whenever i have to work on a different machine, that json file
-- will guide the lazy.nvim to install not just whatever is the latest versions of the plugins, but those particular versions of them that work 100%.
-- '':Lazy restore' can save the day if i accidently press 'U' button in Lazy ui and everything explodes(but i need to have the backup lazy-lock.json).

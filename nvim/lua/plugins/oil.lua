return {
  -- Don't forget about fancy sorting with 'gs' keymap
  'stevearc/oil.nvim',

  --wiki: Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons", config = true }, --wiki: use if you prefer nvim-web-devicons Note: yes i do lol
  
  keys = {
    { "-", "<cmd>Oil<cr>", "Open ~Emacsy Direddy style file manager~" }, 
  },
  
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      -- The next keymap is absolute cinema: I remember being tired of the fact that when you launch neovim from for example, 'C:\Users\Pavka\',
      -- it will forever be that way, and to change the root directory(to cd to another directory so neovim's plugins like Telescope and ToggleTerm start
      -- searching and launching themselves in the new directory you want them to search) you had to leave neovim and type 'cd \file\path\', which
      -- is very inconvinient. The follow keymap is fixing that: now i only need to launch Oil.nvim, navigate to a directory, open it, then press
      -- <leader>cd , and it will globally set whatever directory is opened in Oil as the root directory so I will be able to use Telescope or ToggleTerm
      -- only for that dir.
      ["<leader>cd"] = function()
        local oil = require('oil')
        local current_oil_dir = oil.get_current_dir()
        if current_oil_dir then 
          vim.cmd("cd " .. current_oil_dir)
          vim.notify("Root changed to: " .. current_oil_dir, vim.log.levels.INFO)
        else
          vim.notify("Could not detect Oil directory", vim.log.levels.INFO)
        end
      end
    },
  },
  --wiki: Lazy loading is not recommended because it is very tricky to make it work correctly in all situations. Note: ok
  lazy = false, -- cinema plugin, it's just Dired but simply better. Must have.
}

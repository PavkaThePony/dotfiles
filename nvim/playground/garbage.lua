return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    --When creating the keymaps manually either use a lua function like function() require("flash").jump() end as the rhs, 
    --or a string like <cmd>lua require("flash").jump()<cr>. DO NOT use :lua, since that will break dot-repeat
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }, -- treesitter integration is ass so i wont bother using it, it's too bad
}

-- i dont feel like using this plugin.
-- i will just use /

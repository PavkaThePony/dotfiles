return {
  "twilight-sparkle-colorscheme",
  dir = vim.fn.stdpath("config") .. "/colors",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme twilight-sparkle-colorscheme]]) -- respect for my waifu.
  end,
}


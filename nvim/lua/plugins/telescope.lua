return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text Everywhere" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find recently opened files"},
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Open Tabs/Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Manual" },
  },
  lazy = false, -- screw this, load telescope in the beginning
}


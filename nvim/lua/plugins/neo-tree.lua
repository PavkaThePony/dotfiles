return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    keys = {
      { "<leader>ec", "<cmd>Neotree toggle current<cr>", "Open Neotree for whole window"},
      { "<leader>e", "<cmd>Neotree toggle right<cr>", "Open Neotree as a sidebar"},
      { "<leader>er", "<cmd>Neotree toggle right reveal<cr>", "Open Neotree as a sidebar with reveal argument"},
      { "<leader>eg", "<cmd>Neotree toggle float git_status<cr>", "Open Neotree in git_status mode"}
    },
    lazy = false, -- neo-tree will lazily load itself by its design
  }
}

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return {
        {
          "<leader>ff",
          "<cmd>Telescope find_files<cr>",
        },
        {
          "<leader><space>",
          function()
            require("telescope.builtin").git_files()
          end,
        },
      }
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      return {
        {
          "<leader>a",
          mode = { "n" },
          mark.add_file,
        },
        {
          "<C-e>",
          mode = { "n" },
          ui.toggle_quick_menu,
        },
        {
          "<C-a>",
          mode = { "n" },
          function()
            ui.nav_file(1)
          end,
        },
        {
          "<C-s>",
          mode = { "n" },
          function()
            ui.nav_file(2)
          end,
        },
        {
          "<C-d>",
          mode = { "n" },
          function()
            ui.nav_file(3)
          end,
        },
        {
          "<C-f>",
          mode = { "n" },
          function()
            ui.nav_file(4)
          end,
        },
      }
    end,
  },
}

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
        {
          "<leader>/",
          "<cmd>Telescope live_grep<cr>",
        },
        {
          "<leader>fb",
          "<cmd>Telescope buffers<cr>",
        },
        {
          "<leader>fh",
          "<cmd>Telescope help_tags<cr>",
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
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<leader>k", vim.lsp.buf.hover }
    end,
  },
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
}

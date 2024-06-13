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
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
    dependencies = {
      {
        "supermaven-inc/supermaven-nvim",
        build = "",
        opts = {},
        config = function()
          require("supermaven-nvim").setup({
            keymaps = {
              accept_suggestion = "<Tab>",
            },
            disable_inline_completion = false,
          })
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          local sugesstion = require("supermaven-nvim.completion_preview")

          if sugesstion.has_suggestion() then
            sugesstion.on_accept_suggestion()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      -- table.insert(opts.sources, 1, {
      --   name = "supermaven",
      --   group_index = 1,
      --   priority = 100,
      -- })
    end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = "copilot.lua",
  --   opts = {},
  --   config = function(_, opts)
  --     local copilot_cmp = require("copilot_cmp")
  --     copilot_cmp.setup(opts)
  --     -- attach cmp source whenever copilot attaches
  --     -- fixes lazy-loading issues with the copilot cmp source
  --     require("lazyvim.util").lsp.on_attach(function(client)
  --       if client.name == "copilot" then
  --         copilot_cmp._on_insert_enter({})
  --       end
  --     end)
  --   end,
  -- },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({
  --       disable_inline_completion = true,
  --     })
  --   end,
  -- },
}

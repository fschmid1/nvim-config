return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        html = {
          filetypes = {
            "html",
            "templ",
          },
        },
        tailwindcss = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react", "html" },
          init_options = { userLanguages = { templ = "html" } },
        },
        htmx = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        },
      },
    },
  },
}

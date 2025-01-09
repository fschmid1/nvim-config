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
            "htmlangular",
          },
        },
        tailwindcss = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react", "html", "htmlangular" },
          init_options = { userLanguages = { templ = "html" } },
        },
        angularls = {
          filetypes = {
            "htmlangular",
          },
        },
        htmx = {
          filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        },
        tsserver = {
          filetypes = { "typescript", "htmlangular" },
        },
      },
    },
  },
}

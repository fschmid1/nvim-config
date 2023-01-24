local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.prettierd.with {
		filetypes = { "javascript", "html", "json", "svelte", "css", "javascriptreact", "typescript", "typescriptreact" },
		extra_filetypes = { "svelte" }
	},
	formatting.gofmt,
}

local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
   end
end

null_ls.setup({ sources = sources, on_attach = on_attach })

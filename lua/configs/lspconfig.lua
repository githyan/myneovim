require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "lua-language-server", "clangd", "pyright" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

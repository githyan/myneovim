require("nvchad.configs.lspconfig").defaults()

local servers = { "ts_ls", "html", "cssls", "lua-language-server", "clangd", "pyright", "java", "gopls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

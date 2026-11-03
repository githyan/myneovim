local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black" },
    nasm = { "asmfmt" },
    c = { "clangd-format" },
    cpp = { "clangd-format" },
    java = { "google-java-format" },
    go = { "gofumpt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options

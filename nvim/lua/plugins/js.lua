-- js.lua
return {
  -- LSP для JavaScript / TypeScript
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {},
        eslint = {},
      },
    },
  },

  -- Форматування (Prettier + ESLint)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    },
  },
}

-- lua/plugins/rust.lua
-- Full Rust support but LazyVim-friendly: don't call require("conform").setup()

return {
  -- Mason (package manager)
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP bridge
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer" },
      })
    end,
  },

  -- Mason DAP bridge (for codelldb)
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
      })
    end,
  },

  -- rust-tools (wraps rust-analyzer + extras)
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        tools = {
          executor = require("rust-tools.executors").termopen,
          reload_workspace_from_cargo_toml = true,
        },
        server = {
          on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }
            -- LSP mappings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            -- rust-tools specific
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, opts)
            vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, opts)
            vim.keymap.set("n", "<leader>rh", rt.hover_actions.hover_actions, opts)
            -- NOTE: do NOT set up conform here — LazyVim manages formatters
            -- If conform is installed, LazyVim's global config will use it via opts.
          end,
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        },
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(nil),
        },
      })
    end,
  },

  -- conform: DO NOT call require("conform").setup() here; just supply opts so LazyVim merges them
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.rust = { "rustfmt" }

      opts.format_on_save = opts.format_on_save or {}
      opts.format_on_save.timeout_ms = 5000
      opts.format_on_save.lsp_fallback = true
    end,
  },

  -- ensure dap + ui if not already present
  {
    "mfussenegger/nvim-dap",
    optional = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    optional = true,
    config = function()
      local dapui_ok, dapui = pcall(require, "dapui")
      if not dapui_ok then return end
      dapui.setup()
    end,
  },
}

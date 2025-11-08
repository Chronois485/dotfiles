-- lua/plugins/python.lua
-- Підтримка Python із LazyVim-friendly conform.nvim, DAP і neotest

return {
  -- Python LSP (через Mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- або basedpyright, якщо хочеш новішу версію
      },
    },
  },

  -- Форматування через conform.nvim (не чіпаємо config, тільки opts)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { "isort", "black" }

      opts.format_on_save = opts.format_on_save or {}
      opts.format_on_save.lsp_fallback = true
      opts.format_on_save.timeout_ms = 5000
    end,
  },

  -- Debugger (через mason-nvim-dap)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap_python = require("dap-python")
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      if vim.fn.filereadable(path) == 0 then
        path = "python3"
      end
      dap_python.setup(path)
    end,
  },

  -- Тести (pytest)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
        },
      },
    },
  },
}

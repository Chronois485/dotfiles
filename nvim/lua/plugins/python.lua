-- lua/plugins/python.lua
return {
  -- Python LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- або basedpyright якщо хочеш
      },
    },
  },

  -- Форматування (black + isort)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
      },
    },
  },

  -- Debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap_python = require("dap-python")
      dap_python.setup("python3")
    end,
  },

  -- Тести (pytest)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
        },
      },
    },
  },
  -- nvim-nio for pytest
  {
    "nvim-neotest/nvim-nio",
    lazy = true,
  },
}

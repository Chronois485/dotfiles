return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
        "bash",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

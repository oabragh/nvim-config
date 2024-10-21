return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "rust",
        "go",
        "c",
        "cpp",
        "lua",
        "python",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "html",
        "css",
        "javascript",
        "typescript",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "vue",
        "yaml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

    require('nvim-treesitter.install').compilers = { "clang", "gcc" }
  end
}

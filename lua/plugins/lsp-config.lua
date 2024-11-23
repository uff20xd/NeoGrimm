return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solidity = {
          cmd = {
            "rust-analyzer"
          },
          filetypes = { "rs" },
          root_dir = require("lspconfig").util.find_git_ancestor,
          single_file_support = true,
        },
      },
    },
  },
}

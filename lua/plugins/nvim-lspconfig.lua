return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      elixirls = {
        settings = {
          elixirLS = {
            dialyzerEnabled = false,
          },
        },
      },
    },
  },
}

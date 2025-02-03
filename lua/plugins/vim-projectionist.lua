return {
  {
    "tpope/vim-projectionist",
    config = function()
      -- Define custom projectionist settings for Elixir
      vim.g.projectionist_heuristics = {
        ["mix.exs"] = {
          -- Source and test alternates
          ["apps/*/lib/*.ex"] = {
            type = "source",
            alternate = "apps/*/test/{}_test.exs",
            template = { "defmodule {camelcase|capitalize|dot} do", "end" },
          },
          ["apps/*/test/*_test.exs"] = {
            type = "test",
            alternate = "apps/*/lib/{}.ex",
            template = { "defmodule {camelcase|capitalize|dot}Test do", "end" },
          },
        },
      }

      -- Key mappings for alternate file actions
      vim.api.nvim_set_keymap(
        "n",
        "<leader>aa",
        ":A<CR>",
        { noremap = true, silent = true, desc = "Switch to Alternate File" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ava",
        ":AV<CR>",
        { noremap = true, silent = true, desc = "Switch to Alternate File in VSplit" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ac",
        ":AE<CR>",
        { noremap = true, silent = true, desc = "Create Alternate File" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>avc",
        ":AVE<CR>",
        { noremap = true, silent = true, desc = "Create Alternate File in VSplit" }
      )
    end,
  },
}

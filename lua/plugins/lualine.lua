return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Remove time component from the statusline
    opts.sections.lualine_z = {}
  end,
}

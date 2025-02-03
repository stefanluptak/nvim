return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mappings = vim.tbl_extend("force", opts.mappings, {
      ["<Right>"] = cmp.mappings.confirm({ select = true }),
      ["<CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    })
  end,
}

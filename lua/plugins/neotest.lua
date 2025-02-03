return {
  "nvim-neotest/neotest",
  enabled = true,
  opts = {
    discovery = {
      enabled = false,
      concurrent = 1,
    },
    running = {
      concurrent = true,
    },
    summary = {
      animated = false,
      follow = true,
      expand_errors = false,
      count = false,
    },
    quickfix = {
      enabled = true,
      open = function()
        vim.cmd("Trouble quickfix")
      end,
    },
    output = {
      enabled = true,
      open_on_run = false,
    },
    output_panel = {
      enabled = true,
    },
  },
  keys = {
    {
      "<leader>tf",
      function()
        require("neotest").run.run({ suite = true, extra_args = { "--failed" } })
      end,
      desc = "Run failed tests",
    },
  },
}

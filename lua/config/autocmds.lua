-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "elixir",
  callback = function()
    vim.bo.makeprg = "mix compile"
    -- vim.bo.errorformat = [[%f:%l:%c: %m,%-G%f:%l:%c: %m,%-C%f:%l:%c: %m]]
    vim.bo.errorformat = [[%f:%l:%c: %m,%-G%f:%l:%c: %m,%-C%f:%l:%c: %m]]
  end,
})

vim.cmd([[
  hi NormalNC guibg=#1b1d2b
]])

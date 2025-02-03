-- Keymaps are automatically loaded on the VeryLazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps to avoid copying deleted text into the clipboard
vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "x" }, "x", '"_x', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })

vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left in insert mode" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move down in insert mode" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move up in insert mode" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right in insert mode" })

vim.keymap.set("v", "Y", "ygv", { desc = "Yank and keep the selection" })

vim.keymap.set("n", "<leader>mc", function()
  vim.cmd("make")
  require("trouble").open("quickfix")
end, { desc = "Run mix compile and open Trouble" })

vim.keymap.set("n", "<leader>yr", ':let @+ = expand("%")<CR>', { desc = "Copy relative file path" })

vim.keymap.set("n", "<leader>fd", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname ~= "" then
    local rel_path = vim.fn.fnamemodify(bufname, ":~:.")
    if vim.fn.delete(bufname) == 0 then
      vim.notify("Deleted file: " .. rel_path, vim.log.levels.INFO)
    else
      vim.notify("Failed to delete file: " .. rel_path, vim.log.levels.ERROR)
    end
  end
  vim.cmd("bdelete!")
end, { desc = "Delete current buffer and file" })

vim.keymap.set("n", "[q", function()
  if #vim.fn.getqflist() > 1 then
    vim.cmd("cprev")
  else
    vim.cmd("cfirst")
  end
end, { desc = "Previous Quickfix Item" })

vim.keymap.set("n", "]q", function()
  if #vim.fn.getqflist() > 1 then
    vim.cmd("cnext")
  else
    vim.cmd("cfirst")
  end
end, { desc = "Next Quickfix Item" })

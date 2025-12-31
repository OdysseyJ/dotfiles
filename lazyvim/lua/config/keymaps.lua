-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Option+Enter for code actions (like IntelliJ)
vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set({ "n", "v" }, "<A-CR>", vim.lsp.buf.code_action, { desc = "Code Action (Alt)" })

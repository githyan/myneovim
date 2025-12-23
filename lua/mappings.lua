require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-t>", ":FloatermToggle<CR>", { desc = "CMD enter command mode" })
map("n", "kt", ":ShowkeysToggle<CR>")
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

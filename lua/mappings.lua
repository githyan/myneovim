require("nvchad.mappings")

-- add yours here
vim.opt.mouse = ""
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-t>", ":FloatermToggle<CR>", { desc = "CMD enter command mode" })
map("n", "kt", ":ShowkeysToggle<CR>")
map("i", "jk", "<ESC>")
map(
	"n",
	"<leader>tt",
	":lua require('base46').toggle_transparency()<CR>",
	{ noremap = true, silent = true, desc = "Toggle Background Transparency" }
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

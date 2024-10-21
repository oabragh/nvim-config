local harpoon = require('harpoon')

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>t", "<cmd>ToggleTerm<CR>")
map("n", "<leader>,", function() vim.diagnostic.open_float(0, { scope = "line" }) end)
map("n", "<leader>ih", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map("n", "<C-h>", function() harpoon:list():select(1) end)
map("n", "<C-j>", function() harpoon:list():select(2) end)
map("n", "<C-k>", function() harpoon:list():select(3) end)
map("n", "<C-l>", function() harpoon:list():select(4) end)

local builtin = require('telescope.builtin')
map('n', '<leader>f', builtin.find_files, {})

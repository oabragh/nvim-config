require("config.mappings")

vim.cmd.colorscheme('tokyonight-storm')

local set = vim.opt

-- line numbers & wrap
set.nu = true
set.relativenumber = true
set.scrolloff = 8
set.wrap = false

-- indents
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- backups
set.swapfile = false
set.backup = false

set.termguicolors = true
set.updatetime = 50

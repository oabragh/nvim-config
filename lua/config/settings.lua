local set = vim.opt

-- ui
set.number = true
set.relativenumber = true
set.scrolloff = 9
set.wrap = false
set.cursorline = true

-- indenting
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

-- searching
set.ignorecase = true
set.smartcase = true

set.swapfile = false
set.backup = false
set.termguicolors = true
set.updatetime = 50
set.showmode = false
set.guicursor = ""

local cmd = vim.cmd

cmd('colorscheme catppuccin')

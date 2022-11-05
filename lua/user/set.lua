local set = vim.opt

-- set.guicursor = ""

set.background = "dark"
set.termguicolors = true

set.nu = true
set.relativenumber = true

set.signcolumn = "yes"
set.scrolloff = 8

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.colorcolumn = '80'

set.expandtab = true

-- search settings
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hidden = true

set.smartindent = true

set.backspace = "indent,eol,start"

set.iskeyword:append("-")

set.wrap = false

set.cmdheight = 1

set.updatetime = 50

set.completeopt = { 'menu', 'menuone', 'noselect' }

set.clipboard:append("unnamedplus")

-- split windows
set.splitright = true
set.splitbelow = true

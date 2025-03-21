vim.cmd("let g:netrw_liststyle = 3")

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2 
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
-- Highlight column 80 for line length guide
opt.colorcolumn = "" 

opt.backspace = "indent,eol,start"

-- opt.clipboard:append("unnamedplus") -- Use the system clipboard for all operations
opt.clipboard = ""

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

opt.lazyredraw = false
opt.updatetime = 200
opt.timeoutlen = 1000
opt.ttimeoutlen = 10

-- opt.undodir = vim.fn.stdpath('cache') .. '/undo' -- Set undo directory
opt.undofile = false

-- Mouse support (options available: empty, a, n, v, i, c, h, r)
opt.mouse = ""

opt.wildmenu = true
opt.wildmode = "longest:full,full"

opt.showmatch = true
opt.matchtime = 2

opt.errorbells = false
opt.visualbell = true

opt.hidden = true
opt.backup = false
opt.writebackup = false

opt.virtualedit = "block"

opt.ruler = true
opt.laststatus = 2

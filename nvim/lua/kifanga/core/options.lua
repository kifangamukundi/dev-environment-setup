vim.cmd("let g:netrw_liststyle = 3") -- Set netrw to tree style

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })

local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show absolute line number on the cursor line (when relative number is on)

-- Tabs & indentation
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.smartindent = true -- Smart indenting on new lines

-- Line wrapping
opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override 'ignorecase' if search pattern contains uppercase letters

-- Highlight current line
opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine

-- Appearance
opt.termguicolors = true -- True color support
opt.background = "dark" -- Use dark background
opt.signcolumn = "yes" -- Always show the sign column to avoid text shifting
opt.scrolloff = 8 -- Keep 8 lines visible above and below the cursor
opt.sidescrolloff = 8 -- Keep 8 columns visible to the left and right of the cursor
opt.colorcolumn = "" -- Highlight column 80 for line length guide

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace over everything in insert mode

-- Clipboard
-- opt.clipboard:append("unnamedplus") -- Use the system clipboard for all operations
opt.clipboard = ""  -- Disable automatic system clipboard integration

-- Splits
opt.splitright = true -- Vertical splits will automatically be to the right
opt.splitbelow = true -- Horizontal splits will automatically be below

-- Swapfile
opt.swapfile = false -- Don't use swapfile

-- Performance
opt.lazyredraw = false -- Ensure instant feedback when typing
opt.updatetime = 200 -- Faster completion
opt.timeoutlen = 1000 -- Allow more time to complete key mappings
opt.ttimeoutlen = 10 -- Faster response for terminal key mappings

-- Undo
opt.undofile = true -- Enable persistent undo
opt.undodir = vim.fn.stdpath('cache') .. '/undo' -- Set undo directory

-- Mouse support (options available: empty, a, n, v, i, c, h, r)
opt.mouse = ""

-- Enhanced command-line completion
opt.wildmenu = true -- Visual autocomplete for command menu
opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Reduce delay for showing matching parens
opt.showmatch = true -- Highlight matching parentheses
opt.matchtime = 2 -- Delay before showing matching paren (tenths of a second)

-- Disable error bells
opt.errorbells = false
opt.visualbell = true -- Use visual bell instead of beeping

-- Improve file handling
opt.hidden = true -- Enable modified buffers to be hidden
opt.backup = false -- No backup file creation
opt.writebackup = false -- Don't keep backup files after writing

-- Enable virtualedit (allows cursor to move where there is no text)
opt.virtualedit = "block"

-- Enable more responsive UI
opt.ruler = true -- Show the cursor position all the time
opt.laststatus = 2 -- Always show the status line

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>sl", "<C-w>h", { desc = "Move to the left split" }) -- move to left split
keymap.set("n", "<leader>sb", "<C-w>j", { desc = "Move to the below split" }) -- move to below split
keymap.set("n", "<leader>sa", "<C-w>k", { desc = "Move to the above split" }) -- move to above split
keymap.set("n", "<leader>sr", "<C-w>l", { desc = "Move to the right split" }) -- move to right split
keymap.set("n", "<leader>sc", "<cmd>only<CR>", { desc = "Close all other splits" }) -- close all splits except the current one

keymap.set("n", "<leader>ssl", "<C-w>H", { desc = "Move split to the far left" }) -- move split to the far left
keymap.set("n", "<leader>ssb", "<C-w>J", { desc = "Move split to the very bottom" }) -- move split to the very bottom
keymap.set("n", "<leader>ssa", "<C-w>K", { desc = "Move split to the very top" }) -- move split to the very top
keymap.set("n", "<leader>ssr", "<C-w>L", { desc = "Move split to the far right" }) -- move split to the far right

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>ta", "<cmd>tabonly<CR>", { desc = "Close all tabs except the current one" }) -- close all tabs except the current one
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


keymap.set("n", "<leader>tmn", "<cmd>+tabmove<CR>", { desc = "Move current tab to the next position" }) -- move current tab to the next position
keymap.set("n", "<leader>tmp", "<cmd>-tabmove<CR>", { desc = "Move current tab to the previous position" }) -- move current tab to the previous position
keymap.set("n", "<leader>tmf", "<cmd>tabmove 0<CR>", { desc = "Move current tab to first position" }) -- move current tab to the first position
keymap.set("n", "<leader>tml", "<cmd>tabmove $<CR>", { desc = "Move current tab to last position" }) -- move current tab to the last position

keymap.set("n", "<leader>tsn", "<cmd>tabnext<bar>-tabmove<CR>", { desc = "Swap current tab with next tab" }) -- swap current tab with next tab
keymap.set("n", "<leader>tsp", "<cmd>tabprevious<bar>+tabmove<CR>", { desc = "Swap current tab with previous tab" }) -- swap current tab with previous tab
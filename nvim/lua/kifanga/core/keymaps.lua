vim.g.mapleader = " "

local keymap = vim.keymap

-- Disable arrow keys in all modes
local modes = { "n", "i", "v", "s", "c", "t" }
local arrows = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, mode in ipairs(modes) do
    for _, arrow in ipairs(arrows) do
        keymap.set(mode, arrow, "<Nop>", { noremap = true })
    end
end

-- The "+ register" is the vim equivalent to a CTRL+C in another program, while the "* register" is the "mouse selection and middle click" equivalent (in a Gnu/Linux OS).
-- Function to clear Vim registers, excluding the system clipboard
function ClearRegisters()
  local registers = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-'}
  for _, reg in ipairs(registers) do
    vim.fn.setreg(reg, '')
  end
end

-- Map <leader>cc to clear registers
vim.keymap.set("n", "<leader>cr", ClearRegisters, { desc = "Clear Vim registers" })

-- Remap <C-d> and <C-u> to include centering with zz
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Searching and centering activate while on word with * or #
vim.keymap.set("n", "n", "nzz", { desc = "Search moving forward or backward" })
vim.keymap.set("n", "N", "Nzz", { desc = "Search moving forward or backward" })

vim.keymap.set("n", "<leader>rs", function()
  local old_word = vim.fn.expand("<cword>")
  local new_word = vim.fn.input("Replace " .. old_word .. " with (case-sensitive): ", old_word)

  if new_word ~= "" and new_word ~= old_word then
    vim.cmd(":%s/\\<" .. old_word .. "\\>/" .. new_word .. "/g")
  else
    print("Replacement aborted or no change provided.")
  end
end, { desc = "Replace word (case-sensitive)" })

vim.keymap.set("n", "<leader>ri", function()
  local old_word = vim.fn.expand("<cword>")
  local new_word = vim.fn.input("Replace " .. old_word .. " with (case-insensitive): ", old_word)

  if new_word ~= "" and new_word ~= old_word then
    vim.cmd(":%s/\\<" .. old_word .. "\\>/" .. new_word .. "/gi")
  else
    print("Replacement aborted or no change provided.")
  end
end, { desc = "Replace word (case-insensitive)" })

-- Move the current line up
keymap.set("n", "<leader>mK", ":m .-2<CR>==", { desc = "Move line up" })

-- Move the current line down
keymap.set("n", "<leader>mJ", ":m .+1<CR>==", { desc = "Move line down" })

-- Move selected lines up
keymap.set("v", "<leader>mK", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Move selected lines down
keymap.set("v", "<leader>mJ", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- Duplicate the current line up
keymap.set("n", "<leader>dK", "yypk", { desc = "Duplicate line up" })

-- Duplicate the current line down
keymap.set("n", "<leader>dJ", "yyp", { desc = "Duplicate line down" })

-- Duplicate selected lines up
keymap.set("v", "<leader>dK", ":t '<-1<CR>gv=gv", { desc = "Duplicate selected lines up" })

-- Duplicate selected lines down
keymap.set("v", "<leader>dJ", ":t '>+1<CR>gv=gv", { desc = "Duplicate selected lines down" })

-- Delete without affecting yank register
keymap.set("n", "d", [["_d]], { desc = "Delete without affecting yank register" })
keymap.set("v", "d", [["_d]], { desc = "Delete without affecting yank register" })

-- Change without affecting yank register
keymap.set("n", "c", [["_c]], { desc = "Change without affecting yank register" })
keymap.set("v", "c", [["_c]], { desc = "Change without affecting yank register" })

-- Cut (x) without affecting yank register
keymap.set("n", "x", [["_x]], { desc = "Cut character without affecting yank register" })
keymap.set("v", "x", [["_x]], { desc = "Cut selection without affecting yank register" })

-- Swap the current line with the one below
keymap.set("n", "<leader>sJ", ":m .+1<CR>==", { desc = "Swap line with the one below" })

-- Swap the current line with the one above
keymap.set("n", "<leader>sK", ":m .-2<CR>==", { desc = "Swap line with the one above" })

-- Swap the selected lines (visual mode) with the ones below
keymap.set("v", "<leader>sJ", ":m '>+1<CR>gv=gv", { desc = "Swap selected lines with the ones below" })

-- Swap the selected lines (visual mode) with the ones above
keymap.set("v", "<leader>sK", ":m '<-2<CR>gv=gv", { desc = "Swap selected lines with the ones above" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>mh", "<C-w>h", { desc = "Move to the left split" })
keymap.set("n", "<leader>mj", "<C-w>j", { desc = "Move to the below split" })
keymap.set("n", "<leader>mk", "<C-w>k", { desc = "Move to the above split" })
keymap.set("n", "<leader>ml", "<C-w>l", { desc = "Move to the right split" })

-- Keymaps for buffer management
keymap.set("n", "<leader>bo", "<cmd>enew<CR>", { desc = "Open new buffer" })
keymap.set("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>ba", "<cmd>bufdo bd|enew<CR>", { desc = "Close all buffers and open a blank buffer" })
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bf", "<cmd>saveas temp_duplicate | e %<CR>", { desc = "Duplicate current buffer as new file" })

vim.api.nvim_create_autocmd("VimEnter", {
  command = "clearjumps",
})

keymap.set("n", "<leader>cJ", "<cmd>clearjumps<CR>", { desc = "Clear Jump List" })

-- Quick Fix Section (use with live grep)
keymap.set('n', '<leader>qn', '<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>', { desc = "Next quickfix item" })
keymap.set('n', '<leader>qp', '<Cmd>try | cprevious | catch | clast | catch | endtry<CR>', { desc = "Previous quickfix item" })
keymap.set('n', '<leader>qx', '<Cmd>cclose<CR>', { desc = "Close quickfix list" })
keymap.set('n', '<leader>qo', '<Cmd>copen<CR>', { desc = "Open quickfix list" })

keymap.set('n', '<leader>qc', function()
  vim.fn.setqflist({})
  print("Quickfix list cleared")
end, { desc = "Clear quickfix list" })

local keymap = vim.keymap

-- Arglist (use with file find or directly inside the file)
keymap.set('n', '<leader>ln', '<Cmd>try | args | next | catch | args | first | catch | endtry<CR>', { desc = "Next arglist item" })
keymap.set('n', '<leader>lp', '<Cmd>try | args | previous | catch | args | last | catch | endtry<CR>', { desc = "Previous arglist item" })

keymap.set('n', '<leader>lc', function()
  vim.cmd("argdelete *")
  print("Arglist cleared")
end, { desc = "Clear arglist" })

keymap.set('n', '<leader>la', function()
    local current_file = vim.fn.expand("%")
    local arglist = vim.fn.argv()
    if not vim.tbl_contains(arglist, current_file) then
        vim.cmd("argadd " .. vim.fn.escape(current_file, " "))
        print("Added " .. current_file .. " to arglist")
    else
        print("File already in arglist")
    end
end, {desc = "Add current file to arglist"})

keymap.set('n', '<leader>lr', function()
    local current_file = vim.fn.expand("%")
    local arglist = vim.fn.argv()
    if vim.tbl_contains(arglist, current_file) then
        vim.cmd("argdel " .. vim.fn.escape(current_file, " "))
        print("Removed " .. current_file .. " from arglist")
    else
        print("File not in arglist")
    end
end, {desc = "Remove current file from arglist"})

-- location list mostly for diagnostics
keymap.set('n', '<leader>lN', '<Cmd>try | lnext | catch | lfirst | catch | endtry<CR>', { desc = "Next location list item" })
keymap.set('n', '<leader>lP', '<Cmd>try | lprevious | catch | llast | catch | endtry<CR>', { desc = "Previous location list item" })
keymap.set('n', '<leader>lX', '<Cmd>lclose<CR>', { desc = "Close location list" })
keymap.set('n', '<leader>lO', '<Cmd>lopen<CR>', { desc = "Open location list" })

-- keymap.set('n', '<leader>lC', function()
--   vim.fn.setloclist(0, {}) -- Clear the location list
--   print("Location list cleared")
-- end, { desc = "Clear location list" })
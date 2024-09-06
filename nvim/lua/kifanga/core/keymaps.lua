vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

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
    vim.fn.setreg(reg, '')  -- Clear the register
  end
end

-- Map <leader>cc to clear registers
vim.keymap.set("n", "<leader>cr", ClearRegisters, { desc = "Clear Vim registers" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>mh", "<C-w>h", { desc = "Move to the left split" })  -- left
keymap.set("n", "<leader>mj", "<C-w>j", { desc = "Move to the below split" })  -- down
keymap.set("n", "<leader>mk", "<C-w>k", { desc = "Move to the above split" })  -- up
keymap.set("n", "<leader>ml", "<C-w>l", { desc = "Move to the right split" })  -- right

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>ta", "<cmd>tabonly<CR>", { desc = "Close all tabs except the current one" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

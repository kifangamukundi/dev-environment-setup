return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use the latest stable version
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          insert = false,  -- Disable default insert mode keymap
          insert_line = false, -- Disable default insert line keymap
          normal = false,  -- Disable default normal mode keymap
          normal_cur = false, -- Disable normal mode keymap for current word
          normal_line = false, -- Disable normal mode keymap for current line
          normal_cur_line = false, -- Disable normal mode keymap for current line
          visual = false,  -- Disable default visual mode keymap
          visual_line = false, -- Disable default visual line mode keymap
          delete = false,  -- Disable delete surrounding keymap
          change = false,  -- Disable change surrounding keymap
        },
      })

      -- Custom Keymaps
      local keymap = vim.keymap

      -- Visual Mode: Surround the selected text
      vim.keymap.set("v", "<leader>sb", "<Plug>(nvim-surround-visual)", { desc = "Surround selected text" })

      -- Delete surrounding in Normal mode
      keymap.set("n", "<leader>sd", "<Plug>(nvim-surround-delete)", { desc = "Delete surrounding" })

      -- Change surrounding in Normal mode
      keymap.set("n", "<leader>sc", "<Plug>(nvim-surround-change)", { desc = "Change surrounding" })
    end,
  },
}
return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          insert = false,
          insert_line = false,
          normal = false,
          normal_cur = false,
          normal_line = false,
          normal_cur_line = false,
          visual = false,
          visual_line = false,
          delete = false,
          change = false,
        },
      })

      local keymap = vim.keymap

      vim.keymap.set("v", "<leader>sb", "<Plug>(nvim-surround-visual)", { desc = "Surround selected text" })

      keymap.set("n", "<leader>sd", "<Plug>(nvim-surround-delete)", { desc = "Delete surrounding" })

      keymap.set("n", "<leader>sc", "<Plug>(nvim-surround-change)", { desc = "Change surrounding" })
    end,
  },
}
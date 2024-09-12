return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  version = "*", -- Replace with desired version
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        show_buffer_icons = true,
        bufferline_max_length = 30,
        bufferline_highlight_modified = true,
        bufferline_always_show_bufferline = true,
        bufferline_separator = "│",
        bufferline_tab_close_icon = "",
        bufferline_cusp_padding = { left = 1, right = 1 },
        bufferline_nvim_tree_integrated = true,
        close_command = ":bd", -- Or try :bdelete or :q
        leave_open_close = true,
        -- Add more options as needed
        offsets = {
          {
            filetype = "NvimTree", -- This matches the filetype of nvim-tree
            text = "File Explorer", -- Name for the file explorer
            highlight = "Directory", -- Highlight group for the text
            text_align = "left", -- Align the text to the left
            separator = true, -- Whether to show a separator between tree and buffers
          },
        },
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get(), -- Integrates Catppuccin theme with bufferline
    }
  end,
}

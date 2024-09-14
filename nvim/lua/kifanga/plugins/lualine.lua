return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,  -- Enable icons if desired
        theme = "catppuccin",  -- Set the lualine theme to Catppuccin
      },
      sections = {
        lualine_a = { 'mode' },  -- Show the current mode (e.g., Normal, Insert)
        lualine_b = { 'filename' },  -- Show only the name of the current buffer (file)
        lualine_c = { 'filetype' },  -- Filetype
        lualine_x = {}, 
        lualine_y = { 'progress' },  -- Show the progress through the file
        lualine_z = { 'location' },  -- Show the current cursor location
      },
      inactive_sections = {  -- Also simplify the inactive sections
        lualine_a = {},
        lualine_b = { 'filename' },  -- Show the current file name in inactive windows
        lualine_c = { 'filetype' },  -- Filetype
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},  -- No tabline to keep it minimal
      extensions = {},  -- No additional extensions
    })
  end,
}
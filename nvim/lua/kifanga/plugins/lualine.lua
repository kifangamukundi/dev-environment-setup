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
        lualine_a = { 'mode' },  -- Mode
        lualine_b = { 'filename' },  -- Filename
        lualine_c = { 'filetype' },  -- Filetype
        lualine_x = { 'encoding', 'fileformat', 'branch' },  -- Encoding, File Format, Git Branch
        lualine_y = { 'progress' },  -- Progress
        lualine_z = { 'location' },  -- Cursor Location
      },
    })
  end,
}

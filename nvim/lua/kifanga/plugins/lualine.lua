return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  config = function()
    local lualine = require("lualine")

    -- Define custom mode names for commonly used modes
    local mode_map = {
      ['n']  = 'Chillin',        -- Normal mode
      ['i']  = 'Typing',         -- Insert mode
      ['v']  = 'Selecting',      -- Visual mode
      ['V']  = 'Selecting (Line)', -- Visual Line mode
      ['\22'] = 'Selecting (Block)', -- Visual Block mode (Ctrl-V)
      ['r']  = 'Replacing',      -- Replace mode
      ['s']  = 'Select Mode',    -- Select mode
      ['S']  = 'Select Line',    -- Select Line mode
      ['t']  = 'Terminal',       -- Terminal mode
      ['c']  = 'Commanding',     -- Command-line mode
      ['no'] = 'Noble',          -- Normal (Operator Pending)
      ['x']  = 'Exiting',        -- Visual mode (Operator Pending)
      ['o']  = 'Operator',       -- Operator Pending mode
      ['!']  = 'Inserting!',     -- Shell mode
      ['R']  = 'Overwriting',    -- Replace mode
    }

    -- Define custom mode function to show funny names for modes
    local function custom_mode()
      local mode_code = vim.api.nvim_get_mode().mode
      return mode_map[mode_code] or mode_code -- Use the custom name or fallback to default if not mapped
    end

    -- Set up lualine with the custom mode function
    lualine.setup({
      options = {
        icons_enabled = true,  -- Enable icons if desired
        theme = "catppuccin",  -- Set the lualine theme to Catppuccin
        component_separators = { left = '', right = '' }, -- Default separators
        section_separators = { left = '', right = '' }, -- Default separators
      },
      sections = {
        lualine_a = { custom_mode },  -- Use the custom mode names
        lualine_b = { 'filename' },   -- Show only the name of the current buffer (file)
        lualine_c = { 'filetype' },   -- Show filetype
        lualine_x = {},               -- Empty section
        lualine_y = { 'progress' },   -- Show progress through the file
        lualine_z = { 'location' },   -- Show the current cursor location
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { 'filename' },  -- Show the current file name in inactive windows
        lualine_c = { 'filetype' },  -- Show filetype
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},  -- No tabline to keep it minimal
      extensions = {},  -- No additional extensions
    })
  end,
}
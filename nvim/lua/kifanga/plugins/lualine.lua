return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons"},
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

    local function custom_mode()
      local mode_code = vim.api.nvim_get_mode().mode
      return mode_map[mode_code] or mode_code
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "papercolor_dark",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { custom_mode },
        lualine_b = { 'filename' },
        lualine_c = { 'filetype' },
        lualine_x = {},
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { 'filename' },
        lualine_c = { 'filetype' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
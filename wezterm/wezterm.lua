-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Apply the Catppuccin Mocha color scheme
config.color_scheme = "Catppuccin Mocha"

-- Configure fonts
config.font = wezterm.font_with_fallback({
  { family = 'JetBrains Mono', weight = 'Regular' },
  { family = 'JetBrains Mono', weight = 'Bold', italic = true },
  { family = 'JetBrains Mono', weight = 'ExtraBold' },
})

config.font_size = 12
config.enable_tab_bar = false

-- Rendering Method: OpenGL, Software, WebGpu
config.front_end = "Software"

-- Return the configuration to wezterm
return config

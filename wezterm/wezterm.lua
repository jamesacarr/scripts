-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Configure the window
local config = wezterm.config_builder()

require('keys').setup(config)
require('tabs').setup(config)

config.color_scheme = 'OneHalfDark'
config.command_palette_font_size = 14
config.default_cursor_style = 'SteadyUnderline'
config.font = wezterm.font 'MesloLGM Nerd Font Mono'
config.font_size = 12
config.macos_window_background_blur = 10
config.scrollback_lines = 10000
config.window_background_opacity = 0.9
config.window_decorations = 'RESIZE'
config.window_frame = {
  font = wezterm.font { family = 'MesloLGM Nerd Font', weight = 'Bold' },
  font_size = 11.0,
}

-- Maximize the window on startup
local mux = wezterm.mux
wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return config

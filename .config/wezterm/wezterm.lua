local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'tokyonight_night'
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
--config.win32_system_backdrop = "Acrylic" -- doesnt look very cool
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.keys = {
    {
      key = 'f',
      mods = 'ALT',
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = 'v',
      mods = 'ALT',
      action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain' }
    },
    {
      key = 'h',
      mods = 'ALT',
      action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' }
    },
    {
      key = 'w',
      mods = 'CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },
}
return config


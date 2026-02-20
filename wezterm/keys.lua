local wezterm = require("wezterm")

local act = wezterm.action
local M = {}

M.mod = wezterm.target_triple:find("windows") and "SHIFT|CTRL" or "SHIFT|SUPER"

M.smart_split = wezterm.action_callback(function(window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
  else
    window:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
  end
end)

M.smart_close = wezterm.action_callback(function(window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(act.CloseCurrentPane({ confirm = false }), pane)
  else
    window:perform_action(act.CloseCurrentPane({ confirm = false }), pane)
  end
end)

function M.setup(config)
  config.keys = {
    -- General
    { mods = 'SHIFT', key = 'Enter', action = act.SendString('\n') },
    { mods = 'SUPER', key = 'LeftArrow', action = act { SendString = "\x1bOH" } },
    { mods = 'SUPER', key = 'RightArrow', action = act { SendString = "\x1bOF" } },
    { mods = 'OPT', key = 'LeftArrow', action = act { SendString = "\x1bb" } },
    { mods = 'OPT', key = 'RightArrow', action = act { SendString = "\x1bf" } },
    -- Splits
    { mods = M.mod, key = "Enter", action = M.smart_split },
    { mods = M.mod, key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { mods = M.mod, key = "_", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { mods = "SUPER", key = "w", action = act.CloseCurrentPane({ confirm = false }) },
    -- show the pane selection mode, but have it swap the active and selected panes
    { mods = M.mod, key = "S", action = wezterm.action.PaneSelect({}) },
    { mods = M.mod, key = "m", action = act.TogglePaneZoomState },
    { mods = M.mod, key = "p", action = act.ActivateCommandPalette },
    { mods = M.mod, key = "d", action = act.ShowDebugOverlay },
  }
end

return M

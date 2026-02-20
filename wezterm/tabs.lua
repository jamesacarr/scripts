local wezterm = require "wezterm"

local M = {}

M.colors = {
  background = "#212529",
  foreground = "#ced4da",
  background_active = "#343a40",
  foreground_active = "#ced4da",
  background_hover = "#495057",
  foreground_hover = "#e9ecef",
  background_claude = "#733924",
  foreground_claude = "#f4f3ee",
  background_claude_active = "#c15f3c",
  foreground_claude_active = "#f4f3ee",
}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function M.basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

function M.claude_running(tab)
  local is_claude_running = false
  for _, pane in ipairs(tab.panes) do
    if pane.foreground_process_name:find("claude") then
      is_claude_running = true
      break
    end
  end

  return is_claude_running
end

M.icons = {
  ["docker"] = wezterm.nerdfonts.md_docker,
  ["docker-compose"] = wezterm.nerdfonts.md_docker,
  ["git"] = wezterm.nerdfonts.md_git,
  ["make"] = wezterm.nerdfonts.seti_makefile,
  ["node"] = wezterm.nerdfonts.md_nodejs,
  ["python"] = wezterm.nerdfonts.md_language_python,
  ["bash"] = wezterm.nerdfonts.fa_terminal,
  ["zsh"] = wezterm.nerdfonts.fa_terminal,
}

function M.setup(config)
  config.hide_tab_bar_if_only_one_tab = true
  config.unzoom_on_switch_pane = true

  config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  }

  config.colors = {
    tab_bar = {
      active_tab = {
        bg_color = M.colors.background_active,
        fg_color = M.colors.foreground_active,
        intensity = 'Bold',
      },
      inactive_tab = {
        bg_color = M.colors.background,
        fg_color = M.colors.foreground,
        intensity = 'Half',
      },
      inactive_tab_hover = {
        bg_color = M.colors.background_hover,
        fg_color = M.colors.foreground_hover,
      },
    },
  }

  wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
      local pane = tab.active_pane
      local process = M.basename(pane.foreground_process_name)
      local title = pane.title

      if M.icons[process] then
        title = M.icons[process] .. " " .. title
      end

      local is_zoomed = false
      for _, pane in ipairs(tab.panes) do
        if pane.is_zoomed then
          is_zoomed = true
          break
        end
      end
      if is_zoomed then
        title = wezterm.nerdfonts.md_magnify .. " " .. title
      end
      
      if M.claude_running(tab) then
        local background = M.colors.background_claude
        local foreground = M.colors.foreground_claude
        if tab.is_active then
          background = M.colors.background_claude_active
          foreground = M.colors.foreground_claude_active
        end

        return {
          { Background = { Color = background } },
          { Foreground = { Color = foreground } },
          { Text = ' ' .. title .. ' ' },
        }
      end

      return {
        { Text = ' ' .. title .. ' ' },
      }
    end
  )
end

return M

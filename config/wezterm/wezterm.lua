local W = require "wezterm"
local c = W.config_builder()

c.default_prog = { "fish" }

c.color_scheme = "Tokyo Night"
c.font = W.font "JetBrains Mono" -- c.font = W.font "Maple Mono"
c.font_size = 12.4
-- c.line_height = 1.05

c.default_cursor_style = "BlinkingBar"
c.cursor_blink_rate = 0
c.audible_bell = "Disabled"
c.window_decorations = "NONE"
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = true
c.show_new_tab_button_in_tab_bar = false
c.switch_to_last_active_tab_when_closing_tab = true
c.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- keys
local function enter_mode(name, action)
  return W.action.Multiple {
    action,
    W.action.ActivateKeyTable { name = name, one_shot = false },
  }
end
local function resize_entry(dir)
  return enter_mode("resize_pane", W.action.AdjustPaneSize { dir, 2 })
end
local function move_tab_entry(rel)
  return enter_mode("move_tab", W.action.MoveTabRelative(rel))
end

c.leader = { mods = "CTRL", key = "t", timeout_milliseconds = 400 }
c.keys = {
  { mods = "ALT", key = "1", action = W.action.ActivateTab(0) },
  { mods = "ALT", key = "2", action = W.action.ActivateTab(1) },
  { mods = "ALT", key = "3", action = W.action.ActivateTab(2) },
  { mods = "ALT", key = "4", action = W.action.ActivateTab(3) },
  { mods = "ALT", key = "5", action = W.action.ActivateTab(4) },
  { mods = "ALT", key = "6", action = W.action.ActivateTab(5) },
  { mods = "ALT", key = "7", action = W.action.ActivateTab(6) },
  { mods = "ALT", key = "8", action = W.action.ActivateTab(7) },
  { mods = "ALT", key = "9", action = W.action.ActivateTab(8) },
  { mods = "CTRL", key = "=", action = W.action.IncreaseFontSize },
  { mods = "CTRL", key = "-", action = W.action.DecreaseFontSize },
  { mods = "CTRL", key = "0", action = W.action.ResetFontSize },
  { mods = "LEADER", key = "t", action = W.action.SpawnCommandInNewTab {} },
  { mods = "LEADER", key = "w", action = W.action.CloseCurrentPane { confirm = false } },
  { mods = "LEADER", key = "n", action = W.action.SplitHorizontal {} },
  { mods = "LEADER", key = "N", action = W.action.SplitVertical {} },
  { mods = "LEADER", key = "f", action = W.action.TogglePaneZoomState },
  { mods = "LEADER", key = "/", action = W.action.ActivateCopyMode },
  { mods = "LEADER|SHIFT", key = "<", action = move_tab_entry(-1) },
  { mods = "LEADER|SHIFT", key = ">", action = move_tab_entry(1) },
  { mods = "LEADER", key = "h", action = W.action.ActivatePaneDirection "Left" },
  { mods = "LEADER", key = "j", action = W.action.ActivatePaneDirection "Down" },
  { mods = "LEADER", key = "k", action = W.action.ActivatePaneDirection "Up" },
  { mods = "LEADER", key = "l", action = W.action.ActivatePaneDirection "Right" },
  { mods = "LEADER", key = "LeftArrow", action = resize_entry "Left" },
  { mods = "LEADER", key = "DownArrow", action = resize_entry "Down" },
  { mods = "LEADER", key = "UpArrow", action = resize_entry "Up" },
  { mods = "LEADER", key = "RightArrow", action = resize_entry "Right" },
}

c.key_tables = {
  resize_pane = {
    { key = "Escape", action = "PopKeyTable" },
    { key = "LeftArrow", action = W.action.AdjustPaneSize { "Left", 2 } },
    { key = "h", action = W.action.AdjustPaneSize { "Left", 2 } },
    { key = "RightArrow", action = W.action.AdjustPaneSize { "Right", 2 } },
    { key = "l", action = W.action.AdjustPaneSize { "Right", 2 } },
    { key = "UpArrow", action = W.action.AdjustPaneSize { "Up", 2 } },
    { key = "k", action = W.action.AdjustPaneSize { "Up", 2 } },
    { key = "DownArrow", action = W.action.AdjustPaneSize { "Down", 2 } },
    { key = "j", action = W.action.AdjustPaneSize { "Down", 2 } },
  },
  move_tab = {
    { key = "Escape", action = "PopKeyTable" },
    { mods = "SHIFT", key = "<", action = W.action.MoveTabRelative(-1) },
    { mods = "SHIFT", key = ">", action = W.action.MoveTabRelative(1) },
  },
}

return c

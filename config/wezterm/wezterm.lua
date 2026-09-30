local w = require "wezterm"
local a = w.action
local c = w.config_builder()

c.default_prog = { "fish" }
c.scrollback_lines = 10000

c.color_scheme = "Tokyo Night"
c.font = w.font "JetBrains Mono"
c.font_size = 12.4

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
  return a.Multiple {
    action,
    a.ActivateKeyTable { name = name, one_shot = false },
  }
end
local function resize_entry(dir)
  return enter_mode("resize_pane", a.AdjustPaneSize { dir, 2 })
end
local function move_tab_entry(rel)
  return enter_mode("move_tab", a.MoveTabRelative(rel))
end

c.leader = { mods = "CTRL", key = "t", timeout_milliseconds = 400 }
c.keys = {
  { mods = "ALT", key = "1", action = a.ActivateTab(0) },
  { mods = "ALT", key = "2", action = a.ActivateTab(1) },
  { mods = "ALT", key = "3", action = a.ActivateTab(2) },
  { mods = "ALT", key = "4", action = a.ActivateTab(3) },
  { mods = "ALT", key = "5", action = a.ActivateTab(4) },
  { mods = "ALT", key = "6", action = a.ActivateTab(5) },
  { mods = "ALT", key = "7", action = a.ActivateTab(6) },
  { mods = "ALT", key = "8", action = a.ActivateTab(7) },
  { mods = "ALT", key = "9", action = a.ActivateTab(8) },
  { mods = "CTRL", key = "=", action = a.IncreaseFontSize },
  { mods = "CTRL", key = "-", action = a.DecreaseFontSize },
  { mods = "CTRL", key = "0", action = a.ResetFontSize },
  { mods = "LEADER", key = "t", action = a.SpawnCommandInNewTab {} },
  { mods = "LEADER", key = "w", action = a.CloseCurrentPane { confirm = false } },
  { mods = "LEADER", key = "n", action = a.SplitHorizontal {} },
  { mods = "LEADER", key = "N", action = a.SplitVertical {} },
  { mods = "LEADER", key = "f", action = a.TogglePaneZoomState },
  { mods = "LEADER", key = "/", action = a.ActivateCopyMode },
  { mods = "LEADER|SHIFT", key = "<", action = move_tab_entry(-1) },
  { mods = "LEADER|SHIFT", key = ">", action = move_tab_entry(1) },
  { mods = "LEADER", key = "h", action = a.ActivatePaneDirection "Left" },
  { mods = "LEADER", key = "j", action = a.ActivatePaneDirection "Down" },
  { mods = "LEADER", key = "k", action = a.ActivatePaneDirection "Up" },
  { mods = "LEADER", key = "l", action = a.ActivatePaneDirection "Right" },
  { mods = "LEADER", key = "LeftArrow", action = resize_entry "Left" },
  { mods = "LEADER", key = "DownArrow", action = resize_entry "Down" },
  { mods = "LEADER", key = "UpArrow", action = resize_entry "Up" },
  { mods = "LEADER", key = "RightArrow", action = resize_entry "Right" },
}

c.key_tables = {
  resize_pane = {
    { key = "Escape", action = "PopKeyTable" },
    { key = "LeftArrow", action = a.AdjustPaneSize { "Left", 2 } },
    { key = "h", action = a.AdjustPaneSize { "Left", 2 } },
    { key = "RightArrow", action = a.AdjustPaneSize { "Right", 2 } },
    { key = "l", action = a.AdjustPaneSize { "Right", 2 } },
    { key = "UpArrow", action = a.AdjustPaneSize { "Up", 2 } },
    { key = "k", action = a.AdjustPaneSize { "Up", 2 } },
    { key = "DownArrow", action = a.AdjustPaneSize { "Down", 2 } },
    { key = "j", action = a.AdjustPaneSize { "Down", 2 } },
  },
  move_tab = {
    { key = "Escape", action = "PopKeyTable" },
    { mods = "SHIFT", key = "<", action = a.MoveTabRelative(-1) },
    { mods = "SHIFT", key = ">", action = a.MoveTabRelative(1) },
  },
}

return c

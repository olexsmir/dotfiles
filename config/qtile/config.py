from typing import List
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
import os


auto_fullscreen = True
focus_on_window_activation = "smart"

mod = "mod4"            # Set mod key(Super/Win)
terminal = "kitty"      # Set terminal

colors = [["#292d3e", "#292d3e"], # panel background
          ["#434758", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#ff1151", "#ff1151"], # border line color for current tab
          ["#8d62a9", "#8d62a9"], # border line color for other tab and odd widgets
          ["#668bd7", "#668bd7"], # color for the even widgets
          ["#e1acff", "#e1acff"]] # window name

@hook.subscribe.startup_once
def autostart(): os.system("~/.config/qtile/autostart.sh")


keys = [
    ## Window control
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "k", lazy.layout.down(), desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(), desc="Move focus up in stack pane"),
    Key([mod, "control"], "k", lazy.layout.shuffle_down(), desc="Move window down in current stack"),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(), desc="Move window up in current stack"),

    ## Layout changer
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "space", lazy.prev_layout(), desc="Toggle between layouts"),
   
    ## Launch program
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "F1", lazy.spawn(terminal + " -e ranger"), desc="Launch ranger"),
    Key([mod], "F2", lazy.spawn("qutebrowser"), desc="Launch qutebrowser"),

    ## Program launcher(Dmenu or default)
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget" ),
    Key([mod, "shift"], "Return", lazy.spawn("dmenu_run -h 24 -p Run:"), desc="Demnu program launcher" ),
    Key([mod, "control"], "u", lazy.spawn("sh ~/.script/dmenu/dmenu-config-edit.sh"), desc="Dmenu config menu"),
    Key([mod, "control"], "i", lazy.spawn("passmenu -h 24"), desc="Dmenu password menu"),

    ## Qtile
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    
    ## Keyboard
    Key(["mod1"], "Shift_L", lazy.widget['keyboardlayout'].next_keyboard(), desc="Switch keyboard layout"),
]

group_names = [("term", {'layout': 'monadtall'}),
               ("www", {'layout': 'monadtall'}),
               ("dev", {'layout': 'monadtall'}),
               ("sys", {'layout': 'monadtall'}),
               ("note", {'layout': 'monadtall'}),
               ("chat", {'layout': 'monadtall'}),
               ("pass", {'layout': 'monadtall'}),
               ("gft", {'layout': 'max'}),
               ("flo", {'layout': 'floating'})
]
groups = [Group(name, **kwargs) for name, kwargs in group_names]
for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layout_theme = {
    "border_width": 2,
    "margin": 0,
    "border_focus": "e1acff",
    "border_normal": "1D2330"
}
layouts = [
    layout.Max(**layout_theme),
    #layout.Stack(num_stacks=2, **layout_theme),
    #layout.Bsp(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme)
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar([
                widget.GroupBox(
                       borderwidth = 0,
                       active = colors[2],
                       inactive = colors[2],
                       rounded = False,
                       highlight_color = colors[1],
                       highlight_method = "line",
                       this_current_screen_border = colors[3],
                       this_screen_border = colors [4],
                       other_current_screen_border = colors[0],
                       other_screen_border = colors[0],
                       foreground = colors[2],
                       background = colors[0]
                ),
                widget.Prompt( padding = 10, foreground = colors[3], background = colors[0] ),
                widget.WindowName( foreground = colors[6], background = colors[0], padding = 7 ),
                widget.Systray( background = colors[0], padding = 3 ),
                widget.CurrentLayout(foreground = colors[2], background = colors[0]),
                widget.Net( interface = "wlp3s0", format = '{down}↓↑{up}', foreground = colors[2], background = colors[0], padding = 0 ),
                widget.TextBox(padding=3, background=colors[0]),
                widget.TextBox( text="", foreground = colors[2], background = colors[0], padding=3 ),
                widget.Volume( update_interval = 0.2, foreground = colors[2], background = colors[0], padding=0 ),
                widget.TextBox(padding=3, background=colors[0]),
                widget.TextBox( text="", foreground=colors[2], background=colors[0], padding=0 ),
                widget.KeyboardLayout( configured_keyboards=['us','ru', 'ua'], display_map={ 'us': ' us', 'ru': ' ru', 'ua': ' ua' }, update_interval=0.2, foreground=colors[2], background=colors[0], padding=2 ),
                widget.TextBox(padding=3, background=colors[0]),
                widget.TextBox( text = "", background = colors[0], foreground = colors[2], padding = 0 ),
                widget.Clock( format='%H:%M:%S', foreground=colors[2], background=colors[0], padding=2 )
            ],
            22,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]



dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"

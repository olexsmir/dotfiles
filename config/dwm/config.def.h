static const unsigned int borderpx  = 1;  // border pixel of windows
static const unsigned int snap      = 32; // snap pixel
static const int showbar            = 1;  // 0 means no bar
static const int topbar             = 1;  // 0 means bottom bar
static const char *fonts[]          = { "monospace:size=10" };
static const char col_gray1[]       = "#262A2B";
static const char col_gray2[]       = "#262A2B";
static const char col_gray3[]       = "#CED4DA";
static const char col_gray4[]       = "#FFFFFF";
static const char col_cyan[]        = "#008DCD";
static const char *colors[][3]      = {
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

// Workspaces names
//static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const char *tags[] = { "", "", "", "", "", "", "", "", "" };

// Rules
static const Rule rules[] = {
    { "Gimp",    NULL, NULL, 0,     1, -1 },
	{ "Firefox", NULL, NULL, 1 << 8,0, -1 },
};

// Autostart
static const char *const autostart[] = {
	"./.config/dwm/autostart.sh", NULL,
	"./.script/dwmbar.sh", NULL,
	NULL
};

// Layout
static const float mfact     = 0.55; // factor of master area size [0.05..0.95]
static const int nmaster     = 1;    // number of clients in master area
static const int resizehints = 1;    // 1 means respect size hints in tiled resizals
static const Layout layouts[] = {
	{ "[]=",      tile },
	{ "><>",      NULL },
	{ "[M]",      monocle },
};

// Key definitions
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

// Commands
static char dmenumon[2] = "0";
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *launchercmd[] = { "rofi", "-location", "2", "-show", "drun", NULL };
static const char *passmenucmd[] = { "passmenu", "-h", "24", "-p", "Passwords", NULL };
static const char *dmenuconfig[] = { "./.script/dmenu/dmenu-config-edit.sh", NULL };
static const char *dmenupower[] = { "./.script/dmenu/dmenu-power.sh", NULL };
static const char *browsercmd[] = { "firefox", NULL };
static const char *filemanager[] = { "thunar", NULL };
static const char *codeeditor[] = { "alacritty", "-e", "nvim", NULL };
static const char *termcmd[] = { "alacritty", NULL };

// Keyboards binds
static Key keys[] = {
    // User keys
    { MODKEY,           XK_b,      togglebar,  {0} },             // Toggle status bar
    { MODKEY,           XK_q,      killclient, {0} },             // Kill window
    { MODKEY,           XK_Return, spawn, {.v = termcmd }     },  // Terminal
    { MODKEY|ShiftMask, XK_w,      spawn, {.v = browsercmd }  },  // Browser
    { MODKEY|ShiftMask, XK_f,      spawn, {.v = filemanager } },  // File manager
    { MODKEY|ShiftMask, XK_e,      spawn, {.v = codeeditor  } },  // File manager

    // Menus
    { MODKEY|ShiftMask,   XK_Return, spawn, {.v = launchercmd } }, // Program menu
    { MODKEY|ControlMask, XK_i,      spawn, {.v = passmenucmd } }, // Password menu
    { MODKEY|ControlMask, XK_u,      spawn, {.v = dmenuconfig } }, // Configuration menu
    { MODKEY,             XK_Escape, spawn, {.v = dmenupower  } }, // Power menu
    
    // Volume
    { MODKEY,           XK_minus, spawn, SHCMD("amixer sset 'Master' 2%-")    },
    { MODKEY,           XK_equal, spawn, SHCMD("amixer sset 'Master' 2%+")    },
    { MODKEY|ShiftMask, XK_minus, spawn, SHCMD("amixer sset 'Master' toggle") },

    // DWM keys
    { MODKEY,           XK_Tab, setlayout,      {0} }, // Change layout
    { MODKEY|ShiftMask, XK_Tab, togglefloating, {0} }, // Set floating layout

    { MODKEY, XK_j,      focusstack, {.i = +1 } },
    { MODKEY, XK_k,      focusstack, {.i = -1 } },
    { MODKEY, XK_i,      incnmaster, {.i = +1 } },
    { MODKEY, XK_d,      incnmaster, {.i = -1 } },
    { MODKEY, XK_h,      setmfact,   {.f = -0.05} },
    { MODKEY, XK_l,      setmfact,   {.f = +0.05} },
    { MODKEY, XK_Return, zoom,       {0} },

    // Workspaces
    TAGKEYS(            XK_1,       0)
    TAGKEYS(            XK_2,       1)
    TAGKEYS(            XK_3,       2)
    TAGKEYS(            XK_4,       3)
    TAGKEYS(            XK_5,       4)
    TAGKEYS(            XK_6,       5)
    TAGKEYS(            XK_7,       6)
    TAGKEYS(            XK_8,       7)
    TAGKEYS(            XK_9,       8)
    { MODKEY,           XK_0, view, {.ui = ~0 } },
    { MODKEY|ShiftMask, XK_0, tag,  {.ui = ~0 } },
};

// Mouse binds
static Button buttons[] = {
    // click                event mask      button          function        argument
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

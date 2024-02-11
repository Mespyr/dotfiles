/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 0;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const int horizpadbar        = 4;        /* horizontal padding for statusbar */
static const int vertpadbar         = 16;        /* vertical padding for statusbar */
static const int statusvertpadbar   = 12;        /* padding for status specifically */
static const int seltagindheight    = 3;
static const int seltagindpad       = 4;
static const char *fonts[]          = { "Iosevka NF:size=10" };
static const char dmenufont[]       = "Iosevka NF:size=10";
static const char col1[]       = "#1d1f21";
static const char col2[]       = "#969896";
static const char col3[]       = "#c5c8c6";
static const char col4[]       = "#c5c8c6";
static const char col5[]       = "#81a2be";
static const char col6[]       = "#5b5b5b";
static const char *colors[][3]      = {
	/*               fg    bg    border   */
	[SchemeNorm] = { col3, col1, col1},
	[SchemeSel]  = { col5, col1,  col6},
};

static const char *const autostart[] = {
	//"eval", statusbarcmd, NULL,
	"xrandr", "--output", "DisplayPort-0", "--off", "--output", "DisplayPort-1", "--off", "--output", "DisplayPort-2", "--primary", "--mode", "2560x1440", "--pos", "0x240", "--rotate", "normal", "--output", "HDMI-A-0", "--mode", "1920x1080", "--pos", "2560x0", "--rotate", "right", NULL,
	"feh", "--bg-fill", "/home/mespyr/.config/WALLPAPER.jpg", NULL,
	"picom", NULL,
	"setxkbmap", "-option", "ctrl:nocaps", NULL,
	"xset", "-b", NULL,
	"/home/mespyr/dwm_bar.sh", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "cmd", "www", "steam", "chat", "obs" };
static const char *alttags[] = { "*cmd", "*www", "*steam", "*chat", "*obs" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "steam",     NULL,       NULL,       1 << 2,          1,           0 },
	{ "discord",   NULL,       NULL,       1 << 3,          0,           1 },
	{ "obs",       NULL,       NULL,       1 << 4,          0,           1 },
};

/* layout(s) */
static const float mfact     = 0.75; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
	{ "",     NULL },    /* no layout function means floating behavior */
	// { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", NULL };

static const char *termcmd[]  = { "alacritty", NULL };
static const char *editorcmd[]  = { "emacs", NULL };


static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY, XK_d,      spawn, {.v = dmenucmd } },
	{ MODKEY, XK_Return, spawn, {.v = termcmd } },
	{ MODKEY, XK_w,      spawn, {.v = editorcmd } },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	//{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	//{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	//{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_c,      killclient,     {0} },
	//{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	//{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	//{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	//{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	//{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	//{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	//{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
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


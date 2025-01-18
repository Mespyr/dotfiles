/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]        = "Iosevka Term NF:size=12";
static const char* normbgcolor  = "#232726";
static const char* normfgcolor  = "#6f6e69";
static const char* selbgcolor   = "#100f0f";
static const char* selfgcolor   = "#ad8301";

static const char* urgbgcolor   = "#111111";
static const char* urgfgcolor   = "#cc0000";

static const char before[]      = "";
static const char after[]       = "";
static const char titletrim[]   = "...";
static const int  tabwidth      = 100;
static const Bool foreground    = True;
static       Bool urgentswitch  = False;
static const int  separator     = 4;
static const int barheight	= 30;
/*
 * Where to place a new tab when it is opened. When npisrelative is True,
 * then the current position is changed + newposition. If npisrelative
 * is False, then newposition is an absolute position.
 */
static int  newposition   = 0;
static Bool npisrelative  = False;

#define SETPROP(p) { \
        .v = (char *[]){ "/bin/sh", "-c", \
                "prop=\"`xwininfo -children -id $1 | grep '^     0x' |" \
                "sed -e's@^ *\\(0x[0-9a-f]*\\) \"\\([^\"]*\\)\".*@\\1 \\2@' |" \
                "xargs -0 printf %b | dmenu -l 10 -w $1`\" &&" \
                "xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
                p, winid, NULL \
        } \
}

#define MODKEY Mod1Mask
static const Key keys[] = {
	/* modifier             key        function     argument */
	{ MODKEY,     XK_Return, focusonce,   { 0 } },
	{ MODKEY,     XK_Return, spawn,       { 0 } },

	{ MODKEY,     XK_Tab,      rotate,     { .i = +1 } },

	//{ MODKEY,               XK_grave,  spawn,       SETPROP("_TABBED_SELECT_TAB") },
	{ MODKEY,               XK_1,      move,        { .i = 0 } },
	{ MODKEY,               XK_2,      move,        { .i = 1 } },
	{ MODKEY,               XK_3,      move,        { .i = 2 } },
	{ MODKEY,               XK_4,      move,        { .i = 3 } },
	{ MODKEY,               XK_5,      move,        { .i = 4 } },
	{ MODKEY,               XK_6,      move,        { .i = 5 } },
	{ MODKEY,               XK_7,      move,        { .i = 6 } },
	{ MODKEY,               XK_8,      move,        { .i = 7 } },
	{ MODKEY,               XK_9,      move,        { .i = 8 } },
	{ MODKEY,               XK_0,      move,        { .i = 9 } },

	{ MODKEY,               XK_c,      killclient,  { 0 } },
	//{ 0,                    XK_F11,    fullscreen,  { 0 } },
};

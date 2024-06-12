/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static const int user_bh = 10;

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Iosevka Term NF:size=10"
};
static const char *prompt      = "  ";      /* -p  option; prompt to the left of input field */

static const char bg[]       = "#100f0f";
static const char fg[]       = "#ffffff";
static const char accent[]   = "#af3029";

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { fg, bg },
	[SchemeSel] = { accent, bg },
	[SchemeOut] = { "#000000", "#00ffff" },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

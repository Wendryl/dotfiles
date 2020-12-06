//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/									/*Update Interval*/		/*Update Signal*/
	{" Vol:", 	"dwm-volume",												60,		10},
	{"Mem:", 	"free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	60,		0},
	{"Bat:",	"battery",													60,		0},
	{"",		"clock",													60,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 3;

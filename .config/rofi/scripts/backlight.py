import subprocess
import os

current_brightness = int(subprocess.check_output(['xbacklight', '-get']))

OPTIONS = [
    "   Up",
    "   Set",
    "   Down"
]

OPTSTRING = ""
for i in OPTIONS:
    OPTSTRING += i + "\n"
OPTSTRING = OPTSTRING[:-1]

rofi_stdout = subprocess.run(["rofi", "-dmenu", 
        "-config", "~/.config/rofi/styles/backlight.rasi",
        "-mesg", f"Current Brightness: {current_brightness}%"
    ], 
    stdout = subprocess.PIPE,
    input = OPTSTRING.encode("UTF-8"))

opt = rofi_stdout.stdout.decode().strip("\n")

if opt == OPTIONS[0]:
    if current_brightness > 90: os.system("xbacklight -set 100")
    else: os.system("xbacklight -inc 10")

elif opt == OPTIONS[2]:
    if current_brightness < 10: os.system("xbacklight -set 0") 
    else: os.system("xbacklight -dec 10")

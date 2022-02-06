#!/usr/bin/python3
import subprocess

current_brightness = int(subprocess.check_output(['xbacklight', '-get']))

OPTIONS = [
    "   up",
    "   current: " + str(current_brightness),
    "   down"
]

# create string which is passed into rofi
OPTSTRING = ""
for i in OPTIONS:
    OPTSTRING += i + "\n"
OPTSTRING = OPTSTRING[:-1]

rofi_stdout = subprocess.run([
        "rofi", "-dmenu", 
        "-config", "~/.config/rofi/styles/backlight.rasi",
        "-selected-row", "1"
    ],
    stdout = subprocess.PIPE,
    input = OPTSTRING.encode("UTF-8"))

opt = rofi_stdout.stdout.decode().strip("\n")

if opt == OPTIONS[0]:
    if current_brightness > 90: subprocess.run(["xbacklight", "-set", "100"])
    else: subprocess.run(["xbacklight", "-inc", "10"])

elif opt == OPTIONS[1]:
    rofi_stdout = subprocess.run(["rofi", "-dmenu", 
        "-config", "~/.config/rofi/styles/prompt.rasi",
        "-mesg", " set brightness"], 
            stdout = subprocess.PIPE)

    num = rofi_stdout.stdout.decode().strip("\n")

    subprocess.run(["xbacklight", "-set", num])


elif opt == OPTIONS[2]:
    if current_brightness < 10: subprocess.run(["xbacklight", "-set", "0"])
    else: subprocess.run(["xbacklight", "-dec", "10"])

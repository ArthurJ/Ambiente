# Enter script code
import subprocess

subprocess.Popen(['pactl set-sink-volume 0 +5%'], shell=True)


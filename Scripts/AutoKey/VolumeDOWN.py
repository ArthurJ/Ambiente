# Enter script code
import subprocess

subprocess.Popen(['pactl set-sink-volume 0 -5%'], shell=True)
#volume = subprocess.getoutput('amixer get Master').split('\n')[-1]
#subprocess.Popen(['notify-send {0}'.format(volume)], shell=True)
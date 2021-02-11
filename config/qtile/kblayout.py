"""
For working widget install `xkblayout`
$ yay -S xkblayout
"""
from libqtile.widget import base
from os import popen


KBCMD = """
case "$(xkblayout)" in
  "Eng") echo "us" ;;
  "Rus") echo "ru" ;;
  "Ukr") echo "ua" ;;
esac
"""


class KBLayout(base.InLoopPollText):
    """Widget for displaying the current keyboard layout"""
    orientations = base.ORIENTATION_HORIZONTAL

    def __init__(self, **config):
        base.InLoopPollText.__init__(self, **config)

    def poll(self):
        kb = popen(KBCMD).read().rstrip('\n') \
                         .encode('utf-8').decode('utf-8')
        return kb

from libqtile.widget import base
import os


class KBLayout(base.InLoopPollText):
    """Widget for displaying the current keyboard layout
    It requires setxkbmap and xkblayout"""
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("background", "#000000", "Backbround color"),
        ("foreground", "#ffffff", "Foreground color"),
    ]

    def __init__(self, **config):
        base.InLoopPollText.__init__(self, **config)

    def get_keyboard(self):
        kb = os.popen("xkblayout").read().rstrip("\n")
        return kb

    def poll(self):
        kb = os.popen(".config/qtile/kblay.sh").read().rstrip('\n').encode('utf-8').decode('utf-8')
        return kb

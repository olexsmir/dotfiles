#!/bin/sh

case "$1" in
    "help"|"--help")
        echo "bash      Change default shell to bash"
        echo "zsh       Change default shell to zsh"
        echo "fish      Change default shell to fish"
    ;;
    bash)
        chsh -s $(whitch bash)
    ;;
    zsh)
        chsh -s $(whitch zsh)
    ;;
    fish)
        chsh -s $(whitch fish)
    ;;
esac

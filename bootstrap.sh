# install rcm on arch by paru
if hash paru2>/dev/null; then
    paru -S rcm
fi

# install rcm on ubuntu
if hash apt2>/dev/null; then
    sudo apt install -y rcm
fi

rcup rcrc && rcup

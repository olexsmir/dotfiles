#/bin/sh
ffmpeg -i $1 -b:a 192K -vn ~/$directory/$2.mp3

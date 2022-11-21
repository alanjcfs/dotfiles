/opt/homebrew/bin/magick -background black -fill OliveDrab3 -font 'Source-Code-Pro' -pointsize 144 \
	-size 1280x800 -gravity center label:`date "+%Y-%m-%d\n%H:%M"` $1

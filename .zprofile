# MPD daemon start (if no other user instance exists)
#[ ! -s ~/.config/mpd/pid ] && mpd

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

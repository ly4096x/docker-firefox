export DISPLAY=:99.0
Xvfb $DISPLAY -screen 0 1920x1080x24 -dpi 96 2>&1 > /dev/null &
sleep 5
autocutsel -fork &
x11vnc -display $DISPLAY -shared -forever 2>&1 > /dev/null &
startfluxbox

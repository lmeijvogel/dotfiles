cd $HOME/.lib

ls custom-commands | rofi -dmenu | xargs -I % sh -c custom-commands/%

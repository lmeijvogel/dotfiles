cd $HOME/.lib/custom-commands

COMMAND=$(ruby lib/list_executable_files.rb | rofi -dmenu)

sh -c ./$COMMAND

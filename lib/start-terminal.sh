if command -v tmux &>/dev/null; then
  gnome-terminal -- tmux
else
  gnome-terminal
fi

#!/bin/bash

# This creates the dotfiles according to my preferences.
# If only the vim plugins and config interest you, just
# link .vimrc and .vim to vimrc and vim in the parent directory.

# Create links for everything, except the scripts dir
for file in `ls -A ../ | grep -vP "^scripts|.git|.gitignore|README$"`; do
  CURRENT_TARGET_PATH=$(readlink -f "../$file")

  # Remove any file that was previously there
  rm -i "$HOME/.$file"

  # Create a softlink in the homedir to the version controlled file/dir
  ln -s "$CURRENT_TARGET_PATH" "$HOME/.$file"
done

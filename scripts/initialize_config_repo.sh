#!/bin/bash

# This creates the dotfiles according to my preferences.
# If only the vim plugins and config interest you, just
# link .vimrc and .vim to vimrc and vim in the parent directory.

# Create links for everything, except the scripts dir
for file in `ls -A ../ | grep -vP "^(bin|scripts|.git|.gitignore|README)$"`; do
  CURRENT_TARGET_PATH=$(readlink -f "../$file")

  # Remove any file that was previously there
  rm -i "$HOME/.$file"

  # Create a softlink in the homedir to the version controlled file/dir
  ln -s "$CURRENT_TARGET_PATH" "$HOME/.$file"
done

mkdir -p $HOME/bin

for file in `ls -A ../bin/`; do
  CURRENT_TARGET_PATH=$(readlink -f "../bin/$file")

  # Remove any file that was previously there
  rm -i "$HOME/bin/$file"

  # Create a softlink in the homedir to the version controlled file/dir
  ln -s "$CURRENT_TARGET_PATH" "$HOME/bin/$file"
done

mkdir -p $HOME/.vim/bundle

pushd $HOME/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim.git

popd

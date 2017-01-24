#!/usr/bin/env ruby

require 'fileutils'
require 'rake' # TODO?

def delete_symlink(file)
  if File.symlink? file
    FileUtils.rm(file)
  else
    puts "File not a symlink: #{file}"
  end
end

def update_symlinks(origs, symlinks)
  symlinks.each do |symlink|
    delete_symlink(symlink)
  end

  origs.zip(symlinks).each do |source, symlink|
    puts "#{source} => #{symlink}"
    FileUtils.ln_s(File.expand_path(source), symlink)
  end
end
# This creates the dotfiles according to my preferences.
# If only the vim plugins and config interest you, just
# link .vimrc and .vim to vimrc and vim in the parent directory.

# Create links for everything, except the scripts dir
CONFIG_FILES = Rake::FileList["*"]
CONFIG_FILES.exclude("bin", "scripts", ".git", ".gitignore", "README", "INSTALL.md")

destination_symlinks = CONFIG_FILES.pathmap("#{ENV['HOME']}/.%p")

update_symlinks(CONFIG_FILES, destination_symlinks)

BIN_FILES = Rake::FileList["bin/*"]
bin_symlinks = BIN_FILES.pathmap("#{ENV['HOME']}/%p")

update_symlinks(BIN_FILES, bin_symlinks)

bundle_path = "#{ENV['HOME']}/.vim/bundle"

unless File.exists?(bundle_path)
  FileUtils.mkdir_p bundle_path

  `cd #{bundle_path} ; git clone https://github.com/gmarik/Vundle.vim.git`
  `cd #{bundle_path} ; git clone https://github.com/olivierverdier/zsh-git-prompt $HOME/.zsh-git-prompt`
  `cd #{bundle_path} ; git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh`
end

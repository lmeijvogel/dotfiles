#!/usr/bin/env ruby

require 'fileutils'

desc "perform :update_all_symlinks"
task :default => :update_all_symlinks

desc "Updates all symlinks"
task :update_all_symlinks do
  # This creates the dotfiles according to my preferences.
  # If only the vim plugins and config interest you, just
  # link .vimrc and .vim to vimrc and vim in the parent directory.

  DOTFILE_PATTERN = "#{ENV['HOME']}/.%p"
  CONFIG_FILES = Rake::FileList["*"]
  CONFIG_FILES.exclude("bin", "config", "scripts", "Gemfile", "Gemfile.lock", ".git", ".gitignore", "Rakefile", "README", "INSTALL.md")

  update_symlinks(CONFIG_FILES, DOTFILE_PATTERN)

  NESTED_CONFIG_DIRS = Rake::FileList[*%w[bin config/nvim config/terminator]]
  NESTED_CONFIG_DIRS.each do |nested_config_dir|
    mkdir_p nested_config_dir.pathmap(DOTFILE_PATTERN)
    update_symlinks(Rake::FileList["#{nested_config_dir}/*"], DOTFILE_PATTERN)
  end

  initialize_vim_bundle
end

def delete_symlink(file)
  if File.symlink? file
    FileUtils.rm(file)
  else
    puts "File not a symlink: #{file}"
  end
end

def update_symlinks(origs, pattern)
  symlinks = origs.pathmap(pattern)

  symlinks.each do |symlink|
    delete_symlink(symlink)
  end

  origs.map {|file| File.expand_path(file) }.zip(symlinks).each do |source, symlink|
    puts "#{source} => #{symlink}"
    FileUtils.ln_s(File.expand_path(source), symlink)
  end
end

def initialize_vim_bundle
  bundle_path = File.join(ENV['HOME'], ".vim", "bundle")

  unless File.exists?(bundle_path)
    FileUtils.mkdir_p bundle_path

    `cd #{bundle_path} ; git clone https://github.com/gmarik/Vundle.vim.git`
    `cd #{bundle_path} ; git clone https://github.com/olivierverdier/zsh-git-prompt $HOME/.zsh-git-prompt`
    `cd #{bundle_path} ; git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh`
  end
end

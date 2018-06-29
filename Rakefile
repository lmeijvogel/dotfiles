#!/usr/bin/env ruby

require "fileutils"
require "shellwords"

desc "perform :update_all_symlinks"
task :default => [:update_all_symlinks, :i3]

desc "Generate i3 configuration files"
task :i3 do
  config_template = File.read(File.join(__dir__, "i3/config"))

  additional_config = if ENV.key?("I3_ADDITIONAL_CONFIG_FILE")
                        filename = File.basename(ENV["I3_ADDITIONAL_CONFIG_FILE"])

                        sanitized_filename = File.join(__dir__, "i3/#{filename}")
                        base_additional_config = File.read(sanitized_filename)

                        puts "Found additional configuration in #{sanitized_filename}"
                        "#### Machine custom config starts here####\n\n" + base_additional_config
                      else
                        puts "No additional configuration present: Set I3_ADDITIONAL_CONFIG_FILE to a path inside dotfiles/i3/"

                        "#### No custom configuration for this machine ####"
                      end

  resulting_config = config_template.gsub(/^%include_private_config%$/, additional_config)
  output_config_path = "#{ENV['HOME']}/.config/i3/config"

  mkdir_p(File.dirname(output_config_path))

  rm_f(output_config_path)

  open(output_config_path, "w") do |file|
    file.write(resulting_config)
  end
end

desc "Updates all symlinks"
task :update_all_symlinks do
  # This creates the dotfiles according to my preferences.
  # If only the vim plugins and config interest you, just
  # link .vimrc and .vim to vimrc and vim in the parent directory.

  DOTFILE_PATTERN = "#{ENV['HOME']}/.%p"
  CONFIG_FILES = Rake::FileList["*"]
  CONFIG_FILES.exclude("bin", "config", "i3", "scripts", "Gemfile", "Gemfile.lock", ".git", ".gitignore", "Rakefile", "README", "INSTALL.md")

  update_symlinks(CONFIG_FILES, DOTFILE_PATTERN)

  BIN_DIR_PATTERN = "#{ENV['HOME']}/%p"
  BIN_DIR = Rake::FileList["bin"]
  mkdir_p BIN_DIR.pathmap(BIN_DIR_PATTERN)

  update_symlinks(Rake::FileList["#{BIN_DIR}/*"], BIN_DIR_PATTERN)

  NESTED_CONFIG_DIRS = Rake::FileList[*%w[config/i3 config/i3status config/nvim config/oni config/terminator]]
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

  origs.map { |file| File.expand_path(file) }.zip(symlinks).each do |source, symlink|
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

#!/usr/bin/env ruby

require "fileutils"
require "shellwords"

desc "perform :update_all_symlinks"
task :default => [:update_all_symlinks, :i3, :polybar]

desc "Generate i3 configuration files"
task :i3 do
  config_template = File.read(File.join(__dir__, "i3/config"))

  additional_config = if ENV.key?("WM_MACHINE_NAME")
                        filename = "config-#{File.basename(ENV["WM_MACHINE_NAME"])}"

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

desc "Create polybar machine-specific config file"
task :polybar do
  filename = if ENV.key?("WM_MACHINE_NAME")
               "vars-#{File.basename(ENV["WM_MACHINE_NAME"])}"
             else
               puts "ERROR: No machine-specific configuration set: Choosing 'home' as default"
               "vars-home"
             end

  sanitized_filename = File.join(__dir__, "config/polybar/#{filename}")

  puts "Found machine-specific polybar configuration in #{sanitized_filename}"

  cp sanitized_filename, "#{ENV['HOME']}/.config/polybar/machine-specific"
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

  NESTED_CONFIG_DIRS = Rake::FileList[*%w[config/fish config/i3 config/polybar config/nvim config/oni]]
  NESTED_CONFIG_DIRS.each do |nested_config_dir|
    mkdir_p nested_config_dir.pathmap(DOTFILE_PATTERN)
    update_symlinks(Rake::FileList["#{nested_config_dir}/*"], DOTFILE_PATTERN)
  end

  initialize_oh_my_zsh
  initialize_zsh_plugins
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

  original_files = origs
  target_files = original_files.pathmap(pattern)

  original_files.map { |file| File.expand_path(file) }.zip(target_files).each do |source, symlink|
    puts "#{source} => #{symlink}"
    FileUtils.ln_s(File.expand_path(source), symlink)
  end
end

def initialize_oh_my_zsh
  `git clone https://github.com/olivierverdier/zsh-git-prompt #{ENV["HOME"]}/.zsh-git-prompt`
  `git clone https://github.com/robbyrussell/oh-my-zsh.git #{ENV["HOME"]}.oh-my-zsh`
end

def initialize_zsh_plugins
  zsh_custom_path = File.join(ENV.fetch("HOME"), ".oh-my-zsh/custom/plugins")

  mkdir_p zsh_custom_path

  %w[zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search].each do |plugin|
    target_path = File.join(zsh_custom_path, plugin)

    next if File.directory?(target_path)

    system("git", "clone",
           "https://github.com/zsh-users/#{plugin}",
           target_path)
  end
end

def initialize_vim_bundle
  `curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
end

#!/usr/bin/env ruby

require "fileutils"
require "shellwords"
require "socket" # For getting the hostname

desc "perform :update_all_symlinks"
task :default => [:update_all_symlinks, :i3, :polybar]

hostname = Socket.gethostname

$dry_run = ENV.key?("DRY_RUN")

desc "Generate i3 configuration files"
task :i3 do
  config_template = File.read(File.join(__dir__, "i3/config"))

  filename = "config-#{hostname}"

  sanitized_filename = File.join(__dir__, "i3/#{filename}")

  additional_config = if File.exist?(sanitized_filename)
    base_additional_config = File.read(sanitized_filename)

    puts "Found additional configuration in #{sanitized_filename}"

    "#### Machine custom config starts here ####\n\n" + base_additional_config + "\n\n#### Machine custom config ends here ####\n"
  else
    puts "No additional configuration found for this host: Create a config file dotfiles/i3/#{sanitized_filename} with options for this machine."

    "#### No custom configuration for this machine ####"
  end

  resulting_config = config_template.gsub(/^%include_private_config%$/, additional_config)
  output_config_path = "#{ENV['HOME']}/.config/i3/config"

  if $dry_run
    puts "Dry-run: Create dir #{File.dirname(output_config_path)}"
  else
    mkdir_p(File.dirname(output_config_path))
  end

  if $dry_run
    puts "Dry-run: Writing i3 config to #{output_config_path}"
  else
    rm_f(output_config_path)

    open(output_config_path, "w") do |file|
      file.write(resulting_config)
    end
  end
end

desc "Create polybar machine-specific config file"
task :polybar do
  filename = "vars-#{hostname}"

  polybar_config_dir = File.join(__dir__, "config/polybar")

  sanitized_filename = File.join(polybar_config_dir, filename)

  if File.exist?(sanitized_filename)
    puts "Found machine-specific polybar configuration in #{sanitized_filename}"

    cp sanitized_filename, "#{ENV['HOME']}/.config/polybar/machine-specific"
  else
    puts "ERROR: No machine-specific configuration set! Create a configuration file in #{polybar_config_dir} with the name #{filename} to configure polybar (or to remove this warning :D)"
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

  NESTED_CONFIG_DIRS = Rake::FileList[*%w[config/dunst config/fish config/i3 config/polybar config/rofi config/nvim]]
  NESTED_CONFIG_DIRS.each do |nested_config_dir|
    mkdir_p nested_config_dir.pathmap(DOTFILE_PATTERN)
    update_symlinks(Rake::FileList["#{nested_config_dir}/*"], DOTFILE_PATTERN)
  end

  FILES_IN_CONFIG = Rake::FileList[*%w[config/*]]
  FILES_IN_CONFIG.exclude { |file| !File.file?(file) } # Only link files

  update_symlinks(FILES_IN_CONFIG, DOTFILE_PATTERN)

  symlink_i3_compton
  initialize_oh_my_zsh
  initialize_zsh_plugins
  initialize_vim_plug
end

def symlink_i3_compton
  symlink_path = File.join(ENV['HOME'], ".config/i3/compton.conf")

  delete_symlink symlink_path

  create_symlink(File.expand_path("i3/compton.conf"), symlink_path)
end

def create_symlink(source_path, symlink_path)
  if $dry_run
    puts "Dry-run: Symlink #{source_path} => #{symlink_path}"
  else
    FileUtils.ln_s(source_path, symlink_path)
  end
end

def delete_symlink(file)
  if $dry_run
    puts "Dry-run: Deleting symlink #{file}"
  else
    return if !File.symlink? file

    if File.symlink? file
      FileUtils.rm(file)
    else
      puts "File not a symlink: #{file}"
    end
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
    create_symlink(File.expand_path(source), symlink)
  end
end

def initialize_oh_my_zsh
  {
    "https://github.com/olivierverdier/zsh-git-prompt" => "#{ENV["HOME"]}/.zsh-git-prompt",
    "https://github.com/robbyrussell/oh-my-zsh.git" => "#{ENV["HOME"]}/.oh-my-zsh"
  }.each do |github_url, destination_dir|
    unless File.directory?(destination_dir)
      `git clone #{github_url} #{destination_dir}`
    end
  end
end

def initialize_zsh_plugins
  zsh_custom_path = File.join(ENV.fetch("HOME"), ".oh-my-zsh/custom/plugins")
  zsh_plugins = %w[zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search]
  if $dry_run
    puts "Dry-run: Initializing zsh plugins:"
    zsh_plugins.each do |plugin|
      puts "Dry-run: - #{plugin}"
    end
  else
    mkdir_p zsh_custom_path

    zsh_plugins.each do |plugin|
      target_path = File.join(zsh_custom_path, plugin)

      next if File.directory?(target_path)

      system("git", "clone",
             "https://github.com/zsh-users/#{plugin}",
             target_path)
    end
  end
end

def initialize_vim_plug
  plug_script_path = File.join(ENV["HOME"], ".config/nvim/autoload/plug.vim")

  if $dry_run
    puts "Dry-run: Cloning vim-plug at #{plug_script_path}"
  else
    unless File.exist?(plug_script_path)
      `curl -fLo #{plug_script_path} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
    end
  end
end

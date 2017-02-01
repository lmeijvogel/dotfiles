#!/usr/bin/env ruby
$LOAD_PATH << File.dirname(__FILE__)

require '_create_shell_variables'

output = `git --no-pager log --color --decorate --oneline`.each_line.map(&:strip)

shell_variables = CreateShellVariables.new(start_at: 0)
shell_variables.perform(output, translation: ->(log_entry) {
  log_entry
    .strip
    .split(' ')[0]
    .gsub(/\e\[([;\d]+)?m/, '')
})

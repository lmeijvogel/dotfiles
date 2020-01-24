" Replace imports of typescript "absolute" paths (from the project root)
" with paths relative to the current file, as is required by our coding
" standards.
function! AbsoluteToRelative()
  ruby <<EOF
    def rewrite_file_path(input, current_path)
      input_parts = input.split("/")

      relative_current_path_parts = determine_relative_current_path(input, current_path).split("/")

      first_different_index = input_parts.find_index.with_index do |input_part, i|
        current_path_part = relative_current_path_parts[i]

        current_path_part != input_part
      end

      new_input_path_from_shared_base = input_parts[first_different_index..-1]
      current_path_from_shared_base = relative_current_path_parts[first_different_index..-1]

      # -1 because of the current filename
      steps_to_shared_base = current_path_from_shared_base.length - 1

      path_to_shared_base = Array.new(steps_to_shared_base, "..")

      result = (path_to_shared_base + new_input_path_from_shared_base).join("/")

      is_in_current_dir = !result.include?("/")

      if is_in_current_dir
        "./#{result}"
      else
        result
      end
    end

    def determine_relative_current_path(input, current_path)
      input_parts = input.split("/")

      input_start = input_parts[0]

      current_path_parts = current_path.split("/")

      start_index = current_path_parts.find_index(input_start)

      current_path_parts[start_index..-1].join("/")
    end

    input_line = VIM::Buffer.current.line
    current_path = VIM::Buffer.current.get_name

    # Splits into three parts:
    # * Everything before (and including) the first quote
    # * Everything inside the quotes
    # * Everything after (and including) the closing quote
    input_path_matches = input_line.match(/(.*")([^"]+)(".*)/)

    if input_path_matches
        parts = input_path_matches.captures

        parts[1] = rewrite_file_path(parts[1], current_path)

        VIM::Buffer.current.line = parts.join("")
    else
        puts "Line does not match an import line"
    end
EOF

endfunction

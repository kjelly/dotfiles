# Nushell Config File
#
# version = "0.95.0"

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
let dark_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: { bg: red fg: white }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

let light_theme = {
    # color for nushell primitives
    separator: dark_gray
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
    bool: dark_cyan
    int: dark_gray
    filesize: cyan_bold
    duration: dark_gray
    date: purple
    range: dark_gray
    float: dark_gray
    string: dark_gray
    nothing: dark_gray
    binary: dark_gray
    cell-path: dark_gray
    row_index: green_bold
    record: dark_gray
    list: dark_gray
    block: dark_gray
    hints: dark_gray
    search_result: { fg: white bg: red }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_purple_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell ...$spans | from json
# }

# The default config record. This is where much of your global configuration is setup.
$env.config = {
    show_banner: true # true or false to enable or disable the welcome banner at startup

    ls: {
        use_ls_colors: true # use the LS_COLORS environment variable to colorize output
        clickable_links: true # enable or disable clickable links. Your terminal has to support links.
    }

    rm: {
        always_trash: false # always act as if -t was given. Can be overridden with -p
    }

    table: {
        mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
        show_empty: true # show 'empty list' and 'empty record' placeholders for command output
        padding: { left: 1, right: 1 } # a left right padding of each column in a table
        trim: {
            methodology: wrapping # wrapping or truncating
            wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
            truncating_suffix: "..." # A suffix used by the 'truncating' methodology
        }
        header_on_separator: false # show header text on separator/border line
        # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
    }

    error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

    # datetime_format determines what a datetime rendered in the shell would look like.
    # Behavior without this configuration point will be to "humanize" the datetime display,
    # showing something like "a day ago."
    datetime_format: {
        # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
        # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
    }

    explore: {
        status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
        command_bar_text: { fg: "#C4C9C6" },
        highlight: { fg: "black", bg: "yellow" },
        status: {
            error: { fg: "white", bg: "red" },
            warn: {}
            info: {}
        },
        selected_cell: { bg: light_blue },
    }

    history: {
        max_size: 100_000 # Session has to be reloaded for this to take effect
        sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
        file_format: "plaintext" # "sqlite" or "plaintext"
        isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
    }

    completions: {
        case_sensitive: false # set to true to enable case-sensitive completions
        quick: true    # set this to false to prevent auto-selecting completions when only one remains
        partial: true    # set this to false to prevent partial filling of the prompt
        algorithm: "prefix"    # prefix or fuzzy
        external: {
            enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: null # check 'carapace_completer' above as an example
        }
        use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
    }

    filesize: {
        metric: false # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
        format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
    }

    cursor_shape: {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
        vi_insert: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
        vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
    }

    color_config: $dark_theme # if you want a more interesting theme, you can replace the empty record with `$dark_theme`, `$light_theme` or another custom record
    use_grid_icons: true
    footer_mode: "25" # always, never, number_of_rows, auto
    float_precision: 2 # the precision for displaying floats in tables
    buffer_editor: "" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
    use_ansi_coloring: true
    bracketed_paste: true # enable bracketed paste, currently useless on windows
    edit_mode: emacs # emacs, vi
    shell_integration: {
        # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
        osc2: true
        # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
        osc7: true
        # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it. show_clickable_links is deprecated in favor of osc8
        osc8: true
        # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
        osc9_9: false
        # osc133 is several escapes invented by Final Term which include the supported ones below.
        # 133;A - Mark prompt start
        # 133;B - Mark prompt end
        # 133;C - Mark pre-execution
        # 133;D;exit - Mark execution finished with exit code
        # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
        osc133: true
        # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
        # 633;A - Mark prompt start
        # 633;B - Mark prompt end
        # 633;C - Mark pre-execution
        # 633;D;exit - Mark execution finished with exit code
        # 633;E - NOT IMPLEMENTED - Explicitly set the command line with an optional nonce
        # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
        # and also helps with the run recent menu in vscode
        osc633: true
        # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
        reset_application_mode: true
    }
    render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
    use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
    highlight_resolved_externals: false # true enables highlighting of external commands in the repl resolved by which.
    recursion_limit: 50 # the maximum number of times nushell allows recursion before stopping it

    plugins: {} # Per-plugin configuration. See https://www.nushell.sh/contributor-book/plugins.html#configuration.

    plugin_gc: {
        # Configuration for plugin garbage collection
        default: {
            enabled: true # true to enable stopping of inactive plugins
            stop_after: 10sec # how long to wait after a plugin is inactive to stop it
        }
        plugins: {
            # alternate configuration for specific plugins, by name, for example:
            #
            # gstat: {
            #     enabled: false
            # }
        }
    }

    hooks: {
        pre_prompt: [{ null }] # run before the prompt is shown
        pre_execution: [{ null }] # run before the repl input is run
        env_change: {
            PWD: [{|before, after| null }] # run if the PWD environment is different since the last repl input
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
        command_not_found: { null } # return an error message when a command is not found
    }

    menus: [
        # Configuration for default nushell menus
        # Note the lack of source parameter
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: green
                selected_text: { attr: r }
                description_text: yellow
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
        {
            name: ide_completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: ide
                min_completion_width: 0,
                max_completion_width: 50,
                max_completion_height: 10, # will be limited by the available lines in the terminal
                padding: 0,
                border: true,
                cursor_offset: 0,
                description_mode: "prefer_right"
                min_description_width: 0
                max_description_width: 50
                max_description_height: 10
                description_offset: 1
                # If true, the cursor pos will be corrected, so the suggestions match up with the typed text
                #
                # C:\> str
                #      str join
                #      str trim
                #      str split
                correct_cursor_pos: false
            }
            style: {
                text: green
                selected_text: { attr: r }
                description_text: yellow
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: description
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
    ]

    keybindings: [
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: ide_completion_menu
            modifier: control
            keycode: char_n
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: ide_completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: history_menu }
        }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: escape
            modifier: none
            keycode: escape
            mode: [emacs, vi_normal, vi_insert]
            event: { send: esc }    # NOTE: does not appear to work
        }
        {
            name: cancel_command
            modifier: control
            keycode: char_c
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrlc }
        }
        {
            name: quit_shell
            modifier: control
            keycode: char_d
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrld }
        }
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
        {
            name: search_history
            modifier: control
            keycode: char_q
            mode: [emacs, vi_normal, vi_insert]
            event: { send: searchhistory }
        }
        {
            name: open_command_editor
            modifier: control
            keycode: char_o
            mode: [emacs, vi_normal, vi_insert]
            event: { send: openeditor }
        }
        {
            name: move_up
            modifier: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: none
            keycode: down
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: move_left
            modifier: none
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: none
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: none
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: char_a
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: none
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: control
            keycode: char_e
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end
            modifier: control
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolineend }
        }
        {
            name: move_up
            modifier: control
            keycode: char_p
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: delete_one_character_backward
            modifier: none
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: delete_one_character_forward
            modifier: none
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_backward
            modifier: control
            keycode: char_h
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: char_w
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: move_left
            modifier: none
            keycode: backspace
            mode: vi_normal
            event: { edit: moveleft }
        }
        {
            name: newline_or_run_command
            modifier: none
            keycode: enter
            mode: emacs
            event: { send: enter }
        }
        {
            name: move_left
            modifier: control
            keycode: char_b
            mode: emacs
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: control
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: redo_change
            modifier: control
            keycode: char_g
            mode: emacs
            event: { edit: redo }
        }
        {
            name: undo_change
            modifier: control
            keycode: char_z
            mode: emacs
            event: { edit: undo }
        }
        {
            name: paste_before
            modifier: control
            keycode: char_y
            mode: emacs
            event: { edit: pastecutbufferbefore }
        }
        {
            name: cut_word_left
            modifier: control
            keycode: char_w
            mode: emacs
            event: { edit: cutwordleft }
        }
        {
            name: cut_line_to_end
            modifier: control
            keycode: char_k
            mode: emacs
            event: { edit: cuttoend }
        }
        {
            name: cut_line_from_start
            modifier: control
            keycode: char_u
            mode: emacs
            event: { edit: cutfromstart }
        }
        {
            name: swap_graphemes
            modifier: control
            keycode: char_t
            mode: emacs
            event: { edit: swapgraphemes }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: left
            mode: emacs
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: right
            mode: emacs
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: char_b
            mode: emacs
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: delete_one_word_forward
            modifier: alt
            keycode: delete
            mode: emacs
            event: { edit: deleteword }
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: backspace
            mode: emacs
            event: { edit: backspaceword }
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: char_m
            mode: emacs
            event: { edit: backspaceword }
        }
        {
            name: cut_word_to_right
            modifier: alt
            keycode: char_d
            mode: emacs
            event: { edit: cutwordright }
        }
        {
            name: upper_case_word
            modifier: alt
            keycode: char_u
            mode: emacs
            event: { edit: uppercaseword }
        }
        {
            name: lower_case_word
            modifier: alt
            keycode: char_l
            mode: emacs
            event: { edit: lowercaseword }
        }
        {
            name: capitalize_char
            modifier: alt
            keycode: char_c
            mode: emacs
            event: { edit: capitalizechar }
        }
        # The following bindings with `*system` events require that Nushell has
        # been compiled with the `system-clipboard` feature.
        # This should be the case for Windows, macOS, and most Linux distributions
        # Not available for example on Android (termux)
        # If you want to use the system clipboard for visual selection or to
        # paste directly, uncomment the respective lines and replace the version
        # using the internal clipboard.
        {
            name: copy_selection
            modifier: control_shift
            keycode: char_c
            mode: emacs
            event: { edit: copyselection }
            # event: { edit: copyselectionsystem }
        }
        {
            name: cut_selection
            modifier: control_shift
            keycode: char_x
            mode: emacs
            event: { edit: cutselection }
            # event: { edit: cutselectionsystem }
        }
        # {
        #     name: paste_system
        #     modifier: control_shift
        #     keycode: char_v
        #     mode: emacs
        #     event: { edit: pastesystem }
        # }
        {
            name: select_all
            modifier: control_shift
            keycode: char_a
            mode: emacs
            event: { edit: selectall }
        }
    ]
}
$env.config.show_banner = false
$env.config.cursor_shape.emacs = "block"
$env.config.edit_mode = "emacs"

$env.EDITOR = "nvim"
$env.SHELL = "nu"

alias in = enter
alias cd1 = cd ..
alias cd2 = cd ../../
alias cd3 = cd ../../../
alias cd4 = cd ../../../../
alias cd5 = cd ../../../../../
alias z1 = cd ..
alias z2 = cd ../../
alias z3 = cd ../../../
alias z4 = cd ../../../../
alias z5 = cd ../../../../../

$env.config = ($env.config | merge {
  history: {
    file_format: "sqlite"
    isolation: true
    sync_on_enter: false
  }
})

$env.config.hooks.env_change.cloud = [
      { |before, after|
        if ( $env.cloud == 1 ) {
            $env.PROMPT_COMMAND = { || create_left_prompt }
        }
      }
]

def update-z [ path ] {
  ls -f $path | where type == dir | par-each { |it|
    let name = (readlink -f $it.name)
    if (zoxide query $name | str contains $name ) {
      echo $"($name) exists"
    } else {
      zoxide add $name
      echo $"Adding ($name)"
    }
  }
}
def vim [...file: string] {
  let af = ($file | each {|f|
            if ($f|str substring ..1) in ['/', '~'] {
                $f | path expand
            } else {
                $"($env.PWD)/($f)"
            }
        })

  mut editor = "vim"
  if ((which nvim |length ) > 0) {
    $editor = "nvim"
  }
  if ( $editor == "nvim" ) {
    if ( $env.IN_VIM? == null ) {
      nvim ...$af
    } else {
      let action = "edit"
      let cmd = $"<cmd>($action) ($af|str join ' ')<cr>"
      nvim --headless --noplugin --server $env.NVIM --remote-send $cmd
    }
  } else {
    /usr/bin/vim ...$af
  }
}

def "z-complete" [ context: string ] {
  let pattern = ($context | split row ' '| drop nth 0)
  mut lst = (zoxide query -l ...$pattern |lines|first 15 )
  $lst = ($lst | append (zoxide query -l ($context | split words | last) |lines|first 15  ))
  let len = ($pattern | length)
  if ( $len == 0) {
    $lst = ($lst | append (ls -f $env.PWD|where type == directory|get name )) 
  }
  if ( $len == 1) {
    try {
      $lst = ($lst | append (ls -f $"($pattern|get 0)*" |where type == dir |get name ))
    } catch {
    }
  }
  $lst | uniq
}

def --env z [...rest:string] {
  cd $'(zoxide query --interactive -- ...$rest | str trim -r -c "\n")'
}

def --env zl [ ] {
  cd (zoxide query -l|lines|filter {|it| $it starts-with (pwd)}|each {|it| $it | str replace (pwd) '.'}|input list --fuzzy)
}

def --env gg [ ] {
  mut p = (pwd)
  while ($p != "/") {
    if ($p | path join ".git"|path exists) {
      break
    }
    $p = ($p | path join ".."|path expand)
  }
  if ($p != "/") {
    cd $p
  }
}

def my-prompt [ ] {
  try {
    return (starship prompt)
  } catch {}
  try {
    return ([$"(hostname) (pwd)"] | str join)
  } catch {}
}

$env.PROMPT_COMMAND = {|| ([(my-prompt) $"($env.note?) (bg-running)" "\n" ->] | str join ' ') }
$env.PROMPT_COMMAND_RIGHT = ""

use ($nu.default-config-dir | path join 'scripts' 'kubernetes') *
use ($nu.default-config-dir | path join 'scripts' 'docker') *

$env.config = ($env.config | upsert keybindings ( $env.config.keybindings | append [
  { name: custom modifier: alt keycode: char_h mode: [emacs vi_normal vi_insert]  event: { until: [
    { send: menuprevious }
    { send: Left }
  ]}}
  { name: custom modifier: alt keycode: char_l mode: [emacs vi_normal vi_insert]  event: {  until: [
    { send: menunext }
    { send: Right }
  ] } }
  { name: custom modifier: alt keycode: char_j mode: [emacs vi_normal vi_insert]  event: { until: [
    { send: menudown }
    { send: menu name: completion_menu }
  ]}}
  { name: custom modifier: alt keycode: char_k mode: [emacs vi_normal vi_insert]  event: { until: [
    { send: menuup }
  ]}}
  { name: custom modifier:alt keycode: char_q mode: [emacs vi_normal vi_insert]  event: [{edit: Clear}, {edit: InsertString, value: "workspace"}, {send: Enter}] }
  {
      name: "Run zoxide"
      modifier: Alt
      keycode: char_c
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "zl"
      }
  }

]))


def h [ pattern ] {
  help commands | where name =~ $pattern or category =~ $pattern
}

source ~/.config/custom.nu

$env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD | append [
        {
            condition: {|before, after|
                ($after | path join local.nu | path exists)
            }
            code: "overlay use --reload local.nu"
        }
    ]
)

$env.config = ($env.config | upsert keybindings ( $env.config.keybindings | append [{
    name: fuzzy_module
    modifier: alt
    keycode: Enter
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: '
            let cmd = (commandline)
            if ( $cmd | is-empty ) {
            } else {
              commandline edit -r $"run ($cmd)"
            }
        '
    }
}] ))

$env.config = ($env.config | upsert keybindings ( $env.config.keybindings | append [{
    name: fuzzy_module
    modifier: shift_alt
    keycode: Enter
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: '
            let cmd = (commandline)
            if ( $cmd | is-empty ) {
            } else {
              commandline -r $"pueue follow \(pueue add -p -- ($cmd)\)"
            }
        '
    }
}] ))

$env.config = ($env.config | upsert keybindings ( $env.config.keybindings | append [{
    name: fuzzy_module
    modifier: alt
    keycode: char_m
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: '
            commandline --replace "use "
            commandline --insert (
                $env.NU_LIB_DIRS
                | each {|dir|
                    ls ($dir | path join "**" "*.nu")
                    | get name
                    | str replace $dir ""
                }
                | flatten
                | input list --fuzzy
                    $"Please choose a (ansi magenta)module(ansi reset) to (ansi cyan_underline)load(ansi reset):"
                )
        '
    }
}] ))

$env.config.color_config = {
    separator: blue_bold
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    bool: {|| if $in { 'dark_cyan' } else { 'cyan' } }
    int: cyan
    filesize: {|e|
        if $e == 0b {
            'cyan'
        } else if $e < 1mb {
            'cyan_bold'
        } else { 'blue_bold' }
    }
    duration: cyan
    date: {|| (date now) - $in |
        if $in < 1hr {
            'purple'
        } else if $in < 6hr {
            'red'
        } else if $in < 1day {
            'yellow'
        } else if $in < 3day {
            'green'
        } else if $in < 1wk {
            'light_green'
        } else if $in < 6wk {
            'cyan'
        } else if $in < 52wk {
            'blue'
        } else { 'cyan' }
    }
    range: cyan
    float: cyan
    string: cyan
    nothing: cyan
    binary: cyan
    cellpath: cyan
    row_index: green_bold
    record: yellow_bold
    list: yellow_bold
    block: yellow_bold
    hints: cyan
    search_result: {fg: yellow_bold bg: red}    
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: yellow_bold bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}

def m [ cmd ] {
  [$"https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/linux/($cmd).md",
   $"https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/($cmd).md"] | par-each -t 2 {|it| try { http get $it } }
}

let repo_list = ["nushell/nushell", "casey/just", "ajeetdsouza/zoxide", "Ryooooooga/croque",
 "denoland/deno", "Nukesor/pueue", "ellie/atuin", "ducaale/xh", "YesSeri/xny-cli", "denisidoro/navi",
 "orhun/halp", "starship/starship", "sharkdp/bat", "sharkdp/fd", "sharkdp/lscolors",
 "BurntSushi/ripgrep", "xo/usql", "ogham/dog", "derailed/k9s", "ahmetb/kubectx", "helm/helm",
 "rclone/rclone", "restic/restic", "kopia/kopia", "Genivia/ugrep", "junegunn/fzf", "open-policy-agent/conftest",
 "jqlang/jq", "tomnomnom/gron", "zyedidia/micro", "helix-editor/helix", "kovidgoyal/kitty", "tmux/tmux",
 "theryangeary/choose", "direnv/direnv", "loft-sh/devpod", "tsl0922/ttyd", "aristocratos/btop", "moncho/dry",
 "xxxserxxx/gotop", "orhun/kmon", "browsh-org/browsh", "mrusme/planor", "jesseduffield/lazydocker",
 "tsenart/vegeta", "nicolas-van/multirun", "rsteube/carapace-bin", "urbanogilson/lineselect",
 "ast-grep/ast-grep", "jirutka/tty-copy", "theimpostor/osc", "d-kuro/kubectl-fuzzy",
 "nektos/act", "FiloSottile/age", "marcosnils/bin", "twpayne/chezmoi", "bitrise-io/envman", "guyfedwards/nom", "joshmedeski/sesh"
 "itchyny/bed",
]

def repo [ ] {
  $repo_list | append ($repo_list|each {|it| $it|split row '/'|last })
}

def real_repo [ repo ] {
  let repo = ($repo | str replace 'https://github.com/' '')
  if ($repo | str contains '/') {
    $repo
  } else {
    $repo_list | filter {|it| ($it|split row '/'|last) == $repo } | get 0
  }
}

def github-link [context: string] {
  let rows = ($context | str trim|split row ' ')
  let repo = (if (($rows|length) == 3) { $rows|get 1 } else { $rows | last })
  let repo = (real_repo $repo)
  mut links = (http get $"https://api.github.com/repos/($repo)/releases/latest"|get assets |get browser_download_url)
  mut archs = [(^uname -m)]
  if (($archs|get 0) == "x86_64") {
    $archs = ($archs | append ["amd64" "x64"])
  }
  let $archs = $archs
  let filtered = ($links|filter {|it| $it|str contains -i (^uname) })
  if (not ($filtered|is-empty)) {
    $links = $filtered
  }
  let filtered = ($links|filter {|it| ($archs | each {|a| $it|str contains -i $a}|any {|it| $it}) })
  if (not ($filtered|is-empty)) {
    $links = $filtered
  }
  $links
}

def download-github [ repo: string@repo ] {
  let tmpdir = (mktemp -t -d download-github.XXXXX)
  cd $tmpdir
  let repo = (real_repo $repo)
  let link_list = (github-link $repo | filter {|it| $it !~ '.*sha256'} )
  let link = ($link_list | get ($link_list | each {|it| $it |split row '/' | last} | input list --fuzzy --index)|str trim)

  let name = (http get $"https://api.github.com/repos/($repo)/releases/latest"|get assets |filter {$in.browser_download_url == $link } |get name|get 0)
  wget $link -O $name
  rm -rf /tmp/aa
  mkdir /tmp/aa
  if ( $name | str ends-with '.gz' ) {
    tar zxvf $name -C /tmp/aa
  } else if ( $name | str ends-with '.zip' ) {
    unzip $name -d /tmp/aa
  } else if ( $name | str ends-with '.tar') {
    tar xvf $name -C /tmp/aa
  } else if ( $name | str ends-with '.xz') {
    tar xvf $name -C /tmp/aa
  } else if ( $name | str ends-with '.deb') {
    sudo dpkg -i $name
    return
  } else {
    chmod +x $name
    let new = ($name|str replace -a - _|split column -c _ name|get 0.name)
    mv $name $"/tmp/aa/($new)"
  }
  ^find /tmp/aa/ -type f -executable|lines|each {|it| cp $it ~/bin/ }
}

def download-link [ link: string ] {
  rm /tmp/a
  mkdir /tmp/a
  mkdir /tmp/a/a
  cd /tmp/a
  wget $link
  let name = (ls | get 0.name)
  if ( $name | str ends-with 'tar.gz' ) {
    tar zxvf $name -C /tmp/aa
  } else if ( $name | str ends-with '.zip' ) {
    unzip $name -d /tmp/aa
  } else if ( $name | str ends-with '.tar') {
    tar xvf $name -C /tmp/aa
  } else if ( $name | str ends-with '.xz') {
    tar xvf $name -C /tmp/aa
  } else if ( $name | str ends-with '.gz' ) {
    mv $name aa/
    gzip -d $name
    chmod +x aa/*
  }
  ^find /tmp/aa/ -type f -executable|lines|each {|it| cp $it ~/bin/ }
}

def github-readme [ repo ] {
  let repo = ($repo | str replace 'https://github.com/' '')
  http get $"https://raw.githubusercontent.com/($repo)/master/README.md" | glow
}

def retry [ count:int, block:closure ] {
  mut _count = $count
  mut out = {}
  while $_count > 0 {
    $_count = $_count - 1
    let c = $_count
    try {
      return {
        "result": (do $block),
        "retries": ($count - $c - 1),
        "error": null
      }
    } catch {
      if $c == 0 {
        return {
          "result": null,
          "retries": ($count - $c),
          "error": $in.debug
        }
      }
    }
  }
}

bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{n}={v}"
    | filter { |x| ($x.n not-in $env) or $x.v != ($env | get $x.n) }
    | where n not-in ["_", "LAST_EXIT_CODE", "DIRS_POSITION"]
    | transpose --header-row
    | into record
    | load-env

def contains [lst ele] {
  $lst | each {|it| $it == $ele}|reduce {|a, b| $a or $b}
}

def list-diff [a b] {
  $a | filter {|it| not (contains $b $it) }
}

let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l $in | lines | where {|x| $x != $env.PWD}
}

let fish_with_carapace_completer = {|spans|
  let last_part = ($spans|last)
  if ([./ ~/ ../]|each {|it| $last_part starts-with $it}|reduce {|a, b| $a or $b}) {
    return null
  } 
  let ret = ([{||
    if (which carapace | is-not-empty ) {
        carapace $spans.0 nushell ...$spans | from json
    } else {
      [ ]
    }
  },
  {||
    if (which argc | is-not-empty ) {
      argc --argc-compgen nushell "" ...$spans
      | split row "\n" | range 0..-2
      | each { |line| $line | split column "\t" value description } | flatten
    } else {
      [ ]
    }
  }] | par-each -t 8 {|it| do -i $it } | flatten | each {|it| $it | str trim } | uniq)
  if ($ret | is-empty) {
    return null
  } 
  $ret
}


let external_completer = {|spans|
    match $spans.0 {
        nu => $fish_completer
        git => $fish_completer
        vim => $fish_completer
        nvim => $fish_completer
        asdf => $fish_completer
        z => $zoxide_completer
        zi => $zoxide_completer
        _ => $carapace_completer
    } | do $in $spans
}

$env.config = ($env.config | upsert completions  {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "prefix"
    external: {
      enable: true
      max_results: 100
      completer: $fish_with_carapace_completer
    }
})

def auto [ --strip (-s) ] {
  let input = $in
  mut data = null
  try {
    $data = (echo $input|from json)
  } catch {
  }
  if ($data == null ) {
    try {
      $data = (echo $input|from yaml)
    } catch {
    }
  }
  if ($data == null) {
    return $input
  } else {
    if (not $strip) {
      return $data
    }
    try {
      mut values = (echo $data|values)
      if (($values|length) == 1) {
        return ($values|first)
      }
    }
    let lst = ([ ] | append $data)
    if (($lst|length) == 1) {
      return ($lst|first)
    }
    return $data
  }
  return $input
}

$env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD | append [
        {
            code: "
              if (not (which direnv | is-empty)) {
                let direnv = (direnv export json | from json)
                let direnv = if not ($direnv | is-empty) { $direnv } else { {} }
                $direnv | load-env
              }
              if (not (which zoxide | is-empty)) {
                zoxide add -- $env.PWD
              }

            "
        }
])

$env._out = []
$env.config.hooks.display_output = {
  let stdin  = $in
  try {
    if (($stdin|get out?) == "out") {
      $stdin |get stdout | if (term size).columns >= 100 { table -e } else { table }
    }
  } catch {

  }
  $env._out = ($env._out | prepend [$stdin] | uniq)
  let l = ($env._out | length)
  if ( $l > 10) {
    $env._out = ($env._out | first 10)
  }
  $stdin | if (term size).columns >= 100 { table -e } else { table }
}

def out [ index?: int ] {
  let stdin = $in
  if ($index == null) {
    return {
      out: out
      stdout: $env._out
    }
  } else {
    try {
      return ($env._out | get ($index - 1))
    } catch {
      return {
        out: out
        stdout: null
      }
    }
  }
}

$env.reg = { }
def --env reg [ name?: string ] {
  let stdin = $in
  if ($name == null ) {
    return $env.reg
  } else {
    if ($stdin == null) {
      return ($env.reg | get $name)
    } else {
      $env.reg = ($env.reg | upsert $name $stdin)
      return $stdin
    }
  }
}

export def r-nu [ host: string, command:string ] {
  let code = $in
  $code | ssh -t $host tee /tmp/tmp.nu
  ssh $host nu --config /tmp/tmp.nu -c $command
}

$env.config.hooks.pre_execution = ($env.config.hooks.pre_execution | append [
        {
            code: '
              print $"(ansi title)(pwd)> (history | last | get command)(ansi st)"
            '
        }
])
$env.config.hooks.pre_prompt = ($env.config.hooks.pre_prompt | append [
        {
            code: '
              print $"(ansi title)(pwd)> nu (ansi st)"
            '
        }
])

export def --wrapped tr [ ...args ] {
  let path = (pwd)
  tmux new-window -b -c $path direnv exec $path bash -c $'"($command)"'
}

def "nu-complete just" [] {
    (^just --dump --unstable --dump-format json | from json).recipes | transpose recipe data | flatten | where {|row| $row.private == false } | select recipe doc parameters | rename value description
}

# Just: A Command Runner
export extern "just" [
    ...recipe: string@"nu-complete just", # Recipe(s) to run, may be with argument(s)
]


def notica [ text:string ] {
  curl --data $"d:($text)" $"https://notica.us/($env.notica_key?)" ;
}

$env.max_jobs = 9

def --wrapped "run" [ --doc="", ...command ] {
  mut desc = ($command | str join ' ')
  if ($doc != "") {
    $desc = $doc
  }
  let _unit = (not-used-units|first)
  mut _command = $command
  if (echo 'local.nu' | path exists) {
    $_command = ($_command | prepend "source local.nu;\n")
  }
  mut binary = ["nu"]
  if (which direnv|is-not-empty) {
    $binary = ($binary | prepend ["direnv", "exec", "."])
  }

  systemd-run --user -u $_unit --service-type=oneshot -d --no-block --description $desc ...$binary -c ($_command | str join ' ')
  $_unit
}

def not-used-units [ ] {
  let running_unit_names = (all-unit-info|filter {|it|
    $it.ExecStart? != null
  }|get Id|each {|it| $it|str replace '.service' ''})
  all-unit-name |filter {|it| $it not-in $running_unit_names}
}

def note [ -t="infinity", --after (-a): string="", text ] {
  let _unit = (not-used-units|first)
  mut extra = []
  if ($after != "") {
    $extra = [--on-active $after]
  }
  systemd-run --user -u $_unit --service-type=oneshot -d --no-block --description $"📓($text)" -G ...$extra sleep $t 

}

def log [ $unit?:string@all-unit-name , --follow (-f)] {
  let stdin = $in
  mut extra = [ ]
  mut _unit = $unit
  if ($follow or $_unit == null ) {
    $extra = ($extra | append ["-f", "--since=now", "--output=cat"])
    if ($_unit == null) {
      $_unit = $stdin
    }
    if ($env.IN_VIM? == "1") {
      $extra = ($extra | append ["--no-pager"])
    }
    journalctl --user -u $_unit -e --no-hostname ...$extra

  } else {
    journalctl --user -u $_unit --no-hostname -r --no-pager|lines|take until {|it| ('systemd' in $it and 'Starting' in $it)}|reverse | str join "\n"
  }
}

def all-log [ -n:int=5 ] {
  all-unit-name | par-each -t 4 {|it| {name: $it, log: (log $it|lines|first 5|str join "\n")} }|sort-by name
}

def show [ unit:string@running-units-complete ] {
  systemctl --user status $unit
}

def get-systemd-info [ unit: string ] {
  systemctl --user show $unit|lines|each {|it| split row '=' -n 2|{ $in.0 : $in.1 }}|reduce {|a, b| $a | merge $b}
}

def stop [ ...units:string@running-units-complete ] {
  $units | par-each -t 2 {|unit|
    if (systemctl --user show $unit|find 'ActiveState=inactive'|is-not-empty) {
      systemctl --user stop $"($unit|str replace '.service' '').timer"
    } else  if (systemctl --user show $unit|find 'ActiveState=failed'|is-not-empty) {
      systemctl --user reset-failed $unit
    } else {
      systemctl --user stop $unit
    }
  }
  null
}

def clean [ ] {
  running-units | par-each {|it| stop $it.Id }
  running-units | par-each {|it| stop $it.Id }
  null
}

def all-unit-name [ ] {
  ["run"] | append (seq 1 $env.max_jobs|each {|it| $"run($it)"})
}

def all-unit-info [ ] {
  all-unit-name | par-each -t 4 {|it| get-systemd-info $it}
}


def running-units [ ] {
  all-unit-info|filter {|it|
    $it.ExecStart? != null
  } | sort-by Id
}

def running-units-complete [ ] {
  running-units | each {|it| {value: $in.Id , description: $in.Description}}
}

def bg-running [ ] {
  let icon_map = { activating: "🟢", inactive: "⏰", failed: "❌" }
  running-units | each {|it| $"[($it.Id|str replace '.service' ''|str replace 'run' ''):($icon_map | get -i $it.ActiveState)($it.Description)]"} | str join ' '|str trim
}


def --wrapped sr [ ...command ] {
  let unit = $"sr-(date now | format date '%m%d-%H%M%S')"
  systemd-run --user -t -P -G ...$command
}

$env.config.keybindings = ($env.config.keybindings | filter {|it| $it.name !~ "completion_menu"})
$env.config.keybindings = ($env.config.keybindings | append {
  name: completion_menu
  modifier: none
  keycode: tab
  mode: [emacs vi_normal vi_insert]
  event: {
      until: [
          { send: menu name: ide_completion_menu }
          { send: menunext }
          { edit: complete }
      ]
  }
})

$env.config.keybindings = ($env.config.keybindings | append {
      name: another_esc_command
      modifier: control
      keycode: char_s
      mode: [emacs, vi_normal, vi_insert]
      event: { send: esc }
})

if (($env.IN_VIM? == "1") and (which nvr | is-not-empty)) {
  $env.EDITOR = [nvr --remote-wait-silent -cc vsplit]
}

def "nu-complete t" [ ] {
  tmux list-sessions -F '#S'|lines
}
export extern t [ sessions:string@"nu-complete t" ]

def --wrapped bg [ ...command  ] {
  tmux new-window -c . -t popup: -d ...$command
}

def kaniko-build [ dockerfile: string, context: string, image: string, ...args:string  ] {
  let build_args = ($args | each {|it| ["--build-arg",  $it]}|flatten)
  let dct = {
    "apiVersion": "v1",
    "spec": {
      "containers": [
        {
          "name": "kaniko",
          "image": "gcr.io/kaniko-project/executor:latest",
          "stdin": true,
          "stdinOnce": true,
          "args": [
            "--dockerfile=Dockerfile",
            "--context=tar://stdin",
            "--cache-dir=/workspace/cache",
            $"--destination=($image)",
            ...$build_args
          ],
          "volumeMounts": [
            {
              "name": "docker-config",
              "mountPath": "/kaniko/.docker/"
            }
          ]
        }
      ],
      "volumes": [
        {
          "name": "docker-config",
          "configMap": {
            "name": "docker-config"
          }
        }
      ]
    }
  }
  tar zcvf - $context | kubectl run kaniko --rm --stdin=true --image=gcr.io/kaniko-project/executor:latest --restart=Never $"--overrides=($dct|to json --raw|str trim)"
}

def r [ task:string@"nu-complete nur task-names" ] {
  let code = "import os\nos.system('nur " + $task + "')"
  python3 -c $code

}

$env._clipboard = ( try { $env._clipboard } catch { [ ] })

def pretty [  ] {
  let it = $in
  let type = ( $it | describe )
  if ( $type == "string" ) {
    $it | lines|first 5|str join "\n"
  } else if ( $type == "int" ) {
    $it |into string
  } else if ( $type | str contains "list" ) {
    $it | first 5 | to nuon
  } else {
    $it | describe
  }
}

def --env cb [ command = "" ] {
  if ( $command | is-empty ) {
    let stdin = $in
    if ( $stdin | is-empty ) {
    } else {
      $env._clipboard = ( $env._clipboard | append [$stdin] | last 10)
    }
    return ($env._clipboard | last)
  } else {
    try {
      let index = ( $command | into int )
      let length = ( $env._clipboard | length )
      return ($env._clipboard | get ( ($length ) - $index - 1))
    } catch {
      if ( $command == "list" ) {
        return ($env._clipboard |par-each {|it|
          $it |pretty
        }|reverse)
      } else if ( $command == "clear" ) {
        $env._clipboard = [ ]
        return $env._clipboard
      } else if ( $command == "fzf" ) {
        $env._clipboard | fzf_list
      } else {
        echo "invalid command"
      }
    }
  }
}

def fzf_list [ ] {
  let stdin = $in
  let map_list = ($stdin | enumerate | each {|it| 
    let index = ($it |get index)
    let value = ($it |get item )
    { index : $index, value: $value}
  })
  $map_list
  let selected = ($map_list|each {|it| 
    { index: $it.index, value: ($it.value |pretty| str replace -a "\n" "")}|to nuon
  }|str join "\n"|^fzf|str trim)

  let selectedIndex = ($selected|into string|from nuon).index?
  if ( $selectedIndex | is-empty ) {
    return
  }

  $map_list | filter {|it| 
    ($it.index == $selectedIndex)
  } | get 0 |get value
}

def parse-status [ value ] {
  print $value
  try {
    return $"Failed: ($value.Done.Failed) ->"
  }
  try {
    return ($value.Done + " ->")
  }
  return ($value + " ->")
}
def complete-jobs [ ] {
  pueue status --json|from json|get tasks|values|each { {value: $in.id , description: $"(parse-status $in.status) ($in.command)" } }
}

def complete-groups [ ] {
  pueue status --json|from json|get groups|items {|key, value| $key}
}

def "job follow" [ id: string@complete-jobs ] {
  pueue follow $id
}

def "job kill" [ id: string@complete-jobs ] {
  pueue kill $id
}

def "job wait" [ id: string@complete-jobs ] {
  pueue wait $id
}

def "job clean" [ gid?: string@complete-groups ] {
  if ($gid|is-empty) {
    pueue clean
  } else {
    pueue clean -g $gid
  }
}


def "job add" [ command: any, --gid: string@complete-groups ] {
  mut source_code = ""
  let type = $command|describe
  if ($type == closure) {
    $source_code = (view source $command | str trim -l -c '{' | str trim -r -c '}')
  } else if ($type == string ) {
    $source_code = $command
  } else {
    return (echo "Invalid command type: $type")
  }

  let source_code =   if ($gid|is-empty) {
    return (pueue add -p -i -- $source_code)
  } else {
    return (pueue add -g $gid -p -i -- $source_code)
  }
}

def job [ ] {
  pueue status
}

def "nu-complete nur task-names" [] {
  ^nur --list | lines
}

# nur - a taskrunner based on nu shell.
export extern nur [
  --help(-h)  # Display the help message for this command
  --version(-v)  # Output version number and exit
  --list(-l)  # List available tasks and then just exit
  --quiet(-q)  # Do not output anything but what the task produces
  --stdin  # Attach stdin to called nur task
  --commands(-c)  # Run the given commands after nurfiles have been loaded
  --enter-shell  # Enter a nu REPL shell after the nurfiles have been loaded (use only for debugging)
  task_name?: string@"nu-complete nur task-names"  # Name of the task to run (optional)
  ...args  # Parameters to the executed task
]

use ($nu.default-config-dir | path join 'scripts' 'pueue.nu') *

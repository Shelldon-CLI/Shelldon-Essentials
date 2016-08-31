Shelldon.module :essentials do
  # Opts

  # Config
  config do
    param :debug_mode do
      type :boolean
      default false
      opt 'd'
    end

    param :'-o' do
      type :string
      default 'emacs'
      adjust { |s| s.to_s.downcase.strip.gsub('vim', 'vi') }
      validate do |s|
        return false unless s == 'emacs' || s == 'vi'
        if s == 'emacs'
          Readline.emacs_editing_mode; true
        else
          Readline.vi_editing_mode; true
        end
      end
    end
  end

# Command Missing
  command_missing do
    action { |cmd| puts "No such command \"#{cmd}\"" }
  end

# Commands
  command :help do
    action { |args| pp command_list.help(args) }
    help 'Show help. Optionally specify specific command for more information.'
    usage 'help [cmd]'
    examples ['help', 'help quit']
  end

  command :config do
    help 'Show the configuration of the current session.'
    usage 'config'
    action do |args|
      if args.empty?
        pp config.to_a
      else
        param = config.find(args.to_sym)
        puts "#{param.name}: #{param.val}"
      end
    end

    subcommand :save do
      help 'Save your current configuration'
      usage 'config save'
      action { config.save }
    end
  end

  command :set do
    help 'Set a configuration option for the remainder of the session.'

    action do |args|
      tokens                   = args.split(' ')
      config[tokens[0].to_sym] = tokens[1]
    end
  end
end
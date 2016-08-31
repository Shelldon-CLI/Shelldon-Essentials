require 'tty'

class ShelldonTable
  def self.print(header: nil, rows:)
    puts TTY::Table.new(header: header, rows: rows).render(
        :unicode, padding: [0, 1, 0, 1]
    )
  end
end

Shelldon.module :table_help_config do
# Commands
  command :help do
    action do |args|
      if args.empty?
        header = ["Name", "Aliases", "Help"]
      else
        header = ["Name", "Help", "Usage", "Examples"]
      end
        ShelldonTable.print(
            header: header,
            rows:   command_list.help(args))
    end
    help 'Show help. Optionally specify specific command for more information.'
    usage 'help [cmd]'
    examples ['help', 'help quit']
  end

  command :config do
    help 'Show the configuration of the current session.'
    usage 'config'
    action do |args|
      if args.empty?
        ShelldonTable.print(
            header: ["Command", "Value", "Flag"],
            rows:   config.to_a)
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
end
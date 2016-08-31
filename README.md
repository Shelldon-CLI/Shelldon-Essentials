# Shelldon Essentials
`shelldon-essentials` provides a jump-start to many [Shelldon](https://github.com/Shelldon-CLI/shelldon) projects with a useful set of commands and config parameters.

This is not a stand-alone Shelldon shell.

## Customization
If you find that this repo ***almost*** fits what you need, you can feel free to simply grab the source and inject it directly into your own project, rather than requiring the gem. Shelldon modules are cool like that.

## Installation
Add `gem 'shelldon-essentials'` to your application's Gemfile, and then execute `bundle install`.

Alternatively, install it yourself: `gem install shelldon-essentials`

## Usage
    require 'shelldon-essentials'

    Shelldon.shell[:test] do
      shell do
        # In cases like this, order matters.
        # 'config' and 'help' from the second module will take precedence.
        modules [:essentials, :table_help_config]
      end
    end

You're done!

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


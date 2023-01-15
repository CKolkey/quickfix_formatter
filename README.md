# QuickfixFormatter

Easily integrate the vim quickfix list with your failing rspec tests. Just add this gem, set it as one of your
formatters (`--format QuickfixFormatter`)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add quickfix_formatter

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install quickfix_formatter

## Usage

Add `--format QuickfixFormatter` to `.rspec` or in the command line. There are two configurable settings, shown below
with their default values.

`quickfix_output_file` is a string that represents the location the quickfix file is written to.
`quickfix_silence`, when set to `true`, will supress the text that prints after writing the file.

```ruby
# spec/spec_helper.rb

RSpec.configure do |config|
  config.quickfix_output_file = "tmp/quickfix.out"
  config.quickfix_silence     = false
end
```

Once `rspec` has written the output file, you can load it with `:cfile <path to file>`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ckolkey/quickfix_formatter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

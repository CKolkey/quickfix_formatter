# frozen_string_literal: true

require "rspec/core"
require "rspec/core/formatters/base_formatter"

::RSpec.configuration.add_setting :quickfix_output_file, default: "tmp/quickfix.out"
::RSpec.configuration.add_setting :quickfix_silence,     default: false

# Writes the failures in a format consumable by the vim quickfix list
class QuickfixFormatter < RSpec::Core::Formatters::BaseFormatter
  ::RSpec::Core::Formatters.register self, :dump_failures

  def dump_failures(notification)
    File.write(
      config.quickfix_output_file,
      notification.failed_examples.map(&method(:line_output)).join
    )

    puts(text_output) unless config.quickfix_silence
  end

  private

  def line_output(example)
    filepath          = example.metadata[:absolute_file_path]
    line_number       = example.metadata[:line_number]
    group_description = example.example_group.description

    "#{filepath}:#{line_number}: #{group_description}: #{example.description}\n"
  end

  def text_output
    ::RSpec::Core::Formatters::ConsoleCodes.wrap("\nQuickfix written to: '#{config.quickfix_output_file}'", :blue)
  end

  def config
    ::RSpec.configuration
  end
end

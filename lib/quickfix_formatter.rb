# frozen_string_literal: true

require_relative "quickfix_formatter/version"
require "rspec/core/formatters/base_formatter"

module QuickfixFormatter
  def line_output(example)
    filepath          = example.metadata[:absolute_file_path]
    line_number       = example.metadata[:line_number]
    group_description = example.example_group.description

    "#{filepath}:#{line_number}: #{group_description}: #{example.description}\n"
  end

  class Formatter < RSpec::Core::Formatters::BaseFormatter
    def dump_failures(notification)
      notification.failed_examples.each do |example|
        output.puts line_output(example)
      end
    end
  end

  RSpec::Core::Formatters.register QuickfixFormatter::Formatter, :dump_failures
end

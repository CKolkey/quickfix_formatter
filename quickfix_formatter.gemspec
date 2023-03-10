# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                          = "quickfix_formatter"
  spec.version                       = "0.1.0"
  spec.authors                       = ["Cameron"]
  spec.email                         = ["cameron.kolkey@gmail.com"]
  spec.summary                       = "Format rspec output for vim quickfix consumption"
  spec.homepage                      = "https://www.github.com/ckolkey/quickfix_formatter"
  spec.license                       = "MIT"
  spec.required_ruby_version         = ">= 3.0.0"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = spec.homepage
  spec.metadata["changelog_uri"]     = spec.homepage
  spec.require_paths                 = ["lib"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end

  spec.add_dependency "rspec", ">= 3.12.0"
end

# frozen_string_literal: true

require_relative "lib/geocoder/studitemps/version"

Gem::Specification.new do |spec|
  spec.name          = "geocoder-studitemps"
  spec.version       = Geocoder::Studitemps::VERSION
  spec.authors       = ["Hendrik Gebhardt"]
  spec.email         = ["hendrik.gebhardt@studitemps.de"]

  spec.summary       = "Studitemps adapter for the Geocoder gem"
  spec.description   = "Studitemps adapter for the Geocoder gem"
  spec.homepage      = "https://github.com/studitemps/geocoder-studitemps"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/studitemps/geocoder-studitemps"
  spec.metadata["changelog_uri"] = "https://github.com/studitemps/geocoder-studitemps/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Register a new dependency of your gem
  spec.add_dependency "geocoder", "~> 1.6"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

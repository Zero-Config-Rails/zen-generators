# frozen_string_literal: true

require_relative "lib/zcr/zen/version"

Gem::Specification.new do |spec|
  spec.name = "zcr-zen"
  spec.version = Zcr::Zen::VERSION
  spec.authors = ["Prabin Poudel"]
  spec.email = ["probnpoudel@gmail.com"]

  spec.summary = "Configure any gem in a single command"
  spec.description =
    "With Zen you can configure any gem from the supported list in a single command. Wrapper for Boring Generators with the support for interactive UI and branding of Zero Config Rails"
  spec.homepage = "https://generators.zeroconfigrails.com"
  spec.license = nil
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata[
    "source_code_uri"
  ] = "https://github.com/Zero-Config-Rails/zen-generators"
  spec.metadata[
    "changelog_uri"
  ] = "https://github.com/Zero-Config-Rails/zen-generators/blob/main/CHANGELOG.md"
  spec.metadata[
    "bug_tracker_uri"
  ] = "https://github.com/Zero-Config-Rails/zen-generators/issues"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files =
    IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
      ls
        .readlines("\x0", chomp: true)
        .reject do |f|
          (f == gemspec) ||
            f.start_with?(
              *%w[bin/ test/ features/ .git .github appveyor Gemfile]
            )
        end
    end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "boring_generators", "~> 0.14.0"
  spec.add_dependency "thor", "~> 1.3.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

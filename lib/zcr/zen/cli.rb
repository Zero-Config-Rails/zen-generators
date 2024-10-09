require "thor"
require "boring_generators/cli"

require_relative "./version"

module Zcr
  module Zen
    class CLI < Thor
      map %w[-v --version] => "version"

      desc "configure gem", "Configure the gem inside your project"
      def add(generator, *options)
        BoringGenerators::CLI.new.generate("boring:#{generator}:install", options)
      end

      desc "version", "Display gem version", hide: true
      def version
        say "#{VERSION} #{RUBY_DESCRIPTION}"
      end
    end
  end
end

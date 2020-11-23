# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.prepend(lib) unless $LOAD_PATH.include?(lib)
require 'turkish_ranges/version'

Gem::Specification.new do |spec|
  spec.name          = 'turkish_ranges'
  spec.version       = TurkishRanges::VERSION
  spec.authors       = ['Sıtkı Bağdat']
  spec.email         = ['sbagdat@gmail.com']

  spec.summary       = 'Ranges and string comparisons meet Turkish language'
  spec.description   = 'Ranges and string comparisons meet Turkish language. You can use ' \
                       'it anywhere in your code, Range, Regexp, etc..'
  spec.homepage      = 'https://github.com/sbagdat/turkish_ranges'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.require_paths = ['lib']
end

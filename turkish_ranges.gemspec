# frozen_string_literal: true

require_relative 'lib/turkish_ranges/version'

Gem::Specification.new do |spec|
  spec.name          = 'turkish_ranges'
  spec.version       = TurkishRanges::VERSION
  spec.authors       = ['Sıtkı Bağdat']
  spec.email         = ['sbagdat@gmail.com']

  spec.summary       = 'Ranges meet Turkish language'
  spec.description   = 'Turkis language support for ranges. You can use ' \
                       'them anywhere in your code, Range, Regexp, etc..'
  spec.homepage      = 'https://github.com/sbagdat/turkish_ranges'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"
  spec.require_paths = ['lib']
end

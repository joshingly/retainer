# frozen_string_literal: true

require_relative 'lib/retainer/version'

Gem::Specification.new do |spec|
  spec.name = 'retainer'
  spec.version = Retainer::VERSION
  spec.authors = ['Joshua Antonishen']
  spec.email = ['joshua@antonishen.com']

  spec.summary = 'Retention policy plan generator.'
  spec.homepage = 'https://github.com/joshingly/retainer'
  spec.license = 'AGPL-3.0-or-later'
  spec.required_ruby_version = '>= 3.2'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/joshingly/retainer/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  excluded = %w[
    bin/ spec/
    .git .irbrc .rspec .rubocop.yml
    docker-compose Dockerfile Gemfile Guardfile
  ]
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*excluded)
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.metadata['rubygems_mfa_required'] = 'true'
end

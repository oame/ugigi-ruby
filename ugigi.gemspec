# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ugigi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Oame"]
  gem.email         = ["oame@oameya.com"]
  gem.description   = %q{Ugigi Wrapper for Ruby}
  gem.summary       = %q{Ugigi Wrapper for Ruby 1.9.x}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ugigi"
  gem.require_paths = ["lib"]
  gem.version       = Ugigi::VERSION
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_dependency "json" if RUBY_VERSION < "1.9.0"
end

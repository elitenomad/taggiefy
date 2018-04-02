$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "taggiefy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = "taggiefy"
  spec.version       = Taggiefy::VERSION
  spec.authors       = ["Pranava S Balugari"]
  spec.email         = ["stalin.pranava@gmail.com"]

  spec.summary       = %q{Rails gem for a generic tagging functionality.}
  spec.description   = %q{Rails gem for a generic tagging functionality}
  spec.homepage      = "https://www.lifemeasure.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "rails", "~> 5.1"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pg"
end

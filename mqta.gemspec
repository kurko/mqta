
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mqta/version"

Gem::Specification.new do |spec|
  spec.name          = "mqta"
  spec.version       = Mqta::VERSION
  spec.authors       = ["Alex Oliveira"]
  spec.email         = ["kurko@users.noreply.github.com"]

  spec.summary       = %q{Log messages from a RabbitMQ exchange.}
  spec.description   = %q{Log messages from a RabbitMQ exchange.}
  spec.homepage      = "https://github.com/kurko/mqta"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bunny", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

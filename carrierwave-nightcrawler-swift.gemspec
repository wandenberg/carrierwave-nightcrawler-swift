# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/nightcrawler/swift/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-nightcrawler-swift"
  spec.version       = Carrierwave::Nightcrawler::Swift::VERSION
  spec.authors       = ["Wandenberg"]
  spec.email         = ["wandenberg@gmail.com"]

  spec.summary = 'Carrierwave store for swift using NightcrawlerSwift client for authenication, list and store operations'
  spec.description = 'A store for carrierwave that uses swift. NightcrawlerSwift client is used for authenication, list and store operations.'
  spec.homepage      = "https://github.com/wandenberg/#{spec.name}"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nightcrawler_swift"
end

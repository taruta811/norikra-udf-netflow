# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'norikra/udf/netflow/version'

Gem::Specification.new do |spec|
  spec.name          = "norikra-udf-netflow"
  spec.version       = Norikra::Udf::Netflow::VERSION
  spec.authors       = ["Yohei KANEMARU"]
  spec.email         = ["ka.ka.maru55@gmail.com"]
  spec.summary       = %q{Norikra netflow UDF}
  spec.description   = %q{Norikra UDF for processing netflow}
  spec.homepage      = "https://github.com/yokamaru/norikra-udf-netflow"
  spec.license       = "MIT"
  spec.platform      = "java"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "jar"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "norikra"
end

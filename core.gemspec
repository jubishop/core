Gem::Specification.new do |spec|
  spec.name          = "core"
  spec.version       = "1.0"
  spec.date          = "2020-05-23"
  spec.summary       = %q{Core reusable Ruby libs.}
  spec.authors       = ["Justin Bishop"]
  spec.email         = ["jubishop@gmail.com"]
  spec.homepage      = "https://github.com/jubishop/core"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3")
  spec.metadata["source_code_uri"] = "https://github.com/jubishop/core"
  spec.files         = Dir["lib/**/*.rb"] + Dir["def/**/*.rbs"]
  spec.add_runtime_dependency 'rbs'
end

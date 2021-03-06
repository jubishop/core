Gem::Specification.new do |spec|
  spec.name          = 'core'
  spec.version       = '1.4'
  spec.summary       = 'Core reusable Ruby libs.'
  spec.authors       = ['Justin Bishop']
  spec.email         = ['jubishop@gmail.com']
  spec.homepage      = 'https://github.com/jubishop/core'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0')
  spec.metadata['source_code_uri'] = 'https://github.com/jubishop/core'
  spec.files         = Dir['lib/**/*.rb'] + Dir['sig/**/*.rb']
  spec.require_paths = ['lib']
  spec.metadata      = {
    'steep_types' => 'sig'
  }
end

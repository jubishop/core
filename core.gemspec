Gem::Specification.new do |spec|
  spec.name          = 'core'
  spec.version       = '1.19'
  spec.summary       = 'Core reusable Ruby libs.'
  spec.authors       = ['Justin Bishop']
  spec.email         = ['jubishop@gmail.com']
  spec.homepage      = 'https://github.com/jubishop/core'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0')
  spec.files         = Dir['lib/**/*.rb'] + Dir['sig/**/*.rbs']
  spec.require_paths = ['lib']
  spec.bindir        = 'bin'
  spec.executables   = []
  spec.metadata      = {
    'source_code_uri' => 'https://github.com/jubishop/core',
    'steep_types' => 'sig',
    'rubygems_mfa_required' => 'true'
  }
end

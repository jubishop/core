# Core

[![RSpec Status](https://github.com/jubishop/core/workflows/RSpec/badge.svg)](https://github.com/jubishop/core/actions/workflows/rspec.yml)  [![Rubocop Status](https://github.com/jubishop/core/workflows/Rubocop/badge.svg)](https://github.com/jubishop/core/actions/workflows/rubocop.yml)

Core reusable Ruby libs.

## Installation

### Global installation

```zsh
gem install core --source https://www.jubigems.org/
```

### In a Gemfile

```ruby
gem 'core', source: 'https://www.jubigems.org/'
```

## Usage

### Array

- `Array#sentence(joiner, &map)`

### Hash

- `Hash#deep_transform_keys!(&block)`
- `Hash#symbolize_keys`
- `Hash#symbolize_keys!`

### Proc

- `Proc#run`

### debugger

`debugger(binding)` - Interactive repl bound to current line of code.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

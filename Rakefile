require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop)
RSpec::Core::RakeTask.new(:spec) { |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
}

task(:build) {
  files = Rake::FileList.new('*.gemspec')
  files.each { |file|
    lines = File.readlines(file)
    lines.map! { |line|
      if line.strip.start_with?('spec.version')
        version = line.strip.split('=').last.strip.gsub(/['|"]/, '')
        main_version, sub_version = version.split('.').map(&:to_i)
        line.gsub(version, "#{main_version}.#{sub_version + 1}")
      else
        line
      end
    }
    File.write(file, lines.join)

    gem_name = file.split('.').first
    puts main_version
    #sh "gem build #{file}"
  }
}

task default: %w[rubocop spec]

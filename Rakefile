require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop)
RSpec::Core::RakeTask.new(:spec) { |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
}

namespace(:gem) {
  desc 'Bump gem minor version'
  task(:bump_version) {
    Rake::FileList.new('*.gemspec').each { |file|
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
    }
  }

  desc 'Bump gem minor version and build'
  task(build: :bump_version) {
    Rake::FileList.new('*.gemspec').each { |file|
      sh "gem build #{file}"
    }
  }

  desc 'Bump gem minor version, build, and install'
  task(install: :build) {
    Rake::FileList.new('*.gem').each { |file|
      sh "gem install #{file}"
      sh "rm #{file}"
    }
  }
}

task default: %w[rubocop spec]

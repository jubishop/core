require 'fileutils'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop)
RSpec::Core::RakeTask.new(:spec) { |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
}

def bump_version
  file = Rake::FileList.new('*.gemspec').first
  mtime = [File.mtime('lib'), File.mtime('sig'), File.mtime(file)].max
  if File.exist?('.gt') && File.mtime('.gt') >= mtime
    puts 'No files have changed since latest gem install'
    return false
  end

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
  FileUtils.touch('.gt')
  return true
end

def build_gem
  return false unless bump_version

  file = Rake::FileList.new('*.gemspec').first
  sh "gem build #{file}"
  return true
end

desc 'Bump gem minor version, build, and install'
task(:install) {
  next unless build_gem

  file = Rake::FileList.new('*.gem').first
  sh "gem install #{file}"
  sh "rm #{file}"
}

task default: %w[rubocop spec]

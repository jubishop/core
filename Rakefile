require 'fileutils'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop)
RSpec::Core::RakeTask.new(:spec) { |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
}

def gem_files
  gemspec = Rake::FileList.new('*.gemspec').first
  gem_file = "#{File.basename(gemspec, '.*')}.gem"
  return gemspec, gem_file
end

def bump_version
  gemspec, gem_file = gem_files
  src_mtime = [File.mtime('lib'), File.mtime('sig'), File.mtime(gemspec)].max
  if File.exist?(gem_file) && File.mtime(gem_file) >= src_mtime
    puts 'No files have changed since latest gem install'
    return false
  end

  lines = File.readlines(gemspec)
  lines.map! { |line|
    if line.strip.start_with?('spec.version')
      version = line.strip.split('=').last.strip.gsub(/['|"]/, '')
      main_version, sub_version = version.split('.').map(&:to_i)
      line.gsub(version, "#{main_version}.#{sub_version + 1}")
    else
      line
    end
  }
  File.write(gemspec, lines.join)
  FileUtils.touch('.gt')
  return true
end

def build_gem
  return false unless bump_version

  gemspec, gem_file = gem_files
  sh "gem build #{gemspec} -o #{gem_file}"
  return true
end

desc 'Bump gem minor version, build, and install'
task(:install) {
  next unless build_gem

  _, gem_file = gem_files
  sh "gem install #{gem_file}"
}

task default: %w[rubocop spec]

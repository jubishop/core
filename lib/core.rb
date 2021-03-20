this_file = File.basename(__FILE__, '.rb')
Dir.glob("#{File.dirname(__FILE__)}/*").each { |file|
  basename = File.basename(file, '.rb')
  require basename unless basename == this_file
}

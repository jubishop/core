def debugger(binding = TOPLEVEL_BINDING)
  require 'readline'
  while (input = Readline.readline('>> ', true))
    if input == 'exit'
      puts 'Exiting'
      break
    end

    begin
      puts eval(input, binding)
    rescue Exception => e
      puts "#{e.class}: #{e}"
    end
  end
end

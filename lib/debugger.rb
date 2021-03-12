def debugger(binding = TOPLEVEL_BINDING)
  require 'readline'
  while (input = Readline.readline('>> ', true))
    if input == 'exit'
      puts 'Exiting'
      break
    end

    begin
      puts eval(input, binding) # rubocop:disable Security/Eval
    rescue Exception => e # rubocop:disable Lint/RescueException
      puts "#{e.class}: #{e}"
    end
  end
end

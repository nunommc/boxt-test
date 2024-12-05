require_relative 'lib/simulator'

class CLI
  def initialize
    @simulator = Simulator.new
    puts "Welcome to the Toy Robot Simulator!"
    @simulator.help
  end

  def start
    loop do
      print "> "
      input = gets.strip

      case input.upcase
      when 'QUIT'
        puts "Goodbye!"
        break
      else
        begin
          result = @simulator.execute(input)
          puts result if result # Only output meaningful responses, like from REPORT
        rescue StandardError => e
          puts "Error: #{e.message}"
        end
      end
    end
  end
end

CLI.new.start

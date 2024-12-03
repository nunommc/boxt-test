require 'optparse'
require './lib/robot'

class CLI
  def initialize
    @running = true
    @robot = Robot.new
  end

  def start
    puts "Welcome to the Toy Robot Simulator!"
    puts "Enter commands (PLACE X,Y,F | MOVE | LEFT | RIGHT | REPORT) or type 'QUIT' to exit."
    while @running
      print "> "
      input = gets.strip
      process_input(input)
    end
  end

  private

  def process_input(input)
    case input.upcase
    when /^PLACE (\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/
      x, y, direction = $1.to_i, $2.to_i, $3
      @robot.place(x, y, direction)
    when "MOVE"
      @robot.move
    when "LEFT"
      @robot.turn_left
    when "RIGHT"
      @robot.turn_right
    when "REPORT"
      puts @robot.report
    when "QUIT"
      puts "Exiting Toy Robot Simulator. Goodbye!"
      @running = false
    else
      puts "Invalid command. Please use: PLACE X,Y,F | MOVE | LEFT | RIGHT | REPORT | QUIT"
    end
  end
end

# Start the CLI
if __FILE__ == $PROGRAM_NAME
  CLI.new.start
end

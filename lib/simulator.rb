require 'robot'
require 'table'

class Simulator
  attr_reader :table, :robot

  def initialize(table: Table.new, robot: Robot.new)
    @table = table
    @robot = robot
  end

  def execute(command)
    parts = command.split
    case parts[0]
    when "PLACE"
      handle_place(parts[1])
    when "MOVE"
      handle_move
    when "LEFT"
      @robot.turn_left
    when "RIGHT"
      @robot.turn_right
    when "REPORT"
      @robot.report
    else
      nil
    end
  end

  private

  def handle_place(args)
    x, y, direction = args.split(",")
    x, y = x.to_i, y.to_i
    @robot.place(x, y, direction) if @table.valid_position?(x, y)
  end

  def handle_move
    return unless @robot.placed?

    x, y = @robot.x, @robot.y
    case @robot.direction
    when "NORTH" then y += 1
    when "EAST" then x += 1
    when "SOUTH" then y -= 1
    when "WEST" then x -= 1
    end

    @robot.move if @table.valid_position?(x, y)
  end
end


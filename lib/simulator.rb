require 'robot'
require 'table'

class Simulator
  def initialize(table: Table.new(5, 5), robots: [])
    @table = table
    @robots = robots

    add_robot if @robots.empty?
  end

  def add_robot
    robot = Robot.new
    @robots << { robot: robot, position: nil }
    robot
  end

  def execute(command, robot: @robots.first.dig(:robot))
    case command
    when /^PLACE (\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/
      x, y, direction = $1.to_i, $2.to_i, $3
      place_robot(robot, x, y, direction)
    when "MOVE"
      move_robot(robot)
    when "LEFT"
      robot.turn_left
    when "RIGHT"
      robot.turn_right
    when "REPORT"
      report_robot(robot)
    end
  end

  private

  def place_robot(robot, x, y, direction)
    return unless @table.valid_position?(x, y)

    entry = @robots.find { |r| r[:robot] == robot }
    entry[:position] = { x: x, y: y }
    robot.place(direction)
  end

  def move_robot(robot)
    return unless robot.placed?

    entry = @robots.find { |r| r[:robot] == robot }
    current_position = entry[:position]

    new_position = calculate_new_position(current_position, robot.direction)
    return unless @table.valid_position?(new_position[:x], new_position[:y])
    return if position_occupied?(new_position[:x], new_position[:y])

    entry[:position] = new_position
  end

  def calculate_new_position(position, direction)
    x, y = position[:x], position[:y]
    case direction
    when "NORTH" then { x: x, y: y + 1 }
    when "EAST" then { x: x + 1, y: y }
    when "SOUTH" then { x: x, y: y - 1 }
    when "WEST" then { x: x - 1, y: y }
    end
  end

  def position_occupied?(x, y)
    @robots.any? { |r| r[:position] == { x: x, y: y } }
  end

  def report_robot(robot)
    return unless robot.placed?

    entry = @robots.find { |r| r[:robot] == robot }
    position = entry[:position]
    "#{position[:x]},#{position[:y]},#{robot.direction}"
  end
end

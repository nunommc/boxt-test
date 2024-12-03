class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_reader :direction

  def initialize
    @direction = nil
    @placed = false
  end

  def place(direction)
    @direction = direction
    @placed = true
  end

  def turn_left
    return unless placed?

    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index - 1) % DIRECTIONS.size]
  end

  def turn_right
    return unless placed?

    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index + 1) % DIRECTIONS.size]
  end

  def placed?
    @placed
  end
end

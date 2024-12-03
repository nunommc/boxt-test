class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_reader :x, :y, :direction

  def initialize
    @x, @y, @direction = nil, nil, nil
    @placed = false
  end

  def place(x, y, direction)
    if valid_position?(x, y)
      @x, @y, @direction = x, y, direction
      @placed = true
    end
  end

  def move
    return unless placed?

    new_x, new_y = @x, @y
    case @direction
    when "NORTH" then new_y += 1
    when "EAST" then new_x += 1
    when "SOUTH" then new_y -= 1
    when "WEST" then new_x -= 1
    end

    @x, @y = new_x, new_y if valid_position?(new_x, new_y)
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

  def report
    return unless placed?

    "#{@x},#{@y},#{@direction}"
  end

  def placed?
    @placed
  end

  private

  def valid_position?(x, y)
    x.between?(0, 4) && y.between?(0, 4)
  end
end

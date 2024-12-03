# Toy Robot Simulator
This is a command-line application simulating one or more toy robots moving on a tabletop. By default, the simulator starts with one robot. Additional robots can be added in future iterations, and each robot will have its own commands.

## How to Run

1. Ensure you have Ruby installed (version 3.3.4 recommended).
2. Clone this repository.
3. Run the application:

```bash
$ ruby cli.rb
```

## Commands

The following commands are supported. By default, they operate on the single robot present:

- **PLACE X,Y,F**
Places the robot on the tabletop at position (X, Y) and facing F (NORTH, EAST, SOUTH, or WEST).
Example:

```bash
PLACE 0,0,NORTH
```

- **MOVE**
  
Moves the robot one unit forward in the direction it is currently facing.

- **LEFT**
  
Rotates the robot 90 degrees to the left without changing its position.

- **RIGHT**
  
Rotates the robot 90 degrees to the right without changing its position.

- **REPORT**
  
Prints the robot's current position and direction.
Example:

```bash
Output: 0,0,NORTH
```

- **QUIT**

Exits the simulator.

## Future Enhancements
The simulator is designed to support multiple robots in future versions. Once this feature is implemented:

- Commands will include a `robot_id` to identify which robot should execute the command.
- Example of future commands:
  - `PLACE 2,4,4,SOUTH` to place a second robot at position (4,4) facing SOUTH.
  - `MOVE 2` to move the second robot forward.

## Example Interaction
```bash
$ ruby cli.rb
Welcome to the Toy Robot Simulator! Type 'QUIT' to exit.

> PLACE 0,0,NORTH
> MOVE
> REPORT
0,1,NORTH

> LEFT
> REPORT
0,1,WEST

> QUIT
Goodbye!
```

## Testing
The project includes a suite of tests written with RSpec.

To run the tests:

1. Install RSpec if not already installed:

```bash
$ gem install rspec
```

2. Run the tests:

```bash
$ rspec
```

## Notes
- Invalid commands (e.g., commands before the first PLACE or moves that cause the robot to fall off the table) are ignored.
- The default tabletop size is 5x5. This can be adjusted by modifying the Table class.

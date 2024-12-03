require 'robot'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  it "places the robot correctly" do
    robot.place(0, 0, "NORTH")
    expect(robot.report).to eq "0,0,NORTH"
  end

  it "ignores invalid directions" do
    robot.place(0, 0, "INVALID")
    expect(robot.report).to be_nil
  end

  it "moves the robot" do
    robot.place(0, 0, "NORTH")
    robot.move
    expect(robot.report).to eq "0,1,NORTH"
  end

  it "rotates the robot" do
    robot.place(0, 0, "NORTH")
    robot.turn_left
    expect(robot.report).to eq "0,0,WEST"

    robot.turn_right
    expect(robot.report).to eq "0,0,NORTH"
  end
end


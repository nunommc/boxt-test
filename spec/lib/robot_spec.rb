require "robot"

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe "#place" do
    it "places the robot and sets the direction" do
      robot.place("NORTH")
      expect(robot.placed?).to be true
      expect(robot.direction).to eq("NORTH")
    end
  end

  describe "#placed?" do
    context "when the robot is not placed" do
      it "returns false" do
        expect(robot.placed?).to be false
      end
    end

    context "when the robot is placed" do
      it "returns true" do
        robot.place("EAST")
        expect(robot.placed?).to be true
      end
    end
  end

  describe "#turn_left" do
    context "when the robot is placed" do
      it "rotates the robot to the left" do
        robot.place("NORTH")
        robot.turn_left
        expect(robot.direction).to eq("WEST")
      end

      it "handles full rotations" do
        robot.place("NORTH")
        4.times { robot.turn_left }
        expect(robot.direction).to eq("NORTH")
      end
    end

    context "when the robot is not placed" do
      it "does nothing" do
        expect { robot.turn_left }.not_to raise_error
        expect(robot.placed?).to be false
      end
    end
  end

  describe "#turn_right" do
    context "when the robot is placed" do
      it "rotates the robot to the right" do
        robot.place("NORTH")
        robot.turn_right
        expect(robot.direction).to eq("EAST")
      end

      it "handles full rotations" do
        robot.place("NORTH")
        4.times { robot.turn_right }
        expect(robot.direction).to eq("NORTH")
      end
    end

    context "when the robot is not placed" do
      it "does nothing" do
        expect { robot.turn_right }.not_to raise_error
        expect(robot.placed?).to be false
      end
    end
  end

  describe "DIRECTIONS constant" do
    it "contains the four cardinal directions" do
      expect(Robot::DIRECTIONS).to eq(%w[NORTH EAST SOUTH WEST])
    end
  end
end

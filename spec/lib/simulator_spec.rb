require 'simulator'

RSpec.describe Simulator do
  let(:table) { Table.new(width: 5, height: 5) }
  let(:simulator) { Simulator.new(table: table) }

  it "executes PLACE and REPORT commands" do
    simulator.execute("PLACE 0,0,NORTH")
    expect(simulator.execute("REPORT")).to eq "0,0,NORTH"
  end

  it "ignores invalid commands before PLACE" do
    simulator.execute("MOVE")
    expect(simulator.execute("REPORT")).to be_nil
  end

  it "prevents the robot from falling off the table" do
    simulator.execute("PLACE 0,0,SOUTH")
    simulator.execute("MOVE")
    expect(simulator.execute("REPORT")).to eq "0,0,SOUTH"
  end

  it "handles a series of commands" do
    simulator.execute("PLACE 1,2,EAST")
    simulator.execute("MOVE")
    simulator.execute("MOVE")
    simulator.execute("LEFT")
    simulator.execute("MOVE")
    expect(simulator.execute("REPORT")).to eq "3,3,NORTH"
  end
end


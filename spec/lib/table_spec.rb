require 'table'

RSpec.describe Table do
  let(:table) { Table.new(width: 5, height: 5) }

  it "validates positions within bounds" do
    expect(table.valid_position?(0, 0)).to be true
    expect(table.valid_position?(4, 4)).to be true
    expect(table.valid_position?(5, 5)).to be false
    expect(table.valid_position?(-1, -1)).to be false
  end
end


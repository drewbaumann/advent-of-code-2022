require "minitest/autorun"
require "minitest/spec"
require_relative "../supply_stacks"

class SupplyStacksTest < Minitest::Test
  describe "part_1_solution" do
    it "returns the solution for part 1" do
      supply_stacks =
        SupplyStacks.new(input_file: "spec/test_input.txt", model: SupplyStacks::CM_9000)
      assert_equal "CMZ", supply_stacks.top_crates
    end
  end

  describe "part_2_solution" do
    it "returns the solution for part 2" do
      supply_stacks =
        SupplyStacks.new(input_file: "spec/test_input.txt", model: SupplyStacks::CM_9001)
      assert_equal "MCD", supply_stacks.top_crates
    end
  end
end

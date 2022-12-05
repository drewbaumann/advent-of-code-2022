require "minitest/autorun"
require "minitest/spec"
require_relative "../rucksack_reorganization"

class RucksackReorganizationTest < Minitest::Test
  describe "part_1_solution" do
    it "returns the solution for part 1" do
      rucksack_reorganization = RucksackReorganization.new("spec/test_input.txt")
      assert_equal 157, rucksack_reorganization.part_1_solution
    end
  end

  describe "part_2_solution" do
    it "returns the solution for part 2" do
      rucksack_reorganization = RucksackReorganization.new("spec/test_input.txt")
      assert_equal 70, rucksack_reorganization.part_2_solution
    end
  end
end

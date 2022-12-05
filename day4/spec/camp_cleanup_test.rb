require "minitest/autorun"
require "minitest/spec"
require_relative "../camp_cleanup"

class CampCleanupTest < Minitest::Test
  describe "part_1_solution" do
    it "returns the solution for part 1" do
      camp_cleanup = CampCleanup.new("spec/test_input.txt")
      assert_equal 2, camp_cleanup.part_1_solution
    end
  end

  describe "part_2_solution" do
    it "returns the solution for part 2" do
      camp_cleanup = CampCleanup.new("spec/test_input.txt")
      assert_equal 4, camp_cleanup.part_2_solution
    end
  end
end

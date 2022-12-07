require "minitest/autorun"
require "minitest/spec"
require_relative "../tuning_trouble"

class TuningTroubleTest < Minitest::Test
  describe "#solution" do
    it "returns the solution for part 1" do
      tuning_trouble = TuningTrouble.new(input_file: "spec/test_input.txt", distinct_characters: 4)
      assert_equal 7, tuning_trouble.solution
    end

    it "returns the solution for part 2" do
      tuning_trouble =
        TuningTrouble.new(input_file: "input.txt", distinct_characters: 14)
      assert_equal 19, tuning_trouble.solution
    end
  end
end

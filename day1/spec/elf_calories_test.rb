# elf_calories.rb
require "minitest/autorun"
require "minitest/spec"
require_relative "../elf_calories"

class ElfCaloriesTest < Minitest::Test
  describe "#most_calories_for_an_elf" do
    it "returns the most calories for an elf" do
      elf_calories = ElfCalories.new("spec/test_input.txt")
      assert_equal 33, elf_calories.most_calories_for_an_elf
    end
  end

  describe "#summation_of_top_three_elf_calories" do
    it "returns the summation of the top three elf calories" do
      elf_calories = ElfCalories.new("spec/test_input.txt")
      assert_equal 87, elf_calories.summation_of_top_three_elf_calories
    end
  end
end

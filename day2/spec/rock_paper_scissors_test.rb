require "minitest/autorun"
require "minitest/spec"
require_relative "../rock_paper_scissors"

class RockPaperScissorsTest < Minitest::Test
  describe "Shape Strategy Guide" do
    describe "#player_score" do
      it "returns the player's score" do
        rock_paper_scissors =
          RockPaperScissors.new(puzzle_file_path: "spec/test_input.txt")
        assert 15, rock_paper_scissors.player_score
      end
    end
  end

  describe "Outcome Strategy Guide" do
    describe "#player_score" do
      it "returns the player's score" do
        rock_paper_scissors = RockPaperScissors.new(
          puzzle_file_path: "spec/test_input.txt",
          strategy_guide: RockPaperScissors::OUTCOME_STRATEGY_GUIDE
        )
        assert 12, rock_paper_scissors.player_score
      end
    end
  end
end

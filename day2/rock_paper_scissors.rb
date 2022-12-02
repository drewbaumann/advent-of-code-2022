class RockPaperScissors
  ROCK = "rock"
  PAPER = "paper"
  SCISSORS = "scissors"

  LOSS = "loss"
  DRAW = "draw"
  WIN = "win"

  SHAPE_POINTS = {
    ROCK => 1,
    PAPER => 2,
    SCISSORS => 3
  }

  OUTCOME_POINTS = {
    LOSS => 0,
    DRAW => 3,
    WIN => 6
  }

  SHAPE_STRATEGY_GUIDE = {
    player: {
      "Y" => PAPER,
      "X" => ROCK,
      "Z" => SCISSORS
    },
    opponent: {
      "A" => ROCK,
      "B" => PAPER,
      "C" => SCISSORS
    }
  }

  OUTCOME_STRATEGY_GUIDE = {
    "Y" => DRAW,
    "X" => LOSS,
    "Z" => WIN
  }

  def initialize(puzzle_file_path:, strategy_guide: nil)
    @puzzle_file_path = puzzle_file_path
    @players = {
      player: [],
      opponent: []
    }
    @strategy_guide = strategy_guide || SHAPE_STRATEGY_GUIDE
    parse_input
  end

  attr_accessor :players

  def player_score
    players[:player].sum
  end

  private

  attr_reader :strategy_guide

  def parse_input
    # Read the input_file and tally the points for the outcomes
    # of the player scores and shapes

    File.readlines(@puzzle_file_path).each do |line|
      line.chomp!

      opponent_shape_identifier, player_identifier = line.split(" ")

      opponent_shape = SHAPE_STRATEGY_GUIDE.dig(:opponent, opponent_shape_identifier)

      if strategy_guide == SHAPE_STRATEGY_GUIDE
        player_shape = SHAPE_STRATEGY_GUIDE.dig(:player, player_identifier)
        player_outcome =
          player_outcome(player_shape: player_shape, opponent_shape: opponent_shape)
      else
        player_outcome = OUTCOME_STRATEGY_GUIDE.dig(player_identifier)
        player_shape =
          player_shape(opponent_shape: opponent_shape, player_outcome: player_outcome)
      end

      opponent_outcome =
        opponent_outcome(player_outcome: player_outcome)

      player_points = [
        shape_points(shape: player_shape),
        outcome_points(outcome: player_outcome)
      ]

      opponent_points = [
        shape_points(shape: opponent_shape),
        outcome_points(outcome: opponent_outcome)
      ]

      players[:player] << player_points.sum
      players[:opponent] << opponent_points.sum
    end
  end

  def player_shape(opponent_shape:, player_outcome:)
    if opponent_shape == ROCK
      if player_outcome == WIN
        PAPER
      elsif player_outcome == LOSS
        SCISSORS
      else
        ROCK
      end
    elsif opponent_shape == PAPER
      if player_outcome == WIN
        SCISSORS
      elsif player_outcome == LOSS
        ROCK
      else
        PAPER
      end
    elsif opponent_shape == SCISSORS
      if player_outcome == WIN
        ROCK
      elsif player_outcome == LOSS
        PAPER
      else
        SCISSORS
      end
    end
  end

  def player_outcome(player_shape:, opponent_shape:)
    # Calculate the outcome of the round based on the shapes used by the players

    if player_shape == ROCK
      if opponent_shape == PAPER
        LOSS
      elsif opponent_shape == SCISSORS
        WIN
      else
        DRAW
      end
    elsif player_shape == PAPER
      if opponent_shape == ROCK
        WIN
      elsif opponent_shape == SCISSORS
        LOSS
      else
        DRAW
      end
    elsif player_shape == SCISSORS
      if opponent_shape == ROCK
        LOSS
      elsif opponent_shape == PAPER
        WIN
      else
        DRAW
      end
    end
  end

  def opponent_outcome(player_outcome:)
    case player_outcome
    when WIN
      LOSS
    when LOSS
      WIN
    else
      DRAW
    end
  end

  def outcome_points(outcome:)
    OUTCOME_POINTS.dig(outcome)
  end

  def shape_points(shape:)
    SHAPE_POINTS.dig(shape)
  end
end

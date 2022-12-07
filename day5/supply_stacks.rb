class SupplyStacks
  CM_9000 = "CrateMover 9000"
  CM_9001 = "CrateMover 9001"

  def initialize(input_file:, model:)
    @input_file = input_file
    @model = model
    parse_file
  end

  def top_crates
    # take the last element of each stack and join them together
    stacks.values.map(&:last).join
  end

  private

  attr_reader :input_file, :model, :stacks

  def parse_file
    temp_matrix = []

    @lines = File.readlines(@input_file).each do |line|
      # Add the stacks to a temp matrix until we hit a line that is not a stack
      if line.include?("[")
        temp_matrix << line.rstrip.chars.each_slice(4).map do |item|
          item.join.gsub(/\[|\]/, "").strip
        end

      # If the line starts with a number, we know we have the number of stacks
      elsif /^\d/.match?(line.lstrip)
        stack_count = line.strip.split(" ").map(&:to_i).max
        create_stacks(stack_count: stack_count, temp_stack_matrix: temp_matrix)

      # If the line starts with "move", we know we have a move command
      elsif line.match?("move")
        perform_move(instructions: line.strip)
        puts stacks.inspect
      end
    end
  end

  def create_stacks(stack_count:, temp_stack_matrix:)
    @stacks = {}

    stack_count.times do |i|
      current_stack = stacks[(i + 1).to_s] = []

      temp_stack_matrix.each do |temp_stack|
        if ![nil, ""].include?(temp_stack[i])
          current_stack.prepend(temp_stack[i])
        end
      end
    end
  end

  def perform_move(instructions:)
    # parse the instructions: format is "move #{quantity from the end of the stack} from #{stack number} to #{stack number}"
    quantity, from_stack, to_stack =
      instructions.match(/move (\d+) from (\d+) to (\d+)/).captures
    if model == CM_9000
      quantity.to_i.times do |i|
        @stacks[to_stack] << @stacks[from_stack].pop
      end
    else
      @stacks[to_stack] += @stacks[from_stack].pop(quantity.to_i)
    end
  end
end

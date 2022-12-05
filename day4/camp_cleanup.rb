class CampCleanup
  def initialize(input_file)
    @input_file = input_file
  end

  def part_1_solution
    overlap_count = 0

    lines.map do |line|
      pair_1, pair_2 = pairs(line)

      smallest_pair_size = [pair_1.size, pair_2.size].min

      if (pair_1.to_a & pair_2.to_a).size == smallest_pair_size
        overlap_count += 1
      end
    end

    overlap_count
  end

  def part_2_solution
    overlap_count = 0

    lines.map do |line|
      pair_1, pair_2 = pairs(line)

      if pair_1.to_a.intersect?(pair_2.to_a)
        overlap_count += 1
      end
    end

    overlap_count
  end

  private

  def lines
    @_lines ||= File.readlines(input_file).map(&:chomp)
  end

  def pairs(line)
    line.split(",").map { |range_bookends|
      first, last = range_bookends.split("-")
      (first.to_i..last.to_i)
    }
  end

  attr_reader :input_file
end

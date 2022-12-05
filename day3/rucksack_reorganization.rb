class RucksackReorganization
  PRIORITIES = {
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26,
    "A" => 27,
    "B" => 28,
    "C" => 29,
    "D" => 30,
    "E" => 31,
    "F" => 32,
    "G" => 33,
    "H" => 34,
    "I" => 35,
    "J" => 36,
    "K" => 37,
    "L" => 38,
    "M" => 39,
    "N" => 40,
    "O" => 41,
    "P" => 42,
    "Q" => 43,
    "R" => 44,
    "S" => 45,
    "T" => 46,
    "U" => 47,
    "V" => 48,
    "W" => 49,
    "X" => 50,
    "Y" => 51,
    "Z" => 52
  }

  def initialize(input_file)
    @input_file = input_file
  end

  def part_1_solution
    extra_items = []

    File.readlines(input_file).each do |line|
      line.chomp!
      items = line.chars
      items_amount = items.length
      compartment_1, compartment_2 =
        items[0..(items_amount / 2) - 1], items[(items_amount / 2)..]

      extra_item = compartment_1 & compartment_2
      extra_items += extra_item
    end

    extra_items.map { |item| PRIORITIES[item] }.sum
  end

  def part_2_solution
    badges = []
    File.readlines(input_file).map(&:chomp).each_slice(3) do |group|
      group.map!(&:chars)

      badge = group[0] & group[1] & group[2]
      badges += badge
    end

    badges.map { |badge| PRIORITIES[badge] }.sum
  end

  private

  attr_reader :input_file
end

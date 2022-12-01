class ElfCalories
  def initialize(input_file_path)
    @input_file_path = input_file_path
    @elves = {}
    parse_input
  end

  attr_accessor :elves

  def most_calories_for_an_elf
    elves.values.max
  end

  def summation_of_top_three_elf_calories
    elves.values.sort.reverse[0..2].sum
  end

  private

  def parse_input
    # Read the input file and parse it into a hash with a key named "elf_#{index}" that contains an integer of the elf's calories
    counter = 0

    File.readlines(@input_file_path).each do |line|
      line = line.chomp

      elves["elf_#{counter}"] ||= 0

      if line.empty?
        counter += 1
        next
      end

      elves["elf_#{counter}"] += line.to_i
    end
  end
end

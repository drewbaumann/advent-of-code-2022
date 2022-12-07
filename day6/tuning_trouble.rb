class TuningTrouble
  def initialize(input_file:, distinct_characters:)
    @input_file = input_file
    @distinct_characters = distinct_characters
  end

  def solution
    datastream_buffer = File.read(input_file).chars

    datastream_buffer.each_with_index do |char, index|
      shift_index_position = (distinct_characters - 1)
      if index < shift_index_position
        next
      end

      selection = datastream_buffer[(index - shift_index_position)..index]

      if selection.uniq.count == distinct_characters
        return index + 1
      end
    end
  end

  private

  attr_reader :distinct_characters, :input_file
end

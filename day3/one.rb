class Number
  def initialize(number_string, x, y)
    @number_string = number_string
    @min_x = x
    @max_x = x + number_string.length - 1
    @y = y
  end

  def id
    @number_string + @min_x.to_s + @max_x.to_s + @y.to_s
  end

  def number
    @number_string.to_i
  end

  def coordinates_around
    coords = []
    ((@min_x - 1)..(@max_x + 1)).each do |x|
      coords << [x, @y - 1]
      coords << [x, @y]
      coords << [x, @y + 1]
    end
    coords
  end
end

class Board
  attr_reader :numbers, :intersecting_numbers

  def initialize
    @numbers = []
    @intersecting_numbers = []
    @rows = []
  end

  def add_row(row)
    @rows << row
    current_num = ''
    row.each_char.with_index do |char, index|
      if char =~ /\d/
        current_num << char
        @numbers << Number.new(current_num, index - current_num.length + 1, @rows.length - 1) if index == row.length - 1
      elsif current_num != ''
        @numbers << Number.new(current_num, index - current_num.length, @rows.length - 1)
        current_num = ''
      end
    end
  end

  def process
    @numbers.each do |number|
      number.coordinates_around.each do |coords|
        char = begin
          @rows[coords[1]][coords[0]]
        rescue StandardError
          nil
        end

        next if char.nil?
        next if char =~ /\d/ || char == '.'
        next if @intersecting_numbers.map(&:id).include?(number.id)

        @intersecting_numbers << number
      end
    end
  end
end

board = Board.new
STDIN.read.split("\n").each do |row|
  board.add_row(row)
end

board.process

puts board.intersecting_numbers.map(&:number).inject(:+)

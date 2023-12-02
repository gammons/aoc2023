MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

sum = 0

STDIN.read.split("\n").each do |game|
  game_id = game.split(':').first.split.last.to_i
  sets = game.split(':').last.split(';')

  playable_game = sets.all? do |inputs|
    inputs.split(',').all? do |input|
      num, color = input.split
      num = num.to_i

      case color
      when 'red'
        num <= MAX_RED
      when 'green'
        num <= MAX_GREEN
      when 'blue'
        num <= MAX_BLUE
      end
    end
  end

  sum += game_id if playable_game
end

puts sum

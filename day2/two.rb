sum = 0

STDIN.read.split("\n").each do |game|
  sets = game.split(':').last.split(';')

  fewest_reds = 0
  fewest_greens = 0
  fewest_blues = 0

  sets.each do |inputs|
    inputs.split(',').each do |input|
      num, color = input.split
      num = num.to_i

      case color
      when 'red'
        fewest_reds = num if num > fewest_reds
      when 'green'
        fewest_greens = num if num > fewest_greens
      when 'blue'
        fewest_blues = num if num > fewest_blues
      end
    end
  end

  sum += fewest_reds * fewest_greens * fewest_blues
end

puts sum

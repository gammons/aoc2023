total_score = 0
STDIN.read.split("\n").each do |card|
  card = card.split(':').last
  winning_numbers, inputs = card.split('|')
  winning_numbers = winning_numbers.split(' ').map(&:to_i)
  inputs = inputs.split(' ').map(&:to_i)

  winning_count = inputs.select { |i| winning_numbers.include?(i) }.count
  score = winning_count > 0 ? 2**(winning_count - 1) : 0
  # puts "Winning numbers: #{winning_numbers}"
  # puts "Inputs: #{inputs}"
  # puts "Wining count: #{winning_count}"
  # puts "Score: #{score}"
  total_score += score
end
puts total_score

total_score = 0
cards = []
STDIN.read.split("\n").each do |card|
  card_num, card = card.split(':')
  winning_numbers, inputs = card.split('|')
  winning_numbers = winning_numbers.split(' ').map(&:to_i)
  inputs = inputs.split(' ').map(&:to_i)
  winning_count = inputs.select { |i| winning_numbers.include?(i) }.count

  cards << {
    count: 1,
    winning_numbers:,
    inputs:,
    winning_count:
  }
end

cards.each_with_index do |_card, i|
  cards[i][:winning_count].times do |n|
    cards[i + n + 1][:count] += cards[i][:count]
  end
end

puts "Sum : #{cards.sum { |c| c[:count] }}"

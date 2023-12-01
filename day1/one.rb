sum = 0
STDIN.read.split("\n").each do |line|
  numbers = line.split("").select { |c| c =~ /\d/ }.join.to_i
  first, last = numbers.to_s[0], numbers.to_s[-1]
  sum += "#{first}#{last}".to_i
end
puts sum

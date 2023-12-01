sum = 0
STDIN.read.split("\n").each do |line|
  line.gsub!(/one/, "o1e")
  line.gsub!(/two/, "t2o")
  line.gsub!(/three/, "t3e")
  line.gsub!(/four/, "f4r")
  line.gsub!(/five/, "f5e")
  line.gsub!(/six/, "s6x")
  line.gsub!(/seven/, "s7n")
  line.gsub!(/eight/, "e8t")
  line.gsub!(/nine/, "n9e")
  line.gsub!(/zero/, "z0o")

  numbers = line.split("").select { |c| c =~ /\d/ }.join.to_i
  first, last = numbers.to_s[0], numbers.to_s[-1]
  sum += "#{first}#{last}".to_i
end
puts sum

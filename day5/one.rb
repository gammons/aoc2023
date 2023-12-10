class Mapping
  def initialize
    @mappings = []
  end

  def add_mapping(destination_start, source_start, range_length)
    @mappings << {
      source_range: (source_start..(source_start + range_length)),
      destination_dist: destination_start - source_start
    }
  end

  def destination_for(source)
    mapping = @mappings.find do |m|
      inc = m[:source_range].include?(source)
      inc
    end
    return source if mapping.nil?

    source + mapping[:destination_dist]
  end
end

lines = STDIN.read.split("\n")
seeds = lines[0].split(':').last.split.map(&:to_i)
mappings = [Mapping.new]

lines[3..(lines.length - 1)].each do |line|
  if line == ''
    mappings << Mapping.new
    next
  end
  next unless line.index('map').nil?

  ds, ss, rl = line.split.map(&:to_i)
  mappings.last.add_mapping(ds, ss, rl)
end

destinations = seeds.map do |seed|
  mappings.each do |mapping|
    seed = mapping.destination_for(seed)
  end
  seed
end

puts "Min destination: #{destinations.min}"

fibonacci =
Enumerator.new do |yielder, base: 1, number: 1|
  loop do
    yielder.yield number
   base, number = number, (base + number)
  end
end

puts "Comment the next line or else you'll be stuck on an infinite loop"
# fibonacci.select { |f| (f % 3).zero? }.first(10) # Infinite loop
puts "The line with the infinite loop is already commented, phew!"

fibonacci =
Enumerator.new do |yielder, base: 1, number: 1|
  loop do
    yielder.yield number
    base, number = number, (base + number)
  end
end.lazy
fibonacci.select { |f| (f % 3).zero? }.first(10)

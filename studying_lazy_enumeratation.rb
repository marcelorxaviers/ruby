fibonacci =
Enumerator.new do |yielder, base: 1, number: 1|
  loop do
    yielder.yield number
   base, number = number, (base + number)
  end
end
fibonacci.select { |f| (f % 3).zero? }.first(10) # Infinite loop


fibonacci =
Enumerator.new do |yielder, base: 1, number: 1|
  loop do
    yielder.yield number
    base, number = number, (base + number)
  end
end.lazy
fibonacci.select { |f| (f % 3).zero? }.first(10)

module Ras
  extend self
  def ra
    puts "'s al Ghul"
  end
end

class AlGhul
  include Ras
end

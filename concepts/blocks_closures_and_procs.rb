length = 101
puts '=' * length
puts 'DEFINITION: Ruby’s blocks are chunks of code attached to a method.'
puts 'DEFINITION: Procs and lambdas are nameless functions.'
puts 'DEFINITION: Procs and blocks returns are full returns. lambdas returns give scope back to the caller.'
puts 'DEFINITION: Lambdas also ensure the number of params passed to it.'
puts '=' * length
puts "\n"
puts 'Ways to transform a block into a proc:'
puts "\tampersand => def meth1(p1, p2, &block)"
puts "\tProc.new => Proc.new { \"a block\" }"
puts "\tlambdas => lambda { \"a block\" } or ->() { \"a block\" }"


puts "\n" * 5
puts '-' * length
puts 'BEGIN => Closure example'
puts '-' * length
class BlockExample

  CONST = 0
  @@a = 3

  def return_closure
    a = 1
    @a = 2
    lambda { [ CONST, a, @a, @@a, yield ] }
  end

  def change_values
    @a += 1
    @@a += 1
  end
end

eg = BlockExample.new
block = eg.return_closure { "original" } # It will yield this block

puts block.call # => [0, 1, 2, 3, "original"]

block = eg.return_closure { "after calling change_values" }
eg.change_values
puts block.call # => [0, 1, 3, 4, "original"]
puts '-' * length
puts 'END => Closure example'
puts '-' * length

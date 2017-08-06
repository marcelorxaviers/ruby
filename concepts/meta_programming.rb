separator = "-" * 100
puts """
  class Logger
    def self.add_logging(id_string)
      define_method(:log) do |msg|
        now = Time.now.strftime(\"%H:%M:%S\")
        STDERR.puts \"\#{now}-\#{id_string}: \#{self} (\#{msg})\"
      end
    end
  end
  
  class Song < Logger
    add_logging \"Tune\"
  end
  
  class Album < Logger
    add_logging \"CD\"
  end
  
  song = Song.new
  song.log(\"rock on\")

  The value now is a local variable, and msg is the parameter to the block. But id_string is the
  parameter to the enclosing add_logging method. It’s accessible inside the block because block
  definitions create closures, allowing the context in which the block is defined to be carried
  forward and used when the block is used. In this case, we’re taking a value from a classlevel
  method and using it in an instance method we’re defining.
"""
class Logger
  def self.add_logging(id_string)
    define_method(:log) do |msg|
      now = Time.now.strftime("%H:%M:%S")
      STDERR.puts "#{now}-#{id_string}: #{self} (#{msg})"
    end
  end
end

class Song < Logger
  add_logging "Tune"
end

class Album < Logger
  add_logging "CD"
end

song = Song.new
song.log("rock on")

puts separator
puts "press enter to continue..."
gets

puts """
A class can extend whatever expression that gives back a class like in the following:

class Person < Struct.new(:name, :address, :likes)
  def to_s
  \"\#{self.name} lives in \#{self.address} and likes \#{self.likes}\"
  end
end

marcelo = Person.new('Marcelo', 'Lisbon')
marcelor.likes = 'Ruby <3'
puts marcelo
"""

class Person < Struct.new(:name, :address, :likes)
  def to_s
  "#{self.name} lives in #{self.address} and likes #{self.likes}"
  end
end

marcelo = Person.new('Marcelo', 'Lisbon')
marcelo.likes = 'Ruby <3'
puts marcelo

puts separator
puts "press enter to continue..."
gets

puts """
Singleton Classes


some_class = Class.new do
  def self.class_method
    puts \"In class method\"
  end
  def instance_method
    puts \"In instance method\"
  end
end

some_class = Class.new(String) do
  def vowel_movement
    tr 'aeiou', '*'
  end
end

def MyStruct(*keys)
  Class.new do
    attr_accessor *keys
      def initialize(hash)
        hash.each do |key, value|
        instance_variable_set(\"@\#{key}\", value)
      end
    end
  end
end
"""

puts separator
puts "press enter to continue..."
gets

puts """
EVAL => instance_eval and class_eval


\"cat\".instance_eval do
  puts \"Upper case = \#{upcase}\"
  puts \"Length is \#{self.length}\"
end

Eval with String is slow, calling eval effectively compiles the code in the string before executing it.
But, even worse, eval can be dangerous. If there’s any chance that external data—stuff that
comes from outside your application—can wind up inside the parameter to eval, then you
have a security hole, because that external data may end up containing arbitrary code that
your application will blindly execute.


class_eval sets things up as if you
were in the body of a class definition, so method definitions will define instance methods:

class MyClass
end

MyClass.class_eval do
  def instance_method
    puts \"In an instance method\"
  end
end

obj = MyClass.new
obj.instance_method

In contrast, calling instance_eval on a class acts as if you were working inside the singleton
class of self. Therefore, any methods you define will become class methods.

class MyClass
end

MyClass.instance_eval do
  def class_method
    puts \"In a class method\"
  end
end

MyClass.class_method


instance_exec accepts only blocks and has the ability to work with params

@animal = \"cat\"
\"dog\".instance_exec(@animal) do |other|
puts \"\#{other} and \#{self}\"
end
"""

puts separator
puts "press enter to continue..."
gets

puts """
Hook Methods


Method-related hooks
  method_added, method_missing, method_removed, method_undefined, singleton_method_added,
  singleton_method_removed, singleton_method_undefined

Class and module-related hooks
  append_features, const_missing, extend_object, extended, included, inherited, initialize_clone, initialize_copy,
  initialize_dup

Object marshaling hooks
  marshal_dump, marshal_load

Coercion hooks
  coerce, induced_from, to_xxx


Example: inherited

class Shipping # Base class
  @children = [] # this variable is in the class, not instances
  
  def self.inherited(child)
    @children << child
  end

  def self.shipping_options(weight, international)
    @children.select {|child| child.can_ship(weight, international)}
  end

end

Press enter to continue...

"""
gets
puts """
class MediaMail < Shipping

  def self.can_ship(weight, international)
    !international
  end

end

class FlatRatePriorityEnvelope < Shipping

  def self.can_ship(weight, international)
    weight < 64 && !international
  end

end

class InternationalFlatRateBox < Shipping

  def self.can_ship(weight, international)
    weight < 9*16 && international
  end

end

Press enter to continue...

"""
gets
puts """

puts \"Shipping 16oz domestic\"
puts Shipping.shipping_options(16, false)
puts \"\\nShipping 90oz domestic\"
puts Shipping.shipping_options(90, false)
puts \"\\nShipping 16oz international\"
puts Shipping.shipping_options(16, true)

Execution


"""

class Shipping # Base class
  @children = [] # this variable is in the class, not instances
  
  def self.inherited(child)
    @children << child
  end

  def self.shipping_options(weight, international)
    @children.select {|child| child.can_ship(weight, international)}
  end

end

class MediaMail < Shipping

  def self.can_ship(weight, international)
    !international
  end

end

class FlatRatePriorityEnvelope < Shipping

  def self.can_ship(weight, international)
    weight < 64 && !international
  end

end

class InternationalFlatRateBox < Shipping

  def self.can_ship(weight, international)
    weight < 9*16 && international
  end

end


puts "Shipping 16oz domestic"
puts Shipping.shipping_options(16, false)
puts "\nShipping 90oz domestic"
puts Shipping.shipping_options(90, false)
puts "\nShipping 16oz international"
puts Shipping.shipping_options(16, true)

puts separator
puts "press enter to continue..."
gets

puts """
Example: method_missing

def method_missing(name, *args, &block)
  puts \"Called \#{name} with \#{args.inspect} and \#{block}\"
end

blah(2) { \"some\" }

Execution


"""

def method_missing(name, *args, &block)
  puts "Called #{name} with #{args.inspect} and #{block}"
end

blah(2) { "some" }

puts separator
puts "press enter to continue..."
gets

puts """
"""
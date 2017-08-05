puts 'DEFINITION: self has the object in the context:'
puts "\tso, when we do def self.method... we are creating a singleton_method inside the class Object"
puts """
DEFINITION: include includes methods as instance methods:
    Actually, include makes an anon class as super class of the current class.
    The anon class fetches its methods inside the module. And that's why the
    changes in the module are dinamically reflected into all includers.
"""
puts """
DEFINITION: extend includes methods as class methods. It actually include methods to a specific
object, in the case of class Blah extend, the object is the instance of the class Class named Blah.
"""

length = 101
puts '-' * length
puts 'BEGIN => singleton method'
puts '-' * length

  animal = "cat"
  def animal.speak
    puts "The #{self} says miaow"
  end

  animal.speak
  puts animal.upcase
  puts animal.class
  puts "animal.singleton_methods => #{animal.singleton_methods}"

puts '-' * length
puts 'END => singleton method'
puts '-' * length

gets

puts '-' * length
puts 'BEGIN => singleton class object'
puts '-' * length

  animal = "dog"
  def animal.speak
  puts "The #{self} says WOOF!"
  end
  singleton = class << animal
    def lie
      puts "The #{self} lies down"
    end
    self # << return singleton class object
  end

  animal.speak
  animal.lie
  puts "Singleton class object is #{singleton}"

  singleton = class << "cat"; self; end
  begin
    puts "\nI'll try to instatiate that singleton class then!"
    singleton.new
  rescue => e
    puts "\t#{e.inspect}"
  end

  puts """
    # defining attr_accessor for class variables
    class Test
      @var = 99
      class << self
        attr_accessor :var
      end
    end
  """
  
  puts """
    # Changing method visibility inherited from parent

    class Derived1 < Base
      public :a_method
    end
  
    # is effectively the same as this:
    class Derived1 < Base
      def a_method(*)
        super
      end
    
      public :a_method
    end
  """


puts '-' * length
puts 'END => singleton class object'
puts '-' * length

gets

puts '-' * length
puts 'BEGIN => refinement'
puts '-' * length


puts """
  module PutsMothafucka
    refine Object do
    
      private
    
      def puts(*args)
        args.each do |arg|
          Kernel::puts(\"\#{arg}, Mothafucka\")
        end
      end
    end
  end

  using PutsMothafucka
  
  puts 'How you doing'
"""

module PutsMothafucka
  refine Object do
  
    private
  
    def puts(*args)
      args.each do |arg|
        Kernel::puts("#{arg}, Mothafucka")
      end
    end
  end
end

using PutsMothafucka

puts 'How you doing'

Kernel::puts '-' * length
Kernel::puts 'END => refinement'
Kernel::puts '-' * length

class Person
  def initialize(name)
    @name = name
  end

  private
  
  def say_hi
    return "Hello"
  end
end

class Developer < Person
  def initialize(name, position)
    super(name)
    @position = position
    defined?(@@count) ? @@count += 1 : @@count = 1
  end

  attr_accessor :position

  def self.count
    @@count
  end

  def say_hi
    "#{super} #{@name}, Your position is: #{position}"
  end
end

ruby = Developer.new('Ziggs Ziggs', 'Ruby Developer')
python = Developer.new('Ziggs 2', 'Python Developer')
# pp z.say_hi
pp Developer.count
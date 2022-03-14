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
  @@count = 0

  def initialize(name, position)
    super(name)
    @position = position
  end

  attr_accessor :position

  def self.count
    @@count
  end

  def say_hi
    "#{super} #{@name}, Your position is: #{position}"
  end
end

z = Developer.new('Ziggs Ziggs', 'Ruby Developer')
p = Developer.new('Ziggs 2', 'Python Developer')
# pp z.say_hi
# pp Developer.count
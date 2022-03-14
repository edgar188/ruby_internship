@name = 'Ziggs'

def say_hi
  pp "Hi #{@name}!"
end

# say_hi()

# fruits = {
#   apple: :green,
#   lemon: :yellow
# }

fruits = Hash.new(:def)
fruits[:apple] = :green
fruits = fruits.merge(
  waterlemon: :green_black
)

# pp fruits

array = Array.new(5, :def)
# pp array[1]

# p array
# pp array
# puts array

arr = []
pp arr.any?

# dictionary = { 'cat' => 'feline animal', 'dog' => 'canine animal' }
dictionary = { cat: 'feline animal', dog: 'canine animal' }
pp dictionary[:cat]
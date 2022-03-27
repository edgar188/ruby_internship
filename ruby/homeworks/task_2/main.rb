##############  Ex. 1 | Start
# Get any number between 1 and 12. Return the name of the respective month.

# def get_month(number)
#   months = {
#     1 => :January,
#     2 => :February,
#     3 => :March,
#     4 => :April,
#     5 => :May,
#     6 => :June,
#     7 => :July,
#     8 => :August,
#     9 => :September,
#     10 => :October,
#     11 => :November,
#     12 => :December
#   }

#   if number < 1
#     return 'Number should be greater than 1'
#   elsif number > 12
#     return 'Number should be less than 12'
#   end

#   months[number]
# end

# print 'Please insert a number: '
# number = gets.to_i
# pp get_month(number)
##############  Ex. 1 | End

##############  Ex. 2 | Start
# Get two numbers. Return array of powers 2 between that numbers. (without using Math.pow).

# def powers_of_two(num_1, num_2)
#   array_of_powers = []

#   for i in num_1..num_2
#     array_of_powers << i ** 2
#   end

#   array_of_powers
# end

# pp powers_of_two(1, 5)
##############  Ex. 2 | End

##############  Ex. 3 | Start
# Get a number. Return true if it contains 3 successive zeros, otherwise false.

# def three_zeros(number)
#   return true if number.to_s.include?('000')
#   false
# end

# print 'Please insert a number: '
# number = gets.to_i
# pp three_zeros(number)
##############  Ex. 3 | End

##############  Ex. 4 | Start
# Get a number. Reverse its first and last digits and return it.

# # Solution 1
# def reverse_first_and_last_digits_1(number)
#   number = number.to_s
#   temp = number[0]
#   number[0] = number[-1]
#   number[-1] = temp
#   number
# end

# # Solution 2
# def reverse_first_and_last_digits_2(number)
#   last_digit = number % 10
#   digits = Math.log10(number).floor
#   first_digit = number / 10.pow(digits)
#   swapped_num = last_digit * 10.pow(digits) + number % 10.pow(digits) - last_digit + first_digit
# end

# print 'Please insert a number: '
# number = gets.to_i
# print 'Solution 1: '
# puts reverse_first_and_last_digits_1(number)
# print 'Solution 2: '
# puts reverse_first_and_last_digits_2(number)
##############  Ex. 4 | End

##############  Ex. 5 | Start
# Get a number. Calculate product and sum of the digits of the number.

# print 'Please insert a number: '
# number = gets.to_i
# sum = 0
# product = 1

# number.digits.each do |digit|
#   sum += digit
#   product *= digit
# end

# pp sum
# pp product
##############  Ex. 5 | End

##############  Ex. 6 | Start
# Write a Ruby program to check whether every element is a 3 or a 5 in a given array of integers.

# def is_number_three_or_fife(array)
#   array.each do |number|
#     return false if number != 3 && number != 5
#   end

#   true
# end

# pp is_number_three_or_fife([7, 5, 9, 3, 5])
# pp is_number_three_or_fife([3, 5, 3, 3, 5])
##############  Ex. 6 | End

##############  Ex. 7 | Start
# Write a Ruby program to swap the first and last elements of a given array of integers, length will be at least 1. Return the modified array.

# def swap_first_and_last_elements(array)
#   temp = array[0]
#   array[0] = array[-1]
#   array[-1] = temp
#   array
# end

# pp swap_first_and_last_elements([3, 5, 3, 3, 5, 99])
##############  Ex. 7 | End

##############  Ex. 8 | Start
# Get a number. Return true if the number is more than 50 and less than 100 OR the number type is Float OR the number is equal to 0. Otherwise, return false.

# def check_number(number)
#   return true if number == 0 || number.class == Float || number.between?(50, 100)
#   false
# end

# print('Please insert a number: ')
# number = gets.to_i
# pp check_number(number)
##############  Ex. 8 | End
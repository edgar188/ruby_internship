##############  Ex. 1 | Start
#  Write Ruby program to get ruby version with patch number.

# pp "Ruby Version: #{RUBY_VERSION}"
# pp "Ruby Patch Level: #{RUBY_PATCHLEVEL}"
##############  Ex. 1 | End

##############  Ex. 2 | Start
# Write a Ruby program to display the current date and time.

# pp Time.now.strftime("%m/%d/%Y %H:%M")
##############  Ex. 2 | End

##############  Ex. 3 | Start
# Write a program to print the following pattern series using loop.

# 5.times { |i| puts ('a' * (i+1)) }
##############  Ex. 3 | End

##############  Ex. 4 | Start
#  Write a Ruby program which accept the radius of a circle from the user and compute the parameter and area.

# print "Input the radius of the circle: "
# radius = gets.chomp
# parameter = 2 * Math::PI * radius.to_f  
# area = Math::PI * radius.to_f ** 2 
# pp "The perimeter is #{parameter}"
# pp "The area is #{area}"
##############  Ex. 4 | End


##############  Ex. 5 | Start
# Write a Ruby program which accept the user's first and last name and print them in reverse order with a space between them.

# print "Input your first name: "
# first_name = gets.chomp
# print "Input your last name: "
# last_name = gets.chomp
# pp "Hello #{last_name} #{first_name}"
##############  Ex. 5 | End

##############  Ex. 6 | Start
# Write a Ruby program to accept a filename from the user print the extension of that.

# print "File name: "
# file_name = gets.chomp
# pp File.basename(file_name, ".*")
# pp File.extname(file_name)
# pp File.expand_path(file_name)
##############  Ex. 6 | End


##############  Ex. 7 | Start
# Write a Ruby program to print the following 'here document'. Write a Ruby program to accept a filename from the user print the extension of that.

# text = File.readlines("test.txt") 
# puts text
# puts "-"*60
# new_text = text.to_s[/.+?(?=string -------->)/]
# puts new_text.to_s
##############  Ex. 7 | End

##############  Ex. 8 | Start
# Write a Ruby program to create a new string from a given string using the first three characters or whatever is there if the string is less than length 3. Return n copies of the string.

# print "Your word: "
# word = gets.chomp

# if word.length > 2 
#   new_word = word[...3]
#   pp new_word
# else 
#   pp word * word.length
# end
##############  Ex. 8 | End

##############  Ex. 9 | Start
# Write a Ruby program to test whether you are minor (Consider a child unless he or she is less than 18 years old.) or not.print "Your number: "

# print "Input your age: "
# age = gets.to_i

# if age < 18
#   pp "You are a minor"
# else
#   pp "You are not a minor"
# end
##############  Ex. 9 | End

##############  Ex. 10 | Start
# Write a Ruby program to compute the absolute difference between n and 33 and return double the absolute difference if n is over 33.

# print "Input your number: "
# number = gets.to_i
# pp (33 - number).abs
##############  Ex. 10 | End

##############  Ex. 11 | Start
# Write a Ruby program to check two integers and return true if one of them is 20 otherwise return their sum.

# def is_number_20(a, b)
#   if a == 20 || b == 20
#     pp true
#   else
#     pp a + b
#   end
# end

# is_number_20(20, 22)
# is_number_20(5, 22)
##############  Ex. 11 | End

##############  Ex. 12 | Start
# Write a Ruby program to find the greatest of three numbers.

# def max(a, b, c)
#   if b > a && b > c
#     pp "b = #{b} is greatest"
#   elsif c > a && c > b 
#     pp "c = #{c} is greatest"
#   else 
#     pp "a = #{a} is greatest"
#   end
# end

# max(2000, 22, 444)
##############  Ex. 12 | End

##############  Ex. 13 | Start
# Write a Ruby program to check whether a number is within 10 of 100 or 200.

# print("Input your number: ")
# number = gets.to_i 

# if number.between?(10, 100) || number == 200  
#   pp true
# else
#   pp false
# end
##############  Ex. 13 | End

##############  Ex. 14 | Start
# Write a Ruby program to print even numbers from 1 to 10.

# for i in 1..10 do
#   pp i if i % 2 == 0
# end
##############  Ex. 14 | End

##############  Ex. 15 | Start
# Write a Ruby program to check two non-negative integer values and return true if they have the same last digit.

# def same_last_digit(a, b)
#   if a % 10 == b % 10
#     pp true
#   else 
#     pp false
#   end
# end

# same_last_digit(347, 567)
# same_last_digit(345, 567)
##############  Ex. 15 | End

##############  Ex. 16 | Start
# Write a Ruby program to check three given integers and return their sum. However, If one of the values is the same as another of the values, it does not count towards the sum.

# def sum(a, b, c)
#   if a == b || a == c || b == c
#     pp "Same values"
#   else
#     pp a + b + c
#   end
# end

# sum(0,3,4)
# sum(1,2,2)
# sum(22,22,3)
# sum(3,22,3)
##############  Ex. 16 | End


##############  Ex. 17 | Start
# Write a Ruby program to test whether a year is leap year or not.

# require 'date'

# def is_leap(year)
#   if Date.leap?(year)
#     pp "#{year} is leap year"
#   elsif 
#     pp "#{year} is not leap year"
#   end
# end

# is_leap(2012)
# is_leap(1500)
# is_leap(1600)
# is_leap(2020)
##############  Ex. 17 | End

##############  Ex. 18 | Start
# Write a Ruby program to check two given integers and return the larger value. However, if the two values have the same remainder when divided by 5 then return the smaller value and if the two values are the same, return 0.

# def larger_number(a, b)
#   if a == b
#     pp 0
#   elsif a % 5 == b % 5 
#     pp a < b ? a : b
#   else 
#     pp a > b ? a : b
#   end
# end

# larger_number(2,2)
# larger_number(2,3)
# larger_number(5,10)
##############  Ex. 18 | End

##############  Ex. 19 | Start
# Write a Ruby program to check whether the sequence of numbers 10, 20, 30 appears anywhere in a given array of integers.

# def is_appears(array)
#   idx = 0
#   sequence = [10, 20, 30]
#   while idx < array.length - 2
#     if array[idx..idx+2] == sequence
#       return true
#     end
#     idx += 1
#   end
#   return false
# end

# pp is_appears([1, 2, 3, 4])
# pp is_appears([1, 2, 10, 20, 30, 45])
# pp is_appears([1, 2, 10, 20, 45, 30])
##############  Ex. 19 | End
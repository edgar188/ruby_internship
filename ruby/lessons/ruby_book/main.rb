###################### SIMPLE CLASS 
# class Dog 
#   def bark(i) 
#     i.times do 
#       puts 'Woof!'
#     end 
#   end 
# end 

# my_dog = Dog.new
# my_dog.bark(5)

###################### LOOPS
# 1.upto(5) {|number| puts number } 
# pp "-" * 60

# 10.downto(5) {|number| puts number } 
# pp "-" * 60
# 0.step(50, 10) {|number| puts number } 

###################### REGEX
# puts "this is a test".gsub('i', '') # global subsistute  'i' to ''
# pp "-" * 60

# x = "Test" 
# puts x.sub(/^../, 'Gago ')    # remove 2 chars from start and add new word
# pp "-" * 60

# x = "Test" 
# puts x.sub(/..$/, ' Gago')   # remove 2 chars from end and add new word
# pp "-" * 60

# "Test".scan(/../) { |x| puts x }
# pp "-" * 60

# "This is a test".scan(/[aeiou]/) { |x| puts x }
# pp "-" * 60

# puts "String has vowels" if "This is a test".match(/[aeiou]/)
# pp "-" * 60

###################### ARRAYS
# x = [1, "Test", 2]
# pp x << 3 # [1, "Test", 2, 3]
# # pp x
# ###
# puts "Words with lots of spaces".split(/\s+/).inspect  # ["Words", "with", "lots", "of", "spaces"]
# ###
# [1, "test"].each { |element| puts element.to_s + "X" } # 1X, testX
# ###
# [1, 2, 3, 4].collect { |element| element * 2 }  # [2, 4, 6, 8] 
# ###
# y = [] 
# puts "y is empty" if y.empty?  # y is empty
# ###
# pp x.include?(999)   # false 
# pp x.include?(3)     # true
# ###
# pp x.first    # 1
# pp x.last     # 3
# ###
# pp x.reverse  # [3, 2, "Test", 1]

###################### HASHES
# x = {a:100, c:300, b:200} # declaring Hash value
# puts "Hash x each_pair form : #{x.each_pair {|key| puts "#{key}"}}"
   
### Conditions, the Ternary Operator  ? and blocks
# # <condition> ? <result if condition is true> : <result if condition is false>
# age = 10 
# type = age < 18 ? "child" : "adult" 
# puts "You are a " + type  # You are a child 
# ###
# fruit = "apple" 
# case fruit 
#  when "orange" 
#  color = "orange" 
#  when "apple" 
#  color = "green" 
#  when "banana" 
#  color = "yellow" 
#  else 
# color = "unknown" 
#  end 
# pp color  # green
# ###
# x = 1
# while x < 10
# pp x  # 1, 2, 4, 8
# x = x * 2
# end
# ###
# def each_vowel(&code_block) 
#   %w{a e i o u}.each { |vowel| code_block.call(vowel) } 
#  end 
# each_vowel { |vowel| pp vowel }  # a, e, i, o, u
# ###
# print_parameter_to_screen = lambda { |x| puts x }   # 100
# print_parameter_to_screen.call(100) 

###################### TIME
# # hour --> A number representing the hour in 24-hour format (21 for 9 p.m., for example). 
# # min  --> The number of minutes past the hour. 
# # sec  --> The number of seconds past the minute. 
# # usec --> The number of microseconds past the second (there are 1,000,000 microseconds per second). 
# # day  --> The number of the day in the month. 
# # mday --> Synonym for the day method, considered to be “month” day. 
# # wday --> The number of the day in terms of the week (Sunday is 0, Saturday is 6). 
# # yday --> The number of the day in terms of the year. 
# # month--> The number of the month of the date (11 for November, for example). 
# # year --> The year associated with the date. 
# # zone --> Returns the name of the time zone associated with the time. 
# # utc? --> Returns true or false depending on if the time/date is in the UTC/GMT time zone or not. 
# # gmt? --> Synonym for the utc? method for those who prefer to use the term GMT. 

# pp Time.now

###################### RANGE
# ('A'..'Z').each { |letter| print letter }  # A - Z
# puts " "
# (1...10).to_a.each { |n| print n }  # convert to array and print 1 - 9
# puts " "

###################### MODULES
# module LengthConversions  
#   def self.kilometers_to_meters(kilometer)
#     kilometer * 1000
#   end
# end

# pp LengthConversions.kilometers_to_meters(3.6)

###################### NAMESPACES
# module Areas
#   class Square
#     def self.area(side)
#       side * side
#     end
#   end

#   class Circle
#     PI = 3.1415
#     def self.area(radius)
#       PI * radius * radius
#     end
#   end
# end

# pp Areas::Square.area(4)
# pp Areas::Circle.area(3)

###################### Mix-Ins
# class OlympicMedal

#   # <, <=, =>, <=>, .between?
#   include Comparable
  
#   MEDAL_VALUES = {"Gold" => 3, "Silver" => 2, "Bronze" => 1}
#   # MEDAL_VALUES = {"Gold": 3, "Silver": 2, "Bronze": 1}

#   attr_reader :type

#   def initialize(type, weight)
#     @type = type
#     @weight = weight
#   end

#   def <=>(other)
#     if MEDAL_VALUES[type] < MEDAL_VALUES[other.type]
#       -1
#     elsif MEDAL_VALUES[type] == MEDAL_VALUES[other.type]
#       0
#     else 
#       1
#     end
#   end
# end

# bronze = OlympicMedal.new("Bronze", 5)
# silver = OlympicMedal.new("Silver", 10)
# gold = OlympicMedal.new("Gold", 3)

# pp bronze > silver  # false
# pp bronze < silver  # true
# pp gold >= silver   # true
# pp gold <= bronze   # false
# pp silver > bronze  # true
# pp silver != bronze # true
# pp silver == gold   # false
# pp bronze == bronze # true

# pp silver.between?(bronze, gold) # true

# pp 5 <=> 3  # 1
# pp 5 <=> 5  # 0
# pp 3 <=> 5  # -1

###################### STRUCT 
# class PersonClass 
#   attr_accessor :name, :gender, :age 
#   def initialize(name, gender, age) 
#     @name = name 
#     @gender = gender 
#     @age = age 
#   end 
# end 

# gago = PersonClass.new("Gago", "male", 25) 
# pp gago 

# #  this codes are the same

# PersonStruct = Struct.new(:name, :gender, :age) 
# hamo = PersonStruct.new("Hamo", "male", 50)
# pp hamo 

###################### ERRORS
# begin 
#   puts 10 / 0 
# rescue 
#   puts "You caused an error!" 
# end 

# def generate_random_number_except_13 
#   x = rand(50) 
#   throw :finish if x == 13 
#   p x
# end 
# catch(:finish) do 
#   50.times { generate_random_number_except_13 } 
#   puts "Generated 50 random numbers without generating 13!" 
# end 

###################### BENCHMARK
# require 'benchmark'
# puts Benchmark.measure { 10_000_000.times { print "|" } }
# 1) CPU time 
# 2) system CPU time
# 3) total CPU
# 4) and “real” time taken

###################### PROFILING
# require 'profile'
# class Calculator
#   def self.count_to_large_number
#     x = 0
#     100000.times { x += 1 }
#   end
  
#   def self.count_to_small_number
#     x = 0
#     1000.times { x += 1 }
#   end
# end

# p Calculator.count_to_large_number
# p Calculator.count_to_small_number

###################### FILES
# r  --> Read-only. The file pointer is placed at the start of the file.
# r+ --> Both reading and writing are allowed. The file pointer is placed at the start of the file.
# w  --> Write-only. A new file is created (or an old one overwritten as if new).
# w+ --> Both reading and writing are allowed, but File.new creates a new file from scratch (oroverwrites an old one as if new).
# a  --> Write (in append mode). The file pointer is placed at the end of the file and writes will make the file longer.
# a+ --> Both reading and writing are allowed (in append mode). The file pointer is placed at the end of the file and writes will make the file longer.
# b  --> Binary file mode. You can use it in conjunction with any of the other modes listed.

# Using a code block is a clean way to open a single file
# File.open("text.txt") do |f|
#   puts f.gets
# end

# File.open("text.txt").each { |line| puts line }

## Get position
# f = File.open("text.txt")
# puts f.pos
# puts f.gets
# puts f.pos

## Replace data in my file or create new file
# File.open("new_file.txt", "w") do |f|
#   f.puts "This is a test"
# end

## Rename file
# File.rename("new_file.txt", "renamed_file.txt")

## Remove file
# File.delete("file1.txt")

## Get file path
# puts File.expand_path("text.txt")

## If file exists 
# puts "It exists!" if File.exist?("text.txt")

## Get file size 
# print File.size("text.txt"), " Bytes\n"

###################### DIRECTORIES
# puts Dir.pwd

###################### DATABASAES

## CSV
# require 'csv'
# CSV.open('text.txt').each do |person|
#   p person
# end

# people = CSV.read('text.txt') # Generate to array
# laura = people.find { |person| person[0] =~ /Laura/ } # Find by name
# p laura   # Laura's info

# young_people = people.find_all do |p|
#   p[3].to_i.between?(20, 40)
# end
# p young_people

## PSTORE
# require 'pstore'
# class Person
#   attr_accessor :name, :age
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# fred = Person.new("Fred Bloggs", 45)
# laura = Person.new("Laura Smith", 23)

# store = PStore.new("storagefile") # Create new storage file
# store.transaction do
#   # store[:people] ||= Array.new # Save old data
#   store[:people] = Array.new   # Rewrite data
#   store[:people] << fred
#   store[:people] << laura
# end
# pp store

## YAML
# require 'yaml'
# class Person
#   attr_accessor :name, :age
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# fred = Person.new("Fred Bloggs", 45)
# laura = Person.new("Laura Smith", 23)

# test_data = [ fred, laura ]
# puts test_data.to_yaml


## SQLite
# require 'sqlite3'
# $db = SQLite3::Database.new("dbfile") # Create new db
# $db.results_as_hash = true            # Return data as hash

# ## Quit from db
# def disconnect_and_quit
#   $db.close
#   puts "Bye!"
#   exit
# end

# ## Create new table
# def create_table
#   puts "Creating people table"
#   $db.execute %q{
#   CREATE TABLE people (
#   id integer primary key,
#   name varchar(50),
#   job varchar(50),
#   gender varchar(6),
#   age integer)
#   }
# end

# ## Add new item
# def add_person
#   puts "Enter name:"
#   name = gets.chomp
#   puts "Enter job:"
#   job = gets.chomp
#   puts "Enter gender:"
#   gender = gets.chomp
#   puts "Enter age:"
#   age = gets.chomp
#   $db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)", 
#   name, job, gender, age)
# end

# ## Find by name or id
# def find_person
#   puts "Enter name or ID of person to find:"
#   id = gets.chomp
#   person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?", id, id.to_i).first
  
#   unless person
#     puts "No result found"
#     return
#   end

#   puts %Q{Name: #{person['name']}
#   Job: #{person['job']}
#   Gender: #{person['gender']}
#   Age: #{person['age']}}
# end

# ## Running
# # create_table() # If not created db open
# loop do
#   puts %q{Please select an option:
  
#   1. Add a person
#   2. Look for a person
#   3. Quit}

#   case gets.chomp
#     when '1'
#       add_person
#     when '2'
#       find_person
#     when '3'
#       disconnect_and_quit
#   end
# end

## MYSQL
# require "mysql2"

# db = {host:"127.0.0.1",
#       username: "u_name",
#       password: "password",
#       database: "db"
#     }

# connect = Mysql2::Client.new(db)
# result = connect.query("SELECT * FROM Users")
# result.each {  |x| puts x }

###################### RUBY_PLATFORM
# if RUBY_PLATFORM =~ /win32/
#   puts "We're in Windows!"
#   elsif RUBY_PLATFORM =~ /linux/
#     puts "We're in Linux!"
#   elsif RUBY_PLATFORM =~ /darwin/
#     puts "We're in Mac OS X!"
#   elsif RUBY_PLATFORM =~ /freebsd/
#     puts "We're in FreeBSD!"
#   else
#     puts "We're running under an unknown operating system."
# end

###################### WEBrick 
# require 'webrick'
# class MyNormalClass
#   def MyNormalClass.add(a, b)
#     a.to_i + b.to_i
#   end

#   def MyNormalClass.subtract(a,b)
#     a.to_i - b.to_i
#   end
# end

# class MyServlet < WEBrick::HTTPServlet::AbstractServlet
#   def do_GET(request, response)
#     if request.query['a'] && request.query['b']
#       a = request.query['a']
#       b = request.query['b']
#       response.status = 200
#       response.content_type = 'text/plain'
#       result = nil

#       case request.path
#         when '/add'
#           result = MyNormalClass.add(a,b)
#         when '/subtract'
#           result = MyNormalClass.subtract(a,b)
#         else
#           result = "No such method"
#       end

#       response.body = result.to_s + "\n"
#     else
#       response.status = 400
#       response.body = "You did not provide the correct parameters"
#     end
#   end
# end

###################### THREADS
## Example. 1
# threads = []
# 5.times do
#   thread = Thread.new do
#     5.times { |i| (print i, ","); $stdout.flush; sleep rand(2) }
#   end
#   threads << thread
# end

# threads.each { |thread| thread.join }

# ## Example. 2
# threads.each do |thread|
#   puts "Thread #{thread.object_id} didn't finish in 1s" unless thread.join(1)
# end

###################### FIBER
# sg = Fiber.new do
#   s = 0 
#   loop do
#     square = s * s
#     Fiber.yield square
#     s += 1
#   end
# end

# 10.times { puts sg.resume }

###################### INTERNET
# require 'net/http'

## Net::HTTP.start("www.apress.com", use_ssl: true) do |http|
#   Net::HTTP.start("http://127.0.0.1:5500/index.html", use_ssl: true) do |http|
#   req = Net::HTTP::Get.new('/sitemap.xml')
#   body = http.request(req).body
#   puts body.force_encoding("UTF-8")
# end

# require 'open-uri'
# f = open('http://127.0.0.1:5500/index.html')
# puts f.readlines.join

############# E-MAIL
### Receiving Mail with POP3
# require 'net/pop'

# mail_server = Net::POP3.new('mail.mailservernamehere.com')

# begin
#   mail_server.start('username','password')
# if mail_server.mails.empty?
#   puts "No mails"
# else
#   puts "#{mail_server.mails.length} mails waiting"
# end

# rescue
#   puts "Mail error"
# end

### Sending Mail with SMTP
# require 'net/smtp'

# message = <<MESSAGE_END
# From: Private Person <me@privacy.net>
# To: Author of Beginning Ruby <test@rubyinside.com>
# Subject: SMTP e-mail test
# This is a test e-mail message.
# MESSAGE_END

# Net::SMTP.start('localhost') do |smtp|
#   smtp.send_message message, 'me@privacy.net', 'test@rubyinside.com'
# end 

### Sending Mail with ActionMailer
# require 'action_mailer'

# class Emailer < ActionMailer::Base
#   def test_email(email_address, email_body)
#     mail(to: email_address, from: 'me@privacy.net', subject: 'test', body: email_body)
#   end
# end

# Emailer.test_email('me@privacy.net', 'This is a test e-mail!').deliver_now


############# FTP (File Transfer Protocol)
# require 'open-uri'

# output = File.new('1.8.2-patch1.gz', 'wb')
# open('ftp://ftp.ruby-lang.org/pub/ruby/1.8/1.8.2-patch1.gz') do |f|
#   output.print f.read
# end
# output.close

###################### NETWORKING AND SOCKETS 
# gem install net-ping
# require 'net/ping'

# if Net::Ping::TCP.new('www.google.com', 80).ping
#   puts "Pong!"
# else
#   puts "No response"
# end

# require 'resolv'
# puts Resolv.getaddress("www.google.com") # 209.85.229.99

# require 'socket'

# host = 'localhost'
# port = 1234
# s = UDPSocket.new
# s.bind(nil, port)
# s.send("1", 0, host, port)

# 5.times do
#   text, sender = s.recvfrom(16)
#   remote_host = sender[3]
#   puts "#{remote_host} sent #{text}"
#   response = (text.to_i * 2).to_s
#   puts "We will respond with #{response}"
#   s.send(response, 0, host, port)
# end

### GSERVER
# gem install gserver
# require 'gserver'

# class HelloServer < GServer
#   def serve(io)
#     io.puts("Say something to me:")
#     line = io.gets
#     io.puts("You said '#{line.chomp}'")
#   end
# end

# server = HelloServer.new(1234, '127.0.0.1', 4)
# server.start
# server.join


###################### USEFUL RUBY LIBRARIES
############# ABBREV
## The abbrev library offers just a single method that calculates a set of unique abbreviations for each of a
## supplied group of strings.

# require 'abbrev'

# abbrevs = %w{Peter Paul Patricia Petal Pauline}.abbrev
# puts "Please enter your name:"
# name = gets.chomp

# if a = abbrevs.find { |a, n| a.downcase == name.downcase }
#   puts "Did you mean #{a.join(' or ')}?"
#   name = gets.chomp
# end

############# BASE64
## Base64 is a way to encode 8-bit binary data into a format that can be represented in seven bits. It does this by
## using only the characters A–Z, a–z, 0–9, +, and / to represent data (= is also used to pad data).

# require 'base64'
# require 'zlib'

# ## Encode and decode with base 64
# a = Base64.encode64('testing')
# puts a
# puts Base64.decode64(a)

# ## Compress data
# module Base64
#   def Base64.new_encode64(data)
#     encode64(Zlib::Deflate.deflate(data))
#   end
#   def Base64.new_decode64(data)
#     Zlib::Inflate.inflate(decode64(data))
#   end
# end

# test_data = 'this is a test' * 100

# data = Base64.encode64(test_data)
# puts "The uncompressed data is #{data.length} bytes long in Base64"

# data = Base64.new_encode64(test_data)
# puts "The compressed data is #{data.length} bytes long in Base64"

############# BENCHMARK
## The Benchmark module can be used to measure the time it takes to execute blocks of Ruby code. This can be
## useful to find which techniques are more efficient than others or to find slow points in your code.

# require 'benchmark'

# TIMES = 10000000
# Benchmark.bm do |b|
#   b.report("times") { TIMES.times { rand } }
#   b.report("upto") { 1.upto(TIMES) { rand } }
#   b.report("loop") {
#     i = 0
#     loop do
#       rand
#       i += 1
#       break if i == TIMES
#     end
#   }
# end

############# CGI
## CGI stands for Common Gateway Interface (although it is rarely called such), and is a system for running
## scripts from a web server that allows data to be passed to and from a script to produce a response for people
## accessing the script via a web browser.

# ## CGI with cookies
# require 'cgi'
# cgi = CGI.new
# cookie = cgi.cookies['count']

# # If there is no cookie, create a new one
# if cookie.empty?
#   count = 1
#   cookie = CGI::Cookie.new('count', count.to_s)
# else
#   # If there is a cookie, retrieve its value (note that cookie.value results
#   # in an Array)
#   count = cookie.value.first
#   # Now send back an increased amount for the cookie to store
#   cookie.value = (count.to_i + 1).to_s
# end

# cgi.out("cookie" => [cookie]) do
#   "<html><body>You have loaded this page #{count} times</body></html>"
# end

############# NET/HTTP
## HTTP stands for HyperText Transfer Protocol , and it’s the main protocol that makes the World Wide Web
## work, as it provides the mechanism by which web pages, files, and other media can be sent between Web
## servers and clients.
## Ruby provides basic support for HTTP via the net/http library. For example, it’s trivial to write a Ruby
## script that can download and print out the contents of a particular web page:

# require 'net/http' 

# url = URI.parse('http://www.rubyinside.com/') 
# response = Net::HTTP.start(url.host, url.port) do |http| 
#   http.get(url.path) 
# end 
# content = response.body 
# puts content

############# OPEN-URI
## open- uri is a library that wraps up the functionality of net/http, net/https, and net/ftp into a single package.
## Although it lacks some of the raw power of using the constituent libraries directly, open-uri makes it a lot
## easier to perform all the main functions.

# require 'open-uri'

# f = open('http://www.rubyinside.com/test.txt')
# puts "The document is #{f.size} bytes in length"

# f.each_line do |line|
#   puts line
# end

############# CHRONIC 
## The chroniclibrary makes it easy to convert dates and times written in almost any format into dates and
## times that Ruby recognizes correctly internally. It accepts strings such as 'tomorrow' and 'last tuesday
## 5pm' and turns them into valid Time objects.

# gem install chronic
# require 'chronic'
# puts Chronic.parse('last tuesday 5am')

############# DIGEST
##    A digest (more commonly known as a hash —though not the same type of hash as you’ve used to store data
## structures in Ruby)is a number or string of data that’s generated from another collection of data. Digests
## are significantly shorter than the original data and act as a form of checksum against the data. Digests are
## generated in such a way that it’s unlikely some other valid data would produce the same value, and that it’s
## difficult, if not impossible, to create valid data that would result in the same hash value.
##    A common use for hashes or digests is to store passwords in a database securely. Rather than store
## passwords in plain text where they could potentially be seen, you can create a digest of the password that
## you then compare against when you need to validate that the password is correct.

# require 'digest/sha1'

# puts Digest::SHA1.hexdigest('password')

############# English
## Throughout this book, you’ve often used special variables provided by Ruby for various purposes. For
## example, $! contains a string of the last error message raised in the program, $$ returns the process ID of the
## current program, and $/ lets you adjust the default line or record separator as used by the gets method. The
## English library allows you to access Ruby’s special variables using names expressed in English, rather than
## symbols. This makes the variables easier to remember.

############# ERB
## ERB is a templating library for Ruby that allows you to mix content and Ruby code. ERB is used as the main
## template system in Ruby on Rails when rendering RHTML views.
## Mixing Ruby code with other content results in a powerful templating system that’s a little reminiscent of PHP.

# require 'erb'

# array_of_stuff = %w{this is a test}

# template = '
# <% array_of_stuff.each_with_index do |item, index| %>
#   <p>Item <%= index %>: <%= item %></p>
# <% end %> '

# puts ERB.new(template).result(binding)


# template = <<EOF
# Let's try to do something crazy like access the filesystem..
# <%= `ls` %>
# EOF

# puts ERB.new(template, 3).result # Using safe level 3!

############# JSON
## The json library enables you to parse and create JSON (JavaScript Object Notation) from Ruby objects.
## JSON is a popular data interchange format that's commonly used in web-based APIs and within JavaScript
## applications nowadays. It's also possible to read JSON easily as it's notated entirely in plain text.

# require 'json'

# json_data = %{
#   {"name":"Maggie Robertson","age":37,"interests":["Golf","Bridge","Food"]}
# }

# ## Parse
# obj = JSON.load(json_data)
# puts obj.class
# puts obj.keys

# ## To json
# person = {
#   name: 'Maggie Robertson',
#   age: 37,
#   interests: ['Golf', 'Bridge', 'Food']
# }

# puts person.to_json

############# LOGGER 
## logger is a library developed by Hiroshi Nakamura and Gavin Sinclair that provides sophisticated logging
## features to Ruby applications. It supports automatic log rotation and multiple urgency levels, and can output
## to file, to standard output, or to standard error handles. Ruby on Rails uses logger as its main logging system,
## but you can use it from any Ruby application.

# require 'logger'

# logger = Logger.new(STDOUT)

# logger.debug "test"
# logger.info "test"
# logger.fatal "test"
# ##
# logger.info("myprog") { "test" }
# ##
# logger.add(Logger::FATAL) { "message here" }
# ##
# logger.close


############# NOKOGORI 
## The Nokogiri library is a fast HTML, XML, SAX, and Reader parser with XPath and CSS selector support.

# gem install nokogiri
# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'

# doc = Nokogiri::HTML(URI.open('https://www.apress.com/'))

# doc.css('p').each do |para|
#   puts para.inner_text
# end

############# PP
## pp is a “pretty printer” that provides better formatted output than a simple puts something.inspect or
## p command. It presents a cleaner look at data structures that are properly tabulated and spaced, unlike
## inspect or p ’s output.

# person1 = { :name => "Peter", :gender => :male }
# person2 = { :name => "Carleton", :gender => :male }
# people = [person1, person2, person1, person1, person1]
# puts people.inspect

# p "-"*60

# pp people

############# REDCARPET
## RedCarpet is a library that converts specially formatted text documents (in a formatting known as
## Markdown ) into valid HTML. The reasoning behind languages such as Markdown is that most users prefer
## to write their documents in a clean format, rather than be forced to use HTML tags everywhere and create
## documents that don’t read well as plain text. Markdown allows you to format text in a way that makes
## documents look good as plain text, but also allows the text to be converted quickly to HTML for use on
## the Web. This makes languages such as Markdown popular for use with posting and commenting systems
## online, and many blog authors even first write their posts in languages such as Markdown before converting
## them for publication.

# gem install redcarpet

# require 'redcarpet'

# markdown_text = %{
#   This is a title
#   ===============
  
#   Here is some _text_ that's formatted according to [Markdown][1]
#   *specifications*. And how about a quote?
  
#    [1]: http://daringfireball.net/projects/markdown/
  
#   > This section is a quote.. a block quote
#   > more accurately..
  
#   Lists are also possible:
  
#   * Item 1
#   * Item 2
#   * Item 3 }
  
  
# markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
# puts markdown.render(markdown_text)
  
############# STRINGSCANNER
## StringScanner is a library that lets you “walk through” a string, matching patterns one at a time, while only
## applying them to the remainder of the data that you haven’t yet matched. This is in stark contrast to the
## standard scan method that automatically returns all matching patterns immediately.

# require 'strscan'
# string = StringScanner.new "This is a test"
# puts string.scan(/\w+/)
# puts string.scan(/\s+/)
# puts string.scan(/\w+/)
# puts string.scan(/\s+/)
# puts string.rest

############# TEMPFILE
## Temporary files are intended for a single, one-time purpose. They’re ephemeral files that you use to
## store information temporarily, but that are quickly erased. In Chapter 9 , you looked at the creation of
## temporary files using several techniques, but tempfile provides an easy and standard way to create and
## manipulate them.

# require 'tempfile'

# Tempfile.open('myapp') do |f|
#   f.puts "Hello"
#   f.pos = 0
#   f.print "Gago"
#   f.flush
#   f.pos = 0
#   puts f.read
# end

############# URI
## You use the urilibrary to manage Uniform Resource Identifiers (URIs) , which are typically referred to as
## Uniform Resource Locators (URLs). A URL is an address such as http://www.rubyinside.com/ , ftp://
## your-ftp-site.com/directory/filename , oreven mailto:your-email- address@privacy.net . uri makes it
## easy to detect, create, parse, and manipulate these addresses.

# require 'uri'
# puts URI.extract('Check out https://www.apress.com/ or email mailto:me@apress.com').inspect

# url = 'https://www.x.com:1234/test/1.html?x=y&y=z#top'
# puts "port --> #{URI.parse(url).port}"
# puts "path --> #{URI.parse(url).path}"
# puts "query --> #{URI.parse(url).query}"
# puts "fragment --> #{URI.parse(url).fragment}"

############# ZLIB
## zlibis an open source data-compression library. It’s a significant standard in data compression, and you
## can manipulate zlib archives on almost every platform. Notably, zlib is often used to compress web pages
## between servers and web browsers, is used in the Linux kernel, and forms a key part of many operating
## system libraries.
## You can use zlib from Ruby as a mechanism to compress and uncompress data.

# require 'zlib'

# test_text = 'this is a test string' * 100
# puts "Original string is #{test_text.length} bytes long"
# compressed_text = Zlib::Deflate.deflate(test_text)
# puts "Compressed data is #{compressed_text.length} bytes long"
# uncompressed_text = Zlib::Inflate.inflate(compressed_text)
# puts "Uncompressed data is back to #{uncompressed_text.length} bytes in length"

# Zlib::GzipWriter.open('my_compressed_file.gz') do |gz|
#   gz.write 'This data will be compressed automatically!'
# end

# Zlib::GzipReader.open('my_compressed_file.gz') do |my_file|
#   puts my_file.read
# end

############# OPENSTRUCT
##    Struct gives you the luxury of being able to create simple classes without having to define a class in the
## long-handed way.
##    The OpenStruct class provided by the ostruct library makes it even easier. It allows you to create data
## objects without specifying the attributes, and allows you to create attributes on the fly:

# require 'ostruct' 
# person = OpenStruct.new 
# person.name = "Fred Bloggs" 
# person.age = 25 
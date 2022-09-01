# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc # proc object
# puts my_proc.class # Proc
# my_proc.call # calls the 'block but has no argument so no thing printed
# my_proc.call('cat') # calls w/ object so "this is a cat"

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." } #the 'lambda' key word syntax seems to make this a lambda
# my_second_lambda = -> (thing) { puts "This is a #{thing}." } # this funky syntax seems to make this a lambda
# puts my_lambda # still a proc object but some kind of lambda key word
# puts my_second_lambda # same as above
# puts my_lambda.class # still a Proc object
# #my_lambda.call('dog') # works as proc
# my_lambda.call # doesn't work!
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } #doesn't work! no Lambda class

# lambdas have a special declarative syntax and MUST be given the nmber of arguments they are
# declared with. Not flexible like normal procs

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# methods with yield need a block passed

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end # doesn't get the second argument
#block_method_2('turtle') { puts "This is a #{animal}."} # doesn't work

=begin
so procs are flexible, reusable sections of code that can be executed flexibly with or without arguments
  lenient arity
lambdas are inflexible procs that are strict about arguments
  strict arity
blocks are methods that yield to blocks and therefore require them or block_given? to function properly
otherwise, they are flexible like procs by default
  lenient arity
=end
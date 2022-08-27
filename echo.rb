# def echo_with_yield(str)
#   yield if block_given?
#   str
# end

# p echo_with_yield('hi') { puts 'hello' }

# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end                                                # clears screen first, then outputs "> hi there"
# method implementation
def test
  yield(1, 2)                           # passing 2 block arguments at block invocation time
end

# method invocation
test { |num| puts num }                 # expecting 1 parameter in block implementation
#=> 1

# method implementation
def test
  yield(1)                              # passing 1 block argument at block invocation time
end

# method invocation
test do |num1, num2|                    # expecting 2 parameters in block implementation
  puts "#{num1} #{num2}" # num 2 is nil here
end
#=> 1 (nil) becasue ruby knows num2 is a variable and not a method, but it isn't initialized

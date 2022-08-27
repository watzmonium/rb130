# method implementation
def increment(number)
  if block_given?
    yield(number + 1) # this assigns number + 1 to the block local variable num
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
# 5.times do |num|
#   puts num
# end

#times << accepts a block but not reqiured!

# 5.times works!

def times(num)
  counter = 0
  while counter < num do
    yield(counter) if block_given?
    counter += 1
  end
  num
end

p times(5) { |num| puts num}
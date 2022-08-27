def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total) # results is scoped into this block, so it can access it up above
end

p results # => [0, 1, 3, 6, 10, 15]
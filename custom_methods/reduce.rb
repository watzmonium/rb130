# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end

# => 6

def reduce(obj, sum = obj[0])
  1.upto(obj.size - 1) do |idx|
    sum = yield(sum, obj[idx]) if block_given?
  end
  sum
end

array = [1, 2, 3, 4, 5]

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
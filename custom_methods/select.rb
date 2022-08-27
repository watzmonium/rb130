array = [1, 2, 3, 4, 5]

# array.select { |num| num.odd? }       # => [1, 3, 5]
# array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def select(obj)
  obj.each_with_object([]) do |item, ary|
    if block_given?
      ary << item if yield(item)
    end
  end
end

p select(array) { |num| num + 1}
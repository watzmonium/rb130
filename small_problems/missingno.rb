def missing(ary)
  first = ary.first + 1
  last = ary.last
  (first...last).each_with_object([]) do |num, num_ary|
     num_ary << num unless ary.include?(num)
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
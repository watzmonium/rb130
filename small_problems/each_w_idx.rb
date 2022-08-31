def each_with_index(ary)
  len = ary.size
  idx = 0
  while idx < len do
    yield(ary[idx], idx)
    idx += 1
  end
  ary
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
def zip(ary1, ary2)
  zipped_arr = []
  ary1.each_with_index do |obj, idx|
    zipped_arr << [obj, ary2[idx]]
  end
  zipped_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
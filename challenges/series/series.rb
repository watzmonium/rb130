class Series
  attr_reader :series_num

  def initialize(num)
    @series_num = num
  end

  def slices(slice_sizes)
    len = series_num.size
    raise ArgumentError.new if slice_sizes > len

    series_arr = series_num.chars
    ary = []
    0.upto(len - (slice_sizes)) do |idx|
      ary << series_arr[idx..idx + (slice_sizes - 1)].map(&:to_i)
    end
    ary
  end
end
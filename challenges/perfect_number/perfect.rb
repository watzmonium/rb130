class PerfectNumber
  def self.classify(int)
    raise StandardError.new if int.negative?
    sum = perfect_sum(int)
    if sum > int
      'abundant'
    elsif sum < int
      'deficient'
    else
      'perfect'
    end
  end

  def self.perfect_sum(int)
    (1...int).each_with_object([]) do |num, ary|
      ary << num if int % num == 0
    end.sum
  end
end
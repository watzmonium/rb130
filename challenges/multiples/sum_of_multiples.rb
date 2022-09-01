class SumOfMultiples
  attr_reader :numbers

  def initialize(*args)
    @numbers = args
  end

  def to(number)
    (1...number).select do |num|
      any_mult?(num)
    end.sum
  end

  def self.to(number)
    SumOfMultiples.new(3, 5).to(number)
  end

  private

  def any_mult?(num)
    numbers.any? { |n| num % n == 0 }
  end
end

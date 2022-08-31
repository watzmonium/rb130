class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError if @sides.any? { |side| side <= 0 }
    raise ArgumentError if @sides.any? { |side| (@sides.sum - side) <= side }
  end

  def kind
    side_eq = sides.count(sides[0])
    side_eq2 = sides.count(sides[1])
    side_eq = side_eq > side_eq2 ? side_eq : side_eq2
    result = case side_eq
             when 1 then 'scalene'
             when 2 then 'isosceles'
             when 3 then 'equilateral'
             end
    result
  end

  private

  attr_reader :sides
end
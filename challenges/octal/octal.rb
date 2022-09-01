class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if number.match(/[^0-7]/)
    new_num = number.dup
    dec_place = number.size - 1
    sum = 0
    while dec_place >= 0 do
      sum += convert_oct(new_num, dec_place)
      dec_place -= 1
    end
    sum
  end

  private

  def convert_oct(num, place)
    place = place == -1 ? 0 : place
    char = num[0].to_i
    num.delete_prefix!(num[0])
    char * (8**place)
  end
end

p Octal.new('10').to_decimal